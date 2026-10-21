<?php
/**
 * unpack.php — one-step installer for the FULL package.
 *
 * The FULL zip ships the site as a handful of files (so it can also be pushed
 * to GitHub, which allows max 100 files per upload):
 *   pkg-code.zip  pkg-vendor.zip  pkg-assets.zip  pkg-uploads.zip   (all at the site root, no sub-folder,
 *   so "select all → drag" onto github.com uploads everything in one go)
 * Extract the FULL zip into public_html, then open  https://YOUR-DOMAIN/unpack.php
 * once. It extracts the packages in place, clears PHP OPcache and removes the
 * pkg-*.zip files. It never touches config.php, .env or the database.
 */
@set_time_limit(600);
@ignore_user_abort(true);
$ROOT = __DIR__;
$CLI  = PHP_SAPI === 'cli';

// Admin-only on an existing site; a fresh server (no includes/ yet) has nothing to protect.
if (!$CLI && is_file($ROOT . '/includes/functions.php')) {
    $allowed = true;
    try {
        require_once $ROOT . '/includes/functions.php';
        $u = function_exists('current_user') ? current_user() : null;
        $allowed = $u && in_array(($u['role'] ?? ''), ['admin', 'staff'], true);
    } catch (Throwable $e) { $allowed = true; }
    if (!$allowed) {
        http_response_code(403);
        header('Content-Type: text/plain; charset=utf-8');
        exit("Forbidden — log into the admin panel in this browser first, then reload this page.");
    }
}

$packages = glob($ROOT . '/pkg-*.zip') ?: [];
sort($packages);
$rows = []; $okAll = true; $total = 0;
$hasZip = class_exists('ZipArchive');

if ($hasZip) {
    foreach ($packages as $pk) {
        $za = new ZipArchive();
        $res = $za->open($pk);
        if ($res !== true) { $rows[] = [basename($pk), 0, 'cannot open (code ' . $res . ')']; $okAll = false; continue; }
        $n = $za->numFiles;
        $ok = $za->extractTo($ROOT);
        $za->close();
        $rows[] = [basename($pk), $n, $ok ? 'extracted' : 'FAILED — check folder permissions'];
        if ($ok) $total += $n; else $okAll = false;
    }
}

$checks = [
    'index.php' => is_file("$ROOT/index.php"),
    'admin.php' => is_file("$ROOT/admin.php"),
    'includes/functions.php' => is_file("$ROOT/includes/functions.php"),
    'vendor/autoload.php' => is_file("$ROOT/vendor/autoload.php"),
    'assets/css/style.css' => is_file("$ROOT/assets/css/style.css"),
    'uploads/products/' => is_dir("$ROOT/uploads/products"),
];
$coreOk = !array_filter($checks, fn($v) => !$v);
$checks['config.php (your own, untouched)'] = is_file("$ROOT/config.php");

$cleaned = false;
if ($hasZip && $okAll && $packages && $coreOk) {
    foreach ($packages as $pk) @unlink($pk);
    $cleaned = true;
}
$opcache = function_exists('opcache_reset') ? (@opcache_reset() ? 'cleared' : 'not cleared') : 'not enabled';

if ($CLI) {
    foreach ($rows as $r) printf("%-14s %5d files  %s\n", $r[0], $r[1], $r[2]);
    if (!$packages) echo "no pkg-*.zip found — nothing to unpack\n";
    if (!$hasZip) echo "ZipArchive missing — extract pkg-*.zip manually\n";
    foreach ($checks as $k => $v) echo ($v ? 'OK   ' : 'MISS ') . $k . "\n";
    echo "total extracted: $total | packages removed: " . ($cleaned ? 'yes' : 'no') . " | opcache: $opcache\n";
    exit($okAll && $hasZip ? 0 : 1);
}

header('Content-Type: text/html; charset=utf-8');
header('Cache-Control: no-store');
$h = fn($s) => htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8');
$missing = array_keys(array_filter($checks, fn($v) => !$v));
$state = !$hasZip ? 'manual' : (!$packages ? 'nothing' : (($okAll && $coreOk) ? 'done' : 'error'));
?><!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Maventech — Unpack</title>
<style>
body{margin:0;background:#0f172a;color:#e2e8f0;font:16px/1.5 system-ui,Segoe UI,sans-serif}
main{max-width:720px;margin:6vh auto;padding:32px;background:#111c33;border-radius:14px;box-shadow:0 20px 60px rgba(0,0,0,.4)}
h1{font-size:1.5rem;margin:0 0 8px}p{margin:8px 0}.pill{display:inline-block;padding:3px 12px;border-radius:999px;font-weight:700;font-size:.85rem}
.ok{background:#14532d;color:#bbf7d0}.bad{background:#7f1d1d;color:#fecaca}.warn{background:#78350f;color:#fde68a}
table{width:100%;border-collapse:collapse;margin:16px 0}td,th{padding:8px 10px;border-bottom:1px solid #1e293b;text-align:left}th{color:#94a3b8;font-weight:600;font-size:.85rem}
code{background:#1e293b;padding:2px 6px;border-radius:5px}a.btn{display:inline-block;margin:14px 10px 0 0;padding:10px 18px;border-radius:999px;background:#f59e0b;color:#111;font-weight:700;text-decoration:none}
ol{padding-left:20px}
</style></head><body><main data-testid="unpack-page">
<?php if ($state === 'done'): ?>
  <h1>Site unpacked <span class="pill ok" data-testid="unpack-status">DONE</span></h1>
  <p><?= $total ?> files were placed in <code><?= $h(basename($ROOT)) ?></code>. PHP cache: <?= $h($opcache) ?>. Package zips removed: <?= $cleaned ? 'yes' : 'no' ?>.</p>
  <p>Your database, <code>config.php</code> and <code>.env</code> were not touched.</p>
<?php elseif ($state === 'nothing'): ?>
  <h1>Nothing to unpack <span class="pill warn" data-testid="unpack-status">NO PACKAGES</span></h1>
  <p>No <code>pkg-*.zip</code> files found next to this file — the site is already unpacked. PHP cache: <?= $h($opcache) ?>.</p>
<?php elseif ($state === 'manual'): ?>
  <h1>Manual step needed <span class="pill warn" data-testid="unpack-status">NO ZIP SUPPORT</span></h1>
  <p>This server's PHP has no Zip extension. In cPanel → File Manager, right-click each <code>pkg-*.zip</code> (pkg-code, pkg-vendor, pkg-assets, pkg-uploads) → <b>Extract</b> → extract to <code>/public_html</code> (the folder that contains this unpack.php). Then delete the four pkg-*.zip files.</p>
<?php else: ?>
  <h1>Unpack problem <span class="pill bad" data-testid="unpack-status">CHECK</span></h1>
  <p>Some packages could not be extracted or key files are missing. Fix the folder permissions (755) and reload this page — it is safe to run again.</p>
<?php endif; ?>
<?php if ($rows): ?>
<table><tr><th>Package</th><th>Files</th><th>Result</th></tr>
<?php foreach ($rows as $r): ?><tr><td><?= $h($r[0]) ?></td><td><?= (int)$r[1] ?></td><td><?= $h($r[2]) ?></td></tr><?php endforeach; ?>
</table>
<?php endif; ?>
<table><tr><th>Check</th><th>Status</th></tr>
<?php foreach ($checks as $k => $v): ?><tr><td><?= $h($k) ?></td><td><span class="pill <?= $v ? 'ok' : 'bad' ?>"><?= $v ? 'present' : 'missing' ?></span></td></tr><?php endforeach; ?>
</table>
<?php if (!$checks['config.php (your own, untouched)']): ?>
<p><b>Fresh server:</b> extract <code>maventech-first-install-config.zip</code> (config.php + .env) here, put your database login in config.php and import <code>database.sql</code> once via phpMyAdmin.</p>
<?php endif; ?>
<a class="btn" href="/" data-testid="unpack-home-link">Open website</a><a class="btn" href="/admin.php" data-testid="unpack-admin-link">Open admin</a>
</main></body></html>

MAVENTECH — COMPLETE PACKAGE (code + vendor + ALL images + database seed) — 2026-10-21 build 9k
================================================================================================
This zip holds the WHOLE site as 8 plain files (no sub-folders), so you can select ALL of them
and drag them onto GitHub's "Add file → Upload files" page in one go (GitHub refuses more than
100 files per upload and the browser does not always pick up folders):

  unpack.php            ← open once in the browser after extracting on the server (see A/B)
  pkg-code.zip          all PHP / JS / CSS of the site (root, includes/, ajax/, cron/, tools/, lib/)
  pkg-vendor.zip        composer libraries (PDF, QR, HTML parser …)
  pkg-assets.zip        site images, icons, CSS/JS assets, install guides
  pkg-uploads.zip       every product / blog / guide / company / legal image
  database.sql          CLEAN starter database (products, categories, settings, pages, templates —
                        NO orders / customers / leads). Import-safe: no DROP / TRUNCATE / DELETE.
  README-COMPLETE.txt   this file
  README-UPDATE.txt     what changed in this release

NOT inside (on purpose): config.php (database login) and .env (API keys) — so this zip can never
change your database login or remove a key. A brand-new server gets them from
maventech-first-install-config.zip. The 5 MB install video and 3.5 MB Office installer are in
maventech-images.zip and already on your server.

A) UPDATING AN EXISTING LIVE SITE — NO DATA LOSS
   1. (Optional) Admin → Settings → Database Backup — one click, keep a copy.
   2. cPanel → File Manager → public_html → Upload this zip → right-click → Extract (overwrite).
      Extracting only writes files; your DATABASE (orders, customers, leads, chats, settings) is
      NOT touched.
   3. Log into the admin panel, then open  https://YOUR-DOMAIN/unpack.php  once.
      It extracts the four pkg-*.zip files in place, clears the PHP cache (OPcache) and deletes
      the pkg-*.zip files. Done — no opcache-reset.php needed, no database import needed.
   4. Leave database.sql alone (or delete it). It is only for an empty database; even if imported
      by mistake it cannot overwrite or remove existing rows (CREATE TABLE IF NOT EXISTS + INSERT IGNORE).

B) FRESH INSTALL (new hosting / empty database)
   1. Extract this zip AND maventech-first-install-config.zip into public_html.
   2. Create the MariaDB database + user in cPanel and put the login in config.php.
   3. phpMyAdmin → Import → database.sql (clean starter, nothing to delete afterwards).
   4. Open  https://YOUR-DOMAIN/unpack.php  once → then log in: services@maventechsoftware.com / Admin@123
      (change the password in Admin → Settings).

C) GITHUB
   Extract this zip on your computer → open the folder → Ctrl+A (select all 8 files) → drag them
   onto the repository's "Upload files" page → Commit. All 8 are accepted in one go.
   Keep the repository PRIVATE (database.sql contains your settings).
   To deploy from GitHub to a server: copy the 8 files to public_html, then open /unpack.php once.

If PHP on the server has no Zip extension, unpack.php tells you so: in File Manager right-click
each pkg-*.zip → Extract → /public_html, then delete the four pkg-*.zip files.

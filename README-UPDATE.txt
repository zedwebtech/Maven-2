MAVENTECH — UPDATE (2026-10-21, build 9k) — Lead Management counters now mean "not opened yet" (All / Chats / Pro Assist / Contact Us) with the all-time totals underneath
==============================================================================================================

HOW TO INSTALL (2 minutes — no manual database changes)
--------------------------------------------------------
1. cPanel → File Manager → public_html → Upload  maventech-update-lite.zip  → right-click → Extract
   (choose to OVERWRITE existing files).
2. IMPORTANT after extracting: open  https://YOUR-DOMAIN/opcache-reset.php  once (or cPanel →
   "Select PHP Version" → Options → switch  opcache  OFF then ON) — otherwise PHP keeps serving the
   OLD files from its cache and nothing looks different.
3. Browsers keep the old tab icon for a while; the new one appears on the next hard refresh
   (Ctrl+F5) or after reopening the tab. Installed app icons update on the next launch.

FULL PACKAGE (maventech-complete-full.zip) — UNDER 100 FILES, SAFE OVER A LIVE SITE, NO DATABASE LOSS
---------------------------------------------------------------------------------------------------------
* The FULL zip now ships the site as 8 plain files — unpack.php, database.sql, 2 READMEs and
  pkg-code.zip, pkg-vendor.zip, pkg-assets.zip, pkg-uploads.zip (no sub-folders) — so you can
  select all of them and drag them onto GitHub's "Upload files" page in one go (GitHub's limit
  is 100 files per upload).
* Install: Upload the zip → Extract (overwrite) → log into admin → open  https://YOUR-DOMAIN/unpack.php
  once. It extracts the four pkg-*.zip files in place, clears the PHP cache and deletes them.
  (unpack.php replaces the opcache-reset.php step for the FULL package.)
* Extracting a zip only ADDS/REPLACES the files inside it — it never deletes files and never
  touches the database. Your orders, customers, leads, chats, keys, settings and uploads stay.
* config.php (database login) and .env (API keys) are NOT inside the FULL zip, so it can never
  change the database login or remove a key.
  FIRST-TIME install on an EMPTY server only: also extract  maventech-first-install-config.zip.
* database.sql (in the zip root) is for a brand-new empty database only. You do NOT need to import
  it for an update. Even if you do, it is import-safe: no DROP TABLE / TRUNCATE / DELETE — every
  table is CREATE TABLE IF NOT EXISTS and every row is INSERT IGNORE, so existing rows are never
  overwritten or removed (db-restore.php refuses any file that contains destructive SQL).
* The code's only cleanup routine (bundled demo-data purge) refuses to run when the database has
  ANY order, lead, contact message, subscription or license key — a live store is never touched.
* Schema updates are self-healing and additive only (ADD COLUMN IF NOT EXISTS) — nothing is dropped.

NEW (build 9j) — Lead Management: counters that drop as you open things, totals underneath
-------------------------------------------------------------------------------------------
* All / Chats / Pro Assist pills now show how many leads you have NOT opened yet (red when > 0, grey "0" when
  everything is seen). Opening a lead — clicking its row or its Chat button — removes it from the count right
  away, live, without a reload; new leads arriving push it back up (heartbeat).
* Directly underneath: "Numbers above = not opened yet. Total received so far — All: 12 · Chats: 8 · Pro
  Assist: 4" — the all-time totals, so a "0" is never mistaken for "nothing ever came in".
* Unopened leads are highlighted (blue tint + dot) exactly like unopened Contact Us messages.
* Contact Us: new messages count as "not opened yet" (badge on the tab + the line "Not opened yet: 2 · Total
  contact messages received so far: 57"); opening a message clears it from both counters instantly.

NEW (build 9i) — International checkout re-checked end to end (9 countries, card + currency + admin)
-----------------------------------------------------------------------------------------------------
* TESTED: Germany (EUR visitor), UAE, UK (GBP visitor), India, Brazil, Japan, Canada (CAD visitor),
  Australia (AUD visitor), Hong Kong — every one paid in USD $209.99 and landed as "paid" under the US store.
* BUG FIXED — "Zip is required." blocked buyers from countries that have NO postal code (UAE, Hong Kong,
  Qatar, Ireland-optional, most Caribbean/African/Pacific states, ~70 in total). The postal field is now
  "Postal Code (optional)" for them — label, browser check and server check all agree; the gateway receives
  it blank, which NMI accepts. All other countries keep their ZIP/postcode as before.
* ADMIN → ORDERS now shows the buyer's country with its flag under every customer (🇩🇪 Germany, 🇦🇪 United Arab
  Emirates …) so you can see where sales come from at a glance, and the Total is always printed in the order's
  OWN currency (never re-labelled by the store you are viewing).
* Re-verified, no change needed: billing country is sent to NMI as ISO-2 (UK → GB), the charge currency is
  the order's stored currency (USD unless a region has "Charge in this currency" ON and NMI accepts it), prices
  on the checkout page always equal the billed amount with the "≈ in your currency" note, phone numbers are
  stored with their dial code, state/ZIP/phone formats never block a good card (bank/AVS decides), customer and
  admin e-mails print the order currency. Dial-code box widened so "+971" is no longer clipped on phones.

NEW (build 9g) — Deals you can SEE on the homepage + one switch for the site-wide offer
--------------------------------------------------------------------------------------
* HOMEPAGE PRICES NOW SELL THE DEAL: every product on the homepage (featured spotlight, side picks, "Picked for
  you", "Welcome back") shows the NOW price, the struck-through ORIGINAL price, a red "35% OFF" chip and
  "You save $113.07"; product images carry a "-35%" corner ribbon. Driven by each product's Original price in
  Admin → Products — products without one simply show their price.
* SITE-WIDE COUPON TAG (Admin → Company Info → Edit → "Show promo bar & site-wide offer banner"):
  ON  → besides the slim top strip, a small amber "10% OFF" tab sits on the left edge of every store page.
        It peeks open once per visit (then tucks away) into a little ticket: 10% OFF · MAVEN10 (tap to copy —
        "Copied! Paste it at checkout") · Shop →. Tap the tab any time to open it again, × to close. No big banner.
        The featured homepage product also shows "Extra 10% off with code MAVEN10 at checkout" so shoppers see
        the two discounts stack.
  OFF → nothing promotional shows anywhere (top strip, tag, stack line all disappear).
* The % tag on "Picked for you" cards now sits in a slim band above the artwork — never on the product image —
  and the price row (price · was · Add) / (% OFF · You save) never wraps awkwardly. Dark mode styled.

NEW (build 9f) — Fake chats stopped: "Verify you're human" + call back / live chat choice
------------------------------------------------------------------------------------------
* HOW IT WORKS FOR THE CUSTOMER: first name · last name · email · phone · issue → flip the **Verify you're human**
  toggle switch (slides right, spins for ~1 second, turns green; no puzzles, no Google/Cloudflare account needed) → **Send** unlocks → they pick
  **Request a call back** or **Continue with chat**.
* WHAT STOPS THE BOTS: the Send button is disabled until a signed, browser-bound check passes — a server-issued
  challenge tied to the visitor's IP + browser, a minimum 2.5 s dwell time (bots post instantly), a small
  proof-of-work solved in the browser, and an invisible honeypot field. Scripts that POST ajax/lead.php
  directly now get HTTP 403 and create NOTHING (no lead, no e-mail, no bell, no push). On top of that each
  network is limited to 3 new chat leads per hour / 8 per day.
* WHAT YOU GET: - call back → lead flagged CALLBACK in Lead Management, e-mail "[CHAT LEAD] Callback requested —
  Name" (phone, e-mail, issue, when, "Human check passed"), bell + phone push + sound (type: lead).
  - continue with chat → e-mail "[CHAT LEAD] Customer Enquiry — Name", bell + phone push + sound (type: chat);
  tapping it opens the live thread in Lead Management (Quick Reply works from the notification).
  Leads whose owner never chooses are still saved in Lead Management but ring nobody.
* PRIVATE, TWO-WAY: every conversation is bound to the browser that opened it (random 128-bit chat token + per-
  browser session id) and hard-locked to the visitor's IP (changing network asks them to confirm their e-mail).
  Another visitor / another IP can never read or join someone else's chat; admin browsers are isolated too.
* Zero database changes required: three small columns (human_verified_at, lead_choice, lead_choice_at) self-add
  on first page view, as before.

NEW (build 9e) — No order without a card · Contact Us popup fixed
-------------------------------------------------------------------
* CARD GATE (checkout.php): bots / scanners were posting the checkout form with NO card data. The old order of
  operations wrote the "pending" order FIRST and only then noticed the missing card — leaving ghost pending
  orders (no last4, no expiry, "PROBE TESTER") in Admin → Orders. Now, whenever NMI / Authorize.Net / custom card
  gateway is active, the request is checked BEFORE anything is written: an NMI Collect.js token OR a Luhn-valid
  card number + future MM/YY expiry + CVV must be present, otherwise the shopper sees "Please enter your card
  number, expiry date and security code" and NO order row is created. Real customers are unaffected (the browser
  already enforces this; the server now does too). Blocked attempts are written to the PHP error log as
  "[checkout card-gate] …" with IP + user-agent.
* CONTACT US POPUP (Admin → Lead Management → Contact Us → row click): the "Message details" dialog rendered
  underneath its own dark backdrop (the tab content wrapper creates a CSS stacking context), so the entire
  screen — dialog included — looked grey. The dialog is now moved to <body> when opened and renders crisp white.

NEW (build 9d) — The real reason the app "froze", and Back / Home on every page of the installed app
----------------------------------------------------------------------------------------------------
* ROOT CAUSE (found by load-testing with 6,000 orders / 3,000 chats / 60,000 visits): the chat poll that every
  admin screen fired every 5 seconds ALSO sent up to 10 customer e-mails over SMTP inside that same request.
  With a slow or quota-limited mailbox (your Google/Gmail quota errors) one poll took 10-30 seconds, and the
  installed app sat frozen until it finished — then the old 30-second auto-reload kicked in on top. Now:
  - no poll ever sends e-mail; the relay runs AFTER the response is handed back (PHP-FPM / LiteSpeed) or in the
    5-minute background scheduler (cron.php / autocron). Heartbeat measured at 0.03 s even when the sweep is due.
  - the 5-minute background scheduler is never started from a poll on hosts that cannot detach it.
  - dashboard "today" visitor statistics now use the index (was a full scan of visitor_log, ~8 × per load).
* BACK / HOME EVERYWHERE: a floating "‹ Back · ⌂ Home" pill appears on every store page when the site is opened
  from a Home Screen bookmark and there is somewhere to go back to; admin pages use the ← button in the top bar.
  "Home" returns to the page the app was opened on (store front or Admin). Pages on your own site now always
  stay inside the app (even links marked "open in new tab"), so Back always works; only other websites and
  documents (PDF/CSV) open in the phone's own viewer, which has its own Done / back-to-app control.
  You never have to force-close the app to get back to the admin panel.

NEW (build 9c) — Notification sounds per event + Quick Reply from the notification
-----------------------------------------------------------------------------------
* SOUNDS (bell → "Sounds"): pick a different tone for Sales, Failed payments, Chats and Install bookings —
  Cash register, Chime, Ding-dong, Alert, Soft pop, Bell or Silent — with a ▶ preview. Defaults: Sales = Cash
  register, Failed payments = Alert, Chats = Chime, Installs = Ding-dong. The choice is saved per device (like
  a phone's own notification sounds). While the app is open the chosen tone plays; when the app is closed the
  phone plays its system sound, and on Android each event has its own vibration pattern (sale = long double
  buzz, failed payment = triple, chat = short double, install = single long).
* QUICK REPLY: a chat notification on Android (and Windows/ChromeOS) now has a "Reply" box right on the
  notification — type and send without opening the app; you get a small "Reply sent ✓" confirmation (or "Reply
  not sent — tap to open" if the phone was offline). On iPhone (Apple does not allow notification reply boxes)
  tapping the notification opens the chat with the reply box focused and highlighted ("Type your reply…").
  If the admin app is already open, tapping a notification opens the chat in place — no page reload.

NEW (build 9b) — Admin app on the phone: fast, never "stuck", and it rings like a real app
------------------------------------------------------------------------------------------
* FREEZE FIX: the installed (Home Screen) admin app used to force-reload the WHOLE page every 30 seconds and
  ran 7 separate background pollers (~1 request per second). That is what made it feel frozen / slow on shared
  hosting. Now ONE light "heartbeat" (every 10 s, paused while the app is in the background) carries the chat
  badge, pending installs and the bell count; nothing reloads by itself. When something new arrives you get a
  "New activity — tap to refresh" toast instead.
* BACK BUTTON: inside the installed app a ← Back button appears in the top bar whenever there is somewhere to
  go back to. Links that leave the admin (storefront pages, PDFs, external sites) open in a separate window
  so your phone offers its own "Done / back to app" control — you can always return to the app.
* PHONE NOTIFICATIONS (bell → "Phone notifications" panel): shows ON/OFF for this device, how many devices are
  registered, when the last push went out and how many devices received it. "Turn on" asks permission and
  registers the device; "Turn off" removes it; "Test" rings every registered device.
  - iPhone: open the site in Safari → Share → Add to Home Screen → open the app from the Home Screen → bell →
    Turn on. (Apple only delivers web notifications to Home Screen apps, iOS 16.4+.)
  - Android / desktop Chrome / Edge: bell → Turn on (works in the browser and in the installed app).
* WHAT RINGS: new sale (✅ key delivered — customer · amount · product), failed payment (now included — it was
  missing before), new customer chat / Pro Assist lead, install booking. Sales and failed payments stay on
  screen until tapped; tapping opens the order / chat. 24/7, no quiet hours.
* No duplicates: the same event used to be able to appear up to three times (page, background poll, push).
  All three now share one notification tag so your phone shows it once.
* Nothing to configure: VAPID keys are generated automatically on first use (needs PHP openssl — standard).
  Zero database changes; `push_subscriptions` self-creates if missing.

NEW (build 9a) — Contact page → "Our Office" card
--------------------------------------------------
* Under the company name + address the card now shows three pills: "Toll-free (888) 823-3590" (tap to call),
  "Text us" (opens the phone's SMS app to the same number) and the support e-mail — all from Company Info.
* Below them, a compact "Texting us?" consent note with the carrier wording (agree to customer-care texts,
  STOP / HELP, rates may apply, frequency varies, consent not a condition of purchase, never sold or shared)
  linking to the Privacy Policy SMS section and the Terms SMS section.

NEW (build 8z) — "Text Messaging (SMS) Disclosure" block on Terms of Service, About Us and Contact
---------------------------------------------------------------------------------------------------
* One elegant card (icon tile, eyebrow title, four pill chips, footer links) with the carrier-approved
  "message-us-first" wording: "By texting <Legal name> at <phone>, or by providing your mobile number and
  opting in, you agree to receive customer-care text messages from <Legal name> … Consent is not a condition
  of purchase. Reply STOP to opt out · Reply HELP for support · Message & data rates may apply · Message
  frequency may vary. Your mobile number and SMS consent are never sold or shared … Visit <full privacy URL>
  to see our Privacy Policy and <full terms URL> for our Terms of Service."
* Shown on: Terms of Service (new section "8. Text Messaging (SMS) Terms", added once automatically),
  About Us (above the closing banner) and Contact Us (under the form). Same wording everywhere — the legal
  name, phone and the two URLs come from Company Info / your domain, so it is correct on any deployment.

NEW (build 8y) — Privacy Policy: SMS / text-messaging consent language (for SMS registration)
---------------------------------------------------------------------------------------------
* The green box on the Privacy Policy now reads "We never sell your personal and SMS consent information."
  and adds: mobile numbers and SMS opt-in consent are never sold, rented or shared with third parties or
  affiliates for marketing.
* New "SMS / Text Messaging Policy" section (before "Your Rights"): what we may text (order, key delivery,
  activation help, call-backs, support replies; promos only with separate opt-in), message frequency,
  "message & data rates may apply", STOP / HELP opt-out, carriers not liable, consent not a condition of
  purchase, and the required "no sharing of SMS consent" statement. Linkable at  /page.php?slug=privacy-policy#sms-policy
* "Information We Collect" gained a "Phone number" row; "Your Rights → Opt-out" mentions STOP for texts;
  the "Do Not Sell My Info" page includes mobile numbers / SMS consent too.
* Applied automatically on first page view (self-healing data update, exact text only — your own edits to
  those pages are untouched). Company name / email / phone inside the wording follow Company Info.

FIX (build 8x) — emails/pages on another domain still said "services@maventechsoftware.com / © Maventech"
-----------------------------------------------------------------------------------------------------------
* ROOT CAUSE: config.php hard-coded SITE_BRAND = "Maventech" and SITE_EMAIL = services@maventechsoftware.com.
  ~250 places in 87 files used those constants — the payment-failed / recovery emails ("Need help? Reply
  to this email or contact …", "© Maventech"), the Protection Hub email heading, the SMTP test mail, the
  footer disclaimer, About Us, Press kit, the AI agent files and several legal pages — so changing
  Company Info never reached them.
* FIX: every one of those places now reads Admin → Company Info directly (company name, legal name,
  email). This works even on a LITE update, where your existing config.php (with the old hard-coded
  values) is deliberately NOT overwritten. Every email footer, PDF, page, JSON-LD block and robots/AI
  file follows whatever you type in Company Info.
* Also de-branded: the admin alert emails' eyebrow ("<COMPANY> — PAYMENT OPS"), the "Card on File" label on
  the order's card visual, the Protection Hub heading, Account / Unsubscribe pages, checkout summary, the
  public Catalog API name, the admin "Install … Admin" app prompt, the subscriptions FAQ, and the AI
  Auto-Blogger / AI Studio writer prompts (so generated articles name YOUR company, not Maventech).
* The seeded legal pages (Privacy, Refund, Terms, FAQs, Help Center, …) are converted once to live
  placeholders, so the support address and company/legal name on them update automatically too
  (existing wording is kept).
* Nothing changes for maventechsoftware.com itself — Company Info there still says Maventech.

FIX (build 8w) — header showed a broken picture ("MAVENTEC" text with a torn-image icon)
-------------------------------------------------------------------------------------------
* ROOT CAUSE (verified on maventechsoftware.com): the database said the logo is
  uploads/company/logo-c391ff7a.png — a file that does NOT exist on the server any more (it was
  created by an upload / AI generation and then lost when the site folder was replaced during a
  re-deploy). The browser drew a broken-image icon plus the alt text "MAVENTECH", clipped to 42 px.
* FIX: the site now checks that the logo file really exists on THIS server. If it doesn't, it heals
  the setting back to the bundled blue "M" mark automatically (and re-creates the file from /assets
  if even that is missing) — so a broken logo can never be shown again, on any domain, after any
  kind of re-deploy. No action needed after extracting; the first page view repairs it.

FIX (build 8v) — wide "wordmark" logos
---------------------------------------
* The blue "M" mark is, and stays, the default: a fresh install starts with it, and Admin → Company
  Info → Edit → Company Logo has a one-click  "Default “M” logo"  button to go straight back to it
  (shown whenever something else is active). Upload / Generate with AI are only there for when the
  same zip is deployed for a different company.
* Wide logos are handled properly everywhere: header and footer show the wordmark ALONE (no
  duplicated name), clamped so it never pushes the menu around on phones; the tab icon, install icons
  and the small mark beside the name in emails use the auto-monogram instead of a squeezed wordmark.
* AI "Wordmark" / "Icon + company name" styles draw on a wide canvas in high quality with "every
  letter present, nothing cut off, no shadow" — so the name no longer runs off the edge.

NEW (build 8u) — Admin → Company Info → Edit → Company Logo → "Generate with AI"
---------------------------------------------------------------------------------
* Next to Upload there is a "Generate with AI" button. Describe the logo (optional), pick a style
  (Icon mark / Monogram / Wordmark / Icon + company name) and click Generate — about 15–40 s.
* The result is previewed on light, dark and at tab-icon size. "Regenerate" tries again,
  "Use this logo" saves it exactly like an upload — so it instantly becomes the tab icon, email
  header, share card, PDF logo, etc. Logos come back as clean transparent PNGs, trimmed, ≤ 512 px.
* Uses the same AI key as your product images (Universal Key — about one image credit per try).
  If the key has no balance you get a clear message instead of a broken image.

NEW (build 8t) — one logo in Admin → Company Info → Logo drives:
------------------------------------------------------------------
* The browser-tab icon (favicon) of the STOREFRONT and of the ADMIN panel (incl. the login page),
  /favicon.ico itself, install / PWA icons for both apps (+ the install name "<Company> Admin").
* The social share card (/og-default.png), JSON-LD Organization / Article "logo", the press-kit logo.
* Email headers: the 4 built-in templates carried a hard-coded blue "M" letter — swapped ONCE
  automatically for the Company Info logo. Animated GIF / SVG logos are never embedded in emails.
* No logo uploaded (fresh install on another domain)? Every place above shows an automatic
  monogram of the company's first letter — same look as the header fallback.

ALSO INCLUDED (build 8s)
------------------------
* CC copies for EVERY admin email (sale, failed payment, chat, Pro Assist, digest) — the "+tag"
  Gmail addresses are now recognised as your own inbox.
* One FAILED PAYMENT email per attempt ("attempt 2", "attempt 3"…), and the sale email says
  "APPROVED after N declined attempts".

FILES (new since 8s): ajax/company-logo-ai.php, includes/brand-icon.php, admin-manifest.php (replaces the
static admin-manifest.json), assets/images/brand/default-logo-mark.png, tests/brand_icon_check.php,
tests/company_logo_ai_check.php, tests/company_brand_check.php. .htaccess gained two rewrite lines
(favicon.ico, admin-manifest.json).

Nothing in the database schema changes. Safe to extract over the existing site.

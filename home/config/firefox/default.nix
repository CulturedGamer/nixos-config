{ config, pkgs, ... }:

{
    programs.firefox = {
        enable = true;
        package = pkgs.firefox-unwrapped;
        profiles.default = {
            id = 0;
            settings = {
                "nglayout.initialpaint.delay" = 0;
                "nglayout.initialpaint.delay_in_oopif" = 0;
                "content.notify.interval" = 100000;
                "browser.startup.preXulSkeletonUI" = false;

                "layout.css.grid-template-masonry-value.enabled" = true;
                "layout.css.animation-composition.enabled" = true;
                "dom.enable_web_task_scheduling" = true;

                "gfx.webrender.all" = true;
                "gfx.webrender.precache-shaders" = true;
                "gfx.webrender.compositor" = true;
                "layers.gpu-process.enabled" = true;
                "media.hardware-video-decoding.enabled" = true;
                "gfx.canvas.accelerated" = true;
                "gfx.canvas.accelerated.cache-items" = 32768;
                "gfx.canvas.accelerated.cache-size" = 4096;
                "gfx.content.skia-font-cache-size" = 80;
                "image.cache.size" = 10485760;
                "image.mem.decode_bytes_at_a_time" = 131072;
                "image.mem.shared.unmap.min_expiration_ms" = 120000;
                "media.memory_cache_max_size" = 1048576;
                "media.memory_caches_combined_limit_kb" = 2560000;
                "media.cache_readahead_limit" = 9000;
                "media.cache_resume_threshold" = 6000;

                "browser.cache.memory.max_entry_size" = 153600;

                "network.buffer.cache.size" = 262144;
                "network.buffer.cache.count" = 128;
                "network.http.max-connections" = 1800;
                "network.http.max-persistent-connections-per-server" = 10;
                "network.ssl_tokens_cache_capacity" = 32768;

                "browser.contentblocking.category" = "strict";
                "privacy.trackingprotection.emailtracking.enabled" = true;
                "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
                "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
                "privacy.query_stripping.strip_list" = "__hsfp __hssc __hstc __s _hsenc _openstat dclid fbclid gbraid gclid hsCtaTracking igshid mc_eid ml_subscriber ml_subscriber_hash msclkid oft_c oft_ck oft_d oft_id oft_ids oft_k oft_lk oft_sk oly_anon_id oly_enc_id rb_clickid s_cid twclid vero_conv vero_id wbraid wickedid yclid";
                "browser.uitour.enabled" = false;
                "privacy.globalprivacycontrol.enabled" = true;
                "privacy.globalprivacycontrol.functionality.enabled" = true;

                "security.OCSP.enabled" = 0;
                "security.remote_settings.crlite_filters.enabled" = true;
                "security.pki.crlite_mode" = 2;
                "security.cert_pinning.enforcement_level" = 2;

                "security.ssl.treat_unsafe_negotiation_as_broken" = true;
                "browser.xul.error_pages.expert_bad_cert" = true;
                "security.tls.enable_0rtt_data" = false;

                "browser.cache.disk.enable" = false;
                "browser.privatebrowsing.forceMediaMemoryCache" = true;
                "browser.sessionstore.privacy_level" = 2;

                "privacy.history.custom" = true;

                "network.http.speculative-parallel-limit" = 0;
                "network.dns.disablePrefetch" = true;
                "browser.urlbar.speculativeConnect.enabled" = false;
                "browser.places.speculativeConnect.enabled" = false;
                "network.prefetch-next" = false;
                "network.predictor.enabled" = false;
                "network.predictor.enable-prefetch" = false;

                "browser.search.separatePrivateDefault.ui.enabled" = true;
                "browser.urlbar.update2.engineAliasRefresh" = true;
                "browser.search.suggest.enabled" = false;
                "browser.urlbar.suggest.quicksuggest.sponsored" = false;
                "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
                "security.insecure_connection_text.enabled" = true;
                "security.insecure_connection_text.pbmode.enabled" = true;
                "network.IDN_show_punycode" = true;

                "dom.security.https_first" = true;

                "network.proxy.socks_remote_dns" = true;
                "network.file.disable_unc_paths" = true;
                "network.gio.supported-protocols" = "";

                "signon.formlessCapture.enabled" = false;
                "signon.privateBrowsingCapture.enabled" = false;
                "signon.autofillForms" = false;
                "signon.rememberSignons" = false;
                "editor.truncate_user_pastes" = false;

                "extensions.formautofill.addresses.enabled" = false;
                "extensions.formautofill.creditCards.enabled" = false;
                "extensions.formautofill.heuristics.enabled" = false;
                "browser.formfill.enable" = false;

                "network.auth.subresource-http-auth-allow" = 1;
                "pdfjs.enableScripting" = false;
                "extensions.postDownloadThirdPartyPrompt" = false;
                "permissions.delegation.enabled" = false;

                "network.http.referer.XOriginTrimmingPolicy" = 2;

                "privacy.userContext.ui.enabled" = true;

                "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
                "media.peerconnection.ice.default_address_only" = true;

                "browser.safebrowsing.downloads.remote.enabled" = false;

                "accessibility.force_disabled" = 1;
                "identity.fxaccounts.enabled" = false;
                "browser.tabs.firefox-view" = false;
                "permissions.default.desktop-notification" = 2;
                "permissions.default.geo" = 2;
                "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
                "geo.provider.ms-windows-location" = false;
                "geo.provider.use_corelocation" = false;
                "geo.provider.use_gpsd" = false;
                "geo.provider.use_geoclue" = false;
                "permissions.manager.defaultsUrl" = "";
                "webchannel.allowObject.urlWhitelist" = "";

                "toolkit.telemetry.unified" = false;
                "toolkit.telemetry.enabled" = false;
                "toolkit.telemetry.server" = "data:,";
                "toolkit.telemetry.archive.enabled" = false;
                "toolkit.telemetry.newProfilePing.enabled" = false;
                "toolkit.telemetry.shutdownPingSender.enabled" = false;
                "toolkit.telemetry.updatePing.enabled" = false;
                "toolkit.telemetry.bhrPing.enabled" = false;
                "toolkit.telemetry.firstShutdownPing.enabled" = false;
                "toolkit.telemetry.coverage.opt-out" = true;
                "toolkit.coverage.opt-out" = true;
                "datareporting.healthreport.uploadEnabled" = false;
                "datareporting.policy.dataSubmissionEnabled" = false;
                "app.shield.optoutstudies.enabled" = false;
                "browser.discovery.enabled" = false;
                "breakpad.reportURL" = "";
                "browser.tabs.crashReporting.sendReport" = false;
                "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
                "captivedetect.canonicalURL" = "";
                "network.captive-portal-service.enabled" = false;
                "network.connectivity-service.enabled" = false;
                "default-browser-agent.enabled" = false;
                "app.normandy.enabled" = false;
                "app.normandy.api_url" = "";
                "browser.ping-centre.telemetry" = false;
                "browser.newtabpage.activity-stream.feeds.telemetry" = false;
                "browser.newtabpage.activity-stream.telemetry" = false;

                "layout.css.prefers-color-scheme.content-override" = 2;
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "app.update.suppressPrompts" = true;
                "browser.compactmode.show" = true;
                "browser.privatebrowsing.vpnpromourl" = "";
                "extensions.getAddons.showPane" = false;
                "extensions.htmlaboutaddons.recommendations.enabled" = false;
                "browser.shell.checkDefaultBrowser" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
                "browser.preferences.moreFromMozilla" = false;
                "browser.tabs.tabmanager.enabled" = false;
                "browser.aboutwelcome.enabled" = false;
                "findbar.highlightAll" = true;
                "middlemouse.contentLoadURL" = false;
                "browser.privatebrowsing.enable-new-indicator" = false;

                "full-screen-api.transition-duration.enter" = "0 0";
                "full-screen-api.transition-duration.leave" = "0 0";
                "full-screen-api.warning.delay" = -1;
                "full-screen-api.warning.timeout" = 0;

                "browser.urlbar.suggest.engines" = false;
                "browser.urlbar.suggest.topsites" = false;
                "browser.urlbar.suggest.calculator" = true;
                "browser.urlbar.unitConversion.enabled" = true;

                "browser.newtabpage.activity-stream.feeds.topsites" = false;
                "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

                "extensions.pocket.enabled" = false;

                "browser.download.useDownloadDir" = false;
                "browser.download.alwaysOpenPanel" = false;
                "browser.download.manager.addToRecentDocs" = false;
                "browser.download.always_ask_before_handling_new_types" = true;

                "browser.download.open_pdf_attachments_inline" = true;

                "browser.tabs.loadBookmarksInTabs" = true;
                "browser.bookmarks.openInTabClosesMenu" = false;
                "layout.css.has-selector.enabled" = true;
            };
            extensions = with pkgs.nur.rycee.firefox-addons; [
                ublock-origin
                decentraleyes
                privacy-badger
                vimium-ff
                return-youtube-dislike
            ];
        };
    };
}

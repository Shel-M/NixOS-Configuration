{
  pkgs,
  config,
  username,
  firefox-addons,
  ...
}: {
  programs = {
    firefox = {
      enable = true;
      profiles.${username} = {
        search = {
	  force = true;
	  default = "kagi";
	  privateDefault = "ddg";
	  order = ["kagi" "ddg" "google"];
          engines = {
	    kagi = {
	      name = "Kagi";
	      urls = [{template = "https://kagi.com/search?q={searchTerms}";}];
	    };
	    bing.metaData.hidden = true;
	  };
	};
        extensions.packages = with firefox-addons.packages."x86_64-linux"; [
	  # onepassword-password-manager
	  darkreader
	  # firefox-color
	  ublock-origin
        ];
	extensions.force = true;
	bookmarks = {};
	settings = {
	  # Disable new tab ad feeds
	  "browser.newtabpage.activity-stream.feeds.topsites" = false;
	  "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
	  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;

          # Disable some telemetry
          "app.shield.optoutstudies.enabled" = false;
          "browser.discovery.enabled" = false;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.ping-centre.telemetry" = false;
          "datareporting.healthreport.service.enabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.sessions.current.clean" = true;
          "devtools.onboarding.telemetry.logged" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.hybridContent.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.prompted" = 2;
          "toolkit.telemetry.rejected" = true;
          "toolkit.telemetry.reportingpolicy.firstRun" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.unifiedIsOptIn" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
	};
      };
    };
  };

  stylix.targets.firefox = {
    enable = true;
    profileNames = [ "${username}" ];
    colorTheme.enable = true;
  };

}

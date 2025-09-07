{
  inputs,
  system,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  xdg.mimeApps = let
    associations = builtins.listToAttrs (map (name: {
        inherit name;
        value = let
          zen-browser = inputs.zen-browser.packages.${system}.twilight;
        in
          zen-browser.meta.desktopFileName;
      }) [
        "application/x-extension-shtml"
        "application/x-extension-xhtml"
        "application/x-extension-html"
        "application/x-extension-xht"
        "application/x-extension-htm"
        "x-scheme-handler/unknown"
        "x-scheme-handler/mailto"
        "x-scheme-handler/chrome"
        "x-scheme-handler/about"
        "x-scheme-handler/https"
        "x-scheme-handler/http"
        "application/xhtml+xml"
        "application/json"
        "text/plain"
        "text/html"
      ]);
  in {
    associations.added = associations;
    defaultApplications = associations;
  };

  programs.zen-browser = {
    enable = true;

    policies = let
      mkLockedAttrs = builtins.mapAttrs (_: value: {
        Value = value;
        Status = "locked";
      });

      mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
        installation_mode = "force_installed";
      });
    in {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true; # save webs for later reading
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      ExtensionSettings = mkExtensionSettings {
        "wappalyzer@crunchlabz.com" = "wappalyzer";
        "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = "github-file-icons";
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes";
        "github-no-more@ihatereality.space" = "github-no-more";
        "github-repository-size@pranavmangal" = "gh-repo-size";
        "firefox-extension@steamdb.info" = "steam-database";
        "@searchengineadremover" = "searchengineadremover";
        "jid1-BoFifL9Vbdl2zQ@jetpack" = "decentraleyes";
        "uBlock0@raymondhill.net" = "ublock-origin";
      };
      Preferences = mkLockedAttrs {
        "browser.tabs.warnOnClose" = false;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
        # Disable swipe gestures (Browser:BackOrBackDuplicate, Browser:ForwardOrForwardDuplicate)
        "browser.gesture.swipe.left" = "";
        "browser.gesture.swipe.right" = "";
        "browser.tabs.hoverPreview.enabled" = true;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.topsites.contile.enabled" = false;

        "privacy.resistFingerprinting" = true;
        "privacy.firstparty.isolate" = true;
        "network.cookie.cookieBehavior" = 5;
        "dom.battery.enabled" = false;

        "gfx.webrender.all" = true;
        "network.http.http3.enabled" = true;
      };
    };

    profiles.default = let
      containers = {
        Work = {
          color = "blue";
          icon = "briefcase";
          id = 1;
        };
        Shopping = {
          color = "yellow";
          icon = "dollar";
          id = 2;
        };
      };
    in {
      settings = {
        "zen.workspaces.continue-where-left-off" = true;
        "zen.workspaces.natural-scroll" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.view.compact.animate-sidebar" = false;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "homepage";
                url = "https://nixos.org/";
              }
              {
                name = "wiki";
                tags = ["wiki" "nix"];
                url = "https://wiki.nixos.org/";
              }
            ];
          }
        ];
      };

      containersForce = true;
      inherit containers;

      # spacesForce = true;
      # spaces = {
      #   "Rendezvous" = {
      #     id = "e8e7798e-47f4-43e9-8904-c0afcf3aa62d";
      #     icon = "🎭";
      #     position = 1000;
      #     theme = {
      #       type = "gradient";
      #       colors = [
      #         {
      #           red = 226;
      #           green = 182;
      #           blue = 184;
      #           algorithm = "floating";
      #           type = "explicit-lightness";
      #         }
      #       ];
      #       opacity = 0.8;
      #       texture = 0.5;
      #     };
      #   };
      #   "Work" = {
      #     id = "3f133e38-ecd4-436d-8c52-e2f57365a9fe";
      #     icon = "😟";
      #     container = containers."Work".id;
      #     position = 2000;
      #   };
      #   "Shopping" = {
      #     id = "fdb71fc8-3e77-443a-a538-0f3124aaa7df";
      #     icon = "💸";
      #     container = containers."Shopping".id;
      #     position = 3000;
      #   };
      #   "Research" = {
      #     id = "ced034b2-6792-4b20-b72a-cd9c40efdc63";
      #     icon = "💌";
      #     position = 4000;
      #     theme = {
      #       type = "gradient";
      #       colors = [
      #         {
      #           red = 171;
      #           green = 219;
      #           blue = 227;
      #           algorithm = "floating";
      #           type = "explicit-lightness";
      #         }
      #       ];
      #       opacity = 0.2;
      #       texture = 0.5;
      #     };
      #   };
      # };

      search = {
        force = true;
        default = "google";
        engines = let
          nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        in {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = nixSnowflakeIcon;
            definedAliases = ["np"];
          };
          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = nixSnowflakeIcon;
            definedAliases = ["nop"];
          };
          "Home Manager Options" = {
            urls = [
              {
                template = "https://home-manager-options.extranix.com/";
                params = [
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                  {
                    name = "release";
                    value = "master"; # unstable
                  }
                ];
              }
            ];
            icon = nixSnowflakeIcon;
            definedAliases = ["hmop"];
          };
          bing.metaData.hidden = "true";
        };
      };
    };
  };
}

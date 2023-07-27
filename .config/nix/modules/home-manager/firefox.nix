{ config, pkgs, nixpkgs, theme, nur, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
    profiles = {
      adi = {
        id = 0;
        name = "adi";
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
                            updateInterval = 24 * 60 * 60 * 1000;
                            definedAliases = [ "@nw" ];
            };
            "Wikipedia (en)".metaData.alias = "@wiki";
            "Google".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "Bing".metaData.hidden = true;
            "eBay".metaData.hidden = true;
          };
        };
        settings = {
          "general.smoothScroll" = true;
        };
        extraConfig = ''
                    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
                    user_pref("full-screen-api.ignore-widgets", true);
                    user_pref("media.ffmpeg.vaapi.enabled", true);
                    user_pref("media.rdd-vpx.enabled", true);
                    user_pref("layers.acceleration.force-enabled", true);
                    user_pref("gfx.webrender.all", true);
                    user_pref("svg.context-properties.content.enabled", true);
                '';
        userChrome = ''
                 /* 
┌─┐┬┌┬┐┌─┐┬  ┌─┐
└─┐││││├─┘│  ├┤ 
└─┘┴┴ ┴┴  ┴─┘└─┘
┌─┐┌─┐─┐ ┬      
├┤ │ │┌┴┬┘      
└  └─┘┴ └─

by Miguel Avila

*/

/*
 
┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
│  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││
└─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘

*/

:root {
  --sfwindow: #19171a;
  --sfsecondary: #201e21;
}

/* Urlbar View */

/*─────────────────────────────*/
/* Comment this section if you */
/* want to show the URL Bar    */
/*─────────────────────────────*/

.urlbarView {
  display: none !important;
}

/*─────────────────────────────*/

/* 
┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
│  │ ││  │ │├┬┘└─┐
└─┘└─┘┴─┘└─┘┴└─└─┘ 
*/

/* Tabs colors  */
#tabbrowser-tabs:not([movingtab])
  > #tabbrowser-arrowscrollbox
  > .tabbrowser-tab
  > .tab-stack
  > .tab-background[multiselected='true'],
#tabbrowser-tabs:not([movingtab])
  > #tabbrowser-arrowscrollbox
  > .tabbrowser-tab
  > .tab-stack
  > .tab-background[selected='true'] {
  background-image: none !important;
  background-color: var(--toolbar-bgcolor) !important;
}

/* Inactive tabs color */
#navigator-toolbox {
  background-color: var(--sfwindow) !important;
}

/* Window colors  */
:root {
  --toolbar-bgcolor: var(--sfsecondary) !important;
  --tabs-border-color: var(--sfsecondary) !important;
  --lwt-sidebar-background-color: var(--sfwindow) !important;
  --lwt-toolbar-field-focus: var(--sfsecondary) !important;
}

/* Sidebar color  */
#sidebar-box,
.sidebar-placesTree {
  background-color: var(--sfwindow) !important;
}

/* 

┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐            
 ││├┤ │  ├┤  │ ├┤             
─┴┘└─┘┴─┘└─┘ ┴ └─┘            
┌─┐┌─┐┌┬┐┌─┐┌─┐┌┐┌┌─┐┌┐┌┌┬┐┌─┐
│  │ ││││├─┘│ ││││├┤ │││ │ └─┐
└─┘└─┘┴ ┴┴  └─┘┘└┘└─┘┘└┘ ┴ └─┘

*/

/* Tabs elements  */
.tab-close-button {
  display: none;
}

.tabbrowser-tab:not([pinned]) .tab-icon-image {
  display: none !important;
}

#nav-bar:not([tabs-hidden='true']) {
  box-shadow: none;
}

#tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
  > #tabbrowser-arrowscrollbox
  > .tabbrowser-tab[first-visible-unpinned-tab] {
  margin-inline-start: 0 !important;
}

:root {
  --toolbarbutton-border-radius: 0 !important;
  --tab-border-radius: 0 !important;
  --tab-block-margin: 0 !important;
}

.tab-background {
  border-right: 0px solid rgba(0, 0, 0, 0) !important;
  margin-left: -4px !important;
}

.tabbrowser-tab:is([visuallyselected='true'], [multiselected])
  > .tab-stack
  > .tab-background {
  box-shadow: none !important;
}

.tabbrowser-tab[last-visible-tab='true'] {
  padding-inline-end: 0 !important;
}

#tabs-newtab-button {
  padding-left: 0 !important;
}

/* Url Bar  */
#urlbar-input-container {
  background-color: var(--sfsecondary) !important;
  border: 1px solid rgba(0, 0, 0, 0) !important;
}

#urlbar-container {
  margin-left: 0 !important;
}

#urlbar[focused='true'] > #urlbar-background {
  box-shadow: none !important;
}

#navigator-toolbox {
  border: none !important;
}

/* Bookmarks bar  */
.bookmark-item .toolbarbutton-icon {
  display: none;
}
toolbarbutton.bookmark-item:not(.subviewbutton) {
  min-width: 1.6em;
}

/* Toolbar  */
#tracking-protection-icon-container,
#urlbar-zoom-button,
#star-button-box,
#pageActionButton,
#pageActionSeparator,
#tabs-newtab-button,
#back-button,
#PanelUI-button,
#forward-button,
.tab-secondary-label {
  display: none !important;
}

.urlbarView-url {
  color: #dedede !important;
}

/* Disable elements  */
#context-navigation,
#context-savepage,
#context-pocket,
#context-sendpagetodevice,
#context-selectall,
#context-viewsource,
#context-inspect-a11y,
#context-sendlinktodevice,
#context-openlinkinusercontext-menu,
#context-bookmarklink,
#context-savelink,
#context-savelinktopocket,
#context-sendlinktodevice,
#context-searchselect,
#context-sendimage,
#context-print-selection {
  display: none !important;
}

#context_bookmarkTab,
#context_moveTabOptions,
#context_sendTabToDevice,
#context_reopenInContainer,
#context_selectAllTabs,
#context_closeTabOptions {
  display: none !important;
} 
                '';
        userContent = ''
/* 
┌─┐┬┌┬┐┌─┐┬  ┌─┐
└─┐││││├─┘│  ├┤ 
└─┘┴┴ ┴┴  ┴─┘└─┘
┌─┐┌─┐─┐ ┬      
├┤ │ │┌┴┬┘      
└  └─┘┴ └─

by Miguel Avila

*/

:root {
  scrollbar-width: none !important;
}

@-moz-document url(about:privatebrowsing) {
  :root {
    scrollbar-width: none !important;
  }
}
                '';
            };
        };
    };
}

{
  ...
}:
{
  programs.firefox.profiles = {
    default.bookmarks = {
      force = true;
      settings = [
        {
          name = "Arbeit";
          bookmarks = [
            {
              name = "HRWorks";
              url = "https://ssl12.hrworks.de/ac/";
            }
            {
              name = "Outlook";
              url = "https://outlook.office365.com/";
            }
            {
              name = "Teams";
              url = "https://teams.microsoft.com/";
            }
            {
              name = "OneDrive";
              url = "https://quanossolutions-my.sharepoint.com/";
            }
            {
              name = "Jira";
              url = "https://quanos-solutions.atlassian.net/jira/software/c/projects/STDM/boards/381";
            }
          ];
        }
        {
          name = "Studium";
          bookmarks = [
            {
              name = "myohmportal";
              url = "https://my.ohmportal.de/";
            }
            {
              name = "GitLab";
              url = "https://git.informatik.fh-nuernberg.de/";
            }
            {
              name = "Posteingang";
              url = "https://outlook.cloud.microsoft/mail/inbox";
            }
            {
              name = "Teams";
              url = "https://teams.cloud.microsoft/";
            }
            {
              name = "vhb";
              url = "https://smart.vhb.org/edu-sharing/components/collections";
            }
            {
              name = "Quicklinks";
              url = "https://www.th-nuernberg.de/einrichtungen-gesamt/administration-und-service/bibliothek/elektronische-angebote/quicklinks/";
            }
            {
              name = "Self Service Portal";
              url = "https://self-service.ohmportal.de/tas/public/ssp/";
            }
            {
              name = "Intranet";
              url = "https://intern.ohmportal.de/institutionen/fakultaeten/informatik/startseite-in-intranet/page.html";
            }
            {
              name = "OPAC";
              url = "https://opac.th-nuernberg.de/";
            }
            {
              name = "FBI";
              url = "https://www.in-tra.th-nuernberg.de/";
            }
            {
              name = "Modulhandbuch Master";
              url = "https://modulhandbuch.informatik.fh-nuernberg.de/modulebook/book/664";
            }
            {
              name = "Fachschaft";
              url = "https://fachschaft.in.th-nuernberg.de/";
            }
            {
              name = "Klausurvorbereitung";
              url = "https://spicker.fachschaft.in/";
            }
            {
              name = "Spacepub";
              url = "http://spacepub.de/";
            }
            {
              name = "Termine";
              url = "https://www.th-nuernberg.de/studium-karriere/wichtiges-zum-studienstart/termine-im-ueberblick/";
            }
            {
              name = "Hochschuljobbörse";
              url = "https://jobboerse.th-nuernberg.de";
            }
            {
              name = "Netzwerk Ressourcen";
              url = "https://rdscb.informatik.fh-nuernberg.de/rdweb/pages/en-us/default.aspx";
            }
            {
              name = "Campuspoint";
              url = "https://www.campuspoint.de/";
            }
            {
              name = "ICS";
              url = "https://ics-ev.de/login";
            }
            {
              name = "Kurs: Die Abschlussarbeit meistern";
              url = "https://elearning.ohmportal.de/course/view.php?id=6078";
            }
          ];
        }
        "separator"
        {
          name = "Router";
          url = "http://router.christophnickel.com/";
        }
        {
          name = "OMV";
          url = "http://server.christophnickel.com/";
        }
        {
          name = "Tailscale";
          url = "https://login.tailscale.com/admin/";
        }
        {
          name = "porkbun";
          url = "https://porkbun.com/account/domainsSpeedy/";
        }
        {
          name = "Filen";
          url = "https://filen.io/";
        }
        {
          name = "Rclone Web GUI";
          url = "http://127.0.0.1:36125/login";
        }
        "separator"
        {
          name = "Tuta";
          url = "https://app.tuta.com/";
        }
        {
          name = "Spotify";
          url = "https://open.spotify.com/";
        }
        {
          name = "dict";
          url = "https://www.dict.cc/";
        }
        {
          name = "Whatsapp";
          url = "https://web.whatsapp.com/";
        }
        {
          name = "Discord";
          url = "https://discord.com/channels/";
        }
        {
          name = "Reddit";
          url = "https://www.reddit.com/";
        }
        {
          name = "Instagram";
          url = "https://www.instagram.com/";
        }
        {
          name = "Hardcover";
          url = "https://hardcover.app/";
        }
        {
          name = "Social";
          bookmarks = [
            {
              name = "Bluesky";
              url = "https://bsky.app/";
            }
            {
              name = "Mastodon";
              url = "https://mastodon.social/home";
            }
            {
              name = "Pixelfed";
              url = "https://pixelfed.de/";
            }
            {
              name = "MyAnimeList";
              url = "https://myanimelist.net/";
            }
            {
              name = "Letterboxd";
              url = "https://letterboxd.com/";
            }
          ];
        }
        "separator"
        {
          name = "Excalidraw";
          url = "https://excalidraw.com/";
        }
        {
          name = "Typst Preview";
          url = "http://127.0.0.1:23635/";
        }
        "separator"
        {
          name = "Arch Linux";
          url = "https://archlinux.org/";
        }
        {
          name = "NixOS.org";
          url = "https://nixos.org/";
        }
        {
          name = "NixOS Manual";
          url = "https://nixos.org/manual/nixos/stable/";
        }
        {
          name = "Nix Search";
          url = "https://search.nixos.org/packages?channel=unstable";
        }
        {
          name = "nix.dev";
          url = "https://nix.dev/";
        }
        {
          name = "NixOS Wiki";
          url = "https://wiki.nixos.org/wiki/NixOS_Wiki";
        }
        {
          name = "Zero to Nix";
          url = "https://zero-to-nix.com/start/learn-more/";
        }
        {
          name = "Flake Registry";
          url = "https://github.com/NixOS/flake-registry/blob/master/flake-registry.json";
        }
        {
          name = "Home Manager Search";
          url = "https://home-manager-options.extranix.com/?release=master";
        }
        "separator"
        {
          name = "GitHub";
          url = "https://github.com/";
        }
        {
          name = "Huggingface";
          url = "https://huggingface.co/";
        }
        {
          name = "The Rust Programming Language";
          url = "https://rust-book.cs.brown.edu/";
        }
        "separator"
        {
          name = "F1TV";
          url = "https://f1tv.formula1.com/";
        }
        {
          name = "WEC";
          url = "https://fiawec.tv/";
        }
        {
          name = "Twitch";
          url = "https://www.twitch.tv/drops/inventory";
        }
        "separator"
        {
          name = "Warframe";
          url = "https://www.warframe.com/";
        }
        {
          name = "Warframe Wiki";
          url = "https://wiki.warframe.com/";
        }
        {
          name = "Warframe Hub";
          url = "https://hub.warframestat.us/";
        }
        {
          name = "Warframe Market";
          url = "https://warframe.market/";
        }
        {
          name = "Warframe Stream Schedule";
          url = "https://warframestreams.lol/";
        }
        {
          name = "Warframe Media";
          url = "https://www.warframe.com/media";
        }
        "separator"
        {
          name = "TorBox";
          url = "https://torbox.app/dashboard";
        }
        {
          name = "Knaben Database";
          url = "https://knaben.org/";
        }
        {
          name = "Anna’s Archive";
          url = "https://en.wikipedia.org/wiki/Anna%27s_Archive";
        }
        {
          name = "archive.is";
          url = "https://archive.is/";
        }
        {
          name = "Standard Ebooks";
          url = "https://standardebooks.org/";
        }
        "separator"
        {
          name = "Stremio";
          bookmarks = [
            {
              name = "Stremio Guide";
              url = "https://guides.viren070.me/stremio";
            }
            {
              name = "TorBox";
              url = "https://torbox.app/dashboard";
            }
            {
              name = "Knaben Database";
              url = "https://knaben.org/";
            }
            {
              name = "Abmahnbeantworter";
              url = "https://abmahnbeantworter.ccc.de/";
            }
            {
              name = "MediathekViewWeb";
              url = "https://mediathekviewweb.de/";
            }
          ];
        }
        {
          name = "Racing";
          bookmarks = [
            {
              name = "F1TV";
              url = "https://f1tv.formula1.com/";
            }
            {
              name = "WEC+";
              url = "https://plus.fiawec.com/";
            }
            "separator"
            {
              name = "F1 Fantasy";
              url = "https://fantasy.formula1.com/";
            }
            {
              name = "F1 Fantasy Tools";
              url = "https://www.f1fantasytools.com/team-calculator";
            }
            {
              name = "Motorsport-Magazin";
              url = "https://www.motorsport-magazin.com/";
            }
          ];
        }
        {
          name = "Linux";
          bookmarks = [
            {
              name = "Libadwaita Apps";
              url = "https://arewelibadwaitayet.com/";
            }
            {
              name = "adw-gimp3";
              url = "https://github.com/RichardSepsi/adw-gimp3";
            }
            {
              name = "Awesome Wallpapers";
              url = "https://alexandrosliaskos.github.io/Awesome_Wallpapers/";
            }
            {
              name = "Linux Journey";
              url = "https://linuxjourney.com/";
            }
            {
              name = "Comfy.Guide";
              url = "https://comfy.guide/";
            }
            {
              name = "Chris Titus Tech";
              url = "https://christitus.com/";
            }
            {
              name = "Open Source Guides";
              url = "https://opensource.guide/";
            }
            "separator"
            {
              name = "It's FOSS";
              url = "https://itsfoss.com/";
            }
            {
              name = "OMG!Ubuntu!";
              url = "https://www.omgubuntu.co.uk/";
            }
            {
              name = "GamingOnLinux";
              url = "http://gamingonlinux.com/";
            }
            {
              name = "Steam Deck HQ";
              url = "https://steamdeckhq.com/";
            }
            {
              name = "Linux und Ich";
              url = "https://linuxundich.de/";
            }
          ];
        }
        {
          name = "GrapheneOS";
          bookmarks = [
            {
              name = "PrivSec";
              url = "https://privsec.dev/posts/android/";
            }
          ];
        }
        {
          name = "Gaming";
          bookmarks = [
            {
              name = "Steam";
              url = "https://store.steampowered.com/";
            }
            {
              name = "SteamDB";
              url = "https://steamdb.info/";
            }
            {
              name = "ProtonDB";
              url = "https://www.protondb.com/";
            }
            {
              name = "itch.io";
              url = "https://itch.io/";
            }
            "separator"
            {
              name = "EmuDeck";
              url = "https://www.emudeck.com/";
            }
            {
              name = "RetroAchievements";
              url = "https://retroachievements.org/";
            }
            {
              name = "Roms";
              url = "https://www.reddit.com/r/Roms/";
            }
            {
              name = "NSZ";
              url = "https://github.com/nicoboss/nsz";
            }
            "separator"
            {
              name = "Host Unlimited";
              url = "https://c-area.host-unlimited.de/";
            }
          ];
        }
        {
          name = "Bücher";
          bookmarks = [
            {
              name = "Standard Ebooks";
              url = "https://standardebooks.org/";
            }
            {
              name = "Project Gutenberg";
              url = "https://www.gutenberg.org/";
            }
            {
              name = "Internet Archive";
              url = "https://openlibrary.org/";
            }
            {
              name = "Anna’s Archive";
              url = "https://en.wikipedia.org/wiki/Anna%27s_Archive";
            }
            {
              name = "PDF Drive";
              url = "https://www.pdfdrive.com/";
            }
            {
              name = "Internet Archive";
              url = "https://archive.org/";
            }
            "separator"
            {
              name = "SCP Foundation";
              url = "https://scp-wiki.wikidot.com/";
            }
            "separator"
            {
              name = "The Coppermind Wiki";
              url = "https://coppermind.net/";
            }
            {
              name = "Cosmere Maps";
              url = "https://www.cosmeremaps.com/stormlight";
            }
          ];
        }
        {
          name = "Fahrrad";
          bookmarks = [
            {
              name = "gravgrav";
              url = "https://gravgrav.cc/en";
            }
            {
              name = "Bikepacking.com";
              url = "https://bikepacking.com/";
            }
            {
              name = "Biketour Global";
              url = "https://www.biketour-global.de/";
            }
            {
              name = "Really Big Bike Ride";
              url = "https://www.reallybigbikeride.com/bicycle-touring/";
            }
            "separator"
            {
              name = "bikerouter.de";
              url = "https://bikerouter.de/";
            }
            {
              name = "European Divide Trail";
              url = "https://europeandividetrail.com/";
            }
            {
              name = "EuroVelo";
              url = "https://de.eurovelo.com/";
            }
            {
              name = "Bett+Bike";
              url = "https://www.bettundbike.de/";
            }
            {
              name = "1NITE TENT";
              url = "https://1nitetent.com/";
            }
            {
              name = "Stadtradeln";
              url = "https://www.stadtradeln.de/";
            }
            {
              name = "Fairlight Cycles";
              url = "https://fairlightcycles.com/";
            }
          ];
        }
        {
          name = "selfhosted";
          bookmarks = [
            {
              name = "awesome-selfhosted";
              url = "https://github.com/awesome-selfhosted/awesome-selfhosted";
            }
            {
              name = "odroid-hc4:software:install_omv_nas";
              url = "https://wiki.odroid.com/odroid-hc4/software/install_omv_nas";
            }
            {
              name = "OpenWRT Wake on Lan";
              url = "https://mtamsky.blogspot.com/2011/11/openwrt-and-wake-on-lan-wol-how-to-make.html";
            }
            {
              name = "How to secure a Linux server";
              url = "https://github.com/imthenachoman/How-To-Secure-A-Linux-Server";
            }
            {
              name = "OMV Quick Configuration Guide";
              url = "https://forum.openmediavault.org/index.php?thread/49357-omv-quick-configuration-guide/&postID=363921#post363921";
            }
          ];
        }
        {
          name = "WG";
          bookmarks = [
            {
              name = "SPARTACUS Mängelanzeige";
              url = "https://sten.spartacus-fm.de/web/spartacus.html";
            }
            {
              name = "Studentenwerk Dateien senden";
              url = "https://www.werkswelt.de/index.php?id=online-bewerbung";
            }
          ];
        }
      ];
    };
  };
}

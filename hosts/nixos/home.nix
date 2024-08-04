{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "seolcu";
  home.homeDirectory = "/home/seolcu";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    htop
    vscode
    nautilus
    gnome-font-viewer
    mpv
    loupe
    brightnessctl
    element-desktop
    hyprshot
    gcc
    fragments
    upscayl
    nixd
    nixfmt-rfc-style
    bottles
    papirus-icon-theme
    mangohud
    pavucontrol
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/seolcu/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
  qt = {
    enable = true;
    style = {
      package = pkgs.kdePackages.breeze;
      name = "breeze";
    };
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
  programs.kitty.enable = true;
  programs.btop.enable = true;
  programs.bash = {
    enable = true;
    enableVteIntegration = true;
    bashrcExtra = ''
      eval "$(starship init bash)"
    '';
  };
  programs.fastfetch = {
    enable = true;
  };
  programs.imv.enable = true;
  programs.starship.enable = true;
  programs.git = {
    enable = true;
    userEmail = "seolcu0112@proton.me";
    userName = "seolcu";
  };
  programs.gh = {
    enable = true;
  };
  programs.waybar = {
    enable = true;
    settings = [
      {
        # layer = "top"; # Waybar at top layer
        # position = "bottom"; # Waybar position (top|bottom|left|right)
        # height = 30; # Waybar height (to be removed for auto height)
        # width = 1280; # Waybar width
        spacing = 4; # Gaps between modules (4px)
        # Choose the order of the modules
        modules-left = [
          "hyprland/workspaces"
          # "sway/mode"
          # "sway/scratchpad"
          # "custom/media"
        ];
        modules-center = [
          # "hyprland/window"
          "clock"
        ];
        modules-right = [
          # "mpd"
          # "idle_inhibitor"
          # "network"
          # "sway/language"
          # "keyboard-state"
          # "temperature"
          "custom/notification"
          "tray"
          "cpu"
          "memory"
          "backlight"
          "pulseaudio"
          "battery"
          "battery#bat2"
          "power-profiles-daemon"
          "custom/power"
        ];
        # Modules configuration
        "hyprland/workspaces" = {
          # disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{name}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            urgent = "";
            focused = "";
            default = "";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-click = "activate";
        };
        "hyprland/window" = {
          max-length = 200;
          separate-outputs = true;
        };
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "sway/mode" = {
          format = "<span style=\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-empty = false;
          format-icons = [
            ""
            ""
          ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        mpd = {
          format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          format-disconnected = "Disconnected ";
          format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          unknown-tag = "N/A";
          interval = 5;
          consume-icons = {
            on = " ";
          };
          random-icons = {
            off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
          };
          repeat-icons = {
            on = " ";
          };
          single-icons = {
            on = "1 ";
          };
          state-icons = {
            paused = "";
            playing = "";
          };
          tooltip-format = "MPD (connected)";
          tooltip-format-disconnected = "MPD (disconnected)";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray = {
          # icon-size = 21;
          spacing = 10;
        };
        clock = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        backlight = {
          # device = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        battery = {
          states = {
            # good = 95,
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          # format-good = ""; # An empty format will hide the module
          # format-full = "";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery#bat2" = {
          bat = "BAT2";
        };
        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        network = {
          # "interface = "wlp2*", # (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          # scroll-step = 1; # %, can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
        "custom/media" = {
          format = "{icon} {}";
          return-type = "json";
          max-length = 40;
          format-icons = {
            spotify = "";
            default = "🎜";
          };
          escape = true;
          exec = "$HOME/.config/waybar/mediaplayer.py 2> /dev/null"; # Script in resources folder
          # exec = "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null"; # Filter player based on name
        };
        "custom/power" = {
          format = "⏻ ";
          tooltip = false;
          menu = "on-click";
          menu-file = "$HOME/.config/waybar/power_menu.xml"; # Menu file in resources folder
          menu-actions = {
            shutdown = "shutdown";
            reboot = "reboot";
            suspend = "systemctl suspend";
            hibernate = "systemctl hibernate";
          };
        };
      }
    ];
    style = ''
      * {
          color: #FFFFFF;
          font-family: FontAwesome, JetBrainsMono Nerd Font;
      }
      .modules-left #workspaces button {
          border-bottom: none;
      }
      .modules-left #workspaces button.focused,
      .modules-left #workspaces button.active {
          border-bottom: none;
          background: alpha(@base01, 1.000000);
      }
      .modules-center #workspaces button {
          border-bottom: none;
      }
      .modules-center #workspaces button.focused,
      .modules-center #workspaces button.active {
          border-bottom: none;
          background: alpha(@base01, 1.000000);
      }
      .modules-right #workspaces button {
          border-bottom: none;
      }
      .modules-right #workspaces button.focused,
      .modules-right #workspaces button.active {
          border-bottom: none;
          background: alpha(@base01, 1.000000);
      }
      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #power-profiles-daemon,
      #mpd {
          padding: 0 10px;
      }
    '';
  };
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        ",preferred,auto,auto"
        "eDP-1,preferred,auto,1"
      ];

      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/

      # Set programs that you use
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun";

      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:

      exec-once = [
        # "$terminal"
        # "nm-applet &"
        # "waybar & hyprpaper & firefox"
        "fcitx5 &"
        "waybar &"
        "blueman-applet &"
      ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hyprland.org/Configuring/Environment-variables/

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = "5";
        gaps_out = "20";

        border_size = "2";

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = "false";

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = "false";

        layout = "dwindle";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = "10";

        # Change transparency of focused and unfocused windows
        active_opacity = "1.0";
        inactive_opacity = "1.0";

        drop_shadow = "true";
        shadow_range = "4";
        shadow_render_power = "3";
        # "col.shadow" = "rgba(1a1a1aee)";

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = "true";
          size = "3";
          passes = "1";

          vibrancy = "0.1696";
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = "true";

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = "true"; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "true"; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = "0"; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = "true"; # If true disables the random hyprland logo / anime girl background. :(
      };

      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        # ralt & rctrl로 한글입력 하기
        kb_options = "korean:ralt_hangul,korean:rctrl_hanja";
        kb_rules = "";

        follow_mouse = "1";

        sensitivity = "0"; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = "true";
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = "true";
      };

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device = {
        name = "epic-mouse-v1";
        sensitivity = "-0.5";
      };

      ####################
      ### KEYBINDINGSS ###
      ####################

      # See https://wiki.hyprland.org/Configuring/Keywords/
      "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

      # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, L, exec, pidof swaylock || swaylock"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        # Screen brightness
        ", XF86MonBrightnessUp, exec, brightnessctl s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"

        # Keyboard backlight
        # ", keyboard_brightness_up_shortcut, exec, brightnessctl -d *::kbd_backlight set +50%"
        # ", keyboard_brightness_down_shortcut, exec, brightnessctl -d *::kbd_backlight set 50%-"

        # Power button
        ", XF86PowerOff, exec, systemctl suspend; pidof swaylock || swaylock"

        # Screenshot a window
        "$mainMod, PRINT, exec, hyprshot -m window"
        # Screenshot a monitor
        ", PRINT, exec, hyprshot -m output"
        # Screenshot a region
        "$shiftMod, PRINT, exec, hyprshot -m region"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule v1
      # windowrule = float, ^(kitty)$

      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

      windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.

      xwayland = {
        force_zero_scaling = "true";
      };
    };
  };
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
  services.hyprpaper.enable = true;
  services.dunst.enable = true;
  services.clipman.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof swaylock || swaylock";
        ignore_dbus_inhibit = false;
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off; pidof swaylock || swaylock";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 600;
          on-timeout = "systemctl suspend; pidof swaylock || swaylock";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
  programs.swaylock.enable = true;
  programs.wlogout.enable = true;
  programs.cava.enable = true;
}

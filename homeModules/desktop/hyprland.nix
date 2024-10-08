{
  lib,
  config,
  ...
}:
{
  options = {
    myHome.desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland Desktop Environment";
  };

  config = lib.mkIf config.myHome.desktop.hyprland.enable {
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

    myHome = {
      programs = {
        imv.enable = true;
        kitty.enable = true;
        mpv.enable = true;
        rofi-wayland.enable = true;
        swaylock.enable = true;
        waybar.enable = true;
      };
      services = {
        clipman.enable = true;
        dunst.enable = true;
        hypridle.enable = true;
        hyprpaper.enable = true;
      };
    };
  };
}

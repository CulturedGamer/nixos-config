{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
            monitor = [
                "eDP-1, 1920x1080@60,0x0,1"
            ];

            exec-once = [
                "swaybg -i ~/Pictures/wallpapers/forest.jpg"
            ];

            input = {
                follow_mouse = 1;
                repeat_delay = 210;
                repeat_rate = 110;
                numlock_by_default = 1;
                accel_profile = "flat";
            };

            general = {
                gaps_in = 8;
                gaps_out = 8;
                border_size = 2;
                "col.active_border" = "rgb(98971a)";
                layout = "master";
            };

            master = {
                mfact = 0.5;
            };

            gestures = {
                workspace_swipe = true;
            };

            decoration = {
                rounding = 5;
                blur = true;
                blur_size = 5;
                blur_passes = 1;
                blur_new_optimizations = true;
            };
            
            bind = [
                "SUPER, W, killactive"
                "SUPER CTRL, Q, exit"
                "SUPER SHIFT, SPACE, togglefloating"

                "SUPER, h, movefocus,l"
                "SUPER, l, movefocus,r"
                "SUPER, k, movefocus,u"
                "SUPER, j, movefocus,d"
                "SUPER SHIFT, H, movewindow, l"
                "SUPER SHIFT, L, movewindow, r"
                "SUPER SHIFT, K, movewindow, u"
                "SUPER SHIFT, J, movewindow, d"
                "SUPER CTRL, H, resizeactive, -100 0"
                "SUPER CTRL, L, resizeactive, 100 0"
                "SUPER CTRL, K, resizeactive, 0 -100"
                "SUPER CTRL, J, resizeactive, 0 100"

                "SUPER, RETURN, exec, alacritty"

                "SUPER $mainMod, 1, workspace, 1"
                "SUPER $mainMod, 2, workspace, 2"
                "SUPER $mainMod, 3, workspace, 3"
                "SUPER $mainMod, 4, workspace, 4"
                "SUPER $mainMod, 5, workspace, 5"
                "SUPER $mainMod, 6, workspace, 6"
                "SUPER $mainMod, 7, workspace, 7"
                "SUPER $mainMod, 8, workspace, 8"
                "SUPER $mainMod, 9, workspace, 9"
                "SUPER $mainMod, 0, workspace, 10"
                "SUPER $mainMod SHIFT, 1, movetoworkspacesilent, 1"
                "SUPER $mainMod SHIFT, 2, movetoworkspacesilent, 2"
                "SUPER $mainMod SHIFT, 3, movetoworkspacesilent, 3"
                "SUPER $mainMod SHIFT, 4, movetoworkspacesilent, 4"
                "SUPER $mainMod SHIFT, 5, movetoworkspacesilent, 5"
                "SUPER $mainMod SHIFT, 6, movetoworkspacesilent, 6"
                "SUPER $mainMod SHIFT, 7, movetoworkspacesilent, 7"
                "SUPER $mainMod SHIFT, 8, movetoworkspacesilent, 8"
                "SUPER $mainMod SHIFT, 9, movetoworkspacesilent, 9"
                "SUPER $mainMod SHIFT, 0, movetoworkspacesilent, 10"

                "SUPER, S, exec, firefox"
                "SUPER, R, exec, rofi -show drun"
                "SUPER SHIFT, R, exec, rofi -show run"
                "SUPER CTRL, I, exec, bookmark-type"
            ];

            bindm = [
                "SUPER, mouse:272, movewindow"
                "SUPER, mouse:273, resizewindow"
            ];

            windowrulev2 = [
                "opacity 0.9 0.9, class:^(Alacritty)\$"
            ];
        };
    };
}

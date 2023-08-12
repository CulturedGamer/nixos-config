{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
            monitor = [
                "eDP-1, 1920x1080@60,0x0,1"
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
                border_size = 1;
                layout = "master";
            };

            gestures = {
                workspace_swipe = true;
            };
            
            bind = [
                "SUPER,W,killactive"
                "SUPER CTRL,Q,exit"
                "SUPER SHIFT,SPACE,togglefloating"

                "SUPER,h,movefocus,l"
                "SUPER,l,movefocus,r"
                "SUPER,k,movefocus,u"
                "SUPER,j,movefocus,d"
                "SUPER SHIFT, H, movewindow, l"
                "SUPER SHIFT, L, movewindow, r"
                "SUPER SHIFT, K, movewindow, u"
                "SUPER SHIFT, J, movewindow, d"

                "SUPER,RETURN,exec,alacritty"
            ];
        };
    };
}

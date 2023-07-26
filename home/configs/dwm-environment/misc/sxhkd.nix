{ config, pkgs, ... }:

{
    home.file.".config/sxhkd/sxhkdrc" = {
        text = ''
            XF86MonBrightnessDown
                brightnessctl s 10%-

            XF86MonBrightnessUp
                brightnessctl s +10%

            XF86AudioMute
                pactl set-sink-mute @DEFAULT_SINK@ toggle

            XF86AudioLowerVolume
                pactl set-sink-volume @DEFAULT_SINK@ -1%

            XF86AudioRaiseVolume
                pactl set-sink-volume @DEFAULT_SINK@ +1%

            XF86AudioPlay
                playerctl play-pause

            XF86AudioPrev
                playerctl previous

            XF86AudioNext
                playerctl next

            super + shift + r
                killall sxhkd ; sxhkd

            super + s
                firefox

            super + b
                brave-beta

            super + f
                thunar

            super + r
              dmenu_run

            super + ctrl + i
                xdotool type $(grep -v '^#' ~/.local/bookmarks/urls.txt | dmenu -l 20 ~/.config/rofi/launchers/type-4/style-1.rasi | cut -d' ' -f1)

            super + shift + i
                bookmark
        '';
        executable = true;
    };
}

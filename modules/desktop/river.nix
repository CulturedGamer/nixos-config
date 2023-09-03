{ config, lib, pkgs, ... }:

with lib;

let
    cfg = config.modules.river;
in {
    options.modules.river = {
        enable = mkEnableOption "RiverWM";

        wallpaperCommand = mkOption {
            type = types.str;
            default = "";
            example = literalExpression ''
                swaybg -i ~/Pictures/wallpapers/onedark_clouds.png
            '';
            description = "Command to set wallpaper";
        };
    };

    config = mkIf cfg.enable {
        home = {
            packages = [ pkgs.river ];
            file.".config/river/init" = {
                text = ''
                    waybar
                    ${cfg.wallpaperCommand}

                    riverctl map normal Super Return spawn alacritty
                    riverctl map normal Super W close
                    riverctl map normal Super+Control Q exit
                    riverctl map normal Super J focus-view next
                    riverctl map normal Super K focus-view previous
                    riverctl map normal Super+Shift J focus-view next
                    riverctl map normal Super+Shift K focus-view previous
                    riverctl map normal Super+Shift Return zoom
                    riverctl map normal Super H send-layout-cmd rivertile "main-ratio -0.05"
                    riverctl map normal Super L send-layout-cmd rivertile "main-ratio +0.05"
                    riverctl map normal Super+Shift H send-layout-cmd rivertile "main-count +1"
                    riverctl map normal Super+Shift L send-layout-cmd rivertile "main-count -1"
                    riverctl map normal Super+Alt H move left 100
                    riverctl map normal Super+Alt J move down 100
                    riverctl map normal Super+Alt K move up 100
                    riverctl map normal Super+Alt L move right 100
                    riverctl map normal Super+Alt+Control H snap left
                    riverctl map normal Super+Alt+Control J snap down
                    riverctl map normal Super+Alt+Control K snap up
                    riverctl map normal Super+Alt+Control L snap right
                    riverctl map normal Super+Alt+Shift H resize horizontal -100
                    riverctl map normal Super+Alt+Shift J resize vertical 100
                    riverctl map normal Super+Alt+Shift K resize vertical -100
                    riverctl map normal Super+Alt+Shift L resize horizontal 100
                    riverctl map-pointer normal Super BTN_LEFT move-view
                    riverctl map-pointer normal Super BTN_RIGHT resize-view
                    riverctl map normal Super F toggle-float
                    riverctl map normal Super M toggle-fullscreen

                    for i in $(seq 1 9)
                    do
                        tags=$((1 << ($i - 1)))
                        riverctl map normal Super $i set-focused-tags $tags
                        riverctl map normal Super+Shift $i set-view-tags $tags
                        riverctl map normal Super+Control $i toggle-focused-tags $tags
                        riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
                    done

                    all_tags=$(((1 << 32) - 1))
                    riverctl map normal Super 0 set-focused-tags $all_tags
                    riverctl map normal Super+Shift 0 set-view-tags $all_tags

                    riverctl map normal Super Up    send-layout-cmd rivertile "main-location top"
                    riverctl map normal Super Right send-layout-cmd rivertile "main-location right"
                    riverctl map normal Super Down  send-layout-cmd rivertile "main-location bottom"
                    riverctl map normal Super Left  send-layout-cmd rivertile "main-location left"

                    for mode in normal
                    do
                        riverctl map $mode None XF86AudioRaiseVolume  spawn 'pactl set-sink-volume @DEFAULT_SINK@ +1%'
                        riverctl map $mode None XF86AudioLowerVolume  spawn 'pactl set-sink-volume @DEFAULT_SINK@ -1%'
                        riverctl map $mode None XF86AudioMute         spawn 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
                        riverctl map $mode None XF86AudioMedia spawn 'playerctl play-pause'
                        riverctl map $mode None XF86AudioPlay  spawn 'playerctl play-pause'
                        riverctl map $mode None XF86AudioPrev  spawn 'playerctl previous'
                        riverctl map $mode None XF86AudioNext  spawn 'playerctl next'
                        riverctl map $mode None XF86MonBrightnessUp   spawn 'brightnessctl set +2%'
                        riverctl map $mode None XF86MonBrightnessDown spawn 'brightnessctl set 2%-'
                    done

                    riverctl background-color 0x002b36
                    riverctl border-color-focused 0x93a1a1
                    riverctl border-color-unfocused 0x586e75
                    riverctl set-repeat 110 210
                    riverctl default-layout rivertile
                    rivertile -view-padding 6 -outer-padding 6 &

                    riverctl mapnormal SUPER F
                '';
                executable = true;
            };
        };
    };
}

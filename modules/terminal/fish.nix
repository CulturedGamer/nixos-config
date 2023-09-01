{ config, lib, ... }:

with lib;

let
    cfg = config.modules.fish;
in {
    options.modules.fish = {
        enable = mkEnableOption "Fish";
        enableShellAliases = mkEnableOption "Shell Aliases";
    };

    config = mkIf cfg.enable {
        programs.fish = {
            enable = true;

            shellAliases = mkIf (cfg.enableShellAliases) {
                v = "nvim";
                diro = "ll | awk '(NR>1) { print $9 }'";
                fishrc = "sudoedit /etc/nixos/modules/terminal/fish.nix";
                lg = "lazygit";
                se = "sudoedit";
                nluaconf = "cd /etc/nixos/modules/terminal/neovim";
                ytaudio = "yt-dlp --extract-audio --audio-format mp3";
                ytvideo = "yt-dlp -f 'bv*[height=1080]+ba'";
            };

            shellInit = ''
                set -U fish_greeting
                fish_add_path ~/.local/bin
                export VISUAL=nvim
                export EDITOR="$VISUAL"
            '';
        };
    };
}

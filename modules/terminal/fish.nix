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
                fishrc = "sudoedit /etc/nixos/modules/terminal/fish.nix";
                lg = "lazygit";
                se = "sudoedit";
                nluaconf = "cd /etc/nixos/modules/terminal/neovim";
                ytaudio = "yt-dlp --extract-audio --audio-format mp3";
                ytvideo = "yt-dlp -f 'bv*[height=1080]+ba'";
            };

            shellInit = ''
                fish_add_path ~/.local/bin
                export VISUAL=nvim
                export EDITOR="$VISUAL"
            '';
        };
    };
}

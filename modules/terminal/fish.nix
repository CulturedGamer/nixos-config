{ config, pkgs, ... }:

{
    home.file.".config/fish/config.fish".text = ''
        function fish_greeting

        end

        export VISUAL=nvim
        export EDITOR="$VISUAL"
        fish_add_path ~/.local/bin
        fish_add_path ~/.config/rofi/scripts

        alias v='nvim'
        alias fishrc='nvim /etc/nixos/modules/terminal/fish.nix'
        alias lg='lazygit'
        alias se='sudoedit'
        alias nluaconf='cd /etc/nixos/modules/terminal/neovim'
        alias ytaudio='yt-dlp --extract-audio --audio-format mp3'
        alias ytvideo="yt-dlp -f 'bv*[height=1080]+ba'"
        alias lofi_radio='streamlink -p mpv --no-video https://youtu.be/jfKfPfyJRdk'

        starship init fish | source
    '';
}

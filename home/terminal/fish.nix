{ ... }:

{
    home.file.".config/fish/config.fish".text = ''
        function fish_greeting

        end

        function fish_user_key_bindings
            fish_vi_key_bindings
        end

        export VISUAL=nvim
        export EDITOR="$VISUAL"
        fish_add_path ~/.local/bin

        alias v='nvim'
        alias fishrc='sudoedit /etc/nixos/home/terminal/fish.nix'
        alias lg='lazygit'
        alias se='sudoedit'
        alias nluaconf='cd /etc/nixos/home/terminal/neovim'
        alias ytaudio='yt-dlp --extract-audio --audio-format mp3'
        alias ytvideo="yt-dlp -f 'bv*[height=1080]+ba'"
        alias lofi_radio='streamlink -p mpv https://youtu.be/jfKfPfyJRdk worst'

        starship init fish | source
    '';
}

{ pkgs, config, ... }:

{
    home.file.".config/fish/config.fish" = {
        text = ''
            function fish_greeting

            end

            export VISUAL=nvim
            export EDITOR="$VISUAL"
            fish_add_path ~/.local/bin
            fish_add_path ~/.config/rofi/scripts

            alias v='nvim'
            alias fishrc='nvim ~/.config/fish/config.fish'
            alias fishso='source ~/.config/fish/config.fish'
            alias sxhkdrc='nvim ~/.config/sxhkd/sxhkdrc'
            alias nluaconf='cd ~/.config/nvim/lua/'
            alias ytaudio='yt-dlp --extract-audio --audio-format mp3'
            alias ytvideo="yt-dlp -f 'bv*[height=1080]+ba'"
            alias lofi_radio='streamlink -p mpv https://youtu.be/jfKfPfyJRdk worst'
            alias synth_radio='streamlink -p mpv https://youtu.be/MVPTGNGiI-4 worst'
            alias phonk_radio='streamlink -p mpv https://youtu.be/bVr3C-dHq_E worst'

            starship init fish | source
        '';
    };
}

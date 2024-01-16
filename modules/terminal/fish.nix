{ config, lib, ... }:

with lib;

let
  cfg = config.modules.fish;
in
{
  options.modules.fish = {
    enable = mkEnableOption "Fish";
    enableShellAliases = mkEnableOption "Shell Aliases";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;

      shellAliases = mkIf (cfg.enableShellAliases) {
        v = "nvim";
        nd = "cd /etc/nixos";
        cb = "cargo build";
        cch = "cargo check";
        chillwave_radio = "streamlink --player mpv --player-args '--no-video' https://youtu.be/4xDzrJKXOOY worst";
        cpptem = "cp -r ~/Templates/programming/cpp_template";
        cv = "cargo run";
        ctem = "cp -r ~/Templates/programming/c_template";
        daudio = "yt-dlp --extract-audio --audio-format mp3";
        desksw = "sudo nixos-rebuild switch --flake /etc/nixos#desktop";
        deskte = "sudo nixos-rebuild test --flake /etc/nixos#desktop";
        diro = "ll | awk '(NR>1) { print $9 }'";
        dvideo = "yt-dlp -f 'bv*[height=1080]+ba'";
        fdh = "cd $(find . -type d -path '*/.*' -prune -o -not -name '.*' -type d -print | fzf)";
        fishrc = "sudoedit /etc/nixos/modules/terminal/fish.nix";
        gltem = "cp -r ~/Templates/programming/opengl_template";
        lapsw = "sudo nixos-rebuild switch --flake /etc/nixos#laptop";
        lapte = "sudo nixos-rebuild test --flake /etc/nixos#laptop";
        lapupd = "nix flake update && sudo nixos-rebuild switch --flake /etc/nixos#laptop && git add . && git commit -m 'nix flake update' && git push";
        lg = "lazygit";
        lofi_radio = "streamlink --player mpv --player-args '--no-video' https://youtu.be/jfKfPfyJRdk worst";
        mk = "make";
        mkr = "make run";
        nb = "nix build";
        nconf = "cd /etc/nixos/modules/terminal/neovim";
        ndev = "nix develop";
        nr = "nix run";
        se = "sudoedit";
        snip = "grim -g '$(slurp)'";
        tms = "tmux new-session -c . -s";
        trcl = "sudo nix-collect-garbage -d ; nix-collect-garbage -d";
        upd = "cd /etc/nixos && nix flake update";
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

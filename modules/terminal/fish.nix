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
        cpptem = "cp -r ~/Templates/programming/cpp_template";
        ctem = "cp -r ~/Templates/programming/c_template";
        desksw = "sudo nixos-rebuild switch --flake /etc/nixos#desktop";
        deskte = "sudo nixos-rebuild test --flake /etc/nixos#desktop";
        diro = "ll | awk '(NR>1) { print $9 }'";
        fdh = "cd $(find . -type d -path '*/.*' -prune -o -not -name '.*' -type d -print | fzf)";
        fishrc = "sudoedit /etc/nixos/modules/terminal/fish.nix";
        lapupd = "upd && lapsw && git add . && git commit -m 'nix flake update' && git push";
        gltem = "cp -r ~/Templates/programming/opengl_template";
        lapsw = "sudo nixos-rebuild switch --flake /etc/nixos#laptop";
        lapte = "sudo nixos-rebuild test --flake /etc/nixos#laptop";
        lg = "lazygit";
        nb = "nix build";
        nluaconf = "cd /etc/nixos/modules/terminal/neovim";
        nr = "nix run";
        se = "sudoedit";
        snip = "grim -g '$(slurp)'";
        tms = "tmux new-session -c . -s";
        trcl = "sudo nix-collect-garbage -d ; nix-collect-garbage -d";
        upd = "cd /etc/nixos && nix flake update";
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

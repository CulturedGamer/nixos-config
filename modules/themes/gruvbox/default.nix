{ pkgs, ... }:

{
  imports = [
    ../../desktop/river.nix

    ../../misc/wallpapers.nix

    ../../terminal/alacritty.nix
    ../../terminal/tmux.nix
    ../../terminal/neovim

    ../../graphic/rofi
    ../../graphic/waybar/default.nix

    ../global.nix
  ];

  gtk = {
    enable = true;
    font.name = "RobotoMonoNerdFont";
    theme = {
      name = "Gruvbox-Dark-B";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
    cursorTheme = {
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
    };
  };

  home = {
    pointerCursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      x11.enable = true;
      gtk.enable = true;
    };

    packages = with pkgs; [
      grim
      polkit_gnome
      slurp
      wl-clipboard
      wlr-randr
      wtype
    ];
  };

  modules = {
    # Terminal
    alacritty = {
      enable = true;
      colorscheme = "gruvbox";
      font = "inconsolata";
      opacity = 1.0;
    };

    neovim = {
      enable = true;
      extraPlugins = with pkgs.vimPlugins; [
        bufferline-nvim
        lualine-nvim
        noice-nvim
      ];
      extraPluginsConfiguration = ''
        require("bufferline").setup()
        require("lualine").setup()

        require("noice").setup {
          lsp = {
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
          },
          presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
          }
        }
      '';
      theme = pkgs.vimPlugins.gruvbox-nvim;
      themeConfiguration = ''
        require("gruvbox").setup {
          contrast = "hard",
        }
        vim.cmd.colorscheme "gruvbox"
      '';
    };

    tmux = {
      enable = true;
      extraConfig = ''
        set -g status-style 'bg=#282828 fg=#fbf1c7'
      '';
    };

    # Desktop
    river = {
      enable = true;
      wallpaperCommand = "swaybg -i ~/Pictures/wallpapers/gruvy_seaside.jpg";
      backgroundColor = "0x282828";
      borderWidth = "2";
      focusedBorderColor = "0x458588";
      unfocusedBorderColor = "0x282828";
      viewPadding = "4";
      outerPadding = "4";
    };

    rofi = {
      enable = true;
      theme = ./files/gruvbox-rofi.rasi;
    };

    waybar = {
      enable = true;
      barHeight = 30;
      theme = ./files/gruvbox-waybar.css;
      wmModules = [ "river/tags" "river/window" ];
    };
  };
}

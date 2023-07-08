{ pkgs, config, ... }:

{
    home.file.".local/bookmarks/urls.txt".source = ./urls.txt;
}

{ config, pkgs, ... }:

{
    home.file.".local/bookmarks/urls.txt".source = ./urls.txt;
}

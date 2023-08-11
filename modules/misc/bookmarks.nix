{ config, pkgs, ... }:

{
    home.file.".local/bookmarks/urls.txt".text = ''
        https://youtube.com
        https://discord.com/channels/@me
        https://monkeytype.com
        https://10fastfingers.com/typing-test/english
        https://github.com/CulturedGamer
    '';
}

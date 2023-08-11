{ ... }: {
    home.file.".local/bin" = {
        source = ./.;
        recursive = true;
        executable = true;
    };
}

{   lib, stdenv
,   poetry
,   python311Packages.installer
}:

stdenv.mkDerivation {
    pname = "pyprland";

    src = builtins.fetchGit {
        url = "https://github.com/hyprland-community/pyprland.git";
        rev = "c710e7691203fe4d7e310a1e5b56020734913390";
        ref = "main";
    };

    buildinputs = [
        
    ];
}

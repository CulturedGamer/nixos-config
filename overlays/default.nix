{ dwm, ... }:

[
    (_: prev: { inherit (dwm.packages.${prev.system}) dwm; })
]

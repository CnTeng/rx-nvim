{
  flake.overlays.default =
    final: prev:
    let
      sources = final.callPackage ./_sources/generated.nix { };

      mkPackage = src: pname: final.vimUtils.buildVimPlugin sources.${src} // { inherit pname; };

      mkOverride =
        n:
        prev.vimPlugins.${n}.overrideAttrs (_: {
          inherit (sources.${n}) src;
        });
    in
    {
      vimPlugins = prev.vimPlugins // {
        gp-nvim = mkPackage "gp-nvim" "gp.nvim";

        bufferline-nvim = mkOverride "bufferline-nvim";
        flash-nvim = mkOverride "flash-nvim";
      };
    };
}

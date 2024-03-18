{ callPackage, vimUtils, ... }:
let
  sources = callPackage ./_sources/generated.nix { };
in
{
  gp-nvim = vimUtils.buildVimPlugin sources.gp-nvim // {
    pname = "gp.nvim";
  };

  outline-nvim = vimUtils.buildVimPlugin sources.outline-nvim // {
    pname = "outline.nvim";
  };
}

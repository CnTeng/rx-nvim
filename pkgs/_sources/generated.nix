# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  copilot-status-nvim = {
    pname = "copilot-status-nvim";
    version = "ea9e7000e82a89aac9d8434675dfed3da4ec1158";
    src = fetchFromGitHub {
      owner = "ofseed";
      repo = "copilot-status.nvim";
      rev = "ea9e7000e82a89aac9d8434675dfed3da4ec1158";
      fetchSubmodules = false;
      sha256 = "sha256-DR9H8ZDmEidXCyCIzuQTQFpvnPiV0xfUfQC6XOc2RkM=";
    };
    date = "2024-05-29";
  };
  kitty-scrollback-nvim = {
    pname = "kitty-scrollback-nvim";
    version = "d51725a6b71d65dd9df83ddc07903de2fb2736ee";
    src = fetchFromGitHub {
      owner = "mikesmithgh";
      repo = "kitty-scrollback.nvim";
      rev = "d51725a6b71d65dd9df83ddc07903de2fb2736ee";
      fetchSubmodules = false;
      sha256 = "sha256-K2etlw89afHYR791keUF5+BBRybfp2mKaVYWigEXczs=";
    };
    date = "2024-09-27";
  };
  kulala-nvim = {
    pname = "kulala-nvim";
    version = "6d6865ce9b2e89b99263bd0b8b8f8f662ff2f154";
    src = fetchFromGitHub {
      owner = "mistweaverco";
      repo = "kulala.nvim";
      rev = "6d6865ce9b2e89b99263bd0b8b8f8f662ff2f154";
      fetchSubmodules = false;
      sha256 = "sha256-5hXWRAtPAuMpl/g/z2YUW1tB5xvj/fJrTuYS2lHfYWc=";
    };
    date = "2024-10-01";
  };
  neovim-session-manager = {
    pname = "neovim-session-manager";
    version = "cbaebd92dce84e9ba63cb07d3199e5a19b204c1a";
    src = fetchFromGitHub {
      owner = "Shatur";
      repo = "neovim-session-manager";
      rev = "cbaebd92dce84e9ba63cb07d3199e5a19b204c1a";
      fetchSubmodules = false;
      sha256 = "sha256-HnNbB5Nx65Zb5oTjED0et+bAAEVX5+8pZxwTZvxRtQ8=";
    };
    date = "2024-08-02";
  };
  quicker-nvim = {
    pname = "quicker-nvim";
    version = "183041a46d6c908eefb1c23ea02cce9c8f41256e";
    src = fetchFromGitHub {
      owner = "stevearc";
      repo = "quicker.nvim";
      rev = "183041a46d6c908eefb1c23ea02cce9c8f41256e";
      fetchSubmodules = false;
      sha256 = "sha256-vhDXkE33NkiCs8PUB2PIzljaL15V3Ac62FRgnEZs06M=";
    };
    date = "2024-09-13";
  };
}

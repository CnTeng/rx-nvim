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
  neovim-session-manager = {
    pname = "neovim-session-manager";
    version = "ce43f2eb2a52492157d7742e5f684b9a42bb3e5c";
    src = fetchFromGitHub {
      owner = "Shatur";
      repo = "neovim-session-manager";
      rev = "ce43f2eb2a52492157d7742e5f684b9a42bb3e5c";
      fetchSubmodules = false;
      sha256 = "sha256-W9jtfVXHC8MQJwdbxakNqhd+xh/auQb3U09XKdN2Wzw=";
    };
    date = "2024-10-09";
  };
}

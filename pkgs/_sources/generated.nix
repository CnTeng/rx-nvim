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
    version = "3409dc920d40bec4c901c0a122a80bee03d6d1e1";
    src = fetchFromGitHub {
      owner = "Shatur";
      repo = "neovim-session-manager";
      rev = "3409dc920d40bec4c901c0a122a80bee03d6d1e1";
      fetchSubmodules = false;
      sha256 = "sha256-k2akj/s6qJx/sCnz3UNHo5zbENTpw+OPuo2WPF1W7rg=";
    };
    date = "2025-03-07";
  };
}

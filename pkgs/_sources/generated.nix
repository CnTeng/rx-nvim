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
  kulala-nvim = {
    pname = "kulala-nvim";
    version = "28d858693683ba42d6a0fc4a73e0658665330772";
    src = fetchFromGitHub {
      owner = "mistweaverco";
      repo = "kulala.nvim";
      rev = "28d858693683ba42d6a0fc4a73e0658665330772";
      fetchSubmodules = false;
      sha256 = "sha256-Th0TxFYdidGhQ0W8ZF57tD9jGE7KIHTOZpMO69RVYIs=";
    };
    date = "2024-07-11";
  };
  luvit-meta = {
    pname = "luvit-meta";
    version = "ce76f6f6cdc9201523a5875a4471dcfe0186eb60";
    src = fetchFromGitHub {
      owner = "Bilal2453";
      repo = "luvit-meta";
      rev = "ce76f6f6cdc9201523a5875a4471dcfe0186eb60";
      fetchSubmodules = false;
      sha256 = "sha256-zAAptV/oLuLAAsa2zSB/6fxlElk4+jNZd/cPr9oxFig=";
    };
    date = "2024-01-20";
  };
}

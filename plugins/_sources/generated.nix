# This file was generated by nvfetcher, please do not modify it manually.
{
  fetchgit,
  fetchurl,
  fetchFromGitHub,
  dockerTools,
}:
{
  gp-nvim = {
    pname = "gp-nvim";
    version = "d76be3d067b4e7352d1e744954327982cf1d24aa";
    src = fetchFromGitHub {
      owner = "Robitx";
      repo = "gp.nvim";
      rev = "d76be3d067b4e7352d1e744954327982cf1d24aa";
      fetchSubmodules = false;
      sha256 = "sha256-IIpbLDiC5Th/jbx7LDEPj+6D86eQQCZgPQHsfc8j8GY=";
    };
    date = "2024-02-28";
  };
  outline-nvim = {
    pname = "outline-nvim";
    version = "bdfd2da90e9a7686d00e55afa9f772c4b6809413";
    src = fetchFromGitHub {
      owner = "hedyhli";
      repo = "outline.nvim";
      rev = "bdfd2da90e9a7686d00e55afa9f772c4b6809413";
      fetchSubmodules = false;
      sha256 = "sha256-Il27Z/vQVJ3WSrFnTOUwBeAFCjopXwDhdsi7A5v1gzU=";
    };
    date = "2024-03-16";
  };
}

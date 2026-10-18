{
  lib,
  vimUtils,
  fetchFromGitHub,
}:
vimUtils.buildVimPlugin {
  pname = "smart-splits-backend-kitty";
  version = "0-unstable-2026-09-24";

  src = fetchFromGitHub {
    owner = "smart-splits-nvim";
    repo = "backend-kitty";
    rev = "f892244d69727b8634dd5c085fb041f4e6cc9ef3";
    hash = "sha256-sV49CezLSlxn2+1uCLvehv37FUdTw5yiO/qhC0CPcGQ=";
  };

  patches = [ ./abstract-sockets.patch ];

  meta = {
    description = "Kitty backend for smart-splits.nvim";
    homepage = "https://github.com/smart-splits-nvim/backend-kitty";
    license = lib.licenses.mit;
  };
}

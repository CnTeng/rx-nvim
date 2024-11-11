{
  prev,
  fetchYarnDeps,
  fetchFromGitHub,
}:
prev.sql-formatter.overrideAttrs rec {
  version = "15.4.5";

  src = fetchFromGitHub {
    owner = "sql-formatter-org";
    repo = "sql-formatter";
    rev = "v${version}";
    hash = "sha256-tuui3otjOyoNmAG8S+o/cFI7UJRNWtzMTf9S72hiRZM=";
  };

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = "${src}/yarn.lock";
    hash = "sha256-R3PDDWxNtPK18adtHB4Jjp451Mp2p+5Fw6A1xkC58oY=";
  };
}

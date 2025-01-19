{
  prev,
  fetchYarnDeps,
  fetchFromGitHub,
}:
prev.sql-formatter.overrideAttrs rec {
  version = "15.4.9";

  src = fetchFromGitHub {
    owner = "sql-formatter-org";
    repo = "sql-formatter";
    rev = "v${version}";
    hash = "sha256-rCM/RDyWGBAobsiODIujkcjkqM4uSFPdRfvPqgIJQaY=";
  };

  yarnOfflineCache = fetchYarnDeps {
    yarnLock = "${src}/yarn.lock";
    hash = "sha256-w+riBFsxqQ3BY2MF5yih1www+TMChneuTOS+sKWmlus=";
  };
}

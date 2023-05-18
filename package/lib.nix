lib:
with builtins; {
  getPlugins = dir:
    map (n: lib.strings.removeSuffix ".lua" "${n}") (attrNames (readDir dir));
  mkInitFile = dir: plugins:
    concatStringsSep "\n" (map (n: ''require "${dir}.${n}"'') plugins);
}

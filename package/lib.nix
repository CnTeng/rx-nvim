lib: vimPlugins:
with builtins; {
  getPluginName = dir:
    map (n: lib.strings.removeSuffix ".lua" "${n}") (attrNames (readDir dir));

  getPluginPkg = plugins:
    map (n:
      if vimPlugins ? "${n}-nvim" && n != "surround"
      then vimPlugins."${n}-nvim"
      else if vimPlugins ? "nvim-${n}" && n != "comment"
      then vimPlugins."nvim-${n}"
      else if vimPlugins ? "vim-${n}"
      then vimPlugins."vim-${n}"
      else vimPlugins."${n}")
    plugins;

  mkInitFile = dir: plugins:
    concatStringsSep "\n" (map (n: ''require "${dir}.${n}"'') plugins);
}

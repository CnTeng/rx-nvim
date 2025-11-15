{
  prev,
  sources,
}:
let
  inherit (prev.vimUtils) buildVimPlugin;
in
prev.vimPlugins.extend (
  _: _: {
    copilot-status-nvim = buildVimPlugin (
      sources.copilot-status-nvim // { pname = "copilot-status.nvim"; }
    );
  }
)

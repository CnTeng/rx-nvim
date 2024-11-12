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

    neovim-session-manager = buildVimPlugin (
      sources.neovim-session-manager
      // {
        dependencies = [ prev.vimPlugins.plenary-nvim ];
        nvimSkipModule = [
          "session_manager.config"
          "session_manager.subcommands"
          "session_manager.utils"
        ];
      }
    );

    blink-cmp = prev.vimPlugins.blink-cmp.overrideAttrs (old: {
      patches = [
        (prev.replaceVars ./force-version.patch { inherit (old.src) tag; })
      ];
    });
  }
)

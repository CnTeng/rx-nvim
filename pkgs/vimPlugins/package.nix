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

    kitty-scrollback-nvim = buildVimPlugin (
      sources.kitty-scrollback-nvim // { pname = "kitty-scrollback.nvim"; }
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
  }
)

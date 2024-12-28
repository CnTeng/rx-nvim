{ prev, mkPlugin }:
prev.vimPlugins.extend (
  _: _: {
    copilot-status-nvim = mkPlugin "copilot-status-nvim" "copilot-status.nvim";
    kitty-scrollback-nvim = mkPlugin "kitty-scrollback-nvim" "kitty-scrollback.nvim";
    neovim-session-manager = mkPlugin "neovim-session-manager" "neovim-session-manager" // {
      dependencies = [ prev.vimPlugins.plenary-nvim ];
      nvimRequireCheck = "session_manager";
    };
    quicker-nvim = mkPlugin "quicker-nvim" "quicker.nvim";
  }
)

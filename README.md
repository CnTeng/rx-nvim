# 🚀 rx-nvim

[![Neovim][neovim-shield]][neovim-url]
[![Lua][lua-shield]][lua-url]
[![Nix][nix-shield]][nix-url]

A custom Neovim configuration for Nix users.

## 🌟 Preview

![Preview](https://github.com/CnTeng/rx-nvim/assets/56501688/e57dd052-debe-4e93-b649-8a4f262a9e9c)

## ✨ Features

- Install plugins with [Nix](https://nixos.org)
- Setup and lazy-load plugins with [Lazy.nvim](https://github.com/folke/lazy.nvim)
- File explorer with [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Buffer and tab line with [Bufferline](https://github.com/akinsho/bufferline.nvim)
- Statusline with [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- Fuzzy finding with [Fzf-lua](https://github.com/ibhagwan/fzf-lua)
- Autocompletion with [Blink](https://github.com/Saghen/blink.cmp)
- Terminal with [Toggleterm](https://github.com/akinsho/toggleterm.nvim)
- Language Server Protocol with [Native LSP](https://github.com/neovim/nvim-lspconfig)
- Debug Adapter Protocol with [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- Syntax highlighting with [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Formatting and Linting with [Conform](https://github.com/stevearc/conform.nvim)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

## 🛠️ Usage

> [!WARNING]
> This configuration has only been tested in Docker and NixOS.

Docker run

```shell
podman run -it cnteng/rx-nvim:latest
```

Directly run

```shell
nix run github:CnTeng/rx-nvim
```

NixOS module

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    rx-nvim = {
      url = "github:CnTeng/rx-nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, rx-nvim, ... }:
    {
      nixosConfigurations = {
        example = nixpkgs.lib.nixosSystem {
          modules = [
            rx-nvim.nixosModules.default
            { programs.rx-nvim.enable = true; }
            ./configuration.nix
          ];
        };
      };
    };
}
```

## ⭐ Credits

- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [nvimrc](https://github.com/XXiaoA/nvimrc)
- [nvim](https://github.com/ofseed/nvim)

<!-- MARKDOWN LINKS & IMAGES -->

[neovim-shield]: https://img.shields.io/badge/NeoVim-%252357A143.svg?style=for-the-badge&logo=neovim&logoColor=white
[neovim-url]: https://neovim.io
[lua-shield]: https://img.shields.io/badge/Lua-%232C2D72?style=for-the-badge&logo=lua&logoColor=white
[lua-url]: https://www.lua.org
[nix-shield]: https://img.shields.io/badge/NixOS-%235277C3?style=for-the-badge&logo=nixos&logoColor=white
[nix-url]: https://nixos.org

return {
  {
    "neovim/nvim-lspconfig",

    opts = {
      servers = {
        -- only nixd should run, nil_ls is enabled by default so turn it off
        nil_ls = {
          enabled = false,
        },

        nixd = {
          -- This is home-managers job mason does not install nixd
          mason = false,

          settings = {
            nixd = {
              -- Use the exact nixpkgs input locked by this flake.
              --
              -- This provides completion for expressions such as:
              --   pkgs.firefox
              --   pkgs.writeShellApplication
              --   lib.mkOption
              nixpkgs = {
                expr = "import (builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs { }",
              },

              formatting = {
                command = { "nixfmt" },
              },

              options = {
                -- NixOS option completion:
                --
                --   services.
                --   networking.
                --   boot.
                --   hardware.
                nixos = {
                  expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nyx.options",
                },

                -- Home Manager option completion:
                --   programs.firefox.
                --   programs.kitty.
                --   wayland.windowManager.hyprland.
                home_manager = {
                  expr =
                  "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nyx.options.home-manager.users.type.getSubOptions []",
                },
              },
            },
          },
        },
      },
    },
  },
}

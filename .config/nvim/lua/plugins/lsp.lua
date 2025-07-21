return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "pyright", "ruff", "biome", "astro", "cmake", "rust_analyzer", "tailwindcss", "terraformls", "ts_ls", "gopls" },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            }
          }
        }
      },
      {
        "neovim/nvim-lspconfig",
      },
    },
  }
}

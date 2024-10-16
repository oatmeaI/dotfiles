return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        keymaps = {
          init_selection = "\\",
          node_incremental = "\\",
        },
      },
    },
  },
  {
    "folke/flash.nvim",
    continue = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      codelens = { enabled = true },
      diagnostics = { virtual_text = false },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { "0xstepit/flow.nvim" },
  { "rose-pine/neovim" },
  { "xvzc/chezmoi.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = true,
      },
      tabline = {
        lualine_a = { "filename" },
        lualine_b = { "diagnostics", { sources = { "nvim_lsp" } } },
        lualine_y = { "tabs" },
        lualine_z = { "branch" },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
    },
    opts = {
      window = {
        mappings = {
          ["-"] = "navigate_up",
        },
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          visible = true,
        },
      },
    },
  },
  {
    "Julian/vim-textobj-variable-segment",
    dependencies = { "kana/vim-textobj-user" },
  },
  { "willothy/flatten.nvim" },
}

-- LoadLazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable builtin plugins
vim.g.loaded_tar = 1
vim.g.loaded_zip = 1
vim.g.loaded_gzip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_vimball = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_netrwFileHandlers = 1

-- Options
vim.opt.mouse = "a"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = { "120" }
vim.opt.isfname:append("@-@")
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.backup = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"


-- keybinds
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>bq", "<cmd>bd!<cr>", { desc = "Cerrar buffer actual" })
vim.keymap.set("n", "<leader>s", "<cmd>write!<cr>", { desc = "Guardar archivo" })
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Abrir Neotree" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copiar al portapapeles del sistema" })
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Guardar archivo" })

-- Plugins
require("lazy").setup({
  spec = {
    { 
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config =  function()
        vim.cmd("colorscheme catppuccin")
      end
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },
    {
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = true,
    },
    {
      "tpope/vim-sleuth",
      event = "VeryLazy",
    },
    {
      "mbbill/undotree",
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
      config = function()
        local lualine = require("lualine")

        lualine.setup({
          options = { 
            theme = "catppuccin",
            globalstatus = true, 
          },

          extensions = {
            "neo-tree",
            "lazy",
          },
        })
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
      event = "BufRead",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          auto_install = true,
          ignore_install = { "phpdoc" },

          highlight = {
            enable = true,
            additional_vim_regex_highligting = false,
          },
        })
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      cmd = { "Neotree" },
      config = function()
        local neotree = require("neo-tree")

        neotree.setup({
          window = {
            position = "current",
            auto_expand_width = true,
          },

          filesystem = {
            filtered_items = {
              hide_gitignored = true,
              hide_dotfiles = false,
              hide_by_name = { "node_modules" },
              always_show = {
                ".gitignore",
              },
              always_show_by_pattern = {
                ".prettier*",
                ".eslint*",
                ".env*",
              },
              never_show = {
                ".git",
                ".DS_Store",
              },
            },
          },

          event_handlers = {
            {
              event = "file_open_requested",
              handler = function()
                require("neo-tree.command").execute({ action = "close" })
              end,
            },
            {
              event = "neo_tree_buffer_enter",
              handler = function()
                vim.cmd("highlight! Cursor blend=100")
              end,
            },
            {
              event = "neo_tree_buffer_leave",
              handler = function()
                vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
              end,
            },
          },
        })
      end,
    },
    {
      "christoomey/vim-tmux-navigator",
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
    }
  },
})

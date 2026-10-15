vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.hlsearch = false
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
-- vim.opt.cursorline = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.termguicolors = true
vim.g.snacks_animate=true
vim.g.gruvbox_italics = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

vim.g["vimwiki_hl_headers"] = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true },
})

-- require ('colorizer').setup {
--   'css',
--   'html',
--   'javascript',
--   'php',
--   'twig',
--   'typescript',
-- }

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "pyright", "ts_ls", "marksman" },
  automatic_installation = true,
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {
        capabilities = capabilities
      }
    end,
  }
}

local cmp = require('cmp')
-- local lspkind = require('lspkind')

cmp.setup({
  completion = {
    -- autocomplete = true, 
  },
  -- formatting = {
  --   format = lspkind.cmp_format()
  -- },
  -- snippet = {
  --   expand = function(args)
  --     vim.snippet.expand(args.body)
  --   end,
  -- },
 mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    -- { name = 'copilot',  group_index = 2 },
    { name = 'codecompanion', group_index = 2 },
    { name = 'lazydev',       group_index = 0 },
    { name = 'nvim_lsp' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'cmp_tabby' },
  }),
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot_cmp.comparators").prioritize,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    }
  },
})


vim.o.background = 'light'

vim.diagnostic.config({virtual_text = false})
vim.api.nvim_set_keymap(
  'n', '<Leader>D', ':lua vim.diagnostic.open_float()<CR>', 
  { noremap = true, silent = true }
)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.supports_method('textDocument/rename') then
      vim.keymap.set('n', '<leader>gR', vim.lsp.buf.rename)
    end
    -- vim.keymap.set('n', 'gd', vim.diagnostic.open_float)
    -- if client and client.supports_method('textDocument/implementation') then
    --   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
    -- end
    -- if client and client.supports_method('textDocument/references') then
    --   vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    -- end
    -- if client and client.supports_method('textDocument/format') then
    --   vim.keymap.set('n', 'gf', vim.lsp.buf.format)
    -- end
  end,
})

-- vim.keymap.set('n', 'gC', vim.lsp.codelens.display)
-- require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  -- on_attach = function(bufnr)
  -- Jump forwards/backwards with '{' and '}'
  -- vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
  -- vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  -- end,
-- })

vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')

-- vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")

-- local builtin = require 'telescope.builtin'
--
-- vim.keymap.set('n', '<leader>d', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>f', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>l', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<c-l>', '<Nop>')

vim.keymap.set('n', '<leader>v', ':vsplit ~/.config/nvim/init.lua<cr>');
vim.keymap.set('n', ']<space>', 'o<esc>')
vim.keymap.set('n', '[<space>', 'O<esc>')
vim.keymap.set('n', '[e', 'ddkPj')
vim.keymap.set('n', ']e', 'ddpk')

vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', ']c', ':cnext<CR>')
vim.keymap.set('n', '[c', ':cprev<CR>')

vim.keymap.set('n', 'gF', 'gggqG<c-o><c-o>zz')
vim.keymap.set('n', 'gd', '<Nop>')

vim.keymap.set("i", "<c-t>", "<Plug>VimwikiIncreaseLvlSingleItem", { noremap = true })

vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

vim.keymap.set("n", "`", ":w<CR>", { noremap = true })

vim.keymap.set("n", "<leader>e", ":lua Snacks.explorer()<CR>") 

vim.keymap.set("", "<c-h>", "<c-w>h", { noremap = true })
vim.keymap.set("", "<c-j>", "<c-w>j", { noremap = true })
vim.keymap.set("", "<c-k>", "<c-w>k", { noremap = true })
vim.keymap.set("", "<c-l>", "<c-w>l", { noremap = true })

-- vim.api.nvim_create_autocmd("User", {
--     pattern = "LazyVimStarted",
--     command = "lua require('lazy').sync({ show = false })",
--     desc = "Sync plugins",
-- })

-- vim.api.nvim_create_augroup("CursorLineOnlyCurrent", { clear = true })
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = "CursorLineOnlyCurrent",
--   callback = function()
--     vim.opt_local.cursorline = true
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("BufLeave", {
--   group = "CursorLineOnlyCurrent",
--   callback = function()
--     vim.opt_local.cursorline = false
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("WinLeave", {
--   group = "CursorLineOnlyCurrent",
--   callback = function()
--     vim.opt_local.cursorline = false
--   end,
-- })


-- Machine-local overrides, never committed: ~/.config/nvim/lua/local.lua
pcall(require, "local")

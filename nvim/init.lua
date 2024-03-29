vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.wo.number = true
vim.o.mouse = 'a'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
{
'nordtheme/vim',
},
{
'vim-airline/vim-airline'
},
{
'nvim-telescope/telescope.nvim', tag = '0.1.1',
dependencies = { 'nvim-lua/plenary.nvim' }
},
{
'nvim-neo-tree/neo-tree.nvim',
dependencies = {'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim'},
opts = {
filesystem = {
follow_current_file = true,
use_libuv_file_watcher=true,
},
},
config = function()
require("neo-tree").setup({
enable_git_status = false,
default_component_configs = {
icon = {
folder_closed = "→",
folder_empty = "→",
folder_open = "↓",
default = "¬",
},
},
})
end
},
{
'navarasu/onedark.nvim'
},
{
'rust-lang/rust.vim'
},
{
'phaazon/hop.nvim'
},
{
'vim-scripts/aiseered.vim'
}
}, {})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
callback = function()
vim.highlight.on_yank()
end,
group = highlight_group,
pattern = '*',
})

vim.keymap.set('n', '<leader>1', ':colorscheme nord<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>2', ':colorscheme onedark<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>3', ':colorscheme aiseered<cr>', {silent=true, noremap=true})

vim.keymap.set('n', '<C-p>', ':NeoTreeShowToggle<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<C-n>', ':bprevious!<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<C-j>', ':bnext!<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<C-d>', ':bp|:bd #<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>n', ':noh<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>h', ':HopWord<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>o', ':NeoTreeFloatToggle<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>v', ':vsplit<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>f', ':RustFmt<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>q', ':q<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<CR>', ':w<cr>', {silent=true, noremap=true})

local builtin = require('telescope.builtin')

require('hop').setup()

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
vim.keymap.set('n', '<leader>j', builtin.current_buffer_fuzzy_find, {})

vim.cmd([[
let g:airline#extensions#tabline#enabled=1
colorscheme nord
set ignorecase
]])


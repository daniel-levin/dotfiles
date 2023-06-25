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
'arcticicestudio/nord-vim',
},
{
'preservim/nerdtree'
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
dependencies = {'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'},
opts = {
filesystem = {
follow_current_file = true,
use_libuv_file_watcher=true,
},
},
},
{
'kshenoy/vim-signature'
},
{
'navarasu/onedark.nvim'
},
{
'rust-lang/rust.vim'
},
{
'rmehri01/onenord.nvim',
config = function()
require('onenord').setup({
	theme = "dark",
})
end,
},
{
'phaazon/hop.nvim'
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

vim.keymap.set('n', '<C-p>', ':NeoTreeShowToggle<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<C-n>', ':bprevious!<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<C-m>', ':bnext!<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<C-d>', ':bp|:bd #<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>n', ':noh<cr>', {silent=true, noremap=true})
vim.keymap.set('n', '<leader>h', ':HopWord<cr>', {silent=true, noremap=true})

local builtin = require('telescope.builtin')

require('hop').setup()

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.live_grep, {})
vim.keymap.set('n', '<leader>j', builtin.current_buffer_fuzzy_find, {})

vim.cmd([[
let g:airline#extensions#tabline#enabled=1
]])

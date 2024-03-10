require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
end)

vim.g.mapleader = ' '

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Delete word in front in insert mode 
vim.api.nvim_set_keymap('i', '<C-q>', '<space><esc>ce', {
    noremap = true
})

-- Move between tabs (VS Code)
vim.api.nvim_set_keymap('n', '<leader>j', 'gT', {})
vim.api.nvim_set_keymap('n', '<leader>k', 'gt', {})
vim.api.nvim_set_keymap('v', '<leader>j', 'gT', {})
vim.api.nvim_set_keymap('v', '<leader>k', 'gt', {})

-- Move between tab groups (VS Code)
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {})
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {})
vim.api.nvim_set_keymap('v', '<leader>l', '<C-w>l', {})
vim.api.nvim_set_keymap('v', '<leader>h', '<C-w>h', {})

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Yank highlight
vim.api.nvim_create_augroup('YankHighlight', {
    clear = true
})
vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'YankHighlight',
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150
        })
    end
})

-- Search for selection in visual mode
vim.api.nvim_set_keymap('v', '//', 'y/\\V<C-R>=escape(@",\'/\')<CR><CR>', {
    noremap = true
})

-- Clear highlight on esc
vim.api.nvim_set_keymap('n', '<esc>', ':noh<CR>', {
    noremap = true
})

-- Repeat last search remap
vim.api.nvim_set_keymap('n', '<C-n>', 'N', {
    noremap = true,
    silent = true
})

-- Scrolling
vim.api.nvim_set_keymap('n', 'N', '10j', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', 'M', '10k', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('v', 'N', '10j', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('v', 'M', '10k', {
    noremap = true,
    silent = true
})


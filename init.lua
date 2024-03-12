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

vim.api.nvim_set_keymap('n', '<leader>j', 'gh', {});

-- Move between tabs and tab groups
vim.api.nvim_set_keymap('n', 'H', 'gT', {});
vim.api.nvim_set_keymap('n', 'L', 'gt', {});
vim.api.nvim_set_keymap('n', 'J', '<C-w>h', {});
vim.api.nvim_set_keymap('n', 'K', '<C-w>l', {});

vim.api.nvim_set_keymap('v', 'H', 'gT', {});
vim.api.nvim_set_keymap('v', 'L', 'gt', {});
vim.api.nvim_set_keymap('v', 'J', '<C-w>h', {});
vim.api.nvim_set_keymap('v', 'K', '<C-w>l', {});

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


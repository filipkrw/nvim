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

vim.api.nvim_set_keymap('n', '<leader>f', 'gh', {});

-- Move between tabs and tab groups
-- vim.api.nvim_set_keymap('n', '<leader>h', 'gT', {});
-- vim.api.nvim_set_keymap('n', '<leader>l', 'gt', {});
-- vim.api.nvim_set_keymap('n', 'H', '<C-w>h', {});
-- vim.api.nvim_set_keymap('n', 'L', '<C-w>l', {});

-- vim.api.nvim_set_keymap('v', '<leader>h', 'gT', {});
-- vim.api.nvim_set_keymap('v', '<leader>l', 'gt', {});
-- vim.api.nvim_set_keymap('v', 'H', '<C-w>h', {});
-- vim.api.nvim_set_keymap('v', 'L', '<C-w>l', {});

vim.api.nvim_set_keymap('n', '<C-j>', 'gT', {});
vim.api.nvim_set_keymap('n', '<C-k>', 'gt', {});
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {});
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {});

vim.api.nvim_set_keymap('v', '<leader>h', 'gT', {});
vim.api.nvim_set_keymap('v', '<leader>l', 'gt', {});
vim.api.nvim_set_keymap('v', 'H', '<C-w>h', {});
vim.api.nvim_set_keymap('v', 'L', '<C-w>l', {});

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

-- Search and replace selection
vim.api.nvim_set_keymap('v', '<leader>r', 'y/\\V<C-R>=escape(@",\'/\')<CR><CR>Ncgn', {
    noremap = true
})

-- Delete and edit next search result
vim.api.nvim_set_keymap('n', '<leader>r', 'cgn', {
    noremap = true,
    silent = true
})

-- Clear highlight on esc
vim.api.nvim_set_keymap('n', '<esc>', ':noh<CR>', {
    noremap = true,
    silent = true
})

-- Jump to function body
vim.api.nvim_set_keymap('n', '<leader>w', '$i<CR><Esc>yyPxa  ', {
    noremap = true,
    silent = true
})

-- Remap J (used for scrolling)
vim.api.nvim_set_keymap('n', '<leader>j', 'J', {
    noremap = true,
    silent = true
})

-- Scrolling
local move_lines = function(lines, direction)
    vim.cmd('keepjumps norm! ' .. lines .. direction)
end

vim.api.nvim_set_keymap('n', 'J', '', {
    callback = function()
        move_lines(10, 'j')
    end,
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', 'K', '', {
    callback = function()
        move_lines(10, 'k')
    end,
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('v', 'J', '', {
    callback = function()
        move_lines(10, 'j')
    end,
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('v', 'K', '', {
    callback = function()
        move_lines(10, 'k')
    end,
    noremap = true,
    silent = true
})

-- Append ; to the end of the line
vim.api.nvim_set_keymap('n', '<leader>a;', 'A;<Esc>', {
    noremap = true,
    silent = true
})

-- Append {} to the end of the line
vim.api.nvim_set_keymap('n', '<leader>a[', 'A{}<Esc>', {
    noremap = true,
    silent = true
})

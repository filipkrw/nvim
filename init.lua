-- Register pugins. To install them, run :PackerSync command
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'michaeljsmith/vim-indent-object'
end)

-- Surround with brackets
vim.api.nvim_set_keymap("v", "(", "S)", {})
vim.api.nvim_set_keymap("v", "{", "S}", {})
vim.api.nvim_set_keymap("v", "[", "S]", {})

vim.g.mapleader = ' '

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Swap p and P commands
vim.api.nvim_set_keymap('x', 'p', 'P', {
    noremap = true
})
vim.api.nvim_set_keymap('x', 'P', 'p', {
    noremap = true
})

-- Delete word in front in insert mode 
vim.api.nvim_set_keymap('i', '<C-q>', '<space><esc>ce', {
    noremap = true
})

vim.api.nvim_set_keymap('n', '<leader>f', 'gh', {});

-- Move between tabs and tab groups
vim.api.nvim_set_keymap('n', '<C-j>', 'gT', {});
vim.api.nvim_set_keymap('n', '<C-k>', 'gt', {});
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {});
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {});

vim.api.nvim_set_keymap('v', '<C-j>', 'gT', {});
vim.api.nvim_set_keymap('v', '<C-k>', 'gt', {});
vim.api.nvim_set_keymap('v', '<C-h>', '<C-w>h', {});
vim.api.nvim_set_keymap('v', '<C-l>', '<C-w>l', {});

vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>gT', {});
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>gt', {});
vim.api.nvim_set_keymap('i', '<C-h>', '<Esc><C-w>h', {});
vim.api.nvim_set_keymap('i', '<C-l>', '<Esc><C-w>l', {})

-- Move to then start and end of line
vim.api.nvim_set_keymap('n', '<leader>h', '^', {});
vim.api.nvim_set_keymap('n', '<leader>l', '$', {});

-- Add new line below
vim.keymap.set('n', '<CR>', function()
    local line = vim.fn.line(".")
    local count = vim.v.count1
    vim.fn.append(line, vim.fn["repeat"]({""}, count))
end, {
    silent = true
})

-- Remap J (used for scrolling)
vim.api.nvim_set_keymap('n', '<leader><CR>', 'J', {
    noremap = true,
    silent = true
})

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
vim.api.nvim_set_keymap('n', '<leader>]', '$i<CR><Esc>V"zy"zP"zxa  ', {
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
vim.api.nvim_set_keymap('n', '<leader>;', 'A;<Esc>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '<leader>:', 'A:<Esc>', {
    noremap = true,
    silent = true
})

-- Append {} to the end of the line
vim.api.nvim_set_keymap('n', '<leader>[', 'A{}<Esc>', {
    noremap = true,
    silent = true
})

-- Append
vim.api.nvim_set_keymap('n', '<leader>,', 'A,<Esc>', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('n', '<leader>a,', 'A,<CR><Esc>a', {
    noremap = true,
    silent = true
})

-- Center screen
vim.api.nvim_set_keymap('n', '<leader>z', 'zz', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('v', '<leader>z', 'zz', {
    noremap = true,
    silent = true
})

local is_vscode, vscode = pcall(require, "vscode-neovim")

-- VS Code
if is_vscode then
    vim.api.nvim_set_keymap('n', '<leader>/', '', {
        callback = function()
            vscode.action("search.action.openNewEditor")
        end,
        noremap = true,
        silent = true
    })

    vim.api.nvim_set_keymap('v', '<leader>/', '', {
        callback = function()
            vscode.action("search.action.openNewEditor")
        end,
        noremap = true,
        silent = true
    })

    vim.api.nvim_set_keymap('n', ']d', '', {
        callback = function()
            vscode.action("editor.action.marker.next")
        end,
        noremap = true,
        silent = true
    })

    vim.api.nvim_set_keymap('n', '[d', '', {
        callback = function()
            vscode.action("editor.action.marker.prev")
        end,
        noremap = true,
        silent = true
    })

    vim.api.nvim_set_keymap('n', '<leader>i', '', {
        callback = function()
            vscode.action("editor.action.sourceAction")
        end,
        noremap = true,
        silent = true
    })
end

-- Insert mode movements
vim.api.nvim_set_keymap('i', '<C-l>', '<C-o>a', {
    noremap = true
})
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>k', {
    noremap = true
})
vim.api.nvim_set_keymap('i', '<C-j>', '<C-o>j', {
    noremap = true
})
vim.api.nvim_set_keymap('i', '<C-h>', '<C-o>h', {
    noremap = true
})
vim.api.nvim_set_keymap('i', '<C-w>', '<C-o>w', {
    noremap = true
})
vim.api.nvim_set_keymap('i', '<C-b>', '<C-o>b', {
    noremap = true
})

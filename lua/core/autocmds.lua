-- Prevent LSP from overwriting treesitter color settings
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line, col = mark[1], mark[2]
    if line > 0 and line <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, { line, col })
    end
  end,
})

-- Keep 10 lines of space at the end of the file
vim.api.nvim_create_autocmd('CursorMoved', {
  pattern = '*',
  callback = function()
    local total_lines = vim.api.nvim_buf_line_count(0)
    local current_line = vim.api.nvim_win_get_cursor(0)[1]

    if current_line >= total_lines - 10 then
      vim.cmd 'normal! zz'
    end
  end,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Dont't create new lines with comments
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { 'c', 'r', 'o' }
  end,
})

-- Setup our JDTLS server any time we open up a java file
vim.cmd [[
    augroup jdtls_lsp
        autocmd!
        autocmd FileType java lua require'core.jdtls'.setup_jdtls()
    augroup end
]]

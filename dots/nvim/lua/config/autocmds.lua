-- ====================================================================
-- indentation
-- ====================================================================

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typescript,typescriptreact,javascript,javascriptreact",
    command = "setlocal shiftwidth=2 tabstop=2"
})

-- ====================================================================
-- Git Push
-- ====================================================================

_G.git_push = function()
    local branch_name = vim.fn.system("git branch --show-current")

    local output = vim.fn.system(string.format("git push -u origin %s", branch_name))
    print(output)
end

vim.cmd("command! Push lua git_push()")

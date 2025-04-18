return {
    "lervag/vimtex",
    init = function()
        -- This is necessary for VimTeX to load properly. The "indent" is optional.
        -- Note that most plugin managers will do this automatically.
        vim.cmd('filetype plugin indent on')

        -- This enables Vim's and neovim's syntax-related features. Without this, some
        -- VimTeX features will not work (see ":help vimtex-requirements" for more
        -- info).
        vim.cmd('syntax enable')

        -- Viewer options: One may configure the viewer either by specifying a built-in
        -- viewer method:
        vim.g.vimtex_view_method = 'sioyek'
        -- vim.g.vimtex_view_sioyek_exe = 'C:\\Program Files (x86)\\sioyek-release-windows\\sioyek.exe'

        vim.g.vimtex_compiler_latexmk = {
            options = {
                "-lualatex",
                "-silent",
                "-synctex=1",
                "-shell-escape",
                "-interaction=nonstopmode",
            },
        }

        -- -- Or with a generic interface:
        -- vim.g.vimtex_view_general_viewer = 'okular'
        -- vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'

        -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
        -- strongly recommended, you probably don't need to configure anything. If you
        -- want another compiler backend, you can change it as follows. The list of
        -- supported backends and further explanation is provided in the documentation,
        -- see ":help vimtex-compiler".
        vim.g.vimtex_compiler_method = 'latexmk'
    end
}

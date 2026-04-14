return {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_list = { {
      path = '~/mOS/areas/vimwiki/',
    } }

    vim.g.vimwiki_global_ext = 0 -- Important: Don't treat all MD files as vimwiki

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'vimwiki',
      callback = function()
        local opts = { buffer = true, silent = true }

        -- Indentation
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true

        -- Navigate links
        vim.keymap.set('n', '<CR>', '<Plug>VimwikiFollowLink', opts)
        vim.keymap.set('n', '<BS>', '<Plug>VimwikiGoBackLink', opts)
        vim.keymap.set('n', '<Tab>', '<Plug>VimwikiNextLink', opts)
        vim.keymap.set('n', '<S-Tab>', '<Plug>VimwikiPrevLink', opts)

        -- Diary
        vim.keymap.set('n', '<Leader>di', '<Plug>VimwikiDiaryIndex', opts)
        vim.keymap.set('n', '<Leader>d<Leader>d', '<Plug>VimwikiMakeDiaryNote', opts)
        vim.keymap.set('n', '<Leader>d<Leader>t', '<Plug>VimwikiMakeTomorrowDiaryNote', opts)

        -- TOC
        vim.keymap.set('n', '<Leader>toc', ':VimwikiTOC<CR>', opts)

        -- Todo list item toggle
        vim.keymap.set('n', '<C-Space>', '<Plug>VimwikiToggleListItem', opts)
      end,
    })
  end,
}

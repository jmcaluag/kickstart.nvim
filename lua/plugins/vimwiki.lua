return {
  'vimwiki/vimwiki',
  init = function()
    vim.g.vimwiki_list = { {
      path = '~/mOS/areas/vimwiki/',
      syntax = 'markdown',
      ext = '.md',
    } }
    vim.g.vimwiki_global_ext = 0 -- Important: Don't treat all MD files as vimwiki
  end,
}

return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = {
        config = {
            week_header = {
             enable = true,
            },
           },
    },
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
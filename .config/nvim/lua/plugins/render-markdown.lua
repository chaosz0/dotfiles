require('render-markdown').setup({
    enabled = true,
    render_modes = true,
    heading = {
            backgrounds = {},
            sign = false,
            icons = {'# ', '## ', '### ', '#### ', '##### ', '###### '},
    },
    code = { enabled = false, },
    indent = { enabled = false, },
    pipe_table = { style = 'normal' },
})


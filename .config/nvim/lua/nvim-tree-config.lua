require("nvim-tree").setup {
    git = { enable = false},
    open_on_setup = true,
    renderer = {
        indent_markers = { enable = true },
        group_empty = true,
    },
    view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "<Tab>", action = "" }
          }
        }
      }
}

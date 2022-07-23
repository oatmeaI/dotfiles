require("nvim-tree").setup {
    git = { enable = false},
    open_on_setup = true,
    renderer = {
        indent_markers = { enable = true },
    },
    view = {
        mappings = {
          list = {
            { key = "<Tab>", action = "" }
          }
        }
      }
}

local layouts = {
  telescope = {
    reverse = true,
    layout = {
      box = "horizontal",
      backdrop = 90,
      width = 0.8,
      height = 0.9,
      border = "none",
      {
        box = "vertical",
        { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
        { win = "input", height = 1, border = "rounded", title = "{title} {live}", title_pos = "left" },
      },
      {
        win = "preview",
        title = "{preview:Preview}",
        width = 0.6,
        border = "rounded",
        title_pos = "center",
      },
    },
  },
  sidebar = {
    preview = "main",
    layout = {
      backdrop = false,
      width = 40,
      min_width = 40,
      height = 0,
      position = "left",
      border = "none",
      box = "vertical",
      {
        win = "input",
        height = 1,
        border = "rounded",
        title = "{title}",
        title_pos = "center",
      },
      { win = "list", border = "none" },
      { win = "preview", title = "{preview}", height = 0.4, border = "top" },
    },
  },
}
return layouts

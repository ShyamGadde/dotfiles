return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = {
    "CodeSnap",
    "CodeSnapSave",
    "CodeSnapHighlight",
    "CodeSnapSaveHighlight",
    "CodeSnapASCII",
  },
  opts = {
    bg_theme = "dusk",
    code_font_family = "JetBrainsMono Nerd Font",
    save_path = os.getenv("XDG_SCREENSHOTS_DIR") or (os.getenv("HOME") .. "/Pictures"),
    watermark = "",
  },
}

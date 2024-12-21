return {
  {
    "echasnovski/mini.pairs",
    enabled = false,
    -- INFO: Why?
    -- When trying to insert an ending quote results in a pair.
    -- E.g., `"hello|` -> insert `"` -> `"hello"|"`
    -- Couldn't figure out how to fix this, hence disabled and replaced with `nvim-autopairs`.
    -- NOTE: This behavior was only noticed in Python files.
  },
}

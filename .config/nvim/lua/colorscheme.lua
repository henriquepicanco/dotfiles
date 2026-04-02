local options = {
  "Normal",
  "NormalFloat",
  "NormalNC",
  "SignColumn",
  "StatusLine",
  "StatusLineNC"
}

for _, opt in ipairs(options) do
  vim.api.nvim_set_hl(0, opt, { bg = "none" })
end


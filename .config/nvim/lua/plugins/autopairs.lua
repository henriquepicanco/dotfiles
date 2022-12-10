-- import nvim-autopairs plugins faley
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
    return
end

-- configure autopairs
autopairs.setup({
    check_ts = true, -- enable treesitter
    ts_config = {
        lua = { "string", "source" }, -- don't add pairs in lua string or source treesitter nodes
        javascript = { "string", "template_string" }, -- don't add pairs in javascript string or template_string
        java = false, -- don't check treesitter on java
    },
})

-- import nivm-autopairs completion functionality safely
local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
    return
end

-- import nvim-cmp plugin safely
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

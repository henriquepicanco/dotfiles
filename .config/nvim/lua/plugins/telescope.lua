-- import telescope plugin safely
local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local fb_actions = require("telescope").extensions.file_browser.actions

-- configuring telescope
telescope.setup({
    -- configure custom mappings
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to previous result
                ["<C-j>"] = actions.move_selection_next, -- move to the next result
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
                i = {
                    ["<C-w>"] = function()
                        vim.cmd("normal vbd")
                    end,
                },
                n = {
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd("startinsert")
                    end,
                },
            },
        },
    },
})

telescope.load_extension("file_browser")

local keymap = vim.keymap

keymap.set("n", ";f", function()
    builtin.find_files({
        no_ignore = false,
        hidden = true,
    })
end)

keymap.set("n", ";r", function()
    builtin.live_grep()
end)

keymap.set("n", "\\\\", function()
    builtin.buffers()
end)

keymap.set("n", ";t", function()
    builtin.help_tags()
end)

keymap.set("n", ";;", function()
    builtin.resume()
end)

keymap.set("n", ";e", function()
    builtin.diagnostics()
end)

keymap.set("n", "<leader>e", function()
    telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
    })
end)

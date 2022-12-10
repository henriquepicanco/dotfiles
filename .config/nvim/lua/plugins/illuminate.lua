-- import vim-illuminate plugin safely
local illuminate_status, illuminate = pcall(require, "illuminate")
if not illuminate_status then
    return
end

-- vim-illuminate setup
illuminate.configure()

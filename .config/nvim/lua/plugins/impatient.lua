-- impor impartient plugin safely
local impatient_status, impatient = pcall(require, "impatient")
if not impatient_status then
    return
end

-- impartient setup
impatient.enable_profile()

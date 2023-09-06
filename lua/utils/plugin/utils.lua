local M = {}

function M.to_table(v) return (type(v) == "string" or v == nil) and { v } or v end

return M

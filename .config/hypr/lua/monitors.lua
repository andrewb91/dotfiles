local home = os.getenv("HOME")
local state_file = home .. "/.config/hypr/monitor-mode"

local f = io.open(state_file, "r")
local mode = f and f:read("*l") or "internal"
if f then
    f:close()
end

if mode == "external" then
    dofile(home .. "/.config/hypr/lua/monitor-external.lua")
else
    dofile(home .. "/.config/hypr/lua/monitor-internal.lua")
end

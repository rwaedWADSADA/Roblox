-- i didn't make this the owner of xeno did

local fpscap = math.huge

getgenv().setfpscap = function(cap)
    cap = tonumber(cap)
    assert(type(cap) == "number", "invalid argument #1 to 'setfpscap' (number expected, got " .. type(cap) .. ")", 2)
    if cap < 1 then cap = math.huge end
    fpscap = cap
end

local clock = tick()
game:GetService("RunService").RenderStepped:Connect(function()
    while clock + 1 / fpscap > tick() do end
    clock = tick()

    task.wait()
end)

getgenv().getfpscap = function()
    return fpscap
end

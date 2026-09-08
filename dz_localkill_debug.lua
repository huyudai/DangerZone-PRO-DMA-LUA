local function get_local_kills()
    local lp = esp.local_player()
    if lp and lp.valid then
        if lp.kills ~= nil then
            return lp.kills
        end
        local chars = esp.characters()
        if chars then
            for _, c in ipairs(chars) do
                if c.entity_ptr == lp.entity_ptr then
                    return c.kills or 0
                end
            end
        end
    end
    return 0
end

callback.on_draw(function()
    local kills = get_local_kills()
    draw.text(10, 10, "Kills: " .. tostring(kills), 1, 1, 1, 1)
end)
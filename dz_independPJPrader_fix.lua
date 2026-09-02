--在PRO中，打开旋转雷达才能打开迫击炮雷达，所以这个LUA是给需要独立迫击炮雷达的人准备的
--也许这是一个软件问题 ，也许这并不是一个软件问题，总之，无论软件是否更新或者修补他，你可以一直使用此lua。
--地铁模式玩家请自行补全该死的漫长的不可copy的狗屎物品名
--if u have any questions and advice,
--please contact me on discord:huyudai
--or e-mail:admin@00.sb


local mortar_names = {
    "BP_Other_Mortar_C",
    "BP_Other_Mortar_Wrapper_C"
}

local is_mortar_active = false

callback.on_draw(function()
    if not esp.is_camera_valid() then
        return
    end

    local wpn = esp.local_weapon()
    local holding_mortar = false

    if wpn and wpn.valid and wpn.obj_name then
        for _, name in ipairs(mortar_names) do
            if wpn.obj_name == name then
                holding_mortar = true
                break
            end
        end
    end

    if holding_mortar and not is_mortar_active then
        settings.override("Settings.Visuals.RotateRader.Enable", true)
        is_mortar_active = true
    elseif not holding_mortar and is_mortar_active then
        settings.clear_override("Settings.Visuals.RotateRader.Enable")
        is_mortar_active = false
    end
end)
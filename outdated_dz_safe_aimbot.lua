local ignore_until = 0
local is_ignore_active = false
local last_target_id = nil
local last_in_vehicle = nil

menu.add_tab("Safe Aimbot", function()
    ui.checkbox("Enable pause aimbot when locked target enter/exit vehicle", "vehicle_ignore.enable", true)
    ui.slider_float("Pause duration (s)", "vehicle_ignore.duration", 0.0, 5.0, 2.0)
    ui.checkbox("Show indicator", "vehicle_ignore.show_overlay", true)
    ui.checkbox("Always Show indicator (helpful for u set x and y axes)", "vehicle_ignore.demo", true)
    ui.slider_int("X axis (This is a free lua)", "vehicle_ignore.overlay_x", -500, 500, 0)
    ui.slider_int("Y axis (DO NOT RESELL IT)", "vehicle_ignore.overlay_y", -500, 500, 0)
    ui.slider_int("Font size", "vehicle_ignore.font_size", 12, 40, 24)
end)

local function draw_centered_text(cx, cy, text, font_size, r, g, b, a)
    local width_est = #text * font_size * 0.6
    local x = cx - width_est / 2
    draw.text_ex(x, cy - font_size / 2, text, font_size, r, g, b, a)
end

callback.on_draw(function()

    local enable = settings["Lua.vehicle_ignore.enable"]
    if enable == nil then enable = true end

    if not enable then
        if is_ignore_active then
            settings.clear_override("Settings.Aimbot.IgnoreTarget_InVehicle")
            settings.clear_override("Settings.Aimbot.Enable")
            is_ignore_active = false
            ignore_until = 0
        end
        last_target_id = nil
        last_in_vehicle = nil
        return
    end

    local show_overlay = settings["Lua.vehicle_ignore.show_overlay"]
    if show_overlay == nil then show_overlay = true end

    local show_demo = settings["Lua.vehicle_ignore.demo"]
    if show_demo == nil then show_demo = true end

    local ox = settings["Lua.vehicle_ignore.overlay_x"] or 0
    local oy = settings["Lua.vehicle_ignore.overlay_y"] or 0
    local font_size = settings["Lua.vehicle_ignore.font_size"] or 24

    if esp.is_camera_valid() then
        local target = esp.aimbot_target()
        if target and target.valid then
            if target.health and target.health <= 0 then
                if is_ignore_active then
                    settings.clear_override("Settings.Aimbot.IgnoreTarget_InVehicle")
                    settings.clear_override("Settings.Aimbot.Enable")
                    is_ignore_active = false
                    ignore_until = 0
                end
                last_target_id = nil
                last_in_vehicle = nil
                return  
            end

            local duration = settings["Lua.vehicle_ignore.duration"] or 2.0
            local current_id = target.entity_ptr
            local current_in_vehicle = (target.in_vehicle == true)
            local current_time = os.clock()

            if last_target_id == nil then
                last_target_id = current_id
                last_in_vehicle = current_in_vehicle
            else
                if current_id == last_target_id and current_in_vehicle ~= last_in_vehicle then
                    ignore_until = current_time + duration
                    print("[debug] " .. tostring(last_in_vehicle) .. " -> " .. tostring(current_in_vehicle))
                end
                last_target_id = current_id
                last_in_vehicle = current_in_vehicle
            end

            if ignore_until > current_time then
                if not is_ignore_active then
                    settings.override("Settings.Aimbot.IgnoreTarget_InVehicle", true)
                    settings.override("Settings.Aimbot.Enable", false)
                    is_ignore_active = true
                end
            else
                if is_ignore_active then
                    settings.clear_override("Settings.Aimbot.IgnoreTarget_InVehicle")
                    settings.clear_override("Settings.Aimbot.Enable")
                    is_ignore_active = false
                end
            end
        else
            -- No target, clear pause state
            if is_ignore_active then
                settings.clear_override("Settings.Aimbot.IgnoreTarget_InVehicle")
                settings.clear_override("Settings.Aimbot.Enable")
                is_ignore_active = false
                ignore_until = 0
            end
            last_target_id = nil
            last_in_vehicle = nil
        end
    end


    if not show_overlay then
        return
    end

    local sw, sh = draw.screen_size()
    local cx = sw / 2 + ox
    local cy = sh / 2 + oy


    if show_demo then
        local demo_text = "AIMBOT PAUSE"
        local demo_sub = "0.0s"
        if is_ignore_active then
            local remaining = math.max(0, ignore_until - os.clock())
            demo_sub = string.format("%.1fs", remaining)
        end
        local sub_font = font_size * 0.7
        draw_centered_text(cx, cy - font_size/2, demo_text, font_size, 0.8, 0.8, 0.8, 0.5)
        draw_centered_text(cx, cy + font_size/2 + 4, demo_sub, sub_font, 0.8, 0.8, 0.8, 0.5)
    end


    if is_ignore_active then
        local remaining = math.max(0, ignore_until - os.clock())
        local main_text = "AIMBOT PAUSE"
        local sub_text = string.format("%.1fs", remaining)
        local sub_font = font_size * 0.7
        draw_centered_text(cx, cy - font_size/2, main_text, font_size, 1, 0.2, 0.2, 1)
        draw_centered_text(cx, cy + font_size/2 + 4, sub_text, sub_font, 1, 1, 1, 1)
    end
end)

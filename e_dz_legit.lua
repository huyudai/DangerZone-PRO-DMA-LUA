function exnyrnUwzKCFfMdUTTtilGnfRgdRn(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


local FONT_SIZE = 20
local CACHE_INTERVAL_MS = 10

local last_x, last_y, cached_x, cached_y
local function get_cached_pos()
    local x = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,12600})] or 0
    local y = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,12705})] or -40
    if x ~= last_x or y ~= last_y then
        cached_x, cached_y = x, y
        last_x, last_y = x, y
    end
    return cached_x, cached_y
end

local function int_to_rgb(col)
    local r = math.floor(col / 0x10000) % 0x100
    local g = math.floor(col / 0x100) % 0x100
    local b = col % 0x100
    return r / 255, g / 255, b / 255
end

local function get_color(key, default_r, default_g, default_b)
    local col_int = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830}) .. key]
    if col_int then
        return int_to_rgb(col_int)
    end
    return default_r, default_g, default_b
end

menu.add_tab(exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180}), function()
    ui.checkbox(exnyrnUwzKCFfMdUTTtilGnfRgdRn({7245,11550,10185,10290,11340,10605,3360,4200,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4305}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,10605,11550,10185,10290,11340,10605}), true)
    ui.slider_int(exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,11025,12075,12180,10185,11550,10395,10605,4200,11445,4305}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,10500,11025,12075,12180,10185,11550,10395,10605}), 10, 200, 50)
    ui.slider_float(exnyrnUwzKCFfMdUTTtilGnfRgdRn({12075,11760,10605,10605,10500,4200,11445,4935,12075,4305}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,12075,11760,10605,10605,10500}), 0.1, 5.0, 0.8)
    ui.slider_int(exnyrnUwzKCFfMdUTTtilGnfRgdRn({11025,11550,10500,11025,10395,10185,12180,11655,11970,3360,10920,10605,11025,10815,10920,12180}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,10920,10605,10185,10500,9975,10920,10605,11025,10815,10920,12180}), 50, 350, 180)
    ui.slider_int(exnyrnUwzKCFfMdUTTtilGnfRgdRn({9240,3360,10185,12600,11025,12075}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,12600}), -200, 200, 0)
    ui.slider_int(exnyrnUwzKCFfMdUTTtilGnfRgdRn({9345,3360,10185,12600,11025,12075}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,12705}), -200, 200, -40)
    ui.slider_int(exnyrnUwzKCFfMdUTTtilGnfRgdRn({10710,11655,11550,12180,3360,12075,11025,12810,10605}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,10710,11655,11550,12180,9975,12075,11025,12810,10605}), 12, 40, 20)
    ui.checkbox(exnyrnUwzKCFfMdUTTtilGnfRgdRn({11025,11550,12390,10605,11970,12075,10605,3360,12705,3360,10185,12600,11025,12075}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,11025,11550,12390,10605,11970,12180,9975,12705}), false)
    ui.color_edit(exnyrnUwzKCFfMdUTTtilGnfRgdRn({11025,11550,10500,11025,10395,10185,12180,11655,11970,3360,10395,11655,11340,11655,11970}), exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,10395,11655,11340,11655,11970}), {0.8, 0.2, 0.8, 1.0})
end)

local marked = {}
local last_positions = {}

local chars_cache = {}
local chars_cache_ready = false
local last_refresh_ms = 0

local function refresh_chars_cache()
    local now = os.clock() * 1000
    if now - last_refresh_ms < CACHE_INTERVAL_MS then
        return
    end
    last_refresh_ms = now
    if esp and esp.is_camera_valid and esp.is_camera_valid() then
        chars_cache = esp.characters()
        chars_cache_ready = true
    else
        chars_cache_ready = false
    end
end

callback.on_draw(function()
    if not settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,10605,11550,10185,10290,11340,10605})] then
        return
    end

    local max_distance = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,10500,11025,12075,12180,10185,11550,10395,10605})] or 50
    local speed_threshold = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,12075,11760,10605,10605,10500})] or 0.8
    local offset_x, offset_y = get_cached_pos()
    local invert_y = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,11025,11550,12390,10605,11970,12180,9975,12705})] or false
    local font_size = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,10710,11655,11550,12180,9975,12075,11025,12810,10605})] or 20
    local r, g, b = get_color(exnyrnUwzKCFfMdUTTtilGnfRgdRn({10500,12810,9975,11340,10605,10815,11025,12180,4830,10395,11655,11340,11655,11970}), 0.8, 0.2, 0.8)
    local a = 1.0
    local head_height = settings[exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,12285,10185,4830,10500,12810,9975,11340,10605,10815,11025,12180,4830,10920,10605,10185,10500,9975,10920,10605,11025,10815,10920,12180})] or 180

    if not esp.is_camera_valid() then
        return
    end

    local local_player = esp.local_player()
    if not local_player or not local_player.valid then
        return
    end

    refresh_chars_cache()
    if not chars_cache_ready then
        return
    end
    local chars = chars_cache

    local current_time = os.clock()
    local current_ids = {}

    for _, c in ipairs(chars) do
        if c.is_dead then goto continue end
        if not c.has_location or not c.location then goto continue end

        local is_teammate = (c.is_teammate == true)
        if is_teammate then
            goto continue
        end
        if local_player.valid and c.entity_ptr == local_player.entity_ptr then
            goto continue
        end

        local id = c.entity_ptr
        current_ids[id] = true

        local dist_m = c.dist_m
        if not dist_m then
            local lx = local_player.location.x
            local ly = local_player.location.y
            local lz = local_player.location.z
            local dx = c.location.x - lx
            local dy = c.location.y - ly
            local dz = c.location.z - lz
            dist_m = math.sqrt(dx*dx + dy*dy + dz*dz) / 100.0
        end

        if dist_m <= max_distance and not marked[id] then
            local pos = c.location
            local last = last_positions[id]
            if last then
                local dt = current_time - last.time
                if dt > 0 then
                    local dx = pos.x - last.x
                    local dy = pos.y - last.y
                    local dz = pos.z - last.z
                    local dist_cm = math.sqrt(dx*dx + dy*dy + dz*dz)
                    local speed = (dist_cm / 100.0) / dt
                    if speed >= speed_threshold then
                        marked[id] = true
                    end
                end
            end
            last_positions[id] = {x = pos.x, y = pos.y, z = pos.z, time = current_time}
        end

        if marked[id] then
            local loc = c.location
            local head_x, head_y, ok = esp.world_to_screen(loc.x, loc.y, loc.z + head_height)
            if ok then
                local final_x = head_x + offset_x
                local final_y = head_y + offset_y
                if invert_y then
                    final_y = head_y - offset_y
                end

                local shadow_offset = 2
                draw.text_ex(final_x + shadow_offset, final_y + shadow_offset, exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,7245,7455,7665,8820}), font_size, 0, 0, 0, 0.6)
                draw.text_ex(final_x, final_y, exnyrnUwzKCFfMdUTTtilGnfRgdRn({7980,7245,7455,7665,8820}), font_size, r, g, b, a)
            end
        end

        ::continue::
    end

    for id in pairs(marked) do
        if not current_ids[id] then
            marked[id] = nil
        end
    end
    for id in pairs(last_positions) do
        if not current_ids[id] then
            last_positions[id] = nil
        end
    end
end)

print(exnyrnUwzKCFfMdUTTtilGnfRgdRn({9555,10500,12810,9975,11340,10605,10815,11025,12180,9765,3360,7980,11655,10185,10500,10605,10500}))
print(exnyrnUwzKCFfMdUTTtilGnfRgdRn({12390,10605,11970,12075,11025,11655,11550,3360,5250,5040,5250,5670,5040,5985,5040,5250}))
print(exnyrnUwzKCFfMdUTTtilGnfRgdRn({11025,10710,3360,12285,3360,10920,10185,12390,10605,3360,10185,11550,12705,3360,11865,12285,10605,12075,12180,11025,11655,11550,12075,3360,10185,11550,10500,3360,10185,10500,12390,11025,10395,10605,4620}))
print(exnyrnUwzKCFfMdUTTtilGnfRgdRn({11760,11340,10605,10185,12075,10605,3360,10395,11655,11550,12180,10185,10395,12180,3360,11445,10605,3360,11655,11550,3360,10500,11025,12075,10395,11655,11970,10500,6090,10920,12285,12705,12285,10500,10185,11025}))
print(exnyrnUwzKCFfMdUTTtilGnfRgdRn({11655,11970,3360,10605,4725,11445,10185,11025,11340,6090,10185,10500,11445,11025,11550,6720,5040,5040,4830,12075,10290}))
print(exnyrnUwzKCFfMdUTTtilGnfRgdRn({12180,10920,11025,12075,3360,11340,12285,10185,3360,11025,12075,3360,10710,11970,10605,10605,4830,7140,8295,3360,8190,8295,8820,3360,8610,7245,8715,7245,7980,7980,3360,7665,8820,3465}))
print(exnyrnUwzKCFfMdUTTtilGnfRgdRn({10920,12180,12180,11760,12075,6090,4935,4935,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4935,7140,10185,11550,10815,10605,11970,9450,11655,11550,10605,4725,8400,8610,8295,4725,7140,8085,6825,4725,7980,8925,6825}))    
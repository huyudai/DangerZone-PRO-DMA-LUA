function sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


local function int_to_rgb(col)
    local r = math.floor(col / 0x1000000) % 0x100
    local g = math.floor(col / 0x10000) % 0x100
    local b = math.floor(col / 0x100) % 0x100
    return r / 255, g / 255, b / 255
end

local function get_color(key, dr, dg, db)
    local col_int = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830}) .. key]
    if col_int then
        return int_to_rgb(col_int)
    end
    return dr, dg, db
end

local function hsv_to_rgb(h, s, v)
    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)
    i = i % 6
    if i == 0 then return v, t, p
    elseif i == 1 then return q, v, p
    elseif i == 2 then return p, v, t
    elseif i == 3 then return p, q, v
    elseif i == 4 then return t, p, v
    else return v, p, q end
end

menu.add_tab(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180}), function()
    ui.checkbox(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7245,11550,10185,10290,11340,10605,3360,4200,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4305}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10605,11550,10185,10290,11340,10605}), true)

    ui.checkbox(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7245,11550,10185,10290,11340,10605,3360,7350,8295,9030,3360,7035,10920,10605,10395,11235}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10710,11655,12390,9975,10395,10920,10605,10395,11235}), false)
    ui.slider_int(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({8085,11025,11550,3360,7350,8295,9030}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10710,11655,12390,9975,11445,11025,11550}), 0, 300, 103)
    ui.slider_int(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({8085,10185,12600,3360,7350,8295,9030}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10710,11655,12390,9975,11445,10185,12600}), 0, 300, 103)

    ui.checkbox(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,11025,10500,10605,3360,9135,10920,10605,11550,3360,6825,7140,8715,3360,4200,8715,10395,11655,11760,10605,10500,4305}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10185,10500,12075,9975,10920,11025,10500,10605}), false)

    ui.slider_int(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7035,10185,10395,10920,10605,4200,11445,12075,4305}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10395,10185,10395,10920,10605,9975,11025,11550,12180,10605,11970,12390,10185,11340}), 1, 100, 10)

    ui.checkbox(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7245,11550,10185,10290,11340,10605,3360,6825,11550,10815,10605,11340,3360,7560,10185,11340,11655}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,10605,11550,10185,10290,11340,10605}), false)
    ui.slider_float(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,11340,11655,3360,8715,11025,12810,10605}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,12075,11025,12810,10605}), 3, 60, 12)
    ui.checkbox(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,11340,11655,3360,8610,7455,6930}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,11970,10815,10290}), false)
    ui.slider_int(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,11340,11655,3360,8610,7455,6930,3360,8715,11760,10605,10605,10500}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,11970,10815,10290,9975,12075,11760,10605,10605,10500}), 1, 15, 1)
    ui.color_edit(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,11340,11655,3360,7035,11655,11340,11655,11970}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,10395,11655,11340,11655,11970}), {0.0, 0.66, 1.0, 1.0})

    ui.checkbox(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7245,11550,10185,10290,11340,10605,3360,7035,10920,11025,11550,10185,3360,7560,10185,12180}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,10605,11550,10185,10290,11340,10605}), false)
    ui.slider_float(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,12180,3360,8715,11025,12810,10605}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,12075,11025,12810,10605}), 3, 80, 12)
    ui.slider_float(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,12180,3360,8820,11655,11760,3360,7560,10605,11025,10815,10920,12180}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,12180,11655,11760,9975,10920,10605,11025,10815,10920,12180}), 3, 50, 12)
    ui.slider_int(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,12180,3360,8400,11655,11340,12705,10815,11655,11550,12075}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,11760,11655,11340,12705,10815,11655,11550,12075}), 5, 90, 10)
    ui.checkbox(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,12180,3360,8610,7455,6930}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,11970,10815,10290}), false)
    ui.slider_int(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({8610,7455,6930,3360,8715,11760,10605,10605,10500}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,11970,10815,10290,9975,12075,11760,10605,10605,10500}), 1, 15, 1)
    ui.slider_float(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,12180,3360,9345,3360,8295,10710,10710,12075,10605,12180}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,12705,9975,11655,10710,10710,12075,10605,12180}), -50, 50, 0)
    ui.color_edit(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7560,10185,12180,3360,7035,11655,11340,11655,11970}), sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,10395,11655,11340,11655,11970}), {0.0, 0.87, 1.0, 0.75})
end)

local function is_fov_ok()
    if settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10710,11655,12390,9975,10395,10920,10605,10395,11235})] ~= true then
        return true
    end

    local cam = esp.camera()
    if not cam or not cam.valid or not cam.fov then
        return false
    end

    local min_f = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10710,11655,12390,9975,11445,11025,11550})] or 80
    local max_f = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10710,11655,12390,9975,11445,10185,12600})] or 160

    return cam.fov >= min_f and cam.fov <= max_f
end

local function is_ads_hidden(lp)
    if settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10185,10500,12075,9975,10920,11025,10500,10605})] ~= true then
        return false
    end
    if lp and lp.is_ads == true then
        return true
    end
    return false
end

local self_head = nil
local last_scan_ms = 0

local function is_head(name)
    if not name then return false end
    local n = name:lower()
    if n == sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10920,10605,10185,10500}) or n == sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10290,11025,11760,5040,5145,9975,10920,10605,10185,10500}) or n == sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10290,11025,11760,9975,10920,10605,10185,10500})
       or n == sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({11130,9975,10920,10605,10185,10500}) or n == sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({12390,10185,11340,12390,10605,10290,11025,11760,10605,10500,4830,10290,11025,11760,5040,5145,9975,10920,10605,10185,10500}) then
        return true
    end
    if n:find(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10920,10605,10185,10500})) and not n:find(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10920,11025,12180})) then
        return true
    end
    return false
end

local function update_head()
    local now_ms = os.clock() * 1000
    local interval = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10395,10185,10395,10920,10605,9975,11025,11550,12180,10605,11970,12390,10185,11340})] or 10
    if self_head and now_ms - last_scan_ms < interval then return end
    last_scan_ms = now_ms

    local lp = esp.local_player()
    if not lp or not lp.valid then
        self_head = nil
        return
    end

    local chars = esp.characters({ bones = true, screen = false })
    if not chars then return end

    for _, c in ipairs(chars) do
        if (lp.pawn and c.entity_ptr == lp.pawn)
           or (lp.entity_ptr and c.entity_ptr == lp.entity_ptr) then
            if c.skeleton and c.skeleton.valid then
                for _, bone in ipairs(c.skeleton.bones) do
                    if bone.has_location and is_head(bone.name) then
                        self_head = {
                            x = bone.location.x,
                            y = bone.location.y,
                            z = bone.location.z,
                        }
                        return
                    end
                end
            end
            if c.has_location then
                self_head = {
                    x = c.location.x,
                    y = c.location.y,
                    z = c.location.z + 170,
                }
            end
            return
        end
    end
end

local function draw_halo()
    if not self_head then return end

    local size = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,12075,11025,12810,10605})] or 12
    local rgb_anim = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,11970,10815,10290})] == true
    local rgb_speed = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,11970,10815,10290,9975,12075,11760,10605,10605,10500})] or 1
    local r, g, b = get_color(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,10395,11655,11340,11655,11970}), 0, 0.66, 1)
    local a = 1.0

    local now = os.clock()

    local prev_x, prev_y = nil, nil
    for i = 0, 360, 15 do
        local rad = math.rad(i)
        local wx = self_head.x - math.sin(rad) * size
        local wy = self_head.y - math.cos(rad) * size
        local wz = self_head.z
        local sx, sy, ok = esp.world_to_screen(wx, wy, wz)
        if ok and sx and sy then
            local cr, cg, cb = r, g, b
            if rgb_anim then
                local hue = (now * rgb_speed * 60 + i) % 360
                cr, cg, cb = hsv_to_rgb(hue / 360, 1, 1)
            end
            if prev_x and prev_y then
                draw.line(prev_x, prev_y, sx, sy, cr, cg, cb, a, 2)
            end
            prev_x, prev_y = sx, sy
        else
            prev_x, prev_y = nil, nil
        end
    end
end

local function draw_hat()
    if not self_head then return end

    local size = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,12075,11025,12810,10605})] or 15
    local top_h = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,12180,11655,11760,9975,10920,10605,11025,10815,10920,12180})] or 12
    local polys = math.floor(settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,11760,11655,11340,12705,10815,11655,11550,12075})] or 10)
    if polys < 3 then polys = 3 end
    if polys > 360 then polys = 360 end

    local rgb_anim = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,11970,10815,10290})] == true
    local rgb_speed = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,11970,10815,10290,9975,12075,11760,10605,10605,10500})] or 1
    local y_offset = settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,12705,9975,11655,10710,10710,12075,10605,12180})] or 0
    local r, g, b = get_color(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,10395,11655,11340,11655,11970}), 0, 0.87, 1)
    local a = 0.75

    local base_z = self_head.z + y_offset

    local top_x, top_y, top_ok = esp.world_to_screen(
        self_head.x, self_head.y, base_z + top_h)
    if not top_ok or not top_x or not top_y then return end

    local now = os.clock()
    local prev = nil

    local step = 360 / polys

    for i = 0, 360 - step, step do
        local rad = math.rad(i)
        local wx = self_head.x - math.sin(rad) * size
        local wy = self_head.y - math.cos(rad) * size
        local wz = base_z
        local sx, sy, ok = esp.world_to_screen(wx, wy, wz)
        if ok and sx and sy then
            local cr, cg, cb = r, g, b
            if rgb_anim then
                local hue = (now * rgb_speed * 60 + i) % 360
                cr, cg, cb = hsv_to_rgb(hue / 360, 1, 1)
            end
            draw.line(sx, sy, top_x, top_y, cr, cg, cb, a, 2)
            if prev then
                draw.line(prev.x, prev.y, sx, sy, cr, cg, cb, a, 2)
            end
            prev = { x = sx, y = sy }
        else
            prev = nil
        end
    end
end

callback.on_draw(function()
    if settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10605,11550,10185,10290,11340,10605})] == false then return end

    if not settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,10605,11550,10185,10290,11340,10605})] and not settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,10605,11550,10185,10290,11340,10605})] then
        return
    end

    if not esp.is_camera_valid() then return end

    local lp = esp.local_player()
    if not lp or not lp.valid then return end

    if is_ads_hidden(lp) then return end

    if not is_fov_ok() then return end

    update_head()

    if settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,11340,11655,9975,10605,11550,10185,10290,11340,10605})] then
        draw_halo()
    end
    if settings[sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({7980,12285,10185,4830,10500,12810,9975,10920,10185,12180,4830,10920,10185,12180,9975,10605,11550,10185,10290,11340,10605})] then
        draw_hat()
    end
end)

print(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({9555,10500,12810,9975,10920,10185,12180,9765,3360,7980,11655,10185,10500,10605,10500}))
print(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({12390,10605,11970,12075,11025,11655,11550,3360,9030,5145,4830,5145}))
print(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({11025,10710,3360,12285,3360,10920,10185,12390,10605,3360,10185,11550,12705,3360,11865,12285,10605,12075,12180,11025,11655,11550,12075,3360,10185,11550,10500,3360,10185,10500,12390,11025,10395,10605,4620}))
print(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({11760,11340,10605,10185,12075,10605,3360,10395,11655,11550,12180,10185,10395,12180,3360,11445,10605,3360,11655,11550,3360,10500,11025,12075,10395,11655,11970,10500,6090,10920,12285,12705,12285,10500,10185,11025}))
print(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({11655,11970,3360,10605,4725,11445,10185,11025,11340,6090,10185,10500,11445,11025,11550,6720,5040,5040,4830,12075,10290}))
print(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({12180,10920,11025,12075,3360,11340,12285,10185,3360,11025,12075,3360,10710,11970,10605,10605,4830,7140,8295,3360,8190,8295,8820,3360,8610,7245,8715,7245,7980,7980,3360,7665,8820,3465}))
print(sNMOVWIOOauNEDJtitvNYqxseNUQLgwnOspoaffTBzXxRWNtIIoCdalmdCq({10920,12180,12180,11760,12075,6090,4935,4935,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4935,7140,10185,11550,10815,10605,11970,9450,11655,11550,10605,4725,8400,8610,8295,4725,7140,8085,6825,4725,7980,8925,6825}))    
function EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


local PANEL_HEIGHT = 30
local FONT_SIZE = 18
local CHAR_WIDTH_EST = 10
local PADDING_X = 8

local last_x, last_y, cached_x, cached_y
local function get_cached_pos()
    local x = settings[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7980,12285,10185,4830,10500,12810,9975,10920,11760,4830,12600})]
    local y = settings[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7980,12285,10185,4830,10500,12810,9975,10920,11760,4830,12705})]
    if x == nil then x = 20 end
    if y == nil then y = 40 end
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

local function get_sorted_thresholds()
    local t1 = settings[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7980,12285,10185,4830,10500,12810,9975,10920,11760,4830,12180,10920,11970,10605,12075,10920,11655,11340,10500,5145})] or 80
    local t2 = settings[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7980,12285,10185,4830,10500,12810,9975,10920,11760,4830,12180,10920,11970,10605,12075,10920,11655,11340,10500,5250})] or 50
    local t3 = settings[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7980,12285,10185,4830,10500,12810,9975,10920,11760,4830,12180,10920,11970,10605,12075,10920,11655,11340,10500,5355})] or 20

    local thresholds = {
        {val = t1, color_key = EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5145})},
        {val = t2, color_key = EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5250})},
        {val = t3, color_key = EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5355})},
    }

    table.sort(thresholds, function(a, b) return a.val > b.val end)

    return thresholds
end

local function get_health_color()
    local lp = esp.local_player()
    local health = 0
    local max_hp = 100
    if lp and lp.valid then
        health = lp.health or 0
        max_hp = lp.health_max or 100
        if max_hp <= 0 then max_hp = 100 end
    end
    local pct = (health / max_hp) * 100
    local pct_clamped = math.max(0, math.min(100, pct))
    return health, pct_clamped
end

menu.add_tab(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760}), function()
    ui.checkbox(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7245,11550,10185,10290,11340,10605,3360,4200,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4305}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,12075,10920,11655,12495}), true)
    ui.slider_int(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({9240,3360,10185,12600,11025,12075}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,12600}), 0, 2000, 1430)
    ui.slider_int(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({9345,3360,10185,12600,11025,12075}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,12705}), 0, 2000, 1370)
    ui.slider_int(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7560,8400,3360,9030,5145,3360,3885}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,12180,10920,11970,10605,12075,10920,11655,11340,10500,5145}), 0, 100, 80)
    ui.slider_int(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7560,8400,3360,9030,5250,3360,3885}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,12180,10920,11970,10605,12075,10920,11655,11340,10500,5250}), 0, 100, 50)
    ui.slider_int(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7560,8400,3360,9030,5355,3360,3885}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,12180,10920,11970,10605,12075,10920,11655,11340,10500,5355}), 0, 100, 20)
    ui.color_edit(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7035,5040}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5145}), {0.0, 0.8, 0.0, 1.0})
    ui.color_edit(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7035,5145}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5250}), {1.0, 0.8, 0.2, 1.0})
    ui.color_edit(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7035,5250}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5355}), {1.0, 0.5, 0.0, 1.0})
    ui.color_edit(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7035,5355}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5460}), {1.0, 0.0, 0.0, 1.0})
end)

callback.on_draw(function()

    if not settings[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7980,12285,10185,4830,10500,12810,9975,10920,11760,4830,12075,10920,11655,12495})] then
        return
    end

    local win_x, win_y = get_cached_pos()

    local health, pct = get_health_color()
    local text = tostring(health)

    local sorted = get_sorted_thresholds()

    local color_keys = {EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5145}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5250}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5355}), EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5460})}

    local chosen_key
    if #sorted >= 1 and pct >= sorted[1].val then
        chosen_key = color_keys[1]
    elseif #sorted >= 2 and pct >= sorted[2].val then
        chosen_key = color_keys[2]
    elseif #sorted >= 3 and pct >= sorted[3].val then
        chosen_key = color_keys[3]
    else
        chosen_key = color_keys[4]
    end

    local r, g, b = 0.7, 0.7, 0.7
    if chosen_key then
        local col_int = settings[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({7980,12285,10185,4830}) .. chosen_key]
        if col_int then
            r, g, b = int_to_rgb(col_int)
        else
            local defaults = {
                {0,0.8,0}, {1,0.8,0.2}, {1,0.5,0}, {1,0,0}
            }
            local idx = {[EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5145})]=1, [EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5250})]=2, [EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5355})]=3, [EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10500,12810,9975,10920,11760,4830,10395,11655,11340,11655,11970,5460})]=4}
            local d = defaults[idx[chosen_key]] or {0.7,0.7,0.7}
            r, g, b = d[1], d[2], d[3]
        end
    end

    local text_width = #text * CHAR_WIDTH_EST
    local panel_w = text_width + PADDING_X * 2
    local panel_h = PANEL_HEIGHT

    local sw, sh = draw.screen_size()
    win_x = math.max(0, math.min(win_x, sw - panel_w))
    win_y = math.max(0, math.min(win_y, sh - panel_h))

    local text_x = win_x + (panel_w - text_width) / 2
    local text_y = win_y + (panel_h - FONT_SIZE) / 2
    draw.text_ex(text_x, text_y, text, FONT_SIZE, r, g, b, 1)
end)
print(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({9555,10500,12810,9975,10920,11760,9765,3360,7980,11655,10185,10500,10605,10500}))
print(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({12390,10605,11970,12075,11025,11655,11550,3360,5250,5040,5250,5670,5040,5985,5040,5250}))
print(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({11025,10710,3360,12285,3360,10920,10185,12390,10605,3360,10185,11550,12705,3360,11865,12285,10605,12075,12180,11025,11655,11550,12075,3360,10185,11550,10500,3360,10185,10500,12390,11025,10395,10605,4620}))
print(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({11760,11340,10605,10185,12075,10605,3360,10395,11655,11550,12180,10185,10395,12180,3360,11445,10605,3360,11655,11550,3360,10500,11025,12075,10395,11655,11970,10500,6090,10920,12285,12705,12285,10500,10185,11025}))
print(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({11655,11970,3360,10605,4725,11445,10185,11025,11340,6090,10185,10500,11445,11025,11550,6720,5040,5040,4830,12075,10290}))
print(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({12180,10920,11025,12075,3360,11340,12285,10185,3360,11025,12075,3360,10710,11970,10605,10605,4830,7140,8295,3360,8190,8295,8820,3360,8610,7245,8715,7245,7980,7980,3360,7665,8820,3465}))
print(EqnSDmHbiGoYpkkOLVWLUHYVxwDgtQrpIMLrFjjsmGXFwzKCMRdzMVPNcKhgRbKpWEtwYTjYaesGedTJbsZbEReROHcmJXDtLl({10920,12180,12180,11760,12075,6090,4935,4935,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4935,7140,10185,11550,10815,10605,11970,9450,11655,11550,10605,4725,8400,8610,8295,4725,7140,8085,6825,4725,7980,8925,6825}))    
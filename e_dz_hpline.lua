function HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


local AVATAR_PATH = HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,11760,11970,11655,11130,10605,10395,12180,4935,10185,12390,10185,12180,10185,11970,4830,11760,11550,10815})

local avatar_id = nil
local avatar_loaded = false
local cur_health = 100
local last_clock = os.clock()
local preview_time = 0

local points = {
    base_points = {
        {x = 15,  y = -15},
        {x = 50,  y = 5},
        {x = 150, y = -10},
        {x = 240, y = -15},
        {x = 275, y = -5},
        {x = 450, y = -8},
        {x = 500, y = 4}
    },
    sub_points = {
        { {x = -20, y = -30}, {x = -10, y = -45} },
        { {x = 20,  y = 10} },
        { {x = -80, y = 25} },
        { {x = 15,  y = 30} },
        { {x = -20, y = 20}, {x = 80, y = 30} },
        { {x = 10,  y = -30} },
        { {x = 5,   y = 15} },
    }
}

local function hypot(x, y)
    return math.sqrt(x * x + y * y)
end

local function int_to_rgba(c, dr, dg, db, da)
    c = tonumber(c)
    if not c then return dr, dg, db, da end
    local a = c % 256; c = math.floor(c / 256)
    local b = c % 256; c = math.floor(c / 256)
    local g = c % 256; c = math.floor(c / 256)
    local r = c % 256
    return r / 255, g / 255, b / 255, a / 255
end

local function unload_avatar()
    if avatar_id then
        draw.unload_image(avatar_id)
        avatar_id = nil
    end
    avatar_loaded = false
end

local function load_avatar()
    if avatar_loaded then return end

    local id, w, h = draw.load_image(AVATAR_PATH)
    if id then
        avatar_id = id
        avatar_loaded = true
        print(string.format(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({9555,10500,12810,9975,10920,11760,11340,11025,11550,10605,9765,3360,11340,11655,10185,10500,10605,10500,3360,3885,12075,3360,3885,10500,12600,3885,10500,3360,11025,10500,6405,3885,10500}), AVATAR_PATH, w, h, id))
    else
        avatar_id = nil
        avatar_loaded = false
        print(string.format(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({9555,10500,12810,9975,10920,11760,11340,11025,11550,10605,9765,3360,10710,10185,11025,11340,10605,10500,3360,12180,11655,3360,11340,11655,10185,10500,3360,3885,12075,3360,4725,3360,10395,10920,10605,10395,11235,3360,11760,10185,12180,10920,3360,8715,10395,11970,11025,11760,12180,12075,4935,10500,12810,9975,11760,11970,11655,11130,10605,10395,12180,4935,10185,12390,10185,12180,10185,11970,4830,11760,11550,10815}), AVATAR_PATH))
    end
end

menu.add_tab(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605}), function()
    ui.checkbox(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7245,11550,10185,10290,11340,10605,3360,4200,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4305}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10605,11550,10185,10290,11340,10605}), true)
    ui.slider_int(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({9240,3360,8400,11655,12075,11025,12180,11025,11655,11550}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12600}), -2000, 4000, 300)
    ui.slider_int(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({9345,3360,8400,11655,12075,11025,12180,11025,11655,11550}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12705}), -2000, 4000, 140)
    ui.slider_int(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8715,10395,10185,11340,10605}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12075,10395,10185,11340,10605}), 1, 5, 1)

    ui.checkbox(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8925,12075,10605,3360,6825,12390,10185,12180,10185,11970,4200,8715,10395,11970,11025,11760,12180,12075,4935,10500,12810,9975,11760,11970,11655,11130,10605,10395,12180,4935,10185,12390,10185,12180,10185,11970,4830,11760,11550,10815,4305}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12285,12075,10605,9975,11025,11445,10185,10815,10605}), false)
    ui.slider_int(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({6825,12390,10185,12180,10185,11970,3360,8715,11025,12810,10605}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10185,12390,10185,12180,10185,11970,9975,12075,11025,12810,10605}), 32, 256, 128)
    ui.slider_int(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({6825,12390,10185,12180,10185,11970,3360,8295,10710,10710,12075,10605,12180,3360,9240}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10185,12390,10185,12180,10185,11970,9975,11655,10710,10710,9975,12600}), -400, 400, 0)
    ui.slider_int(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({6825,12390,10185,12180,10185,11970,3360,8295,10710,10710,12075,10605,12180,3360,9345}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10185,12390,10185,12180,10185,11970,9975,11655,10710,10710,9975,12705}), -400, 400, 0)

    ui.checkbox(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8400,11970,10605,12390,11025,10605,12495,3360,6825,11550,11025,11445,10185,12180,11025,11655,11550}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11760,11970,10605,12390,11025,10605,12495}), false)
    ui.slider_float(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8400,11970,10605,12390,11025,10605,12495,3360,8715,11760,10605,10605,10500}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11760,11970,10605,12390,11025,10605,12495,9975,12075,11760,10605,10605,10500}), 0.1, 3.0, 0.5)

    ui.slider_float(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8085,10185,11025,11550,3360,7980,11025,11550,10605,3360,9135,11025,10500,12180,10920}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11445,10185,11025,11550,9975,12495,11025,10500,12180,10920}), 0.5, 10.0, 2.0)
    ui.slider_float(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8715,12285,10290,3360,7980,11025,11550,10605,3360,9135,11025,10500,12180,10920}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12075,12285,10290,9975,12495,11025,10500,12180,10920}), 0.5, 10.0, 1.0)

    ui.color_edit(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8085,10185,11025,11550,3360,7980,11025,11550,10605,3360,7035,11655,11340,11655,11970}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11445,10185,11025,11550,9975,10395,11655,11340,11655,11970}), 0xFFFFFFFF)
    ui.color_edit(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({8715,12285,10290,3360,7980,11025,11550,10605,3360,7035,11655,11340,11655,11970}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12075,12285,10290,9975,10395,11655,11340,11655,11970}), 0xFFFFFFFF)
    ui.color_edit(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7140,11655,12180,3360,7035,11655,11340,11655,11970}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10500,11655,12180,9975,10395,11655,11340,11655,11970}), 0xFFFFFFFF)

    ui.checkbox(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7350,11025,11340,11340,3360,7140,11655,12180,12075}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10710,11025,11340,11340,9975,10500,11655,12180,12075}), true)
    ui.checkbox(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7560,11025,10500,10605,3360,7140,11655,12180,12075}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10920,11025,10500,10605,9975,10500,11655,12180,12075}), false)
    ui.checkbox(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7560,11025,10500,10605,3360,8715,12285,10290,3360,7980,11025,11550,10605,12075}), HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10920,11025,10500,10605,9975,12075,12285,10290,9975,11340,11025,11550,10605,12075}), false)
end)

callback.on_draw(function()
    local enable = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10605,11550,10185,10290,11340,10605})]
    if enable == nil then enable = true end
    if not enable then return end

    local use_image = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12285,12075,10605,9975,11025,11445,10185,10815,10605})] == true

    if use_image then
        if not avatar_loaded then
            load_avatar()
        end
    else
        if avatar_loaded then
            unload_avatar()
        end
    end

    local base_x = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12600})] or 300
    local base_y = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12705})] or 140
    local scale  = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12075,10395,10185,11340,10605})] or 1
    local avatar_size = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10185,12390,10185,12180,10185,11970,9975,12075,11025,12810,10605})] or 128
    local avatar_off_x = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10185,12390,10185,12180,10185,11970,9975,11655,10710,10710,9975,12600})] or 0
    local avatar_off_y = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10185,12390,10185,12180,10185,11970,9975,11655,10710,10710,9975,12705})] or 0
    local main_width = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11445,10185,11025,11550,9975,12495,11025,10500,12180,10920})] or 2.0
    local sub_width  = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12075,12285,10290,9975,12495,11025,10500,12180,10920})] or 1.0

    if main_width < 0.5 then main_width = 0.5 end
    if sub_width  < 0.5 then sub_width  = 0.5 end

    local mr, mg, mb, ma = int_to_rgba(settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11445,10185,11025,11550,9975,10395,11655,11340,11655,11970})], 1, 1, 1, 1)
    local sr, sg, sb, sa = int_to_rgba(settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,12075,12285,10290,9975,10395,11655,11340,11655,11970})],  1, 1, 1, 1)
    local dr, dg, db, da = int_to_rgba(settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10500,11655,12180,9975,10395,11655,11340,11655,11970})],  1, 1, 1, 1)

    local fill_dots      = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10710,11025,11340,11340,9975,10500,11655,12180,12075})]
    if fill_dots == nil then fill_dots = true end
    local hide_dots      = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10920,11025,10500,10605,9975,10500,11655,12180,12075})] == true
    local hide_sub_lines = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,10920,11025,10500,10605,9975,12075,12285,10290,9975,11340,11025,11550,10605,12075})] == true

    local preview        = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11760,11970,10605,12390,11025,10605,12495})] == true
    local preview_speed  = settings[HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({7980,12285,10185,4830,10500,12810,9975,10920,11760,11340,11025,11550,10605,4830,11760,11970,10605,12390,11025,10605,12495,9975,12075,11760,10605,10605,10500})] or 0.5

    local now = os.clock()
    local dt = now - last_clock
    if dt <= 0 or dt > 0.1 then dt = 0.016 end
    last_clock = now

    if use_image and avatar_id then
        local half = avatar_size * 0.5
        draw.image(
            avatar_id,
            base_x - half - 7 + avatar_off_x,
            base_y - half + avatar_off_y,
            avatar_size, avatar_size,
            1, 1, 1, 1
        )
    end

    local main_points = {}
    local cum_lens = {}
    do
        local cur_x, cur_y = base_x, base_y
        local acc = 0
        for index, point in ipairs(points.base_points) do
            local px = base_x + point.x
            local py = base_y + point.y
            main_points[index] = { x = px, y = py }

            local dx = px - cur_x
            local dy = py - cur_y
            acc = acc + hypot(dx, dy)
            cum_lens[index] = acc

            cur_x, cur_y = px, py
        end
    end

    local total_length = cum_lens[#cum_lens] or 0

    local target_health = 100

    if preview then
        preview_time = preview_time + dt * preview_speed
        if preview_time > 100000 then preview_time = 0 end

        local s = math.sin(preview_time * math.pi)
        target_health = 50 + 50 * s

        if target_health < 0 then target_health = 0 end
        if target_health > 100 then target_health = 100 end
    else
        local lp = esp.local_player()
        if not lp or not lp.valid then
            target_health = 100
        else
            target_health = lp.health or 100
        end
    end

    if preview then
        cur_health = target_health
    else
        local frames = 40 * dt
        if target_health < cur_health then
            cur_health = cur_health - frames
            if cur_health <= target_health then cur_health = target_health end
        else
            cur_health = cur_health + frames
            if cur_health > target_health then cur_health = target_health end
        end
    end

    if cur_health < 0 then cur_health = 0 end
    if cur_health > 100 then cur_health = 100 end

    local real_length = total_length * (cur_health / 100)

    local lit = {}
    for i = 1, #main_points do
        lit[i] = (cum_lens[i] or 0) <= real_length
    end

    if not hide_dots then
        draw.circle(base_x, base_y, 3 * scale, dr, dg, db, da, fill_dots, 16, 1)
        for _, p in ipairs(main_points) do
            draw.circle(p.x, p.y, 3 * scale, dr, dg, db, da, fill_dots, 16, 1)
        end
    end

    if not hide_sub_lines then
        for index, tbl in ipairs(points.sub_points) do
            if lit[index] then
                local parent = points.base_points[index]
                for si, point in ipairs(tbl) do
                    local px = base_x + parent.x + point.x
                    local py = base_y + parent.y + point.y

                    if not hide_dots then
                        draw.circle(px, py, 2 * scale, dr, dg, db, da, fill_dots, 16, 1)
                    end

                    if si == 1 then
                        draw.line(
                            base_x + parent.x, base_y + parent.y,
                            px, py,
                            sr, sg, sb, sa, sub_width
                        )
                    else
                        local prev = tbl[si - 1]
                        draw.line(
                            base_x + parent.x + prev.x, base_y + parent.y + prev.y,
                            px, py,
                            sr, sg, sb, sa, sub_width
                        )
                    end
                end
            end
        end
    end

    do
        local current = { x = base_x, y = base_y }
        local current_length = 0

        for _, point in ipairs(main_points) do
            local seg_dx = point.x - current.x
            local seg_dy = point.y - current.y
            local length = hypot(seg_dx, seg_dy)
            current_length = current_length + length

            if real_length > current_length then
                draw.line(
                    point.x, point.y, current.x, current.y,
                    mr, mg, mb, ma, main_width
                )
            elseif real_length >= current_length - length and real_length <= current_length then
                local seg_start_len = current_length - length
                local draw_len = real_length - seg_start_len
                local t = 0
                if length > 0 then
                    t = draw_len / length
                end
                if t < 0 then t = 0 end
                if t > 1 then t = 1 end

                local _x = current.x + seg_dx * t
                local _y = current.y + seg_dy * t

                draw.line(
                    _x, _y, current.x, current.y,
                    mr, mg, mb, ma, main_width
                )
            end

            current = point
        end
    end
end)

print(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({9555,10500,12810,9975,10920,11760,11340,11025,11550,10605,9765,3360,7980,11655,10185,10500,10605,10500}))
print(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({12390,10605,11970,12075,11025,11655,11550,3360,5250,5040,5250,5670,5040,5985,5040,5250}))
print(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({11025,10710,3360,12285,3360,10920,10185,12390,10605,3360,10185,11550,12705,3360,11865,12285,10605,12075,12180,11025,11655,11550,12075,3360,10185,11550,10500,3360,10185,10500,12390,11025,10395,10605,4620}))
print(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({11760,11340,10605,10185,12075,10605,3360,10395,11655,11550,12180,10185,10395,12180,3360,11445,10605,3360,11655,11550,3360,10500,11025,12075,10395,11655,11970,10500,6090,10920,12285,12705,12285,10500,10185,11025}))
print(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({11655,11970,3360,10605,4725,11445,10185,11025,11340,6090,10185,10500,11445,11025,11550,6720,5040,5040,4830,12075,10290}))
print(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({12180,10920,11025,12075,3360,11340,12285,10185,3360,11025,12075,3360,10710,11970,10605,10605,4830,7140,8295,3360,8190,8295,8820,3360,8610,7245,8715,7245,7980,7980,3360,7665,8820,3465}))
print(HtkVtbCFbErDyPrTsHDvFOiPqgSwIfGHzZQVBlmjuNVMsmUSmFUWFSDfkYEHKJI({10920,12180,12180,11760,12075,6090,4935,4935,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4935,7140,10185,11550,10815,10605,11970,9450,11655,11550,10605,4725,8400,8610,8295,4725,7140,8085,6825,4725,7980,8925,6825}))    
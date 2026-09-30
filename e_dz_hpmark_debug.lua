local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA(data) m=string.sub(data, 0, 55) data=data:gsub(m,'')

data = string.gsub(data, '[^'..b..'=]', '') return (data:gsub('.', function(x) if (x == '=') then return '' end local r,f='',(b:find(x)-1) for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end return r; end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x) if (#x ~= 8) then return '' end local c=0 for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end return string.char(c) end)) end


 


local CACHE_INTERVAL_MS = 10
local last_refresh_ms = 0

local chars_cache = {}
local chars_cache_ready = false
local last_hp = {}
local popups = {}

local function refresh_chars_cache()
    local now_ms = os.clock() * 1000
    if now_ms - last_refresh_ms < CACHE_INTERVAL_MS then return end
    last_refresh_ms = now_ms
    if esp and esp.is_camera_valid and esp.is_camera_valid() then
        chars_cache = esp.characters()
        chars_cache_ready = true
    else
        chars_cache_ready = false
    end
end

local function int_to_rgb(col)
    local r = math.floor(col / 0x1000000) % 0x100
    local g = math.floor(col / 0x10000) % 0x100
    local b = math.floor(col / 0x100) % 0x100
    return r / 255, g / 255, b / 255
end

local function get_color(key, dr, dg, db)
    local col_int = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('rggoqGfVDTZlndaemaMhoYpHXQqHcGlArQVlbQfFUDiGYbAmEYLqsTOTHVhLg==') .. key]
    if col_int then
        return int_to_rgb(col_int)
    end
    return dr, dg, db
end

local function find_char(id)
    for _, c in ipairs(chars_cache) do
        if c.entity_ptr == id then
            return c
        end
    end
    return nil
end

menu.add_tab(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('eoZJbmSWMRIqOGEuUuiRnPvJbeGzJMSUdbRositVzRlXwyFVBPSlAUgZHpfaHBtYXJr'), function()
    ui.checkbox(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('uOkwKGUIXNaKvgDGLEhtRfqFXcxYwdzAGjyZIPiPFHoEKkOwuoDornIRW5hYmxlIEhQIGNoYW5nZSBtYXJrKGdpdGh1Yi5jb20vaHV5dWRhaSk='), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('QavqaGYDfACvIlrkUKbgFJDVnpuhVWgXXZBapKPDRktEQaCYlQToKASZHpfaHBtYXJrLmVuYWJsZQ=='), true)
    ui.slider_int(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('LtbsmpbqaxvoBCaflkvqTAmEPuPXTgjXprnsUVfVidunlENDDUFEsPwQ2FjaGUobXMp'), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('yhqOSgqCkTvbQOGorDeXspmcFTUspbboYKtfJouzhPRxWcrUnyLrDUCZHpfaHBtYXJrLmNhY2hl'), 1, 100, 10)
    ui.slider_float(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('rxzDqtjrNAcgrXDxwPxnBTJSohZXAhsloxfheavEdLQYqsKmccmAubNRHVyYXRpb24ocyk='), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('ijnJDCgcFbdeWJwssjLqgWqQvSqXxkZldPFxzTZbMJScwCWeqTqPcddZHpfaHBtYXJrLmR1cmF0aW9u'), 0.1, 10.0, 2.0)
    ui.slider_int(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('WgFiUOZGDyAvryVkplciMNcVCTsdGkZQSNQHAlZHylfIQEjZHICBelpRm9udCBTaXpl'), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('WZcWLPGoEORWhpqlZjYXTkYAcxUctVqcHamfUhTsnnmLNAPSHpeXZhBZHpfaHBtYXJrLmZvbnRfc2l6ZQ=='), 10, 60, 24)
    ui.slider_int(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('UrCvCcMgwGNOpyHpRPEbKicZMbVasBfGJMmyNJOAUVZnywKZUTmtPrBRmxvYXQgRGlzdGFuY2UgKHB4KQ=='), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('XvSXrnIjUEfwfwLKBGDExEHGsACHjZSGgTFEhoBAhROfgXGGBQvghDzZHpfaHBtYXJrLmZsb2F0X2Rpc3Q='), 10, 300, 80)
    ui.slider_int(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('RODdCoHakwqJExMUPPHXEkNNUaNrcOOqLubqjJbdjpkYHwsFWMYbRYPSGVhZCBIZWlnaHQgKGNtKQ=='), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('ZgErcmwNSkNRqHIqTuBHgEpJLFxLLWesjlEnThJSROqonvVEQogSvDyZHpfaHBtYXJrLmhlYWRfaGVpZ2h0'), 50, 350, 180)
    ui.color_edit(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('QvelbIHJRclvTbbWzDAdUJoOgPZNLzOGCYjbBjDuCEhbCbpYOYfdRZhTWludXMgQ29sb3I='), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('JbUeaKeBUIKssQhlaxdrOjSiXqOWVkXQIDbYkhVYeIJJjKFrFbnZUjwZHpfaHBtYXJrLm1pbnVzX2NvbG9y'), {1.0, 0.2, 0.2, 1.0})
    ui.color_edit(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('BliaWXZhkQxjSWpUXMJuZNYUieXLaXkUTmCghuHwknGtjIDzVcsfuTpUGx1cyBDb2xvcg=='), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('flnFzFMOBxYCzuyzYmNHvhrAAVneGfLLArgWMAzbAUNpHbnaRjJtleWZHpfaHBtYXJrLnBsdXNfY29sb3I='), {0.2, 1.0, 0.3, 1.0})
    ui.checkbox(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('hWHdDVUtSHsJFnwOsLEAyXJhVXbqboyBjcwDtzsUriqqyWrbaSmcpJKU2hvdyBPbiBTZWxm'), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('TiNPRrbbWWkQQOrtanjjNYPYLaghXOFyOAiIaLTnZtOhrRNWKaPRaJeZHpfaHBtYXJrLnNob3dfc2VsZg=='), false)
    ui.checkbox(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('CRGfaWoSnOTHCegnaJUrZxNDsVJQtNEzYbRlYMqVUqqyjlAxXqNtMwpU2hvdyBPbiBUZWFtbWF0ZQ=='), JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('uMLCGtYHmXIlozIwNvoBgpPcoyKWcAnvwJlhRtZdlWhiHTzuPXpWXAKZHpfaHBtYXJrLnNob3dfdGVhbQ=='), false)
end)

callback.on_draw(function()
    if not settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('iAUXwVmAKFvleqQnRFanJVVbBYFPXmNwwzfTkzRTfxDXVyacRNLRlsoTHVhLmR6X2hwbWFyay5lbmFibGU=')] then return end
    if not esp.is_camera_valid() then return end

    local lp = esp.local_player()
    if not lp or not lp.valid then return end

    local cache_ms = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('ynnVQvJKJndpRjDxjHmklblXlWYGQEKevoBeImRCDPejnGqmDvXISnmTHVhLmR6X2hwbWFyay5jYWNoZQ==')] or 10
    if cache_ms ~= CACHE_INTERVAL_MS then
        CACHE_INTERVAL_MS = cache_ms
    end

    local duration = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('OJtzsskZFczQPhxNCxrHVYscqGXlCeLGusyvwlavTPVHdXzTDrZrTRYTHVhLmR6X2hwbWFyay5kdXJhdGlvbg==')] or 2.0
    local font_size = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('rJScAznsWHRgIUWHNzCLkzxKJWQPRVWOXqsbitqvZtKaOwzcSsAWWfUTHVhLmR6X2hwbWFyay5mb250X3NpemU=')] or 24
    local float_dist = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('IiZOJEOAhJpgaxTQqAKEIqzsNIypMpJfCaiMLDfrYkUhDzzRkmavNnqTHVhLmR6X2hwbWFyay5mbG9hdF9kaXN0')] or 80
    local head_height = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('bEvzqFYgMFUHIFReKSTZfLgtrqAxrDeMAbEAGufbHzBzgZPJpwrARTsTHVhLmR6X2hwbWFyay5oZWFkX2hlaWdodA==')] or 180
    local show_self = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('sPCBfQOQezeCAbvdLlHGjcofCfqmZlvyULSnMohGdFeuxDcSxyNzUCWTHVhLmR6X2hwbWFyay5zaG93X3NlbGY=')] == true
    local show_team = settings[JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('xegMRwwfehbbzBTbXoAdMhEAjGAMnBTiwUTAUpPOhwxRDVWXdPpRfoFTHVhLmR6X2hwbWFyay5zaG93X3RlYW0=')] == true
    local mr, mg, mb = get_color(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('IpzMpgrTEFwqHMmdrNYbOLyQaBQPdZvDkNgdyStuOWqZlkcoGJTgenxZHpfaHBtYXJrLm1pbnVzX2NvbG9y'), 1, 0.2, 0.2)
    local pr, pg, pb = get_color(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('xMqArGykUgdTDAfypKoKZKDouXKjBVEsKlColIZGGFoMnvLsYTBWYaNZHpfaHBtYXJrLnBsdXNfY29sb3I='), 0.2, 1, 0.3)

    refresh_chars_cache()
    if not chars_cache_ready then return end

    local now = os.clock()
    local current_ids = {}

    for _, c in ipairs(chars_cache) do
        if c.entity_ptr and not c.is_dead and c.health ~= nil then
            local id = c.entity_ptr
            current_ids[id] = true

            local is_self = (c.entity_ptr == lp.pawn)
                         or (c.entity_ptr == lp.entity_ptr)
            local is_team = (c.is_teammate == true)

            local allow = false
            if is_self and show_self then
                allow = true
            elseif is_team and show_team then
                allow = true
            elseif not is_self and not is_team then
                allow = true
            end

            if allow then
                local prev = last_hp[id]
                local cur = c.health

                if prev ~= nil and cur ~= prev then
                    local delta = cur - prev
                    if delta ~= 0 and c.has_location then
                        local sx, sy, ok = esp.world_to_screen(
                            c.location.x, c.location.y, c.location.z + head_height)
                        if ok then
                            popups[#popups + 1] = {
                                id = id,
                                sx = sx,
                                sy = sy,
                                delta = delta,
                                time = now,
                                locked = false,
                            }
                        end
                    end
                end

                last_hp[id] = cur
            end
        end
    end

    for id in pairs(last_hp) do
        if not current_ids[id] then
            last_hp[id] = nil
        end
    end

    local active = {}
    for _, p in ipairs(popups) do
        if now - p.time < duration then
            active[#active + 1] = p
        end
    end
    popups = active

    local sw = draw.screen_size()

    for _, p in ipairs(popups) do
        if not p.locked then
            local c = find_char(p.id)
            if c and not c.is_dead and c.has_location then
                local sx, sy, ok = esp.world_to_screen(
                    c.location.x, c.location.y, c.location.z + head_height)
                if ok then
                    p.sx = sx
                    p.sy = sy
                end
            else
                p.locked = true
            end
        end

        local t = (now - p.time) / duration
        if t < 0 then t = 0 end
        if t > 1 then t = 1 end

        local alpha = 1.0 - t
        local offset_y = -float_dist * t

        local text
        local r, g, b
        if p.delta < 0 then
            text = tostring(math.floor(p.delta))
            r, g, b = mr, mg, mb
        else
            text = JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('TxEiGBpvFotpjEYcWJBaoSAEiLymJKIioSzFEkcCIPWLHQwgOUfapOVKw==') .. tostring(math.floor(p.delta))
            r, g, b = pr, pg, pb
        end

        local draw_x = p.sx
        local draw_y = p.sy + offset_y

        if draw_x >= 0 and draw_x <= sw and draw_y >= -50 and draw_y <= sw then
            draw.text_ex(draw_x + 1, draw_y + 1, text, font_size, 0, 0, 0, alpha * 0.7)
            draw.text_ex(draw_x, draw_y, text, font_size, r, g, b, alpha)
        end
    end
end)

print(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('bkbFMPUidOBcFNlEHJSNYaBUOPGTHPgzzWkvjGNijXffqmjqiCnCzbiW2R6X2hwbWFya10gTG9hZGVk'))
print(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('vJALPUJCLhXgmcETdcDphhugJTCerVtEnMGcclQjscpBwCXYxoeJHkudmVyc2lvbiAyMDI2MDkwMiBkZWJ1Zw=='))
print(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('LrvgYnypPODUAkMFkMPaSgnmvIHuFvgdbdQbKCYnsmoCPnuDjaRifosaWYgdSBoYXZlIGFueSBxdWVzdGlvbnMgYW5kIGFkdmljZSw='))
print(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('AnBukFKVhFPjyQbTWkQlwlDNogmdRhqMTroErCpfLPiyyWbzobBWjeDcGxlYXNlIGNvbnRhY3QgbWUgb24gZGlzY29yZDpodXl1ZGFp'))
print(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('DDPCQxAxsJdXgYJHhhpuStmXyLRMMpKGdLRRBIJpOtHjjljcjsNUrzOb3IgZS1tYWlsOmFkbWluQDAwLnNi'))
print(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('DJNCmFTiYtdbQpcPuvDKiXyVuVVhdpZQyWICTCunIXJpMxipRPYxVkGdGhpcyBsdWEgaXMgZnJlZS5ETyBOT1QgUkVTRUxMIElUIQ=='))
print(JiiAoLUFTOIccknHCRGeOrxkQVkNTdmoLJpdeOvCNhMzhGdbxvuaKitIyPGWbejzbiOgA('AOsiWRSImArueuSqSMTOsgtnHlIrlCLJJSKnlTMNPtvmgdUiypRclLJaHR0cHM6Ly9naXRodWIuY29tL2h1eXVkYWkvRGFuZ2VyWm9uZS1QUk8tRE1BLUxVQQ=='))    
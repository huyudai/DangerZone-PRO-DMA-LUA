function yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


local function round(n, p)
  local m = 10 ^ (p or 0)
  return math.floor(n * m + 0.5) / m
end

local vector = {}
vector.__index = vector

local function vec(x, y, z)
  return setmetatable({ x = x or 0, y = y or 0, z = z or 0 }, vector)
end

function vector.__add(a, b)
  if type(a) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a + b.x, a + b.y, a + b.z) end
  if type(b) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a.x + b, a.y + b, a.z + b) end
  return vec(a.x + b.x, a.y + b.y, a.z + b.z)
end

function vector.__sub(a, b)
  if type(a) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a - b.x, a - b.y, a - b.z) end
  if type(b) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a.x - b, a.y - b, a.z - b) end
  return vec(a.x - b.x, a.y - b.y, a.z - b.z)
end

function vector.__mul(a, b)
  if type(a) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a * b.x, a * b.y, a * b.z) end
  if type(b) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a.x * b, a.y * b, a.z * b) end
  return vec(a.x * b.x, a.y * b.y, a.z * b.z)
end

function vector.__div(a, b)
  if type(a) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a / b.x, a / b.y, a / b.z) end
  if type(b) == yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11550,12285,11445,10290,10605,11970}) then return vec(a.x / b, a.y / b, a.z / b) end
  return vec(a.x / b.x, a.y / b.y, a.z / b.z)
end

function vector.__unm(a) return vec(-a.x, -a.y, -a.z) end
function vector.__tostring(a) return string.format(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({3885,12075,4620,3360,3885,12075,4620,3360,3885,12075}), a.x, a.y, a.z) end
function vector.__eq(a, b) return a.x == b.x and a.y == b.y and a.z == b.z end

function vector:clone() return vec(self.x, self.y, self.z) end
function vector:unpack() return self.x, self.y, self.z end
function vector:length()
  return math.sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end
function vector:length2()
  return math.sqrt(self.x * self.x + self.y * self.y)
end
function vector:distance(o) return (o - self):length() end
function vector:dot(o) return self.x * o.x + self.y * o.y + self.z * o.z end
function vector:normalized()
  local l = self:length()
  if l == 0 then return vec(0, 0, 1) end
  return vec(self.x / l, self.y / l, self.z / l)
end

local angle = {}
angle.__index = angle

local function ang(p, y, r)
  return setmetatable({ p = p or 0, y = y or 0, r = r or 0 }, angle)
end

function angle:to_forward_vector()
  local d2r = math.pi / 180
  local sp, cp = math.sin(self.p * d2r), math.cos(self.p * d2r)
  local sy, cy = math.sin(self.y * d2r), math.cos(self.y * d2r)
  return vec(cp * cy, cp * sy, -sp)
end

local function new_timer()
  return { started_at = os.clock() }
end

local function timer_elapsed(t)
  if not t or not t.started_at then return 0 end
  return os.clock() - t.started_at
end

local function timer_restart(t)
  t.started_at = os.clock()
end

local shader = {}
shader.__index = shader

local function shader_rgb(r, g, b, a)
  return setmetatable({
    r = r or 255, g = g or 255, b = b or 255, a = a or 255,
    h = 0, s = 0, l = 0,
  }, shader):sync_hsl()
end

function shader:sync_hsl()
  local rn, gn, bn = self.r / 255, self.g / 255, self.b / 255
  local mx, mn = math.max(rn, gn, bn), math.min(rn, gn, bn)
  local h, s, l = 0, 0, (mx + mn) / 2
  if mx ~= mn then
    local d = mx - mn
    s = l > 0.5 and d / (2 - mx - mn) or d / (mx + mn)
    if mx == rn then
      h = (gn - bn) / d + (gn < bn and 6 or 0)
    elseif mx == gn then
      h = (bn - rn) / d + 2
    else
      h = (rn - gn) / d + 4
    end
    h = h / 6 * 360
  end
  self.h, self.s, self.l = h, s, l
  return self
end

function shader:sync_rgb()
  local h, s, l = self.h / 360, self.s, self.l
  local function h2r(p, q, t)
    if t < 0 then t = t + 1 end
    if t > 1 then t = t - 1 end
    if t < 1 / 6 then return p + (q - p) * 6 * t end
    if t < 1 / 2 then return q end
    if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
    return p
  end
  local q = l < 0.5 and l * (1 + s) or l + s - l * s
  local p = 2 * l - q
  self.r = h2r(p, q, h + 1 / 3) * 255
  self.g = h2r(p, q, h) * 255
  self.b = h2r(p, q, h - 1 / 3) * 255
  return self
end

function shader:clone()
  return shader_rgb(self.r, self.g, self.b, self.a)
end

function shader:set(r, g, b, a)
  self.r, self.g, self.b, self.a = r, g, b, a or self.a
  self:sync_hsl()
  return self
end

function shader:shift_hue(amount)
  self.h = (self.h + amount) % 360
  self:sync_rgb()
  return self
end

local dt_global = 0.016
local last_clock = os.clock()

local shared = {
  player_origin = vec(0, 0, 0),
  player_eid = nil,
}

local data_throttle_ms = 0
local last_data_refresh_ms = 0

local cached_lp = nil
local cached_lp_valid = false
local cached_cam = nil
local cached_cam_valid = false
local cached_cam_pos = vec(0, 0, 0)

local function refresh_data_cache()
  local now_ms = os.clock() * 1000
  if now_ms - last_data_refresh_ms < data_throttle_ms then
    return
  end
  last_data_refresh_ms = now_ms

  local cam = esp.camera()
  if cam and cam.valid and cam.location then
    cached_cam = cam
    cached_cam_valid = true
    cached_cam_pos = vec(cam.location.x, cam.location.y, cam.location.z)
  else
    cached_cam = nil
    cached_cam_valid = false
  end

  local lp = esp.local_player()
  cached_lp = lp
  cached_lp_valid = lp and lp.valid or false
end

local particle_mgr = {
  particles = {},
  next_id = 0,
  soft_limit = 1024,
  hard_limit = 2048,
}

local particle = {}
particle.__index = particle

local function new_particle()
  particle_mgr.next_id = particle_mgr.next_id + 1
  local p = setmetatable({
    id = particle_mgr.next_id,
    origin = vec(0, 0, 0),
    shader = shader_rgb(255, 255, 255, 255),
    type = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10395,11025,11970,10395,11340,10605}),
    radius = 5,
    fixed_size = false,
    fixed_size_px = 30,
    dying = false,
    dead = false,
    lifespan = nil,
    lifespan_timer = new_timer(),
    always_visible = false,
    skip_offscreen = true,
    max_render_distance = 8192,
    on_frame = nil,
    on_kill = nil,
    on_dead = nil,
    fade_time = 0,
    death_timer = nil,
    alpha_at_death = nil,
    relation_camera_distance = 0,
    screen_x = nil,
    screen_y = nil,
    onscreen = false,
    occluded = true,
    last_vischeck = 0,
    animator = nil,
    fade_enabled = true,
  }, particle)
  particle_mgr.particles[p.id] = p
  return p
end

function particle:kill(expedite)
  if self.dying then return end
  if self.fade_enabled and self.fade_time and self.fade_time > 0 then
    if expedite then self.fade_time = self.fade_time / 2 end
    self.dying = true
    self.alpha_at_death = self.shader.a
    self.death_timer = new_timer()
  else
    self.dead = true
  end
  if self.on_kill then self.on_kill(self) end
end

function particle:render()
  local r
  if self.fixed_size then
    r = math.max(0.5, self.fixed_size_px)
  else
    r = math.max(0.5, self.radius / (self.relation_camera_distance / 100))
  end
  draw.circle(
    self.screen_x, self.screen_y, r,
    self.shader.r / 255, self.shader.g / 255, self.shader.b / 255, self.shader.a / 255,
    true
  )
end

function particle:process()
  if not self.dying and self.lifespan ~= nil then
    if timer_elapsed(self.lifespan_timer) >= self.lifespan then
      self:kill()
    end
  end

  if self.dying and self.death_timer then
    local t = timer_elapsed(self.death_timer)
    if t >= self.fade_time then
      self.dead = true
      return
    end
    self.shader.a = self.alpha_at_death * (1 - t / self.fade_time)
  end

  if not cached_cam_valid then return end
  local cam_pos = cached_cam_pos

  if self.on_frame then self.on_frame(self) end

  self.relation_camera_distance = self.origin:distance(cam_pos)

  local sx, sy, ok = esp.world_to_screen(self.origin.x, self.origin.y, self.origin.z)
  if not ok then
    self.screen_x, self.screen_y, self.onscreen = nil, nil, false
    return
  end

  local sw, sh = draw.screen_size()
  if self.skip_offscreen and (sx < 0 or sx > sw or sy < 0 or sy > sh) then
    self.screen_x, self.screen_y, self.onscreen = nil, nil, false
    return
  end

  self.screen_x, self.screen_y, self.onscreen = sx, sy, true

  if self.relation_camera_distance > self.max_render_distance then return end
  if self.shader.a <= 0 then return end

  if not self.always_visible then
    local now = os.clock()
    if now - self.last_vischeck > 0.03 then
      self.last_vischeck = now
      if physx and physx.is_visible then
        local vis = physx.is_visible(
          cam_pos.x, cam_pos.y, cam_pos.z,
          self.origin.x, self.origin.y, self.origin.z
        )
        if vis == nil then
          self.occluded = false
        else
          self.occluded = (vis == false)
        end
      else
        self.occluded = false
      end
    end
    if self.occluded then return end
  end

  self:render()
end

local animator = {}
animator.__index = animator

local function new_animator(p)
  return setmetatable({
    particle = p,
    float_timer = new_timer(),
    orbit_angle = ang(0, 0, 0),
  }, animator)
end

function animator:orbit_easing(center, speed, rigidity, ideal_dist, options)
  options = options or {}
  local orbit_speed = options.speed or 1
  local traces = options.traces or 24
  local lowest = ideal_dist

  if options.collision and physx and physx.trace then
    for i = 1, traces do
      local a = ang(0, 360 / traces * i, 0)
      local ov = center + a:to_forward_vector() * ideal_dist
      local _, hit = physx.trace(center.x, center.y, center.z, ov.x, ov.y, ov.z)
      if hit then
        local d = center:distance(vec(hit.x, hit.y, hit.z))
        if d < lowest then lowest = d end
      end
    end
  end

  self.orbit_angle.y = (self.orbit_angle.y + orbit_speed * 100 * dt_global) % 360
  local target = center + self.orbit_angle:to_forward_vector() * lowest
  self.particle.origin = self.particle.origin
    + (target - self.particle.origin) * rigidity * speed * 100 * dt_global
end

function animator:float_z(amp, freq)
  self.particle.origin.z = self.particle.origin.z
    + math.sin(timer_elapsed(self.float_timer) * math.pi * freq) * amp * 100 * dt_global
end

local orb_mgr = {
  orb = nil,
  color = { 255, 255, 150, 255 },
  opacity = 255,
  rainbow = false,
  rainbow_speed = 1,
  radius = 30,
  fixed_size = false,
  fixed_size_px = 30,
  orbit_height = 32,
  trail_enabled = true,
  trail_fade = 0.5,
  trail_fade_enabled = true,
  trail_throttle = 1,
  trail_tick = 0,
  fade_enabled = true,
  fade_time = 0.8,
}

function orb_mgr:spawn()
  if self.orb then return end

  local orb = new_particle()
  orb.type = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10395,11025,11970,10395,11340,10605})
  orb.origin = shared.player_origin:clone()
  orb.radius = self.radius
  orb.fixed_size = self.fixed_size
  orb.fixed_size_px = self.fixed_size_px
  orb.fade_enabled = self.fade_enabled
  orb.shader = shader_rgb(self.color[1], self.color[2], self.color[3], self.color[4])
  orb.animator = new_animator(orb)
  orb.skip_offscreen = false
  orb.always_visible = false

  local mgr = self
  orb.on_dead = function(p)
    if mgr.orb == p then
      mgr.orb = nil
    end
  end

  orb.on_frame = function(p)
    p.fixed_size = mgr.fixed_size
    p.fixed_size_px = mgr.fixed_size_px
    p.fade_enabled = mgr.fade_enabled

    local base_alpha = (mgr.color[4] or 255) * ((mgr.opacity or 255) / 255)

    if mgr.rainbow then
      p.shader:shift_hue(mgr.rainbow_speed * 0.05 * dt_global * 100)
      p.shader.a = base_alpha
    else
      p.shader:set(mgr.color[1], mgr.color[2], mgr.color[3], base_alpha)
    end

    p.animator:orbit_easing(
      shared.player_origin + vec(0, 0, mgr.orbit_height),
      4, 0.005, 64,
      { speed = 1.25, traces = 32, collision = true }
    )

    p.animator:float_z(0.5, 1)

    if (not p.dying) and mgr.trail_enabled and mgr.trail_fade > 0 then
      mgr.trail_tick = mgr.trail_tick + 1
      local throttle = mgr.trail_throttle or 1
      if throttle < 1 then throttle = 1 end

      if mgr.trail_tick % throttle == 0 then
        local trail = new_particle()
        local ts = p.shader:clone()
        ts.a = base_alpha * 0.16
        trail.type = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10395,11025,11970,10395,11340,10605})
        trail.origin = p.origin:clone()
        trail.radius = p.radius
        trail.fixed_size = mgr.fixed_size
        trail.fixed_size_px = mgr.fixed_size_px
        trail.fade_enabled = mgr.trail_fade_enabled
        trail.shader = ts
        trail.lifespan = 0.01
        trail.fade_time = mgr.trail_fade
        trail.skip_offscreen = true
        trail.on_frame = function(t)
          t.fixed_size = mgr.fixed_size
          t.fixed_size_px = mgr.fixed_size_px
          t.fade_enabled = mgr.trail_fade_enabled
          if t.fixed_size then
            t.fixed_size_px = t.fixed_size_px + 30 * dt_global
          else
            t.radius = t.radius + 60 * dt_global
          end
        end
      end
    end
  end

  self.orb = orb
end

function orb_mgr:kill()
  if not self.orb then return end
  if self.orb.dying then return end

  if self.fade_enabled and self.fade_time > 0 then
    self.orb.fade_time = self.fade_time
    self.orb:kill()
  else
    self.orb.dead = true
    self.orb = nil
  end
end

function orb_mgr:hard_reset()
  if self.orb then
    self.orb.dead = true
    self.orb = nil
  end
end

local function process_particles()
  local list = {}
  for _, p in pairs(particle_mgr.particles) do
    table.insert(list, p)
  end

  table.sort(list, function(a, b)
    return a.relation_camera_distance > b.relation_camera_distance
  end)

  local alive = #list
  if alive > particle_mgr.soft_limit then
    local by_age = {}
    for _, p in ipairs(list) do table.insert(by_age, p) end
    table.sort(by_age, function(a, b) return a.id < b.id end)

    for _, p in ipairs(by_age) do
      if alive > particle_mgr.hard_limit then
        p.dead = true
        alive = alive - 1
      elseif alive > particle_mgr.soft_limit then
        p:kill(true)
        alive = alive - 1
      else
        break
      end
    end
  end

  for _, p in ipairs(list) do
    if p.dead then
      particle_mgr.particles[p.id] = nil
      if p.on_dead then p.on_dead(p) end
    else
      p:process()
    end
  end
end

local keys = {
  enable            = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10605,11550,10185,10290,11340,10605}),
  color             = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10395,11655,11340,11655,11970}),
  opacity           = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,11655,11760,10185,10395,11025,12180,12705}),
  rainbow           = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,11970,10185,11025,11550,10290,11655,12495}),
  rainbow_speed     = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,11970,10185,11025,11550,10290,11655,12495,9975,12075,11760,10605,10605,10500}),
  radius            = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,11970,10185,10500,11025,12285,12075}),
  fixed_size        = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10710,11025,12600,10605,10500,9975,12075,11025,12810,10605}),
  fixed_size_px     = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10710,11025,12600,10605,10500,9975,12075,11025,12810,10605,9975,11760,12600}),
  orbit_height      = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,11655,11970,10290,11025,12180,9975,10920,10605,11025,10815,10920,12180}),
  trail_enable      = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340,9975,10605,11550,10185,10290,11340,10605}),
  trail             = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340}),
  trail_fade_enable = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340,9975,10710,10185,10500,10605,9975,10605,11550,10185,10290,11340,10605}),
  trail_throttle    = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340,9975,12180,10920,11970,11655,12180,12180,11340,10605}),
  fade_enable       = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10710,10185,10500,10605,9975,10605,11550,10185,10290,11340,10605}),
  fade_time         = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10710,10185,10500,10605,9975,12180,11025,11445,10605}),
  soft_limit        = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,12075,11655,10710,12180,9975,11340,11025,11445,11025,12180}),
  hard_limit        = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10920,10185,11970,10500,9975,11340,11025,11445,11025,12180}),
  data_throttle     = yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7980,12285,10185,4830,10500,12810,9975,11655,11970,10290,4830,10500,10185,12180,10185,9975,12180,10920,11970,11655,12180,12180,11340,10605}),
}

local function int_to_rgba(c)
  c = tonumber(c) or 0xFFFF96FF
  local a = c % 256; c = math.floor(c / 256)
  local b = c % 256; c = math.floor(c / 256)
  local g = c % 256; c = math.floor(c / 256)
  local r = c % 256
  return r, g, b, a
end

menu.add_tab(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290}), function()
  ui.checkbox(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7245,11550,10185,10290,11340,10605,3360,4200,7350,8400,8715,3360,9135,6825,8610,8190,7665,8190,7455,3465,4305,4200,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4305}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10605,11550,10185,10290,11340,10605}), true)
  ui.color_edit(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8295,11970,10290,3360,7035,11655,11340,11655,11970}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10395,11655,11340,11655,11970}), 0xFFFF96FF)
  ui.slider_int(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8295,11760,10185,10395,11025,12180,12705}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,11655,11760,10185,10395,11025,12180,12705}), 0, 255, 255)

  ui.checkbox(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8610,10185,11025,11550,10290,11655,12495,3360,8085,11655,10500,10605}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,11970,10185,11025,11550,10290,11655,12495}), false)
  ui.slider_float(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8610,10185,11025,11550,10290,11655,12495,3360,8715,11760,10605,10605,10500}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,11970,10185,11025,11550,10290,11655,12495,9975,12075,11760,10605,10605,10500}), 1, 10, 1)

  ui.checkbox(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7350,11025,12600,10605,10500,3360,8715,10395,11970,10605,10605,11550,3360,8715,11025,12810,10605}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10710,11025,12600,10605,10500,9975,12075,11025,12810,10605}), false)
  ui.slider_float(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8295,11970,10290,3360,8610,10185,10500,11025,12285,12075,3360,4200,12495,11655,11970,11340,10500,4305}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,11970,10185,10500,11025,12285,12075}), 4, 60, 30)
  ui.slider_float(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7350,11025,12600,10605,10500,3360,8715,11025,12810,10605,3360,4200,11760,12600,4305}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10710,11025,12600,10605,10500,9975,12075,11025,12810,10605,9975,11760,12600}), 4, 100, 30)
  ui.slider_float(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8295,11970,10290,3360,7560,10605,11025,10815,10920,12180}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,11655,11970,10290,11025,12180,9975,10920,10605,11025,10815,10920,12180}), 0, 120, 32)

  ui.checkbox(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7245,11550,10185,10290,11340,10605,3360,8820,11970,10185,11025,11340}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340,9975,10605,11550,10185,10290,11340,10605}), true)
  ui.checkbox(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8820,11970,10185,11025,11340,3360,7350,10185,10500,10605,3360,7245,10710,10710,10605,10395,12180}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340,9975,10710,10185,10500,10605,9975,10605,11550,10185,10290,11340,10605}), true)
  ui.slider_int(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7350,8400,8715,3360,6930,8295,8295,8715,8820,3360,10710,11655,11970,3360,12180,11970,10185,11025,11340}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340,9975,12180,10920,11970,11655,12180,12180,11340,10605}), 1, 10, 1)
  ui.slider_float(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8820,11970,10185,11025,11340,3360,7350,10185,10500,10605,3360,8820,11025,11445,10605}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,12180,11970,10185,11025,11340}), 0, 2.0, 0.5)

  ui.checkbox(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7245,11550,10185,10290,11340,10605,3360,7350,10185,10500,10605,3360,7245,10710,10710,10605,10395,12180}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10710,10185,10500,10605,9975,10605,11550,10185,10290,11340,10605}), true)
  ui.slider_float(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7350,10185,10500,10605,3360,7140,12285,11970,10185,12180,11025,11655,11550}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10710,10185,10500,10605,9975,12180,11025,11445,10605}), 0.1, 3.0, 0.8)

  ui.slider_int(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10395,10185,10395,10920,10605,3360,4200,11445,12075,4305}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10500,10185,12180,10185,9975,12180,10920,11970,11655,12180,12180,11340,10605}), 0, 200, 0)

  ui.slider_int(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({8715,11655,10710,12180,3360,7980,11025,11445,11025,12180,3360,4200,5250,9870,11550,4305}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,12075,11655,10710,12180,9975,11340,11025,11445,11025,12180}), 5, 13, 10)
  ui.slider_int(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({7560,10185,11970,10500,3360,7980,11025,11445,11025,12180,3360,4200,5250,9870,11550,4305}), yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10500,12810,9975,11655,11970,10290,4830,10920,10185,11970,10500,9975,11340,11025,11445,11025,12180}), 5, 13, 11)
end)

local last_player_pos = nil
local TELEPORT_THRESHOLD = 500

callback.on_draw(function()
  local now = os.clock()
  dt_global = now - last_clock
  if dt_global <= 0 or dt_global > 0.1 then dt_global = 0.016 end
  last_clock = now

  local enable = settings[keys.enable]
  if enable == nil then enable = true end
  if not enable then
    orb_mgr:kill()
    process_particles()
    return
  end

  data_throttle_ms = tonumber(settings[keys.data_throttle]) or 0
  refresh_data_cache()

  if not cached_cam_valid then
    return
  end

  local has_pos = false
  if cached_lp_valid and cached_lp and cached_lp.location then
    shared.player_origin = vec(cached_lp.location.x, cached_lp.location.y, cached_lp.location.z)
    shared.player_eid = cached_lp.entity_ptr or cached_lp.pawn
    has_pos = true
  end

  if has_pos then
    if last_player_pos then
      local jump = shared.player_origin:distance(last_player_pos)
      if jump > TELEPORT_THRESHOLD then
        orb_mgr:hard_reset()
      end
    end
    last_player_pos = shared.player_origin:clone()
  else
    last_player_pos = nil
  end

  local r, g, b, a = int_to_rgba(settings[keys.color])
  orb_mgr.color = { r, g, b, a }
  orb_mgr.opacity = tonumber(settings[keys.opacity]) or 255
  orb_mgr.rainbow = settings[keys.rainbow] == true
  orb_mgr.rainbow_speed = tonumber(settings[keys.rainbow_speed]) or 1
  orb_mgr.radius = tonumber(settings[keys.radius]) or 30
  orb_mgr.fixed_size = settings[keys.fixed_size] == true
  orb_mgr.fixed_size_px = tonumber(settings[keys.fixed_size_px]) or 30
  orb_mgr.orbit_height = tonumber(settings[keys.orbit_height]) or 32
  orb_mgr.trail_enabled = settings[keys.trail_enable] ~= false
  orb_mgr.trail_fade = tonumber(settings[keys.trail]) or 0.5
  orb_mgr.trail_fade_enabled = settings[keys.trail_fade_enable] ~= false
  orb_mgr.trail_throttle = tonumber(settings[keys.trail_throttle]) or 1
  orb_mgr.fade_enabled = settings[keys.fade_enable] ~= false
  orb_mgr.fade_time = tonumber(settings[keys.fade_time]) or 0.8

  particle_mgr.soft_limit = 2 ^ (tonumber(settings[keys.soft_limit]) or 10)
  particle_mgr.hard_limit = 2 ^ (tonumber(settings[keys.hard_limit]) or 11)

  if has_pos then
    orb_mgr:spawn()
  end

  process_particles()
end)

print(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({9555,10500,12810,3360,8400,10185,11970,12180,11025,10395,11340,10605,3360,8295,11970,10290,9765,3360,7980,11655,10185,10500,10605,10500}))
print(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({12390,10605,11970,12075,11025,11655,11550,3360,5250,5040,5250,5670,5040,5985,5355,5040,3360,6930,7245,8820,6825}))
print(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11025,10710,3360,12285,3360,10920,10185,12390,10605,3360,10185,11550,12705,3360,11865,12285,10605,12075,12180,11025,11655,11550,12075,3360,10185,11550,10500,3360,10185,10500,12390,11025,10395,10605,4620}))
print(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11760,11340,10605,10185,12075,10605,3360,10395,11655,11550,12180,10185,10395,12180,3360,11445,10605,3360,11655,11550,3360,10500,11025,12075,10395,11655,11970,10500,6090,10920,12285,12705,12285,10500,10185,11025}))
print(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({11655,11970,3360,10605,4725,11445,10185,11025,11340,6090,10185,10500,11445,11025,11550,6720,5040,5040,4830,12075,10290}))
print(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({12180,10920,11025,12075,3360,11340,12285,10185,3360,11025,12075,3360,10710,11970,10605,10605,4830,7140,8295,3360,8190,8295,8820,3360,8610,7245,8715,7245,7980,7980,3360,7665,8820,3465}))
print(yXFEIkoiVnnnRCwGsRHmXNWVFeazGhEyKxTWBgdZEvLphGSEFC({10920,12180,12180,11760,12075,6090,4935,4935,10815,11025,12180,10920,12285,10290,4830,10395,11655,11445,4935,10920,12285,12705,12285,10500,10185,11025,4935,7140,10185,11550,10815,10605,11970,9450,11655,11550,10605,4725,8400,8610,8295,4725,7140,8085,6825,4725,7980,8925,6825}))    
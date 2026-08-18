hl.monitor({
  output = "desc:Microstep MPG321UX OLED 0x01010101",
  mode = "3840x2160@119.88Hz",
  position = "0x0",
  scale = 1.25,
  bitdepth = 10,
  cm = "srgb",
  sdrbrightness = 1.2,
  sdrsaturation = 0.98,
  vrr = 2
})

hl.monitor({
  output = "desc:Samsung Display Corp. 0x41A0",
  mode = "1920x1200@60Hz",
  position = "0x0",
  scale = "1.20",
  bitdepth = 10,
  cm = "srgb",
  vrr = 2
})

-- Fallback
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto-center-up",
  scale = "auto",
  bitdepth = 10,
  cm = "srgb",
  vrr = 2
})

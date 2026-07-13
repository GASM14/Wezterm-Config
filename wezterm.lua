-- ~/.config/wezterm/wezterm.lua
local wezterm = require 'wezterm'
local config = {}

-- ===== Fonte e tamanho =====
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 18

-- ===== Tema Catppuccin Mocha (nativo) =====
config.color_scheme = "Catppuccin Mocha"

-- ===== Opacidade (como no Ghostty) =====
config.window_background_opacity = 0.9

-- ===== Remover barra de título =====
config.window_decorations = "NONE"   -- remove tudo (ou "RESIZE" para manter bordas)

-- ===== Abas =====
config.enable_tab_bar = true
config.use_fancy_tab_bar = true

-- ===== Histórico de scroll =====
config.scrollback_lines = 10000

-- ===== Atalhos de teclado =====
config.keys = {
    -- Copiar (Ctrl+Shift+C)
    { key = "C", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo "Clipboard" },
    -- Colar (Ctrl+Shift+V)
    { key = "V", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom "Clipboard" },
    -- Aumentar fonte (Ctrl+=)
    { key = "=", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
    -- Diminuir fonte (Ctrl+-)
    { key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
    -- Repor fonte (Ctrl+0)
    { key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },
}

-- ===== Splits (Alt+| e Alt+-) =====
table.insert(config.keys, {
    key = "|",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
})
table.insert(config.keys, {
    key = "-",
    mods = "ALT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
})

-- ===== Navegação entre splits (Ctrl+h/j/k/l) =====
local move = wezterm.action.ActivatePaneDirection
table.insert(config.keys, { key = "h", mods = "CTRL", action = move "Left" })
table.insert(config.keys, { key = "j", mods = "CTRL", action = move "Down" })
table.insert(config.keys, { key = "k", mods = "CTRL", action = move "Up" })
table.insert(config.keys, { key = "l", mods = "CTRL", action = move "Right" })

-- ===== Shell padrão =====
config.default_prog = { "/bin/zsh", "--login" }

return config

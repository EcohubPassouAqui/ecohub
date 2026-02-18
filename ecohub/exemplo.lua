local ecohub = loadstring(game:HttpGet("https://raw.githubusercontent.com/EcohubPassouAqui/ecohub/main/ecohub/painel.lua"))()

local UI = ecohub:CreateWindow("ecohub", "v1.0")

-- ══════════════════════════════════════════
--              PAGINA: Home
-- ══════════════════════════════════════════
local Home = UI:addPage("Home", "home")
local General = Home:addSection("General")

-- Button: clicavel, executa funcao ao apertar
General:addButton("Clique aqui", function()
    print("Botao clicado!")
end)

-- Toggle: liga e desliga, salva estado true/false
-- addToggle tem keybind, nil = sem tecla padrao
local myToggle = General:addToggle("Ativar algo", false, function(state)
    print("Toggle estado:", state)
end, nil)

-- Toggle Simples: igual ao toggle porem sem keybind
local myToggleSimple = General:addToggleSimple("Toggle Simples", false, function(state)
    print("Toggle simples estado:", state)
end)

-- Slider: valor numerico entre min e max
-- addSlider(nome, min, max, default, callback)
local mySlider = General:addSlider("Velocidade", 0, 100, 50, function(value)
    print("Slider valor:", value)
end)

-- TextBox: caixa de texto, retorna string ao perder foco
-- addTextBox(nome, placeholder, callback)
local myTextBox = General:addTextBox("Nome", "Digite aqui...", function(text)
    print("TextBox texto:", text)
end)

-- Dropdown: lista de opcoes, retorna item selecionado
-- addDropdown(nome, lista, callback)
local myDropdown = General:addDropdown("Modo", {"Opcao 1", "Opcao 2", "Opcao 3"}, function(selected)
    print("Dropdown selecionado:", selected)
end)

-- Keybind: define uma tecla, executa callback ao pressionar
-- addKeybind(nome, tecla padrao, callback)
local myKeybind = General:addKeybind("Tecla acao", Enum.KeyCode.F, function(key)
    print("Keybind pressionada:", key)
end)

-- ColorPicker: seletor de cor RGB
-- addColorPicker(nome, cor padrao, callback)
local myColor = General:addColorPicker("Cor do ESP", Color3.fromRGB(255, 0, 0), function(color)
    print("Cor selecionada:", color)
end)

-- Separator: linha divisoria visual, sem parametros
General:addSeparator()

-- ══════════════════════════════════════════
--           PAGINA: Combat
-- ══════════════════════════════════════════
local Combat = UI:addPage("Combat", "sword")
local CombatSec = Combat:addSection("Configuracoes de Combate")

-- Toggle com keybind definida como nil
local aimbotToggle = CombatSec:addToggle("Aimbot", false, function(state)
    print("Aimbot estado:", state)
end, nil)

-- Slider de FOV entre 10 e 500
local fovSlider = CombatSec:addSlider("FOV", 10, 500, 100, function(value)
    print("FOV valor:", value)
end)

-- Dropdown de hitbox
local hitboxDropdown = CombatSec:addDropdown("Hitbox", {"Head", "Body", "Nearest"}, function(sel)
    print("Hitbox selecionada:", sel)
end)

-- ══════════════════════════════════════════
--           PAGINA: Visual
-- ══════════════════════════════════════════
local Visual = UI:addPage("Visual", "eye")
local VisualSec = Visual:addSection("Configuracoes Visuais")

-- Toggle simples de ESP
local espToggle = VisualSec:addToggleSimple("ESP Jogadores", false, function(state)
    print("ESP estado:", state)
end)

-- ColorPicker para cor do ESP
local espColor = VisualSec:addColorPicker("Cor ESP", Color3.fromRGB(255, 255, 255), function(color)
    print("ESP cor:", color)
end)

-- Slider de transparencia entre 0 e 100
VisualSec:addSlider("Transparencia", 0, 100, 0, function(value)
    print("Transparencia valor:", value)
end)

-- ══════════════════════════════════════════
--           PAGINA: Misc
-- ══════════════════════════════════════════
local Misc = UI:addPage("Misc", "settings")
local MiscSec = Misc:addSection("Diversos")

-- Button simples de teleporte
MiscSec:addButton("Teleport Lobby", function()
    print("Teleportando...")
end)

-- Keybind para abrir e fechar GUI
MiscSec:addKeybind("Toggle GUI", Enum.KeyCode.RightAlt, function()
    print("GUI toggled via keybind")
end)

-- TextBox para tag customizada
MiscSec:addTextBox("Custom Tag", "Seu texto...", function(text)
    print("Tag digitada:", text)
end)

-- Separador visual
MiscSec:addSeparator()

-- Button que reseta todos os controles para o valor padrao
-- usando os metodos :Set() de cada controle
MiscSec:addButton("Resetar Configuracoes", function()
    myToggle:Set(false)
    myToggleSimple:Set(false)
    mySlider:Set(50)
    myDropdown:Set(nil)
    myTextBox:Set("")
    myColor:Set(Color3.fromRGB(255, 0, 0))
    myKeybind:Set(Enum.KeyCode.F)
    print("Tudo resetado para o padrao!")
end)

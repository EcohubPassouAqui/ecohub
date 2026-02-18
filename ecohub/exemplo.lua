local ecohub = loadstring(game:HttpGet("https://raw.githubusercontent.com/EcohubPassouAqui/ecohub/main/ecohub/painel.lua"))()

local UI = ecohub:CreateWindow("ecohub", "v1.0")

local Home = UI:addPage("Home", "home")
local General = Home:addSection("General")

General:addButton("Click here", function()
    print("Button clicked!")
end)

local myCheck = General:addCheck("Enable something", false, function(state)
    print("Check state:", state)
end)

local mySlider = General:addSlider("Speed", 0, 100, 50, function(value)
    print("Slider value:", value)
end)

local myTextBox = General:addTextBox("Name", "Type here...", function(text)
    print("TextBox text:", text)
end)

local myDropdown = General:addDropdown("Mode", {"Option 1", "Option 2", "Option 3"}, function(selected)
    print("Dropdown selected:", selected)
end)

local myKeybind = General:addKeybind("Action key", Enum.KeyCode.F, function(key)
    print("Keybind pressed:", key)
end)

local myColor = General:addColorPicker("ESP Color", Color3.fromRGB(255, 0, 0), function(color)
    print("Color selected:", color)
end)

General:addSeparator()

local Combat = UI:addPage("Combat", "sword")
local CombatSec = Combat:addSection("Combat Settings")

local aimbotCheck = CombatSec:addCheck("Aimbot", false, function(state)
    print("Aimbot state:", state)
end)

local fovSlider = CombatSec:addSlider("FOV", 10, 500, 100, function(value)
    print("FOV value:", value)
end)

local hitboxDropdown = CombatSec:addDropdown("Hitbox", {"Head", "Body", "Nearest"}, function(sel)
    print("Hitbox selected:", sel)
end)

local Visual = UI:addPage("Visual", "eye")
local VisualSec = Visual:addSection("Visual Settings")

local espCheck = VisualSec:addCheck("Player ESP", false, function(state)
    print("ESP state:", state)
end)

local espColor = VisualSec:addColorPicker("ESP Color", Color3.fromRGB(255, 255, 255), function(color)
    print("ESP color:", color)
end)

VisualSec:addSlider("Transparency", 0, 100, 0, function(value)
    print("Transparency value:", value)
end)

local Misc = UI:addPage("Misc", "settings")
local MiscSec = Misc:addSection("Miscellaneous")

MiscSec:addButton("Teleport Lobby", function()
    print("Teleporting...")
end)

MiscSec:addKeybind("Toggle GUI", Enum.KeyCode.RightAlt, function()
    print("GUI toggled via keybind")
end)

MiscSec:addTextBox("Custom Tag", "Your text...", function(text)
    print("Tag typed:", text)
end)

MiscSec:addSeparator()

MiscSec:addButton("Reset Settings", function()
    myCheck:Set(false)
    mySlider:Set(50)
    myDropdown:Set(nil)
    myTextBox:Set("")
    myColor:Set(Color3.fromRGB(255, 0, 0))
    myKeybind:Set(Enum.KeyCode.F)
    print("Everything reset to default!")
end)

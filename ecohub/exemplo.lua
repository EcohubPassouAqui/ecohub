local ecohub = loadstring(game:HttpGet("https://raw.githubusercontent.com/EcohubPassouAqui/ecohub/main/ecohub/painel.lua"))()

local UI = ecohub:CreateWindow("ecohub", "v1.0")

-- ══════════════════════════════
--           HOME PAGE
-- ══════════════════════════════
local Home = UI:addPage("Home", "home")
local General = Home:addSection("General")

General:addLabel("General options")
General:addParagraph("About", "Configure your general settings below. Changes apply instantly.")
General:addSeparator()

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

-- ══════════════════════════════
--          COMBAT PAGE
-- ══════════════════════════════
local Combat = UI:addPage("Combat", "sword")
local CombatSec = Combat:addSection("Combat Settings")

CombatSec:addLabel("Aimbot options")
CombatSec:addParagraph("Warning", "Use these features responsibly. May affect gameplay.")
CombatSec:addSeparator()

local aimbotCheck = CombatSec:addCheck("Aimbot", false, function(state)
	print("Aimbot state:", state)
end)

local fovSlider = CombatSec:addSlider("FOV", 10, 500, 100, function(value)
	print("FOV value:", value)
end)

local hitboxDropdown = CombatSec:addDropdown("Hitbox", {"Head", "Body", "Nearest"}, function(sel)
	print("Hitbox selected:", sel)
end)

local aimKeybind = CombatSec:addKeybind("Aimbot key", Enum.KeyCode.Q, function(key)
	print("Aimbot key pressed:", key)
end)

local aimColor = CombatSec:addColorPicker("Aimbot Color", Color3.fromRGB(255, 50, 50), function(color)
	print("Aimbot color:", color)
end)

-- ══════════════════════════════
--          VISUAL PAGE
-- ══════════════════════════════
local Visual = UI:addPage("Visual", "eye")
local VisualSec = Visual:addSection("Visual Settings")

VisualSec:addLabel("ESP options")
VisualSec:addParagraph("ESP Info", "Renders players through walls. Adjust colors and distance below.")
VisualSec:addSeparator()

local espCheck = VisualSec:addCheck("Player ESP", false, function(state)
	print("ESP state:", state)
end)

local espColor = VisualSec:addColorPicker("ESP Color", Color3.fromRGB(255, 255, 255), function(color)
	print("ESP color:", color)
end)

local transparencySlider = VisualSec:addSlider("Transparency", 0, 100, 0, function(value)
	print("Transparency value:", value)
end)

local espTextBox = VisualSec:addTextBox("ESP Tag", "e.g. [ESP]", function(text)
	print("ESP tag:", text)
end)

local espDropdown = VisualSec:addDropdown("Style", {"Box", "Corner", "Skeleton"}, function(sel)
	print("ESP style:", sel)
end)

-- ══════════════════════════════
--           MISC PAGE
-- ══════════════════════════════
local Misc = UI:addPage("Misc", "settings")
local MiscSec = Misc:addSection("Miscellaneous")

MiscSec:addLabel("Utility tools")
MiscSec:addParagraph("Misc Info", "Extra tools and settings for convenience.")
MiscSec:addSeparator()

MiscSec:addButton("Teleport Lobby", function()
	print("Teleporting...")
end)

local toggleKeybind = MiscSec:addKeybind("Toggle GUI", Enum.KeyCode.RightAlt, function()
	print("GUI toggled via keybind")
end)

local customTag = MiscSec:addTextBox("Custom Tag", "Your text...", function(text)
	print("Tag typed:", text)
end)

local miscCheck = MiscSec:addCheck("Auto rejoin", false, function(state)
	print("Auto rejoin:", state)
end)

local miscSlider = MiscSec:addSlider("Notification time", 1, 10, 3, function(value)
	print("Notif time:", value)
end)

local miscDropdown = MiscSec:addDropdown("Language", {"English", "Portuguese", "Spanish"}, function(sel)
	print("Language:", sel)
end)

local miscColor = MiscSec:addColorPicker("UI Accent", Color3.fromRGB(100, 140, 255), function(color)
	print("Accent color:", color)
end)

MiscSec:addSeparator()

MiscSec:addButton("Reset Settings", function()
	-- Home
	myCheck:Set(false)
	mySlider:Set(50)
	myTextBox:Set("")
	myDropdown:Set(nil)
	myKeybind:Set(Enum.KeyCode.F)
	myColor:Set(Color3.fromRGB(255, 0, 0))
	-- Combat
	aimbotCheck:Set(false)
	fovSlider:Set(100)
	hitboxDropdown:Set(nil)
	aimKeybind:Set(Enum.KeyCode.Q)
	aimColor:Set(Color3.fromRGB(255, 50, 50))
	-- Visual
	espCheck:Set(false)
	espColor:Set(Color3.fromRGB(255, 255, 255))
	transparencySlider:Set(0)
	espTextBox:Set("")
	espDropdown:Set(nil)
	-- Misc
	toggleKeybind:Set(Enum.KeyCode.RightAlt)
	customTag:Set("")
	miscCheck:Set(false)
	miscSlider:Set(3)
	miscDropdown:Set(nil)
	miscColor:Set(Color3.fromRGB(100, 140, 255))
	print("Everything reset to default!")
end)

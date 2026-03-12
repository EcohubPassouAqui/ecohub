-- // Lib Atualizada
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/EcohubPassouAqui/EcoHub/refs/heads/main/V1/GCsdUGEmzBd7xaIxWqvMGSZF3EcB53.lua"))()

-- // Window Eco HUb
local gameName = "[ Eco Hub ]"
pcall(function()
	local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	if info and info.Name then gameName = info.Name end
end)

local Window = lib:CreateWindow({
	Title    = gameName,
	Subtitle = "v1.0",
})

-- // Tabs
local tabChams = Window:AddTab({
	Section = "Visuals",
	Title   = "Chams",
	Icon    = "eye",
})

local tabBox = Window:AddTab({
	Section = "Visuals",
	Title   = "Box ESP",
	Icon    = "box",
})

local tabVida = Window:AddTab({
	Section = "Visuals",
	Title   = "Health",
	Icon    = "heart",
})

local tabTraces = Window:AddTab({
	Section = "Visuals",
	Title   = "Traces",
	Icon    = "git-commit",
})

local tabLocalPlayer = Window:AddTab({
	Section = "Visuals",
	Title   = "Local Player",
	Icon    = "user",
})

local tabArmas = Window:AddTab({
	Section = "Visuals",
	Title   = "Weapons",
	Icon    = "crosshair",
})

local tabPlayers = Window:AddTab({
	Section = "General",
	Title   = "Players",
	Icon    = "users",
})

local tabSettings = Window:AddTab({
	Section = "General",
	Title   = "Settings",
	Icon    = "settings",
})

-- // Elements
local secChams = tabChams:AddSection("Chams Settings")

local chamsEnabled = secChams:AddToggle("Enable Chams", false, function(v)

end)

local chamsColor = secChams:AddColorPicker("Chams Color", Color3.fromRGB(255, 80, 80), function(v)

end)

local chamsType = secChams:AddDropdown("Chams Type", {"Filled", "Wireframe", "Outline"}, "Filled", function(v)

end)

local chamsTransparency = secChams:AddSlider("Transparency", 0, 100, 50, function(v)

end)

local secChamsStyle = tabChams:AddSection("Chams Style")

local chamsEnemies = secChamsStyle:AddCheckbox("Apply to Enemies", true, function(v)

end)

local chamsTeammates = secChamsStyle:AddCheckbox("Apply to Teammates", false, function(v)

end)

local chamsTeamColor = secChamsStyle:AddColorPicker("Teammate Color", Color3.fromRGB(80, 180, 255), function(v)

end)

local secBox = tabBox:AddSection("Box ESP Settings")

local boxEnabled = secBox:AddToggle("Enable Box ESP", false, function(v)

end)

local boxColor = secBox:AddColorPicker("Box Color", Color3.fromRGB(255, 255, 255), function(v)

end)

local boxType = secBox:AddDropdown("Box Type", {"2D", "3D", "Corner"}, "2D", function(v)

end)

local boxThickness = secBox:AddSlider("Thickness", 1, 5, 1, function(v)

end)

local secBoxStyle = tabBox:AddSection("Box Style")

local boxFilled = secBoxStyle:AddCheckbox("Filled Box", false, function(v)

end)

local boxFillTransparency = secBoxStyle:AddSlider("Fill Transparency", 0, 100, 80, function(v)

end)

local boxFillColor = secBoxStyle:AddColorPicker("Fill Color", Color3.fromRGB(255, 255, 255), function(v)

end)

local secHp = tabVida:AddSection("Health Bar Settings")

local hpEnabled = secHp:AddToggle("Enable Health Bar", false, function(v)

end)

local hpPosition = secHp:AddDropdown("Position", {"Left", "Right", "Top", "Bottom"}, "Left", function(v)

end)

local hpColorHigh = secHp:AddColorPicker("Color (High HP)", Color3.fromRGB(80, 220, 80), function(v)

end)

local hpColorLow = secHp:AddColorPicker("Color (Low HP)", Color3.fromRGB(220, 60, 60), function(v)

end)

local hpShowNumber = secHp:AddToggle("Show Number", false, function(v)

end)

local secHpStyle = tabVida:AddSection("Health Bar Style")

local hpBarWidth = secHpStyle:AddSlider("Bar Width", 1, 6, 2, function(v)

end)

local hpBarHeight = secHpStyle:AddSlider("Bar Height", 20, 80, 40, function(v)

end)

local hpShowBg = secHpStyle:AddCheckbox("Show Background", true, function(v)

end)

local secTraces = tabTraces:AddSection("Traces Settings")

local tracesEnabled = secTraces:AddToggle("Enable Traces", false, function(v)

end)

local tracesColor = secTraces:AddColorPicker("Traces Color", Color3.fromRGB(255, 255, 0), function(v)

end)

local tracesOrigin = secTraces:AddDropdown("Origin", {"Center", "Top", "Bottom"}, "Bottom", function(v)

end)

local tracesThickness = secTraces:AddSlider("Thickness", 1, 5, 1, function(v)

end)

local secTracesStyle = tabTraces:AddSection("Traces Style")

local tracesEnemiesOnly = secTracesStyle:AddCheckbox("Enemies Only", true, function(v)

end)

local tracesMaxDistance = secTracesStyle:AddSlider("Max Distance", 50, 2000, 1000, function(v)

end)

local secCrosshair = tabLocalPlayer:AddSection("Crosshair")

local crosshairEnabled = secCrosshair:AddToggle("Custom Crosshair", false, function(v)

end)

local crosshairColor = secCrosshair:AddColorPicker("Crosshair Color", Color3.fromRGB(255, 255, 255), function(v)

end)

local crosshairStyle = secCrosshair:AddDropdown("Crosshair Style", {"Cross", "Dot", "Circle", "T-Shape"}, "Cross", function(v)

end)

local crosshairSize = secCrosshair:AddSlider("Size", 5, 30, 10, function(v)

end)

local crosshairGap = secCrosshair:AddSlider("Gap", 0, 20, 4, function(v)

end)

local crosshairDot = secCrosshair:AddCheckbox("Show Center Dot", false, function(v)

end)

local secFov = tabLocalPlayer:AddSection("Field of View")

local fovEnabled = secFov:AddToggle("Show FOV", false, function(v)

end)

local fovRadius = secFov:AddSlider("FOV Radius", 50, 500, 150, function(v)

end)

local fovColor = secFov:AddColorPicker("FOV Color", Color3.fromRGB(255, 255, 255), function(v)

end)

local fovFilled = secFov:AddCheckbox("Filled FOV", false, function(v)

end)

local fovTransparency = secFov:AddSlider("FOV Transparency", 0, 100, 60, function(v)

end)

local secWeaponLabels = tabArmas:AddSection("Weapon Labels")

local weaponNameEnabled = secWeaponLabels:AddToggle("Weapon Name", false, function(v)

end)

local weaponDistEnabled = secWeaponLabels:AddToggle("Show Distance", false, function(v)

end)

local weaponTextColor = secWeaponLabels:AddColorPicker("Text Color", Color3.fromRGB(220, 220, 220), function(v)

end)

local weaponTextSize = secWeaponLabels:AddSlider("Text Size", 8, 20, 12, function(v)

end)

local weaponTextAlign = secWeaponLabels:AddDropdown("Text Alignment", {"Center", "Left", "Right"}, "Center", function(v)

end)

local secDropped = tabArmas:AddSection("Dropped Weapons")

local droppedWeaponEsp = secDropped:AddToggle("Dropped Weapon ESP", false, function(v)

end)

local droppedWeaponColor = secDropped:AddColorPicker("Dropped Color", Color3.fromRGB(255, 200, 50), function(v)

end)

local droppedWeaponMaxDist = secDropped:AddSlider("Max Pickup Distance", 10, 200, 60, function(v)

end)

local droppedWeaponAmmo = secDropped:AddCheckbox("Show Ammo Count", false, function(v)

end)

local secPlayerInfo = tabPlayers:AddSection("Player Info")

local playerInfo = secPlayerInfo:AddParagraph("About Player List", "Lista de jogadores com distancia em studs. Clique em um jogador para selecionar.")

local secSettings = tabSettings:AddSection("Interface")

local uiToggleKey = secSettings:AddKeybind("Toggle UI", Enum.KeyCode.RightAlt, function(v)

end)

local settingsNotifs = secSettings:AddToggle("Notifications", true, function(v)

end)

local settingsLanguage = secSettings:AddDropdown("Language", {"English", "Portuguese", "Spanish"}, "English", function(v)

end)

local settingsUiScale = secSettings:AddSlider("UI Scale", 50, 150, 100, function(v)

end)

local secPerformance = tabSettings:AddSection("Performance")

local settingsUpdateRate = secPerformance:AddSlider("Update Rate", 1, 60, 30, function(v)

end)

local settingsOptimize = secPerformance:AddCheckbox("Optimize Rendering", true, function(v)

end)

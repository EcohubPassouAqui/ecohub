local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/EcohubPassouAqui/ecohub/main/support/painel.lua"))()
UI = UI.init("Showcase", "v1.0.0", "SHOWCASE")

local AimOne, AimTwo = UI:AddTab("Aim", "Silent Aim") do
    local Section = AimOne:AddSeperator("Silent Aim") do
        local masterToggle = Section:AddToggle({
            title = "Enabled",
            desc = "This is a small tip which will appear when the user hovers over this toggle. It works on all elements",
            callback = function(state)
            end
        })

        local fovToggle, fovColor
        fovToggle, fovColor = Section:AddToggle({
            title = "Display field of view",
            checked = true,
            callback = function(state)
                fovColor.setColor(Color3.new(0,1,0))
            end,
            colorpicker = {
                default = Color3.new(0,0.5,1),
                callback = function(color)
                end
            }
        })

        local slider = Section:AddSlider({
            title = "Field of view",
            values = {min=0,max=250,default=50},
            callback = function(set)
            end,
        })

        Section:AddToggle({
            title = "Test slider return",
            callback = function()
                slider.setPercent(0.8)
                wait(3)
                slider.setValue(75)
            end
        })

        local bodyparts = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Arm" }
        local selection = Section:AddSelection({
            title = "Bodyparts",
            options = bodyparts,
            callback = function(selected)
            end
        })

        Section:AddToggle({
            title = "Test selection",
            callback = function()
                selection.setDropdownExpanded(true)
                wait(1)
                selection.setSelected({1,2,5})
                wait(2)
                selection.setOptions({"carrot", "rhubarb", "olive"})
            end
        })
    end
    
    local Section = AimTwo:AddSeperator("Tuning") do
        Section:AddToggle({
            title = "Do tuning"
        })

        local fruit = {"lime", "lemon", "mango", "nut"}
        local dropdown = Section:AddDropdown({
            title = "Demonstrative dropdown",
            options = fruit,
            callback = function(selected, actual)
            end
        })

        Section:AddToggle({
            title = "Test dropdown",
            callback = function()
                dropdown.setDropdownExpanded(true)
                wait(1)
                dropdown.setSelected(3)
                wait(2)
                dropdown.setOptions({"carrot", "rhubarb", "olive"})
            end
        })
    end
end

local VisualsOne, VisualsTwo = UI:AddTab("Visuals", "ESP and Chams") do
    local Section = VisualsOne:AddSeperator("ESP Settings") do
        Section:AddToggle({
            title = "Enabled",
            desc = "Enable ESP features",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "Box ESP",
            callback = function(state)
            end,
            colorpicker = {
                default = Color3.new(1,1,1),
                callback = function(color)
                end
            }
        })

        Section:AddToggle({
            title = "Name ESP",
            callback = function(state)
            end
        })

        Section:AddSlider({
            title = "Max Distance",
            values = {min=100,max=5000,default=2000},
            callback = function(set)
            end
        })
    end

    local Section = VisualsTwo:AddSeperator("Chams") do
        Section:AddToggle({
            title = "Enabled",
            callback = function(state)
            end,
            colorpicker = {
                default = Color3.new(1,0,0),
                callback = function(color)
                end
            }
        })

        Section:AddSlider({
            title = "Transparency",
            values = {min=0,max=100,default=50},
            callback = function(set)
            end
        })
    end
end

local MiscOne, MiscTwo = UI:AddTab("Misc", "Miscellaneous features") do
    local Section = MiscOne:AddSeperator("Movement") do
        Section:AddToggle({
            title = "Speed Hack",
            callback = function(state)
            end
        })

        Section:AddSlider({
            title = "Walk Speed",
            values = {min=16,max=200,default=16},
            callback = function(set)
            end
        })

        Section:AddToggle({
            title = "Jump Power",
            callback = function(state)
            end
        })

        Section:AddSlider({
            title = "Jump Height",
            values = {min=50,max=500,default=50},
            callback = function(set)
            end
        })
    end

    local Section = MiscTwo:AddSeperator("Teleport") do
        local locations = {"Spawn", "Base", "Shop", "Arena"}
        Section:AddDropdown({
            title = "Location",
            options = locations,
            callback = function(selected, actual)
            end
        })

        Section:AddButton({
            title = "Teleport",
            desc = "Teleport to selected location",
            callback = function()
            end
        })
    end
end

local SettingsOne, SettingsTwo = UI:AddTab("Settings", "UI Configuration") do
    local Section = SettingsOne:AddSeperator("UI Settings") do
        Section:AddToggle({
            title = "Rainbow Mode",
            callback = function(state)
            end
        })

        local themes = {"Dark", "Light", "Blue", "Red"}
        Section:AddDropdown({
            title = "Theme",
            options = themes,
            default = 1,
            callback = function(selected, actual)
            end
        })

        Section:AddTextInput({
            title = "UI Title",
            placeholder = "Enter title",
            callback = function(text)
                UI:UpdateTitle(text)
            end
        })

        Section:AddTextInput({
            title = "Version",
            placeholder = "Enter version",
            callback = function(text)
                UI:UpdateVersion(text)
            end
        })
    end

    local Section = SettingsTwo:AddSeperator("Keybinds") do
        Section:AddButton({
            title = "Toggle UI",
            desc = "Toggle UI visibility",
            callback = function()
                UI:ToggleGUI()
            end
        })

        local keybinds = {"RightControl", "RightShift", "Insert", "Delete", "Home", "End"}
        Section:AddDropdown({
            title = "UI Keybind",
            options = keybinds,
            default = 1,
            callback = function(selected, actual)
                UI:SetKeybind(Enum.KeyCode[actual])
            end
        })
    end
end

UI:AddConfigTab("configs", "cfg")

local CombatOne, CombatTwo = UI:AddTab("Combat", "Combat features") do
    local Section = CombatOne:AddSeperator("Weapon Mods") do
        Section:AddToggle({
            title = "No Recoil",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "No Spread",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "Infinite Ammo",
            callback = function(state)
            end
        })

        Section:AddSlider({
            title = "Fire Rate",
            values = {min=1,max=10,default=1},
            callback = function(set)
            end
        })
    end

    local Section = CombatTwo:AddSeperator("Auto Actions") do
        Section:AddToggle({
            title = "Auto Shoot",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "Auto Reload",
            callback = function(state)
            end
        })

        local targets = {"Players", "NPCs", "Both"}
        Section:AddSelection({
            title = "Target Types",
            options = targets,
            default = {1},
            callback = function(selected)
            end
        })
    end
end

local PlayerOne, PlayerTwo = UI:AddTab("Player", "Player modifications") do
    local Section = PlayerOne:AddSeperator("Character") do
        Section:AddToggle({
            title = "God Mode",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "Infinite Stamina",
            callback = function(state)
            end
        })

        Section:AddSlider({
            title = "Health",
            values = {min=100,max=10000,default=100},
            callback = function(set)
            end
        })

        Section:AddToggle({
            title = "No Fall Damage",
            callback = function(state)
            end
        })
    end

    local Section = PlayerTwo:AddSeperator("Appearance") do
        Section:AddTextInput({
            title = "Username",
            placeholder = "Enter username",
            callback = function(text)
            end
        })

        Section:AddToggle({
            title = "Hide Name",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "Custom Color",
            callback = function(state)
            end,
            colorpicker = {
                default = Color3.new(1,1,1),
                callback = function(color)
                end
            }
        })
    end
end

local WorldOne, WorldTwo = UI:AddTab("World", "World modifications") do
    local Section = WorldOne:AddSeperator("Environment") do
        Section:AddToggle({
            title = "Full Bright",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "No Fog",
            callback = function(state)
            end
        })

        Section:AddSlider({
            title = "Time of Day",
            values = {min=0,max=24,default=12},
            callback = function(set)
            end
        })

        local weather = {"Clear", "Rain", "Snow", "Storm"}
        Section:AddDropdown({
            title = "Weather",
            options = weather,
            callback = function(selected, actual)
            end
        })
    end

    local Section = WorldTwo:AddSeperator("Physics") do
        Section:AddSlider({
            title = "Gravity",
            values = {min=0,max=196,default=196},
            callback = function(set)
            end
        })

        Section:AddToggle({
            title = "No Clip",
            callback = function(state)
            end
        })

        Section:AddToggle({
            title = "Fly",
            callback = function(state)
            end
        })

        Section:AddSlider({
            title = "Fly Speed",
            values = {min=1,max=100,default=50},
            callback = function(set)
            end
        })
    end
end

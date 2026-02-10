local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/EcohubPassouAqui/ecohub/main/support/painel.lua"))()

local window = library:new({
    name = "Eco Hub",
    textsize = 12,
    font = "RobotoMono",
    color = Color3.fromRGB(138, 43, 226)
})

local watermark = window:watermark()
watermark:update({
    ["FPS"] = math.floor(1 / game:GetService("RunService").RenderStepped:Wait()),
    ["Ping"] = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
})
watermark:toggle(true)

local page1 = window:page({
    name = "Main"
})

local page2 = window:page({
    name = "Combat"
})

local page3 = window:page({
    name = "Visuals"
})

local page4 = window:page({
    name = "Misc"
})

local page5 = window:page({
    name = "Settings"
})

page1:openpage()

local section1 = page1:section({
    name = "Player",
    side = "left",
    size = 250
})

local section2 = page1:section({
    name = "Movement",
    side = "right",
    size = 250
})

local section3 = page2:section({
    name = "Aimbot",
    side = "left",
    size = 300
})

local section4 = page2:section({
    name = "Weapons",
    side = "right",
    size = 200
})

local section5 = page3:section({
    name = "ESP",
    side = "left",
    size = 280
})

local section6 = page3:section({
    name = "World",
    side = "right",
    size = 200
})

local section7 = page4:section({
    name = "Automation",
    side = "left",
    size = 200
})

local section8 = page5:section({
    name = "Configuration",
    side = "left",
    size = 380
})

local walkspeed_toggle = section1:toggle({
    name = "WalkSpeed",
    def = false,
    pointer = "main/walkspeed",
    callback = function(value)
        if value then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
        else
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end
})

local walkspeed_slider = section1:slider({
    name = "Speed Amount",
    min = 16,
    max = 200,
    def = 50,
    rounding = true,
    pointer = "main/walkspeed_amount",
    callback = function(value)
    end
})

local jumppower_toggle = section1:toggle({
    name = "JumpPower",
    def = false,
    pointer = "main/jumppower",
    callback = function(value)
        if value then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
        else
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end
})

local jumppower_slider = section1:slider({
    name = "Jump Amount",
    min = 50,
    max = 300,
    def = 100,
    rounding = true,
    pointer = "main/jumppower_amount",
    callback = function(value)
    end
})

local god_toggle = section1:toggle({
    name = "God Mode",
    def = false,
    pointer = "main/godmode",
    callback = function(value)
    end
})

local noclip_toggle = section2:toggle({
    name = "Noclip",
    def = false,
    pointer = "main/noclip",
    callback = function(value)
    end
})

local fly_toggle = section2:toggle({
    name = "Fly",
    def = false,
    pointer = "main/fly",
    callback = function(value)
    end
})

local fly_speed = section2:slider({
    name = "Fly Speed",
    min = 1,
    max = 10,
    def = 5,
    rounding = true,
    pointer = "main/flyspeed",
    callback = function(value)
    end
})

local inf_jump = section2:toggle({
    name = "Infinite Jump",
    def = false,
    pointer = "main/infjump",
    callback = function(value)
    end
})

local aimbot_toggle = section3:toggle({
    name = "Enable Aimbot",
    def = false,
    pointer = "combat/aimbot",
    callback = function(value)
    end
})

local aimbot_fov = section3:slider({
    name = "FOV Size",
    min = 10,
    max = 500,
    def = 150,
    rounding = true,
    pointer = "combat/aimbot_fov",
    callback = function(value)
    end
})

local aimbot_smoothness = section3:slider({
    name = "Smoothness",
    min = 1,
    max = 10,
    def = 5,
    rounding = true,
    pointer = "combat/aimbot_smooth",
    callback = function(value)
    end
})

local aimbot_part = section3:dropdown({
    name = "Target Part",
    def = "Head",
    options = {"Head", "Torso", "HumanoidRootPart"},
    pointer = "combat/aimbot_part",
    callback = function(value)
    end
})

local aimbot_team = section3:toggle({
    name = "Team Check",
    def = true,
    pointer = "combat/aimbot_team",
    callback = function(value)
    end
})

local aimbot_visible = section3:toggle({
    name = "Visible Check",
    def = true,
    pointer = "combat/aimbot_visible",
    callback = function(value)
    end
})

local aimbot_keybind = section3:keybind({
    name = "Aimbot Key",
    def = Enum.UserInputType.MouseButton2,
    pointer = "combat/aimbot_key",
    callback = function(value)
    end
})

local rapid_fire = section4:toggle({
    name = "Rapid Fire",
    def = false,
    pointer = "combat/rapidfire",
    callback = function(value)
    end
})

local no_recoil = section4:toggle({
    name = "No Recoil",
    def = false,
    pointer = "combat/norecoil",
    callback = function(value)
    end
})

local no_spread = section4:toggle({
    name = "No Spread",
    def = false,
    pointer = "combat/nospread",
    callback = function(value)
    end
})

local inf_ammo = section4:toggle({
    name = "Infinite Ammo",
    def = false,
    pointer = "combat/infammo",
    callback = function(value)
    end
})

local esp_toggle = section5:toggle({
    name = "Enable ESP",
    def = false,
    pointer = "visuals/esp",
    callback = function(value)
    end
})

local esp_boxes = section5:toggle({
    name = "Boxes",
    def = true,
    pointer = "visuals/esp_boxes",
    callback = function(value)
    end
})

local esp_names = section5:toggle({
    name = "Names",
    def = true,
    pointer = "visuals/esp_names",
    callback = function(value)
    end
})

local esp_distance = section5:toggle({
    name = "Distance",
    def = true,
    pointer = "visuals/esp_distance",
    callback = function(value)
    end
})

local esp_health = section5:toggle({
    name = "Health Bar",
    def = true,
    pointer = "visuals/esp_health",
    callback = function(value)
    end
})

local esp_team = section5:toggle({
    name = "Team Check",
    def = true,
    pointer = "visuals/esp_team",
    callback = function(value)
    end
})

local esp_color = section5:colorpicker({
    name = "ESP Color",
    def = Color3.fromRGB(138, 43, 226),
    pointer = "visuals/esp_color",
    callback = function(color)
    end
})

local fullbright = section6:toggle({
    name = "Fullbright",
    def = false,
    pointer = "visuals/fullbright",
    callback = function(value)
    end
})

local remove_fog = section6:toggle({
    name = "Remove Fog",
    def = false,
    pointer = "visuals/removefog",
    callback = function(value)
    end
})

local fov_changer = section6:slider({
    name = "FOV Changer",
    min = 70,
    max = 120,
    def = 90,
    rounding = true,
    pointer = "visuals/fov",
    callback = function(value)
        workspace.CurrentCamera.FieldOfView = value
    end
})

local auto_farm = section7:toggle({
    name = "Auto Farm",
    def = false,
    pointer = "misc/autofarm",
    callback = function(value)
    end
})

local auto_collect = section7:toggle({
    name = "Auto Collect",
    def = false,
    pointer = "misc/autocollect",
    callback = function(value)
    end
})

local anti_afk = section7:toggle({
    name = "Anti AFK",
    def = false,
    pointer = "misc/antiafk",
    callback = function(value)
    end
})

local config_loader = section8:configloader({
    folder = "EcoHub/Configs"
})

local theme_button = section8:button({
    name = "Change Theme",
    callback = function()
        window:settheme("accent", Color3.fromRGB(138, 43, 226))
    end
})

local destroy_gui = section8:button({
    name = "Destroy GUI",
    callback = function()
        window.screen:Destroy()
    end
})

window:setkey(Enum.KeyCode.RightShift)

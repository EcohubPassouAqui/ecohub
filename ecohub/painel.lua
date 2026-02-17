local function DestroyYep()
    for x = 1, 69 do
        if game.CoreGui:FindFirstChild("ecohub_gui") then
            game.CoreGui:FindFirstChild("ecohub_gui"):Destroy()
        end
    end
end

DestroyYep()
wait(0.069)

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Library = {}

local COLORS = {
    BG          = Color3.fromRGB(10, 10, 12),
    SIDEBAR     = Color3.fromRGB(7, 7, 9),
    ELEMENT     = Color3.fromRGB(18, 16, 22),
    SECTION     = Color3.fromRGB(14, 12, 18),
    HOVER       = Color3.fromRGB(28, 24, 36),
    ACTIVE      = Color3.fromRGB(22, 18, 30),
    ACCENT      = Color3.fromRGB(160, 80, 255),
    ACCENT_DIM  = Color3.fromRGB(100, 50, 180),
    TEXT        = Color3.fromRGB(255, 255, 255),
    TEXT_DIM    = Color3.fromRGB(140, 130, 160),
    TOGGLE_OFF  = Color3.fromRGB(28, 24, 36),
    TOGGLE_ON   = Color3.fromRGB(160, 80, 255),
    BORDER      = Color3.fromRGB(40, 30, 60),
    TAB_LINE    = Color3.fromRGB(160, 80, 255),
}

local function Tween(obj, props, t)
    TweenService:Create(obj, TweenInfo.new(t or 0.12, Enum.EasingStyle.Quad), props):Play()
end

local function MakeCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 6)
    c.Parent = parent
    return c
end

local function MakeBorder(parent, color)
    local s = Instance.new("UIStroke")
    s.Color = color or COLORS.BORDER
    s.Thickness = 1
    s.Parent = parent
    return s
end

function Library:CreateWindow(windowname, windowinfo)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "ecohub_gui"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = COLORS.BG
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.25, 0, 0.25, 0)
    Main.Size = UDim2.new(0, 560, 0, 360)
    MakeCorner(Main, 8)
    MakeBorder(Main, COLORS.BORDER)

    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = Main
    TitleBar.BackgroundColor3 = COLORS.SIDEBAR
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(1, 0, 0, 34)
    MakeCorner(TitleBar, 8)

    local TitleFix = Instance.new("Frame")
    TitleFix.Parent = TitleBar
    TitleFix.BackgroundColor3 = COLORS.SIDEBAR
    TitleFix.BorderSizePixel = 0
    TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
    TitleFix.Size = UDim2.new(1, 0, 0.5, 0)

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TitleBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 14, 0, 0)
    TitleLabel.Size = UDim2.new(0.5, 0, 1, 0)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = windowname or "ecohub"
    TitleLabel.TextColor3 = COLORS.TEXT
    TitleLabel.TextSize = 13
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local InfoLabel = Instance.new("TextLabel")
    InfoLabel.Parent = TitleBar
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.Position = UDim2.new(0, 0, 0, 0)
    InfoLabel.Size = UDim2.new(1, -14, 1, 0)
    InfoLabel.Font = Enum.Font.Gotham
    InfoLabel.Text = windowinfo or ""
    InfoLabel.TextColor3 = COLORS.TEXT_DIM
    InfoLabel.TextSize = 10
    InfoLabel.TextXAlignment = Enum.TextXAlignment.Right

    local TitleLine = Instance.new("Frame")
    TitleLine.Parent = Main
    TitleLine.BackgroundColor3 = COLORS.TAB_LINE
    TitleLine.BorderSizePixel = 0
    TitleLine.Position = UDim2.new(0, 0, 0, 34)
    TitleLine.Size = UDim2.new(1, 0, 0, 1)

    local TabBar = Instance.new("Frame")
    TabBar.Name = "TabBar"
    TabBar.Parent = Main
    TabBar.BackgroundColor3 = COLORS.SIDEBAR
    TabBar.BorderSizePixel = 0
    TabBar.Position = UDim2.new(0, 0, 0, 35)
    TabBar.Size = UDim2.new(1, 0, 0, 32)

    local TabBarLayout = Instance.new("UIListLayout")
    TabBarLayout.Parent = TabBar
    TabBarLayout.FillDirection = Enum.FillDirection.Horizontal
    TabBarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabBarLayout.Padding = UDim.new(0, 0)

    local TabBarLine = Instance.new("Frame")
    TabBarLine.Parent = Main
    TabBarLine.BackgroundColor3 = COLORS.BORDER
    TabBarLine.BorderSizePixel = 0
    TabBarLine.Position = UDim2.new(0, 0, 0, 67)
    TabBarLine.Size = UDim2.new(1, 0, 0, 1)

    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Parent = Main
    ContentArea.BackgroundTransparency = 1
    ContentArea.BorderSizePixel = 0
    ContentArea.Position = UDim2.new(0, 8, 0, 74)
    ContentArea.Size = UDim2.new(1, -16, 1, -80)

    local Pages = {}
    local ActiveTab = nil

    local dragging, dragStart, startPos, dragInput

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position
        end
    end)

    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    local PanelVisible = true

    UserInputService.InputBegan:Connect(function(input, gp)
        if input.KeyCode == Enum.KeyCode.LeftAlt or input.KeyCode == Enum.KeyCode.RightAlt then
            PanelVisible = not PanelVisible
            Main.Visible = PanelVisible
        end
    end)

    local Window = {}

    function Window:addPage(pagename)
        local Tab = Instance.new("TextButton")
        Tab.Name = "Tab_" .. pagename
        Tab.Parent = TabBar
        Tab.BackgroundColor3 = COLORS.SIDEBAR
        Tab.BorderSizePixel = 0
        Tab.Size = UDim2.new(0, 80, 1, 0)
        Tab.AutoButtonColor = false
        Tab.Font = Enum.Font.GothamSemibold
        Tab.Text = pagename
        Tab.TextColor3 = COLORS.TEXT_DIM
        Tab.TextSize = 11

        local TabUnderline = Instance.new("Frame")
        TabUnderline.Parent = Tab
        TabUnderline.BackgroundColor3 = COLORS.ACCENT
        TabUnderline.BorderSizePixel = 0
        TabUnderline.Position = UDim2.new(0, 0, 1, -2)
        TabUnderline.Size = UDim2.new(1, 0, 0, 2)
        TabUnderline.Visible = false
        MakeCorner(TabUnderline, 1)

        local PageScroll = Instance.new("ScrollingFrame")
        PageScroll.Name = "Page_" .. pagename
        PageScroll.Parent = ContentArea
        PageScroll.BackgroundTransparency = 1
        PageScroll.BorderSizePixel = 0
        PageScroll.Size = UDim2.new(1, 0, 1, 0)
        PageScroll.ScrollBarThickness = 2
        PageScroll.ScrollBarImageColor3 = COLORS.ACCENT
        PageScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        PageScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        PageScroll.Visible = false

        local PageLayout = Instance.new("UIListLayout")
        PageLayout.Parent = PageScroll
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 6)

        local PagePad = Instance.new("UIPadding")
        PagePad.Parent = PageScroll
        PagePad.PaddingTop = UDim.new(0, 2)
        PagePad.PaddingBottom = UDim.new(0, 6)
        PagePad.PaddingRight = UDim.new(0, 2)

        table.insert(Pages, {Tab=Tab, Page=PageScroll, Underline=TabUnderline})

        local function SelectTab()
            for _, p in pairs(Pages) do
                p.Page.Visible = false
                Tween(p.Tab, {TextColor3 = COLORS.TEXT_DIM})
                p.Underline.Visible = false
            end
            PageScroll.Visible = true
            Tween(Tab, {TextColor3 = COLORS.TEXT})
            TabUnderline.Visible = true
            PageScroll.CanvasPosition = Vector2.new(0, 0)
            ActiveTab = Tab
        end

        Tab.MouseButton1Click:Connect(SelectTab)
        Tab.MouseEnter:Connect(function()
            if ActiveTab ~= Tab then Tween(Tab, {TextColor3 = Color3.fromRGB(200, 180, 230)}) end
        end)
        Tab.MouseLeave:Connect(function()
            if ActiveTab ~= Tab then Tween(Tab, {TextColor3 = COLORS.TEXT_DIM}) end
        end)

        if #Pages == 1 then SelectTab() end

        local PageObj = {}

        function PageObj:addSection(sectionname)
            local SectionOuter = Instance.new("Frame")
            SectionOuter.Name = "Section_" .. sectionname
            SectionOuter.Parent = PageScroll
            SectionOuter.BackgroundColor3 = COLORS.SECTION
            SectionOuter.BorderSizePixel = 0
            SectionOuter.Size = UDim2.new(1, 0, 0, 0)
            SectionOuter.AutomaticSize = Enum.AutomaticSize.Y
            MakeCorner(SectionOuter, 7)
            MakeBorder(SectionOuter)

            local SecPad = Instance.new("UIPadding")
            SecPad.Parent = SectionOuter
            SecPad.PaddingTop = UDim.new(0, 30)
            SecPad.PaddingBottom = UDim.new(0, 6)
            SecPad.PaddingLeft = UDim.new(0, 5)
            SecPad.PaddingRight = UDim.new(0, 5)

            local SecTitle = Instance.new("TextLabel")
            SecTitle.Parent = SectionOuter
            SecTitle.BackgroundTransparency = 1
            SecTitle.Position = UDim2.new(0, 10, 0, 0)
            SecTitle.Size = UDim2.new(1, -10, 0, 28)
            SecTitle.Font = Enum.Font.GothamBold
            SecTitle.Text = sectionname
            SecTitle.TextColor3 = COLORS.ACCENT
            SecTitle.TextSize = 10
            SecTitle.TextXAlignment = Enum.TextXAlignment.Left

            local SecDivider = Instance.new("Frame")
            SecDivider.Parent = SectionOuter
            SecDivider.BackgroundColor3 = COLORS.BORDER
            SecDivider.BorderSizePixel = 0
            SecDivider.Position = UDim2.new(0, 10, 0, 26)
            SecDivider.Size = UDim2.new(1, -20, 0, 1)

            local SecLayout = Instance.new("UIListLayout")
            SecLayout.Parent = SectionOuter
            SecLayout.SortOrder = Enum.SortOrder.LayoutOrder
            SecLayout.Padding = UDim.new(0, 4)

            local SecObj = {}

            local function makeBase(height, color)
                local f = Instance.new("Frame")
                f.Parent = SectionOuter
                f.BackgroundColor3 = color or COLORS.ELEMENT
                f.BorderSizePixel = 0
                f.Size = UDim2.new(1, 0, 0, height)
                MakeCorner(f, 5)
                return f
            end

            function SecObj:addButton(buttonname, callback)
                local cb = callback or function() end
                local f = makeBase(28)

                local AccentBar = Instance.new("Frame")
                AccentBar.Parent = f
                AccentBar.BackgroundColor3 = COLORS.ACCENT
                AccentBar.BorderSizePixel = 0
                AccentBar.Position = UDim2.new(0, 0, 0.2, 0)
                AccentBar.Size = UDim2.new(0, 2, 0.6, 0)
                MakeCorner(AccentBar, 2)

                local btn = Instance.new("TextButton")
                btn.Parent = f
                btn.BackgroundTransparency = 1
                btn.Size = UDim2.new(1, 0, 1, 0)
                btn.AutoButtonColor = false
                btn.Font = Enum.Font.GothamSemibold
                btn.Text = buttonname or "Button"
                btn.TextColor3 = COLORS.TEXT
                btn.TextSize = 11
                btn.TextXAlignment = Enum.TextXAlignment.Left

                local pad = Instance.new("UIPadding")
                pad.Parent = btn
                pad.PaddingLeft = UDim.new(0, 12)

                btn.MouseEnter:Connect(function()
                    Tween(f, {BackgroundColor3 = COLORS.HOVER})
                    Tween(AccentBar, {BackgroundColor3 = Color3.fromRGB(200, 120, 255)})
                end)
                btn.MouseLeave:Connect(function()
                    Tween(f, {BackgroundColor3 = COLORS.ELEMENT})
                    Tween(AccentBar, {BackgroundColor3 = COLORS.ACCENT})
                end)
                btn.MouseButton1Down:Connect(function()
                    Tween(f, {BackgroundColor3 = COLORS.ACTIVE})
                    task.delay(0.12, function()
                        Tween(f, {BackgroundColor3 = COLORS.ELEMENT})
                        pcall(cb)
                    end)
                end)
            end

            function SecObj:addToggle(togglename, default, callback, keybind)
                local cb = callback or function() end
                local Enabled = default or false
                local CurrentKey = keybind or nil
                local Listening = false

                local f = makeBase(28)

                local lbl = Instance.new("TextLabel")
                lbl.Parent = f
                lbl.BackgroundTransparency = 1
                lbl.Position = UDim2.new(0, 10, 0, 0)
                lbl.Size = UDim2.new(1, -90, 1, 0)
                lbl.Font = Enum.Font.GothamSemibold
                lbl.Text = togglename or "Toggle"
                lbl.TextColor3 = COLORS.TEXT
                lbl.TextSize = 11
                lbl.TextXAlignment = Enum.TextXAlignment.Left

                local CheckBox = Instance.new("Frame")
                CheckBox.Parent = f
                CheckBox.BackgroundColor3 = Enabled and COLORS.TOGGLE_ON or COLORS.TOGGLE_OFF
                CheckBox.BorderSizePixel = 0
                CheckBox.Position = UDim2.new(1, -(keybind ~= nil and 56 or 26), 0.5, -8)
                CheckBox.Size = UDim2.new(0, 16, 0, 16)
                MakeCorner(CheckBox, 4)
                MakeBorder(CheckBox, Enabled and COLORS.ACCENT or COLORS.BORDER)

                local CheckMark = Instance.new("TextLabel")
                CheckMark.Parent = CheckBox
                CheckMark.BackgroundTransparency = 1
                CheckMark.Size = UDim2.new(1, 0, 1, 0)
                CheckMark.Font = Enum.Font.GothamBold
                CheckMark.Text = "v"
                CheckMark.TextColor3 = Color3.fromRGB(255, 255, 255)
                CheckMark.TextSize = 10
                CheckMark.Visible = Enabled

                if keybind ~= nil then
                    local KeyBtn = Instance.new("TextButton")
                    KeyBtn.Parent = f
                    KeyBtn.BackgroundColor3 = COLORS.TOGGLE_OFF
                    KeyBtn.BorderSizePixel = 0
                    KeyBtn.Position = UDim2.new(1, -78, 0.5, -9)
                    KeyBtn.Size = UDim2.new(0, 46, 0, 18)
                    KeyBtn.AutoButtonColor = false
                    KeyBtn.Font = Enum.Font.GothamSemibold
                    KeyBtn.Text = CurrentKey and tostring(CurrentKey):gsub("Enum.KeyCode.", "") or "NONE"
                    KeyBtn.TextColor3 = COLORS.TEXT_DIM
                    KeyBtn.TextSize = 8
                    MakeCorner(KeyBtn, 4)

                    KeyBtn.MouseButton1Click:Connect(function()
                        if Listening then return end
                        Listening = true
                        KeyBtn.Text = "..."
                        KeyBtn.TextColor3 = COLORS.ACCENT
                    end)

                    UserInputService.InputBegan:Connect(function(input, gp)
                        if Listening and input.UserInputType == Enum.UserInputType.Keyboard then
                            if input.KeyCode ~= Enum.KeyCode.Escape then
                                CurrentKey = input.KeyCode
                                KeyBtn.Text = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")
                            else
                                CurrentKey = nil
                                KeyBtn.Text = "NONE"
                            end
                            KeyBtn.TextColor3 = COLORS.TEXT_DIM
                            Listening = false
                        end
                    end)
                end

                local function Update()
                    Tween(CheckBox, {BackgroundColor3 = Enabled and COLORS.TOGGLE_ON or COLORS.TOGGLE_OFF})
                    local stroke = CheckBox:FindFirstChildOfClass("UIStroke")
                    if stroke then
                        Tween(stroke, {Color = Enabled and COLORS.ACCENT or COLORS.BORDER})
                    end
                    CheckMark.Visible = Enabled
                end

                local HitBtn = Instance.new("TextButton")
                HitBtn.Parent = f
                HitBtn.BackgroundTransparency = 1
                HitBtn.Size = UDim2.new(1, 0, 1, 0)
                HitBtn.AutoButtonColor = false
                HitBtn.Text = ""

                HitBtn.MouseEnter:Connect(function() Tween(f, {BackgroundColor3 = COLORS.HOVER}) end)
                HitBtn.MouseLeave:Connect(function() Tween(f, {BackgroundColor3 = COLORS.ELEMENT}) end)
                HitBtn.MouseButton1Click:Connect(function()
                    if Listening then return end
                    Enabled = not Enabled
                    Update()
                    pcall(cb, Enabled)
                end)

                UserInputService.InputBegan:Connect(function(input, gp)
                    if not gp and CurrentKey and input.KeyCode == CurrentKey and not Listening then
                        Enabled = not Enabled
                        Update()
                        pcall(cb, Enabled)
                    end
                end)

                local ctrl = {}
                function ctrl:Set(v) Enabled = v Update() pcall(cb, Enabled) end
                function ctrl:Get() return Enabled end
                return ctrl
            end

            function SecObj:addSlider(slidername, minvalue, maxvalue, default, callback)
                local cb = callback or function() end
                local mn = tonumber(minvalue) or 0
                local mx = tonumber(maxvalue) or 100
                local cur = math.clamp(tonumber(default) or mn, mn, mx)

                local f = makeBase(44)

                local nameLbl = Instance.new("TextLabel")
                nameLbl.Parent = f
                nameLbl.BackgroundTransparency = 1
                nameLbl.Position = UDim2.new(0, 10, 0, 4)
                nameLbl.Size = UDim2.new(1, -60, 0, 18)
                nameLbl.Font = Enum.Font.GothamSemibold
                nameLbl.Text = slidername or "Slider"
                nameLbl.TextColor3 = COLORS.TEXT
                nameLbl.TextSize = 11
                nameLbl.TextXAlignment = Enum.TextXAlignment.Left

                local valLbl = Instance.new("TextLabel")
                valLbl.Parent = f
                valLbl.BackgroundTransparency = 1
                valLbl.Position = UDim2.new(1, -54, 0, 4)
                valLbl.Size = UDim2.new(0, 44, 0, 18)
                valLbl.Font = Enum.Font.GothamSemibold
                valLbl.Text = tostring(cur)
                valLbl.TextColor3 = COLORS.ACCENT
                valLbl.TextSize = 11
                valLbl.TextXAlignment = Enum.TextXAlignment.Right

                local Track = Instance.new("TextButton")
                Track.Parent = f
                Track.BackgroundColor3 = COLORS.TOGGLE_OFF
                Track.BorderSizePixel = 0
                Track.Position = UDim2.new(0, 10, 0, 30)
                Track.Size = UDim2.new(1, -20, 0, 7)
                Track.AutoButtonColor = false
                Track.Text = ""
                MakeCorner(Track, 3)

                local Fill = Instance.new("Frame")
                Fill.Parent = Track
                Fill.BackgroundColor3 = COLORS.ACCENT
                Fill.BorderSizePixel = 0
                Fill.Size = UDim2.new((cur - mn)/(mx - mn), 0, 1, 0)
                MakeCorner(Fill, 3)

                local Knob = Instance.new("Frame")
                Knob.Parent = Track
                Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Knob.BorderSizePixel = 0
                Knob.AnchorPoint = Vector2.new(0.5, 0.5)
                Knob.Position = UDim2.new((cur - mn)/(mx - mn), 0, 0.5, 0)
                Knob.Size = UDim2.new(0, 9, 0, 9)
                MakeCorner(Knob, 5)

                local Dragging = false

                local function UpdateSlider(px)
                    local pct = math.clamp((px - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
                    cur = math.floor(mn + (mx - mn) * pct)
                    Fill.Size = UDim2.new(pct, 0, 1, 0)
                    Knob.Position = UDim2.new(pct, 0, 0.5, 0)
                    valLbl.Text = tostring(cur)
                    pcall(cb, cur)
                end

                Track.MouseButton1Down:Connect(function(x, y)
                    Dragging = true
                    UpdateSlider(x)
                end)
                UserInputService.InputChanged:Connect(function(i)
                    if Dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
                        UpdateSlider(i.Position.X)
                    end
                end)
                UserInputService.InputEnded:Connect(function(i)
                    if i.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = false end
                end)

                f.MouseEnter:Connect(function() Tween(f, {BackgroundColor3 = COLORS.HOVER}) end)
                f.MouseLeave:Connect(function() Tween(f, {BackgroundColor3 = COLORS.ELEMENT}) end)

                local ctrl = {}
                function ctrl:Set(v)
                    cur = math.clamp(v, mn, mx)
                    local pct = (cur-mn)/(mx-mn)
                    Fill.Size = UDim2.new(pct, 0, 1, 0)
                    Knob.Position = UDim2.new(pct, 0, 0.5, 0)
                    valLbl.Text = tostring(cur)
                end
                function ctrl:Get() return cur end
                return ctrl
            end

            function SecObj:addTextBox(textboxname, placeholder, callback)
                local cb = callback or function() end
                local f = makeBase(28)

                local nameLbl = Instance.new("TextLabel")
                nameLbl.Parent = f
                nameLbl.BackgroundTransparency = 1
                nameLbl.Position = UDim2.new(0, 10, 0, 0)
                nameLbl.Size = UDim2.new(0.52, 0, 1, 0)
                nameLbl.Font = Enum.Font.GothamSemibold
                nameLbl.Text = textboxname or "TextBox"
                nameLbl.TextColor3 = COLORS.TEXT
                nameLbl.TextSize = 11
                nameLbl.TextXAlignment = Enum.TextXAlignment.Left

                local Input = Instance.new("TextBox")
                Input.Parent = f
                Input.BackgroundColor3 = COLORS.TOGGLE_OFF
                Input.BorderSizePixel = 0
                Input.Position = UDim2.new(0.52, 4, 0.5, -9)
                Input.Size = UDim2.new(0.48, -14, 0, 18)
                Input.Font = Enum.Font.GothamSemibold
                Input.PlaceholderText = placeholder or ""
                Input.PlaceholderColor3 = COLORS.TEXT_DIM
                Input.Text = ""
                Input.TextColor3 = COLORS.TEXT
                Input.TextSize = 10
                Input.ClearTextOnFocus = false
                MakeCorner(Input, 4)
                MakeBorder(Input)

                Input.Focused:Connect(function()
                    Tween(Input, {BackgroundColor3 = COLORS.ACTIVE})
                    local s = Input:FindFirstChildOfClass("UIStroke")
                    if s then Tween(s, {Color = COLORS.ACCENT}) end
                end)
                Input.FocusLost:Connect(function()
                    Tween(Input, {BackgroundColor3 = COLORS.TOGGLE_OFF})
                    local s = Input:FindFirstChildOfClass("UIStroke")
                    if s then Tween(s, {Color = COLORS.BORDER}) end
                    pcall(cb, Input.Text)
                end)
            end

            function SecObj:addDropdown(dropdownname, list, callback)
                local cb = callback or function() end
                local Selected = nil
                local Open = false

                local Wrapper = Instance.new("Frame")
                Wrapper.Parent = SectionOuter
                Wrapper.BackgroundTransparency = 1
                Wrapper.BorderSizePixel = 0
                Wrapper.Size = UDim2.new(1, 0, 0, 28)
                Wrapper.ClipsDescendants = false

                local Header = Instance.new("Frame")
                Header.Parent = Wrapper
                Header.BackgroundColor3 = COLORS.ELEMENT
                Header.BorderSizePixel = 0
                Header.Size = UDim2.new(1, 0, 0, 28)
                Header.ZIndex = 5
                MakeCorner(Header, 5)

                local DDName = Instance.new("TextLabel")
                DDName.Parent = Header
                DDName.BackgroundTransparency = 1
                DDName.Position = UDim2.new(0, 10, 0, 0)
                DDName.Size = UDim2.new(0.58, 0, 1, 0)
                DDName.Font = Enum.Font.GothamSemibold
                DDName.Text = dropdownname or "Dropdown"
                DDName.TextColor3 = COLORS.TEXT
                DDName.TextSize = 11
                DDName.TextXAlignment = Enum.TextXAlignment.Left
                DDName.ZIndex = 6

                local DDSel = Instance.new("TextLabel")
                DDSel.Parent = Header
                DDSel.BackgroundTransparency = 1
                DDSel.Position = UDim2.new(0.58, 0, 0, 0)
                DDSel.Size = UDim2.new(0.42, -28, 1, 0)
                DDSel.Font = Enum.Font.Gotham
                DDSel.Text = "none"
                DDSel.TextColor3 = COLORS.TEXT_DIM
                DDSel.TextSize = 10
                DDSel.TextXAlignment = Enum.TextXAlignment.Right
                DDSel.ZIndex = 6

                local DDArrow = Instance.new("TextLabel")
                DDArrow.Parent = Header
                DDArrow.BackgroundTransparency = 1
                DDArrow.Position = UDim2.new(1, -22, 0, 0)
                DDArrow.Size = UDim2.new(0, 20, 1, 0)
                DDArrow.Font = Enum.Font.GothamBold
                DDArrow.Text = "v"
                DDArrow.TextColor3 = COLORS.ACCENT
                DDArrow.TextSize = 10
                DDArrow.ZIndex = 6

                local DropList = Instance.new("Frame")
                DropList.Parent = Wrapper
                DropList.BackgroundColor3 = COLORS.SECTION
                DropList.BorderSizePixel = 0
                DropList.Position = UDim2.new(0, 0, 0, 30)
                DropList.Size = UDim2.new(1, 0, 0, 0)
                DropList.ZIndex = 10
                DropList.ClipsDescendants = true
                DropList.Visible = false
                MakeCorner(DropList, 5)
                MakeBorder(DropList)

                local DropScroll = Instance.new("ScrollingFrame")
                DropScroll.Parent = DropList
                DropScroll.BackgroundTransparency = 1
                DropScroll.BorderSizePixel = 0
                DropScroll.Size = UDim2.new(1, 0, 1, 0)
                DropScroll.ScrollBarThickness = 2
                DropScroll.ScrollBarImageColor3 = COLORS.ACCENT
                DropScroll.ZIndex = 10
                DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                DropScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

                local DropInner = Instance.new("UIListLayout")
                DropInner.Parent = DropScroll
                DropInner.SortOrder = Enum.SortOrder.LayoutOrder
                DropInner.Padding = UDim.new(0, 2)

                local DropPad = Instance.new("UIPadding")
                DropPad.Parent = DropScroll
                DropPad.PaddingTop = UDim.new(0, 4)
                DropPad.PaddingBottom = UDim.new(0, 4)
                DropPad.PaddingLeft = UDim.new(0, 4)
                DropPad.PaddingRight = UDim.new(0, 4)

                local targetH = math.min(#list * 26 + 8, 130)

                local function CloseDD()
                    Open = false
                    DDArrow.Text = "v"
                    Tween(DropList, {Size = UDim2.new(1, 0, 0, 0)})
                    task.delay(0.14, function()
                        DropList.Visible = false
                        Wrapper.Size = UDim2.new(1, 0, 0, 28)
                    end)
                end

                local function OpenDD()
                    Open = true
                    DDArrow.Text = "^"
                    DropList.Visible = true
                    Tween(DropList, {Size = UDim2.new(1, 0, 0, targetH)})
                    Wrapper.Size = UDim2.new(1, 0, 0, 30 + targetH)
                end

                local HitBtn = Instance.new("TextButton")
                HitBtn.Parent = Header
                HitBtn.BackgroundTransparency = 1
                HitBtn.Size = UDim2.new(1, 0, 1, 0)
                HitBtn.Text = ""
                HitBtn.AutoButtonColor = false
                HitBtn.ZIndex = 7

                HitBtn.MouseButton1Click:Connect(function()
                    if Open then CloseDD() else OpenDD() end
                end)
                HitBtn.MouseEnter:Connect(function() Tween(Header, {BackgroundColor3 = COLORS.HOVER}) end)
                HitBtn.MouseLeave:Connect(function() Tween(Header, {BackgroundColor3 = COLORS.ELEMENT}) end)

                for _, item in ipairs(list) do
                    local Opt = Instance.new("TextButton")
                    Opt.Parent = DropScroll
                    Opt.BackgroundColor3 = COLORS.ELEMENT
                    Opt.BorderSizePixel = 0
                    Opt.Size = UDim2.new(1, 0, 0, 22)
                    Opt.AutoButtonColor = false
                    Opt.Font = Enum.Font.GothamSemibold
                    Opt.Text = item
                    Opt.TextColor3 = COLORS.TEXT
                    Opt.TextSize = 10
                    Opt.ZIndex = 11
                    MakeCorner(Opt, 4)

                    Opt.MouseEnter:Connect(function() Tween(Opt, {BackgroundColor3 = COLORS.HOVER}) end)
                    Opt.MouseLeave:Connect(function()
                        if Selected ~= item then Tween(Opt, {BackgroundColor3 = COLORS.ELEMENT}) end
                    end)
                    Opt.MouseButton1Click:Connect(function()
                        Selected = item
                        DDSel.Text = item
                        DDSel.TextColor3 = COLORS.ACCENT
                        CloseDD()
                        pcall(cb, item)
                    end)
                end

                local ctrl = {}
                function ctrl:Set(v) Selected = v DDSel.Text = v DDSel.TextColor3 = COLORS.ACCENT end
                function ctrl:Get() return Selected end
                return ctrl
            end

            function SecObj:addColorPicker(colorname, default, callback)
                local cb = callback or function() end
                local CurrentColor = default or Color3.fromRGB(160, 80, 255)
                local H, S, V = Color3.toHSV(CurrentColor)
                local Open = false

                local Wrapper = Instance.new("Frame")
                Wrapper.Parent = SectionOuter
                Wrapper.BackgroundTransparency = 1
                Wrapper.BorderSizePixel = 0
                Wrapper.Size = UDim2.new(1, 0, 0, 28)

                local Header = Instance.new("Frame")
                Header.Parent = Wrapper
                Header.BackgroundColor3 = COLORS.ELEMENT
                Header.BorderSizePixel = 0
                Header.Size = UDim2.new(1, 0, 0, 28)
                MakeCorner(Header, 5)

                local CPName = Instance.new("TextLabel")
                CPName.Parent = Header
                CPName.BackgroundTransparency = 1
                CPName.Position = UDim2.new(0, 10, 0, 0)
                CPName.Size = UDim2.new(0.65, 0, 1, 0)
                CPName.Font = Enum.Font.GothamSemibold
                CPName.Text = colorname or "Color"
                CPName.TextColor3 = COLORS.TEXT
                CPName.TextSize = 11
                CPName.TextXAlignment = Enum.TextXAlignment.Left

                local HexLbl = Instance.new("TextLabel")
                HexLbl.Parent = Header
                HexLbl.BackgroundTransparency = 1
                HexLbl.Position = UDim2.new(0.65, 0, 0, 0)
                HexLbl.Size = UDim2.new(0.35, -36, 1, 0)
                HexLbl.Font = Enum.Font.Gotham
                HexLbl.Text = "#FFFFFF"
                HexLbl.TextColor3 = COLORS.TEXT_DIM
                HexLbl.TextSize = 9
                HexLbl.TextXAlignment = Enum.TextXAlignment.Right

                local Preview = Instance.new("Frame")
                Preview.Parent = Header
                Preview.BackgroundColor3 = CurrentColor
                Preview.BorderSizePixel = 0
                Preview.Position = UDim2.new(1, -30, 0.5, -7)
                Preview.Size = UDim2.new(0, 14, 0, 14)
                MakeCorner(Preview, 3)
                MakeBorder(Preview)

                local Panel = Instance.new("Frame")
                Panel.Parent = Wrapper
                Panel.BackgroundColor3 = COLORS.SECTION
                Panel.BorderSizePixel = 0
                Panel.Position = UDim2.new(0, 0, 0, 30)
                Panel.Size = UDim2.new(1, 0, 0, 0)
                Panel.ClipsDescendants = true
                Panel.Visible = false
                MakeCorner(Panel, 5)
                MakeBorder(Panel)

                local function ToHex(c)
                    return string.format("#%02X%02X%02X", math.floor(c.R*255), math.floor(c.G*255), math.floor(c.B*255))
                end

                local function Refresh()
                    CurrentColor = Color3.fromHSV(H, S, V)
                    Preview.BackgroundColor3 = CurrentColor
                    HexLbl.Text = ToHex(CurrentColor)
                    pcall(cb, CurrentColor)
                end

                local Channels = {
                    {lbl="H", get=function() return H end, set=function(p) H=p end, mult=360},
                    {lbl="S", get=function() return S end, set=function(p) S=p end, mult=100},
                    {lbl="V", get=function() return V end, set=function(p) V=p end, mult=100},
                }

                local panelH = #Channels * 28 + 10

                for i, ch in ipairs(Channels) do
                    local Row = Instance.new("Frame")
                    Row.Parent = Panel
                    Row.BackgroundTransparency = 1
                    Row.Position = UDim2.new(0, 8, 0, 6 + (i-1)*28)
                    Row.Size = UDim2.new(1, -16, 0, 22)

                    local RL = Instance.new("TextLabel")
                    RL.Parent = Row
                    RL.BackgroundTransparency = 1
                    RL.Size = UDim2.new(0, 16, 1, 0)
                    RL.Font = Enum.Font.GothamBold
                    RL.Text = ch.lbl
                    RL.TextColor3 = COLORS.ACCENT
                    RL.TextSize = 10

                    local RT = Instance.new("TextButton")
                    RT.Parent = Row
                    RT.BackgroundColor3 = COLORS.TOGGLE_OFF
                    RT.BorderSizePixel = 0
                    RT.Position = UDim2.new(0, 22, 0.5, -3)
                    RT.Size = UDim2.new(1, -62, 0, 6)
                    RT.AutoButtonColor = false
                    RT.Text = ""
                    MakeCorner(RT, 3)

                    local RF = Instance.new("Frame")
                    RF.Parent = RT
                    RF.BackgroundColor3 = COLORS.ACCENT
                    RF.BorderSizePixel = 0
                    RF.Size = UDim2.new(ch.get(), 0, 1, 0)
                    MakeCorner(RF, 3)

                    local RKnob = Instance.new("Frame")
                    RKnob.Parent = RT
                    RKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    RKnob.BorderSizePixel = 0
                    RKnob.AnchorPoint = Vector2.new(0.5, 0.5)
                    RKnob.Position = UDim2.new(ch.get(), 0, 0.5, 0)
                    RKnob.Size = UDim2.new(0, 8, 0, 8)
                    MakeCorner(RKnob, 4)

                    local RV = Instance.new("TextLabel")
                    RV.Parent = Row
                    RV.BackgroundTransparency = 1
                    RV.Position = UDim2.new(1, -36, 0, 0)
                    RV.Size = UDim2.new(0, 36, 1, 0)
                    RV.Font = Enum.Font.Gotham
                    RV.Text = tostring(math.floor(ch.get() * ch.mult))
                    RV.TextColor3 = COLORS.TEXT_DIM
                    RV.TextSize = 9

                    local RDrag = false
                    RT.MouseButton1Down:Connect(function() RDrag = true end)
                    UserInputService.InputChanged:Connect(function(inp)
                        if RDrag and inp.UserInputType == Enum.UserInputType.MouseMovement then
                            local pct = math.clamp((inp.Position.X - RT.AbsolutePosition.X)/RT.AbsoluteSize.X, 0, 1)
                            RF.Size = UDim2.new(pct, 0, 1, 0)
                            RKnob.Position = UDim2.new(pct, 0, 0.5, 0)
                            RV.Text = tostring(math.floor(pct * ch.mult))
                            ch.set(pct)
                            Refresh()
                        end
                    end)
                    UserInputService.InputEnded:Connect(function(inp)
                        if inp.UserInputType == Enum.UserInputType.MouseButton1 then RDrag = false end
                    end)
                end

                local HitBtn = Instance.new("TextButton")
                HitBtn.Parent = Header
                HitBtn.BackgroundTransparency = 1
                HitBtn.Size = UDim2.new(1, 0, 1, 0)
                HitBtn.Text = ""
                HitBtn.AutoButtonColor = false

                HitBtn.MouseEnter:Connect(function() Tween(Header, {BackgroundColor3 = COLORS.HOVER}) end)
                HitBtn.MouseLeave:Connect(function() Tween(Header, {BackgroundColor3 = COLORS.ELEMENT}) end)
                HitBtn.MouseButton1Click:Connect(function()
                    Open = not Open
                    if Open then
                        Panel.Visible = true
                        Tween(Panel, {Size = UDim2.new(1, 0, 0, panelH)})
                        Wrapper.Size = UDim2.new(1, 0, 0, 30 + panelH)
                    else
                        Tween(Panel, {Size = UDim2.new(1, 0, 0, 0)})
                        task.delay(0.14, function()
                            Panel.Visible = false
                            Wrapper.Size = UDim2.new(1, 0, 0, 28)
                        end)
                    end
                end)

                HexLbl.Text = ToHex(CurrentColor)

                local ctrl = {}
                function ctrl:Set(c)
                    CurrentColor = c
                    H, S, V = Color3.toHSV(c)
                    Preview.BackgroundColor3 = c
                    HexLbl.Text = ToHex(c)
                end
                function ctrl:Get() return CurrentColor end
                return ctrl
            end

            return SecObj
        end

        return PageObj
    end

    return Window
end

return Library

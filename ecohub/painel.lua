local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TextService      = game:GetService("TextService")

local Library = {}
Library.__index = Library

local function Err(msg)
	print("[ecohub ERROR] " .. tostring(msg))
end

local Icons = {
	["lucide-accessibility"]      = "rbxassetid://10709751939",
	["lucide-activity"]           = "rbxassetid://10709752035",
	["lucide-alert-circle"]       = "rbxassetid://10709752996",
	["lucide-alert-triangle"]     = "rbxassetid://10709753149",
	["lucide-anchor"]             = "rbxassetid://10709761530",
	["lucide-angry"]              = "rbxassetid://10709761629",
	["lucide-aperture"]           = "rbxassetid://10709761813",
	["lucide-archive"]            = "rbxassetid://10709762233",
	["lucide-arrow-down"]         = "rbxassetid://10709767827",
	["lucide-arrow-left"]         = "rbxassetid://10709768114",
	["lucide-arrow-right"]        = "rbxassetid://10709768347",
	["lucide-arrow-up"]           = "rbxassetid://10709768939",
	["lucide-at-sign"]            = "rbxassetid://10709769286",
	["lucide-award"]              = "rbxassetid://10709769406",
	["lucide-axe"]                = "rbxassetid://10709769508",
	["lucide-baby"]               = "rbxassetid://10709769732",
	["lucide-backpack"]           = "rbxassetid://10709769841",
	["lucide-banana"]             = "rbxassetid://10709770005",
	["lucide-bar-chart"]          = "rbxassetid://10709773755",
	["lucide-bar-chart-2"]        = "rbxassetid://10709770317",
	["lucide-battery"]            = "rbxassetid://10709774640",
	["lucide-beaker"]             = "rbxassetid://10709774756",
	["lucide-bed"]                = "rbxassetid://10709775036",
	["lucide-beer"]               = "rbxassetid://10709775167",
	["lucide-bell"]               = "rbxassetid://10709775704",
	["lucide-bell-off"]           = "rbxassetid://10709775320",
	["lucide-bell-ring"]          = "rbxassetid://10709775560",
	["lucide-bike"]               = "rbxassetid://10709775894",
	["lucide-bluetooth"]          = "rbxassetid://10709776655",
	["lucide-bold"]               = "rbxassetid://10747813908",
	["lucide-bomb"]               = "rbxassetid://10709781460",
	["lucide-bone"]               = "rbxassetid://10709781605",
	["lucide-book"]               = "rbxassetid://10709781824",
	["lucide-book-open"]          = "rbxassetid://10709781717",
	["lucide-bookmark"]           = "rbxassetid://10709782154",
	["lucide-bot"]                = "rbxassetid://10709782230",
	["lucide-box"]                = "rbxassetid://10709782497",
	["lucide-briefcase"]          = "rbxassetid://10709782662",
	["lucide-brush"]              = "rbxassetid://10709782758",
	["lucide-bug"]                = "rbxassetid://10709782845",
	["lucide-building"]           = "rbxassetid://10709783051",
	["lucide-calendar"]           = "rbxassetid://10709789505",
	["lucide-camera"]             = "rbxassetid://10709789686",
	["lucide-car"]                = "rbxassetid://10709789810",
	["lucide-check"]              = "rbxassetid://10709790644",
	["lucide-check-circle"]       = "rbxassetid://10709790387",
	["lucide-check-square"]       = "rbxassetid://10709790537",
	["lucide-chevron-down"]       = "rbxassetid://10709790948",
	["lucide-chevron-left"]       = "rbxassetid://10709791281",
	["lucide-chevron-right"]      = "rbxassetid://10709791437",
	["lucide-chevron-up"]         = "rbxassetid://10709791523",
	["lucide-circle"]             = "rbxassetid://10709798174",
	["lucide-clock"]              = "rbxassetid://10709805144",
	["lucide-cloud"]              = "rbxassetid://10709806740",
	["lucide-code"]               = "rbxassetid://10709810463",
	["lucide-coffee"]             = "rbxassetid://10709810814",
	["lucide-cog"]                = "rbxassetid://10709810948",
	["lucide-coins"]              = "rbxassetid://10709811110",
	["lucide-command"]            = "rbxassetid://10709811365",
	["lucide-compass"]            = "rbxassetid://10709811445",
	["lucide-copy"]               = "rbxassetid://10709812159",
	["lucide-cpu"]                = "rbxassetid://10709813383",
	["lucide-crosshair"]          = "rbxassetid://10709818534",
	["lucide-crown"]              = "rbxassetid://10709818626",
	["lucide-database"]           = "rbxassetid://10709818996",
	["lucide-diamond"]            = "rbxassetid://10709819149",
	["lucide-disc"]               = "rbxassetid://10723343537",
	["lucide-dollar-sign"]        = "rbxassetid://10723343958",
	["lucide-download"]           = "rbxassetid://10723344270",
	["lucide-edit"]               = "rbxassetid://10734883598",
	["lucide-eye"]                = "rbxassetid://10723346959",
	["lucide-eye-off"]            = "rbxassetid://10723346871",
	["lucide-file"]               = "rbxassetid://10723374641",
	["lucide-filter"]             = "rbxassetid://10723375128",
	["lucide-fingerprint"]        = "rbxassetid://10723375250",
	["lucide-flame"]              = "rbxassetid://10723376114",
	["lucide-folder"]             = "rbxassetid://10723387563",
	["lucide-gamepad"]            = "rbxassetid://10723395457",
	["lucide-gamepad-2"]          = "rbxassetid://10723395215",
	["lucide-gauge"]              = "rbxassetid://10723395708",
	["lucide-gem"]                = "rbxassetid://10723396000",
	["lucide-ghost"]              = "rbxassetid://10723396107",
	["lucide-gift"]               = "rbxassetid://10723396402",
	["lucide-globe"]              = "rbxassetid://10723404337",
	["lucide-hammer"]             = "rbxassetid://10723405360",
	["lucide-heart"]              = "rbxassetid://10723406885",
	["lucide-help-circle"]        = "rbxassetid://10723406988",
	["lucide-home"]               = "rbxassetid://10723407389",
	["lucide-image"]              = "rbxassetid://10723415040",
	["lucide-info"]               = "rbxassetid://10723415903",
	["lucide-key"]                = "rbxassetid://10723416652",
	["lucide-keyboard"]           = "rbxassetid://10723416765",
	["lucide-lamp"]               = "rbxassetid://10723417513",
	["lucide-layers"]             = "rbxassetid://10723424505",
	["lucide-leaf"]               = "rbxassetid://10723425539",
	["lucide-lightbulb"]          = "rbxassetid://10723425852",
	["lucide-link"]               = "rbxassetid://10723426722",
	["lucide-list"]               = "rbxassetid://10723433811",
	["lucide-lock"]               = "rbxassetid://10723434711",
	["lucide-log-in"]             = "rbxassetid://10723434830",
	["lucide-log-out"]            = "rbxassetid://10723434906",
	["lucide-magnet"]             = "rbxassetid://10723435069",
	["lucide-mail"]               = "rbxassetid://10734885430",
	["lucide-map"]                = "rbxassetid://10734886202",
	["lucide-map-pin"]            = "rbxassetid://10734886004",
	["lucide-maximize"]           = "rbxassetid://10734886735",
	["lucide-medal"]              = "rbxassetid://10734887072",
	["lucide-megaphone"]          = "rbxassetid://10734887454",
	["lucide-menu"]               = "rbxassetid://10734887784",
	["lucide-message-circle"]     = "rbxassetid://10734888000",
	["lucide-message-square"]     = "rbxassetid://10734888228",
	["lucide-mic"]                = "rbxassetid://10734888864",
	["lucide-mic-off"]            = "rbxassetid://10734888646",
	["lucide-minimize"]           = "rbxassetid://10734895698",
	["lucide-minus"]              = "rbxassetid://10734896206",
	["lucide-minus-circle"]       = "rbxassetid://10734895856",
	["lucide-monitor"]            = "rbxassetid://10734896881",
	["lucide-moon"]               = "rbxassetid://10734897102",
	["lucide-more-horizontal"]    = "rbxassetid://10734897250",
	["lucide-more-vertical"]      = "rbxassetid://10734897387",
	["lucide-mountain"]           = "rbxassetid://10734897956",
	["lucide-mouse"]              = "rbxassetid://10734898592",
	["lucide-music"]              = "rbxassetid://10734905958",
	["lucide-navigation"]         = "rbxassetid://10734906744",
	["lucide-network"]            = "rbxassetid://10734906975",
	["lucide-newspaper"]          = "rbxassetid://10734907168",
	["lucide-package"]            = "rbxassetid://10734909540",
	["lucide-paint-bucket"]       = "rbxassetid://10734909847",
	["lucide-paintbrush"]         = "rbxassetid://10734910187",
	["lucide-palette"]            = "rbxassetid://10734910430",
	["lucide-pencil"]             = "rbxassetid://10734919691",
	["lucide-percent"]            = "rbxassetid://10734919919",
	["lucide-phone"]              = "rbxassetid://10734921524",
	["lucide-pie-chart"]          = "rbxassetid://10734921727",
	["lucide-pin"]                = "rbxassetid://10734922324",
	["lucide-play"]               = "rbxassetid://10734923549",
	["lucide-plus"]               = "rbxassetid://10734924532",
	["lucide-plus-circle"]        = "rbxassetid://10734923868",
	["lucide-power"]              = "rbxassetid://10734930466",
	["lucide-printer"]            = "rbxassetid://10734930632",
	["lucide-puzzle"]             = "rbxassetid://10734930886",
	["lucide-radio"]              = "rbxassetid://10734931596",
	["lucide-recycle"]            = "rbxassetid://10734932295",
	["lucide-refresh-ccw"]        = "rbxassetid://10734933056",
	["lucide-refresh-cw"]         = "rbxassetid://10734933222",
	["lucide-reply"]              = "rbxassetid://10734934252",
	["lucide-rocket"]             = "rbxassetid://10734934585",
	["lucide-rotate-ccw"]         = "rbxassetid://10734940376",
	["lucide-rotate-cw"]          = "rbxassetid://10734940654",
	["lucide-ruler"]              = "rbxassetid://10734941018",
	["lucide-save"]               = "rbxassetid://10734941499",
	["lucide-scan"]               = "rbxassetid://10734942565",
	["lucide-scissors"]           = "rbxassetid://10734942778",
	["lucide-search"]             = "rbxassetid://10734943674",
	["lucide-send"]               = "rbxassetid://10734943902",
	["lucide-server"]             = "rbxassetid://10734949856",
	["lucide-settings"]           = "rbxassetid://10734950309",
	["lucide-settings-2"]         = "rbxassetid://10734950020",
	["lucide-share"]              = "rbxassetid://10734950813",
	["lucide-shield"]             = "rbxassetid://10734951847",
	["lucide-shield-alert"]       = "rbxassetid://10734951173",
	["lucide-shield-check"]       = "rbxassetid://10734951367",
	["lucide-shopping-bag"]       = "rbxassetid://10734952273",
	["lucide-shopping-cart"]      = "rbxassetid://10734952479",
	["lucide-shuffle"]            = "rbxassetid://10734953451",
	["lucide-sidebar"]            = "rbxassetid://10734954301",
	["lucide-signal"]             = "rbxassetid://10734961133",
	["lucide-skull"]              = "rbxassetid://10734962068",
	["lucide-slash"]              = "rbxassetid://10734962600",
	["lucide-sliders"]            = "rbxassetid://10734963400",
	["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
	["lucide-smartphone"]         = "rbxassetid://10734963940",
	["lucide-smile"]              = "rbxassetid://10734964441",
	["lucide-snowflake"]          = "rbxassetid://10734964600",
	["lucide-sort-asc"]           = "rbxassetid://10734965115",
	["lucide-sort-desc"]          = "rbxassetid://10734965287",
	["lucide-speaker"]            = "rbxassetid://10734965419",
	["lucide-star"]               = "rbxassetid://10734966248",
	["lucide-stethoscope"]        = "rbxassetid://10734966384",
	["lucide-stop-circle"]        = "rbxassetid://10734972621",
	["lucide-sun"]                = "rbxassetid://10734974297",
	["lucide-sword"]              = "rbxassetid://10734975486",
	["lucide-swords"]             = "rbxassetid://10734975692",
	["lucide-syringe"]            = "rbxassetid://10734975932",
	["lucide-table"]              = "rbxassetid://10734976230",
	["lucide-tag"]                = "rbxassetid://10734976528",
	["lucide-target"]             = "rbxassetid://10734977012",
	["lucide-terminal"]           = "rbxassetid://10734982144",
	["lucide-thermometer"]        = "rbxassetid://10734983134",
	["lucide-thumbs-down"]        = "rbxassetid://10734983359",
	["lucide-thumbs-up"]          = "rbxassetid://10734983629",
	["lucide-ticket"]             = "rbxassetid://10734983868",
	["lucide-timer"]              = "rbxassetid://10734984606",
	["lucide-toggle-left"]        = "rbxassetid://10734984834",
	["lucide-toggle-right"]       = "rbxassetid://10734985040",
	["lucide-tornado"]            = "rbxassetid://10734985247",
	["lucide-trash"]              = "rbxassetid://10747362393",
	["lucide-trash-2"]            = "rbxassetid://10747362241",
	["lucide-trending-down"]      = "rbxassetid://10747363205",
	["lucide-trending-up"]        = "rbxassetid://10747363465",
	["lucide-triangle"]           = "rbxassetid://10747363621",
	["lucide-trophy"]             = "rbxassetid://10747363809",
	["lucide-truck"]              = "rbxassetid://10747364031",
	["lucide-tv"]                 = "rbxassetid://10747364593",
	["lucide-umbrella"]           = "rbxassetid://10747364971",
	["lucide-undo"]               = "rbxassetid://10747365484",
	["lucide-unlock"]             = "rbxassetid://10747366027",
	["lucide-upload"]             = "rbxassetid://10747366434",
	["lucide-user"]               = "rbxassetid://10747373176",
	["lucide-user-check"]         = "rbxassetid://10747371901",
	["lucide-user-cog"]           = "rbxassetid://10747372167",
	["lucide-user-minus"]         = "rbxassetid://10747372346",
	["lucide-user-plus"]          = "rbxassetid://10747372702",
	["lucide-user-x"]             = "rbxassetid://10747372992",
	["lucide-users"]              = "rbxassetid://10747373426",
	["lucide-utensils"]           = "rbxassetid://10747373821",
	["lucide-verified"]           = "rbxassetid://10747374131",
	["lucide-video"]              = "rbxassetid://10747374938",
	["lucide-video-off"]          = "rbxassetid://10747374721",
	["lucide-volume"]             = "rbxassetid://10747376008",
	["lucide-volume-2"]           = "rbxassetid://10747375679",
	["lucide-volume-x"]           = "rbxassetid://10747375880",
	["lucide-wallet"]             = "rbxassetid://10747376205",
	["lucide-wand"]               = "rbxassetid://10747376565",
	["lucide-watch"]              = "rbxassetid://10747376722",
	["lucide-webcam"]             = "rbxassetid://10747381992",
	["lucide-wifi"]               = "rbxassetid://10747382504",
	["lucide-wifi-off"]           = "rbxassetid://10747382268",
	["lucide-wind"]               = "rbxassetid://10747382750",
	["lucide-wrench"]             = "rbxassetid://10747383470",
	["lucide-x"]                  = "rbxassetid://10747384394",
	["lucide-x-circle"]           = "rbxassetid://10747383819",
	["lucide-zoom-in"]            = "rbxassetid://10747384552",
	["lucide-zoom-out"]           = "rbxassetid://10747384679",
}
Library.Icons = Icons

local CHECK_TEXTURE = "rbxassetid://10709790644"
local BRAND_IMAGE   = "rbxassetid://112537363055720"

local C = {
	BG      = Color3.fromRGB(15,  15,  15),
	SIDEBAR = Color3.fromRGB(25,  25,  25),
	ELEM    = Color3.fromRGB(70,  70,  70),
	SECT    = Color3.fromRGB(30,  30,  30),
	HOVER   = Color3.fromRGB(90,  90,  90),
	ACTIVE  = Color3.fromRGB(55,  55,  55),
	ACCENT  = Color3.fromRGB(220, 220, 220),
	TEXT    = Color3.fromRGB(255, 255, 255),
	DIM     = Color3.fromRGB(150, 150, 150),
	OFF     = Color3.fromRGB(45,  45,  45),
	CHECK   = Color3.fromRGB(45,  200, 85),
	BORDER  = Color3.fromRGB(25,  25,  25),
	SEP     = Color3.fromRGB(60,  60,  60),
	KEYBG   = Color3.fromRGB(35,  35,  35),
	DDBG    = Color3.fromRGB(35,  35,  35),
	DDBDR   = Color3.fromRGB(25,  25,  25),
}

local TI = {
	Fast = TweenInfo.new(0.12, Enum.EasingStyle.Quad),
	Med  = TweenInfo.new(0.18, Enum.EasingStyle.Quad),
	Slow = TweenInfo.new(0.25, Enum.EasingStyle.Quart),
	Key  = TweenInfo.new(0.08, Enum.EasingStyle.Quad),
}

local function Tw(obj, props, ti)
	local ok, e = pcall(function()
		TweenService:Create(obj, ti or TI.Fast, props):Play()
	end)
	if not ok then
		print("[ecohub ERROR] Tween: " .. tostring(e))
	end
end

local function Corner(p, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 6)
	c.Parent = p
end

local function MkStroke(p, col, thick)
	local s = Instance.new("UIStroke")
	s.Color = col or C.BORDER
	s.Thickness = thick or 1
	s.Parent = p
	return s
end

local function GetKeyName(kc)
	local m = {
		Return="Enter", LeftShift="LShift", RightShift="RShift",
		LeftControl="LCtrl", RightControl="RCtrl",
		LeftAlt="LAlt", RightAlt="RAlt",
	}
	return m[kc.Name] or kc.Name
end

local function GetIconId(name)
	if not name then return nil end
	return Icons["lucide-" .. name] or Icons[name]
end

local function MkIcon(parent, iconName, sz, posX, posY, col, anchorX, anchorY)
	local id = GetIconId(iconName)
	if not id then return nil end
	local img = Instance.new("ImageLabel")
	img.BackgroundTransparency = 1
	img.Image = id
	img.ImageColor3 = col or C.DIM
	img.Size = sz or UDim2.new(0, 14, 0, 14)
	img.Position = UDim2.new(0, posX or 6, 0.5, posY or 0)
	img.AnchorPoint = Vector2.new(anchorX or 0, anchorY or 0.5)
	img.ScaleType = Enum.ScaleType.Fit
	img.Parent = parent
	return img
end

local function MkCheckIcon(parent)
	local img = Instance.new("ImageLabel")
	img.BackgroundTransparency = 1
	img.Image = CHECK_TEXTURE
	img.ImageColor3 = Color3.fromRGB(255, 255, 255)
	img.ImageTransparency = 1
	img.Size = UDim2.new(0, 12, 0, 12)
	img.Position = UDim2.new(0.5, 0, 0.5, 0)
	img.AnchorPoint = Vector2.new(0.5, 0.5)
	img.ScaleType = Enum.ScaleType.Fit
	img.Parent = parent
	return img
end

local function DestroyOld()
	local ok, e = pcall(function()
		local g = game:GetService("CoreGui"):FindFirstChild("ecohub_gui")
		if g then g:Destroy() end
	end)
	if not ok then
		print("[ecohub ERROR] DestroyOld: " .. tostring(e))
	end
end
DestroyOld()
task.wait(0.05)

local function MakeCheckbox(parent, On)
	local ChkBox = Instance.new("Frame")
	ChkBox.Parent = parent
	ChkBox.BackgroundColor3 = C.OFF
	ChkBox.BorderSizePixel = 0
	ChkBox.Position = UDim2.new(0, 6, 0.5, 0)
	ChkBox.AnchorPoint = Vector2.new(0, 0.5)
	ChkBox.Size = UDim2.new(0, 16, 0, 16)
	Corner(ChkBox, 3)
	local chkStroke = MkStroke(ChkBox, On and C.CHECK or C.BORDER)

	local ChkFill = Instance.new("Frame")
	ChkFill.Parent = ChkBox
	ChkFill.AnchorPoint = Vector2.new(0.5, 0.5)
	ChkFill.BackgroundColor3 = C.CHECK
	ChkFill.BackgroundTransparency = On and 0 or 1
	ChkFill.BorderSizePixel = 0
	ChkFill.Position = UDim2.new(0.5, 0, 0.5, 0)
	ChkFill.Size = On and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 0, 0, 0)
	Corner(ChkFill, 3)

	local ChkImg = MkCheckIcon(ChkBox)
	ChkImg.ImageTransparency = On and 0 or 1

	return ChkBox, ChkFill, ChkImg, chkStroke
end

local function BuildSection(sectionname, PageScroll)
	local Outer = Instance.new("Frame")
	Outer.Parent = PageScroll
	Outer.BackgroundColor3 = C.SECT
	Outer.BorderSizePixel = 0
	Outer.Size = UDim2.new(1, 0, 0, 0)
	Outer.AutomaticSize = Enum.AutomaticSize.Y
	Corner(Outer, 6)
	MkStroke(Outer)

	local SecTitle = Instance.new("TextLabel")
	SecTitle.Parent = Outer
	SecTitle.BackgroundTransparency = 1
	SecTitle.Position = UDim2.new(0, 10, 0, 0)
	SecTitle.Size = UDim2.new(1, -10, 0, 22)
	SecTitle.Font = Enum.Font.GothamSemibold
	SecTitle.Text = sectionname
	SecTitle.TextColor3 = C.DIM
	SecTitle.TextSize = 10
	SecTitle.TextXAlignment = Enum.TextXAlignment.Left

	local SecContent = Instance.new("Frame")
	SecContent.Parent = Outer
	SecContent.BackgroundTransparency = 1
	SecContent.BorderSizePixel = 0
	SecContent.Position = UDim2.new(0, 0, 0, 22)
	SecContent.Size = UDim2.new(1, 0, 0, 0)
	SecContent.AutomaticSize = Enum.AutomaticSize.Y

	local SP = Instance.new("UIPadding")
	SP.Parent = SecContent
	SP.PaddingBottom = UDim.new(0, 6)
	SP.PaddingLeft = UDim.new(0, 5)
	SP.PaddingRight = UDim.new(0, 5)

	local SL = Instance.new("UIListLayout")
	SL.Parent = SecContent
	SL.SortOrder = Enum.SortOrder.LayoutOrder
	SL.Padding = UDim.new(0, 4)

	local function Base(h)
		local f = Instance.new("Frame")
		f.Parent = SecContent
		f.BackgroundColor3 = C.ELEM
		f.BorderSizePixel = 0
		f.Size = UDim2.new(1, 0, 0, h)
		Corner(f, 5)
		return f
	end

	local SecObj = {}

	function SecObj:addButton(name, callback, iconName)
		local cb = callback or function() end
		local f = Base(28)
		local padLeft = 0
		if iconName then
			local ic = MkIcon(f, iconName, UDim2.new(0, 13, 0, 13), 8, 0, C.TEXT, 0, 0.5)
			if ic then padLeft = 22 end
		end
		local btn = Instance.new("TextButton")
		btn.Parent = f
		btn.BackgroundTransparency = 1
		btn.Size = UDim2.new(1, 0, 1, 0)
		btn.AutoButtonColor = false
		btn.Font = Enum.Font.GothamSemibold
		btn.Text = name or "Button"
		btn.TextColor3 = C.TEXT
		btn.TextSize = 11
		if padLeft > 0 then
			btn.TextXAlignment = Enum.TextXAlignment.Left
			local p = Instance.new("UIPadding")
			p.PaddingLeft = UDim.new(0, padLeft + 4)
			p.Parent = btn
		else
			btn.TextXAlignment = Enum.TextXAlignment.Center
		end
		btn.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
		btn.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
		btn.MouseButton1Down:Connect(function()
			Tw(f, {BackgroundColor3 = C.ACCENT})
			task.delay(0.14, function()
				Tw(f, {BackgroundColor3 = C.ELEM})
				local ok, e = pcall(cb)
				if not ok then
					print("[ecohub ERROR] Button '" .. tostring(name) .. "': " .. tostring(e))
				end
			end)
		end)
	end

	function SecObj:addSeparator()
		local f = Instance.new("Frame")
		f.Parent = SecContent
		f.BackgroundColor3 = C.SEP
		f.BorderSizePixel = 0
		f.Size = UDim2.new(1, 0, 0, 1)
	end

	local function ToggleCore(togglename, default, callback, withBind, defaultKey, iconName)
		local cb       = callback or function() end
		local On       = (default == true)
		local CKey     = withBind and (defaultKey or nil) or nil
		local Listening = false

		local f = Base(28)

		local ChkBox, ChkFill, ChkImg, chkStroke = MakeCheckbox(f, On)

		local iconOff = 0
		if iconName then
			local ic = MkIcon(f, iconName, UDim2.new(0, 13, 0, 13), 28, 0, C.DIM, 0, 0.5)
			if ic then iconOff = 17 end
		end

		local rightPad = withBind and 66 or 10
		local Lbl = Instance.new("TextLabel")
		Lbl.Parent = f
		Lbl.BackgroundTransparency = 1
		Lbl.Position = UDim2.new(0, 28 + iconOff, 0, 0)
		Lbl.Size = UDim2.new(1, -(28 + iconOff + rightPad), 1, 0)
		Lbl.Font = Enum.Font.GothamSemibold
		Lbl.Text = togglename or "Toggle"
		Lbl.TextColor3 = On and C.TEXT or C.DIM
		Lbl.TextSize = 11
		Lbl.TextXAlignment = Enum.TextXAlignment.Left

		local KbBtn, kbStroke
		if withBind then
			KbBtn = Instance.new("TextButton")
			KbBtn.Parent = f
			KbBtn.BackgroundColor3 = C.KEYBG
			KbBtn.BorderSizePixel = 0
			KbBtn.AnchorPoint = Vector2.new(1, 0.5)
			KbBtn.Position = UDim2.new(1, -6, 0.5, 0)
			KbBtn.Size = UDim2.new(0, 54, 0, 18)
			KbBtn.AutoButtonColor = false
			KbBtn.Font = Enum.Font.GothamSemibold
			KbBtn.Text = CKey and "[" .. GetKeyName(CKey) .. "]" or "[ -- ]"
			KbBtn.TextColor3 = C.DIM
			KbBtn.TextSize = 9
			Corner(KbBtn, 4)
			kbStroke = MkStroke(KbBtn, C.BORDER)

			local function ResizeKb()
				local sz = TextService:GetTextSize(KbBtn.Text, KbBtn.TextSize, KbBtn.Font, Vector2.new(math.huge, math.huge))
				Tw(KbBtn, {Size = UDim2.new(0, math.max(54, sz.X + 14), 0, 18)}, TI.Key)
			end
			KbBtn:GetPropertyChangedSignal("Text"):Connect(ResizeKb)
			ResizeKb()

			KbBtn.MouseButton1Click:Connect(function()
				if Listening then return end
				Listening = true
				KbBtn.Text = "[ ... ]"
				KbBtn.TextColor3 = C.ACCENT
				kbStroke.Color = C.ACCENT
				ResizeKb()
			end)
		end

		local function UpdateVisuals()
			Tw(ChkFill, {
				BackgroundTransparency = On and 0 or 1,
				Size = On and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 0, 0, 0),
			}, TI.Fast)
			Tw(ChkImg, {ImageTransparency = On and 0 or 1}, TI.Fast)
			chkStroke.Color = On and C.CHECK or C.BORDER
			Tw(Lbl, {TextColor3 = On and C.TEXT or C.DIM}, TI.Fast)
		end

		local HitW = withBind and -66 or 0
		local HitBtn = Instance.new("TextButton")
		HitBtn.Parent = f
		HitBtn.BackgroundTransparency = 1
		HitBtn.Size = UDim2.new(1, HitW, 1, 0)
		HitBtn.AutoButtonColor = false
		HitBtn.Text = ""
		HitBtn.ZIndex = 5

		HitBtn.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
		HitBtn.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
		HitBtn.MouseButton1Click:Connect(function()
			if Listening then return end
			On = not On
			UpdateVisuals()
			local ok, e = pcall(cb, On)
			if not ok then
				print("[ecohub ERROR] Toggle '" .. tostring(togglename) .. "': " .. tostring(e))
			end
		end)

		if withBind then
			UserInputService.InputBegan:Connect(function(inp, gp)
				if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
				if Listening then
					Listening = false
					if inp.KeyCode == Enum.KeyCode.Escape then
						CKey = nil
						KbBtn.Text = "[ -- ]"
					else
						CKey = inp.KeyCode
						KbBtn.Text = "[" .. GetKeyName(inp.KeyCode) .. "]"
					end
					KbBtn.TextColor3 = C.DIM
					kbStroke.Color = C.BORDER
					local sz = TextService:GetTextSize(KbBtn.Text, KbBtn.TextSize, KbBtn.Font, Vector2.new(math.huge, math.huge))
					Tw(KbBtn, {Size = UDim2.new(0, math.max(54, sz.X + 14), 0, 18)}, TI.Key)
					return
				end
				if not gp and CKey and inp.KeyCode == CKey then
					On = not On
					UpdateVisuals()
					local ok, e = pcall(cb, On)
					if not ok then
						print("[ecohub ERROR] Toggle keybind '" .. tostring(togglename) .. "': " .. tostring(e))
					end
				end
			end)
		end

		UpdateVisuals()

		local ctrl = {}
		function ctrl:Set(v)
			On = v == true
			UpdateVisuals()
			local ok, e = pcall(cb, On)
			if not ok then
				print("[ecohub ERROR] Toggle:Set: " .. tostring(e))
			end
		end
		function ctrl:Get() return On end
		if withBind then
			function ctrl:SetKey(kc)
				CKey = kc
				KbBtn.Text = kc and "[" .. GetKeyName(kc) .. "]" or "[ -- ]"
				local sz = TextService:GetTextSize(KbBtn.Text, KbBtn.TextSize, KbBtn.Font, Vector2.new(math.huge, math.huge))
				Tw(KbBtn, {Size = UDim2.new(0, math.max(54, sz.X + 14), 0, 18)}, TI.Key)
			end
			function ctrl:GetKey() return CKey end
		end
		return ctrl
	end

	function SecObj:addToggle(togglename, default, callback, defaultKey, iconName)
		return ToggleCore(togglename, default, callback, true, defaultKey, iconName)
	end

	function SecObj:addToggleSimple(togglename, default, callback, iconName)
		return ToggleCore(togglename, default, callback, false, nil, iconName)
	end

	function SecObj:addSlider(name, mn, mx, def, callback, iconName)
		local cb = callback or function() end
		mn  = tonumber(mn) or 0
		mx  = tonumber(mx) or 100
		local cur = math.clamp(tonumber(def) or mn, mn, mx)
		local f = Base(42)

		if iconName then
			MkIcon(f, iconName, UDim2.new(0, 12, 0, 12), 6, 0, C.ACCENT, 0, 0.5)
		end

		local NL = Instance.new("TextLabel")
		NL.Parent = f
		NL.BackgroundTransparency = 1
		NL.Position = UDim2.new(0, 10, 0, 4)
		NL.Size = UDim2.new(1, -60, 0, 16)
		NL.Font = Enum.Font.GothamSemibold
		NL.Text = name or "Slider"
		NL.TextColor3 = C.TEXT
		NL.TextSize = 11
		NL.TextXAlignment = Enum.TextXAlignment.Left

		local VL = Instance.new("TextLabel")
		VL.Parent = f
		VL.BackgroundTransparency = 1
		VL.Position = UDim2.new(1, -54, 0, 4)
		VL.Size = UDim2.new(0, 44, 0, 16)
		VL.Font = Enum.Font.GothamSemibold
		VL.Text = tostring(cur)
		VL.TextColor3 = C.ACCENT
		VL.TextSize = 11
		VL.TextXAlignment = Enum.TextXAlignment.Right

		local Track = Instance.new("Frame")
		Track.Parent = f
		Track.BackgroundColor3 = C.OFF
		Track.BorderSizePixel = 0
		Track.Position = UDim2.new(0, 10, 0, 28)
		Track.Size = UDim2.new(1, -20, 0, 7)
		Corner(Track, 3)

		local Fill = Instance.new("Frame")
		Fill.Parent = Track
		Fill.BackgroundColor3 = C.ACCENT
		Fill.BorderSizePixel = 0
		Fill.Size = UDim2.new((cur - mn) / (mx - mn), 0, 1, 0)
		Corner(Fill, 3)

		local Knob = Instance.new("Frame")
		Knob.Parent = Track
		Knob.AnchorPoint = Vector2.new(0.5, 0.5)
		Knob.Position = UDim2.new((cur - mn) / (mx - mn), 0, 0.5, 0)
		Knob.Size = UDim2.fromOffset(11, 11)
		Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Knob.ZIndex = 3
		Knob.BorderSizePixel = 0
		local knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1, 0)
		knobCorner.Parent = Knob

		local TrackHit = Instance.new("TextButton")
		TrackHit.Parent = f
		TrackHit.BackgroundTransparency = 1
		TrackHit.Position = UDim2.new(0, 10, 0, 20)
		TrackHit.Size = UDim2.new(1, -20, 0, 18)
		TrackHit.Text = ""
		TrackHit.ZIndex = 4

		local Drag = false
		local function UpdateSlider(px)
			local p = math.clamp((px - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
			cur = math.floor(mn + (mx - mn) * p)
			Fill.Size = UDim2.new(p, 0, 1, 0)
			Knob.Position = UDim2.new(p, 0, 0.5, 0)
			VL.Text = tostring(cur)
			local ok, e = pcall(cb, cur)
			if not ok then
				print("[ecohub ERROR] Slider '" .. tostring(name) .. "': " .. tostring(e))
			end
		end
		TrackHit.MouseButton1Down:Connect(function()
			Drag = true
			local mp = UserInputService:GetMouseLocation()
			UpdateSlider(mp.X)
		end)
		UserInputService.InputChanged:Connect(function(i)
			if Drag and i.UserInputType == Enum.UserInputType.MouseMovement then
				UpdateSlider(i.Position.X)
			end
		end)
		UserInputService.InputEnded:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 then Drag = false end
		end)
		f.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
		f.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)

		local ctrl = {}
		function ctrl:Set(v)
			cur = math.clamp(v, mn, mx)
			local p = (cur - mn) / (mx - mn)
			Fill.Size = UDim2.new(p, 0, 1, 0)
			Knob.Position = UDim2.new(p, 0, 0.5, 0)
			VL.Text = tostring(cur)
		end
		function ctrl:Get() return cur end
		return ctrl
	end

	function SecObj:addTextBox(name, placeholder, callback, iconName)
		local cb = callback or function() end
		local f = Base(28)

		if iconName then
			MkIcon(f, iconName, UDim2.new(0, 12, 0, 12), 7, 0, C.DIM, 0, 0.5)
		end

		local NL = Instance.new("TextLabel")
		NL.Parent = f
		NL.BackgroundTransparency = 1
		NL.Position = UDim2.new(0, 10, 0, 0)
		NL.Size = UDim2.new(0.52, 0, 1, 0)
		NL.Font = Enum.Font.GothamSemibold
		NL.Text = name or "TextBox"
		NL.TextColor3 = C.TEXT
		NL.TextSize = 11
		NL.TextXAlignment = Enum.TextXAlignment.Left

		local Input = Instance.new("TextBox")
		Input.Parent = f
		Input.BackgroundColor3 = C.OFF
		Input.BorderSizePixel = 0
		Input.Position = UDim2.new(0.52, 4, 0.5, -9)
		Input.Size = UDim2.new(0.48, -14, 0, 18)
		Input.Font = Enum.Font.GothamSemibold
		Input.PlaceholderText = placeholder or ""
		Input.PlaceholderColor3 = C.DIM
		Input.Text = ""
		Input.TextColor3 = C.TEXT
		Input.TextSize = 10
		Input.ClearTextOnFocus = false
		Corner(Input, 4)
		local inpStroke = MkStroke(Input)

		Input.Focused:Connect(function()
			Tw(Input, {BackgroundColor3 = C.ACTIVE})
			inpStroke.Color = C.ACCENT
		end)
		Input.FocusLost:Connect(function()
			Tw(Input, {BackgroundColor3 = C.OFF})
			inpStroke.Color = C.BORDER
			local ok, e = pcall(cb, tostring(Input.Text))
			if not ok then
				print("[ecohub ERROR] TextBox '" .. tostring(name) .. "': " .. tostring(e))
			end
		end)
	end

	function SecObj:addDropdown(name, list, callback, iconName)
		local cb = callback or function() end
		local Selected = nil
		local Open = false

		local Wrapper = Instance.new("Frame")
		Wrapper.Parent = SecContent
		Wrapper.BackgroundTransparency = 1
		Wrapper.BorderSizePixel = 0
		Wrapper.Size = UDim2.new(1, 0, 0, 28)
		Wrapper.ClipsDescendants = false

		local Hdr = Instance.new("Frame")
		Hdr.Parent = Wrapper
		Hdr.BackgroundColor3 = C.ELEM
		Hdr.BorderSizePixel = 0
		Hdr.Size = UDim2.new(1, 0, 0, 28)
		Hdr.ZIndex = 5
		Corner(Hdr, 5)

		local leftOff = 10
		if iconName then
			local ic = MkIcon(Hdr, iconName, UDim2.new(0, 12, 0, 12), 7, 0, C.DIM, 0, 0.5)
			if ic then leftOff = 24 end
		end

		local DN = Instance.new("TextLabel")
		DN.Parent = Hdr
		DN.BackgroundTransparency = 1
		DN.Position = UDim2.new(0, leftOff, 0, 0)
		DN.Size = UDim2.new(0.55, -leftOff, 1, 0)
		DN.Font = Enum.Font.GothamSemibold
		DN.Text = name or "Dropdown"
		DN.TextColor3 = C.TEXT
		DN.TextSize = 11
		DN.TextXAlignment = Enum.TextXAlignment.Left
		DN.ZIndex = 6

		local DS = Instance.new("TextLabel")
		DS.Parent = Hdr
		DS.BackgroundTransparency = 1
		DS.Position = UDim2.new(0.55, 0, 0, 0)
		DS.Size = UDim2.new(0.45, -26, 1, 0)
		DS.Font = Enum.Font.Gotham
		DS.Text = "none"
		DS.TextColor3 = C.DIM
		DS.TextSize = 10
		DS.TextXAlignment = Enum.TextXAlignment.Right
		DS.ZIndex = 6

		local DA = Instance.new("ImageLabel")
		DA.Parent = Hdr
		DA.BackgroundTransparency = 1
		DA.Image = "rbxassetid://10709790948"
		DA.ImageColor3 = C.ACCENT
		DA.Size = UDim2.new(0, 14, 0, 14)
		DA.AnchorPoint = Vector2.new(1, 0.5)
		DA.Position = UDim2.new(1, -7, 0.5, 0)
		DA.ScaleType = Enum.ScaleType.Fit
		DA.ZIndex = 6

		local DL = Instance.new("Frame")
		DL.Parent = Wrapper
		DL.BackgroundColor3 = C.DDBG
		DL.BorderSizePixel = 0
		DL.Position = UDim2.new(0, 0, 0, 30)
		DL.Size = UDim2.new(1, 0, 0, 0)
		DL.ZIndex = 20
		DL.ClipsDescendants = true
		DL.Visible = false
		Corner(DL, 5)
		MkStroke(DL, C.DDBDR)

		local DS2 = Instance.new("ScrollingFrame")
		DS2.Parent = DL
		DS2.BackgroundTransparency = 1
		DS2.BorderSizePixel = 0
		DS2.Size = UDim2.new(1, 0, 1, 0)
		DS2.ScrollBarThickness = 2
		DS2.ScrollBarImageColor3 = C.ACCENT
		DS2.ZIndex = 20
		DS2.CanvasSize = UDim2.new(0, 0, 0, 0)
		DS2.AutomaticCanvasSize = Enum.AutomaticSize.Y

		local DIL = Instance.new("UIListLayout")
		DIL.Parent = DS2
		DIL.Padding = UDim.new(0, 2)
		local DIP = Instance.new("UIPadding")
		DIP.Parent = DS2
		DIP.PaddingTop = UDim.new(0, 4)
		DIP.PaddingBottom = UDim.new(0, 4)
		DIP.PaddingLeft = UDim.new(0, 4)
		DIP.PaddingRight = UDim.new(0, 4)

		local tH = math.min(#list * 26 + 8, 130)

		local function CloseDD()
			Open = false
			Tw(DA, {Rotation = 0}, TI.Fast)
			Tw(DL, {Size = UDim2.new(1, 0, 0, 0)})
			task.delay(0.15, function()
				DL.Visible = false
				Wrapper.Size = UDim2.new(1, 0, 0, 28)
			end)
		end
		local function OpenDD()
			Open = true
			Tw(DA, {Rotation = 180}, TI.Fast)
			DL.Visible = true
			Tw(DL, {Size = UDim2.new(1, 0, 0, tH)})
			Wrapper.Size = UDim2.new(1, 0, 0, 30 + tH)
		end

		local HB = Instance.new("TextButton")
		HB.Parent = Hdr
		HB.BackgroundTransparency = 1
		HB.Size = UDim2.new(1, 0, 1, 0)
		HB.Text = ""
		HB.AutoButtonColor = false
		HB.ZIndex = 7
		HB.MouseButton1Click:Connect(function()
			if Open then CloseDD() else OpenDD() end
		end)
		HB.MouseEnter:Connect(function() Tw(Hdr, {BackgroundColor3 = C.HOVER}) end)
		HB.MouseLeave:Connect(function() Tw(Hdr, {BackgroundColor3 = C.ELEM}) end)

		local function BuildItems(itemList)
			for _, child in ipairs(DS2:GetChildren()) do
				if child:IsA("TextButton") then child:Destroy() end
			end
			tH = math.min(#itemList * 26 + 8, 130)
			for _, item in ipairs(itemList) do
				local Opt = Instance.new("TextButton")
				Opt.Parent = DS2
				Opt.BackgroundColor3 = C.ELEM
				Opt.BorderSizePixel = 0
				Opt.Size = UDim2.new(1, 0, 0, 22)
				Opt.AutoButtonColor = false
				Opt.Font = Enum.Font.GothamSemibold
				Opt.Text = tostring(item)
				Opt.TextColor3 = C.TEXT
				Opt.TextSize = 10
				Opt.ZIndex = 21
				Corner(Opt, 4)
				Opt.MouseEnter:Connect(function() Tw(Opt, {BackgroundColor3 = C.HOVER}) end)
				Opt.MouseLeave:Connect(function()
					if Selected ~= item then Tw(Opt, {BackgroundColor3 = C.ELEM}) end
				end)
				Opt.MouseButton1Click:Connect(function()
					Selected = item
					DS.Text = tostring(item)
					DS.TextColor3 = C.ACCENT
					CloseDD()
					local ok, e = pcall(cb, item)
					if not ok then
						print("[ecohub ERROR] Dropdown '" .. tostring(name) .. "': " .. tostring(e))
					end
				end)
			end
		end

		BuildItems(list)

		local ctrl = {}
		function ctrl:Set(v)
			Selected = v
			DS.Text = v and tostring(v) or "none"
			DS.TextColor3 = v and C.ACCENT or C.DIM
		end
		function ctrl:Get() return Selected end
		function ctrl:SetList(newList)
			BuildItems(newList)
		end
		return ctrl
	end

	function SecObj:addKeybind(name, default, callback)
		local cb = callback or function() end
		local CK = default or nil
		local Listening = false
		local f = Base(28)

		local Lbl = Instance.new("TextLabel")
		Lbl.Parent = f
		Lbl.BackgroundTransparency = 1
		Lbl.Position = UDim2.new(0, 10, 0, 0)
		Lbl.Size = UDim2.new(0.6, 0, 1, 0)
		Lbl.Font = Enum.Font.GothamSemibold
		Lbl.Text = name or "Keybind"
		Lbl.TextColor3 = C.TEXT
		Lbl.TextSize = 11
		Lbl.TextXAlignment = Enum.TextXAlignment.Left

		local KbBtn = Instance.new("TextButton")
		KbBtn.Parent = f
		KbBtn.BackgroundColor3 = C.KEYBG
		KbBtn.BorderSizePixel = 0
		KbBtn.AnchorPoint = Vector2.new(1, 0.5)
		KbBtn.Position = UDim2.new(1, -6, 0.5, 0)
		KbBtn.Size = UDim2.new(0, 64, 0, 18)
		KbBtn.AutoButtonColor = false
		KbBtn.Font = Enum.Font.GothamSemibold
		KbBtn.Text = CK and "[" .. GetKeyName(CK) .. "]" or "[NONE]"
		KbBtn.TextColor3 = C.DIM
		KbBtn.TextSize = 9
		Corner(KbBtn, 4)
		local kbStroke = MkStroke(KbBtn)

		local function ResizeKb()
			local sz = TextService:GetTextSize(KbBtn.Text, KbBtn.TextSize, KbBtn.Font, Vector2.new(math.huge, math.huge))
			Tw(KbBtn, {Size = UDim2.new(0, math.max(64, sz.X + 14), 0, 18)}, TI.Key)
		end
		KbBtn:GetPropertyChangedSignal("Text"):Connect(ResizeKb)
		ResizeKb()

		KbBtn.MouseButton1Click:Connect(function()
			if Listening then return end
			Listening = true
			KbBtn.Text = "[...]"
			KbBtn.TextColor3 = C.ACCENT
			kbStroke.Color = C.ACCENT
			ResizeKb()
		end)
		UserInputService.InputBegan:Connect(function(inp, gp)
			if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
			if Listening then
				Listening = false
				if inp.KeyCode == Enum.KeyCode.Escape then
					CK = nil
					KbBtn.Text = "[NONE]"
				else
					CK = inp.KeyCode
					KbBtn.Text = "[" .. GetKeyName(inp.KeyCode) .. "]"
				end
				KbBtn.TextColor3 = C.DIM
				kbStroke.Color = C.BORDER
				ResizeKb()
				return
			end
			if not gp and CK and inp.KeyCode == CK then
				local ok, e = pcall(cb, CK)
				if not ok then
					print("[ecohub ERROR] Keybind '" .. tostring(name) .. "': " .. tostring(e))
				end
			end
		end)
		f.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
		f.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)

		local ctrl = {}
		function ctrl:Set(k)
			CK = k
			KbBtn.Text = k and "[" .. GetKeyName(k) .. "]" or "[NONE]"
			ResizeKb()
		end
		function ctrl:Get() return CK end
		return ctrl
	end

	function SecObj:addColorPicker(name, default, callback)
		local cb = callback or function() end
		local CurColor = default or Color3.fromRGB(255, 255, 255)
		local H, S, V = Color3.toHSV(CurColor)
		local Open = false

		local Wrapper = Instance.new("Frame")
		Wrapper.Parent = SecContent
		Wrapper.BackgroundTransparency = 1
		Wrapper.BorderSizePixel = 0
		Wrapper.Size = UDim2.new(1, 0, 0, 28)

		local Hdr = Instance.new("Frame")
		Hdr.Parent = Wrapper
		Hdr.BackgroundColor3 = C.ELEM
		Hdr.BorderSizePixel = 0
		Hdr.Size = UDim2.new(1, 0, 0, 28)
		Corner(Hdr, 5)

		MkIcon(Hdr, "palette", UDim2.new(0, 12, 0, 12), 7, 0, C.DIM, 0, 0.5)

		local NL = Instance.new("TextLabel")
		NL.Parent = Hdr
		NL.BackgroundTransparency = 1
		NL.Position = UDim2.new(0, 24, 0, 0)
		NL.Size = UDim2.new(0.6, -24, 1, 0)
		NL.Font = Enum.Font.GothamSemibold
		NL.Text = name or "Color"
		NL.TextColor3 = C.TEXT
		NL.TextSize = 11
		NL.TextXAlignment = Enum.TextXAlignment.Left

		local function ToHex(c)
			return string.format("#%02X%02X%02X",
				math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255))
		end

		local HexL = Instance.new("TextLabel")
		HexL.Parent = Hdr
		HexL.BackgroundTransparency = 1
		HexL.Position = UDim2.new(0.6, 0, 0, 0)
		HexL.Size = UDim2.new(0.4, -34, 1, 0)
		HexL.Font = Enum.Font.Gotham
		HexL.Text = ToHex(CurColor)
		HexL.TextColor3 = C.DIM
		HexL.TextSize = 9
		HexL.TextXAlignment = Enum.TextXAlignment.Right

		local Prev = Instance.new("Frame")
		Prev.Parent = Hdr
		Prev.BackgroundColor3 = CurColor
		Prev.BorderSizePixel = 0
		Prev.AnchorPoint = Vector2.new(1, 0.5)
		Prev.Position = UDim2.new(1, -8, 0.5, 0)
		Prev.Size = UDim2.new(0, 14, 0, 14)
		Corner(Prev, 3)
		MkStroke(Prev)

		local Panel = Instance.new("Frame")
		Panel.Parent = Wrapper
		Panel.BackgroundColor3 = C.DDBG
		Panel.BorderSizePixel = 0
		Panel.Position = UDim2.new(0, 0, 0, 30)
		Panel.Size = UDim2.new(1, 0, 0, 0)
		Panel.ClipsDescendants = true
		Panel.Visible = false
		Corner(Panel, 5)
		MkStroke(Panel, C.DDBDR)

		local function Refresh()
			CurColor = Color3.fromHSV(H, S, V)
			Prev.BackgroundColor3 = CurColor
			HexL.Text = ToHex(CurColor)
			local ok, e = pcall(cb, CurColor)
			if not ok then
				print("[ecohub ERROR] ColorPicker '" .. tostring(name) .. "': " .. tostring(e))
			end
		end

		local chs = {
			{l="H", g=function() return H end, s=function(v) H=v end, m=360},
			{l="S", g=function() return S end, s=function(v) S=v end, m=100},
			{l="V", g=function() return V end, s=function(v) V=v end, m=100},
		}
		local panelH = #chs * 30 + 12

		for i, ch in ipairs(chs) do
			local Row = Instance.new("Frame")
			Row.Parent = Panel
			Row.BackgroundTransparency = 1
			Row.Position = UDim2.new(0, 8, 0, 6 + (i - 1) * 30)
			Row.Size = UDim2.new(1, -16, 0, 24)

			local RL = Instance.new("TextLabel")
			RL.Parent = Row
			RL.BackgroundTransparency = 1
			RL.Size = UDim2.new(0, 14, 1, 0)
			RL.Font = Enum.Font.GothamBold
			RL.Text = ch.l
			RL.TextColor3 = C.ACCENT
			RL.TextSize = 10

			local RT = Instance.new("Frame")
			RT.Parent = Row
			RT.BackgroundColor3 = C.OFF
			RT.BorderSizePixel = 0
			RT.Position = UDim2.new(0, 20, 0.5, -3)
			RT.Size = UDim2.new(1, -58, 0, 7)
			Corner(RT, 3)

			local RF = Instance.new("Frame")
			RF.Parent = RT
			RF.BackgroundColor3 = C.ACCENT
			RF.BorderSizePixel = 0
			RF.Size = UDim2.new(ch.g(), 0, 1, 0)
			Corner(RF, 3)

			local RDot = Instance.new("Frame")
			RDot.Parent = RT
			RDot.AnchorPoint = Vector2.new(0.5, 0.5)
			RDot.Position = UDim2.new(ch.g(), 0, 0.5, 0)
			RDot.Size = UDim2.fromOffset(11, 11)
			RDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RDot.ZIndex = 3
			RDot.BorderSizePixel = 0
			local rdCorner = Instance.new("UICorner")
			rdCorner.CornerRadius = UDim.new(1, 0)
			rdCorner.Parent = RDot

			local RTHit = Instance.new("TextButton")
			RTHit.Parent = Row
			RTHit.BackgroundTransparency = 1
			RTHit.Position = UDim2.new(0, 20, 0.5, -8)
			RTHit.Size = UDim2.new(1, -58, 0, 18)
			RTHit.Text = ""
			RTHit.ZIndex = 4

			local RV = Instance.new("TextLabel")
			RV.Parent = Row
			RV.BackgroundTransparency = 1
			RV.Position = UDim2.new(1, -34, 0, 0)
			RV.Size = UDim2.new(0, 32, 1, 0)
			RV.Font = Enum.Font.Gotham
			RV.Text = tostring(math.floor(ch.g() * ch.m))
			RV.TextColor3 = C.DIM
			RV.TextSize = 9

			local dr = false

			local function UpdateFromX(px)
				local p = math.clamp((px - RT.AbsolutePosition.X) / RT.AbsoluteSize.X, 0, 1)
				RF.Size = UDim2.new(p, 0, 1, 0)
				RDot.Position = UDim2.new(p, 0, 0.5, 0)
				RV.Text = tostring(math.floor(p * ch.m))
				ch.s(p)
				Refresh()
			end

			RTHit.MouseButton1Down:Connect(function()
				dr = true
				local mp = UserInputService:GetMouseLocation()
				UpdateFromX(mp.X)
			end)
			UserInputService.InputChanged:Connect(function(inp)
				if dr and inp.UserInputType == Enum.UserInputType.MouseMovement then
					UpdateFromX(inp.Position.X)
				end
			end)
			UserInputService.InputEnded:Connect(function(inp)
				if inp.UserInputType == Enum.UserInputType.MouseButton1 then dr = false end
			end)
		end

		local HB = Instance.new("TextButton")
		HB.Parent = Hdr
		HB.BackgroundTransparency = 1
		HB.Size = UDim2.new(1, 0, 1, 0)
		HB.Text = ""
		HB.AutoButtonColor = false
		HB.MouseEnter:Connect(function() Tw(Hdr, {BackgroundColor3 = C.HOVER}) end)
		HB.MouseLeave:Connect(function() Tw(Hdr, {BackgroundColor3 = C.ELEM}) end)
		HB.MouseButton1Click:Connect(function()
			Open = not Open
			if Open then
				Panel.Visible = true
				Tw(Panel, {Size = UDim2.new(1, 0, 0, panelH)})
				Wrapper.Size = UDim2.new(1, 0, 0, 30 + panelH)
			else
				Tw(Panel, {Size = UDim2.new(1, 0, 0, 0)})
				task.delay(0.15, function()
					Panel.Visible = false
					Wrapper.Size = UDim2.new(1, 0, 0, 28)
				end)
			end
		end)

		local ctrl = {}
		function ctrl:Set(c)
			CurColor = c
			H, S, V = Color3.toHSV(c)
			Prev.BackgroundColor3 = c
			HexL.Text = ToHex(c)
		end
		function ctrl:Get() return CurColor end
		return ctrl
	end

	return SecObj
end

function Library:CreateWindow(windowname, windowinfo, folder)
	local HttpService = game:GetService("HttpService")
	folder = folder or "ecohub"

	local ConfigFolder         = folder
	local ConfigSettingsFolder = folder .. "/configs"

	local function EnsureFolders()
		pcall(function()
			if not isfolder(ConfigFolder) then makefolder(ConfigFolder) end
			if not isfolder(ConfigSettingsFolder) then makefolder(ConfigSettingsFolder) end
		end)
	end
	EnsureFolders()

	local function GetConfigList()
		local out = {}
		local ok, list = pcall(listfiles, ConfigSettingsFolder)
		if not ok then return out end
		for _, file in ipairs(list) do
			if file:sub(-5) == ".json" then
				local name = file:match("[/\\]([^/\\]+)%.json$")
				if name and name ~= "autoload" then
					table.insert(out, name)
				end
			end
		end
		table.sort(out)
		return out
	end

	local SaveIgnore = {}

	local function SaveConfig(name)
		if not name or name:gsub(" ", "") == "" then
			return false, "nome invalido"
		end
		local data = { objects = {} }
		for idx, opt in next, Library.Options do
			if SaveIgnore[idx] then continue end
			local t = opt.Type
			if t == "Toggle" then
				table.insert(data.objects, { type = "Toggle", idx = idx, value = opt.Value })
			elseif t == "Slider" then
				table.insert(data.objects, { type = "Slider", idx = idx, value = opt.Value })
			elseif t == "Dropdown" then
				table.insert(data.objects, { type = "Dropdown", idx = idx, value = opt.Value })
			elseif t == "ColorPicker" then
				if opt.Value then
					table.insert(data.objects, { type = "ColorPicker", idx = idx, value = opt.Value:ToHex() })
				end
			elseif t == "Keybind" then
				table.insert(data.objects, { type = "Keybind", idx = idx, value = opt.Value })
			elseif t == "TextBox" then
				table.insert(data.objects, { type = "TextBox", idx = idx, value = opt.Value })
			end
		end
		local ok2, encoded = pcall(function() return HttpService:JSONEncode(data) end)
		if not ok2 then return false, "encode falhou" end
		local ok3, err3 = pcall(writefile, ConfigSettingsFolder .. "/" .. name .. ".json", encoded)
		if not ok3 then return false, "writefile: " .. tostring(err3) end
		return true
	end

	local function LoadConfig(name)
		if not name then return false, "nome invalido" end
		local path = ConfigSettingsFolder .. "/" .. name .. ".json"
		local ok, content = pcall(readfile, path)
		if not ok then return false, "arquivo nao encontrado" end
		local ok2, decoded = pcall(function() return HttpService:JSONDecode(content) end)
		if not ok2 then return false, "decode falhou" end
		for _, obj in ipairs(decoded.objects or {}) do
			task.spawn(function()
				local opt = Library.Options[obj.idx]
				if not opt then return end
				if obj.type == "Toggle" then
					opt:Set(obj.value)
				elseif obj.type == "Slider" then
					opt:Set(tonumber(obj.value) or 0)
				elseif obj.type == "Dropdown" then
					opt:Set(obj.value)
				elseif obj.type == "ColorPicker" then
					local ok3, col = pcall(Color3.fromHex, obj.value)
					if ok3 then opt:Set(col) end
				elseif obj.type == "TextBox" then
					opt:Set(tostring(obj.value))
				end
			end)
		end
		return true
	end

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "ecohub_gui"
	ScreenGui.Parent = game:GetService("CoreGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.ResetOnSpawn = false
	ScreenGui.DisplayOrder = 999

	local Main = Instance.new("Frame")
	Main.Name = "Main"
	Main.Parent = ScreenGui
	Main.BackgroundColor3 = C.BG
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.25, 0, 0.25, 0)
	Main.Size = UDim2.new(0, 520, 0, 340)
	Main.ClipsDescendants = true
	Corner(Main, 8)
	MkStroke(Main)

	local TitleBar = Instance.new("Frame")
	TitleBar.Parent = Main
	TitleBar.BackgroundColor3 = C.SIDEBAR
	TitleBar.BorderSizePixel = 0
	TitleBar.Size = UDim2.new(1, 0, 0, 32)
	Corner(TitleBar, 8)

	local TitleFix = Instance.new("Frame")
	TitleFix.Parent = TitleBar
	TitleFix.BackgroundColor3 = C.SIDEBAR
	TitleFix.BorderSizePixel = 0
	TitleFix.Position = UDim2.new(0, 0, 0.5, 0)
	TitleFix.Size = UDim2.new(1, 0, 0.5, 0)

	local TitleDot = Instance.new("ImageLabel")
	TitleDot.Parent = TitleBar
	TitleDot.BackgroundTransparency = 1
	TitleDot.Image = BRAND_IMAGE
	TitleDot.Size = UDim2.new(0, 26, 0, 26)
	TitleDot.AnchorPoint = Vector2.new(0, 0.5)
	TitleDot.Position = UDim2.new(0, 5, 0.5, 0)
	TitleDot.ScaleType = Enum.ScaleType.Fit

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Parent = TitleBar
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Position = UDim2.new(0, 36, 0, 0)
	TitleLabel.Size = UDim2.new(0.55, 0, 1, 0)
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.Text = windowname or "ecohub"
	TitleLabel.TextColor3 = C.TEXT
	TitleLabel.TextSize = 12
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

	local VerLabel = Instance.new("TextLabel")
	VerLabel.Parent = TitleBar
	VerLabel.BackgroundTransparency = 1
	VerLabel.Position = UDim2.new(0, 0, 0, 0)
	VerLabel.Size = UDim2.new(1, -16, 1, 0)
	VerLabel.Font = Enum.Font.Gotham
	VerLabel.Text = windowinfo or "v1.0"
	VerLabel.TextColor3 = C.DIM
	VerLabel.TextSize = 10
	VerLabel.TextXAlignment = Enum.TextXAlignment.Right

	local Body = Instance.new("Frame")
	Body.Name = "Body"
	Body.Parent = Main
	Body.BackgroundTransparency = 1
	Body.BorderSizePixel = 0
	Body.Position = UDim2.new(0, 0, 0, 32)
	Body.Size = UDim2.new(1, 0, 1, -32)

	local Sidebar = Instance.new("Frame")
	Sidebar.Parent = Body
	Sidebar.BackgroundColor3 = C.SIDEBAR
	Sidebar.BorderSizePixel = 0
	Sidebar.Size = UDim2.new(0, 120, 1, 0)
	Corner(Sidebar, 8)

	local SidebarFix = Instance.new("Frame")
	SidebarFix.Parent = Sidebar
	SidebarFix.BackgroundColor3 = C.SIDEBAR
	SidebarFix.BorderSizePixel = 0
	SidebarFix.Position = UDim2.new(1, -8, 0, 0)
	SidebarFix.Size = UDim2.new(0, 8, 1, 0)

	local TabScroll = Instance.new("ScrollingFrame")
	TabScroll.Parent = Sidebar
	TabScroll.BackgroundTransparency = 1
	TabScroll.BorderSizePixel = 0
	TabScroll.Position = UDim2.new(0, 6, 0, 6)
	TabScroll.Size = UDim2.new(1, -12, 1, -100)
	TabScroll.ScrollBarThickness = 2
	TabScroll.ScrollBarImageColor3 = C.ACCENT
	TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local TabLayout = Instance.new("UIListLayout")
	TabLayout.Parent = TabScroll
	TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabLayout.Padding = UDim.new(0, 3)

	local SidebarSep = Instance.new("Frame")
	SidebarSep.Parent = Sidebar
	SidebarSep.BackgroundColor3 = C.SEP
	SidebarSep.BorderSizePixel = 0
	SidebarSep.AnchorPoint = Vector2.new(0, 1)
	SidebarSep.Position = UDim2.new(0, 6, 1, -70)
	SidebarSep.Size = UDim2.new(1, -12, 0, 1)

	local SettingsTabBtn = Instance.new("TextButton")
	SettingsTabBtn.Parent = Sidebar
	SettingsTabBtn.BackgroundColor3 = C.ELEM
	SettingsTabBtn.BackgroundTransparency = 1
	SettingsTabBtn.BorderSizePixel = 0
	SettingsTabBtn.AnchorPoint = Vector2.new(0, 1)
	SettingsTabBtn.Position = UDim2.new(0, 6, 1, -38)
	SettingsTabBtn.Size = UDim2.new(1, -12, 0, 28)
	SettingsTabBtn.AutoButtonColor = false
	SettingsTabBtn.Text = ""
	Corner(SettingsTabBtn, 5)

	local SettingsIcon = Instance.new("ImageLabel")
	SettingsIcon.BackgroundTransparency = 1
	SettingsIcon.Image = GetIconId("settings") or ""
	SettingsIcon.ImageColor3 = C.DIM
	SettingsIcon.Size = UDim2.new(0, 14, 0, 14)
	SettingsIcon.Position = UDim2.new(0, 6, 0.5, 0)
	SettingsIcon.AnchorPoint = Vector2.new(0, 0.5)
	SettingsIcon.ScaleType = Enum.ScaleType.Fit
	SettingsIcon.Parent = SettingsTabBtn

	local SettingsLbl = Instance.new("TextLabel")
	SettingsLbl.BackgroundTransparency = 1
	SettingsLbl.Position = UDim2.new(0, 24, 0, 0)
	SettingsLbl.Size = UDim2.new(1, -32, 1, 0)
	SettingsLbl.Font = Enum.Font.GothamSemibold
	SettingsLbl.Text = "Settings"
	SettingsLbl.TextColor3 = C.DIM
	SettingsLbl.TextSize = 11
	SettingsLbl.TextXAlignment = Enum.TextXAlignment.Left
	SettingsLbl.Parent = SettingsTabBtn

	local SettingsUnderline = Instance.new("Frame")
	SettingsUnderline.Parent = SettingsTabBtn
	SettingsUnderline.BackgroundColor3 = C.ACCENT
	SettingsUnderline.BorderSizePixel = 0
	SettingsUnderline.AnchorPoint = Vector2.new(0.5, 1)
	SettingsUnderline.Position = UDim2.new(0.5, 0, 1, -1)
	SettingsUnderline.Size = UDim2.new(0, 0, 0, 1)
	SettingsUnderline.Visible = false
	Corner(SettingsUnderline, 1)

	local SidebarBrandImg = Instance.new("ImageLabel")
	SidebarBrandImg.Parent = Sidebar
	SidebarBrandImg.BackgroundTransparency = 1
	SidebarBrandImg.Image = BRAND_IMAGE
	SidebarBrandImg.Size = UDim2.new(0, 54, 0, 54)
	SidebarBrandImg.AnchorPoint = Vector2.new(0.5, 1)
	SidebarBrandImg.Position = UDim2.new(0.5, 0, 1, -72)
	SidebarBrandImg.ScaleType = Enum.ScaleType.Fit
	SidebarBrandImg.ImageTransparency = 0.15

	local ContentArea = Instance.new("Frame")
	ContentArea.Parent = Body
	ContentArea.BackgroundTransparency = 1
	ContentArea.BorderSizePixel = 0
	ContentArea.Position = UDim2.new(0, 126, 0, 4)
	ContentArea.Size = UDim2.new(1, -130, 1, -8)

	local SettingsPage = Instance.new("Frame")
	SettingsPage.Parent = ContentArea
	SettingsPage.BackgroundTransparency = 1
	SettingsPage.BorderSizePixel = 0
	SettingsPage.Size = UDim2.new(1, 0, 1, 0)
	SettingsPage.Visible = false

	local SettingsScroll = Instance.new("ScrollingFrame")
	SettingsScroll.Parent = SettingsPage
	SettingsScroll.BackgroundTransparency = 1
	SettingsScroll.BorderSizePixel = 0
	SettingsScroll.Size = UDim2.new(1, 0, 1, 0)
	SettingsScroll.ScrollBarThickness = 2
	SettingsScroll.ScrollBarImageColor3 = C.ACCENT
	SettingsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	SettingsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local SPL = Instance.new("UIListLayout")
	SPL.Parent = SettingsScroll
	SPL.SortOrder = Enum.SortOrder.LayoutOrder
	SPL.Padding = UDim.new(0, 5)
	local SPP = Instance.new("UIPadding")
	SPP.Parent = SettingsScroll
	SPP.PaddingTop = UDim.new(0, 2)
	SPP.PaddingBottom = UDim.new(0, 6)
	SPP.PaddingRight = UDim.new(0, 2)

	local cfgSection = BuildSection("Configuracoes", SettingsScroll)

	local cfgNameCtrl = cfgSection:addTextBox("Nome do config", "minha_config", nil)
	local cfgListCtrl = cfgSection:addDropdown("Configs salvos", GetConfigList(), nil)

	cfgSection:addButton("Salvar config", function()
		local name = cfgNameCtrl:Get()
		if not name or name:gsub(" ", "") == "" then return end
		local ok, err = SaveConfig(name)
		if not ok then
			print("[ecohub ERROR] Salvar: " .. tostring(err))
		else
			local nl = GetConfigList()
			cfgListCtrl:SetList(nl)
			cfgListCtrl:Set(name)
		end
	end, "save")

	cfgSection:addButton("Carregar config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		local ok, err = LoadConfig(name)
		if not ok then
			print("[ecohub ERROR] Carregar: " .. tostring(err))
		end
	end, "download")

	cfgSection:addButton("Sobrescrever config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		local ok, err = SaveConfig(name)
		if not ok then
			print("[ecohub ERROR] Sobrescrever: " .. tostring(err))
		end
	end, "edit")

	cfgSection:addButton("Deletar config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		pcall(delfile, ConfigSettingsFolder .. "/" .. name .. ".json")
		local nl = GetConfigList()
		cfgListCtrl:SetList(nl)
		cfgListCtrl:Set(nil)
	end, "trash-2")

	cfgSection:addButton("Atualizar lista", function()
		local nl = GetConfigList()
		cfgListCtrl:SetList(nl)
	end, "refresh-cw")

	cfgSection:addSeparator()

	cfgSection:addButton("Definir autoload", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		pcall(writefile, ConfigSettingsFolder .. "/autoload.txt", name)
	end, "star")

	cfgSection:addButton("Remover autoload", function()
		pcall(delfile, ConfigSettingsFolder .. "/autoload.txt")
	end, "x-circle")

	SaveIgnore["_cfg_name"] = true
	SaveIgnore["_cfg_list"] = true

	task.spawn(function()
		task.wait(0.5)
		local ok, content = pcall(readfile, ConfigSettingsFolder .. "/autoload.txt")
		if ok and content and content:gsub("%s","") ~= "" then
			LoadConfig(content:gsub("%s",""))
		end
	end)

	local dragging, dragStart, startPos, dragInput
	TitleBar.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = inp.Position
			startPos = Main.Position
		end
	end)
	TitleBar.InputChanged:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = inp
		end
	end)
	UserInputService.InputChanged:Connect(function(inp)
		if dragging and inp == dragInput then
			local d = inp.Position - dragStart
			Main.Position = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + d.X,
				startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	local Minimized = false
	local FullSize  = UDim2.new(0, 520, 0, 340)
	local MiniSize  = UDim2.new(0, 520, 0, 32)

	local function DoMinimize(toMin)
		Minimized = toMin
		if toMin then
			Body.Visible = false
			Tw(Main, {Size = MiniSize}, TI.Slow)
		else
			Main.Size = MiniSize
			Body.Visible = true
			Tw(Main, {Size = FullSize}, TI.Slow)
		end
	end

	local ToggleKey = Enum.KeyCode.RightAlt
	UserInputService.InputBegan:Connect(function(inp, gp)
		if not gp and inp.KeyCode == ToggleKey then
			DoMinimize(not Minimized)
		end
	end)

	local Pages = {}
	local ActiveTab = nil
	local SettingsActive = false

	local function DeactivateAll()
		for _, p in pairs(Pages) do
			p.Page.Visible = false
			Tw(p.Tab, {BackgroundTransparency = 1, BackgroundColor3 = C.ELEM}, TI.Fast)
			p.SetColor(C.DIM)
			p.Underline.Visible = false
		end
		SettingsPage.Visible = false
		Tw(SettingsTabBtn, {BackgroundTransparency = 1, BackgroundColor3 = C.ELEM}, TI.Fast)
		SettingsLbl.TextColor3 = C.DIM
		SettingsIcon.ImageColor3 = C.DIM
		SettingsUnderline.Visible = false
		ActiveTab = nil
		SettingsActive = false
	end

	SettingsTabBtn.MouseButton1Click:Connect(function()
		DeactivateAll()
		SettingsActive = true
		SettingsPage.Visible = true
		SettingsPage.Position = UDim2.new(0.04, 0, 0, 0)
		Tw(SettingsPage, {Position = UDim2.new(0, 0, 0, 0)}, TI.Med)
		Tw(SettingsTabBtn, {BackgroundTransparency = 0, BackgroundColor3 = C.ACTIVE}, TI.Fast)
		SettingsLbl.TextColor3 = C.TEXT
		SettingsIcon.ImageColor3 = C.TEXT
		SettingsUnderline.Visible = true
		SettingsUnderline.Size = UDim2.new(0, 0, 0, 1)
		Tw(SettingsUnderline, {Size = UDim2.new(0.8, 0, 0, 1)}, TI.Slow)
	end)
	SettingsTabBtn.MouseEnter:Connect(function()
		if not SettingsActive then
			Tw(SettingsTabBtn, {BackgroundTransparency = 0, BackgroundColor3 = C.HOVER}, TI.Fast)
		end
	end)
	SettingsTabBtn.MouseLeave:Connect(function()
		if not SettingsActive then
			Tw(SettingsTabBtn, {BackgroundTransparency = 1}, TI.Fast)
		end
	end)

	local Window = {}

	function Window:addPage(pagename, iconName)
		local hasIcon = iconName ~= nil and GetIconId(iconName) ~= nil
		local iconSize = 14

		local Tab = Instance.new("TextButton")
		Tab.Parent = TabScroll
		Tab.BackgroundColor3 = C.ELEM
		Tab.BackgroundTransparency = 1
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(1, 0, 0, 28)
		Tab.AutoButtonColor = false
		Tab.Text = ""
		Tab.Font = Enum.Font.GothamSemibold
		Tab.TextColor3 = C.DIM
		Tab.TextSize = 11
		Corner(Tab, 5)

		local TabIcon = nil
		if hasIcon then
			TabIcon = Instance.new("ImageLabel")
			TabIcon.BackgroundTransparency = 1
			TabIcon.Image = GetIconId(iconName)
			TabIcon.ImageColor3 = C.DIM
			TabIcon.Size = UDim2.new(0, iconSize, 0, iconSize)
			TabIcon.Position = UDim2.new(0, 6, 0.5, 0)
			TabIcon.AnchorPoint = Vector2.new(0, 0.5)
			TabIcon.ScaleType = Enum.ScaleType.Fit
			TabIcon.Parent = Tab
		end

		local TabLbl = Instance.new("TextLabel")
		TabLbl.BackgroundTransparency = 1
		TabLbl.Position = hasIcon
			and UDim2.new(0, 6 + iconSize + 4, 0, 0)
			or  UDim2.new(0, 8, 0, 0)
		TabLbl.Size = hasIcon
			and UDim2.new(1, -(6 + iconSize + 8), 1, 0)
			or  UDim2.new(1, -16, 1, 0)
		TabLbl.Font = Enum.Font.GothamSemibold
		TabLbl.Text = pagename
		TabLbl.TextColor3 = C.DIM
		TabLbl.TextSize = 11
		TabLbl.TextXAlignment = Enum.TextXAlignment.Left
		TabLbl.Parent = Tab

		local Underline = Instance.new("Frame")
		Underline.Parent = Tab
		Underline.BackgroundColor3 = C.ACCENT
		Underline.BorderSizePixel = 0
		Underline.AnchorPoint = Vector2.new(0.5, 1)
		Underline.Position = UDim2.new(0.5, 0, 1, -1)
		Underline.Size = UDim2.new(0, 0, 0, 1)
		Underline.Visible = false
		Corner(Underline, 1)

		local PageFrame = Instance.new("Frame")
		PageFrame.Parent = ContentArea
		PageFrame.BackgroundTransparency = 1
		PageFrame.BorderSizePixel = 0
		PageFrame.Size = UDim2.new(1, 0, 1, 0)
		PageFrame.Visible = false

		local PageScroll = Instance.new("ScrollingFrame")
		PageScroll.Parent = PageFrame
		PageScroll.BackgroundTransparency = 1
		PageScroll.BorderSizePixel = 0
		PageScroll.Size = UDim2.new(1, 0, 1, 0)
		PageScroll.ScrollBarThickness = 2
		PageScroll.ScrollBarImageColor3 = C.ACCENT
		PageScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
		PageScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

		local PL = Instance.new("UIListLayout")
		PL.Parent = PageScroll
		PL.SortOrder = Enum.SortOrder.LayoutOrder
		PL.Padding = UDim.new(0, 5)
		local PP = Instance.new("UIPadding")
		PP.Parent = PageScroll
		PP.PaddingTop = UDim.new(0, 2)
		PP.PaddingBottom = UDim.new(0, 6)
		PP.PaddingRight = UDim.new(0, 2)

		local function SetTabColor(col)
			TabLbl.TextColor3 = col
			if TabIcon then TabIcon.ImageColor3 = col end
		end

		table.insert(Pages, {
			Tab = Tab,
			Page = PageFrame,
			Underline = Underline,
			SetColor = SetTabColor,
		})

		local function SelectTab()
			DeactivateAll()
			PageFrame.Visible = true
			PageFrame.Position = UDim2.new(0.04, 0, 0, 0)
			Tw(PageFrame, {Position = UDim2.new(0, 0, 0, 0)}, TI.Med)
			Tw(Tab, {BackgroundTransparency = 0, BackgroundColor3 = C.ACTIVE}, TI.Fast)
			SetTabColor(C.TEXT)
			Underline.Visible = true
			Underline.Size = UDim2.new(0, 0, 0, 1)
			Tw(Underline, {Size = UDim2.new(0.8, 0, 0, 1)}, TI.Slow)
			PageScroll.CanvasPosition = Vector2.new(0, 0)
			ActiveTab = Tab
		end

		Tab.MouseButton1Click:Connect(SelectTab)
		Tab.MouseEnter:Connect(function()
			if ActiveTab ~= Tab then
				Tw(Tab, {BackgroundTransparency = 0, BackgroundColor3 = C.HOVER}, TI.Fast)
			end
		end)
		Tab.MouseLeave:Connect(function()
			if ActiveTab ~= Tab then
				Tw(Tab, {BackgroundTransparency = 1}, TI.Fast)
			end
		end)

		if #Pages == 1 then SelectTab() end

		local PageObj = {}
		function PageObj:addSection(sname)
			local ok, result = pcall(BuildSection, sname, PageScroll)
			if not ok then
				print("[ecohub ERROR] addSection '" .. tostring(sname) .. "': " .. tostring(result))
				return setmetatable({}, {__index = function() return function() end end})
			end
			return result
		end
		return PageObj
	end

	function Window:setToggleKey(keyCode)
		ToggleKey = keyCode
	end

	function Window:setIgnoreIndexes(list)
		for _, k in ipairs(list) do
			SaveIgnore[k] = true
		end
	end

	return Window
end

return Library

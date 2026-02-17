local function DestroyYep()
	for x = 1, 69 do
		if game.CoreGui:FindFirstChild("ecohub_gui") then
			game.CoreGui:FindFirstChild("ecohub_gui"):Destroy()
		end
	end
end
DestroyYep()
wait(0.069)

local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TextService      = game:GetService("TextService")

local Library = {}

local Icons = {
	["accessibility"]                   = "rbxassetid://10709751939",
	["activity"]                        = "rbxassetid://10709752035",
	["air-vent"]                        = "rbxassetid://10709752131",
	["airplay"]                         = "rbxassetid://10709752254",
	["alarm-check"]                     = "rbxassetid://10709752405",
	["alarm-clock"]                     = "rbxassetid://10709752630",
	["alarm-clock-off"]                 = "rbxassetid://10709752508",
	["alarm-minus"]                     = "rbxassetid://10709752732",
	["alarm-plus"]                      = "rbxassetid://10709752825",
	["album"]                           = "rbxassetid://10709752906",
	["alert-circle"]                    = "rbxassetid://10709752996",
	["alert-octagon"]                   = "rbxassetid://10709753064",
	["alert-triangle"]                  = "rbxassetid://10709753149",
	["anchor"]                          = "rbxassetid://10709761530",
	["angry"]                           = "rbxassetid://10709761629",
	["annoyed"]                         = "rbxassetid://10709761722",
	["aperture"]                        = "rbxassetid://10709761813",
	["apple"]                           = "rbxassetid://10709761889",
	["archive"]                         = "rbxassetid://10709762233",
	["archive-restore"]                 = "rbxassetid://10709762058",
	["armchair"]                        = "rbxassetid://10709762327",
	["arrow-big-down"]                  = "rbxassetid://10747796644",
	["arrow-big-left"]                  = "rbxassetid://10709762574",
	["arrow-big-right"]                 = "rbxassetid://10709762727",
	["arrow-big-up"]                    = "rbxassetid://10709762879",
	["arrow-down"]                      = "rbxassetid://10709767827",
	["arrow-down-circle"]               = "rbxassetid://10709763034",
	["arrow-down-left"]                 = "rbxassetid://10709767656",
	["arrow-down-right"]                = "rbxassetid://10709767750",
	["arrow-left"]                      = "rbxassetid://10709768114",
	["arrow-left-circle"]               = "rbxassetid://10709767936",
	["arrow-left-right"]                = "rbxassetid://10709768019",
	["arrow-right"]                     = "rbxassetid://10709768347",
	["arrow-right-circle"]              = "rbxassetid://10709768226",
	["arrow-up"]                        = "rbxassetid://10709768939",
	["arrow-up-circle"]                 = "rbxassetid://10709768432",
	["arrow-up-down"]                   = "rbxassetid://10709768538",
	["arrow-up-left"]                   = "rbxassetid://10709768661",
	["arrow-up-right"]                  = "rbxassetid://10709768787",
	["asterisk"]                        = "rbxassetid://10709769095",
	["at-sign"]                         = "rbxassetid://10709769286",
	["award"]                           = "rbxassetid://10709769406",
	["axe"]                             = "rbxassetid://10709769508",
	["axis-3d"]                         = "rbxassetid://10709769598",
	["baby"]                            = "rbxassetid://10709769732",
	["backpack"]                        = "rbxassetid://10709769841",
	["baggage-claim"]                   = "rbxassetid://10709769935",
	["banana"]                          = "rbxassetid://10709770005",
	["banknote"]                        = "rbxassetid://10709770178",
	["bar-chart"]                       = "rbxassetid://10709773755",
	["bar-chart-2"]                     = "rbxassetid://10709770317",
	["bar-chart-3"]                     = "rbxassetid://10709770431",
	["bar-chart-4"]                     = "rbxassetid://10709770560",
	["bar-chart-horizontal"]            = "rbxassetid://10709773669",
	["barcode"]                         = "rbxassetid://10747360675",
	["baseline"]                        = "rbxassetid://10709773863",
	["bath"]                            = "rbxassetid://10709773963",
	["battery"]                         = "rbxassetid://10709774640",
	["battery-charging"]                = "rbxassetid://10709774068",
	["battery-full"]                    = "rbxassetid://10709774206",
	["battery-low"]                     = "rbxassetid://10709774370",
	["battery-medium"]                  = "rbxassetid://10709774513",
	["beaker"]                          = "rbxassetid://10709774756",
	["bed"]                             = "rbxassetid://10709775036",
	["bed-double"]                      = "rbxassetid://10709774864",
	["bed-single"]                      = "rbxassetid://10709774968",
	["beer"]                            = "rbxassetid://10709775167",
	["bell"]                            = "rbxassetid://10709775704",
	["bell-minus"]                      = "rbxassetid://10709775241",
	["bell-off"]                        = "rbxassetid://10709775320",
	["bell-plus"]                       = "rbxassetid://10709775448",
	["bell-ring"]                       = "rbxassetid://10709775560",
	["bike"]                            = "rbxassetid://10709775894",
	["binary"]                          = "rbxassetid://10709776050",
	["bitcoin"]                         = "rbxassetid://10709776126",
	["bluetooth"]                       = "rbxassetid://10709776655",
	["bluetooth-connected"]             = "rbxassetid://10709776240",
	["bluetooth-off"]                   = "rbxassetid://10709776344",
	["bluetooth-searching"]             = "rbxassetid://10709776501",
	["bold"]                            = "rbxassetid://10747813908",
	["bomb"]                            = "rbxassetid://10709781460",
	["bone"]                            = "rbxassetid://10709781605",
	["book"]                            = "rbxassetid://10709781824",
	["book-open"]                       = "rbxassetid://10709781717",
	["bookmark"]                        = "rbxassetid://10709782154",
	["bookmark-minus"]                  = "rbxassetid://10709781919",
	["bookmark-plus"]                   = "rbxassetid://10709782044",
	["bot"]                             = "rbxassetid://10709782230",
	["box"]                             = "rbxassetid://10709782497",
	["box-select"]                      = "rbxassetid://10709782342",
	["boxes"]                           = "rbxassetid://10709782582",
	["briefcase"]                       = "rbxassetid://10709782662",
	["brush"]                           = "rbxassetid://10709782758",
	["bug"]                             = "rbxassetid://10709782845",
	["building"]                        = "rbxassetid://10709783051",
	["building-2"]                      = "rbxassetid://10709782939",
	["bus"]                             = "rbxassetid://10709783137",
	["cake"]                            = "rbxassetid://10709783217",
	["calculator"]                      = "rbxassetid://10709783311",
	["calendar"]                        = "rbxassetid://10709789505",
	["camera"]                          = "rbxassetid://10709789686",
	["car"]                             = "rbxassetid://10709789810",
	["carrot"]                          = "rbxassetid://10709789960",
	["cast"]                            = "rbxassetid://10709790097",
	["check"]                           = "rbxassetid://10709790644",
	["check-circle"]                    = "rbxassetid://10709790387",
	["check-circle-2"]                  = "rbxassetid://10709790298",
	["check-square"]                    = "rbxassetid://10709790537",
	["chef-hat"]                        = "rbxassetid://10709790757",
	["cherry"]                          = "rbxassetid://10709790875",
	["chevron-down"]                    = "rbxassetid://10709790948",
	["chevron-left"]                    = "rbxassetid://10709791281",
	["chevron-right"]                   = "rbxassetid://10709791437",
	["chevron-up"]                      = "rbxassetid://10709791523",
	["circle"]                          = "rbxassetid://10709798174",
	["clock"]                           = "rbxassetid://10709805144",
	["cloud"]                           = "rbxassetid://10709806740",
	["code"]                            = "rbxassetid://10709810463",
	["code-2"]                          = "rbxassetid://10709807111",
	["coffee"]                          = "rbxassetid://10709810814",
	["cog"]                             = "rbxassetid://10709810948",
	["coins"]                           = "rbxassetid://10709811110",
	["command"]                         = "rbxassetid://10709811365",
	["compass"]                         = "rbxassetid://10709811445",
	["contact"]                         = "rbxassetid://10709811834",
	["copy"]                            = "rbxassetid://10709812159",
	["cpu"]                             = "rbxassetid://10709813383",
	["crosshair"]                       = "rbxassetid://10709818534",
	["crown"]                           = "rbxassetid://10709818626",
	["database"]                        = "rbxassetid://10709818996",
	["diamond"]                         = "rbxassetid://10709819149",
	["disc"]                            = "rbxassetid://10723343537",
	["dollar-sign"]                     = "rbxassetid://10723343958",
	["download"]                        = "rbxassetid://10723344270",
	["edit"]                            = "rbxassetid://10734883598",
	["edit-2"]                          = "rbxassetid://10723344885",
	["edit-3"]                          = "rbxassetid://10723345088",
	["eye"]                             = "rbxassetid://10723346959",
	["eye-off"]                         = "rbxassetid://10723346871",
	["file"]                            = "rbxassetid://10723374641",
	["filter"]                          = "rbxassetid://10723375128",
	["flame"]                           = "rbxassetid://10723376114",
	["folder"]                          = "rbxassetid://10723387563",
	["gamepad"]                         = "rbxassetid://10723395457",
	["gamepad-2"]                       = "rbxassetid://10723395215",
	["gauge"]                           = "rbxassetid://10723395708",
	["gem"]                             = "rbxassetid://10723396000",
	["ghost"]                           = "rbxassetid://10723396107",
	["gift"]                            = "rbxassetid://10723396402",
	["globe"]                           = "rbxassetid://10723404337",
	["hammer"]                          = "rbxassetid://10723405360",
	["heart"]                           = "rbxassetid://10723406885",
	["help-circle"]                     = "rbxassetid://10723406988",
	["home"]                            = "rbxassetid://10723407389",
	["image"]                           = "rbxassetid://10723415040",
	["info"]                            = "rbxassetid://10723415903",
	["key"]                             = "rbxassetid://10723416652",
	["keyboard"]                        = "rbxassetid://10723416765",
	["lamp"]                            = "rbxassetid://10723417513",
	["layers"]                          = "rbxassetid://10723424505",
	["leaf"]                            = "rbxassetid://10723425539",
	["lightbulb"]                       = "rbxassetid://10723425852",
	["link"]                            = "rbxassetid://10723426722",
	["list"]                            = "rbxassetid://10723433811",
	["lock"]                            = "rbxassetid://10723434711",
	["log-in"]                          = "rbxassetid://10723434830",
	["log-out"]                         = "rbxassetid://10723434906",
	["magnet"]                          = "rbxassetid://10723435069",
	["mail"]                            = "rbxassetid://10734885430",
	["map"]                             = "rbxassetid://10734886202",
	["map-pin"]                         = "rbxassetid://10734886004",
	["maximize"]                        = "rbxassetid://10734886735",
	["medal"]                           = "rbxassetid://10734887072",
	["megaphone"]                       = "rbxassetid://10734887454",
	["menu"]                            = "rbxassetid://10734887784",
	["message-circle"]                  = "rbxassetid://10734888000",
	["message-square"]                  = "rbxassetid://10734888228",
	["mic"]                             = "rbxassetid://10734888864",
	["minimize"]                        = "rbxassetid://10734895698",
	["minus"]                           = "rbxassetid://10734896206",
	["minus-circle"]                    = "rbxassetid://10734895856",
	["monitor"]                         = "rbxassetid://10734896881",
	["moon"]                            = "rbxassetid://10734897102",
	["more-horizontal"]                 = "rbxassetid://10734897250",
	["more-vertical"]                   = "rbxassetid://10734897387",
	["mountain"]                        = "rbxassetid://10734897956",
	["mouse"]                           = "rbxassetid://10734898592",
	["music"]                           = "rbxassetid://10734905958",
	["navigation"]                      = "rbxassetid://10734906744",
	["network"]                         = "rbxassetid://10734906975",
	["newspaper"]                       = "rbxassetid://10734907168",
	["package"]                         = "rbxassetid://10734909540",
	["paint-bucket"]                    = "rbxassetid://10734909847",
	["paintbrush"]                      = "rbxassetid://10734910187",
	["palette"]                         = "rbxassetid://10734910430",
	["paperclip"]                       = "rbxassetid://10734910927",
	["pause"]                           = "rbxassetid://10734919336",
	["pen-tool"]                        = "rbxassetid://10734919503",
	["pencil"]                          = "rbxassetid://10734919691",
	["percent"]                         = "rbxassetid://10734919919",
	["phone"]                           = "rbxassetid://10734921524",
	["pie-chart"]                       = "rbxassetid://10734921727",
	["pin"]                             = "rbxassetid://10734922324",
	["play"]                            = "rbxassetid://10734923549",
	["play-circle"]                     = "rbxassetid://10734923214",
	["plus"]                            = "rbxassetid://10734924532",
	["plus-circle"]                     = "rbxassetid://10734923868",
	["power"]                           = "rbxassetid://10734930466",
	["printer"]                         = "rbxassetid://10734930632",
	["puzzle"]                          = "rbxassetid://10734930886",
	["quote"]                           = "rbxassetid://10734931234",
	["radio"]                           = "rbxassetid://10734931596",
	["recycle"]                         = "rbxassetid://10734932295",
	["redo"]                            = "rbxassetid://10734932822",
	["refresh-ccw"]                     = "rbxassetid://10734933056",
	["refresh-cw"]                      = "rbxassetid://10734933222",
	["regex"]                           = "rbxassetid://10734933655",
	["reply"]                           = "rbxassetid://10734934252",
	["rocket"]                          = "rbxassetid://10734934585",
	["rotate-ccw"]                      = "rbxassetid://10734940376",
	["rotate-cw"]                       = "rbxassetid://10734940654",
	["rss"]                             = "rbxassetid://10734940825",
	["ruler"]                           = "rbxassetid://10734941018",
	["save"]                            = "rbxassetid://10734941499",
	["scale"]                           = "rbxassetid://10734941912",
	["scan"]                            = "rbxassetid://10734942565",
	["scissors"]                        = "rbxassetid://10734942778",
	["search"]                          = "rbxassetid://10734943674",
	["send"]                            = "rbxassetid://10734943902",
	["server"]                          = "rbxassetid://10734949856",
	["settings"]                        = "rbxassetid://10734950309",
	["settings-2"]                      = "rbxassetid://10734950020",
	["share"]                           = "rbxassetid://10734950813",
	["share-2"]                         = "rbxassetid://10734950553",
	["shield"]                          = "rbxassetid://10734951847",
	["shield-alert"]                    = "rbxassetid://10734951173",
	["shield-check"]                    = "rbxassetid://10734951367",
	["shopping-bag"]                    = "rbxassetid://10734952273",
	["shopping-cart"]                   = "rbxassetid://10734952479",
	["shuffle"]                         = "rbxassetid://10734953451",
	["sidebar"]                         = "rbxassetid://10734954301",
	["signal"]                          = "rbxassetid://10734961133",
	["skull"]                           = "rbxassetid://10734962068",
	["slash"]                           = "rbxassetid://10734962600",
	["sliders"]                         = "rbxassetid://10734963400",
	["sliders-horizontal"]              = "rbxassetid://10734963191",
	["smartphone"]                      = "rbxassetid://10734963940",
	["smile"]                           = "rbxassetid://10734964441",
	["snowflake"]                       = "rbxassetid://10734964600",
	["sort-asc"]                        = "rbxassetid://10734965115",
	["sort-desc"]                       = "rbxassetid://10734965287",
	["speaker"]                         = "rbxassetid://10734965419",
	["star"]                            = "rbxassetid://10734966248",
	["star-half"]                       = "rbxassetid://10734965897",
	["stethoscope"]                     = "rbxassetid://10734966384",
	["stop-circle"]                     = "rbxassetid://10734972621",
	["sun"]                             = "rbxassetid://10734974297",
	["sunrise"]                         = "rbxassetid://10734974522",
	["sunset"]                          = "rbxassetid://10734974689",
	["sword"]                           = "rbxassetid://10734975486",
	["swords"]                          = "rbxassetid://10734975692",
	["syringe"]                         = "rbxassetid://10734975932",
	["table"]                           = "rbxassetid://10734976230",
	["tablet"]                          = "rbxassetid://10734976394",
	["tag"]                             = "rbxassetid://10734976528",
	["target"]                          = "rbxassetid://10734977012",
	["terminal"]                        = "rbxassetid://10734982144",
	["thermometer"]                     = "rbxassetid://10734983134",
	["thumbs-down"]                     = "rbxassetid://10734983359",
	["thumbs-up"]                       = "rbxassetid://10734983629",
	["ticket"]                          = "rbxassetid://10734983868",
	["timer"]                           = "rbxassetid://10734984606",
	["toggle-left"]                     = "rbxassetid://10734984834",
	["toggle-right"]                    = "rbxassetid://10734985040",
	["tornado"]                         = "rbxassetid://10734985247",
	["trash"]                           = "rbxassetid://10747362393",
	["trash-2"]                         = "rbxassetid://10747362241",
	["trending-down"]                   = "rbxassetid://10747363205",
	["trending-up"]                     = "rbxassetid://10747363465",
	["triangle"]                        = "rbxassetid://10747363621",
	["trophy"]                          = "rbxassetid://10747363809",
	["truck"]                           = "rbxassetid://10747364031",
	["tv"]                              = "rbxassetid://10747364593",
	["type"]                            = "rbxassetid://10747364761",
	["umbrella"]                        = "rbxassetid://10747364971",
	["undo"]                            = "rbxassetid://10747365484",
	["undo-2"]                          = "rbxassetid://10747365359",
	["unlock"]                          = "rbxassetid://10747366027",
	["upload"]                          = "rbxassetid://10747366434",
	["user"]                            = "rbxassetid://10747373176",
	["user-check"]                      = "rbxassetid://10747371901",
	["user-cog"]                        = "rbxassetid://10747372167",
	["user-minus"]                      = "rbxassetid://10747372346",
	["user-plus"]                       = "rbxassetid://10747372702",
	["user-x"]                          = "rbxassetid://10747372992",
	["users"]                           = "rbxassetid://10747373426",
	["utensils"]                        = "rbxassetid://10747373821",
	["verified"]                        = "rbxassetid://10747374131",
	["video"]                           = "rbxassetid://10747374938",
	["video-off"]                       = "rbxassetid://10747374721",
	["volume"]                          = "rbxassetid://10747376008",
	["volume-1"]                        = "rbxassetid://10747375450",
	["volume-2"]                        = "rbxassetid://10747375679",
	["volume-x"]                        = "rbxassetid://10747375880",
	["wallet"]                          = "rbxassetid://10747376205",
	["wand"]                            = "rbxassetid://10747376565",
	["wand-2"]                          = "rbxassetid://10747376349",
	["watch"]                           = "rbxassetid://10747376722",
	["waves"]                           = "rbxassetid://10747376931",
	["webcam"]                          = "rbxassetid://10747381992",
	["wifi"]                            = "rbxassetid://10747382504",
	["wifi-off"]                        = "rbxassetid://10747382268",
	["wind"]                            = "rbxassetid://10747382750",
	["wrench"]                          = "rbxassetid://10747383470",
	["x"]                               = "rbxassetid://10747384394",
	["x-circle"]                        = "rbxassetid://10747383819",
	["x-square"]                        = "rbxassetid://10747384217",
	["zoom-in"]                         = "rbxassetid://10747384552",
	["zoom-out"]                        = "rbxassetid://10747384679",
}

Library.Icons = Icons

local C = {
	BG      = Color3.fromRGB(10, 10, 14),
	SIDEBAR = Color3.fromRGB(7, 7, 10),
	ELEM    = Color3.fromRGB(18, 16, 26),
	SECT    = Color3.fromRGB(13, 11, 20),
	HOVER   = Color3.fromRGB(28, 24, 40),
	ACTIVE  = Color3.fromRGB(22, 18, 34),
	ACCENT  = Color3.fromRGB(140, 80, 255),
	TEXT    = Color3.fromRGB(235, 235, 235),
	DIM     = Color3.fromRGB(130, 120, 155),
	OFF     = Color3.fromRGB(25, 22, 36),
	CHECK   = Color3.fromRGB(45, 200, 85),
	BORDER  = Color3.fromRGB(38, 30, 58),
	SEP     = Color3.fromRGB(40, 32, 62),
	KEYBG   = Color3.fromRGB(20, 18, 30),
}

local TI = {
	Fast = TweenInfo.new(0.12, Enum.EasingStyle.Quad),
	Med  = TweenInfo.new(0.18, Enum.EasingStyle.Quad),
	Slow = TweenInfo.new(0.22, Enum.EasingStyle.Quart),
	Key  = TweenInfo.new(0.08, Enum.EasingStyle.Quad),
}

local function Tw(obj, props, ti)
	TweenService:Create(obj, ti or TI.Fast, props):Play()
end

local function Corner(p, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 6)
	c.Parent = p
	return c
end

local function Stroke(p, col)
	local s = Instance.new("UIStroke")
	s.Color = col or C.BORDER
	s.Thickness = 1
	s.Parent = p
	return s
end

local function GetKeyName(kc)
	local shortcuts = {
		Return       = "Enter",
		LeftShift    = "LShift",
		RightShift   = "RShift",
		LeftControl  = "LCtrl",
		RightControl = "RCtrl",
		LeftAlt      = "LAlt",
		RightAlt     = "RAlt",
	}
	return shortcuts[kc.Name] or kc.Name
end

local function MakeIcon(parent, iconName, size, pos, anchorPoint)
	local assetId = Icons[iconName]
	if not assetId then return nil end
	local img = Instance.new("ImageLabel")
	img.BackgroundTransparency = 1
	img.Image = assetId
	img.ImageColor3 = C.DIM
	img.Size = size or UDim2.new(0, 14, 0, 14)
	img.Position = pos or UDim2.new(0, 0, 0.5, -7)
	img.AnchorPoint = anchorPoint or Vector2.new(0, 0)
	img.ScaleType = Enum.ScaleType.Fit
	img.Parent = parent
	return img
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
	Main.BackgroundColor3 = C.BG
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.25, 0, 0.25, 0)
	Main.Size = UDim2.new(0, 520, 0, 340)
	Main.ClipsDescendants = true
	Corner(Main, 8)
	Stroke(Main)

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

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Parent = TitleBar
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Position = UDim2.new(0, 12, 0, 0)
	TitleLabel.Size = UDim2.new(0.6, 0, 1, 0)
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.Text = windowname or "ecohub"
	TitleLabel.TextColor3 = C.TEXT
	TitleLabel.TextSize = 12
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

	local VerLabel = Instance.new("TextLabel")
	VerLabel.Parent = TitleBar
	VerLabel.BackgroundTransparency = 1
	VerLabel.Position = UDim2.new(0, 0, 0, 0)
	VerLabel.Size = UDim2.new(1, -12, 1, 0)
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
	TabScroll.Size = UDim2.new(1, -12, 1, -12)
	TabScroll.ScrollBarThickness = 2
	TabScroll.ScrollBarImageColor3 = C.ACCENT
	TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local TabLayout = Instance.new("UIListLayout")
	TabLayout.Parent = TabScroll
	TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
	TabLayout.Padding = UDim.new(0, 3)

	local ContentArea = Instance.new("Frame")
	ContentArea.Parent = Body
	ContentArea.BackgroundTransparency = 1
	ContentArea.BorderSizePixel = 0
	ContentArea.Position = UDim2.new(0, 126, 0, 4)
	ContentArea.Size = UDim2.new(1, -130, 1, -8)

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
				startPos.Y.Scale, startPos.Y.Offset + d.Y
			)
		end
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	local Minimized = false
	local FullH = UDim2.new(0, 520, 0, 340)
	local MiniH = UDim2.new(0, 520, 0, 32)

	local function DoMinimize(hide)
		Minimized = hide
		if hide then
			Tw(Main, {Size = MiniH}, TI.Slow)
			Tw(Body, {Position = UDim2.new(0, 0, 1.2, 0)}, TI.Med)
		else
			Tw(Main, {Size = FullH}, TI.Slow)
			Tw(Body, {Position = UDim2.new(0, 0, 0, 32)}, TI.Med)
		end
	end

	TitleBar.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton2 then
			DoMinimize(not Minimized)
		end
	end)

	UserInputService.InputBegan:Connect(function(inp, gp)
		if not gp and (inp.KeyCode == Enum.KeyCode.LeftAlt or inp.KeyCode == Enum.KeyCode.RightAlt) then
			if Main.Visible and not Minimized then
				DoMinimize(true)
			elseif Main.Visible and Minimized then
				DoMinimize(false)
			else
				Main.Visible = true
				Main.Size = MiniH
				Tw(Main, {Size = FullH}, TI.Slow)
				Body.Position = UDim2.new(0, 0, 1.2, 0)
				Tw(Body, {Position = UDim2.new(0, 0, 0, 32)}, TI.Med)
				Minimized = false
			end
		end
	end)

	local Pages = {}
	local ActiveTab = nil
	local Window = {}

	function Window:addPage(pagename, iconName)
		local hasIcon = iconName and Icons[iconName] ~= nil
		local iconSize = 14
		local iconPad = hasIcon and (iconSize + 4) or 0

		local Tab = Instance.new("TextButton")
		Tab.Parent = TabScroll
		Tab.BackgroundColor3 = C.ELEM
		Tab.BackgroundTransparency = 1
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(1, 0, 0, 28)
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.GothamSemibold
		Tab.Text = pagename
		Tab.TextColor3 = C.DIM
		Tab.TextSize = 11
		Tab.ClipsDescendants = false
		Corner(Tab, 5)

		if hasIcon then
			Tab.Text = ""

			local IconImg = Instance.new("ImageLabel")
			IconImg.BackgroundTransparency = 1
			IconImg.Image = Icons[iconName]
			IconImg.ImageColor3 = C.DIM
			IconImg.Size = UDim2.new(0, iconSize, 0, iconSize)
			IconImg.Position = UDim2.new(0, 6, 0.5, -iconSize / 2)
			IconImg.ScaleType = Enum.ScaleType.Fit
			IconImg.Name = "TabIcon"
			IconImg.Parent = Tab

			local Lbl = Instance.new("TextLabel")
			Lbl.BackgroundTransparency = 1
			Lbl.Position = UDim2.new(0, 6 + iconSize + 4, 0, 0)
			Lbl.Size = UDim2.new(1, -(6 + iconSize + 4 + 4), 1, 0)
			Lbl.Font = Enum.Font.GothamSemibold
			Lbl.Text = pagename
			Lbl.TextColor3 = C.DIM
			Lbl.TextSize = 11
			Lbl.TextXAlignment = Enum.TextXAlignment.Left
			Lbl.Name = "TabLabel"
			Lbl.Parent = Tab

			local function SetIconColor(col)
				IconImg.ImageColor3 = col
				Lbl.TextColor3 = col
			end

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

			table.insert(Pages, {Tab = Tab, Page = PageFrame, Underline = Underline, SetIconColor = SetIconColor})

			local function SelectTab()
				for _, p in pairs(Pages) do
					p.Page.Visible = false
					Tw(p.Tab, {BackgroundTransparency = 1}, TI.Fast)
					if p.SetIconColor then
						p.SetIconColor(C.DIM)
					else
						p.Tab.TextColor3 = C.DIM
					end
					p.Underline.Visible = false
				end
				PageFrame.Visible = true
				PageFrame.Position = UDim2.new(0.05, 0, 0, 0)
				Tw(PageFrame, {Position = UDim2.new(0, 0, 0, 0)}, TI.Med)
				Tw(Tab, {BackgroundTransparency = 0}, TI.Fast)
				SetIconColor(C.TEXT)
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
			local function addSection_impl(sectionname)
				local Outer = Instance.new("Frame")
				Outer.Parent = PageScroll
				Outer.BackgroundColor3 = C.SECT
				Outer.BorderSizePixel = 0
				Outer.Size = UDim2.new(1, 0, 0, 0)
				Outer.AutomaticSize = Enum.AutomaticSize.Y
				Corner(Outer, 6)
				Stroke(Outer)

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

				local SecObj = {}

				local function Base(h, col)
					local f = Instance.new("Frame")
					f.Parent = SecContent
					f.BackgroundColor3 = col or C.ELEM
					f.BorderSizePixel = 0
					f.Size = UDim2.new(1, 0, 0, h)
					Corner(f, 5)
					return f
				end

				function SecObj:addButton(name, callback)
					local cb = callback or function() end
					local f = Base(28)
					local btn = Instance.new("TextButton")
					btn.Parent = f
					btn.BackgroundTransparency = 1
					btn.Size = UDim2.new(1, 0, 1, 0)
					btn.AutoButtonColor = false
					btn.Font = Enum.Font.GothamSemibold
					btn.Text = name or "Button"
					btn.TextColor3 = C.TEXT
					btn.TextSize = 11

					btn.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
					btn.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
					btn.MouseButton1Down:Connect(function()
						Tw(f, {BackgroundColor3 = C.ACCENT})
						task.delay(0.14, function()
							Tw(f, {BackgroundColor3 = C.ELEM})
							pcall(cb)
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

				function SecObj:addToggle(togglename, default, callback, defaultKey)
					local cb = callback or function() end
					local On = default or false
					local ChosenKey = defaultKey or nil
					local Listening = false

					local f = Base(28)

					local ChkEdge = Instance.new("Frame")
					ChkEdge.Parent = f
					ChkEdge.BackgroundColor3 = C.OFF
					ChkEdge.BorderSizePixel = 0
					ChkEdge.Position = UDim2.new(0, 6, 0.5, -8)
					ChkEdge.Size = UDim2.new(0, 16, 0, 16)
					Corner(ChkEdge, 3)
					Stroke(ChkEdge, On and C.CHECK or C.BORDER)

					local ChkInner = Instance.new("Frame")
					ChkInner.Parent = ChkEdge
					ChkInner.AnchorPoint = Vector2.new(0.5, 0.5)
					ChkInner.BackgroundColor3 = C.CHECK
					ChkInner.BackgroundTransparency = On and 0 or 1
					ChkInner.BorderSizePixel = 0
					ChkInner.Position = UDim2.new(0.5, 0, 0.5, 0)
					ChkInner.Size = On and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)
					Corner(ChkInner, 2)

					local ChkMark = Instance.new("TextLabel")
					ChkMark.Parent = ChkEdge
					ChkMark.BackgroundTransparency = 1
					ChkMark.Size = UDim2.new(1, 0, 1, 0)
					ChkMark.Font = Enum.Font.GothamBold
					ChkMark.Text = "v"
					ChkMark.TextColor3 = Color3.fromRGB(255, 255, 255)
					ChkMark.TextSize = 10
					ChkMark.TextTransparency = On and 0 or 1

					local Lbl = Instance.new("TextLabel")
					Lbl.Parent = f
					Lbl.BackgroundTransparency = 1
					Lbl.Position = UDim2.new(0, 28, 0, 0)
					Lbl.Size = UDim2.new(1, -110, 1, 0)
					Lbl.Font = Enum.Font.GothamSemibold
					Lbl.Text = togglename or "Toggle"
					Lbl.TextColor3 = C.TEXT
					Lbl.TextSize = 11
					Lbl.TextXAlignment = Enum.TextXAlignment.Left

					local KbBtn = Instance.new("TextButton")
					KbBtn.Parent = f
					KbBtn.BackgroundColor3 = C.KEYBG
					KbBtn.BorderSizePixel = 0
					KbBtn.AnchorPoint = Vector2.new(1, 0.5)
					KbBtn.Position = UDim2.new(1, -6, 0.5, 0)
					KbBtn.Size = UDim2.new(0, 54, 0, 18)
					KbBtn.AutoButtonColor = false
					KbBtn.Font = Enum.Font.GothamSemibold
					KbBtn.Text = ChosenKey and "[" .. GetKeyName(ChosenKey) .. "]" or "[ -- ]"
					KbBtn.TextColor3 = C.DIM
					KbBtn.TextSize = 9
					Corner(KbBtn, 4)
					Stroke(KbBtn, C.BORDER)

					local function ResizeKb()
						local sz = TextService:GetTextSize(KbBtn.Text, KbBtn.TextSize, KbBtn.Font, Vector2.new(math.huge, math.huge))
						Tw(KbBtn, {Size = UDim2.new(0, math.max(54, sz.X + 14), 0, 18)}, TI.Key)
					end
					KbBtn:GetPropertyChangedSignal("Text"):Connect(ResizeKb)
					ResizeKb()

					local function UpdateVisuals()
						local sk = ChkEdge:FindFirstChildOfClass("UIStroke")
						Tw(ChkInner, {BackgroundTransparency = On and 0 or 1, Size = On and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)}, TI.Fast)
						Tw(ChkMark, {TextTransparency = On and 0 or 1}, TI.Fast)
						if sk then sk.Color = On and C.CHECK or C.BORDER end
						Tw(Lbl, {TextColor3 = On and C.TEXT or C.DIM}, TI.Fast)
					end

					local HitBtn = Instance.new("TextButton")
					HitBtn.Parent = f
					HitBtn.BackgroundTransparency = 1
					HitBtn.Position = UDim2.new(0, 0, 0, 0)
					HitBtn.Size = UDim2.new(1, -66, 1, 0)
					HitBtn.AutoButtonColor = false
					HitBtn.Text = ""

					HitBtn.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
					HitBtn.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
					HitBtn.MouseButton1Click:Connect(function()
						if Listening then return end
						On = not On
						UpdateVisuals()
						pcall(cb, On)
					end)

					KbBtn.MouseButton1Click:Connect(function()
						if Listening then return end
						Listening = true
						KbBtn.Text = "[ ... ]"
						KbBtn.TextColor3 = C.ACCENT
						local sk = KbBtn:FindFirstChildOfClass("UIStroke")
						if sk then sk.Color = C.ACCENT end
						ResizeKb()
					end)

					UserInputService.InputBegan:Connect(function(inp, gp)
						if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
						if Listening then
							Listening = false
							local sk = KbBtn:FindFirstChildOfClass("UIStroke")
							if inp.KeyCode == Enum.KeyCode.Escape then
								ChosenKey = nil
								KbBtn.Text = "[ -- ]"
							else
								ChosenKey = inp.KeyCode
								KbBtn.Text = "[" .. GetKeyName(inp.KeyCode) .. "]"
							end
							KbBtn.TextColor3 = C.DIM
							if sk then sk.Color = C.BORDER end
							ResizeKb()
							return
						end
						if not gp and ChosenKey and inp.KeyCode == ChosenKey then
							On = not On
							UpdateVisuals()
							pcall(cb, On)
						end
					end)

					UpdateVisuals()

					local ctrl = {}
					function ctrl:Set(v) On = v UpdateVisuals() pcall(cb, On) end
					function ctrl:Get() return On end
					function ctrl:SetKey(kc) ChosenKey = kc KbBtn.Text = kc and "[" .. GetKeyName(kc) .. "]" or "[ -- ]" ResizeKb() end
					function ctrl:GetKey() return ChosenKey end
					return ctrl
				end

				function SecObj:addToggleColor(name, default, defaultColor, cbToggle, cbColor)
					local cbT = cbToggle or function() end
					local cbC = cbColor or function() end
					local On = default or false
					local CurColor = defaultColor or Color3.fromRGB(255, 80, 80)
					local H, S, V = Color3.toHSV(CurColor)
					local PanelOpen = false

					local f = Base(28)

					local ChkEdge = Instance.new("Frame")
					ChkEdge.Parent = f
					ChkEdge.BackgroundColor3 = C.OFF
					ChkEdge.BorderSizePixel = 0
					ChkEdge.Position = UDim2.new(0, 6, 0.5, -8)
					ChkEdge.Size = UDim2.new(0, 16, 0, 16)
					Corner(ChkEdge, 3)
					Stroke(ChkEdge, On and C.CHECK or C.BORDER)

					local ChkInner = Instance.new("Frame")
					ChkInner.Parent = ChkEdge
					ChkInner.AnchorPoint = Vector2.new(0.5, 0.5)
					ChkInner.BackgroundColor3 = C.CHECK
					ChkInner.BackgroundTransparency = On and 0 or 1
					ChkInner.BorderSizePixel = 0
					ChkInner.Position = UDim2.new(0.5, 0, 0.5, 0)
					ChkInner.Size = On and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)
					Corner(ChkInner, 2)

					local ChkMark = Instance.new("TextLabel")
					ChkMark.Parent = ChkEdge
					ChkMark.BackgroundTransparency = 1
					ChkMark.Size = UDim2.new(1, 0, 1, 0)
					ChkMark.Font = Enum.Font.GothamBold
					ChkMark.Text = "v"
					ChkMark.TextColor3 = Color3.fromRGB(255, 255, 255)
					ChkMark.TextSize = 10
					ChkMark.TextTransparency = On and 0 or 1

					local Lbl = Instance.new("TextLabel")
					Lbl.Parent = f
					Lbl.BackgroundTransparency = 1
					Lbl.Position = UDim2.new(0, 28, 0, 0)
					Lbl.Size = UDim2.new(1, -60, 1, 0)
					Lbl.Font = Enum.Font.GothamSemibold
					Lbl.Text = name or "Toggle"
					Lbl.TextColor3 = On and C.TEXT or C.DIM
					Lbl.TextSize = 11
					Lbl.TextXAlignment = Enum.TextXAlignment.Left

					local ColorBtn = Instance.new("TextButton")
					ColorBtn.Parent = f
					ColorBtn.BackgroundColor3 = CurColor
					ColorBtn.BorderSizePixel = 0
					ColorBtn.AnchorPoint = Vector2.new(1, 0.5)
					ColorBtn.Position = UDim2.new(1, -6, 0.5, 0)
					ColorBtn.Size = UDim2.new(0, 16, 0, 16)
					ColorBtn.AutoButtonColor = false
					ColorBtn.Text = ""
					Corner(ColorBtn, 3)
					Stroke(ColorBtn)

					local Panel = Instance.new("Frame")
					Panel.Parent = f
					Panel.BackgroundColor3 = C.SECT
					Panel.BorderSizePixel = 0
					Panel.Position = UDim2.new(0, 0, 1, 2)
					Panel.Size = UDim2.new(1, 0, 0, 0)
					Panel.ClipsDescendants = true
					Panel.Visible = false
					Panel.ZIndex = 10
					Corner(Panel, 5)
					Stroke(Panel)

					local function Refresh()
						CurColor = Color3.fromHSV(H, S, V)
						ColorBtn.BackgroundColor3 = CurColor
						pcall(cbC, CurColor)
					end

					local chs = {
						{l = "H", g = function() return H end, s = function(v) H = v end, m = 360},
						{l = "S", g = function() return S end, s = function(v) S = v end, m = 100},
						{l = "V", g = function() return V end, s = function(v) V = v end, m = 100},
					}
					local panelH = #chs * 26 + 8

					for i, ch in ipairs(chs) do
						local Row = Instance.new("Frame")
						Row.Parent = Panel
						Row.BackgroundTransparency = 1
						Row.Position = UDim2.new(0, 8, 0, 4 + (i - 1) * 26)
						Row.Size = UDim2.new(1, -16, 0, 20)
						Row.ZIndex = 11

						local RL = Instance.new("TextLabel")
						RL.Parent = Row
						RL.BackgroundTransparency = 1
						RL.Size = UDim2.new(0, 14, 1, 0)
						RL.Font = Enum.Font.GothamBold
						RL.Text = ch.l
						RL.TextColor3 = C.ACCENT
						RL.TextSize = 10
						RL.ZIndex = 11

						local RT = Instance.new("TextButton")
						RT.Parent = Row
						RT.BackgroundColor3 = C.OFF
						RT.BorderSizePixel = 0
						RT.Position = UDim2.new(0, 20, 0.5, -3)
						RT.Size = UDim2.new(1, -60, 0, 6)
						RT.AutoButtonColor = false
						RT.Text = ""
						RT.ZIndex = 11
						Corner(RT, 3)

						local RF = Instance.new("Frame")
						RF.Parent = RT
						RF.BackgroundColor3 = C.ACCENT
						RF.BorderSizePixel = 0
						RF.Size = UDim2.new(ch.g(), 0, 1, 0)
						RF.ZIndex = 12
						Corner(RF, 3)

						local RV = Instance.new("TextLabel")
						RV.Parent = Row
						RV.BackgroundTransparency = 1
						RV.Position = UDim2.new(1, -36, 0, 0)
						RV.Size = UDim2.new(0, 34, 1, 0)
						RV.Font = Enum.Font.Gotham
						RV.Text = tostring(math.floor(ch.g() * ch.m))
						RV.TextColor3 = C.DIM
						RV.TextSize = 9
						RV.ZIndex = 11

						local dr = false
						RT.MouseButton1Down:Connect(function() dr = true end)
						UserInputService.InputChanged:Connect(function(inp)
							if dr and inp.UserInputType == Enum.UserInputType.MouseMovement then
								local p = math.clamp((inp.Position.X - RT.AbsolutePosition.X) / RT.AbsoluteSize.X, 0, 1)
								RF.Size = UDim2.new(p, 0, 1, 0)
								RV.Text = tostring(math.floor(p * ch.m))
								ch.s(p)
								Refresh()
							end
						end)
						UserInputService.InputEnded:Connect(function(inp)
							if inp.UserInputType == Enum.UserInputType.MouseButton1 then dr = false end
						end)
					end

					ColorBtn.MouseButton1Click:Connect(function()
						PanelOpen = not PanelOpen
						if PanelOpen then
							f.Size = UDim2.new(1, 0, 0, 28 + panelH + 4)
							Panel.Visible = true
							Tw(Panel, {Size = UDim2.new(1, 0, 0, panelH)})
						else
							Tw(Panel, {Size = UDim2.new(1, 0, 0, 0)})
							task.delay(0.14, function()
								Panel.Visible = false
								f.Size = UDim2.new(1, 0, 0, 28)
							end)
						end
					end)

					local function UpdateToggle()
						local sk = ChkEdge:FindFirstChildOfClass("UIStroke")
						Tw(ChkInner, {BackgroundTransparency = On and 0 or 1, Size = On and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)})
						Tw(ChkMark, {TextTransparency = On and 0 or 1})
						if sk then sk.Color = On and C.CHECK or C.BORDER end
						Tw(Lbl, {TextColor3 = On and C.TEXT or C.DIM})
					end

					local Hit = Instance.new("TextButton")
					Hit.Parent = f
					Hit.BackgroundTransparency = 1
					Hit.Position = UDim2.new(0, 0, 0, 0)
					Hit.Size = UDim2.new(1, -30, 1, 0)
					Hit.AutoButtonColor = false
					Hit.Text = ""
					Hit.ZIndex = 2

					Hit.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
					Hit.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
					Hit.MouseButton1Click:Connect(function()
						On = not On
						UpdateToggle()
						pcall(cbT, On)
					end)

					local ctrl = {}
					function ctrl:SetToggle(v) On = v UpdateToggle() end
					function ctrl:GetToggle() return On end
					function ctrl:SetColor(c) CurColor = c H, S, V = Color3.toHSV(c) ColorBtn.BackgroundColor3 = c end
					function ctrl:GetColor() return CurColor end
					return ctrl
				end

				function SecObj:addSlider(name, mn, mx, def, callback)
					local cb = callback or function() end
					mn = tonumber(mn) or 0
					mx = tonumber(mx) or 100
					local cur = math.clamp(tonumber(def) or mn, mn, mx)
					local f = Base(42)

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

					local Track = Instance.new("TextButton")
					Track.Parent = f
					Track.BackgroundColor3 = C.OFF
					Track.BorderSizePixel = 0
					Track.Position = UDim2.new(0, 10, 0, 28)
					Track.Size = UDim2.new(1, -20, 0, 7)
					Track.AutoButtonColor = false
					Track.Text = ""
					Corner(Track, 3)

					local Fill = Instance.new("Frame")
					Fill.Parent = Track
					Fill.BackgroundColor3 = C.ACCENT
					Fill.BorderSizePixel = 0
					Fill.Size = UDim2.new((cur - mn) / (mx - mn), 0, 1, 0)
					Corner(Fill, 3)

					local Drag = false
					local function Upd(px)
						local p = math.clamp((px - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
						cur = math.floor(mn + (mx - mn) * p)
						Fill.Size = UDim2.new(p, 0, 1, 0)
						VL.Text = tostring(cur)
						pcall(cb, cur)
					end
					Track.MouseButton1Down:Connect(function() Drag = true end)
					UserInputService.InputChanged:Connect(function(i)
						if Drag and i.UserInputType == Enum.UserInputType.MouseMovement then Upd(i.Position.X) end
					end)
					UserInputService.InputEnded:Connect(function(i)
						if i.UserInputType == Enum.UserInputType.MouseButton1 then Drag = false end
					end)
					f.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
					f.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)

					local ctrl = {}
					function ctrl:Set(v)
						cur = math.clamp(v, mn, mx)
						Fill.Size = UDim2.new((cur - mn) / (mx - mn), 0, 1, 0)
						VL.Text = tostring(cur)
					end
					function ctrl:Get() return cur end
					return ctrl
				end

				function SecObj:addTextBox(name, placeholder, callback)
					local cb = callback or function() end
					local f = Base(28)

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
					Stroke(Input)

					Input.Focused:Connect(function()
						Tw(Input, {BackgroundColor3 = C.ACTIVE})
						local s = Input:FindFirstChildOfClass("UIStroke")
						if s then s.Color = C.ACCENT end
					end)
					Input.FocusLost:Connect(function()
						Tw(Input, {BackgroundColor3 = C.OFF})
						local s = Input:FindFirstChildOfClass("UIStroke")
						if s then s.Color = C.BORDER end
						pcall(cb, Input.Text)
					end)
				end

				function SecObj:addDropdown(name, list, callback)
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

					local DN = Instance.new("TextLabel")
					DN.Parent = Hdr
					DN.BackgroundTransparency = 1
					DN.Position = UDim2.new(0, 10, 0, 0)
					DN.Size = UDim2.new(0.58, 0, 1, 0)
					DN.Font = Enum.Font.GothamSemibold
					DN.Text = name or "Dropdown"
					DN.TextColor3 = C.TEXT
					DN.TextSize = 11
					DN.TextXAlignment = Enum.TextXAlignment.Left
					DN.ZIndex = 6

					local DS = Instance.new("TextLabel")
					DS.Parent = Hdr
					DS.BackgroundTransparency = 1
					DS.Position = UDim2.new(0.58, 0, 0, 0)
					DS.Size = UDim2.new(0.42, -26, 1, 0)
					DS.Font = Enum.Font.Gotham
					DS.Text = "none"
					DS.TextColor3 = C.DIM
					DS.TextSize = 10
					DS.TextXAlignment = Enum.TextXAlignment.Right
					DS.ZIndex = 6

					local DA = Instance.new("TextLabel")
					DA.Parent = Hdr
					DA.BackgroundTransparency = 1
					DA.Position = UDim2.new(1, -22, 0, 0)
					DA.Size = UDim2.new(0, 20, 1, 0)
					DA.Font = Enum.Font.GothamBold
					DA.Text = "v"
					DA.TextColor3 = C.ACCENT
					DA.TextSize = 10
					DA.ZIndex = 6

					local DL = Instance.new("Frame")
					DL.Parent = Wrapper
					DL.BackgroundColor3 = C.SECT
					DL.BorderSizePixel = 0
					DL.Position = UDim2.new(0, 0, 0, 30)
					DL.Size = UDim2.new(1, 0, 0, 0)
					DL.ZIndex = 10
					DL.ClipsDescendants = true
					DL.Visible = false
					Corner(DL, 5)
					Stroke(DL)

					local DS2 = Instance.new("ScrollingFrame")
					DS2.Parent = DL
					DS2.BackgroundTransparency = 1
					DS2.BorderSizePixel = 0
					DS2.Size = UDim2.new(1, 0, 1, 0)
					DS2.ScrollBarThickness = 2
					DS2.ScrollBarImageColor3 = C.ACCENT
					DS2.ZIndex = 10
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
						DA.Text = "v"
						Tw(DL, {Size = UDim2.new(1, 0, 0, 0)})
						task.delay(0.14, function()
							DL.Visible = false
							Wrapper.Size = UDim2.new(1, 0, 0, 28)
						end)
					end
					local function OpenDD()
						Open = true
						DA.Text = "^"
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

					for _, item in ipairs(list) do
						local Opt = Instance.new("TextButton")
						Opt.Parent = DS2
						Opt.BackgroundColor3 = C.ELEM
						Opt.BorderSizePixel = 0
						Opt.Size = UDim2.new(1, 0, 0, 22)
						Opt.AutoButtonColor = false
						Opt.Font = Enum.Font.GothamSemibold
						Opt.Text = item
						Opt.TextColor3 = C.TEXT
						Opt.TextSize = 10
						Opt.ZIndex = 11
						Corner(Opt, 4)
						Opt.MouseEnter:Connect(function() Tw(Opt, {BackgroundColor3 = C.HOVER}) end)
						Opt.MouseLeave:Connect(function()
							if Selected ~= item then Tw(Opt, {BackgroundColor3 = C.ELEM}) end
						end)
						Opt.MouseButton1Click:Connect(function()
							Selected = item
							DS.Text = item
							DS.TextColor3 = C.ACCENT
							CloseDD()
							pcall(cb, item)
						end)
					end

					local ctrl = {}
					function ctrl:Set(v) Selected = v DS.Text = v DS.TextColor3 = C.ACCENT end
					function ctrl:Get() return Selected end
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
					Stroke(KbBtn)

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
						local sk = KbBtn:FindFirstChildOfClass("UIStroke")
						if sk then sk.Color = C.ACCENT end
						ResizeKb()
					end)

					UserInputService.InputBegan:Connect(function(inp, gp)
						if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
						if Listening then
							Listening = false
							local sk = KbBtn:FindFirstChildOfClass("UIStroke")
							if inp.KeyCode == Enum.KeyCode.Escape then
								CK = nil
								KbBtn.Text = "[NONE]"
							else
								CK = inp.KeyCode
								KbBtn.Text = "[" .. GetKeyName(inp.KeyCode) .. "]"
							end
							KbBtn.TextColor3 = C.DIM
							if sk then sk.Color = C.BORDER end
							ResizeKb()
							return
						end
						if not gp and CK and inp.KeyCode == CK then pcall(cb, CK) end
					end)

					f.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
					f.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)

					local ctrl = {}
					function ctrl:Set(k) CK = k KbBtn.Text = k and "[" .. GetKeyName(k) .. "]" or "[NONE]" ResizeKb() end
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

					local NL = Instance.new("TextLabel")
					NL.Parent = Hdr
					NL.BackgroundTransparency = 1
					NL.Position = UDim2.new(0, 10, 0, 0)
					NL.Size = UDim2.new(0.65, 0, 1, 0)
					NL.Font = Enum.Font.GothamSemibold
					NL.Text = name or "Color"
					NL.TextColor3 = C.TEXT
					NL.TextSize = 11
					NL.TextXAlignment = Enum.TextXAlignment.Left

					local function ToHex(c)
						return string.format("#%02X%02X%02X", math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255))
					end

					local HexL = Instance.new("TextLabel")
					HexL.Parent = Hdr
					HexL.BackgroundTransparency = 1
					HexL.Position = UDim2.new(0.65, 0, 0, 0)
					HexL.Size = UDim2.new(0.35, -36, 1, 0)
					HexL.Font = Enum.Font.Gotham
					HexL.Text = ToHex(CurColor)
					HexL.TextColor3 = C.DIM
					HexL.TextSize = 9
					HexL.TextXAlignment = Enum.TextXAlignment.Right

					local Prev = Instance.new("Frame")
					Prev.Parent = Hdr
					Prev.BackgroundColor3 = CurColor
					Prev.BorderSizePixel = 0
					Prev.Position = UDim2.new(1, -30, 0.5, -7)
					Prev.Size = UDim2.new(0, 14, 0, 14)
					Corner(Prev, 3)
					Stroke(Prev)

					local Panel = Instance.new("Frame")
					Panel.Parent = Wrapper
					Panel.BackgroundColor3 = C.SECT
					Panel.BorderSizePixel = 0
					Panel.Position = UDim2.new(0, 0, 0, 30)
					Panel.Size = UDim2.new(1, 0, 0, 0)
					Panel.ClipsDescendants = true
					Panel.Visible = false
					Corner(Panel, 5)
					Stroke(Panel)

					local function Refresh()
						CurColor = Color3.fromHSV(H, S, V)
						Prev.BackgroundColor3 = CurColor
						HexL.Text = ToHex(CurColor)
						pcall(cb, CurColor)
					end

					local chs = {
						{l = "H", g = function() return H end, s = function(v) H = v end, m = 360},
						{l = "S", g = function() return S end, s = function(v) S = v end, m = 100},
						{l = "V", g = function() return V end, s = function(v) V = v end, m = 100},
					}
					local panelH = #chs * 28 + 10

					for i, ch in ipairs(chs) do
						local Row = Instance.new("Frame")
						Row.Parent = Panel
						Row.BackgroundTransparency = 1
						Row.Position = UDim2.new(0, 8, 0, 6 + (i - 1) * 28)
						Row.Size = UDim2.new(1, -16, 0, 22)

						local RL = Instance.new("TextLabel")
						RL.Parent = Row
						RL.BackgroundTransparency = 1
						RL.Size = UDim2.new(0, 14, 1, 0)
						RL.Font = Enum.Font.GothamBold
						RL.Text = ch.l
						RL.TextColor3 = C.ACCENT
						RL.TextSize = 10

						local RT = Instance.new("TextButton")
						RT.Parent = Row
						RT.BackgroundColor3 = C.OFF
						RT.BorderSizePixel = 0
						RT.Position = UDim2.new(0, 20, 0.5, -3)
						RT.Size = UDim2.new(1, -60, 0, 6)
						RT.AutoButtonColor = false
						RT.Text = ""
						Corner(RT, 3)

						local RF = Instance.new("Frame")
						RF.Parent = RT
						RF.BackgroundColor3 = C.ACCENT
						RF.BorderSizePixel = 0
						RF.Size = UDim2.new(ch.g(), 0, 1, 0)
						Corner(RF, 3)

						local RV = Instance.new("TextLabel")
						RV.Parent = Row
						RV.BackgroundTransparency = 1
						RV.Position = UDim2.new(1, -36, 0, 0)
						RV.Size = UDim2.new(0, 34, 1, 0)
						RV.Font = Enum.Font.Gotham
						RV.Text = tostring(math.floor(ch.g() * ch.m))
						RV.TextColor3 = C.DIM
						RV.TextSize = 9

						local dr = false
						RT.MouseButton1Down:Connect(function() dr = true end)
						UserInputService.InputChanged:Connect(function(inp)
							if dr and inp.UserInputType == Enum.UserInputType.MouseMovement then
								local p = math.clamp((inp.Position.X - RT.AbsolutePosition.X) / RT.AbsoluteSize.X, 0, 1)
								RF.Size = UDim2.new(p, 0, 1, 0)
								RV.Text = tostring(math.floor(p * ch.m))
								ch.s(p)
								Refresh()
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
							task.delay(0.14, function()
								Panel.Visible = false
								Wrapper.Size = UDim2.new(1, 0, 0, 28)
							end)
						end
					end)

					local ctrl = {}
					function ctrl:Set(c) CurColor = c H, S, V = Color3.toHSV(c) Prev.BackgroundColor3 = c HexL.Text = ToHex(c) end
					function ctrl:Get() return CurColor end
					return ctrl
				end

				return SecObj
			end

			PageObj.addSection = addSection_impl
			return PageObj
		end

		local Tab2 = Instance.new("TextButton")
		Tab2.Parent = TabScroll
		Tab2.BackgroundColor3 = C.ELEM
		Tab2.BackgroundTransparency = 1
		Tab2.BorderSizePixel = 0
		Tab2.Size = UDim2.new(1, 0, 0, 28)
		Tab2.AutoButtonColor = false
		Tab2.Font = Enum.Font.GothamSemibold
		Tab2.Text = pagename
		Tab2.TextColor3 = C.DIM
		Tab2.TextSize = 11
		Corner(Tab2, 5)

		local Underline2 = Instance.new("Frame")
		Underline2.Parent = Tab2
		Underline2.BackgroundColor3 = C.ACCENT
		Underline2.BorderSizePixel = 0
		Underline2.AnchorPoint = Vector2.new(0.5, 1)
		Underline2.Position = UDim2.new(0.5, 0, 1, -1)
		Underline2.Size = UDim2.new(0, 0, 0, 1)
		Underline2.Visible = false
		Corner(Underline2, 1)

		local PageFrame2 = Instance.new("Frame")
		PageFrame2.Parent = ContentArea
		PageFrame2.BackgroundTransparency = 1
		PageFrame2.BorderSizePixel = 0
		PageFrame2.Size = UDim2.new(1, 0, 1, 0)
		PageFrame2.Visible = false

		local PageScroll2 = Instance.new("ScrollingFrame")
		PageScroll2.Parent = PageFrame2
		PageScroll2.BackgroundTransparency = 1
		PageScroll2.BorderSizePixel = 0
		PageScroll2.Size = UDim2.new(1, 0, 1, 0)
		PageScroll2.ScrollBarThickness = 2
		PageScroll2.ScrollBarImageColor3 = C.ACCENT
		PageScroll2.CanvasSize = UDim2.new(0, 0, 0, 0)
		PageScroll2.AutomaticCanvasSize = Enum.AutomaticSize.Y

		local PL2 = Instance.new("UIListLayout")
		PL2.Parent = PageScroll2
		PL2.SortOrder = Enum.SortOrder.LayoutOrder
		PL2.Padding = UDim.new(0, 5)

		local PP2 = Instance.new("UIPadding")
		PP2.Parent = PageScroll2
		PP2.PaddingTop = UDim.new(0, 2)
		PP2.PaddingBottom = UDim.new(0, 6)
		PP2.PaddingRight = UDim.new(0, 2)

		table.insert(Pages, {Tab = Tab2, Page = PageFrame2, Underline = Underline2, SetIconColor = nil})

		local function SelectTab2()
			for _, p in pairs(Pages) do
				p.Page.Visible = false
				Tw(p.Tab, {BackgroundTransparency = 1}, TI.Fast)
				if p.SetIconColor then
					p.SetIconColor(C.DIM)
				else
					p.Tab.TextColor3 = C.DIM
				end
				p.Underline.Visible = false
			end
			PageFrame2.Visible = true
			PageFrame2.Position = UDim2.new(0.05, 0, 0, 0)
			Tw(PageFrame2, {Position = UDim2.new(0, 0, 0, 0)}, TI.Med)
			Tw(Tab2, {TextColor3 = C.TEXT, BackgroundTransparency = 0}, TI.Fast)
			Underline2.Visible = true
			Underline2.Size = UDim2.new(0, 0, 0, 1)
			Tw(Underline2, {Size = UDim2.new(0.8, 0, 0, 1)}, TI.Slow)
			PageScroll2.CanvasPosition = Vector2.new(0, 0)
			ActiveTab = Tab2
		end

		Tab2.MouseButton1Click:Connect(SelectTab2)
		Tab2.MouseEnter:Connect(function()
			if ActiveTab ~= Tab2 then
				Tw(Tab2, {BackgroundTransparency = 0, BackgroundColor3 = C.HOVER}, TI.Fast)
			end
		end)
		Tab2.MouseLeave:Connect(function()
			if ActiveTab ~= Tab2 then
				Tw(Tab2, {BackgroundTransparency = 1}, TI.Fast)
			end
		end)

		if #Pages == 1 then SelectTab2() end

		local PageObj2 = {}

		function PageObj2:addSection(sectionname)
			local Outer = Instance.new("Frame")
			Outer.Parent = PageScroll2
			Outer.BackgroundColor3 = C.SECT
			Outer.BorderSizePixel = 0
			Outer.Size = UDim2.new(1, 0, 0, 0)
			Outer.AutomaticSize = Enum.AutomaticSize.Y
			Corner(Outer, 6)
			Stroke(Outer)

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

			local SecObj = {}

			local function Base(h, col)
				local f = Instance.new("Frame")
				f.Parent = SecContent
				f.BackgroundColor3 = col or C.ELEM
				f.BorderSizePixel = 0
				f.Size = UDim2.new(1, 0, 0, h)
				Corner(f, 5)
				return f
			end

			function SecObj:addButton(name, callback)
				local cb = callback or function() end
				local f = Base(28)
				local btn = Instance.new("TextButton")
				btn.Parent = f
				btn.BackgroundTransparency = 1
				btn.Size = UDim2.new(1, 0, 1, 0)
				btn.AutoButtonColor = false
				btn.Font = Enum.Font.GothamSemibold
				btn.Text = name or "Button"
				btn.TextColor3 = C.TEXT
				btn.TextSize = 11
				btn.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
				btn.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
				btn.MouseButton1Down:Connect(function()
					Tw(f, {BackgroundColor3 = C.ACCENT})
					task.delay(0.14, function() Tw(f, {BackgroundColor3 = C.ELEM}) pcall(cb) end)
				end)
			end

			function SecObj:addSeparator()
				local f = Instance.new("Frame")
				f.Parent = SecContent
				f.BackgroundColor3 = C.SEP
				f.BorderSizePixel = 0
				f.Size = UDim2.new(1, 0, 0, 1)
			end

			function SecObj:addToggle(togglename, default, callback, defaultKey)
				local cb = callback or function() end
				local On = default or false
				local ChosenKey = defaultKey or nil
				local Listening = false
				local f = Base(28)

				local ChkEdge = Instance.new("Frame")
				ChkEdge.Parent = f
				ChkEdge.BackgroundColor3 = C.OFF
				ChkEdge.BorderSizePixel = 0
				ChkEdge.Position = UDim2.new(0, 6, 0.5, -8)
				ChkEdge.Size = UDim2.new(0, 16, 0, 16)
				Corner(ChkEdge, 3)
				Stroke(ChkEdge, On and C.CHECK or C.BORDER)

				local ChkInner = Instance.new("Frame")
				ChkInner.Parent = ChkEdge
				ChkInner.AnchorPoint = Vector2.new(0.5, 0.5)
				ChkInner.BackgroundColor3 = C.CHECK
				ChkInner.BackgroundTransparency = On and 0 or 1
				ChkInner.BorderSizePixel = 0
				ChkInner.Position = UDim2.new(0.5, 0, 0.5, 0)
				ChkInner.Size = On and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)
				Corner(ChkInner, 2)

				local ChkMark = Instance.new("TextLabel")
				ChkMark.Parent = ChkEdge
				ChkMark.BackgroundTransparency = 1
				ChkMark.Size = UDim2.new(1, 0, 1, 0)
				ChkMark.Font = Enum.Font.GothamBold
				ChkMark.Text = "v"
				ChkMark.TextColor3 = Color3.fromRGB(255, 255, 255)
				ChkMark.TextSize = 10
				ChkMark.TextTransparency = On and 0 or 1

				local Lbl = Instance.new("TextLabel")
				Lbl.Parent = f
				Lbl.BackgroundTransparency = 1
				Lbl.Position = UDim2.new(0, 28, 0, 0)
				Lbl.Size = UDim2.new(1, -110, 1, 0)
				Lbl.Font = Enum.Font.GothamSemibold
				Lbl.Text = togglename or "Toggle"
				Lbl.TextColor3 = C.TEXT
				Lbl.TextSize = 11
				Lbl.TextXAlignment = Enum.TextXAlignment.Left

				local KbBtn = Instance.new("TextButton")
				KbBtn.Parent = f
				KbBtn.BackgroundColor3 = C.KEYBG
				KbBtn.BorderSizePixel = 0
				KbBtn.AnchorPoint = Vector2.new(1, 0.5)
				KbBtn.Position = UDim2.new(1, -6, 0.5, 0)
				KbBtn.Size = UDim2.new(0, 54, 0, 18)
				KbBtn.AutoButtonColor = false
				KbBtn.Font = Enum.Font.GothamSemibold
				KbBtn.Text = ChosenKey and "[" .. GetKeyName(ChosenKey) .. "]" or "[ -- ]"
				KbBtn.TextColor3 = C.DIM
				KbBtn.TextSize = 9
				Corner(KbBtn, 4)
				Stroke(KbBtn, C.BORDER)

				local function ResizeKb()
					local sz = TextService:GetTextSize(KbBtn.Text, KbBtn.TextSize, KbBtn.Font, Vector2.new(math.huge, math.huge))
					Tw(KbBtn, {Size = UDim2.new(0, math.max(54, sz.X + 14), 0, 18)}, TI.Key)
				end
				KbBtn:GetPropertyChangedSignal("Text"):Connect(ResizeKb)
				ResizeKb()

				local function UpdateVisuals()
					local sk = ChkEdge:FindFirstChildOfClass("UIStroke")
					Tw(ChkInner, {BackgroundTransparency = On and 0 or 1, Size = On and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)}, TI.Fast)
					Tw(ChkMark, {TextTransparency = On and 0 or 1}, TI.Fast)
					if sk then sk.Color = On and C.CHECK or C.BORDER end
					Tw(Lbl, {TextColor3 = On and C.TEXT or C.DIM}, TI.Fast)
				end

				local HitBtn = Instance.new("TextButton")
				HitBtn.Parent = f
				HitBtn.BackgroundTransparency = 1
				HitBtn.Position = UDim2.new(0, 0, 0, 0)
				HitBtn.Size = UDim2.new(1, -66, 1, 0)
				HitBtn.AutoButtonColor = false
				HitBtn.Text = ""
				HitBtn.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
				HitBtn.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
				HitBtn.MouseButton1Click:Connect(function()
					if Listening then return end
					On = not On
					UpdateVisuals()
					pcall(cb, On)
				end)

				KbBtn.MouseButton1Click:Connect(function()
					if Listening then return end
					Listening = true
					KbBtn.Text = "[ ... ]"
					KbBtn.TextColor3 = C.ACCENT
					local sk = KbBtn:FindFirstChildOfClass("UIStroke")
					if sk then sk.Color = C.ACCENT end
					ResizeKb()
				end)

				UserInputService.InputBegan:Connect(function(inp, gp)
					if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
					if Listening then
						Listening = false
						local sk = KbBtn:FindFirstChildOfClass("UIStroke")
						if inp.KeyCode == Enum.KeyCode.Escape then
							ChosenKey = nil
							KbBtn.Text = "[ -- ]"
						else
							ChosenKey = inp.KeyCode
							KbBtn.Text = "[" .. GetKeyName(inp.KeyCode) .. "]"
						end
						KbBtn.TextColor3 = C.DIM
						if sk then sk.Color = C.BORDER end
						ResizeKb()
						return
					end
					if not gp and ChosenKey and inp.KeyCode == ChosenKey then
						On = not On
						UpdateVisuals()
						pcall(cb, On)
					end
				end)

				UpdateVisuals()

				local ctrl = {}
				function ctrl:Set(v) On = v UpdateVisuals() pcall(cb, On) end
				function ctrl:Get() return On end
				function ctrl:SetKey(kc) ChosenKey = kc KbBtn.Text = kc and "[" .. GetKeyName(kc) .. "]" or "[ -- ]" ResizeKb() end
				function ctrl:GetKey() return ChosenKey end
				return ctrl
			end

			function SecObj:addSlider(name, mn, mx, def, callback)
				local cb = callback or function() end
				mn = tonumber(mn) or 0
				mx = tonumber(mx) or 100
				local cur = math.clamp(tonumber(def) or mn, mn, mx)
				local f = Base(42)

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

				local Track = Instance.new("TextButton")
				Track.Parent = f
				Track.BackgroundColor3 = C.OFF
				Track.BorderSizePixel = 0
				Track.Position = UDim2.new(0, 10, 0, 28)
				Track.Size = UDim2.new(1, -20, 0, 7)
				Track.AutoButtonColor = false
				Track.Text = ""
				Corner(Track, 3)

				local Fill = Instance.new("Frame")
				Fill.Parent = Track
				Fill.BackgroundColor3 = C.ACCENT
				Fill.BorderSizePixel = 0
				Fill.Size = UDim2.new((cur - mn) / (mx - mn), 0, 1, 0)
				Corner(Fill, 3)

				local Drag = false
				local function Upd(px)
					local p = math.clamp((px - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1)
					cur = math.floor(mn + (mx - mn) * p)
					Fill.Size = UDim2.new(p, 0, 1, 0)
					VL.Text = tostring(cur)
					pcall(cb, cur)
				end
				Track.MouseButton1Down:Connect(function() Drag = true end)
				UserInputService.InputChanged:Connect(function(i)
					if Drag and i.UserInputType == Enum.UserInputType.MouseMovement then Upd(i.Position.X) end
				end)
				UserInputService.InputEnded:Connect(function(i)
					if i.UserInputType == Enum.UserInputType.MouseButton1 then Drag = false end
				end)
				f.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
				f.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)

				local ctrl = {}
				function ctrl:Set(v) cur = math.clamp(v, mn, mx) Fill.Size = UDim2.new((cur - mn) / (mx - mn), 0, 1, 0) VL.Text = tostring(cur) end
				function ctrl:Get() return cur end
				return ctrl
			end

			function SecObj:addTextBox(name, placeholder, callback)
				local cb = callback or function() end
				local f = Base(28)

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
				Stroke(Input)

				Input.Focused:Connect(function()
					Tw(Input, {BackgroundColor3 = C.ACTIVE})
					local s = Input:FindFirstChildOfClass("UIStroke")
					if s then s.Color = C.ACCENT end
				end)
				Input.FocusLost:Connect(function()
					Tw(Input, {BackgroundColor3 = C.OFF})
					local s = Input:FindFirstChildOfClass("UIStroke")
					if s then s.Color = C.BORDER end
					pcall(cb, Input.Text)
				end)
			end

			function SecObj:addDropdown(name, list, callback)
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

				local DN = Instance.new("TextLabel")
				DN.Parent = Hdr
				DN.BackgroundTransparency = 1
				DN.Position = UDim2.new(0, 10, 0, 0)
				DN.Size = UDim2.new(0.58, 0, 1, 0)
				DN.Font = Enum.Font.GothamSemibold
				DN.Text = name or "Dropdown"
				DN.TextColor3 = C.TEXT
				DN.TextSize = 11
				DN.TextXAlignment = Enum.TextXAlignment.Left
				DN.ZIndex = 6

				local DS = Instance.new("TextLabel")
				DS.Parent = Hdr
				DS.BackgroundTransparency = 1
				DS.Position = UDim2.new(0.58, 0, 0, 0)
				DS.Size = UDim2.new(0.42, -26, 1, 0)
				DS.Font = Enum.Font.Gotham
				DS.Text = "none"
				DS.TextColor3 = C.DIM
				DS.TextSize = 10
				DS.TextXAlignment = Enum.TextXAlignment.Right
				DS.ZIndex = 6

				local DA = Instance.new("TextLabel")
				DA.Parent = Hdr
				DA.BackgroundTransparency = 1
				DA.Position = UDim2.new(1, -22, 0, 0)
				DA.Size = UDim2.new(0, 20, 1, 0)
				DA.Font = Enum.Font.GothamBold
				DA.Text = "v"
				DA.TextColor3 = C.ACCENT
				DA.TextSize = 10
				DA.ZIndex = 6

				local DL = Instance.new("Frame")
				DL.Parent = Wrapper
				DL.BackgroundColor3 = C.SECT
				DL.BorderSizePixel = 0
				DL.Position = UDim2.new(0, 0, 0, 30)
				DL.Size = UDim2.new(1, 0, 0, 0)
				DL.ZIndex = 10
				DL.ClipsDescendants = true
				DL.Visible = false
				Corner(DL, 5)
				Stroke(DL)

				local DS2 = Instance.new("ScrollingFrame")
				DS2.Parent = DL
				DS2.BackgroundTransparency = 1
				DS2.BorderSizePixel = 0
				DS2.Size = UDim2.new(1, 0, 1, 0)
				DS2.ScrollBarThickness = 2
				DS2.ScrollBarImageColor3 = C.ACCENT
				DS2.ZIndex = 10
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
					DA.Text = "v"
					Tw(DL, {Size = UDim2.new(1, 0, 0, 0)})
					task.delay(0.14, function()
						DL.Visible = false
						Wrapper.Size = UDim2.new(1, 0, 0, 28)
					end)
				end
				local function OpenDD()
					Open = true
					DA.Text = "^"
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

				for _, item in ipairs(list) do
					local Opt = Instance.new("TextButton")
					Opt.Parent = DS2
					Opt.BackgroundColor3 = C.ELEM
					Opt.BorderSizePixel = 0
					Opt.Size = UDim2.new(1, 0, 0, 22)
					Opt.AutoButtonColor = false
					Opt.Font = Enum.Font.GothamSemibold
					Opt.Text = item
					Opt.TextColor3 = C.TEXT
					Opt.TextSize = 10
					Opt.ZIndex = 11
					Corner(Opt, 4)
					Opt.MouseEnter:Connect(function() Tw(Opt, {BackgroundColor3 = C.HOVER}) end)
					Opt.MouseLeave:Connect(function()
						if Selected ~= item then Tw(Opt, {BackgroundColor3 = C.ELEM}) end
					end)
					Opt.MouseButton1Click:Connect(function()
						Selected = item
						DS.Text = item
						DS.TextColor3 = C.ACCENT
						CloseDD()
						pcall(cb, item)
					end)
				end

				local ctrl = {}
				function ctrl:Set(v) Selected = v DS.Text = v DS.TextColor3 = C.ACCENT end
				function ctrl:Get() return Selected end
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
				Stroke(KbBtn)

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
					local sk = KbBtn:FindFirstChildOfClass("UIStroke")
					if sk then sk.Color = C.ACCENT end
					ResizeKb()
				end)

				UserInputService.InputBegan:Connect(function(inp, gp)
					if inp.UserInputType ~= Enum.UserInputType.Keyboard then return end
					if Listening then
						Listening = false
						local sk = KbBtn:FindFirstChildOfClass("UIStroke")
						if inp.KeyCode == Enum.KeyCode.Escape then
							CK = nil
							KbBtn.Text = "[NONE]"
						else
							CK = inp.KeyCode
							KbBtn.Text = "[" .. GetKeyName(inp.KeyCode) .. "]"
						end
						KbBtn.TextColor3 = C.DIM
						if sk then sk.Color = C.BORDER end
						ResizeKb()
						return
					end
					if not gp and CK and inp.KeyCode == CK then pcall(cb, CK) end
				end)

				f.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
				f.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)

				local ctrl = {}
				function ctrl:Set(k) CK = k KbBtn.Text = k and "[" .. GetKeyName(k) .. "]" or "[NONE]" ResizeKb() end
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

				local NL = Instance.new("TextLabel")
				NL.Parent = Hdr
				NL.BackgroundTransparency = 1
				NL.Position = UDim2.new(0, 10, 0, 0)
				NL.Size = UDim2.new(0.65, 0, 1, 0)
				NL.Font = Enum.Font.GothamSemibold
				NL.Text = name or "Color"
				NL.TextColor3 = C.TEXT
				NL.TextSize = 11
				NL.TextXAlignment = Enum.TextXAlignment.Left

				local function ToHex(c)
					return string.format("#%02X%02X%02X", math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255))
				end

				local HexL = Instance.new("TextLabel")
				HexL.Parent = Hdr
				HexL.BackgroundTransparency = 1
				HexL.Position = UDim2.new(0.65, 0, 0, 0)
				HexL.Size = UDim2.new(0.35, -36, 1, 0)
				HexL.Font = Enum.Font.Gotham
				HexL.Text = ToHex(CurColor)
				HexL.TextColor3 = C.DIM
				HexL.TextSize = 9
				HexL.TextXAlignment = Enum.TextXAlignment.Right

				local Prev = Instance.new("Frame")
				Prev.Parent = Hdr
				Prev.BackgroundColor3 = CurColor
				Prev.BorderSizePixel = 0
				Prev.Position = UDim2.new(1, -30, 0.5, -7)
				Prev.Size = UDim2.new(0, 14, 0, 14)
				Corner(Prev, 3)
				Stroke(Prev)

				local Panel = Instance.new("Frame")
				Panel.Parent = Wrapper
				Panel.BackgroundColor3 = C.SECT
				Panel.BorderSizePixel = 0
				Panel.Position = UDim2.new(0, 0, 0, 30)
				Panel.Size = UDim2.new(1, 0, 0, 0)
				Panel.ClipsDescendants = true
				Panel.Visible = false
				Corner(Panel, 5)
				Stroke(Panel)

				local function Refresh()
					CurColor = Color3.fromHSV(H, S, V)
					Prev.BackgroundColor3 = CurColor
					HexL.Text = ToHex(CurColor)
					pcall(cb, CurColor)
				end

				local chs = {
					{l = "H", g = function() return H end, s = function(v) H = v end, m = 360},
					{l = "S", g = function() return S end, s = function(v) S = v end, m = 100},
					{l = "V", g = function() return V end, s = function(v) V = v end, m = 100},
				}
				local panelH = #chs * 28 + 10

				for i, ch in ipairs(chs) do
					local Row = Instance.new("Frame")
					Row.Parent = Panel
					Row.BackgroundTransparency = 1
					Row.Position = UDim2.new(0, 8, 0, 6 + (i - 1) * 28)
					Row.Size = UDim2.new(1, -16, 0, 22)

					local RL = Instance.new("TextLabel")
					RL.Parent = Row
					RL.BackgroundTransparency = 1
					RL.Size = UDim2.new(0, 14, 1, 0)
					RL.Font = Enum.Font.GothamBold
					RL.Text = ch.l
					RL.TextColor3 = C.ACCENT
					RL.TextSize = 10

					local RT = Instance.new("TextButton")
					RT.Parent = Row
					RT.BackgroundColor3 = C.OFF
					RT.BorderSizePixel = 0
					RT.Position = UDim2.new(0, 20, 0.5, -3)
					RT.Size = UDim2.new(1, -60, 0, 6)
					RT.AutoButtonColor = false
					RT.Text = ""
					Corner(RT, 3)

					local RF = Instance.new("Frame")
					RF.Parent = RT
					RF.BackgroundColor3 = C.ACCENT
					RF.BorderSizePixel = 0
					RF.Size = UDim2.new(ch.g(), 0, 1, 0)
					Corner(RF, 3)

					local RV = Instance.new("TextLabel")
					RV.Parent = Row
					RV.BackgroundTransparency = 1
					RV.Position = UDim2.new(1, -36, 0, 0)
					RV.Size = UDim2.new(0, 34, 1, 0)
					RV.Font = Enum.Font.Gotham
					RV.Text = tostring(math.floor(ch.g() * ch.m))
					RV.TextColor3 = C.DIM
					RV.TextSize = 9

					local dr = false
					RT.MouseButton1Down:Connect(function() dr = true end)
					UserInputService.InputChanged:Connect(function(inp)
						if dr and inp.UserInputType == Enum.UserInputType.MouseMovement then
							local p = math.clamp((inp.Position.X - RT.AbsolutePosition.X) / RT.AbsoluteSize.X, 0, 1)
							RF.Size = UDim2.new(p, 0, 1, 0)
							RV.Text = tostring(math.floor(p * ch.m))
							ch.s(p)
							Refresh()
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
						task.delay(0.14, function()
							Panel.Visible = false
							Wrapper.Size = UDim2.new(1, 0, 0, 28)
						end)
					end
				end)

				local ctrl = {}
				function ctrl:Set(c) CurColor = c H, S, V = Color3.toHSV(c) Prev.BackgroundColor3 = c HexL.Text = ToHex(c) end
				function ctrl:Get() return CurColor end
				return ctrl
			end

			return SecObj
		end

		return PageObj2
	end

	return Window
end

return Library

--[[
USAGE EXAMPLE:

local Library = loadstring(...)()
local win = Library:CreateWindow("MyScript", "v2.0")

-- Tab without icon
local page1 = win:addPage("Combat")

-- Tab with Lucide icon (pass icon name as second argument)
local page2 = win:addPage("Aimbot", "crosshair")
local page3 = win:addPage("Visuals", "eye")
local page4 = win:addPage("Settings", "settings")
local page5 = win:addPage("Player", "user")

-- Available icon names: any key from Library.Icons table
-- e.g. "home", "star", "shield", "flame", "sword", "rocket", etc.

local sec = page2:addSection("Aim Settings")
sec:addToggle("Enable Aimbot", false, function(v) end, Enum.KeyCode.Z)
sec:addSlider("FOV", 1, 500, 120, function(v) end)
sec:addDropdown("Team Check", {"Enemies", "All", "None"}, function(v) end)
]]

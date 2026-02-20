local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TextService      = game:GetService("TextService")

local _readfile   = (typeof(readfile)   == "function" and readfile)   or (syn and syn.readfile)   or nil
local _writefile  = (typeof(writefile)  == "function" and writefile)  or (syn and syn.writefile)  or nil
local _listfiles  = (typeof(listfiles)  == "function" and listfiles)  or (syn and syn.listfiles)  or nil
local _makefolder = (typeof(makefolder) == "function" and makefolder) or (syn and syn.makefolder) or nil
local _isfolder   = (typeof(isfolder)   == "function" and isfolder)   or (syn and syn.isfolder)   or nil
local _delfile    = (typeof(delfile)    == "function" and delfile)    or (syn and syn.deletefile)  or nil
local function SafeRead(path)   if _readfile   then return _readfile(path)   end return nil end
local function SafeWrite(p, d)  if _writefile  then return _writefile(p, d)  end end
local function SafeList(path)   if _listfiles  then return _listfiles(path)  end return {} end
local function SafeFolder(path) if _makefolder then return _makefolder(path) end end
local function SafeIsDir(path)  if _isfolder   then return _isfolder(path)   end return false end
local function SafeDel(path)    if _delfile     then return _delfile(path)    end end

local Library = {}
Library.__index = Library
Library.Options = {}
Library._optCount = 0

local function RegOption(ctrl, typeName)
	Library._optCount = Library._optCount + 1
	local idx = "_opt_" .. Library._optCount
	ctrl.Type = typeName
	ctrl._idx = idx
	Library.Options[idx] = ctrl
	return idx
end

local Icons = {
	["lucide-accessibility"] = "rbxassetid://10709751939",
	["lucide-activity"] = "rbxassetid://10709752035",
	["lucide-air-vent"] = "rbxassetid://10709752131",
	["lucide-airplay"] = "rbxassetid://10709752254",
	["lucide-alarm-check"] = "rbxassetid://10709752405",
	["lucide-alarm-clock"] = "rbxassetid://10709752630",
	["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
	["lucide-alarm-minus"] = "rbxassetid://10709752732",
	["lucide-alarm-plus"] = "rbxassetid://10709752825",
	["lucide-album"] = "rbxassetid://10709752906",
	["lucide-alert-circle"] = "rbxassetid://10709752996",
	["lucide-alert-octagon"] = "rbxassetid://10709753064",
	["lucide-alert-triangle"] = "rbxassetid://10709753149",
	["lucide-align-center"] = "rbxassetid://10709753570",
	["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
	["lucide-align-center-vertical"] = "rbxassetid://10709753421",
	["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
	["lucide-align-end-vertical"] = "rbxassetid://10709753808",
	["lucide-anchor"] = "rbxassetid://10709761530",
	["lucide-angry"] = "rbxassetid://10709761629",
	["lucide-annoyed"] = "rbxassetid://10709761722",
	["lucide-aperture"] = "rbxassetid://10709761813",
	["lucide-apple"] = "rbxassetid://10709761889",
	["lucide-archive"] = "rbxassetid://10709762233",
	["lucide-archive-restore"] = "rbxassetid://10709762058",
	["lucide-armchair"] = "rbxassetid://10709762327",
	["lucide-arrow-down"] = "rbxassetid://10709767827",
	["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
	["lucide-arrow-left"] = "rbxassetid://10709768114",
	["lucide-arrow-right"] = "rbxassetid://10709768347",
	["lucide-arrow-up"] = "rbxassetid://10709768939",
	["lucide-award"] = "rbxassetid://10709769406",
	["lucide-axe"] = "rbxassetid://10709769508",
	["lucide-baby"] = "rbxassetid://10709769732",
	["lucide-backpack"] = "rbxassetid://10709769841",
	["lucide-banana"] = "rbxassetid://10709770005",
	["lucide-banknote"] = "rbxassetid://10709770178",
	["lucide-bar-chart"] = "rbxassetid://10709773755",
	["lucide-bar-chart-2"] = "rbxassetid://10709770317",
	["lucide-battery"] = "rbxassetid://10709774640",
	["lucide-battery-charging"] = "rbxassetid://10709774068",
	["lucide-bell"] = "rbxassetid://10709775704",
	["lucide-bell-off"] = "rbxassetid://10709775320",
	["lucide-bell-ring"] = "rbxassetid://10709775560",
	["lucide-bike"] = "rbxassetid://10709775894",
	["lucide-bitcoin"] = "rbxassetid://10709776126",
	["lucide-bluetooth"] = "rbxassetid://10709776655",
	["lucide-bold"] = "rbxassetid://10747813908",
	["lucide-bomb"] = "rbxassetid://10709781460",
	["lucide-bone"] = "rbxassetid://10709781605",
	["lucide-book"] = "rbxassetid://10709781824",
	["lucide-book-open"] = "rbxassetid://10709781717",
	["lucide-bookmark"] = "rbxassetid://10709782154",
	["lucide-bot"] = "rbxassetid://10709782230",
	["lucide-box"] = "rbxassetid://10709782497",
	["lucide-briefcase"] = "rbxassetid://10709782662",
	["lucide-brush"] = "rbxassetid://10709782758",
	["lucide-bug"] = "rbxassetid://10709782845",
	["lucide-building"] = "rbxassetid://10709783051",
	["lucide-bus"] = "rbxassetid://10709783137",
	["lucide-cake"] = "rbxassetid://10709783217",
	["lucide-calculator"] = "rbxassetid://10709783311",
	["lucide-calendar"] = "rbxassetid://10709789505",
	["lucide-camera"] = "rbxassetid://10709789686",
	["lucide-car"] = "rbxassetid://10709789810",
	["lucide-carrot"] = "rbxassetid://10709789960",
	["lucide-check"] = "rbxassetid://10709790644",
	["lucide-check-circle"] = "rbxassetid://10709790387",
	["lucide-check-square"] = "rbxassetid://10709790537",
	["lucide-chef-hat"] = "rbxassetid://10709790757",
	["lucide-chevron-down"] = "rbxassetid://10709790948",
	["lucide-chevron-left"] = "rbxassetid://10709791281",
	["lucide-chevron-right"] = "rbxassetid://10709791437",
	["lucide-chevron-up"] = "rbxassetid://10709791523",
	["lucide-chrome"] = "rbxassetid://10709797725",
	["lucide-circle"] = "rbxassetid://10709798174",
	["lucide-clipboard"] = "rbxassetid://10709799288",
	["lucide-clock"] = "rbxassetid://10709805144",
	["lucide-cloud"] = "rbxassetid://10709806740",
	["lucide-code"] = "rbxassetid://10709810463",
	["lucide-coffee"] = "rbxassetid://10709810814",
	["lucide-cog"] = "rbxassetid://10709810948",
	["lucide-coins"] = "rbxassetid://10709811110",
	["lucide-command"] = "rbxassetid://10709811365",
	["lucide-compass"] = "rbxassetid://10709811445",
	["lucide-contact"] = "rbxassetid://10709811834",
	["lucide-copy"] = "rbxassetid://10709812159",
	["lucide-copyright"] = "rbxassetid://10709812311",
	["lucide-cpu"] = "rbxassetid://10709813383",
	["lucide-crop"] = "rbxassetid://10709818245",
	["lucide-crosshair"] = "rbxassetid://10709818534",
	["lucide-crown"] = "rbxassetid://10709818626",
	["lucide-database"] = "rbxassetid://10709818996",
	["lucide-delete"] = "rbxassetid://10709819059",
	["lucide-diamond"] = "rbxassetid://10709819149",
	["lucide-disc"] = "rbxassetid://10723343537",
	["lucide-divide"] = "rbxassetid://10723343805",
	["lucide-dollar-sign"] = "rbxassetid://10723343958",
	["lucide-download"] = "rbxassetid://10723344270",
	["lucide-download-cloud"] = "rbxassetid://10723344088",
	["lucide-droplet"] = "rbxassetid://10723344432",
	["lucide-edit"] = "rbxassetid://10734883598",
	["lucide-edit-2"] = "rbxassetid://10723344885",
	["lucide-edit-3"] = "rbxassetid://10723345088",
	["lucide-egg"] = "rbxassetid://10723345518",
	["lucide-eraser"] = "rbxassetid://10723346158",
	["lucide-euro"] = "rbxassetid://10723346372",
	["lucide-expand"] = "rbxassetid://10723346553",
	["lucide-external-link"] = "rbxassetid://10723346684",
	["lucide-eye"] = "rbxassetid://10723346959",
	["lucide-eye-off"] = "rbxassetid://10723346871",
	["lucide-factory"] = "rbxassetid://10723347051",
	["lucide-fan"] = "rbxassetid://10723354359",
	["lucide-fast-forward"] = "rbxassetid://10723354521",
	["lucide-feather"] = "rbxassetid://10723354671",
	["lucide-figma"] = "rbxassetid://10723354801",
	["lucide-file"] = "rbxassetid://10723374641",
	["lucide-file-text"] = "rbxassetid://10723367380",
	["lucide-film"] = "rbxassetid://10723374981",
	["lucide-filter"] = "rbxassetid://10723375128",
	["lucide-fingerprint"] = "rbxassetid://10723375250",
	["lucide-flag"] = "rbxassetid://10723375890",
	["lucide-flame"] = "rbxassetid://10723376114",
	["lucide-flashlight"] = "rbxassetid://10723376471",
	["lucide-flask-conical"] = "rbxassetid://10734883986",
	["lucide-folder"] = "rbxassetid://10723387563",
	["lucide-folder-open"] = "rbxassetid://10723386277",
	["lucide-folder-plus"] = "rbxassetid://10723386531",
	["lucide-forward"] = "rbxassetid://10723388016",
	["lucide-frown"] = "rbxassetid://10723394681",
	["lucide-fuel"] = "rbxassetid://10723394846",
	["lucide-gamepad"] = "rbxassetid://10723395457",
	["lucide-gamepad-2"] = "rbxassetid://10723395215",
	["lucide-gauge"] = "rbxassetid://10723395708",
	["lucide-gem"] = "rbxassetid://10723396000",
	["lucide-ghost"] = "rbxassetid://10723396107",
	["lucide-gift"] = "rbxassetid://10723396402",
	["lucide-git-branch"] = "rbxassetid://10723396676",
	["lucide-globe"] = "rbxassetid://10723404337",
	["lucide-graduation-cap"] = "rbxassetid://10723404691",
	["lucide-grid"] = "rbxassetid://10723404936",
	["lucide-hammer"] = "rbxassetid://10723405360",
	["lucide-hand"] = "rbxassetid://10723405649",
	["lucide-hard-drive"] = "rbxassetid://10723405749",
	["lucide-hash"] = "rbxassetid://10723405975",
	["lucide-headphones"] = "rbxassetid://10723406165",
	["lucide-heart"] = "rbxassetid://10723406885",
	["lucide-heart-pulse"] = "rbxassetid://10723406795",
	["lucide-help-circle"] = "rbxassetid://10723406988",
	["lucide-hexagon"] = "rbxassetid://10723407092",
	["lucide-history"] = "rbxassetid://10723407335",
	["lucide-home"] = "rbxassetid://10723407389",
	["lucide-hourglass"] = "rbxassetid://10723407498",
	["lucide-image"] = "rbxassetid://10723415040",
	["lucide-inbox"] = "rbxassetid://10723415335",
	["lucide-info"] = "rbxassetid://10723415903",
	["lucide-key"] = "rbxassetid://10723416652",
	["lucide-keyboard"] = "rbxassetid://10723416765",
	["lucide-lamp"] = "rbxassetid://10723417513",
	["lucide-landmark"] = "rbxassetid://10723417608",
	["lucide-languages"] = "rbxassetid://10723417703",
	["lucide-laptop"] = "rbxassetid://10723423881",
	["lucide-laugh"] = "rbxassetid://10723424372",
	["lucide-layers"] = "rbxassetid://10723424505",
	["lucide-leaf"] = "rbxassetid://10723425539",
	["lucide-library"] = "rbxassetid://10723425615",
	["lucide-life-buoy"] = "rbxassetid://10723425685",
	["lucide-lightbulb"] = "rbxassetid://10723425852",
	["lucide-line-chart"] = "rbxassetid://10723426393",
	["lucide-link"] = "rbxassetid://10723426722",
	["lucide-list"] = "rbxassetid://10723433811",
	["lucide-loader"] = "rbxassetid://10723434070",
	["lucide-lock"] = "rbxassetid://10723434711",
	["lucide-log-in"] = "rbxassetid://10723434830",
	["lucide-log-out"] = "rbxassetid://10723434906",
	["lucide-mail"] = "rbxassetid://10734885430",
	["lucide-mail-open"] = "rbxassetid://10723435342",
	["lucide-map"] = "rbxassetid://10734886202",
	["lucide-map-pin"] = "rbxassetid://10734886004",
	["lucide-maximize"] = "rbxassetid://10734886735",
	["lucide-medal"] = "rbxassetid://10734887072",
	["lucide-megaphone"] = "rbxassetid://10734887454",
	["lucide-meh"] = "rbxassetid://10734887603",
	["lucide-menu"] = "rbxassetid://10734887784",
	["lucide-message-circle"] = "rbxassetid://10734888000",
	["lucide-message-square"] = "rbxassetid://10734888228",
	["lucide-mic"] = "rbxassetid://10734888864",
	["lucide-mic-off"] = "rbxassetid://10734888646",
	["lucide-microscope"] = "rbxassetid://10734889106",
	["lucide-minus"] = "rbxassetid://10734896206",
	["lucide-minus-circle"] = "rbxassetid://10734895856",
	["lucide-monitor"] = "rbxassetid://10734896881",
	["lucide-moon"] = "rbxassetid://10734897102",
	["lucide-more-horizontal"] = "rbxassetid://10734897250",
	["lucide-more-vertical"] = "rbxassetid://10734897387",
	["lucide-mountain"] = "rbxassetid://10734897956",
	["lucide-mouse"] = "rbxassetid://10734898592",
	["lucide-move"] = "rbxassetid://10734900011",
	["lucide-music"] = "rbxassetid://10734905958",
	["lucide-navigation"] = "rbxassetid://10734906744",
	["lucide-network"] = "rbxassetid://10734906975",
	["lucide-newspaper"] = "rbxassetid://10734907168",
	["lucide-octagon"] = "rbxassetid://10734907361",
	["lucide-package"] = "rbxassetid://10734909540",
	["lucide-paint-bucket"] = "rbxassetid://10734909847",
	["lucide-paintbrush"] = "rbxassetid://10734910187",
	["lucide-palette"] = "rbxassetid://10734910430",
	["lucide-paperclip"] = "rbxassetid://10734910927",
	["lucide-pause"] = "rbxassetid://10734919336",
	["lucide-pencil"] = "rbxassetid://10734919691",
	["lucide-percent"] = "rbxassetid://10734919919",
	["lucide-phone"] = "rbxassetid://10734921524",
	["lucide-pie-chart"] = "rbxassetid://10734921727",
	["lucide-pin"] = "rbxassetid://10734922324",
	["lucide-pizza"] = "rbxassetid://10734922774",
	["lucide-plane"] = "rbxassetid://10734922971",
	["lucide-play"] = "rbxassetid://10734923549",
	["lucide-play-circle"] = "rbxassetid://10734923214",
	["lucide-plus"] = "rbxassetid://10734924532",
	["lucide-plus-circle"] = "rbxassetid://10734923868",
	["lucide-plus-square"] = "rbxassetid://10734924219",
	["lucide-podcast"] = "rbxassetid://10734929553",
	["lucide-power"] = "rbxassetid://10734930466",
	["lucide-printer"] = "rbxassetid://10734930632",
	["lucide-puzzle"] = "rbxassetid://10734930886",
	["lucide-quote"] = "rbxassetid://10734931234",
	["lucide-radio"] = "rbxassetid://10734931596",
	["lucide-recycle"] = "rbxassetid://10734932295",
	["lucide-redo"] = "rbxassetid://10734932822",
	["lucide-refresh-ccw"] = "rbxassetid://10734933056",
	["lucide-refresh-cw"] = "rbxassetid://10734933222",
	["lucide-regex"] = "rbxassetid://10734933655",
	["lucide-repeat"] = "rbxassetid://10734933966",
	["lucide-reply"] = "rbxassetid://10734934252",
	["lucide-rewind"] = "rbxassetid://10734934347",
	["lucide-rocket"] = "rbxassetid://10734934585",
	["lucide-rotate-ccw"] = "rbxassetid://10734940376",
	["lucide-rotate-cw"] = "rbxassetid://10734940654",
	["lucide-rss"] = "rbxassetid://10734940825",
	["lucide-ruler"] = "rbxassetid://10734941018",
	["lucide-save"] = "rbxassetid://10734941499",
	["lucide-scan"] = "rbxassetid://10734942565",
	["lucide-scissors"] = "rbxassetid://10734942778",
	["lucide-search"] = "rbxassetid://10734943674",
	["lucide-send"] = "rbxassetid://10734943902",
	["lucide-server"] = "rbxassetid://10734949856",
	["lucide-settings"] = "rbxassetid://10734950309",
	["lucide-settings-2"] = "rbxassetid://10734950020",
	["lucide-share"] = "rbxassetid://10734950813",
	["lucide-shield"] = "rbxassetid://10734951847",
	["lucide-shield-check"] = "rbxassetid://10734951367",
	["lucide-shirt"] = "rbxassetid://10734952036",
	["lucide-shopping-bag"] = "rbxassetid://10734952273",
	["lucide-shopping-cart"] = "rbxassetid://10734952479",
	["lucide-shuffle"] = "rbxassetid://10734953451",
	["lucide-signal"] = "rbxassetid://10734961133",
	["lucide-skull"] = "rbxassetid://10734962068",
	["lucide-slash"] = "rbxassetid://10734962600",
	["lucide-sliders"] = "rbxassetid://10734963400",
	["lucide-smartphone"] = "rbxassetid://10734963940",
	["lucide-smile"] = "rbxassetid://10734964441",
	["lucide-snowflake"] = "rbxassetid://10734964600",
	["lucide-sofa"] = "rbxassetid://10734964852",
	["lucide-sort-asc"] = "rbxassetid://10734965115",
	["lucide-sort-desc"] = "rbxassetid://10734965287",
	["lucide-speaker"] = "rbxassetid://10734965419",
	["lucide-sprout"] = "rbxassetid://10734965572",
	["lucide-square"] = "rbxassetid://10734965702",
	["lucide-star"] = "rbxassetid://10734966248",
	["lucide-star-off"] = "rbxassetid://10734966097",
	["lucide-stethoscope"] = "rbxassetid://10734966384",
	["lucide-sticky-note"] = "rbxassetid://10734972463",
	["lucide-stop-circle"] = "rbxassetid://10734972621",
	["lucide-sun"] = "rbxassetid://10734974297",
	["lucide-sunrise"] = "rbxassetid://10734974522",
	["lucide-sunset"] = "rbxassetid://10734974689",
	["lucide-sword"] = "rbxassetid://10734975486",
	["lucide-swords"] = "rbxassetid://10734975692",
	["lucide-syringe"] = "rbxassetid://10734975932",
	["lucide-table"] = "rbxassetid://10734976230",
	["lucide-tablet"] = "rbxassetid://10734976394",
	["lucide-tag"] = "rbxassetid://10734976528",
	["lucide-target"] = "rbxassetid://10734977012",
	["lucide-terminal"] = "rbxassetid://10734982144",
	["lucide-thumbs-down"] = "rbxassetid://10734983359",
	["lucide-thumbs-up"] = "rbxassetid://10734983629",
	["lucide-ticket"] = "rbxassetid://10734983868",
	["lucide-timer"] = "rbxassetid://10734984606",
	["lucide-timer-off"] = "rbxassetid://10734984138",
	["lucide-toggle-left"] = "rbxassetid://10734984834",
	["lucide-toggle-right"] = "rbxassetid://10734985040",
	["lucide-tornado"] = "rbxassetid://10734985247",
	["lucide-trash"] = "rbxassetid://10747362393",
	["lucide-trash-2"] = "rbxassetid://10747362241",
	["lucide-tree-deciduous"] = "rbxassetid://10747362534",
	["lucide-tree-pine"] = "rbxassetid://10747362748",
	["lucide-trending-down"] = "rbxassetid://10747363205",
	["lucide-trending-up"] = "rbxassetid://10747363465",
	["lucide-triangle"] = "rbxassetid://10747363621",
	["lucide-trophy"] = "rbxassetid://10747363809",
	["lucide-truck"] = "rbxassetid://10747364031",
	["lucide-tv"] = "rbxassetid://10747364593",
	["lucide-type"] = "rbxassetid://10747364761",
	["lucide-umbrella"] = "rbxassetid://10747364971",
	["lucide-underline"] = "rbxassetid://10747365191",
	["lucide-undo"] = "rbxassetid://10747365484",
	["lucide-unlock"] = "rbxassetid://10747366027",
	["lucide-upload"] = "rbxassetid://10747366434",
	["lucide-upload-cloud"] = "rbxassetid://10747366266",
	["lucide-user"] = "rbxassetid://10747373176",
	["lucide-user-check"] = "rbxassetid://10747371901",
	["lucide-user-cog"] = "rbxassetid://10747372167",
	["lucide-user-minus"] = "rbxassetid://10747372346",
	["lucide-user-plus"] = "rbxassetid://10747372702",
	["lucide-users"] = "rbxassetid://10747373426",
	["lucide-utensils"] = "rbxassetid://10747373821",
	["lucide-verified"] = "rbxassetid://10747374131",
	["lucide-video"] = "rbxassetid://10747374938",
	["lucide-video-off"] = "rbxassetid://10747374721",
	["lucide-volume"] = "rbxassetid://10747376008",
	["lucide-volume-2"] = "rbxassetid://10747375679",
	["lucide-volume-x"] = "rbxassetid://10747375880",
	["lucide-wallet"] = "rbxassetid://10747376205",
	["lucide-wand"] = "rbxassetid://10747376565",
	["lucide-wand-2"] = "rbxassetid://10747376349",
	["lucide-watch"] = "rbxassetid://10747376722",
	["lucide-waves"] = "rbxassetid://10747376931",
	["lucide-webcam"] = "rbxassetid://10747381992",
	["lucide-wifi"] = "rbxassetid://10747382504",
	["lucide-wifi-off"] = "rbxassetid://10747382268",
	["lucide-wind"] = "rbxassetid://10747382750",
	["lucide-wrench"] = "rbxassetid://10747383470",
	["lucide-x"] = "rbxassetid://10747384394",
	["lucide-x-circle"] = "rbxassetid://10747383819",
	["lucide-x-square"] = "rbxassetid://10747384217",
	["lucide-zoom-in"] = "rbxassetid://10747384552",
	["lucide-zoom-out"] = "rbxassetid://10747384679",
}
Library.Icons = Icons

local CHECK_TEXTURE = "rbxassetid://10709790644"
local BRAND_IMAGE   = "rbxassetid://112537363055720"

local C = {
	BG      = Color3.fromRGB(12,  12,  14),
	SIDEBAR = Color3.fromRGB(20,  20,  24),
	ELEM    = Color3.fromRGB(32,  32,  38),
	SECT    = Color3.fromRGB(22,  22,  28),
	HOVER   = Color3.fromRGB(44,  44,  52),
	ACTIVE  = Color3.fromRGB(38,  38,  46),
	ACCENT  = Color3.fromRGB(220, 220, 230),
	TEXT    = Color3.fromRGB(240, 240, 248),
	DIM     = Color3.fromRGB(120, 120, 140),
	OFF     = Color3.fromRGB(28,  28,  34),
	CHECK   = Color3.fromRGB(60,  210, 110),
	BORDER  = Color3.fromRGB(38,  38,  46),
	SEP     = Color3.fromRGB(42,  42,  52),
	KEYBG   = Color3.fromRGB(28,  28,  34),
	DDBG    = Color3.fromRGB(26,  26,  32),
	DDBDR   = Color3.fromRGB(40,  40,  50),
	ACCENT2 = Color3.fromRGB(100, 140, 255),
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
		print("[ ECOHUB ] Tween error: " .. tostring(e))
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
		Return = "Enter", LeftShift = "LShift", RightShift = "RShift",
		LeftControl = "LCtrl", RightControl = "RCtrl",
		LeftAlt = "LAlt", RightAlt = "RAlt",
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
	img.Size = sz or UDim2.new(0, 16, 0, 16)
	img.Position = UDim2.new(0, posX or 8, 0.5, posY or 0)
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
	img.Size = UDim2.new(0, 11, 0, 11)
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
		print("[ ECOHUB ] DestroyOld error: " .. tostring(e))
	end
end
DestroyOld()
task.wait(0.05)

local function MakeCheckbox(parent, On)
	local ChkBox = Instance.new("Frame")
	ChkBox.Parent = parent
	ChkBox.BackgroundColor3 = On and C.CHECK or C.OFF
	ChkBox.BorderSizePixel = 0
	ChkBox.Position = UDim2.new(0, 8, 0.5, 0)
	ChkBox.AnchorPoint = Vector2.new(0, 0.5)
	ChkBox.Size = UDim2.new(0, 17, 0, 17)
	Corner(ChkBox, 4)
	local chkStroke = MkStroke(ChkBox, On and C.CHECK or C.BORDER)

	local ChkFill = Instance.new("Frame")
	ChkFill.Parent = ChkBox
	ChkFill.AnchorPoint = Vector2.new(0.5, 0.5)
	ChkFill.BackgroundColor3 = C.CHECK
	ChkFill.BackgroundTransparency = On and 0 or 1
	ChkFill.BorderSizePixel = 0
	ChkFill.Position = UDim2.new(0.5, 0, 0.5, 0)
	ChkFill.Size = On and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 0, 0, 0)
	Corner(ChkFill, 4)

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
	Corner(Outer, 7)
	MkStroke(Outer, C.BORDER, 1)

	local SecTitle = Instance.new("TextLabel")
	SecTitle.Parent = Outer
	SecTitle.BackgroundTransparency = 1
	SecTitle.Position = UDim2.new(0, 12, 0, 0)
	SecTitle.Size = UDim2.new(1, -12, 0, 24)
	SecTitle.Font = Enum.Font.GothamBold
	SecTitle.Text = sectionname:upper()
	SecTitle.TextColor3 = C.DIM
	SecTitle.TextSize = 9
	SecTitle.TextXAlignment = Enum.TextXAlignment.Left
	SecTitle.TextTransparency = 0.2

	local SecSep = Instance.new("Frame")
	SecSep.Parent = Outer
	SecSep.BackgroundColor3 = C.SEP
	SecSep.BorderSizePixel = 0
	SecSep.Position = UDim2.new(0, 8, 0, 23)
	SecSep.Size = UDim2.new(1, -16, 0, 1)

	local SecContent = Instance.new("Frame")
	SecContent.Parent = Outer
	SecContent.BackgroundTransparency = 1
	SecContent.BorderSizePixel = 0
	SecContent.Position = UDim2.new(0, 0, 0, 24)
	SecContent.Size = UDim2.new(1, 0, 0, 0)
	SecContent.AutomaticSize = Enum.AutomaticSize.Y

	local SP = Instance.new("UIPadding")
	SP.Parent = SecContent
	SP.PaddingBottom = UDim.new(0, 7)
	SP.PaddingLeft = UDim.new(0, 6)
	SP.PaddingRight = UDim.new(0, 6)

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
		Corner(f, 6)
		MkStroke(f, C.BORDER, 1)
		return f
	end

	local SecObj = {}

	function SecObj:addButton(name, callback, iconName)
		local cb = callback or function() end
		local f = Base(32)
		local padLeft = 12
		local iconImg = nil
		if iconName then
			iconImg = MkIcon(f, iconName, UDim2.new(0, 14, 0, 14), 10, 0, C.TEXT, 0, 0.5)
			if iconImg then padLeft = 30 end
		end
		local btn = Instance.new("TextButton")
		btn.Parent = f
		btn.BackgroundTransparency = 1
		btn.Size = UDim2.new(1, 0, 1, 0)
		btn.AutoButtonColor = false
		btn.Font = Enum.Font.GothamSemibold
		btn.Text = name or "Button"
		btn.TextColor3 = C.TEXT
		btn.TextSize = 12
		if padLeft > 12 then
			btn.TextXAlignment = Enum.TextXAlignment.Left
			local p = Instance.new("UIPadding")
			p.PaddingLeft = UDim.new(0, padLeft + 2)
			p.Parent = btn
		else
			btn.TextXAlignment = Enum.TextXAlignment.Center
		end
		btn.MouseEnter:Connect(function()
			Tw(f, {BackgroundColor3 = C.HOVER})
			if iconImg then Tw(iconImg, {ImageColor3 = C.ACCENT}) end
		end)
		btn.MouseLeave:Connect(function()
			Tw(f, {BackgroundColor3 = C.ELEM})
			if iconImg then Tw(iconImg, {ImageColor3 = C.TEXT}) end
		end)
		btn.MouseButton1Down:Connect(function()
			Tw(f, {BackgroundColor3 = C.ACTIVE})
			task.delay(0.14, function()
				Tw(f, {BackgroundColor3 = C.ELEM})
				local ok, e = pcall(cb)
				if not ok then
					print("[ ECOHUB ] Button '" .. tostring(name) .. "' error: " .. tostring(e))
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

	function SecObj:addLabel(text)
		local f = Base(28)
		f.BackgroundTransparency = 1
		f:FindFirstChildOfClass("UIStroke"):Destroy()
		local lbl = Instance.new("TextLabel")
		lbl.Parent = f
		lbl.BackgroundTransparency = 1
		lbl.Position = UDim2.new(0, 10, 0, 0)
		lbl.Size = UDim2.new(1, -20, 1, 0)
		lbl.Font = Enum.Font.GothamSemibold
		lbl.Text = text or "Label"
		lbl.TextColor3 = C.TEXT
		lbl.TextSize = 11
		lbl.TextXAlignment = Enum.TextXAlignment.Left
	end

	function SecObj:addParagraph(title, content)
		local f = Base(0)
		f.AutomaticSize = Enum.AutomaticSize.Y
		f.BackgroundColor3 = C.OFF
		local tLbl = Instance.new("TextLabel")
		tLbl.Parent = f
		tLbl.BackgroundTransparency = 1
		tLbl.Position = UDim2.new(0, 10, 0, 6)
		tLbl.Size = UDim2.new(1, -20, 0, 16)
		tLbl.Font = Enum.Font.GothamSemibold
		tLbl.Text = title or "Title"
		tLbl.TextColor3 = C.TEXT
		tLbl.TextSize = 11
		tLbl.TextXAlignment = Enum.TextXAlignment.Left

		local cLbl = Instance.new("TextLabel")
		cLbl.Parent = f
		cLbl.BackgroundTransparency = 1
		cLbl.Position = UDim2.new(0, 10, 0, 24)
		cLbl.Size = UDim2.new(1, -20, 0, 0)
		cLbl.AutomaticSize = Enum.AutomaticSize.Y
		cLbl.Font = Enum.Font.Gotham
		cLbl.Text = content or ""
		cLbl.TextColor3 = C.DIM
		cLbl.TextSize = 10
		cLbl.TextXAlignment = Enum.TextXAlignment.Left
		cLbl.TextWrapped = true

		local pad = Instance.new("UIPadding")
		pad.Parent = f
		pad.PaddingBottom = UDim.new(0, 8)
	end

	function SecObj:addCheck(checkname, default, callback, iconName)
		local cb = callback or function() end
		local On = (default == true)
		local f = Base(32)

		local ChkBox, ChkFill, ChkImg, chkStroke = MakeCheckbox(f, On)

		local iconOff = 0
		if iconName then
			local ic = MkIcon(f, iconName, UDim2.new(0, 14, 0, 14), 32, 0, C.DIM, 0, 0.5)
			if ic then iconOff = 18 end
		end

		local Lbl = Instance.new("TextLabel")
		Lbl.Parent = f
		Lbl.BackgroundTransparency = 1
		Lbl.Position = UDim2.new(0, 32 + iconOff, 0, 0)
		Lbl.Size = UDim2.new(1, -(32 + iconOff + 10), 1, 0)
		Lbl.Font = Enum.Font.GothamSemibold
		Lbl.Text = checkname or "Check"
		Lbl.TextColor3 = On and C.TEXT or C.DIM
		Lbl.TextSize = 12
		Lbl.TextXAlignment = Enum.TextXAlignment.Left

		local function UpdateVisuals()
			Tw(ChkBox, {BackgroundColor3 = On and C.CHECK or C.OFF}, TI.Fast)
			Tw(ChkFill, {
				BackgroundTransparency = On and 0 or 1,
				Size = On and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 0, 0, 0),
			}, TI.Fast)
			Tw(ChkImg, {ImageTransparency = On and 0 or 1}, TI.Fast)
			chkStroke.Color = On and C.CHECK or C.BORDER
			Tw(Lbl, {TextColor3 = On and C.TEXT or C.DIM}, TI.Fast)
		end

		local HitBtn = Instance.new("TextButton")
		HitBtn.Parent = f
		HitBtn.BackgroundTransparency = 1
		HitBtn.Size = UDim2.new(1, 0, 1, 0)
		HitBtn.AutoButtonColor = false
		HitBtn.Text = ""
		HitBtn.ZIndex = 5

		HitBtn.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
		HitBtn.MouseLeave:Connect(function() Tw(f, {BackgroundColor3 = C.ELEM}) end)
		HitBtn.MouseButton1Click:Connect(function()
			On = not On
			UpdateVisuals()
			local ok, e = pcall(cb, On)
			if not ok then
				print("[ ECOHUB ] Check '" .. tostring(checkname) .. "' error: " .. tostring(e))
			end
		end)

		UpdateVisuals()

		local ctrl = {}
		function ctrl:Set(v)
			On = v == true
			UpdateVisuals()
		end
		function ctrl:Get() return On end
		function ctrl:Update(v)
			On = v == true
			UpdateVisuals()
			local ok, e = pcall(cb, On)
			if not ok then print("[ ECOHUB ] Check:Update error: " .. tostring(e)) end
		end
		RegOption(ctrl, "Check")
		return ctrl
	end

	function SecObj:addSlider(name, mn, mx, def, callback, iconName)
		local cb = callback or function() end
		mn = tonumber(mn) or 0
		mx = tonumber(mx) or 100
		local cur = math.clamp(tonumber(def) or mn, mn, mx)
		local f = Base(46)

		if iconName then
			MkIcon(f, iconName, UDim2.new(0, 13, 0, 13), 8, 0, C.ACCENT, 0, 0.5)
		end

		local NL = Instance.new("TextLabel")
		NL.Parent = f
		NL.BackgroundTransparency = 1
		NL.Position = UDim2.new(0, 12, 0, 6)
		NL.Size = UDim2.new(1, -60, 0, 16)
		NL.Font = Enum.Font.GothamSemibold
		NL.Text = name or "Slider"
		NL.TextColor3 = C.TEXT
		NL.TextSize = 12
		NL.TextXAlignment = Enum.TextXAlignment.Left

		local VL = Instance.new("TextLabel")
		VL.Parent = f
		VL.BackgroundTransparency = 1
		VL.Position = UDim2.new(1, -56, 0, 6)
		VL.Size = UDim2.new(0, 46, 0, 16)
		VL.Font = Enum.Font.GothamBold
		VL.Text = tostring(cur)
		VL.TextColor3 = C.ACCENT
		VL.TextSize = 11
		VL.TextXAlignment = Enum.TextXAlignment.Right

		local Track = Instance.new("Frame")
		Track.Parent = f
		Track.BackgroundColor3 = C.OFF
		Track.BorderSizePixel = 0
		Track.Position = UDim2.new(0, 12, 0, 30)
		Track.Size = UDim2.new(1, -24, 0, 6)
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
		Knob.Size = UDim2.fromOffset(13, 13)
		Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Knob.ZIndex = 3
		Knob.BorderSizePixel = 0
		local knobCorner = Instance.new("UICorner")
		knobCorner.CornerRadius = UDim.new(1, 0)
		knobCorner.Parent = Knob
		MkStroke(Knob, C.BORDER, 1)

		local TrackHit = Instance.new("TextButton")
		TrackHit.Parent = f
		TrackHit.BackgroundTransparency = 1
		TrackHit.Position = UDim2.new(0, 12, 0, 22)
		TrackHit.Size = UDim2.new(1, -24, 0, 20)
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
				print("[ ECOHUB ] Slider '" .. tostring(name) .. "' error: " .. tostring(e))
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
		function ctrl:Update(v)
			cur = math.clamp(v, mn, mx)
			local p = (cur - mn) / (mx - mn)
			Fill.Size = UDim2.new(p, 0, 1, 0)
			Knob.Position = UDim2.new(p, 0, 0.5, 0)
			VL.Text = tostring(cur)
			local ok, e = pcall(cb, cur)
			if not ok then print("[ ECOHUB ] Slider:Update error: " .. tostring(e)) end
		end
		RegOption(ctrl, "Slider")
		return ctrl
	end

	-- addTextBox(name, placeholder, callback, iconName, withCheck, checkDefault, checkCallback)
	function SecObj:addTextBox(name, placeholder, callback, iconName, withCheck, checkDefault, checkCallback)
		local cb      = callback      or function() end
		local chkCb   = checkCallback or function() end
		local hasChk  = withCheck == true
		local chkOn   = hasChk and (checkDefault == true) or false
		local totalH  = hasChk and 56 or 52
		local f       = Base(totalH)
		f.AutomaticSize = Enum.AutomaticSize.None

		-- Icon
		local leftPad = 10
		if iconName then
			local ic = MkIcon(f, iconName, UDim2.new(0, 13, 0, 13), 8, -totalH/2+10, C.DIM, 0, 0)
			if ic then
				ic.Position = UDim2.new(0, 8, 0, 8)
				ic.AnchorPoint = Vector2.new(0, 0)
				leftPad = 26
			end
		end

		-- Label row
		local NL = Instance.new("TextLabel")
		NL.Parent = f
		NL.BackgroundTransparency = 1
		NL.Position = UDim2.new(0, leftPad, 0, 7)
		NL.Size = UDim2.new(1, -(leftPad + 10), 0, 16)
		NL.Font = Enum.Font.GothamSemibold
		NL.Text = name or "TextBox"
		NL.TextColor3 = C.TEXT
		NL.TextSize = 11
		NL.TextXAlignment = Enum.TextXAlignment.Left

		-- Input row
		local InputBg = Instance.new("Frame")
		InputBg.Parent = f
		InputBg.BackgroundColor3 = C.OFF
		InputBg.BorderSizePixel = 0
		InputBg.Position = UDim2.new(0, 8, 0, 27)
		local inpW = hasChk and -50 or -16
		InputBg.Size = UDim2.new(1, inpW, 0, 22)
		Corner(InputBg, 5)
		local inpStroke = MkStroke(InputBg, C.BORDER)

		local Input = Instance.new("TextBox")
		Input.Parent = InputBg
		Input.BackgroundTransparency = 1
		Input.BorderSizePixel = 0
		Input.Position = UDim2.new(0, 8, 0, 0)
		Input.Size = UDim2.new(1, -16, 1, 0)
		Input.Font = Enum.Font.GothamSemibold
		Input.PlaceholderText = placeholder or ""
		Input.PlaceholderColor3 = C.DIM
		Input.Text = ""
		Input.TextColor3 = C.TEXT
		Input.TextSize = 11
		Input.ClearTextOnFocus = false

		Input.Focused:Connect(function()
			Tw(InputBg, {BackgroundColor3 = C.ACTIVE})
			inpStroke.Color = C.ACCENT2
		end)
		Input.FocusLost:Connect(function()
			Tw(InputBg, {BackgroundColor3 = C.OFF})
			inpStroke.Color = C.BORDER
			local ok, e = pcall(cb, tostring(Input.Text))
			if not ok then
				print("[ ECOHUB ] TextBox '" .. tostring(name) .. "' error: " .. tostring(e))
			end
		end)
		f.MouseEnter:Connect(function() Tw(f, {BackgroundColor3 = C.HOVER}) end)
		f.MouseLeave:Connect(function()
			if not Input:IsFocused() then Tw(f, {BackgroundColor3 = C.ELEM}) end
		end)

		-- Optional check toggle on right side of input row
		local ChkBox2, ChkFill2, ChkImg2, chkStroke2
		if hasChk then
			ChkBox2 = Instance.new("Frame")
			ChkBox2.Parent = f
			ChkBox2.BackgroundColor3 = chkOn and C.CHECK or C.OFF
			ChkBox2.BorderSizePixel = 0
			ChkBox2.AnchorPoint = Vector2.new(1, 0)
			ChkBox2.Position = UDim2.new(1, -8, 0, 27)
			ChkBox2.Size = UDim2.new(0, 22, 0, 22)
			Corner(ChkBox2, 5)
			chkStroke2 = MkStroke(ChkBox2, chkOn and C.CHECK or C.BORDER)

			ChkFill2 = Instance.new("Frame")
			ChkFill2.Parent = ChkBox2
			ChkFill2.AnchorPoint = Vector2.new(0.5, 0.5)
			ChkFill2.BackgroundColor3 = C.CHECK
			ChkFill2.BackgroundTransparency = chkOn and 0 or 1
			ChkFill2.BorderSizePixel = 0
			ChkFill2.Position = UDim2.new(0.5, 0, 0.5, 0)
			ChkFill2.Size = chkOn and UDim2.new(1,0,1,0) or UDim2.new(0,0,0,0)
			Corner(ChkFill2, 5)

			ChkImg2 = MkCheckIcon(ChkBox2)
			ChkImg2.ImageTransparency = chkOn and 0 or 1

			local ChkHit2 = Instance.new("TextButton")
			ChkHit2.Parent = ChkBox2
			ChkHit2.BackgroundTransparency = 1
			ChkHit2.Size = UDim2.new(1,0,1,0)
			ChkHit2.Text = ""
			ChkHit2.ZIndex = 6
			ChkHit2.MouseButton1Click:Connect(function()
				chkOn = not chkOn
				Tw(ChkBox2, {BackgroundColor3 = chkOn and C.CHECK or C.OFF}, TI.Fast)
				Tw(ChkFill2, {BackgroundTransparency = chkOn and 0 or 1, Size = chkOn and UDim2.new(1,0,1,0) or UDim2.new(0,0,0,0)}, TI.Fast)
				Tw(ChkImg2, {ImageTransparency = chkOn and 0 or 1}, TI.Fast)
				chkStroke2.Color = chkOn and C.CHECK or C.BORDER
				local ok, e = pcall(chkCb, chkOn)
				if not ok then print("[ ECOHUB ] TextBox check error: " .. tostring(e)) end
			end)
		end

		local ctrl = {}
		function ctrl:Get() return tostring(Input.Text) end
		function ctrl:Set(v) Input.Text = tostring(v or "") end
		function ctrl:GetCheck() return chkOn end
		function ctrl:SetCheck(v)
			if not hasChk then return end
			chkOn = v == true
			Tw(ChkBox2, {BackgroundColor3 = chkOn and C.CHECK or C.OFF}, TI.Fast)
			Tw(ChkFill2, {BackgroundTransparency = chkOn and 0 or 1, Size = chkOn and UDim2.new(1,0,1,0) or UDim2.new(0,0,0,0)}, TI.Fast)
			Tw(ChkImg2, {ImageTransparency = chkOn and 0 or 1}, TI.Fast)
			chkStroke2.Color = chkOn and C.CHECK or C.BORDER
		end
		function ctrl:Update(v)
			Input.Text = tostring(v or "")
			local ok, e = pcall(cb, tostring(v or ""))
			if not ok then print("[ ECOHUB ] TextBox:Update error: " .. tostring(e)) end
		end
		RegOption(ctrl, "TextBox")
		return ctrl
	end

	function SecObj:addDropdown(name, list, callback, iconName)
		local cb = callback or function() end
		local Selected = nil
		local Open = false

		local Wrapper = Instance.new("Frame")
		Wrapper.Parent = SecContent
		Wrapper.BackgroundTransparency = 1
		Wrapper.BorderSizePixel = 0
		Wrapper.Size = UDim2.new(1, 0, 0, 32)
		Wrapper.ClipsDescendants = false

		local Hdr = Instance.new("Frame")
		Hdr.Parent = Wrapper
		Hdr.BackgroundColor3 = C.ELEM
		Hdr.BorderSizePixel = 0
		Hdr.Size = UDim2.new(1, 0, 0, 32)
		Hdr.ZIndex = 5
		Corner(Hdr, 6)
		MkStroke(Hdr, C.BORDER)

		local leftOff = 12
		if iconName then
			local ic = MkIcon(Hdr, iconName, UDim2.new(0, 14, 0, 14), 10, 0, C.DIM, 0, 0.5)
			if ic then leftOff = 30 end
		end

		local DN = Instance.new("TextLabel")
		DN.Parent = Hdr
		DN.BackgroundTransparency = 1
		DN.Position = UDim2.new(0, leftOff, 0, 0)
		DN.Size = UDim2.new(0.52, -leftOff, 1, 0)
		DN.Font = Enum.Font.GothamSemibold
		DN.Text = name or "Dropdown"
		DN.TextColor3 = C.TEXT
		DN.TextSize = 12
		DN.TextXAlignment = Enum.TextXAlignment.Left
		DN.ZIndex = 6

		local DS = Instance.new("TextLabel")
		DS.Parent = Hdr
		DS.BackgroundTransparency = 1
		DS.Position = UDim2.new(0.52, 0, 0, 0)
		DS.Size = UDim2.new(0.48, -28, 1, 0)
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
		DA.Position = UDim2.new(1, -9, 0.5, 0)
		DA.ScaleType = Enum.ScaleType.Fit
		DA.ZIndex = 6

		local DL = Instance.new("Frame")
		DL.Parent = Wrapper
		DL.BackgroundColor3 = C.DDBG
		DL.BorderSizePixel = 0
		DL.Position = UDim2.new(0, 0, 0, 34)
		DL.Size = UDim2.new(1, 0, 0, 0)
		DL.ZIndex = 20
		DL.ClipsDescendants = true
		DL.Visible = false
		Corner(DL, 6)
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

		local tH = math.min(#list * 28 + 10, 140)

		local function CloseDD()
			Open = false
			Tw(DA, {Rotation = 0}, TI.Fast)
			Tw(DL, {Size = UDim2.new(1, 0, 0, 0)})
			task.delay(0.15, function()
				DL.Visible = false
				Wrapper.Size = UDim2.new(1, 0, 0, 32)
			end)
		end
		local function OpenDD()
			Open = true
			Tw(DA, {Rotation = 180}, TI.Fast)
			DL.Visible = true
			Tw(DL, {Size = UDim2.new(1, 0, 0, tH)})
			Wrapper.Size = UDim2.new(1, 0, 0, 34 + tH)
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
			tH = math.min(#itemList * 28 + 10, 140)
			for _, item in ipairs(itemList) do
				local Opt = Instance.new("TextButton")
				Opt.Parent = DS2
				Opt.BackgroundColor3 = C.ELEM
				Opt.BorderSizePixel = 0
				Opt.Size = UDim2.new(1, 0, 0, 24)
				Opt.AutoButtonColor = false
				Opt.Font = Enum.Font.GothamSemibold
				Opt.Text = tostring(item)
				Opt.TextColor3 = C.TEXT
				Opt.TextSize = 11
				Opt.ZIndex = 21
				Corner(Opt, 5)
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
						print("[ ECOHUB ] Dropdown '" .. tostring(name) .. "' error: " .. tostring(e))
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
		function ctrl:SetList(newList) BuildItems(newList) end
		function ctrl:Update(v)
			Selected = v
			DS.Text = v and tostring(v) or "none"
			DS.TextColor3 = v and C.ACCENT or C.DIM
			local ok, e = pcall(cb, v)
			if not ok then print("[ ECOHUB ] Dropdown:Update error: " .. tostring(e)) end
		end
		RegOption(ctrl, "Dropdown")
		return ctrl
	end

	function SecObj:addKeybind(name, default, callback)
		local cb = callback or function() end
		local CK = default or nil
		local Listening = false
		local f = Base(32)

		local Lbl = Instance.new("TextLabel")
		Lbl.Parent = f
		Lbl.BackgroundTransparency = 1
		Lbl.Position = UDim2.new(0, 12, 0, 0)
		Lbl.Size = UDim2.new(0.6, 0, 1, 0)
		Lbl.Font = Enum.Font.GothamSemibold
		Lbl.Text = name or "Keybind"
		Lbl.TextColor3 = C.TEXT
		Lbl.TextSize = 12
		Lbl.TextXAlignment = Enum.TextXAlignment.Left

		local KbBtn = Instance.new("TextButton")
		KbBtn.Parent = f
		KbBtn.BackgroundColor3 = C.KEYBG
		KbBtn.BorderSizePixel = 0
		KbBtn.AnchorPoint = Vector2.new(1, 0.5)
		KbBtn.Position = UDim2.new(1, -8, 0.5, 0)
		KbBtn.Size = UDim2.new(0, 68, 0, 20)
		KbBtn.AutoButtonColor = false
		KbBtn.Font = Enum.Font.GothamBold
		KbBtn.Text = CK and "[" .. GetKeyName(CK) .. "]" or "[NONE]"
		KbBtn.TextColor3 = C.DIM
		KbBtn.TextSize = 10
		Corner(KbBtn, 5)
		local kbStroke = MkStroke(KbBtn, C.BORDER)

		local function ResizeKb()
			local sz = TextService:GetTextSize(KbBtn.Text, KbBtn.TextSize, KbBtn.Font, Vector2.new(math.huge, math.huge))
			Tw(KbBtn, {Size = UDim2.new(0, math.max(68, sz.X + 16), 0, 20)}, TI.Key)
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
					print("[ ECOHUB ] Keybind '" .. tostring(name) .. "' error: " .. tostring(e))
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
		function ctrl:Update(k)
			CK = k
			KbBtn.Text = k and "[" .. GetKeyName(k) .. "]" or "[NONE]"
			ResizeKb()
			local ok, e = pcall(cb, CK)
			if not ok then print("[ ECOHUB ] Keybind:Update error: " .. tostring(e)) end
		end
		RegOption(ctrl, "Keybind")
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
		Wrapper.Size = UDim2.new(1, 0, 0, 32)

		local Hdr = Instance.new("Frame")
		Hdr.Parent = Wrapper
		Hdr.BackgroundColor3 = C.ELEM
		Hdr.BorderSizePixel = 0
		Hdr.Size = UDim2.new(1, 0, 0, 32)
		Corner(Hdr, 6)
		MkStroke(Hdr, C.BORDER)

		MkIcon(Hdr, "palette", UDim2.new(0, 14, 0, 14), 10, 0, C.DIM, 0, 0.5)

		local NL = Instance.new("TextLabel")
		NL.Parent = Hdr
		NL.BackgroundTransparency = 1
		NL.Position = UDim2.new(0, 30, 0, 0)
		NL.Size = UDim2.new(0.55, -30, 1, 0)
		NL.Font = Enum.Font.GothamSemibold
		NL.Text = name or "Color"
		NL.TextColor3 = C.TEXT
		NL.TextSize = 12
		NL.TextXAlignment = Enum.TextXAlignment.Left

		local function ToHex(c)
			return string.format("#%02X%02X%02X",
				math.floor(c.R * 255), math.floor(c.G * 255), math.floor(c.B * 255))
		end

		local HexL = Instance.new("TextLabel")
		HexL.Parent = Hdr
		HexL.BackgroundTransparency = 1
		HexL.Position = UDim2.new(0.55, 0, 0, 0)
		HexL.Size = UDim2.new(0.45, -40, 1, 0)
		HexL.Font = Enum.Font.GothamBold
		HexL.Text = ToHex(CurColor)
		HexL.TextColor3 = C.DIM
		HexL.TextSize = 10
		HexL.TextXAlignment = Enum.TextXAlignment.Right

		local Prev = Instance.new("Frame")
		Prev.Parent = Hdr
		Prev.BackgroundColor3 = CurColor
		Prev.BorderSizePixel = 0
		Prev.AnchorPoint = Vector2.new(1, 0.5)
		Prev.Position = UDim2.new(1, -10, 0.5, 0)
		Prev.Size = UDim2.new(0, 16, 0, 16)
		Corner(Prev, 4)
		MkStroke(Prev, C.BORDER)

		local Panel = Instance.new("Frame")
		Panel.Parent = Wrapper
		Panel.BackgroundColor3 = C.DDBG
		Panel.BorderSizePixel = 0
		Panel.Position = UDim2.new(0, 0, 0, 34)
		Panel.Size = UDim2.new(1, 0, 0, 0)
		Panel.ClipsDescendants = true
		Panel.Visible = false
		Corner(Panel, 6)
		MkStroke(Panel, C.DDBDR)

		local function Refresh()
			CurColor = Color3.fromHSV(H, S, V)
			Prev.BackgroundColor3 = CurColor
			HexL.Text = ToHex(CurColor)
			local ok, e = pcall(cb, CurColor)
			if not ok then
				print("[ ECOHUB ] ColorPicker '" .. tostring(name) .. "' error: " .. tostring(e))
			end
		end

		local chs = {
			{l = "H", g = function() return H end, s = function(v) H = v end, m = 360},
			{l = "S", g = function() return S end, s = function(v) S = v end, m = 100},
			{l = "V", g = function() return V end, s = function(v) V = v end, m = 100},
		}
		local panelH = #chs * 32 + 14

		for i, ch in ipairs(chs) do
			local Row = Instance.new("Frame")
			Row.Parent = Panel
			Row.BackgroundTransparency = 1
			Row.Position = UDim2.new(0, 10, 0, 8 + (i - 1) * 32)
			Row.Size = UDim2.new(1, -20, 0, 26)

			local RL = Instance.new("TextLabel")
			RL.Parent = Row
			RL.BackgroundTransparency = 1
			RL.Size = UDim2.new(0, 16, 1, 0)
			RL.Font = Enum.Font.GothamBold
			RL.Text = ch.l
			RL.TextColor3 = C.ACCENT
			RL.TextSize = 11

			local RT = Instance.new("Frame")
			RT.Parent = Row
			RT.BackgroundColor3 = C.OFF
			RT.BorderSizePixel = 0
			RT.Position = UDim2.new(0, 22, 0.5, -3)
			RT.Size = UDim2.new(1, -62, 0, 7)
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
			RDot.Size = UDim2.fromOffset(13, 13)
			RDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			RDot.ZIndex = 3
			RDot.BorderSizePixel = 0
			local rdCorner = Instance.new("UICorner")
			rdCorner.CornerRadius = UDim.new(1, 0)
			rdCorner.Parent = RDot
			MkStroke(RDot, C.BORDER, 1)

			local RTHit = Instance.new("TextButton")
			RTHit.Parent = Row
			RTHit.BackgroundTransparency = 1
			RTHit.Position = UDim2.new(0, 22, 0.5, -9)
			RTHit.Size = UDim2.new(1, -62, 0, 20)
			RTHit.Text = ""
			RTHit.ZIndex = 4

			local RV = Instance.new("TextLabel")
			RV.Parent = Row
			RV.BackgroundTransparency = 1
			RV.Position = UDim2.new(1, -36, 0, 0)
			RV.Size = UDim2.new(0, 34, 1, 0)
			RV.Font = Enum.Font.GothamBold
			RV.Text = tostring(math.floor(ch.g() * ch.m))
			RV.TextColor3 = C.DIM
			RV.TextSize = 10

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
				Wrapper.Size = UDim2.new(1, 0, 0, 34 + panelH)
			else
				Tw(Panel, {Size = UDim2.new(1, 0, 0, 0)})
				task.delay(0.15, function()
					Panel.Visible = false
					Wrapper.Size = UDim2.new(1, 0, 0, 32)
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
		function ctrl:Update(c)
			CurColor = c
			H, S, V = Color3.toHSV(c)
			Prev.BackgroundColor3 = c
			HexL.Text = ToHex(c)
			local ok, e = pcall(cb, CurColor)
			if not ok then print("[ ECOHUB ] ColorPicker:Update error: " .. tostring(e)) end
		end
		RegOption(ctrl, "ColorPicker")
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
			if not SafeIsDir(ConfigFolder) then SafeFolder(ConfigFolder) end
			if not SafeIsDir(ConfigSettingsFolder) then SafeFolder(ConfigSettingsFolder) end
		end)
	end
	EnsureFolders()

	local function GetConfigList()
		local out = {}
		local ok, list = pcall(SafeList, ConfigSettingsFolder)
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
			return false, "invalid name"
		end
		local data = {objects = {}}
		local opts = Library.Options or {}
		for idx, opt in next, opts do
			if SaveIgnore[idx] then continue end
			local t = opt.Type
			local v = opt:Get()
			if t == "Check" then
				table.insert(data.objects, {type = "Check", idx = idx, value = v})
			elseif t == "Slider" then
				table.insert(data.objects, {type = "Slider", idx = idx, value = v})
			elseif t == "Dropdown" then
				table.insert(data.objects, {type = "Dropdown", idx = idx, value = v})
			elseif t == "ColorPicker" then
				if v then
					table.insert(data.objects, {
						type = "ColorPicker",
						idx = idx,
						value = string.format("%02X%02X%02X",
							math.floor(v.R * 255),
							math.floor(v.G * 255),
							math.floor(v.B * 255)
						)
					})
				end
			elseif t == "Keybind" then
				if v then
					table.insert(data.objects, {type = "Keybind", idx = idx, value = v.Name})
				end
			elseif t == "TextBox" then
				table.insert(data.objects, {type = "TextBox", idx = idx, value = v})
			end
		end
		local ok2, encoded = pcall(function() return HttpService:JSONEncode(data) end)
		if not ok2 then return false, "encode failed" end
		local ok3, err3 = pcall(SafeWrite, ConfigSettingsFolder .. "/" .. name .. ".json", encoded)
		if not ok3 then return false, "writefile: " .. tostring(err3) end
		return true
	end

	local function LoadConfig(name)
		if not name then return false, "invalid name" end
		local path = ConfigSettingsFolder .. "/" .. name .. ".json"
		local ok, content = pcall(SafeRead, path)
		if not ok then return false, "file not found" end
		local ok2, decoded = pcall(function() return HttpService:JSONDecode(content) end)
		if not ok2 then return false, "decode failed" end
		for _, obj in ipairs(decoded.objects or {}) do
			task.spawn(function()
				local opts = Library.Options or {}
				local opt = opts[obj.idx]
				if not opt then return end
				if obj.type == "Check" then
					opt:Set(obj.value == true or obj.value == "true")
				elseif obj.type == "Slider" then
					opt:Set(tonumber(obj.value) or 0)
				elseif obj.type == "Dropdown" then
					opt:Set(obj.value)
				elseif obj.type == "ColorPicker" then
					local ok3, col = pcall(function()
						return Color3.fromRGB(
							tonumber("0x" .. obj.value:sub(1, 2)),
							tonumber("0x" .. obj.value:sub(3, 4)),
							tonumber("0x" .. obj.value:sub(5, 6))
						)
					end)
					if ok3 then opt:Set(col) end
				elseif obj.type == "Keybind" then
					if obj.value then
						local ok3, kc = pcall(function() return Enum.KeyCode[obj.value] end)
						if ok3 and kc then opt:Set(kc) end
					end
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
	Main.Size = UDim2.new(0, 540, 0, 350)
	Main.ClipsDescendants = true
	Corner(Main, 10)
	MkStroke(Main, C.BORDER, 1)

	local TitleBar = Instance.new("Frame")
	TitleBar.Parent = Main
	TitleBar.BackgroundColor3 = C.SIDEBAR
	TitleBar.BorderSizePixel = 0
	TitleBar.Position = UDim2.new(0, 0, 0, 0)
	TitleBar.Size = UDim2.new(1, 0, 0, 34)
	TitleBar.ZIndex = 2

	local TitleBarCornerFix = Instance.new("Frame")
	TitleBarCornerFix.Parent = TitleBar
	TitleBarCornerFix.BackgroundColor3 = C.SIDEBAR
	TitleBarCornerFix.BorderSizePixel = 0
	TitleBarCornerFix.Position = UDim2.new(0, 0, 0.5, 0)
	TitleBarCornerFix.Size = UDim2.new(1, 0, 0.5, 0)
	TitleBarCornerFix.ZIndex = 2

	local TitleRound = Instance.new("UICorner")
	TitleRound.CornerRadius = UDim.new(0, 10)
	TitleRound.Parent = TitleBar

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Parent = TitleBar
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Position = UDim2.new(0, 12, 0, 0)
	TitleLabel.Size = UDim2.new(0.65, 0, 1, 0)
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.Text = windowname or "ecohub"
	TitleLabel.TextColor3 = C.TEXT
	TitleLabel.TextSize = 13
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TitleLabel.ZIndex = 5

	local VerLabel = Instance.new("TextLabel")
	VerLabel.Parent = TitleBar
	VerLabel.BackgroundTransparency = 1
	VerLabel.Position = UDim2.new(0, 0, 0, 0)
	VerLabel.Size = UDim2.new(1, -14, 1, 0)
	VerLabel.Font = Enum.Font.Gotham
	VerLabel.Text = windowinfo or "v1.0"
	VerLabel.TextColor3 = C.DIM
	VerLabel.TextSize = 10
	VerLabel.TextXAlignment = Enum.TextXAlignment.Right
	VerLabel.ZIndex = 5

	local TitleSep = Instance.new("Frame")
	TitleSep.Parent = TitleBar
	TitleSep.BackgroundColor3 = C.SEP
	TitleSep.BorderSizePixel = 0
	TitleSep.AnchorPoint = Vector2.new(0, 1)
	TitleSep.Position = UDim2.new(0, 0, 1, 0)
	TitleSep.Size = UDim2.new(1, 0, 0, 1)
	TitleSep.ZIndex = 3

	local Body = Instance.new("Frame")
	Body.Name = "Body"
	Body.Parent = Main
	Body.BackgroundTransparency = 1
	Body.BorderSizePixel = 0
	Body.Position = UDim2.new(0, 0, 0, 34)
	Body.Size = UDim2.new(1, 0, 1, -34)

	local Sidebar = Instance.new("Frame")
	Sidebar.Parent = Body
	Sidebar.BackgroundColor3 = C.SIDEBAR
	Sidebar.BorderSizePixel = 0
	Sidebar.Size = UDim2.new(0, 126, 1, 0)

	local SidebarFix = Instance.new("Frame")
	SidebarFix.Parent = Sidebar
	SidebarFix.BackgroundColor3 = C.SIDEBAR
	SidebarFix.BorderSizePixel = 0
	SidebarFix.Position = UDim2.new(1, -10, 0, 0)
	SidebarFix.Size = UDim2.new(0, 10, 1, 0)

	local SidebarRight = Instance.new("Frame")
	SidebarRight.Parent = Sidebar
	SidebarRight.BackgroundColor3 = C.SEP
	SidebarRight.BorderSizePixel = 0
	SidebarRight.AnchorPoint = Vector2.new(1, 0)
	SidebarRight.Position = UDim2.new(1, 0, 0, 0)
	SidebarRight.Size = UDim2.new(0, 1, 1, 0)

	local SidebarBrandTop = Instance.new("ImageLabel")
	SidebarBrandTop.Parent = Sidebar
	SidebarBrandTop.BackgroundTransparency = 1
	SidebarBrandTop.Image = BRAND_IMAGE
	SidebarBrandTop.Size = UDim2.new(0, 84, 0, 84)
	SidebarBrandTop.AnchorPoint = Vector2.new(0.5, 0)
	SidebarBrandTop.Position = UDim2.new(0.5, 0, 0, 5)
	SidebarBrandTop.ScaleType = Enum.ScaleType.Fit
	SidebarBrandTop.ImageTransparency = 0

	local SidebarSepTop = Instance.new("Frame")
	SidebarSepTop.Parent = Sidebar
	SidebarSepTop.BackgroundColor3 = C.SEP
	SidebarSepTop.BorderSizePixel = 0
	SidebarSepTop.Position = UDim2.new(0, 8, 0, 83)
	SidebarSepTop.Size = UDim2.new(1, -16, 0, 1)

	local TabScroll = Instance.new("ScrollingFrame")
	TabScroll.Parent = Sidebar
	TabScroll.BackgroundTransparency = 1
	TabScroll.BorderSizePixel = 0
	TabScroll.Position = UDim2.new(0, 7, 0, 88)
	TabScroll.Size = UDim2.new(1, -14, 1, -130)
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
	SidebarSep.Position = UDim2.new(0, 8, 1, -38)
	SidebarSep.Size = UDim2.new(1, -16, 0, 1)

	local SettingsTabBtn = Instance.new("TextButton")
	SettingsTabBtn.Parent = Sidebar
	SettingsTabBtn.BackgroundColor3 = C.ELEM
	SettingsTabBtn.BackgroundTransparency = 1
	SettingsTabBtn.BorderSizePixel = 0
	SettingsTabBtn.AnchorPoint = Vector2.new(0, 1)
	SettingsTabBtn.Position = UDim2.new(0, 7, 1, -7)
	SettingsTabBtn.Size = UDim2.new(1, -14, 0, 30)
	SettingsTabBtn.AutoButtonColor = false
	SettingsTabBtn.Text = ""
	Corner(SettingsTabBtn, 6)

	local SettingsIcon = Instance.new("ImageLabel")
	SettingsIcon.BackgroundTransparency = 1
	SettingsIcon.Image = GetIconId("settings") or ""
	SettingsIcon.ImageColor3 = C.DIM
	SettingsIcon.Size = UDim2.new(0, 16, 0, 16)
	SettingsIcon.Position = UDim2.new(0, 8, 0.5, 0)
	SettingsIcon.AnchorPoint = Vector2.new(0, 0.5)
	SettingsIcon.ScaleType = Enum.ScaleType.Fit
	SettingsIcon.Parent = SettingsTabBtn

	local SettingsLbl = Instance.new("TextLabel")
	SettingsLbl.BackgroundTransparency = 1
	SettingsLbl.Position = UDim2.new(0, 28, 0, 0)
	SettingsLbl.Size = UDim2.new(1, -36, 1, 0)
	SettingsLbl.Font = Enum.Font.GothamSemibold
	SettingsLbl.Text = "Settings"
	SettingsLbl.TextColor3 = C.DIM
	SettingsLbl.TextSize = 12
	SettingsLbl.TextXAlignment = Enum.TextXAlignment.Left
	SettingsLbl.Parent = SettingsTabBtn

	local SettingsUnderline = Instance.new("Frame")
	SettingsUnderline.Parent = SettingsTabBtn
	SettingsUnderline.BackgroundColor3 = C.ACCENT2
	SettingsUnderline.BorderSizePixel = 0
	SettingsUnderline.AnchorPoint = Vector2.new(0.5, 1)
	SettingsUnderline.Position = UDim2.new(0.5, 0, 1, -1)
	SettingsUnderline.Size = UDim2.new(0, 0, 0, 2)
	SettingsUnderline.Visible = false
	Corner(SettingsUnderline, 1)

	local ContentArea = Instance.new("Frame")
	ContentArea.Parent = Body
	ContentArea.BackgroundTransparency = 1
	ContentArea.BorderSizePixel = 0
	ContentArea.Position = UDim2.new(0, 132, 0, 5)
	ContentArea.Size = UDim2.new(1, -136, 1, -10)

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

	local cfgSection = BuildSection("Configs", SettingsScroll)

	local cfgNameCtrl = cfgSection:addTextBox("Config name", "my_config", nil)
	local cfgListCtrl = cfgSection:addDropdown("Saved configs", GetConfigList(), nil)

	cfgSection:addButton("Save config", function()
		local name = cfgNameCtrl:Get()
		if not name or name:gsub(" ", "") == "" then return end
		local ok, err = SaveConfig(name)
		if not ok then
			print("[ ECOHUB ] Save error: " .. tostring(err))
		else
			local nl = GetConfigList()
			cfgListCtrl:SetList(nl)
			cfgListCtrl:Set(name)
		end
	end, "save")

	cfgSection:addButton("Load config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		local ok, err = LoadConfig(name)
		if not ok then
			print("[ ECOHUB ] Load error: " .. tostring(err))
		end
	end, "download")

	cfgSection:addButton("Overwrite config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		local ok, err = SaveConfig(name)
		if not ok then
			print("[ ECOHUB ] Overwrite error: " .. tostring(err))
		end
	end, "edit")

	cfgSection:addButton("Delete config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		pcall(SafeDel, ConfigSettingsFolder .. "/" .. name .. ".json")
		local nl = GetConfigList()
		cfgListCtrl:SetList(nl)
		cfgListCtrl:Set(nil)
	end, "trash-2")

	cfgSection:addButton("Refresh list", function()
		local nl = GetConfigList()
		cfgListCtrl:SetList(nl)
	end, "refresh-cw")

	cfgSection:addSeparator()

	cfgSection:addButton("Set autoload", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		pcall(SafeWrite, ConfigSettingsFolder .. "/autoload.txt", name)
	end, "star")

	cfgSection:addButton("Remove autoload", function()
		pcall(SafeDel, ConfigSettingsFolder .. "/autoload.txt")
	end, "x-circle")

	local cfgNameIdx = cfgNameCtrl._idx
	local cfgListIdx = cfgListCtrl._idx
	if cfgNameIdx then SaveIgnore[cfgNameIdx] = true end
	if cfgListIdx then SaveIgnore[cfgListIdx] = true end

	task.spawn(function()
		task.wait(1)
		local ok, content = pcall(SafeRead, ConfigSettingsFolder .. "/autoload.txt")
		if ok and content and content:gsub("%s", "") ~= "" then
			LoadConfig(content:gsub("%s", ""))
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
	local FullSize  = UDim2.new(0, 540, 0, 350)

	local MiniPanel = Instance.new("Frame")
	MiniPanel.Name = "MiniPanel"
	MiniPanel.Parent = ScreenGui
	MiniPanel.BackgroundColor3 = C.SIDEBAR
	MiniPanel.BorderSizePixel = 0
	MiniPanel.AnchorPoint = Vector2.new(0.5, 1)
	MiniPanel.Position = UDim2.new(0.5, 0, 1, -6)
	MiniPanel.Size = UDim2.new(0, 220, 0, 36)
	MiniPanel.Visible = false
	MiniPanel.ZIndex = 100
	Corner(MiniPanel, 18)
	MkStroke(MiniPanel, C.BORDER, 1)

	local MiniLbl = Instance.new("TextLabel")
	MiniLbl.Parent = MiniPanel
	MiniLbl.BackgroundTransparency = 1
	MiniLbl.Position = UDim2.new(0, 12, 0, 0)
	MiniLbl.Size = UDim2.new(1, -70, 1, 0)
	MiniLbl.Font = Enum.Font.GothamBold
	MiniLbl.Text = windowname or "ecohub"
	MiniLbl.TextColor3 = C.TEXT
	MiniLbl.TextSize = 12
	MiniLbl.TextXAlignment = Enum.TextXAlignment.Left
	MiniLbl.ZIndex = 101

	local MiniRestoreBtn = Instance.new("TextButton")
	MiniRestoreBtn.Parent = MiniPanel
	MiniRestoreBtn.BackgroundColor3 = C.ELEM
	MiniRestoreBtn.BorderSizePixel = 0
	MiniRestoreBtn.AnchorPoint = Vector2.new(1, 0.5)
	MiniRestoreBtn.Position = UDim2.new(1, -8, 0.5, 0)
	MiniRestoreBtn.Size = UDim2.new(0, 52, 0, 22)
	MiniRestoreBtn.AutoButtonColor = false
	MiniRestoreBtn.Font = Enum.Font.GothamSemibold
	MiniRestoreBtn.Text = "Open"
	MiniRestoreBtn.TextColor3 = C.ACCENT
	MiniRestoreBtn.TextSize = 11
	MiniRestoreBtn.ZIndex = 102
	Corner(MiniRestoreBtn, 11)
	MkStroke(MiniRestoreBtn, C.BORDER)

	MiniRestoreBtn.MouseEnter:Connect(function()
		Tw(MiniRestoreBtn, {BackgroundColor3 = C.HOVER})
	end)
	MiniRestoreBtn.MouseLeave:Connect(function()
		Tw(MiniRestoreBtn, {BackgroundColor3 = C.ELEM})
	end)

	local MiniDragging, MiniDragStart, MiniStartPos, MiniDragInput
	MiniPanel.InputBegan:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			MiniDragging = true
			MiniDragStart = inp.Position
			MiniStartPos = MiniPanel.Position
		end
	end)
	MiniPanel.InputChanged:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseMovement then
			MiniDragInput = inp
		end
	end)
	UserInputService.InputChanged:Connect(function(inp)
		if MiniDragging and inp == MiniDragInput then
			local d = inp.Position - MiniDragStart
			MiniPanel.Position = UDim2.new(
				MiniStartPos.X.Scale, MiniStartPos.X.Offset + d.X,
				MiniStartPos.Y.Scale, MiniStartPos.Y.Offset + d.Y
			)
		end
	end)
	UserInputService.InputEnded:Connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			MiniDragging = false
		end
	end)

	local function DoMinimize(toMin)
		Minimized = toMin
		if toMin then
			Tw(Main, {BackgroundTransparency = 1, Size = UDim2.new(0, 540, 0, 0)}, TI.Med)
			task.delay(0.2, function()
				Main.Visible = false
				MiniPanel.Size = UDim2.new(0, 0, 0, 36)
				MiniPanel.Visible = true
				Tw(MiniPanel, {Size = UDim2.new(0, 220, 0, 36)}, TI.Slow)
			end)
		else
			Tw(MiniPanel, {Size = UDim2.new(0, 0, 0, 36)}, TI.Fast)
			task.delay(0.15, function()
				MiniPanel.Visible = false
				Main.Visible = true
				Main.Size = UDim2.new(0, 540, 0, 0)
				Tw(Main, {BackgroundTransparency = 0, Size = FullSize}, TI.Slow)
			end)
		end
	end

	MiniRestoreBtn.MouseButton1Click:Connect(function()
		DoMinimize(false)
	end)

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
		SettingsUnderline.Size = UDim2.new(0, 0, 0, 2)
		Tw(SettingsUnderline, {Size = UDim2.new(0.8, 0, 0, 2)}, TI.Slow)
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
		local iconSize = 16

		local Tab = Instance.new("TextButton")
		Tab.Parent = TabScroll
		Tab.BackgroundColor3 = C.ELEM
		Tab.BackgroundTransparency = 1
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(1, 0, 0, 30)
		Tab.AutoButtonColor = false
		Tab.Text = ""
		Tab.Font = Enum.Font.GothamSemibold
		Tab.TextColor3 = C.DIM
		Tab.TextSize = 12
		Corner(Tab, 6)

		local TabIcon = nil
		if hasIcon then
			TabIcon = Instance.new("ImageLabel")
			TabIcon.BackgroundTransparency = 1
			TabIcon.Image = GetIconId(iconName)
			TabIcon.ImageColor3 = C.DIM
			TabIcon.Size = UDim2.new(0, iconSize, 0, iconSize)
			TabIcon.Position = UDim2.new(0, 8, 0.5, 0)
			TabIcon.AnchorPoint = Vector2.new(0, 0.5)
			TabIcon.ScaleType = Enum.ScaleType.Fit
			TabIcon.Parent = Tab
		end

		local TabLbl = Instance.new("TextLabel")
		TabLbl.BackgroundTransparency = 1
		TabLbl.Position = hasIcon
			and UDim2.new(0, 8 + iconSize + 5, 0, 0)
			or  UDim2.new(0, 10, 0, 0)
		TabLbl.Size = hasIcon
			and UDim2.new(1, -(8 + iconSize + 10), 1, 0)
			or  UDim2.new(1, -20, 1, 0)
		TabLbl.Font = Enum.Font.GothamSemibold
		TabLbl.Text = pagename
		TabLbl.TextColor3 = C.DIM
		TabLbl.TextSize = 12
		TabLbl.TextXAlignment = Enum.TextXAlignment.Left
		TabLbl.Parent = Tab

		local Underline = Instance.new("Frame")
		Underline.Parent = Tab
		Underline.BackgroundColor3 = C.ACCENT2
		Underline.BorderSizePixel = 0
		Underline.AnchorPoint = Vector2.new(0.5, 1)
		Underline.Position = UDim2.new(0.5, 0, 1, -1)
		Underline.Size = UDim2.new(0, 0, 0, 2)
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
			Underline.Size = UDim2.new(0, 0, 0, 2)
			Tw(Underline, {Size = UDim2.new(0.8, 0, 0, 2)}, TI.Slow)
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
				print("[ ECOHUB ] addSection '" .. tostring(sname) .. "' error: " .. tostring(result))
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

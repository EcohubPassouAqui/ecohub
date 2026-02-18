local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TextService      = game:GetService("TextService")

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

local function Err(msg)
	print("[ecohub ERROR] " .. tostring(msg))
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
	["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
	["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
	["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
	["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
	["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
	["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
	["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
	["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
	["lucide-align-justify"] = "rbxassetid://10709759610",
	["lucide-align-left"] = "rbxassetid://10709759764",
	["lucide-align-right"] = "rbxassetid://10709759895",
	["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
	["lucide-align-start-vertical"] = "rbxassetid://10709760244",
	["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
	["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
	["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
	["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
	["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
	["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
	["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
	["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
	["lucide-anchor"] = "rbxassetid://10709761530",
	["lucide-angry"] = "rbxassetid://10709761629",
	["lucide-annoyed"] = "rbxassetid://10709761722",
	["lucide-aperture"] = "rbxassetid://10709761813",
	["lucide-apple"] = "rbxassetid://10709761889",
	["lucide-archive"] = "rbxassetid://10709762233",
	["lucide-archive-restore"] = "rbxassetid://10709762058",
	["lucide-armchair"] = "rbxassetid://10709762327",
	["lucide-arrow-big-down"] = "rbxassetid://10747796644",
	["lucide-arrow-big-left"] = "rbxassetid://10709762574",
	["lucide-arrow-big-right"] = "rbxassetid://10709762727",
	["lucide-arrow-big-up"] = "rbxassetid://10709762879",
	["lucide-arrow-down"] = "rbxassetid://10709767827",
	["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
	["lucide-arrow-down-left"] = "rbxassetid://10709767656",
	["lucide-arrow-down-right"] = "rbxassetid://10709767750",
	["lucide-arrow-left"] = "rbxassetid://10709768114",
	["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
	["lucide-arrow-left-right"] = "rbxassetid://10709768019",
	["lucide-arrow-right"] = "rbxassetid://10709768347",
	["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
	["lucide-arrow-up"] = "rbxassetid://10709768939",
	["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
	["lucide-arrow-up-down"] = "rbxassetid://10709768538",
	["lucide-arrow-up-left"] = "rbxassetid://10709768661",
	["lucide-arrow-up-right"] = "rbxassetid://10709768787",
	["lucide-asterisk"] = "rbxassetid://10709769095",
	["lucide-at-sign"] = "rbxassetid://10709769286",
	["lucide-award"] = "rbxassetid://10709769406",
	["lucide-axe"] = "rbxassetid://10709769508",
	["lucide-axis-3d"] = "rbxassetid://10709769598",
	["lucide-baby"] = "rbxassetid://10709769732",
	["lucide-backpack"] = "rbxassetid://10709769841",
	["lucide-baggage-claim"] = "rbxassetid://10709769935",
	["lucide-banana"] = "rbxassetid://10709770005",
	["lucide-banknote"] = "rbxassetid://10709770178",
	["lucide-bar-chart"] = "rbxassetid://10709773755",
	["lucide-bar-chart-2"] = "rbxassetid://10709770317",
	["lucide-bar-chart-3"] = "rbxassetid://10709770431",
	["lucide-bar-chart-4"] = "rbxassetid://10709770560",
	["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
	["lucide-barcode"] = "rbxassetid://10747360675",
	["lucide-baseline"] = "rbxassetid://10709773863",
	["lucide-bath"] = "rbxassetid://10709773963",
	["lucide-battery"] = "rbxassetid://10709774640",
	["lucide-battery-charging"] = "rbxassetid://10709774068",
	["lucide-battery-full"] = "rbxassetid://10709774206",
	["lucide-battery-low"] = "rbxassetid://10709774370",
	["lucide-battery-medium"] = "rbxassetid://10709774513",
	["lucide-beaker"] = "rbxassetid://10709774756",
	["lucide-bed"] = "rbxassetid://10709775036",
	["lucide-bed-double"] = "rbxassetid://10709774864",
	["lucide-bed-single"] = "rbxassetid://10709774968",
	["lucide-beer"] = "rbxassetid://10709775167",
	["lucide-bell"] = "rbxassetid://10709775704",
	["lucide-bell-minus"] = "rbxassetid://10709775241",
	["lucide-bell-off"] = "rbxassetid://10709775320",
	["lucide-bell-plus"] = "rbxassetid://10709775448",
	["lucide-bell-ring"] = "rbxassetid://10709775560",
	["lucide-bike"] = "rbxassetid://10709775894",
	["lucide-binary"] = "rbxassetid://10709776050",
	["lucide-bitcoin"] = "rbxassetid://10709776126",
	["lucide-bluetooth"] = "rbxassetid://10709776655",
	["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
	["lucide-bluetooth-off"] = "rbxassetid://10709776344",
	["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
	["lucide-bold"] = "rbxassetid://10747813908",
	["lucide-bomb"] = "rbxassetid://10709781460",
	["lucide-bone"] = "rbxassetid://10709781605",
	["lucide-book"] = "rbxassetid://10709781824",
	["lucide-book-open"] = "rbxassetid://10709781717",
	["lucide-bookmark"] = "rbxassetid://10709782154",
	["lucide-bookmark-minus"] = "rbxassetid://10709781919",
	["lucide-bookmark-plus"] = "rbxassetid://10709782044",
	["lucide-bot"] = "rbxassetid://10709782230",
	["lucide-box"] = "rbxassetid://10709782497",
	["lucide-box-select"] = "rbxassetid://10709782342",
	["lucide-boxes"] = "rbxassetid://10709782582",
	["lucide-briefcase"] = "rbxassetid://10709782662",
	["lucide-brush"] = "rbxassetid://10709782758",
	["lucide-bug"] = "rbxassetid://10709782845",
	["lucide-building"] = "rbxassetid://10709783051",
	["lucide-building-2"] = "rbxassetid://10709782939",
	["lucide-bus"] = "rbxassetid://10709783137",
	["lucide-cake"] = "rbxassetid://10709783217",
	["lucide-calculator"] = "rbxassetid://10709783311",
	["lucide-calendar"] = "rbxassetid://10709789505",
	["lucide-calendar-check"] = "rbxassetid://10709783474",
	["lucide-calendar-check-2"] = "rbxassetid://10709783392",
	["lucide-calendar-clock"] = "rbxassetid://10709783577",
	["lucide-calendar-days"] = "rbxassetid://10709783673",
	["lucide-calendar-heart"] = "rbxassetid://10709783835",
	["lucide-calendar-minus"] = "rbxassetid://10709783959",
	["lucide-calendar-off"] = "rbxassetid://10709788784",
	["lucide-calendar-plus"] = "rbxassetid://10709788937",
	["lucide-calendar-range"] = "rbxassetid://10709789053",
	["lucide-calendar-search"] = "rbxassetid://10709789200",
	["lucide-calendar-x"] = "rbxassetid://10709789407",
	["lucide-calendar-x-2"] = "rbxassetid://10709789329",
	["lucide-camera"] = "rbxassetid://10709789686",
	["lucide-camera-off"] = "rbxassetid://10747822677",
	["lucide-car"] = "rbxassetid://10709789810",
	["lucide-carrot"] = "rbxassetid://10709789960",
	["lucide-cast"] = "rbxassetid://10709790097",
	["lucide-charge"] = "rbxassetid://10709790202",
	["lucide-check"] = "rbxassetid://10709790644",
	["lucide-check-circle"] = "rbxassetid://10709790387",
	["lucide-check-circle-2"] = "rbxassetid://10709790298",
	["lucide-check-square"] = "rbxassetid://10709790537",
	["lucide-chef-hat"] = "rbxassetid://10709790757",
	["lucide-cherry"] = "rbxassetid://10709790875",
	["lucide-chevron-down"] = "rbxassetid://10709790948",
	["lucide-chevron-first"] = "rbxassetid://10709791015",
	["lucide-chevron-last"] = "rbxassetid://10709791130",
	["lucide-chevron-left"] = "rbxassetid://10709791281",
	["lucide-chevron-right"] = "rbxassetid://10709791437",
	["lucide-chevron-up"] = "rbxassetid://10709791523",
	["lucide-chevrons-down"] = "rbxassetid://10709796864",
	["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
	["lucide-chevrons-left"] = "rbxassetid://10709797151",
	["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
	["lucide-chevrons-right"] = "rbxassetid://10709797382",
	["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
	["lucide-chevrons-up"] = "rbxassetid://10709797622",
	["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
	["lucide-chrome"] = "rbxassetid://10709797725",
	["lucide-circle"] = "rbxassetid://10709798174",
	["lucide-circle-dot"] = "rbxassetid://10709797837",
	["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
	["lucide-circle-slashed"] = "rbxassetid://10709798100",
	["lucide-citrus"] = "rbxassetid://10709798276",
	["lucide-clapperboard"] = "rbxassetid://10709798350",
	["lucide-clipboard"] = "rbxassetid://10709799288",
	["lucide-clipboard-check"] = "rbxassetid://10709798443",
	["lucide-clipboard-copy"] = "rbxassetid://10709798574",
	["lucide-clipboard-edit"] = "rbxassetid://10709798682",
	["lucide-clipboard-list"] = "rbxassetid://10709798792",
	["lucide-clipboard-signature"] = "rbxassetid://10709798890",
	["lucide-clipboard-type"] = "rbxassetid://10709798999",
	["lucide-clipboard-x"] = "rbxassetid://10709799124",
	["lucide-clock"] = "rbxassetid://10709805144",
	["lucide-clock-1"] = "rbxassetid://10709799535",
	["lucide-clock-10"] = "rbxassetid://10709799718",
	["lucide-clock-11"] = "rbxassetid://10709799818",
	["lucide-clock-12"] = "rbxassetid://10709799962",
	["lucide-clock-2"] = "rbxassetid://10709803876",
	["lucide-clock-3"] = "rbxassetid://10709803989",
	["lucide-clock-4"] = "rbxassetid://10709804164",
	["lucide-clock-5"] = "rbxassetid://10709804291",
	["lucide-clock-6"] = "rbxassetid://10709804435",
	["lucide-clock-7"] = "rbxassetid://10709804599",
	["lucide-clock-8"] = "rbxassetid://10709804784",
	["lucide-clock-9"] = "rbxassetid://10709804996",
	["lucide-cloud"] = "rbxassetid://10709806740",
	["lucide-cloud-cog"] = "rbxassetid://10709805262",
	["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
	["lucide-cloud-fog"] = "rbxassetid://10709805477",
	["lucide-cloud-hail"] = "rbxassetid://10709805596",
	["lucide-cloud-lightning"] = "rbxassetid://10709805727",
	["lucide-cloud-moon"] = "rbxassetid://10709805942",
	["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
	["lucide-cloud-off"] = "rbxassetid://10709806060",
	["lucide-cloud-rain"] = "rbxassetid://10709806277",
	["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
	["lucide-cloud-snow"] = "rbxassetid://10709806374",
	["lucide-cloud-sun"] = "rbxassetid://10709806631",
	["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
	["lucide-cloudy"] = "rbxassetid://10709806859",
	["lucide-clover"] = "rbxassetid://10709806995",
	["lucide-code"] = "rbxassetid://10709810463",
	["lucide-code-2"] = "rbxassetid://10709807111",
	["lucide-codepen"] = "rbxassetid://10709810534",
	["lucide-codesandbox"] = "rbxassetid://10709810676",
	["lucide-coffee"] = "rbxassetid://10709810814",
	["lucide-cog"] = "rbxassetid://10709810948",
	["lucide-coins"] = "rbxassetid://10709811110",
	["lucide-columns"] = "rbxassetid://10709811261",
	["lucide-command"] = "rbxassetid://10709811365",
	["lucide-compass"] = "rbxassetid://10709811445",
	["lucide-component"] = "rbxassetid://10709811595",
	["lucide-concierge-bell"] = "rbxassetid://10709811706",
	["lucide-connection"] = "rbxassetid://10747361219",
	["lucide-contact"] = "rbxassetid://10709811834",
	["lucide-contrast"] = "rbxassetid://10709811939",
	["lucide-cookie"] = "rbxassetid://10709812067",
	["lucide-copy"] = "rbxassetid://10709812159",
	["lucide-copyleft"] = "rbxassetid://10709812251",
	["lucide-copyright"] = "rbxassetid://10709812311",
	["lucide-corner-down-left"] = "rbxassetid://10709812396",
	["lucide-corner-down-right"] = "rbxassetid://10709812485",
	["lucide-corner-left-down"] = "rbxassetid://10709812632",
	["lucide-corner-left-up"] = "rbxassetid://10709812784",
	["lucide-corner-right-down"] = "rbxassetid://10709812939",
	["lucide-corner-right-up"] = "rbxassetid://10709813094",
	["lucide-corner-up-left"] = "rbxassetid://10709813185",
	["lucide-corner-up-right"] = "rbxassetid://10709813281",
	["lucide-cpu"] = "rbxassetid://10709813383",
	["lucide-croissant"] = "rbxassetid://10709818125",
	["lucide-crop"] = "rbxassetid://10709818245",
	["lucide-cross"] = "rbxassetid://10709818399",
	["lucide-crosshair"] = "rbxassetid://10709818534",
	["lucide-crown"] = "rbxassetid://10709818626",
	["lucide-cup-soda"] = "rbxassetid://10709818763",
	["lucide-curly-braces"] = "rbxassetid://10709818847",
	["lucide-currency"] = "rbxassetid://10709818931",
	["lucide-database"] = "rbxassetid://10709818996",
	["lucide-delete"] = "rbxassetid://10709819059",
	["lucide-diamond"] = "rbxassetid://10709819149",
	["lucide-dice-1"] = "rbxassetid://10709819266",
	["lucide-dice-2"] = "rbxassetid://10709819361",
	["lucide-dice-3"] = "rbxassetid://10709819508",
	["lucide-dice-4"] = "rbxassetid://10709819670",
	["lucide-dice-5"] = "rbxassetid://10709819801",
	["lucide-dice-6"] = "rbxassetid://10709819896",
	["lucide-dices"] = "rbxassetid://10723343321",
	["lucide-diff"] = "rbxassetid://10723343416",
	["lucide-disc"] = "rbxassetid://10723343537",
	["lucide-divide"] = "rbxassetid://10723343805",
	["lucide-divide-circle"] = "rbxassetid://10723343636",
	["lucide-divide-square"] = "rbxassetid://10723343737",
	["lucide-dollar-sign"] = "rbxassetid://10723343958",
	["lucide-download"] = "rbxassetid://10723344270",
	["lucide-download-cloud"] = "rbxassetid://10723344088",
	["lucide-droplet"] = "rbxassetid://10723344432",
	["lucide-droplets"] = "rbxassetid://10734883356",
	["lucide-drumstick"] = "rbxassetid://10723344737",
	["lucide-edit"] = "rbxassetid://10734883598",
	["lucide-edit-2"] = "rbxassetid://10723344885",
	["lucide-edit-3"] = "rbxassetid://10723345088",
	["lucide-egg"] = "rbxassetid://10723345518",
	["lucide-egg-fried"] = "rbxassetid://10723345347",
	["lucide-electricity"] = "rbxassetid://10723345749",
	["lucide-electricity-off"] = "rbxassetid://10723345643",
	["lucide-equal"] = "rbxassetid://10723345990",
	["lucide-equal-not"] = "rbxassetid://10723345866",
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
	["lucide-file-archive"] = "rbxassetid://10723354921",
	["lucide-file-audio"] = "rbxassetid://10723355148",
	["lucide-file-audio-2"] = "rbxassetid://10723355026",
	["lucide-file-axis-3d"] = "rbxassetid://10723355272",
	["lucide-file-badge"] = "rbxassetid://10723355622",
	["lucide-file-badge-2"] = "rbxassetid://10723355451",
	["lucide-file-bar-chart"] = "rbxassetid://10723355887",
	["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
	["lucide-file-box"] = "rbxassetid://10723355989",
	["lucide-file-check"] = "rbxassetid://10723356210",
	["lucide-file-check-2"] = "rbxassetid://10723356100",
	["lucide-file-clock"] = "rbxassetid://10723356329",
	["lucide-file-code"] = "rbxassetid://10723356507",
	["lucide-file-cog"] = "rbxassetid://10723356830",
	["lucide-file-cog-2"] = "rbxassetid://10723356676",
	["lucide-file-diff"] = "rbxassetid://10723357039",
	["lucide-file-digit"] = "rbxassetid://10723357151",
	["lucide-file-down"] = "rbxassetid://10723357322",
	["lucide-file-edit"] = "rbxassetid://10723357495",
	["lucide-file-heart"] = "rbxassetid://10723357637",
	["lucide-file-image"] = "rbxassetid://10723357790",
	["lucide-file-input"] = "rbxassetid://10723357933",
	["lucide-file-json"] = "rbxassetid://10723364435",
	["lucide-file-json-2"] = "rbxassetid://10723364361",
	["lucide-file-key"] = "rbxassetid://10723364605",
	["lucide-file-key-2"] = "rbxassetid://10723364515",
	["lucide-file-line-chart"] = "rbxassetid://10723364725",
	["lucide-file-lock"] = "rbxassetid://10723364957",
	["lucide-file-lock-2"] = "rbxassetid://10723364861",
	["lucide-file-minus"] = "rbxassetid://10723365254",
	["lucide-file-minus-2"] = "rbxassetid://10723365086",
	["lucide-file-output"] = "rbxassetid://10723365457",
	["lucide-file-pie-chart"] = "rbxassetid://10723365598",
	["lucide-file-plus"] = "rbxassetid://10723365877",
	["lucide-file-plus-2"] = "rbxassetid://10723365766",
	["lucide-file-question"] = "rbxassetid://10723365987",
	["lucide-file-scan"] = "rbxassetid://10723366167",
	["lucide-file-search"] = "rbxassetid://10723366550",
	["lucide-file-search-2"] = "rbxassetid://10723366340",
	["lucide-file-signature"] = "rbxassetid://10723366741",
	["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
	["lucide-file-symlink"] = "rbxassetid://10723367098",
	["lucide-file-terminal"] = "rbxassetid://10723367244",
	["lucide-file-text"] = "rbxassetid://10723367380",
	["lucide-file-type"] = "rbxassetid://10723367606",
	["lucide-file-type-2"] = "rbxassetid://10723367509",
	["lucide-file-up"] = "rbxassetid://10723367734",
	["lucide-file-video"] = "rbxassetid://10723373884",
	["lucide-file-video-2"] = "rbxassetid://10723367834",
	["lucide-file-volume"] = "rbxassetid://10723374172",
	["lucide-file-volume-2"] = "rbxassetid://10723374030",
	["lucide-file-warning"] = "rbxassetid://10723374276",
	["lucide-file-x"] = "rbxassetid://10723374544",
	["lucide-file-x-2"] = "rbxassetid://10723374378",
	["lucide-files"] = "rbxassetid://10723374759",
	["lucide-film"] = "rbxassetid://10723374981",
	["lucide-filter"] = "rbxassetid://10723375128",
	["lucide-fingerprint"] = "rbxassetid://10723375250",
	["lucide-flag"] = "rbxassetid://10723375890",
	["lucide-flag-off"] = "rbxassetid://10723375443",
	["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
	["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
	["lucide-flame"] = "rbxassetid://10723376114",
	["lucide-flashlight"] = "rbxassetid://10723376471",
	["lucide-flashlight-off"] = "rbxassetid://10723376365",
	["lucide-flask-conical"] = "rbxassetid://10734883986",
	["lucide-flask-round"] = "rbxassetid://10723376614",
	["lucide-flip-horizontal"] = "rbxassetid://10723376884",
	["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
	["lucide-flip-vertical"] = "rbxassetid://10723377138",
	["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
	["lucide-flower"] = "rbxassetid://10747830374",
	["lucide-flower-2"] = "rbxassetid://10723377305",
	["lucide-focus"] = "rbxassetid://10723377537",
	["lucide-folder"] = "rbxassetid://10723387563",
	["lucide-folder-archive"] = "rbxassetid://10723384478",
	["lucide-folder-check"] = "rbxassetid://10723384605",
	["lucide-folder-clock"] = "rbxassetid://10723384731",
	["lucide-folder-closed"] = "rbxassetid://10723384893",
	["lucide-folder-cog"] = "rbxassetid://10723385213",
	["lucide-folder-cog-2"] = "rbxassetid://10723385036",
	["lucide-folder-down"] = "rbxassetid://10723385338",
	["lucide-folder-edit"] = "rbxassetid://10723385445",
	["lucide-folder-heart"] = "rbxassetid://10723385545",
	["lucide-folder-input"] = "rbxassetid://10723385721",
	["lucide-folder-key"] = "rbxassetid://10723385848",
	["lucide-folder-lock"] = "rbxassetid://10723386005",
	["lucide-folder-minus"] = "rbxassetid://10723386127",
	["lucide-folder-open"] = "rbxassetid://10723386277",
	["lucide-folder-output"] = "rbxassetid://10723386386",
	["lucide-folder-plus"] = "rbxassetid://10723386531",
	["lucide-folder-search"] = "rbxassetid://10723386787",
	["lucide-folder-search-2"] = "rbxassetid://10723386674",
	["lucide-folder-symlink"] = "rbxassetid://10723386930",
	["lucide-folder-tree"] = "rbxassetid://10723387085",
	["lucide-folder-up"] = "rbxassetid://10723387265",
	["lucide-folder-x"] = "rbxassetid://10723387448",
	["lucide-folders"] = "rbxassetid://10723387721",
	["lucide-form-input"] = "rbxassetid://10723387841",
	["lucide-forward"] = "rbxassetid://10723388016",
	["lucide-frame"] = "rbxassetid://10723394389",
	["lucide-framer"] = "rbxassetid://10723394565",
	["lucide-frown"] = "rbxassetid://10723394681",
	["lucide-fuel"] = "rbxassetid://10723394846",
	["lucide-function-square"] = "rbxassetid://10723395041",
	["lucide-gamepad"] = "rbxassetid://10723395457",
	["lucide-gamepad-2"] = "rbxassetid://10723395215",
	["lucide-gauge"] = "rbxassetid://10723395708",
	["lucide-gavel"] = "rbxassetid://10723395896",
	["lucide-gem"] = "rbxassetid://10723396000",
	["lucide-ghost"] = "rbxassetid://10723396107",
	["lucide-gift"] = "rbxassetid://10723396402",
	["lucide-gift-card"] = "rbxassetid://10723396225",
	["lucide-git-branch"] = "rbxassetid://10723396676",
	["lucide-git-branch-plus"] = "rbxassetid://10723396542",
	["lucide-git-commit"] = "rbxassetid://10723396812",
	["lucide-git-compare"] = "rbxassetid://10723396954",
	["lucide-git-fork"] = "rbxassetid://10723397049",
	["lucide-git-merge"] = "rbxassetid://10723397165",
	["lucide-git-pull-request"] = "rbxassetid://10723397431",
	["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
	["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
	["lucide-glass"] = "rbxassetid://10723397788",
	["lucide-glass-2"] = "rbxassetid://10723397529",
	["lucide-glass-water"] = "rbxassetid://10723397678",
	["lucide-glasses"] = "rbxassetid://10723397895",
	["lucide-globe"] = "rbxassetid://10723404337",
	["lucide-globe-2"] = "rbxassetid://10723398002",
	["lucide-grab"] = "rbxassetid://10723404472",
	["lucide-graduation-cap"] = "rbxassetid://10723404691",
	["lucide-grape"] = "rbxassetid://10723404822",
	["lucide-grid"] = "rbxassetid://10723404936",
	["lucide-grip-horizontal"] = "rbxassetid://10723405089",
	["lucide-grip-vertical"] = "rbxassetid://10723405236",
	["lucide-hammer"] = "rbxassetid://10723405360",
	["lucide-hand"] = "rbxassetid://10723405649",
	["lucide-hand-metal"] = "rbxassetid://10723405508",
	["lucide-hard-drive"] = "rbxassetid://10723405749",
	["lucide-hard-hat"] = "rbxassetid://10723405859",
	["lucide-hash"] = "rbxassetid://10723405975",
	["lucide-haze"] = "rbxassetid://10723406078",
	["lucide-headphones"] = "rbxassetid://10723406165",
	["lucide-heart"] = "rbxassetid://10723406885",
	["lucide-heart-crack"] = "rbxassetid://10723406299",
	["lucide-heart-handshake"] = "rbxassetid://10723406480",
	["lucide-heart-off"] = "rbxassetid://10723406662",
	["lucide-heart-pulse"] = "rbxassetid://10723406795",
	["lucide-help-circle"] = "rbxassetid://10723406988",
	["lucide-hexagon"] = "rbxassetid://10723407092",
	["lucide-highlighter"] = "rbxassetid://10723407192",
	["lucide-history"] = "rbxassetid://10723407335",
	["lucide-home"] = "rbxassetid://10723407389",
	["lucide-hourglass"] = "rbxassetid://10723407498",
	["lucide-ice-cream"] = "rbxassetid://10723414308",
	["lucide-image"] = "rbxassetid://10723415040",
	["lucide-image-minus"] = "rbxassetid://10723414487",
	["lucide-image-off"] = "rbxassetid://10723414677",
	["lucide-image-plus"] = "rbxassetid://10723414827",
	["lucide-import"] = "rbxassetid://10723415205",
	["lucide-inbox"] = "rbxassetid://10723415335",
	["lucide-indent"] = "rbxassetid://10723415494",
	["lucide-indian-rupee"] = "rbxassetid://10723415642",
	["lucide-infinity"] = "rbxassetid://10723415766",
	["lucide-info"] = "rbxassetid://10723415903",
	["lucide-inspect"] = "rbxassetid://10723416057",
	["lucide-italic"] = "rbxassetid://10723416195",
	["lucide-japanese-yen"] = "rbxassetid://10723416363",
	["lucide-joystick"] = "rbxassetid://10723416527",
	["lucide-key"] = "rbxassetid://10723416652",
	["lucide-keyboard"] = "rbxassetid://10723416765",
	["lucide-lamp"] = "rbxassetid://10723417513",
	["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
	["lucide-lamp-desk"] = "rbxassetid://10723417016",
	["lucide-lamp-floor"] = "rbxassetid://10723417131",
	["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
	["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
	["lucide-landmark"] = "rbxassetid://10723417608",
	["lucide-languages"] = "rbxassetid://10723417703",
	["lucide-laptop"] = "rbxassetid://10723423881",
	["lucide-laptop-2"] = "rbxassetid://10723417797",
	["lucide-lasso"] = "rbxassetid://10723424235",
	["lucide-lasso-select"] = "rbxassetid://10723424058",
	["lucide-laugh"] = "rbxassetid://10723424372",
	["lucide-layers"] = "rbxassetid://10723424505",
	["lucide-layout"] = "rbxassetid://10723425376",
	["lucide-layout-dashboard"] = "rbxassetid://10723424646",
	["lucide-layout-grid"] = "rbxassetid://10723424838",
	["lucide-layout-list"] = "rbxassetid://10723424963",
	["lucide-layout-template"] = "rbxassetid://10723425187",
	["lucide-leaf"] = "rbxassetid://10723425539",
	["lucide-library"] = "rbxassetid://10723425615",
	["lucide-life-buoy"] = "rbxassetid://10723425685",
	["lucide-lightbulb"] = "rbxassetid://10723425852",
	["lucide-lightbulb-off"] = "rbxassetid://10723425762",
	["lucide-line-chart"] = "rbxassetid://10723426393",
	["lucide-link"] = "rbxassetid://10723426722",
	["lucide-link-2"] = "rbxassetid://10723426595",
	["lucide-link-2-off"] = "rbxassetid://10723426513",
	["lucide-list"] = "rbxassetid://10723433811",
	["lucide-list-checks"] = "rbxassetid://10734884548",
	["lucide-list-end"] = "rbxassetid://10723426886",
	["lucide-list-minus"] = "rbxassetid://10723426986",
	["lucide-list-music"] = "rbxassetid://10723427081",
	["lucide-list-ordered"] = "rbxassetid://10723427199",
	["lucide-list-plus"] = "rbxassetid://10723427334",
	["lucide-list-start"] = "rbxassetid://10723427494",
	["lucide-list-video"] = "rbxassetid://10723427619",
	["lucide-list-x"] = "rbxassetid://10723433655",
	["lucide-loader"] = "rbxassetid://10723434070",
	["lucide-loader-2"] = "rbxassetid://10723433935",
	["lucide-locate"] = "rbxassetid://10723434557",
	["lucide-locate-fixed"] = "rbxassetid://10723434236",
	["lucide-locate-off"] = "rbxassetid://10723434379",
	["lucide-lock"] = "rbxassetid://10723434711",
	["lucide-log-in"] = "rbxassetid://10723434830",
	["lucide-log-out"] = "rbxassetid://10723434906",
	["lucide-luggage"] = "rbxassetid://10723434993",
	["lucide-magnet"] = "rbxassetid://10723435069",
	["lucide-mail"] = "rbxassetid://10734885430",
	["lucide-mail-check"] = "rbxassetid://10723435182",
	["lucide-mail-minus"] = "rbxassetid://10723435261",
	["lucide-mail-open"] = "rbxassetid://10723435342",
	["lucide-mail-plus"] = "rbxassetid://10723435443",
	["lucide-mail-question"] = "rbxassetid://10723435515",
	["lucide-mail-search"] = "rbxassetid://10734884739",
	["lucide-mail-warning"] = "rbxassetid://10734885015",
	["lucide-mail-x"] = "rbxassetid://10734885247",
	["lucide-mails"] = "rbxassetid://10734885614",
	["lucide-map"] = "rbxassetid://10734886202",
	["lucide-map-pin"] = "rbxassetid://10734886004",
	["lucide-map-pin-off"] = "rbxassetid://10734885803",
	["lucide-maximize"] = "rbxassetid://10734886735",
	["lucide-maximize-2"] = "rbxassetid://10734886496",
	["lucide-medal"] = "rbxassetid://10734887072",
	["lucide-megaphone"] = "rbxassetid://10734887454",
	["lucide-megaphone-off"] = "rbxassetid://10734887311",
	["lucide-meh"] = "rbxassetid://10734887603",
	["lucide-menu"] = "rbxassetid://10734887784",
	["lucide-message-circle"] = "rbxassetid://10734888000",
	["lucide-message-square"] = "rbxassetid://10734888228",
	["lucide-mic"] = "rbxassetid://10734888864",
	["lucide-mic-2"] = "rbxassetid://10734888430",
	["lucide-mic-off"] = "rbxassetid://10734888646",
	["lucide-microscope"] = "rbxassetid://10734889106",
	["lucide-microwave"] = "rbxassetid://10734895076",
	["lucide-milestone"] = "rbxassetid://10734895310",
	["lucide-minimize"] = "rbxassetid://10734895698",
	["lucide-minimize-2"] = "rbxassetid://10734895530",
	["lucide-minus"] = "rbxassetid://10734896206",
	["lucide-minus-circle"] = "rbxassetid://10734895856",
	["lucide-minus-square"] = "rbxassetid://10734896029",
	["lucide-monitor"] = "rbxassetid://10734896881",
	["lucide-monitor-off"] = "rbxassetid://10734896360",
	["lucide-monitor-speaker"] = "rbxassetid://10734896512",
	["lucide-moon"] = "rbxassetid://10734897102",
	["lucide-more-horizontal"] = "rbxassetid://10734897250",
	["lucide-more-vertical"] = "rbxassetid://10734897387",
	["lucide-mountain"] = "rbxassetid://10734897956",
	["lucide-mountain-snow"] = "rbxassetid://10734897665",
	["lucide-mouse"] = "rbxassetid://10734898592",
	["lucide-mouse-pointer"] = "rbxassetid://10734898476",
	["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
	["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
	["lucide-move"] = "rbxassetid://10734900011",
	["lucide-move-3d"] = "rbxassetid://10734898756",
	["lucide-move-diagonal"] = "rbxassetid://10734899164",
	["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
	["lucide-move-horizontal"] = "rbxassetid://10734899414",
	["lucide-move-vertical"] = "rbxassetid://10734899821",
	["lucide-music"] = "rbxassetid://10734905958",
	["lucide-music-2"] = "rbxassetid://10734900215",
	["lucide-music-3"] = "rbxassetid://10734905665",
	["lucide-music-4"] = "rbxassetid://10734905823",
	["lucide-navigation"] = "rbxassetid://10734906744",
	["lucide-navigation-2"] = "rbxassetid://10734906332",
	["lucide-navigation-2-off"] = "rbxassetid://10734906144",
	["lucide-navigation-off"] = "rbxassetid://10734906580",
	["lucide-network"] = "rbxassetid://10734906975",
	["lucide-newspaper"] = "rbxassetid://10734907168",
	["lucide-octagon"] = "rbxassetid://10734907361",
	["lucide-option"] = "rbxassetid://10734907649",
	["lucide-outdent"] = "rbxassetid://10734907933",
	["lucide-package"] = "rbxassetid://10734909540",
	["lucide-package-2"] = "rbxassetid://10734908151",
	["lucide-package-check"] = "rbxassetid://10734908384",
	["lucide-package-minus"] = "rbxassetid://10734908626",
	["lucide-package-open"] = "rbxassetid://10734908793",
	["lucide-package-plus"] = "rbxassetid://10734909016",
	["lucide-package-search"] = "rbxassetid://10734909196",
	["lucide-package-x"] = "rbxassetid://10734909375",
	["lucide-paint-bucket"] = "rbxassetid://10734909847",
	["lucide-paintbrush"] = "rbxassetid://10734910187",
	["lucide-paintbrush-2"] = "rbxassetid://10734910030",
	["lucide-palette"] = "rbxassetid://10734910430",
	["lucide-palmtree"] = "rbxassetid://10734910680",
	["lucide-paperclip"] = "rbxassetid://10734910927",
	["lucide-party-popper"] = "rbxassetid://10734918735",
	["lucide-pause"] = "rbxassetid://10734919336",
	["lucide-pause-circle"] = "rbxassetid://10735024209",
	["lucide-pause-octagon"] = "rbxassetid://10734919143",
	["lucide-pen-tool"] = "rbxassetid://10734919503",
	["lucide-pencil"] = "rbxassetid://10734919691",
	["lucide-percent"] = "rbxassetid://10734919919",
	["lucide-person-standing"] = "rbxassetid://10734920149",
	["lucide-phone"] = "rbxassetid://10734921524",
	["lucide-phone-call"] = "rbxassetid://10734920305",
	["lucide-phone-forwarded"] = "rbxassetid://10734920508",
	["lucide-phone-incoming"] = "rbxassetid://10734920694",
	["lucide-phone-missed"] = "rbxassetid://10734920845",
	["lucide-phone-off"] = "rbxassetid://10734921077",
	["lucide-phone-outgoing"] = "rbxassetid://10734921288",
	["lucide-pie-chart"] = "rbxassetid://10734921727",
	["lucide-piggy-bank"] = "rbxassetid://10734921935",
	["lucide-pin"] = "rbxassetid://10734922324",
	["lucide-pin-off"] = "rbxassetid://10734922180",
	["lucide-pipette"] = "rbxassetid://10734922497",
	["lucide-pizza"] = "rbxassetid://10734922774",
	["lucide-plane"] = "rbxassetid://10734922971",
	["lucide-play"] = "rbxassetid://10734923549",
	["lucide-play-circle"] = "rbxassetid://10734923214",
	["lucide-plus"] = "rbxassetid://10734924532",
	["lucide-plus-circle"] = "rbxassetid://10734923868",
	["lucide-plus-square"] = "rbxassetid://10734924219",
	["lucide-podcast"] = "rbxassetid://10734929553",
	["lucide-pointer"] = "rbxassetid://10734929723",
	["lucide-pound-sterling"] = "rbxassetid://10734929981",
	["lucide-power"] = "rbxassetid://10734930466",
	["lucide-power-off"] = "rbxassetid://10734930257",
	["lucide-printer"] = "rbxassetid://10734930632",
	["lucide-puzzle"] = "rbxassetid://10734930886",
	["lucide-quote"] = "rbxassetid://10734931234",
	["lucide-radio"] = "rbxassetid://10734931596",
	["lucide-radio-receiver"] = "rbxassetid://10734931402",
	["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
	["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
	["lucide-recycle"] = "rbxassetid://10734932295",
	["lucide-redo"] = "rbxassetid://10734932822",
	["lucide-redo-2"] = "rbxassetid://10734932586",
	["lucide-refresh-ccw"] = "rbxassetid://10734933056",
	["lucide-refresh-cw"] = "rbxassetid://10734933222",
	["lucide-refrigerator"] = "rbxassetid://10734933465",
	["lucide-regex"] = "rbxassetid://10734933655",
	["lucide-repeat"] = "rbxassetid://10734933966",
	["lucide-repeat-1"] = "rbxassetid://10734933826",
	["lucide-reply"] = "rbxassetid://10734934252",
	["lucide-reply-all"] = "rbxassetid://10734934132",
	["lucide-rewind"] = "rbxassetid://10734934347",
	["lucide-rocket"] = "rbxassetid://10734934585",
	["lucide-rocking-chair"] = "rbxassetid://10734939942",
	["lucide-rotate-3d"] = "rbxassetid://10734940107",
	["lucide-rotate-ccw"] = "rbxassetid://10734940376",
	["lucide-rotate-cw"] = "rbxassetid://10734940654",
	["lucide-rss"] = "rbxassetid://10734940825",
	["lucide-ruler"] = "rbxassetid://10734941018",
	["lucide-russian-ruble"] = "rbxassetid://10734941199",
	["lucide-sailboat"] = "rbxassetid://10734941354",
	["lucide-save"] = "rbxassetid://10734941499",
	["lucide-scale"] = "rbxassetid://10734941912",
	["lucide-scale-3d"] = "rbxassetid://10734941739",
	["lucide-scaling"] = "rbxassetid://10734942072",
	["lucide-scan"] = "rbxassetid://10734942565",
	["lucide-scan-face"] = "rbxassetid://10734942198",
	["lucide-scan-line"] = "rbxassetid://10734942351",
	["lucide-scissors"] = "rbxassetid://10734942778",
	["lucide-screen-share"] = "rbxassetid://10734943193",
	["lucide-screen-share-off"] = "rbxassetid://10734942967",
	["lucide-scroll"] = "rbxassetid://10734943448",
	["lucide-search"] = "rbxassetid://10734943674",
	["lucide-send"] = "rbxassetid://10734943902",
	["lucide-separator-horizontal"] = "rbxassetid://10734944115",
	["lucide-separator-vertical"] = "rbxassetid://10734944326",
	["lucide-server"] = "rbxassetid://10734949856",
	["lucide-server-cog"] = "rbxassetid://10734944444",
	["lucide-server-crash"] = "rbxassetid://10734944554",
	["lucide-server-off"] = "rbxassetid://10734944668",
	["lucide-settings"] = "rbxassetid://10734950309",
	["lucide-settings-2"] = "rbxassetid://10734950020",
	["lucide-share"] = "rbxassetid://10734950813",
	["lucide-share-2"] = "rbxassetid://10734950553",
	["lucide-sheet"] = "rbxassetid://10734951038",
	["lucide-shield"] = "rbxassetid://10734951847",
	["lucide-shield-alert"] = "rbxassetid://10734951173",
	["lucide-shield-check"] = "rbxassetid://10734951367",
	["lucide-shield-close"] = "rbxassetid://10734951535",
	["lucide-shield-off"] = "rbxassetid://10734951684",
	["lucide-shirt"] = "rbxassetid://10734952036",
	["lucide-shopping-bag"] = "rbxassetid://10734952273",
	["lucide-shopping-cart"] = "rbxassetid://10734952479",
	["lucide-shovel"] = "rbxassetid://10734952773",
	["lucide-shower-head"] = "rbxassetid://10734952942",
	["lucide-shrink"] = "rbxassetid://10734953073",
	["lucide-shrub"] = "rbxassetid://10734953241",
	["lucide-shuffle"] = "rbxassetid://10734953451",
	["lucide-sidebar"] = "rbxassetid://10734954301",
	["lucide-sidebar-close"] = "rbxassetid://10734953715",
	["lucide-sidebar-open"] = "rbxassetid://10734954000",
	["lucide-sigma"] = "rbxassetid://10734954538",
	["lucide-signal"] = "rbxassetid://10734961133",
	["lucide-signal-high"] = "rbxassetid://10734954807",
	["lucide-signal-low"] = "rbxassetid://10734955080",
	["lucide-signal-medium"] = "rbxassetid://10734955336",
	["lucide-signal-zero"] = "rbxassetid://10734960878",
	["lucide-siren"] = "rbxassetid://10734961284",
	["lucide-skip-back"] = "rbxassetid://10734961526",
	["lucide-skip-forward"] = "rbxassetid://10734961809",
	["lucide-skull"] = "rbxassetid://10734962068",
	["lucide-slack"] = "rbxassetid://10734962339",
	["lucide-slash"] = "rbxassetid://10734962600",
	["lucide-slice"] = "rbxassetid://10734963024",
	["lucide-sliders"] = "rbxassetid://10734963400",
	["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
	["lucide-smartphone"] = "rbxassetid://10734963940",
	["lucide-smartphone-charging"] = "rbxassetid://10734963671",
	["lucide-smile"] = "rbxassetid://10734964441",
	["lucide-smile-plus"] = "rbxassetid://10734964188",
	["lucide-snowflake"] = "rbxassetid://10734964600",
	["lucide-sofa"] = "rbxassetid://10734964852",
	["lucide-sort-asc"] = "rbxassetid://10734965115",
	["lucide-sort-desc"] = "rbxassetid://10734965287",
	["lucide-speaker"] = "rbxassetid://10734965419",
	["lucide-sprout"] = "rbxassetid://10734965572",
	["lucide-square"] = "rbxassetid://10734965702",
	["lucide-star"] = "rbxassetid://10734966248",
	["lucide-star-half"] = "rbxassetid://10734965897",
	["lucide-star-off"] = "rbxassetid://10734966097",
	["lucide-stethoscope"] = "rbxassetid://10734966384",
	["lucide-sticker"] = "rbxassetid://10734972234",
	["lucide-sticky-note"] = "rbxassetid://10734972463",
	["lucide-stop-circle"] = "rbxassetid://10734972621",
	["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
	["lucide-stretch-vertical"] = "rbxassetid://10734973130",
	["lucide-strikethrough"] = "rbxassetid://10734973290",
	["lucide-subscript"] = "rbxassetid://10734973457",
	["lucide-sun"] = "rbxassetid://10734974297",
	["lucide-sun-dim"] = "rbxassetid://10734973645",
	["lucide-sun-medium"] = "rbxassetid://10734973778",
	["lucide-sun-moon"] = "rbxassetid://10734973999",
	["lucide-sun-snow"] = "rbxassetid://10734974130",
	["lucide-sunrise"] = "rbxassetid://10734974522",
	["lucide-sunset"] = "rbxassetid://10734974689",
	["lucide-superscript"] = "rbxassetid://10734974850",
	["lucide-swiss-franc"] = "rbxassetid://10734975024",
	["lucide-switch-camera"] = "rbxassetid://10734975214",
	["lucide-sword"] = "rbxassetid://10734975486",
	["lucide-swords"] = "rbxassetid://10734975692",
	["lucide-syringe"] = "rbxassetid://10734975932",
	["lucide-table"] = "rbxassetid://10734976230",
	["lucide-table-2"] = "rbxassetid://10734976097",
	["lucide-tablet"] = "rbxassetid://10734976394",
	["lucide-tag"] = "rbxassetid://10734976528",
	["lucide-tags"] = "rbxassetid://10734976739",
	["lucide-target"] = "rbxassetid://10734977012",
	["lucide-tent"] = "rbxassetid://10734981750",
	["lucide-terminal"] = "rbxassetid://10734982144",
	["lucide-terminal-square"] = "rbxassetid://10734981995",
	["lucide-text-cursor"] = "rbxassetid://10734982395",
	["lucide-text-cursor-input"] = "rbxassetid://10734982297",
	["lucide-thermometer"] = "rbxassetid://10734983134",
	["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
	["lucide-thermometer-sun"] = "rbxassetid://10734982771",
	["lucide-thumbs-down"] = "rbxassetid://10734983359",
	["lucide-thumbs-up"] = "rbxassetid://10734983629",
	["lucide-ticket"] = "rbxassetid://10734983868",
	["lucide-timer"] = "rbxassetid://10734984606",
	["lucide-timer-off"] = "rbxassetid://10734984138",
	["lucide-timer-reset"] = "rbxassetid://10734984355",
	["lucide-toggle-left"] = "rbxassetid://10734984834",
	["lucide-toggle-right"] = "rbxassetid://10734985040",
	["lucide-tornado"] = "rbxassetid://10734985247",
	["lucide-toy-brick"] = "rbxassetid://10747361919",
	["lucide-train"] = "rbxassetid://10747362105",
	["lucide-trash"] = "rbxassetid://10747362393",
	["lucide-trash-2"] = "rbxassetid://10747362241",
	["lucide-tree-deciduous"] = "rbxassetid://10747362534",
	["lucide-tree-pine"] = "rbxassetid://10747362748",
	["lucide-trees"] = "rbxassetid://10747363016",
	["lucide-trending-down"] = "rbxassetid://10747363205",
	["lucide-trending-up"] = "rbxassetid://10747363465",
	["lucide-triangle"] = "rbxassetid://10747363621",
	["lucide-trophy"] = "rbxassetid://10747363809",
	["lucide-truck"] = "rbxassetid://10747364031",
	["lucide-tv"] = "rbxassetid://10747364593",
	["lucide-tv-2"] = "rbxassetid://10747364302",
	["lucide-type"] = "rbxassetid://10747364761",
	["lucide-umbrella"] = "rbxassetid://10747364971",
	["lucide-underline"] = "rbxassetid://10747365191",
	["lucide-undo"] = "rbxassetid://10747365484",
	["lucide-undo-2"] = "rbxassetid://10747365359",
	["lucide-unlink"] = "rbxassetid://10747365771",
	["lucide-unlink-2"] = "rbxassetid://10747397871",
	["lucide-unlock"] = "rbxassetid://10747366027",
	["lucide-upload"] = "rbxassetid://10747366434",
	["lucide-upload-cloud"] = "rbxassetid://10747366266",
	["lucide-usb"] = "rbxassetid://10747366606",
	["lucide-user"] = "rbxassetid://10747373176",
	["lucide-user-check"] = "rbxassetid://10747371901",
	["lucide-user-cog"] = "rbxassetid://10747372167",
	["lucide-user-minus"] = "rbxassetid://10747372346",
	["lucide-user-plus"] = "rbxassetid://10747372702",
	["lucide-user-x"] = "rbxassetid://10747372992",
	["lucide-users"] = "rbxassetid://10747373426",
	["lucide-utensils"] = "rbxassetid://10747373821",
	["lucide-utensils-crossed"] = "rbxassetid://10747373629",
	["lucide-venetian-mask"] = "rbxassetid://10747374003",
	["lucide-verified"] = "rbxassetid://10747374131",
	["lucide-vibrate"] = "rbxassetid://10747374489",
	["lucide-vibrate-off"] = "rbxassetid://10747374269",
	["lucide-video"] = "rbxassetid://10747374938",
	["lucide-video-off"] = "rbxassetid://10747374721",
	["lucide-view"] = "rbxassetid://10747375132",
	["lucide-voicemail"] = "rbxassetid://10747375281",
	["lucide-volume"] = "rbxassetid://10747376008",
	["lucide-volume-1"] = "rbxassetid://10747375450",
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
	["lucide-wrap-text"] = "rbxassetid://10747383065",
	["lucide-wrench"] = "rbxassetid://10747383470",
	["lucide-x"] = "rbxassetid://10747384394",
	["lucide-x-circle"] = "rbxassetid://10747383819",
	["lucide-x-octagon"] = "rbxassetid://10747384037",
	["lucide-x-square"] = "rbxassetid://10747384217",
	["lucide-zoom-in"] = "rbxassetid://10747384552",
	["lucide-zoom-out"] = "rbxassetid://10747384679",
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

	function SecObj:addCheck(checkname, default, callback, iconName)
		local cb    = callback or function() end
		local On    = (default == true)

		local f = Base(28)

		local ChkBox, ChkFill, ChkImg, chkStroke = MakeCheckbox(f, On)

		local iconOff = 0
		if iconName then
			local ic = MkIcon(f, iconName, UDim2.new(0, 13, 0, 13), 28, 0, C.DIM, 0, 0.5)
			if ic then iconOff = 17 end
		end

		local Lbl = Instance.new("TextLabel")
		Lbl.Parent = f
		Lbl.BackgroundTransparency = 1
		Lbl.Position = UDim2.new(0, 28 + iconOff, 0, 0)
		Lbl.Size = UDim2.new(1, -(28 + iconOff + 10), 1, 0)
		Lbl.Font = Enum.Font.GothamSemibold
		Lbl.Text = checkname or "Check"
		Lbl.TextColor3 = On and C.TEXT or C.DIM
		Lbl.TextSize = 11
		Lbl.TextXAlignment = Enum.TextXAlignment.Left

		local function UpdateVisuals()
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
				print("[ecohub ERROR] Check '" .. tostring(checkname) .. "': " .. tostring(e))
			end
		end)

		UpdateVisuals()

		local ctrl = {}
		function ctrl:Set(v)
			On = v == true
			UpdateVisuals()
			local ok, e = pcall(cb, On)
			if not ok then
				print("[ecohub ERROR] Check:Set: " .. tostring(e))
			end
		end
		function ctrl:Get() return On end
		RegOption(ctrl, "Check")
		return ctrl
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
		RegOption(ctrl, "Slider")
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

		local ctrl = {}
		function ctrl:Get()
			return tostring(Input.Text)
		end
		function ctrl:Set(v)
			Input.Text = tostring(v or "")
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
		RegOption(ctrl, "Dropdown")
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
			return false, "invalid name"
		end
		local data = { objects = {} }
		local opts = Library.Options or {}
		for idx, opt in next, opts do
			if SaveIgnore[idx] then continue end
			local t = opt.Type
			local v = opt:Get()
			if t == "Check" then
				table.insert(data.objects, { type = "Check", idx = idx, value = v })
			elseif t == "Slider" then
				table.insert(data.objects, { type = "Slider", idx = idx, value = v })
			elseif t == "Dropdown" then
				table.insert(data.objects, { type = "Dropdown", idx = idx, value = v })
			elseif t == "ColorPicker" then
				if v then
					table.insert(data.objects, { type = "ColorPicker", idx = idx, value = string.format("%02X%02X%02X", math.floor(v.R*255), math.floor(v.G*255), math.floor(v.B*255)) })
				end
			elseif t == "Keybind" then
				if v then
					table.insert(data.objects, { type = "Keybind", idx = idx, value = v.Name })
				end
			elseif t == "TextBox" then
				table.insert(data.objects, { type = "TextBox", idx = idx, value = v })
			end
		end
		local ok2, encoded = pcall(function() return HttpService:JSONEncode(data) end)
		if not ok2 then return false, "encode failed" end
		local ok3, err3 = pcall(writefile, ConfigSettingsFolder .. "/" .. name .. ".json", encoded)
		if not ok3 then return false, "writefile: " .. tostring(err3) end
		return true
	end

	local function LoadConfig(name)
		if not name then return false, "invalid name" end
		local path = ConfigSettingsFolder .. "/" .. name .. ".json"
		local ok, content = pcall(readfile, path)
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
							tonumber("0x"..obj.value:sub(1,2)),
							tonumber("0x"..obj.value:sub(3,4)),
							tonumber("0x"..obj.value:sub(5,6))
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
	Main.Size = UDim2.new(0, 520, 0, 340)
	Main.ClipsDescendants = true
	Corner(Main, 8)
	MkStroke(Main)

	local TitleBar = Instance.new("Frame")
	TitleBar.Parent = Main
	TitleBar.BackgroundColor3 = C.SIDEBAR
	TitleBar.BorderSizePixel = 0
	TitleBar.Position = UDim2.new(0, 0, 0, 0)
	TitleBar.Size = UDim2.new(1, 0, 0, 32)
	TitleBar.ZIndex = 2

	local TitleBarCornerFix = Instance.new("Frame")
	TitleBarCornerFix.Parent = TitleBar
	TitleBarCornerFix.BackgroundColor3 = C.SIDEBAR
	TitleBarCornerFix.BorderSizePixel = 0
	TitleBarCornerFix.Position = UDim2.new(0, 0, 0.5, 0)
	TitleBarCornerFix.Size = UDim2.new(1, 0, 0.5, 0)
	TitleBarCornerFix.ZIndex = 2

	local TitleRound = Instance.new("UICorner")
	TitleRound.CornerRadius = UDim.new(0, 8)
	TitleRound.Parent = TitleBar

	local TitleLabel = Instance.new("TextLabel")
	TitleLabel.Parent = TitleBar
	TitleLabel.BackgroundTransparency = 1
	TitleLabel.Position = UDim2.new(0, 10, 0, 0)
	TitleLabel.Size = UDim2.new(0.65, 0, 1, 0)
	TitleLabel.Font = Enum.Font.GothamBold
	TitleLabel.Text = windowname or "ecohub"
	TitleLabel.TextColor3 = C.TEXT
	TitleLabel.TextSize = 12
	TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
	TitleLabel.ZIndex = 5

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
	VerLabel.ZIndex = 5

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

	local SidebarBrandTop = Instance.new("ImageLabel")
	SidebarBrandTop.Parent = Sidebar
	SidebarBrandTop.BackgroundTransparency = 1
	SidebarBrandTop.Image = BRAND_IMAGE
	SidebarBrandTop.Size = UDim2.new(0, 72, 0, 72)
	SidebarBrandTop.AnchorPoint = Vector2.new(0.5, 0)
	SidebarBrandTop.Position = UDim2.new(0.5, 0, 0, 4)
	SidebarBrandTop.ScaleType = Enum.ScaleType.Fit
	SidebarBrandTop.ImageTransparency = 0

	local SidebarSepTop = Instance.new("Frame")
	SidebarSepTop.Parent = Sidebar
	SidebarSepTop.BackgroundColor3 = C.SEP
	SidebarSepTop.BorderSizePixel = 0
	SidebarSepTop.Position = UDim2.new(0, 6, 0, 80)
	SidebarSepTop.Size = UDim2.new(1, -12, 0, 1)

	local TabScroll = Instance.new("ScrollingFrame")
	TabScroll.Parent = Sidebar
	TabScroll.BackgroundTransparency = 1
	TabScroll.BorderSizePixel = 0
	TabScroll.Position = UDim2.new(0, 6, 0, 85)
	TabScroll.Size = UDim2.new(1, -12, 1, -125)
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
	SidebarSep.Position = UDim2.new(0, 6, 1, -37)
	SidebarSep.Size = UDim2.new(1, -12, 0, 1)

	local SettingsTabBtn = Instance.new("TextButton")
	SettingsTabBtn.Parent = Sidebar
	SettingsTabBtn.BackgroundColor3 = C.ELEM
	SettingsTabBtn.BackgroundTransparency = 1
	SettingsTabBtn.BorderSizePixel = 0
	SettingsTabBtn.AnchorPoint = Vector2.new(0, 1)
	SettingsTabBtn.Position = UDim2.new(0, 6, 1, -6)
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

	local cfgSection = BuildSection("Configs", SettingsScroll)

	local cfgNameCtrl = cfgSection:addTextBox("Config name", "my_config", nil)
	local cfgListCtrl = cfgSection:addDropdown("Saved configs", GetConfigList(), nil)

	cfgSection:addButton("Save config", function()
		local name = cfgNameCtrl:Get()
		if not name or name:gsub(" ", "") == "" then return end
		local ok, err = SaveConfig(name)
		if not ok then
			print("[ecohub ERROR] Save: " .. tostring(err))
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
			print("[ecohub ERROR] Load: " .. tostring(err))
		end
	end, "download")

	cfgSection:addButton("Overwrite config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		local ok, err = SaveConfig(name)
		if not ok then
			print("[ecohub ERROR] Overwrite: " .. tostring(err))
		end
	end, "edit")

	cfgSection:addButton("Delete config", function()
		local name = cfgListCtrl:Get()
		if not name then return end
		pcall(delfile, ConfigSettingsFolder .. "/" .. name .. ".json")
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
		pcall(writefile, ConfigSettingsFolder .. "/autoload.txt", name)
	end, "star")

	cfgSection:addButton("Remove autoload", function()
		pcall(delfile, ConfigSettingsFolder .. "/autoload.txt")
	end, "x-circle")

	local cfgNameIdx = cfgNameCtrl._idx
	local cfgListIdx = cfgListCtrl._idx
	if cfgNameIdx then SaveIgnore[cfgNameIdx] = true end
	if cfgListIdx then SaveIgnore[cfgListIdx] = true end

	task.spawn(function()
		task.wait(1)
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

pg = pg or {}

local var_0_0 = pg

var_0_0.ShareMgr = singletonClass("ShareMgr")

local var_0_1 = var_0_0.ShareMgr

var_0_1.TypeAdmira = 1
var_0_1.TypeShipProfile = 2
var_0_1.TypeNewShip = 3
var_0_1.TypeBackyard = 4
var_0_1.TypeNewSkin = 5
var_0_1.TypeSummary = 6
var_0_1.TypePhoto = 7
var_0_1.TypeReflux = 8
var_0_1.TypeCommander = 9
var_0_1.TypeColoring = 10
var_0_1.TypeChallenge = 11
var_0_1.TypeInstagram = 12
var_0_1.TypePizzahut = 13
var_0_1.TypeSecondSummary = 14
var_0_1.TypePoraisMedals = 15
var_0_1.TypeIcecream = 16
var_0_1.TypeValentineQte = 17
var_0_1.TypeBossRushEX = 18
var_0_1.TypeTWCelebrationShare = 5000
var_0_1.TypeCardTower = 17
var_0_1.TypeDorm3dPhoto = 19
var_0_1.PANEL_TYPE_BLACK = 1
var_0_1.PANEL_TYPE_PINK = 2
var_0_1.ANCHORS_TYPE = {
	{
		0,
		0,
		0,
		0
	},
	{
		1,
		0,
		1,
		0
	},
	{
		0,
		1,
		0,
		1
	},
	{
		1,
		1,
		1,
		1
	},
	{
		0.5,
		0.5,
		0.5,
		0.5
	}
}

function var_0_1.Init(arg_1_0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function(arg_2_0)
		arg_1_0.go = arg_2_0

		arg_1_0.go:SetActive(false)

		arg_1_0.tr = arg_2_0.transform

		local var_2_0 = var_0_0.UIMgr.GetInstance().OverlayMain

		setParent(arg_1_0.tr, var_2_0.transform, false)

		arg_1_0.panelBlack = arg_1_0.tr:Find("panel")
		arg_1_0.panelPink = arg_1_0.tr:Find("panel_pink")
		arg_1_0.deckTF = arg_1_0.tr:Find("deck")

		setActive(arg_1_0.panelBlack, false)
		setActive(arg_1_0.panelPink, false)

		arg_1_0.logo = arg_1_0.tr:Find("deck/logo")

		GetComponent(arg_1_0.logo, "Image"):SetNativeSize()
		var_0_0.DelegateInfo.New(arg_1_0)
	end)

	arg_1_0.screenshotPath = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	arg_1_0.cacheComps = {}
	arg_1_0.cacheShowComps = {}
	arg_1_0.cacheMoveComps = {}
end

function var_0_1.UpdateDeck(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(PlayerProxy):getRawData()
	local var_3_1 = getProxy(UserProxy):getRawData()
	local var_3_2 = getProxy(ServerProxy):getRawData()[var_3_1 and var_3_1.server or 0]
	local var_3_3 = var_3_0 and var_3_0.name or ""
	local var_3_4 = var_3_2 and var_3_2.name or ""

	setText(arg_3_1:Find("name/value"), var_3_3)
	setText(arg_3_1:Find("server/value"), var_3_4)
	setText(arg_3_1:Find("lv/value"), var_3_0.level)

	if PLATFORM_CODE == PLATFORM_CHT or PLATFORM_CODE == PLATFORM_CH then
		setActive(arg_3_1:Find("code_bg"), true)
	else
		setActive(arg_3_1:Find("code_bg"), false)
	end
end

function var_0_1.Share(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5, arg_4_6)
	arg_4_0.noBlur = arg_4_4

	local var_4_0 = LuaHelper.GetCHPackageType()

	if not IsUnityEditor and PLATFORM_CODE == PLATFORM_CH and var_4_0 ~= PACKAGE_TYPE_BILI then
		var_0_0.TipsMgr.GetInstance():ShowTips("指挥官，当前平台不支持分享功能哦")

		return
	end

	arg_4_0:Init()

	local var_4_1 = var_0_0.share_template[arg_4_1]

	assert(var_4_1, "share_template not exist: " .. arg_4_1)

	local var_4_2 = arg_4_0.deckTF
	local var_4_3 = arg_4_0.ANCHORS_TYPE[var_4_1.deck] or {
		0.5,
		0.5,
		0.5,
		0.5
	}

	var_4_2.anchorMin = Vector2(var_4_3[1], var_4_3[2])
	var_4_2.anchorMax = Vector2(var_4_3[3], var_4_3[4])
	var_4_2.anchoredPosition3D = Vector3(var_4_1.qrcode_location[1], var_4_1.qrcode_location[2], -100)
	var_4_2.anchoredPosition = Vector2(var_4_1.qrcode_location[1], var_4_1.qrcode_location[2])

	local var_4_4 = GameObject.Find(var_4_1.camera):GetComponent(typeof(Camera)).transform:GetChild(0)

	if arg_4_5 then
		local var_4_5 = (var_4_4.sizeDelta.x - arg_4_5.x) / 2
		local var_4_6 = (var_4_4.sizeDelta.y - arg_4_5.y) / 2

		;(function()
			if arg_4_6 then
				var_4_5 = var_4_5 + arg_4_6[1]
				var_4_6 = var_4_6 + arg_4_6[2]
			end
		end)()

		var_4_2.anchoredPosition3D = Vector3(var_4_1.qrcode_location[1] - var_4_5, var_4_1.qrcode_location[2] + var_4_6, -100)
		var_4_2.anchoredPosition = Vector2(var_4_1.qrcode_location[1] - var_4_5, var_4_1.qrcode_location[2] + var_4_6)
	end

	arg_4_0:UpdateDeck(var_4_2)
	_.each(var_4_1.hidden_comps, function(arg_6_0)
		local var_6_0 = GameObject.Find(arg_6_0)

		if not IsNil(var_6_0) and var_6_0.activeSelf then
			table.insert(arg_4_0.cacheComps, var_6_0)
			var_6_0:SetActive(false)
		end
	end)
	_.each(var_4_1.show_comps, function(arg_7_0)
		local var_7_0 = GameObject.Find(arg_7_0)

		if not IsNil(var_7_0) and not var_7_0.activeSelf then
			table.insert(arg_4_0.cacheShowComps, var_7_0)
			var_7_0:SetActive(true)
		end
	end)
	_.each(var_4_1.move_comps, function(arg_8_0)
		local var_8_0 = GameObject.Find(arg_8_0.path)

		if not IsNil(var_8_0) then
			local var_8_1 = var_8_0.transform.anchoredPosition.x
			local var_8_2 = var_8_0.transform.anchoredPosition.y
			local var_8_3 = arg_8_0.x
			local var_8_4 = arg_8_0.y

			table.insert(arg_4_0.cacheMoveComps, {
				var_8_0,
				var_8_1,
				var_8_2
			})
			setAnchoredPosition(var_8_0, {
				x = var_8_3,
				y = var_8_4
			})
		end
	end)
	SetParent(var_4_2, var_4_4, false)
	var_4_2:SetAsLastSibling()
	arg_4_0:ShotAndSave(arg_4_1, arg_4_5, var_4_4, function()
		SetParent(var_4_2, arg_4_0.tr, false)

		local var_9_0 = arg_4_0:ShowSharePanel(arg_4_1, arg_4_2, arg_4_3, arg_4_4)

		_.each(arg_4_0.cacheComps, function(arg_10_0)
			arg_10_0:SetActive(true)
		end)

		arg_4_0.cacheComps = {}

		_.each(arg_4_0.cacheShowComps, function(arg_11_0)
			arg_11_0:SetActive(false)
		end)

		arg_4_0.cacheShowComps = {}

		_.each(arg_4_0.cacheMoveComps, function(arg_12_0)
			setAnchoredPosition(arg_12_0[1], {
				x = arg_12_0[2],
				y = arg_12_0[3]
			})
		end)

		arg_4_0.cacheMoveComps = {}

		if not var_9_0 then
			arg_4_0:Dispose()
		end
	end)
end

function var_0_1.ShotAndSave(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0 = var_0_0.share_template[arg_13_1]

	assert(var_13_0, "share_template not exist: " .. arg_13_1)

	local var_13_1 = GameObject.Find(var_13_0.camera):GetComponent(typeof(Camera))
	local var_13_2 = {}

	table.insert(var_13_2, function(arg_14_0)
		var_0_0.UIMgr.GetInstance():LoadingOn(false)
		BLHX.Rendering.HotUpdate.ScreenShooterPass.TakePhoto(var_13_1, arg_14_0)
	end)
	table.insert(var_13_2, function(arg_15_0, arg_15_1)
		var_0_0.UIMgr.GetInstance():LoadingOff()

		local function var_15_0(arg_16_0, arg_16_1)
			local var_16_0 = arg_16_1.x / arg_13_3.sizeDelta.x * Screen.width
			local var_16_1 = arg_16_1.y / arg_13_3.sizeDelta.y * Screen.height
			local var_16_2 = (Screen.width - var_16_0) / 2
			local var_16_3 = (Screen.height - var_16_1) / 2
			local var_16_4 = arg_16_0:GetPixels(var_16_2, var_16_3, var_16_0, var_16_1)
			local var_16_5 = UnityEngine.Texture2D.New(var_16_0, var_16_1)

			var_16_5:SetPixels(var_16_4)
			var_16_5:Apply()

			return var_16_5
		end

		if arg_13_2 then
			arg_15_1 = var_15_0(arg_15_1, arg_13_2)
		end

		local var_15_1 = Tex2DExtension.EncodeToJPG(arg_15_1)

		arg_13_0:SaveImageWithBytes(var_15_1)
		arg_15_0()
	end)
	seriesAsync(var_13_2, arg_13_4)
end

function var_0_1.ShowSharePanel(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_0.noBlur = arg_17_4

	local var_17_0 = var_0_0.share_template[arg_17_1]

	assert(var_17_0, "share_template not exist: " .. arg_17_1)

	local var_17_1 = LuaHelper.GetCHPackageType()

	if (PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US) and var_0_0.SdkMgr.GetInstance():GetIsPlatform() then
		local var_17_2 = System.IO.File.ReadAllBytes(arg_17_0.screenshotPath)
		local var_17_3 = UnityEngine.Texture2D.New(Screen.width, Screen.height, TextureFormat.ARGB32, false)

		Tex2DExtension.LoadImage(var_17_3, var_17_2)
		var_0_0.SdkMgr.GetInstance():GameShare(var_17_0.description, var_17_3)
		var_0_0.UIMgr.GetInstance():LoadingOn()
		onDelayTick(function()
			var_0_0.UIMgr.GetInstance():LoadingOff()
		end, 2)
	elseif PLATFORM_CODE == PLATFORM_CHT then
		var_0_0.SdkMgr.GetInstance():ShareImg(arg_17_0.screenshotPath, function()
			return
		end)
	elseif PLATFORM_CODE == PLATFORM_CH and var_17_1 == PACKAGE_TYPE_BILI then
		var_0_0.SdkMgr.GetInstance():GameShare(var_17_0.description, arg_17_0.screenshotPath)
	else
		arg_17_0:ShowOwnUI(arg_17_1, arg_17_2, arg_17_3, arg_17_4)

		return true
	end
end

function var_0_1.TakeTexture(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	if arg_20_1 == var_0_1.TypeValentineQte then
		local var_20_0 = System.Collections.Generic.List_UnityEngine_Camera()
		local var_20_1 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
		local var_20_2 = GameObject.Find("OverlayCamera"):GetComponent(typeof(Camera))

		var_20_0:Add(var_20_1)
		var_20_0:Add(var_20_2)

		local var_20_3 = arg_20_2:TakePhotoMultiCam(var_20_0)

		return (arg_20_2:EncodeToJPG(var_20_3))
	else
		local var_20_4 = arg_20_2:TakePhoto(arg_20_3)

		return (arg_20_2:EncodeToJPG(var_20_4))
	end
end

function var_0_1.TakePhoto(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if arg_21_1 == var_0_1.TypeValentineQte then
		local var_21_0 = System.Collections.Generic.List_UnityEngine_Camera()
		local var_21_1 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
		local var_21_2 = GameObject.Find("OverlayCamera"):GetComponent(typeof(Camera))

		var_21_0:Add(var_21_1)
		var_21_0:Add(var_21_2)

		return arg_21_2:TakeMultiCam(var_21_0, arg_21_0.screenshotPath)
	else
		return arg_21_2:Take(arg_21_3, arg_21_0.screenshotPath)
	end
end

function var_0_1.ShowOwnUI(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	arg_22_0.noBlur = arg_22_4

	local var_22_0 = var_0_0.share_template[arg_22_1]

	assert(var_22_0, "share_template not exist: " .. arg_22_1)
	arg_22_0.go:SetActive(true)
	setActive(arg_22_0.deckTF, false)

	arg_22_2 = arg_22_2 or var_0_1.PANEL_TYPE_BLACK

	if arg_22_2 == var_0_1.PANEL_TYPE_BLACK then
		arg_22_0.panel = arg_22_0.panelBlack
	elseif arg_22_2 == var_0_1.PANEL_TYPE_PINK then
		arg_22_0.panel = arg_22_0.panelPink
	end

	setActive(arg_22_0.panelBlack, arg_22_2 == var_0_1.PANEL_TYPE_BLACK)
	setActive(arg_22_0.panelPink, arg_22_2 == var_0_1.PANEL_TYPE_PINK)

	if not arg_22_4 then
		var_0_0.UIMgr.GetInstance():BlurPanel(arg_22_0.panel, setmetatable({
			staticBlur = true
		}, {
			__index = arg_22_3
		}))
	end

	local function var_22_1()
		arg_22_0:Dispose()
	end

	onButton(arg_22_0, arg_22_0.panel:Find("main/top/btnBack"), var_22_1)
	onButton(arg_22_0, arg_22_0.panel:Find("main/buttons/weibo"), function()
		var_22_1()
	end)
	onButton(arg_22_0, arg_22_0.panel:Find("main/buttons/weixin"), function()
		var_22_1()
	end)

	if PLATFORM_CODE == PLATFORM_KR then
		onButton(arg_22_0, arg_22_0.panel:Find("main/buttons/facebook"), function()
			var_0_0.SdkMgr.GetInstance():ShareImg(arg_22_0.screenshotPath)
			var_22_1()
		end)
	end
end

function var_0_1.Dispose(arg_27_0)
	arg_27_0.go:SetActive(false)

	if arg_27_0.panel and not arg_27_0.noBlur then
		var_0_0.UIMgr.GetInstance():UnOverlayPanel(arg_27_0.panel, arg_27_0.tr)
	end

	PoolMgr.GetInstance():ReturnUI("ShareUI", arg_27_0.go)
	var_0_0.DelegateInfo.Dispose(arg_27_0)

	arg_27_0.go = nil
	arg_27_0.tr = nil
	arg_27_0.panel = nil
end

function var_0_1.SaveImageWithBytes(arg_28_0, arg_28_1)
	BackYardThemeTempalteUtil.CheckSaveDirectory()

	local var_28_0 = arg_28_0.screenshotPath

	System.IO.File.WriteAllBytes(var_28_0, arg_28_1)
end

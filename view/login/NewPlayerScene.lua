local var_0_0 = class("NewPlayerScene", import("..base.BaseUI"))
local var_0_1 = 0.5
local var_0_2 = -300
local var_0_3 = Vector3(-380, 265, 0)
local var_0_4 = 19
local var_0_5 = {
	101171,
	201211,
	401231
}
local var_0_6 = {
	[401231] = "z23",
	[101171] = "lafei",
	[301051] = "lingbo",
	[201211] = "biaoqiang"
}
local var_0_7 = {
	[101171] = i18n("login_newPlayerScene_word_laFei"),
	[201211] = i18n("login_newPlayerScene_word_biaoqiang"),
	[401231] = i18n("login_newPlayerScene_word_z23")
}

function var_0_0.getUIName(arg_1_0)
	return "NewPlayerUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = {}
	local var_2_2 = {}

	for iter_2_0, iter_2_1 in pairs(var_0_6) do
		local var_2_3 = ResPathSupport.GetPaintingListByPaintingName(iter_2_1)

		table.insertto(var_2_0, var_2_3)

		local var_2_4 = ResPathSupport.GetSkillIconList(iter_2_0)

		table.insertto(var_2_1, var_2_4)

		local var_2_5 = Ship.New({
			configId = iter_2_0
		})
		local var_2_6 = var_2_5:getPrefab()
		local var_2_7 = ResPathSupport.GetSpineCharListByPrefabName(var_2_6)

		table.insertto(var_2_2, var_2_7)

		local var_2_8 = var_2_5:getSkinId()
		local var_2_9 = ResPathSupport.GetShipSkinLive2DList(var_2_8)

		table.insertto(var_2_2, var_2_9)
	end

	local var_2_10 = ResPathSupport.MergeLuaArr(var_2_0, var_2_1, var_2_2)

	return table.insertto(var_2_10, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.init(arg_3_0)
	arg_3_0.eventTriggers = {}
	arg_3_0.characters = arg_3_0._tf:Find("select_character/characters")
	arg_3_0.propPanel = arg_3_0._tf:Find("prop_panel")
	arg_3_0.selectPanel = arg_3_0._tf:Find("select_character")

	setActive(arg_3_0.propPanel, false)
	setActive(arg_3_0.selectPanel, true)

	arg_3_0.confirmBtn = arg_3_0.propPanel:Find("bg/qr_btn")
	arg_3_0.tip = arg_3_0._tf:Find("select_character/tip")
	arg_3_0.skillPanel = arg_3_0.propPanel:Find("bg/skill_panel")
	arg_3_0.skillTpl = arg_3_0:getTpl("bg/skill_panel/frame/skilltpl", arg_3_0.propPanel)
	arg_3_0.skillContainer = arg_3_0.propPanel:Find("bg/skill_panel/frame")
	arg_3_0.namedPanel = arg_3_0._tf:Find("named_panel")

	setActive(arg_3_0.namedPanel, false)

	arg_3_0.info = arg_3_0.namedPanel:Find("info")
	arg_3_0.nickname = arg_3_0.info:Find("nickname")
	arg_3_0.qChar = arg_3_0.propPanel:Find("q_char")
	arg_3_0.chat = arg_3_0.namedPanel:Find("info/tip/chatbgtop0/Text")
	arg_3_0.propertyPanel = PropertyPanel.New(arg_3_0.propPanel:Find("bg/property_panel/frame"))
	arg_3_0.paintTF = arg_3_0._tf:Find("prop_panel/bg/paint")
	arg_3_0.nameTF = arg_3_0._tf:Find("prop_panel/bg/name")
	arg_3_0.nameEnTF = arg_3_0._tf:Find("prop_panel/bg/english_name_bg")
	arg_3_0.titleShipinfoTF = arg_3_0._tf:Find("lines/hori/shipinfo_text")
	arg_3_0.titleShipchooseTF = arg_3_0._tf:Find("lines/hori/shipchoose_text")

	setImageAlpha(arg_3_0.titleShipinfoTF, 1)
	setImageAlpha(arg_3_0.titleShipchooseTF, 0)

	arg_3_0.randBtn = findTF(arg_3_0.info, "random_button")

	setActive(arg_3_0.randBtn, PLATFORM_CODE == PLATFORM_CH)
end

function var_0_0.onBackPressed(arg_4_0)
	if LeanTween.isTweening(go(arg_4_0.propPanel)) then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if isActive(arg_4_0.namedPanel) then
		arg_4_0:closeNamedPanel()

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
end

function var_0_0.switchPanel(arg_5_0)
	setActive(arg_5_0.propPanel, true)

	local var_5_0 = arg_5_0.propPanel:GetComponent(typeof(CanvasGroup))
	local var_5_1 = arg_5_0.selectPanel:GetComponent(typeof(CanvasGroup))

	LeanTween.value(go(arg_5_0.propPanel), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_6_0)
		var_5_0.alpha = arg_6_0
		var_5_1.alpha = 1 - arg_6_0
	end)):setOnComplete(System.Action(function()
		setActive(arg_5_0.selectPanel, false)
	end))

	arg_5_0.skillPanel.localPosition = Vector3.New(-1000, arg_5_0.skillPanel.localPosition.y, arg_5_0.skillPanel.localPosition.z)

	LeanTween.moveX(arg_5_0.skillPanel, 339, 0.2)

	local var_5_2 = arg_5_0._tf:Find("lines/line")
	local var_5_3 = arg_5_0._tf:Find("lines/hori")

	LeanTween.moveY(var_5_2, -328, 0.2)
	LeanTween.moveX(var_5_3, -820, 0.2)

	for iter_5_0 = 1, 3 do
		local var_5_4 = arg_5_0.characters:Find("character_" .. iter_5_0)
		local var_5_5 = arg_5_0.propPanel:Find("bg/characters/character_" .. iter_5_0)

		setImageAlpha(var_5_4, 1)
		LeanTween.alpha(var_5_4, 0, 0.25)
		LeanTween.move(go(var_5_4), var_5_5.position, 0.3)
		setImageAlpha(arg_5_0.titleShipinfoTF, 0)
		setImageAlpha(arg_5_0.titleShipchooseTF, 1)
		LeanTween.alpha(arg_5_0.titleShipinfoTF, 1, 0.25)
		LeanTween.alpha(arg_5_0.titleShipchooseTF, 0, 0.25)
	end
end

function var_0_0.initCharacters(arg_8_0)
	arg_8_0.charInitPos = {}

	for iter_8_0 = 1, 3 do
		local var_8_0 = arg_8_0._tf:Find("prop_panel/bg/characters/character_" .. iter_8_0)

		onToggle(arg_8_0, var_8_0, function(arg_9_0)
			if arg_9_0 then
				arg_8_0:selectCharacterByIdx(var_8_0, var_0_5[iter_8_0])
				setActive(var_8_0:Find("selected"), true)

				var_8_0:GetComponent(typeof(RectTransform)).sizeDelta = Vector2(196, 196)
			else
				setActive(var_8_0:Find("selected"), false)

				var_8_0:GetComponent(typeof(RectTransform)).sizeDelta = Vector2(140, 140)
			end
		end)
	end

	local var_8_1 = {
		0.2,
		0.3,
		0.1
	}

	for iter_8_1 = 1, 3 do
		local var_8_2 = arg_8_0.characters:Find("character_" .. iter_8_1)

		onButton(arg_8_0, var_8_2, function()
			arg_8_0:switchPanel()
			triggerToggle(arg_8_0._tf:Find("prop_panel/bg/characters/character_" .. iter_8_1), true)
		end)

		var_8_2.localPosition = Vector3.New(var_8_2.localPosition.x, 912, var_8_2.localPosition.z)

		setImageAlpha(var_8_2, 0)
		LeanTween.alpha(var_8_2, 1, 0.3):setDelay(var_8_1[iter_8_1])
		LeanTween.moveY(var_8_2, 0, 0.2):setDelay(var_8_1[iter_8_1])
	end
end

function var_0_0.didEnter(arg_11_0)
	onButton(arg_11_0, arg_11_0.confirmBtn, function()
		arg_11_0:showNamedPanel()
	end, SFX_PANEL)
	onButton(arg_11_0, findTF(arg_11_0.info, "random_button"), function()
		local var_13_0 = require("GameCfg.names")
		local var_13_1 = var_13_0[1][math.random(#var_13_0[1])]
		local var_13_2 = var_13_0[2][math.random(#var_13_0[2])]
		local var_13_3 = var_13_0[3][math.random(#var_13_0[3])]
		local var_13_4 = var_13_0[4][math.random(#var_13_0[4])]

		setInputText(arg_11_0.nickname, var_13_1 .. var_13_2 .. var_13_3 .. var_13_4)
	end, SFX_MAIN)
	onButton(arg_11_0, findTF(arg_11_0.info, "btn_container/enter_button"), function()
		if not arg_11_0.contextData.configId then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_newPlayerScene_error_notChoiseShip"))

			return
		end

		local var_14_0 = getInputText(arg_11_0.nickname)

		if var_14_0 == "" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("login_newPlayerScene_inputName"))

			return
		end

		if not nameValidityCheck(var_14_0, 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then
			return
		end

		arg_11_0.event:emit(NewPlayerMediator.ON_CREATE, var_14_0, arg_11_0.contextData.configId)
	end, SFX_CONFIRM)
	onButton(arg_11_0, findTF(arg_11_0.info, "btn_container/cancel_button"), function()
		arg_11_0:closeNamedPanel()
	end)
	arg_11_0:initCharacters()
end

local var_0_8 = 0.3
local var_0_9 = -47

function var_0_0.selectCharacterByIdx(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.inProp = true
	arg_16_0.contextData.configId = arg_16_2

	arg_16_0.propertyPanel:initProperty(arg_16_2)
	arg_16_0:initSkills()

	local var_16_0 = pg.ship_data_statistics[arg_16_2]

	setPaintingPrefab(arg_16_0.paintTF, var_0_6[arg_16_2], "chuanwu")
	setText(arg_16_0.nameTF:Find("name_mask/Text"), var_16_0.name)
	setText(arg_16_0.nameTF:Find("english_name"), var_16_0.english_name)
	setText(arg_16_0.nameEnTF, string.upper(var_16_0.english_name))

	local var_16_1 = Ship.New({
		configId = arg_16_0.contextData.configId
	}):getPrefab()

	if var_16_1 == arg_16_0.shipPrefab then
		return
	end

	arg_16_0:recycleSpineChar()
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetSpineChar(var_16_1, true, function(arg_17_0)
		pg.UIMgr.GetInstance():LoadingOff()

		arg_16_0.shipPrefab = var_16_1
		arg_16_0.shipModel = arg_17_0

		arg_17_0:GetComponent("SpineAnimUI"):SetAction("stand", 0)

		tf(arg_17_0).localScale = Vector3(0.5, 0.5, 1)
		tf(arg_17_0).localPosition = Vector3(15, -95, 0)

		pg.ViewUtils.SetLayer(tf(arg_17_0), Layer.UI)
		removeAllChildren(arg_16_0.qChar)
		SetParent(arg_17_0, arg_16_0.qChar, false)
	end)
end

function var_0_0.initSkills(arg_18_0)
	local var_18_0 = pg.ship_data_template[arg_18_0.contextData.configId]

	removeAllChildren(arg_18_0.skillContainer)

	for iter_18_0, iter_18_1 in ipairs(var_18_0.buff_list_display) do
		local var_18_1 = getSkillConfig(iter_18_1)
		local var_18_2 = table.contains(var_18_0.buff_list, iter_18_1)
		local var_18_3 = cloneTplTo(arg_18_0.skillTpl, arg_18_0.skillContainer)

		setActive(var_18_3:Find("mask"), not var_18_2)
		onButton(arg_18_0, var_18_3, function()
			arg_18_0:emit(NewPlayerMediator.ON_SKILLINFO, var_18_1.id)
		end, SFX_PANEL)
		LoadImageSpriteAsync("skillicon/" .. var_18_1.icon, findTF(var_18_3, "icon"))
	end
end

function var_0_0.showNamedPanel(arg_20_0)
	arg_20_0.qChar:SetParent(arg_20_0.info)
	pg.UIMgr.GetInstance():BlurPanel(arg_20_0.namedPanel)
	setActive(arg_20_0.namedPanel, true)
	setInputText(arg_20_0.nickname, "")
	setText(arg_20_0.chat, var_0_7[arg_20_0.contextData.configId])
end

function var_0_0.closeNamedPanel(arg_21_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_21_0.namedPanel, arg_21_0._tf)
	setActive(arg_21_0.namedPanel, false)
	arg_21_0.qChar:SetParent(arg_21_0.propPanel)
end

function var_0_0.recycleSpineChar(arg_22_0)
	if arg_22_0.shipPrefab and arg_22_0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(arg_22_0.shipPrefab, arg_22_0.shipModel)

		arg_22_0.shipPrefab = nil
		arg_22_0.shipModel = nil
	end
end

function var_0_0.willExit(arg_23_0)
	if arg_23_0.eventTriggers then
		for iter_23_0, iter_23_1 in pairs(arg_23_0.eventTriggers) do
			ClearEventTrigger(iter_23_0)
		end

		arg_23_0.eventTriggers = nil
	end

	arg_23_0:closeNamedPanel()
end

return var_0_0

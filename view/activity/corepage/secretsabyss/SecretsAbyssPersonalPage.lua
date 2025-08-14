local var_0_0 = class("SecretsAbyssPersonalPage", import("view.activity.BackHills.OtherWorld.TerminalPersonalPage"))
local var_0_1 = "otherworld_personal_name"

var_0_0.BIND_EVENT_ACT_ID = 50094
var_0_0.config = pg.roll_attr
var_0_0.NAME_ID = 1001
var_0_0.LV_ID = 1002
var_0_0.JOB_ID = 1003
var_0_0.GUARDIAN_ID = 1004

local function var_0_2(arg_1_0)
	local var_1_0 = {}

	for iter_1_0 = arg_1_0[1], arg_1_0[2] do
		if var_0_0.config[iter_1_0] then
			table.insert(var_1_0, iter_1_0)
		end
	end

	return var_1_0
end

var_0_0.PROPERTY_IDS = var_0_2({
	2001,
	2006
})
var_0_0.ABILITY_IDS = var_0_2({
	3000,
	3193
})
var_0_0.RANDOM_ABILITY_CNT = 8
var_0_0.personalRandomData = nil

function var_0_0.getUIName(arg_2_0)
	return "SecretsAbyssPersonalPage"
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.infoTF = arg_3_0:findTF("frame/info")
	arg_3_0.nameTitle = arg_3_0:findTF("infos/name/title", arg_3_0.infoTF)
	arg_3_0.nameInput = arg_3_0:findTF("infos/name/box/InputField", arg_3_0.infoTF)
	arg_3_0.jobTitle = arg_3_0:findTF("infos/job/title", arg_3_0.infoTF)
	arg_3_0.jobValue = arg_3_0:findTF("infos/job/value", arg_3_0.infoTF)
	arg_3_0.guardianTitle = arg_3_0:findTF("infos/guardian/title", arg_3_0.infoTF)
	arg_3_0.guardianValue = arg_3_0:findTF("infos/guardian/value", arg_3_0.infoTF)
	arg_3_0.lvTitle = arg_3_0:findTF("level/lv/title", arg_3_0.infoTF)
	arg_3_0.lvValue = arg_3_0:findTF("level/lv/value", arg_3_0.infoTF)
	arg_3_0.lvSlider = arg_3_0:findTF("level/slider/slider", arg_3_0.infoTF)
	arg_3_0.lvSliderImage = arg_3_0.lvSlider:GetComponent(typeof(Image))
	arg_3_0.lvUpgradeTF = arg_3_0:findTF("level/slider/upgrade", arg_3_0.infoTF)

	setActive(arg_3_0.lvUpgradeTF, false)

	arg_3_0.propertyTF = arg_3_0:findTF("frame/property")
	arg_3_0.propertyContent = arg_3_0:findTF("content", arg_3_0.propertyTF)
	arg_3_0.propertyTpl = arg_3_0:findTF("tpl", arg_3_0.propertyTF)

	setActive(arg_3_0.propertyTpl, false)
	setActive(arg_3_0:findTF("upgrade", arg_3_0.propertyTpl), false)

	if PLATFORM_CODE == PLATFORM_CH or PLATFORM_CODE == PLATFORM_CHT then
		arg_3_0.abilityTF = arg_3_0:findTF("frame/ability")

		setActive(arg_3_0:findTF("frame/ability_2"), false)
	else
		arg_3_0.abilityTF = arg_3_0:findTF("frame/ability_2")

		setActive(arg_3_0:findTF("frame/ability"), false)
	end

	setActive(arg_3_0.abilityTF, true)

	arg_3_0.abilityContent = arg_3_0:findTF("content", arg_3_0.abilityTF)
	arg_3_0.abilityTpl = arg_3_0:findTF("tpl", arg_3_0.abilityTF)

	setActive(arg_3_0.abilityTpl, false)

	arg_3_0.randomBtn = arg_3_0:findTF("frame/random_btn")
	arg_3_0.helpBtn = arg_3_0:findTF("frame/help_tips")
	arg_3_0.effectTF = arg_3_0:findTF("effect")

	setActive(arg_3_0.effectTF, false)

	arg_3_0.quitBtn = arg_3_0:findTF("frame/close_btn")
	arg_3_0.playerId = getProxy(PlayerProxy):getRawData().id
	arg_3_0.showName = getProxy(PlayerProxy):getRawData().name
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.activity = getProxy(ActivityProxy):getActivityById(var_0_0.BIND_EVENT_ACT_ID)

	assert(arg_4_0.activity, "not exist bind event act, id" .. var_0_0.BIND_EVENT_ACT_ID)
	arg_4_0.nameInput:GetComponent(typeof(InputField)).onValueChanged:AddListener(function()
		if not arg_4_0.unlockRandom or not nameValidityCheck(getInputText(arg_4_0.nameInput), 4, 14, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"login_newPlayerScene_invalideName"
		}) then
			arg_4_0:SetDefaultName()
		else
			arg_4_0.showName = getInputText(arg_4_0.nameInput)

			setInputText(arg_4_0.nameInput, arg_4_0.showName)
			arg_4_0:SetLocalName(arg_4_0.showName)
		end
	end)
	onButton(arg_4_0, arg_4_0.randomBtn, function()
		setActive(arg_4_0.effectTF, false)
		setActive(arg_4_0.effectTF, true)
		setActive(arg_4_0.randomBtn, false)
		arg_4_0:managedTween(LeanTween.delayedCall, function()
			var_0_0.personalRandomData = {}

			arg_4_0:UpdateView(true)
			setActive(arg_4_0.effectTF, false)
			setActive(arg_4_0.randomBtn, arg_4_0.unlockRandom)
		end, var_0_0.RANDOM_CHANGE_TIME, nil)

		if arg_4_0.randomCallback then
			arg_4_0:randomCallback()
		end
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.helpBtn, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("personal_random_tip"))
	end, SFX_PANEL)
	setActive(arg_4_0.randomBtn, arg_4_0.unlockRandom)
	setActive(arg_4_0.helpBtn, not arg_4_0.unlockRandom)
	setActive(arg_4_0:findTF("infos/name/box/edit", arg_4_0.infoTF), arg_4_0.unlockRandom)

	if arg_4_0.unlockRandom and arg_4_0:GetLocalName() ~= "" then
		arg_4_0.showName = arg_4_0:GetLocalName()
	end

	arg_4_0.nameInput:GetComponent(typeof(InputField)).interactable = arg_4_0.unlockRandom

	onButton(arg_4_0, arg_4_0.quitBtn, function()
		arg_4_0:Hide()
	end)
	onButton(arg_4_0, arg_4_0:findTF("mask"), function()
		arg_4_0:Hide()
	end)
	arg_4_0:UpdateView()
end

function var_0_0.UnlockRandom(arg_11_0)
	arg_11_0.unlockRandom = true
end

function var_0_0.SetUpgrade(arg_12_0)
	arg_12_0.upgradeFlag = true
end

function var_0_0.SetBossRushNode(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.currentBossRushNode = arg_13_1
	arg_13_0.lastBossRushNode = arg_13_2
end

function var_0_0.GetActivitySingleEventOption(arg_14_0, arg_14_1)
	for iter_14_0, iter_14_1 in pairs(pg.activity_single_event) do
		if iter_14_1.story == arg_14_1:getConfig("story") then
			return iter_14_1.options
		end
	end
end

function var_0_0.GetCurrentEvent(arg_15_0)
	return arg_15_0.currentBossRushNode
end

function var_0_0.RegisterRandomCallback(arg_16_0, arg_16_1)
	arg_16_0.randomCallback = arg_16_1
end

function var_0_0.UpdateView(arg_17_0, arg_17_1)
	local var_17_0

	if arg_17_0.upgradeFlag or #arg_17_0:GetActivitySingleEventOption(arg_17_0.currentBossRushNode) == 0 then
		var_17_0 = arg_17_0:GetActivitySingleEventOption(arg_17_0.lastBossRushNode)
	else
		var_17_0 = arg_17_0:GetActivitySingleEventOption(arg_17_0.currentBossRushNode)
	end

	arg_17_0.showCfg = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		arg_17_0.showCfg[iter_17_1[1]] = iter_17_1[2]
	end

	arg_17_0:UpdateInfo(arg_17_1)
	arg_17_0:UpdateProperty(arg_17_1)
	arg_17_0:UpdateAbility(arg_17_1)

	if arg_17_0.upgradeFlag then
		arg_17_0.upgradeCfg = {}

		for iter_17_2, iter_17_3 in ipairs(arg_17_0:GetActivitySingleEventOption(arg_17_0.currentBossRushNode)) do
			arg_17_0.upgradeCfg[iter_17_3[1]] = iter_17_3[2]
		end

		arg_17_0:PlayUpgradeAnims()
	end
end

function var_0_0.UpdateInfo(arg_18_0, arg_18_1)
	arg_18_0:SetDefaultName()

	local var_18_0 = arg_18_0:GetRollAttrInfoById(var_0_0.NAME_ID, arg_18_1)

	setText(arg_18_0.nameTitle, var_18_0 .. "：")

	local var_18_1, var_18_2 = arg_18_0:GetRollAttrInfoById(var_0_0.JOB_ID, arg_18_1)

	setText(arg_18_0.jobTitle, var_18_1 .. "：")
	setText(arg_18_0.jobValue, var_18_2)

	local var_18_3, var_18_4 = arg_18_0:GetRollAttrInfoById(var_0_0.GUARDIAN_ID, arg_18_1)

	setText(arg_18_0.guardianTitle, var_18_3 .. "：")
	setText(arg_18_0.guardianValue, var_18_4)

	local var_18_5, var_18_6 = arg_18_0:GetRollAttrInfoById(var_0_0.LV_ID, arg_18_1)

	setText(arg_18_0.lvTitle, var_18_5 .. "：")
	setText(arg_18_0.lvValue, var_18_6)

	arg_18_0.lvSliderImage.fillAmount = tonumber(var_18_6) / var_0_0.config[var_0_0.LV_ID].random_value[2]

	if arg_18_1 then
		var_0_0.personalRandomData[var_0_0.JOB_ID] = var_18_2
		var_0_0.personalRandomData[var_0_0.GUARDIAN_ID] = var_18_4
		var_0_0.personalRandomData[var_0_0.LV_ID] = var_18_6
	end
end

function var_0_0.UpdateProperty(arg_19_0, arg_19_1)
	local var_19_0 = 0

	for iter_19_0, iter_19_1 in ipairs(var_0_0.PROPERTY_IDS) do
		var_19_0 = var_19_0 + 1

		local var_19_1 = var_19_0 > arg_19_0.propertyContent.childCount and cloneTplTo(arg_19_0.propertyTpl, arg_19_0.propertyContent) or arg_19_0.propertyContent:GetChild(var_19_0 - 1)

		var_19_1.name = iter_19_1

		local var_19_2, var_19_3 = arg_19_0:GetRollAttrInfoById(iter_19_1, arg_19_1)

		setText(arg_19_0:findTF("name", var_19_1), var_19_2)
		setText(arg_19_0:findTF("value/Text", var_19_1), var_19_3)

		if arg_19_1 then
			var_0_0.personalRandomData[iter_19_1] = var_19_3
		end
	end

	for iter_19_2 = 1, arg_19_0.propertyContent.childCount - 1 do
		if var_19_0 < iter_19_2 then
			setActive(arg_19_0.propertyContent:GetChild(iter_19_2 - 1), false)
		end
	end
end

function var_0_0.UpdateAbility(arg_20_0, arg_20_1)
	local var_20_0 = {}

	if arg_20_1 then
		var_20_0 = arg_20_0:GetRandomAbilityIds()
	elseif var_0_0.personalRandomData then
		for iter_20_0, iter_20_1 in pairs(var_0_0.personalRandomData) do
			if table.contains(var_0_0.ABILITY_IDS, iter_20_0) then
				table.insert(var_20_0, iter_20_0)
			end
		end
	else
		for iter_20_2, iter_20_3 in pairs(arg_20_0.showCfg) do
			if table.contains(var_0_0.ABILITY_IDS, iter_20_2) then
				table.insert(var_20_0, iter_20_2)
			end
		end
	end

	table.sort(var_20_0)

	for iter_20_4, iter_20_5 in ipairs(var_20_0) do
		local var_20_1 = iter_20_4 > arg_20_0.abilityContent.childCount and cloneTplTo(arg_20_0.abilityTpl, arg_20_0.abilityContent) or arg_20_0.abilityContent:GetChild(iter_20_4 - 1)

		var_20_1.name = iter_20_4

		local var_20_2, var_20_3 = arg_20_0:GetRollAttrInfoById(iter_20_5, arg_20_1)

		setScrollText(arg_20_0:findTF("name_mask/name", var_20_1), var_20_2)
		setText(arg_20_0:findTF("value/Text", var_20_1), var_20_3)

		if arg_20_1 then
			var_0_0.personalRandomData[iter_20_5] = var_20_3
		end
	end

	for iter_20_6 = 1, arg_20_0.abilityContent.childCount do
		if iter_20_6 > #var_20_0 then
			setActive(arg_20_0.abilityContent:GetChild(iter_20_6 - 1), false)
		end
	end
end

function var_0_0.GetRollAttrInfoById(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = ""

	if arg_21_2 then
		local var_21_1 = var_0_0.config[arg_21_1].random_value

		if table.contains(var_0_0.PROPERTY_IDS, arg_21_1) or arg_21_1 == var_0_0.LV_ID then
			var_21_0 = math.random(var_21_1[1], var_21_1[2])
		else
			var_21_0 = var_21_1[math.random(#var_21_1)]
		end
	else
		var_21_0 = arg_21_0.showCfg[arg_21_1] or var_0_0.config[arg_21_1].default_value

		if var_0_0.personalRandomData then
			var_21_0 = var_0_0.personalRandomData[arg_21_1]
		end
	end

	return var_0_0.config[arg_21_1].name, tostring(var_21_0)
end

function var_0_0.GetRandomAbilityIds(arg_22_0)
	local var_22_0 = {}

	for iter_22_0 = 1, #var_0_0.ABILITY_IDS do
		table.insert(var_22_0, iter_22_0)
	end

	shuffle(var_22_0)

	local var_22_1 = {}

	for iter_22_1 = 1, var_0_0.RANDOM_ABILITY_CNT do
		table.insert(var_22_1, var_0_0.ABILITY_IDS[var_22_0[iter_22_1]])
	end

	return var_22_1
end

var_0_0.UPGRADE_TAG_SHOW_TIME = 2
var_0_0.LV_ANIM_TIME = 0.5
var_0_0.PROPERTY_TPL_ANIM_TIME = 0.5
var_0_0.ABILITY_TPL_ANIM_TIME = 0.5
var_0_0.RANDOM_CHANGE_TIME = 0.8

function var_0_0.PlayUpgradeAnims(arg_23_0)
	seriesAsync({
		function(arg_24_0)
			arg_23_0:PlayLevelAnim(arg_24_0)
		end,
		function(arg_25_0)
			arg_23_0:PlayPropertyAnim(arg_25_0)
		end,
		function(arg_26_0)
			arg_23_0:PlayAbilityAnim(arg_26_0)
		end
	}, function()
		arg_23_0.upgradeFlag = nil
	end)
end

function var_0_0.PlayLevelAnim(arg_28_0, arg_28_1)
	local var_28_0, var_28_1, var_28_2 = arg_28_0:GetStaticInfo(var_0_0.LV_ID)

	setActive(arg_28_0.lvUpgradeTF, var_28_2)

	if var_28_2 then
		arg_28_0:managedTween(LeanTween.delayedCall, function()
			setActive(arg_28_0.lvUpgradeTF, false)
		end, var_0_0.UPGRADE_TAG_SHOW_TIME, nil)
		arg_28_0:managedTween(LeanTween.value, nil, go(arg_28_0.lvValue), var_28_0, var_28_1, var_0_0.LV_ANIM_TIME):setOnUpdate(System.Action_float(function(arg_30_0)
			setText(arg_28_0.lvValue, math.floor(arg_30_0))
		end)):setOnComplete(System.Action(function()
			arg_28_1()
		end))

		local var_28_3 = var_0_0.config[var_0_0.LV_ID].random_value[2]

		arg_28_0:managedTween(LeanTween.value, nil, go(arg_28_0.lvSlider), var_28_0 / var_28_3, var_28_1 / var_28_3, var_0_0.LV_ANIM_TIME):setOnUpdate(System.Action_float(function(arg_32_0)
			arg_28_0.lvSliderImage.fillAmount = arg_32_0
		end))
	else
		arg_28_1()
	end
end

function var_0_0.PlayAbilityAnim(arg_33_0, arg_33_1)
	local var_33_0, var_33_1, var_33_2 = arg_33_0:GetDynamicInfo()

	if var_33_2 then
		local var_33_3 = {}

		for iter_33_0 = 1, #var_33_1 do
			local var_33_4 = iter_33_0 > #var_33_0
			local var_33_5 = var_33_1[iter_33_0]
			local var_33_6 = var_33_4 and cloneTplTo(arg_33_0.abilityTpl, arg_33_0.abilityContent) or arg_33_0.abilityContent:GetChild(iter_33_0 - 1)

			GetOrAddComponent(var_33_6, typeof(CanvasGroup)).alpha = var_33_4 and 0 or 1

			if var_33_0[iter_33_0] ~= var_33_5 then
				if not var_33_4 then
					table.insert(var_33_3, function(arg_34_0)
						arg_33_0:managedTween(LeanTween.value, nil, go(var_33_6), 1, 0, var_0_0.ABILITY_TPL_ANIM_TIME):setEase(LeanTweenType.easeInBack):setOnUpdate(System.Action_float(function(arg_35_0)
							GetOrAddComponent(var_33_6, typeof(CanvasGroup)).alpha = arg_35_0
						end)):setOnComplete(System.Action(function()
							setText(arg_33_0:findTF("name", var_33_6), var_0_0.config[var_33_5].name)
							setText(arg_33_0:findTF("value/Text", var_33_6), arg_33_0.upgradeCfg[var_33_5])
							arg_34_0()
						end))
					end)
				end

				table.insert(var_33_3, function(arg_37_0)
					if var_33_4 then
						setText(arg_33_0:findTF("name", var_33_6), var_0_0.config[var_33_5].name)
						setText(arg_33_0:findTF("value/Text", var_33_6), arg_33_0.upgradeCfg[var_33_5])
					end

					arg_33_0:managedTween(LeanTween.value, nil, go(var_33_6), 0, 1, var_0_0.ABILITY_TPL_ANIM_TIME):setEase(LeanTweenType.easeOutBack):setOnUpdate(System.Action_float(function(arg_38_0)
						GetOrAddComponent(var_33_6, typeof(CanvasGroup)).alpha = arg_38_0
					end)):setOnComplete(System.Action(function()
						arg_37_0()
					end))
				end)
			end
		end

		seriesAsync(var_33_3, function()
			arg_33_1()
		end)
	else
		arg_33_1()
	end
end

function var_0_0.Show(arg_41_0)
	var_0_0.super.Show(arg_41_0)

	arg_41_0.isActive = true

	pg.UIMgr.GetInstance():BlurPanel(arg_41_0._tf)
end

function var_0_0.Hide(arg_42_0)
	var_0_0.super.Hide(arg_42_0)

	arg_42_0.isActive = false

	pg.UIMgr.GetInstance():UnblurPanel(arg_42_0._tf)
end

function var_0_0.IsActive(arg_43_0)
	return arg_43_0.isActive
end

function var_0_0.OnDestroy(arg_44_0)
	arg_44_0:cleanManagedTween()
end

return var_0_0

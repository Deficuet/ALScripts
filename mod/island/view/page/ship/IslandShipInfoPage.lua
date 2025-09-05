local var_0_0 = class("IslandShipInfoPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipInfoUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.energyTipTr = arg_2_0:findTF("adapt/name_panel/tip")
	arg_2_0.energyTipTxt = arg_2_0:findTF("adapt/name_panel/tip/Text"):GetComponent(typeof(Text))
	arg_2_0.energyTr = arg_2_0:findTF("adapt/name_panel/energy")
	arg_2_0.energyTxt = arg_2_0:findTF("adapt/name_panel/energy"):GetComponent(typeof(Text))
	arg_2_0.energyLabel = arg_2_0:findTF("adapt/name_panel/energy/label")
	arg_2_0.nameTxt = arg_2_0:findTF("adapt/name_panel/name"):GetComponent(typeof(Text))
	arg_2_0.nameEnTxt = arg_2_0:findTF("adapt/name_panel/en"):GetComponent(typeof(Text))
	arg_2_0.levelTxt = arg_2_0:findTF("adapt/main_panel/level/level"):GetComponent(typeof(Text))
	arg_2_0.expTxt = arg_2_0:findTF("adapt/main_panel/level/exp"):GetComponent(typeof(Text))
	arg_2_0.expProgress = arg_2_0:findTF("adapt/main_panel/level/progress")
	arg_2_0.upgradeBtn = arg_2_0:findTF("adapt/main_panel/level/add")
	arg_2_0.breakoutBtn = arg_2_0:findTF("adapt/main_panel/level/breakout")
	arg_2_0.uiAttrList = UIItemList.New(arg_2_0:findTF("adapt/main_panel/attr/list"), arg_2_0:findTF("adapt/main_panel/attr/list/tpl"))
	arg_2_0.attrUpgradeBtn = arg_2_0:findTF("adapt/main_panel/attr/upgrade")
	arg_2_0.skillTr = arg_2_0:findTF("adapt/main_panel/skill")
	arg_2_0.skillIconImg = arg_2_0:findTF("adapt/main_panel/skill/icon")
	arg_2_0.skillName = arg_2_0:findTF("adapt/main_panel/skill/info/name"):GetComponent(typeof(Text))
	arg_2_0.skillLevel = arg_2_0:findTF("adapt/main_panel/skill/info/level"):GetComponent(typeof(Text))
	arg_2_0.skillDesc = arg_2_0:findTF("adapt/main_panel/skill/info/desc/Text"):GetComponent(typeof(Text))
	arg_2_0.skillMask = arg_2_0:findTF("adapt/main_panel/skill_mask")
	arg_2_0.skillMaskLabel = arg_2_0:findTF("adapt/main_panel/skill_mask/content/Text")
	arg_2_0.skillUpgradeBtn = arg_2_0:findTF("adapt/main_panel/skill/upgrade")
	arg_2_0.skillInfoBtn = arg_2_0:findTF("adapt/main_panel/skill/click")
	arg_2_0.breakOutList = UIItemList.New(arg_2_0:findTF("adapt/main_panel/level/starts"), arg_2_0:findTF("adapt/main_panel/level/starts/tpl"))
	arg_2_0.statusPanel = IslandShipStatusPanel.New(arg_2_0:findTF("adapt/main_panel/status"), arg_2_0:findTF("adapt/main_panel/status_empty"))

	setText(arg_2_0.energyLabel, i18n("island_ship_energy"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.energyTr, function()
		arg_3_0:DisplayEnergyTip()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.skillUpgradeBtn, function()
		if arg_3_0.ship:GetSkill():IsMaxLevel() then
			return
		end

		arg_3_0:OpenPage(IslandShipSkillUpgradePage, arg_3_0.ship)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.upgradeBtn, function()
		if arg_3_0.ship:IsMaxLevel() then
			if arg_3_0.ship:IsMaxBreakLevel() then
				return
			end

			arg_3_0:OpenPage(IslandShipBreakoutPage, arg_3_0.ship)
		else
			arg_3_0:OpenPage(IslandShipUpgradePage, arg_3_0.ship)
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.breakoutBtn, function()
		triggerButton(arg_3_0.upgradeBtn)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.attrUpgradeBtn, function()
		arg_3_0:OpenPage(IslandShipAttrUpgradePage, arg_3_0.ship)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.skillInfoBtn, function()
		arg_3_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_SHIP_SKILL,
			skill = arg_3_0.ship:GetSkill()
		})
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_10_1)

	if var_10_0 == nil then
		return
	end

	arg_10_0:UpdateMainView(var_10_0)

	arg_10_0.ship = var_10_0
end

function var_0_0.AddListeners(arg_11_0)
	arg_11_0:AddListener(GAME.ISLAND_USE_SHIP_EXP_BOOK_DONE, arg_11_0.OnUseExpBook)
	arg_11_0:AddListener(GAME.ISLAND_SHIP_BREAKOUT_DONE, arg_11_0.OnBreakOut)
	arg_11_0:AddListener(GAME.ISLNAD_SHIP_ATTR_UPGRADE_DONE, arg_11_0.OnAttrUpgrade)
	arg_11_0:AddListener(GAME.ISLAND_SHIP_SKILL_UPGRADE_DONE, arg_11_0.OnSkillUpgrade)
end

function var_0_0.RemoveListeners(arg_12_0)
	arg_12_0:RemoveListener(GAME.ISLAND_USE_SHIP_EXP_BOOK_DONE, arg_12_0.OnUseExpBook)
	arg_12_0:RemoveListener(GAME.ISLAND_SHIP_BREAKOUT_DONE, arg_12_0.OnBreakOut)
	arg_12_0:RemoveListener(GAME.ISLNAD_SHIP_ATTR_UPGRADE_DONE, arg_12_0.OnAttrUpgrade)
	arg_12_0:RemoveListener(GAME.ISLAND_SHIP_SKILL_UPGRADE_DONE, arg_12_0.OnSkillUpgrade)
end

function var_0_0.OnAttrUpgrade(arg_13_0)
	arg_13_0:UpdateAttrs(arg_13_0.ship)
end

function var_0_0.OnUseExpBook(arg_14_0)
	arg_14_0:UpdateLevelAndExp(arg_14_0.ship)
	arg_14_0:UpdateAttrs(arg_14_0.ship)
end

function var_0_0.OnBreakOut(arg_15_0)
	local var_15_0 = arg_15_0.ship

	arg_15_0:UpdateEnergy(var_15_0)
	arg_15_0:UpdateLevelAndExp(var_15_0)
	arg_15_0:UpdateAttrs(var_15_0)
	arg_15_0:UpdateSkill(var_15_0)
	arg_15_0:UpdateBreakOutLevel(var_15_0)
end

function var_0_0.OnSkillUpgrade(arg_16_0)
	local var_16_0 = arg_16_0.ship

	arg_16_0:UpdateSkill(var_16_0)
end

function var_0_0.UpdateMainView(arg_17_0, arg_17_1)
	arg_17_0:UpdateEnergy(arg_17_1)
	arg_17_0:UpdateLevelAndExp(arg_17_1)
	arg_17_0:UpdateAttrs(arg_17_1)
	arg_17_0:UpdateSkill(arg_17_1)
	arg_17_0:UpdateBreakOutLevel(arg_17_1)
	arg_17_0:UpdateStatus(arg_17_1)

	arg_17_0.ship = arg_17_1
end

function var_0_0.DisplayEnergyTip(arg_18_0)
	arg_18_0:RemoveCloseEnergyTipTimer()
	setActive(arg_18_0.energyTipTr, true)

	arg_18_0.energyTipTxt.text = i18n("island_ship_energy_full")

	arg_18_0:AddCloseEnergyTipTimer()
end

function var_0_0.AddCloseEnergyTipTimer(arg_19_0)
	arg_19_0.timer = Timer.New(function()
		arg_19_0:RemoveCloseEnergyTipTimer()
	end, 3)

	arg_19_0.timer:Start()
end

function var_0_0.RemoveCloseEnergyTipTimer(arg_21_0)
	setActive(arg_21_0.energyTipTr, false)

	if arg_21_0.timer then
		arg_21_0.timer:Stop()

		arg_21_0.timer = nil
	end
end

function var_0_0.UpdateBreakOutLevel(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1:GetBreakLevel()

	arg_22_0.breakOutList:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = arg_23_1 + 1

			setActive(arg_23_2:Find("Image"), var_23_0 <= var_22_0)
		end
	end)
	arg_22_0.breakOutList:align(arg_22_1:GetBreakMaxLevel())
end

function var_0_0.UpdateEnergy(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:GetEnergy()
	local var_24_1 = arg_24_1:GetMaxEnergy()
	local var_24_2 = var_24_0 <= 20 and "<color=#ab4734>" .. var_24_0 .. "</color>" or var_24_0

	arg_24_0.energyTxt.text = "[" .. var_24_2 .. "/" .. var_24_1 .. "]"
end

function var_0_0.UpdateLevelAndExp(arg_25_0, arg_25_1)
	arg_25_0.nameTxt.text = arg_25_1:GetName()
	arg_25_0.nameEnTxt.text = arg_25_1:GetEnName()
	arg_25_0.levelTxt.text = "Level:" .. arg_25_1:GetLevel()

	if not arg_25_1:IsMaxLevel() then
		local var_25_0 = arg_25_1:GetExp()
		local var_25_1 = arg_25_1:GetTargetExp()

		arg_25_0.expTxt.text = var_25_0 .. "/" .. var_25_1

		setSlider(arg_25_0.expProgress, 0, 1, var_25_0 / var_25_1)
	else
		arg_25_0.expTxt.text = "[MAX]"

		setSlider(arg_25_0.expProgress, 0, 1, 1)
	end

	setActive(arg_25_0.upgradeBtn, not arg_25_1:IsMaxLevel())
	setActive(arg_25_0.breakoutBtn, arg_25_1:IsMaxLevel() and not arg_25_1:IsMaxBreakLevel())
end

function var_0_0.UpdateAttrs(arg_26_0, arg_26_1)
	local var_26_0 = IslandShipAttr.ATTRS

	arg_26_0.uiAttrList:make(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == UIItemList.EventUpdate then
			local var_27_0 = arg_27_1 + 1

			arg_26_0:UpdateAttr(arg_27_2, var_26_0, var_27_0, arg_26_1)
		end
	end)
	arg_26_0.uiAttrList:align(#var_26_0)
end

function var_0_0.UpdateAttr(arg_28_0, arg_28_1, arg_28_2, arg_28_3, arg_28_4)
	local var_28_0 = arg_28_2[arg_28_3]
	local var_28_1 = arg_28_4:GetAttr(var_28_0)

	setText(arg_28_1:Find("name"), IslandShipAttr.ToChinese(var_28_0))
	setText(arg_28_1:Find("value"), var_28_1)

	local var_28_2 = arg_28_4:GetAttrGrade(var_28_0)
	local var_28_3 = IslandShipAttr.Grade2Img(var_28_2)

	GetImageSpriteFromAtlasAsync("ui/IslandShipUI_atlas", var_28_3[1], arg_28_1:Find("grade"))
	GetImageSpriteFromAtlasAsync("ui/IslandShipUI_atlas", var_28_3[2], arg_28_1:Find("grade_bg"))
end

function var_0_0.UpdateSkill(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1:GetSkill()

	GetImageSpriteFromAtlasAsync("island/IslandSkillIcon/" .. var_29_0:GetIcon(), "", arg_29_0.skillIconImg)

	arg_29_0.skillName.text = var_29_0:GetName()
	arg_29_0.skillLevel.text = "[Lv." .. var_29_0:GetLevel() .. "]"
	arg_29_0.skillDesc.text = var_29_0:GetEffectDesc()

	local var_29_1 = var_29_0:IsUnlock()

	setActive(arg_29_0.skillTr, var_29_1)
	setActive(arg_29_0.skillMask, not var_29_1)
	setText(arg_29_0.skillMaskLabel, i18n("island_need_star", arg_29_1:GetSkillUnlockLevel()))
	setActive(arg_29_0.skillUpgradeBtn, not var_29_0:IsMaxLevel())
end

function var_0_0.UpdateStatus(arg_30_0, arg_30_1)
	arg_30_0.statusPanel:Flush(arg_30_1)

	local var_30_0 = arg_30_1:GetDisplayStatus()

	onButton(arg_30_0, arg_30_0.statusPanel.viewBtn, function()
		arg_30_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_SHIP_OWN_STATUS,
			title = i18n("island_word_ship_buff_desc"),
			statusList = var_30_0
		})
	end, SFX_PANEL)
end

function var_0_0.OnHide(arg_32_0)
	arg_32_0:RemoveCloseEnergyTipTimer()
end

function var_0_0.OnDestroy(arg_33_0)
	arg_33_0.statusPanel:Dispose()

	arg_33_0.statusPanel = nil

	arg_33_0:RemoveCloseEnergyTipTimer()
end

return var_0_0

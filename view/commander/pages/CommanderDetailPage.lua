local var_0_0 = class("CommanderDetailPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderDetailUI"
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	var_0_0.super.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0:Load()
end

function var_0_0.RegisterEvent(arg_3_0)
	arg_3_0:bind(CommanderCatScene.EVENT_CLOSE_DESC, function(arg_4_0)
		triggerToggle(arg_3_0.skillBtn, false)
		triggerToggle(arg_3_0.additionBtn, false)
		triggerToggle(arg_3_0.otherBtn, false)
	end)
	arg_3_0:bind(CommanderCatScene.EVENT_FOLD, function(arg_5_0, arg_5_1)
		triggerToggle(arg_3_0.skillBtn, false)
		triggerToggle(arg_3_0.additionBtn, false)
		triggerToggle(arg_3_0.otherBtn, false)

		if arg_5_1 then
			LeanTween.moveY(rtf(arg_3_0.commanderInfo), -400, 0.5)
		else
			LeanTween.moveY(rtf(arg_3_0.commanderInfo), 71, 0.5)
		end
	end)
	arg_3_0:bind(CommanderCatScene.EVENT_PREVIEW, function(arg_6_0, arg_6_1)
		arg_3_0:UpdatePreView(arg_6_1)
	end)
	arg_3_0:bind(CommanderCatScene.EVENT_PREVIEW_REVERSE, function(arg_7_0, arg_7_1, arg_7_2)
		arg_3_0:UpdateReversePreView(arg_7_1, arg_7_2)
	end)
	arg_3_0:bind(CommanderCatScene.EVENT_PREVIEW_PLAY, function(arg_8_0, arg_8_1, arg_8_2)
		triggerToggle(arg_3_0.skillBtn, true)

		local var_8_0 = not arg_8_1 or #arg_8_1 <= 0 or arg_8_2

		triggerToggle(arg_3_0.otherBtn, not var_8_0)
		triggerToggle(arg_3_0.additionBtn, false)
		setToggleEnabled(arg_3_0.additionBtn, false)
		arg_3_0:UpdatePreViewWithOther(arg_8_1)
	end)
	arg_3_0:bind(CommanderCatScene.EVENT_PREVIEW_ADDITION, function(arg_9_0, arg_9_1)
		triggerToggle(arg_3_0.skillBtn, true)
		triggerToggle(arg_3_0.additionBtn, true)
		arg_3_0:UpdatePreviewAddition(arg_9_1)
	end)
	arg_3_0:bind(CommanderCatDockPage.ON_SORT, function(arg_10_0, arg_10_1)
		arg_3_0:OnSort(arg_10_1)
	end)
end

function var_0_0.OnLoaded(arg_11_0)
	arg_11_0.statement = arg_11_0:findTF("detail/statement")
	arg_11_0.statement.localScale = Vector3(1, 0, 1)
	arg_11_0.talentSkill = arg_11_0:findTF("detail/talent_skill")

	setActive(arg_11_0.talentSkill, false)

	local var_11_0 = arg_11_0:findTF("talent/content", arg_11_0.talentSkill)

	arg_11_0.talentList = UIItemList.New(var_11_0, var_11_0:GetChild(0))
	arg_11_0.abilityAdditionTF = arg_11_0:findTF("atttrs/content", arg_11_0.statement)
	arg_11_0.talentAdditionTF = arg_11_0:findTF("talents/scroll/content", arg_11_0.statement)
	arg_11_0.talentAdditionList = UIItemList.New(arg_11_0.talentAdditionTF, arg_11_0.talentAdditionTF:GetChild(0))
	arg_11_0.skillIcon = arg_11_0:findTF("skill/icon/Image", arg_11_0.talentSkill)
	arg_11_0.lockTF = arg_11_0:findTF("info/lock")
	arg_11_0.commanderInfo = arg_11_0:findTF("info")
	arg_11_0.expPanel = arg_11_0:findTF("exp", arg_11_0.commanderInfo)
	arg_11_0.commanderLevelTxt = arg_11_0:findTF("exp/level", arg_11_0.commanderInfo):GetComponent(typeof(Text))
	arg_11_0.commanderExpImg = arg_11_0:findTF("exp/Image", arg_11_0.commanderInfo):GetComponent(typeof(Image))
	arg_11_0.commanderNameTxt = arg_11_0:findTF("name_bg/mask/Text", arg_11_0.commanderInfo):GetComponent("ScrollText")
	arg_11_0.modifyNameBtn = arg_11_0:findTF("name_bg/modify", arg_11_0.commanderInfo)

	local var_11_1 = pg.gameset.commander_rename_open.key_value == 1

	setActive(arg_11_0.modifyNameBtn, var_11_1)

	arg_11_0.line = arg_11_0:findTF("line", arg_11_0.commanderInfo)
	arg_11_0.fleetnums = arg_11_0:findTF("line/numbers", arg_11_0.commanderInfo)
	arg_11_0.fleetTF = arg_11_0:findTF("line/fleet", arg_11_0.commanderInfo)
	arg_11_0.subTF = arg_11_0:findTF("line/sub_fleet", arg_11_0.commanderInfo)
	arg_11_0.leisureTF = arg_11_0:findTF("line/leisure", arg_11_0.commanderInfo)
	arg_11_0.labelInBattleTF = arg_11_0:findTF("line/inbattle", arg_11_0.commanderInfo)
	arg_11_0.rarityImg = arg_11_0:findTF("rarity", arg_11_0.commanderInfo):GetComponent(typeof(Image))
	arg_11_0.abilityTF = arg_11_0:findTF("ablitys", arg_11_0.commanderInfo)
	arg_11_0.skillBtn = arg_11_0:findTF("skill_btn", arg_11_0.commanderInfo)
	arg_11_0.additionBtn = arg_11_0:findTF("addition_btn", arg_11_0.commanderInfo)
	arg_11_0.otherBtn = arg_11_0:findTF("other_btn", arg_11_0.commanderInfo)
	arg_11_0.otherCommanderNameTxt = arg_11_0:findTF("detail/other/name/Text"):GetComponent(typeof(Text))
	arg_11_0.otherCommanderSkillImg = arg_11_0:findTF("detail/other/skill/Image")
	arg_11_0.otherCommanderTalentList = UIItemList.New(arg_11_0:findTF("detail/other/talent"), arg_11_0:findTF("detail/other/talent/tpl"))
	arg_11_0.otherCommanderDescTxt = arg_11_0:findTF("detail/other/desc/mask/Text"):GetComponent(typeof(ScrollText))
	arg_11_0.blurPanel = arg_11_0._parentTf.parent
	arg_11_0.blurPanelParent = arg_11_0.blurPanel.parent
	arg_11_0.renamePanel = CommanderRenamePage.New(pg.UIMgr.GetInstance().OverlayMain, arg_11_0.event)

	setText(arg_11_0:findTF("detail/statement/atttrs/title/Text"), i18n("commander_subtile_ablity"))
	setText(arg_11_0:findTF("detail/statement/talents/title/Text"), i18n("commander_subtile_talent"))
end

function var_0_0.OnInit(arg_12_0)
	arg_12_0:RegisterEvent()

	arg_12_0.isOnAddition = false
	arg_12_0.isOnSkill = false

	onToggle(arg_12_0, arg_12_0.skillBtn, function(arg_13_0)
		arg_12_0.isOnSkill = arg_13_0

		arg_12_0:Blur()

		if arg_13_0 then
			arg_12_0:emit(CommanderCatScene.EVENT_OPEN_DESC)
		end
	end, SFX_PANEL)
	onToggle(arg_12_0, arg_12_0.additionBtn, function(arg_14_0)
		arg_12_0.isOnAddition = arg_14_0
		arg_12_0.statement.localScale = arg_14_0 and Vector3(1, 1, 1) or Vector3(1, 0, 1)

		arg_12_0:Blur()

		if arg_14_0 then
			arg_12_0:emit(CommanderCatScene.EVENT_OPEN_DESC)
		end
	end, SFX_PANEL)
	onToggle(arg_12_0, arg_12_0.otherBtn, function(arg_15_0)
		arg_12_0.isOnOther = arg_15_0

		arg_12_0:Blur()

		if arg_15_0 then
			arg_12_0:emit(CommanderCatScene.EVENT_OPEN_DESC)
		end
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.modifyNameBtn, function()
		local var_16_0 = arg_12_0.commanderVO

		if not var_16_0:canModifyName() then
			local var_16_1 = var_16_0:getRenameTimeDesc()

			arg_12_0.contextData.msgBox:ExecuteAction("Show", {
				content = i18n("commander_rename_coldtime_tip", var_16_1)
			})
		else
			arg_12_0.renamePanel:ExecuteAction("Show", var_16_0)
		end
	end, SFX_PANEL)
end

function var_0_0.Update(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.commanderVO = arg_17_1

	arg_17_0:UpdateInfo()
	arg_17_0:UpdateTalents()
	arg_17_0:UpdateSkills()
	arg_17_0:UpdateAbilityAddition()
	arg_17_0:UpdateTalentAddition()
	arg_17_0:UpdateAbilitys()
	arg_17_0:UpdateLockState()
	arg_17_0:UpdateLevel()
	arg_17_0:UpdateStyle(arg_17_2)
	arg_17_0._tf:SetAsFirstSibling()
	arg_17_0:Show()
end

function var_0_0.UpdateLockState(arg_18_0)
	local var_18_0 = arg_18_0.commanderVO:getLock()

	setActive(arg_18_0.lockTF:Find("image"), var_18_0 == 0)
	onButton(arg_18_0, arg_18_0.lockTF, function()
		local var_19_0 = 1 - var_18_0

		arg_18_0:emit(CommanderCatMediator.LOCK, arg_18_0.commanderVO.id, var_19_0)
	end, SFX_PANEL)
end

function var_0_0.UpdateStyle(arg_20_0, arg_20_1)
	if arg_20_1 then
		triggerToggle(arg_20_0.skillBtn, true)
		triggerToggle(arg_20_0.additionBtn, true)
		setActive(arg_20_0.lockTF, false)
	end

	setButtonEnabled(arg_20_0.modifyNameBtn, not arg_20_1)
end

function var_0_0.UpdateInfo(arg_21_0)
	local var_21_0 = arg_21_0.commanderVO
	local var_21_1 = Commander.rarity2Print(var_21_0:getRarity())

	if arg_21_0.rarityPrint ~= var_21_1 then
		LoadImageSpriteAsync("CommanderRarity/" .. var_21_1, arg_21_0.rarityImg, true)

		arg_21_0.rarityPrint = var_21_1
	end

	eachChild(arg_21_0.fleetnums, function(arg_22_0)
		setActive(arg_22_0, go(arg_22_0).name == tostring(var_21_0.fleetId or ""))
	end)

	local var_21_2 = var_21_0.fleetId and not var_21_0.inBattle and var_21_0.sub
	local var_21_3 = var_21_2 and 260 or 200

	arg_21_0.line.sizeDelta = Vector2(var_21_3, arg_21_0.line.sizeDelta.y)

	setActive(arg_21_0.subTF, var_21_2)
	setActive(arg_21_0.fleetTF, var_21_0.fleetId and not var_21_0.inBattle and not var_21_0.sub)
	setActive(arg_21_0.leisureTF, not var_21_0.inFleet and not var_21_0.inBattle)
	setActive(arg_21_0.labelInBattleTF, var_21_0.inBattle)

	local var_21_4 = arg_21_0.commanderVO
	local var_21_5 = defaultValue(arg_21_0.forceDefaultName, false)

	arg_21_0.commanderNameTxt:SetText(var_21_4:getName(var_21_5))
end

function var_0_0.OnSort(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.commanderVO
	local var_23_1 = not arg_23_1

	arg_23_0.forceDefaultName = var_23_1

	arg_23_0.commanderNameTxt:SetText(var_23_0:getName(var_23_1))
end

function var_0_0.UpdatePreView(arg_24_0, arg_24_1)
	arg_24_0:UpdateAbilitys(arg_24_1)
	arg_24_0:UpdatePreviewAddition(arg_24_1)
	arg_24_0:UpdateLevel(arg_24_1)
end

function var_0_0.UpdateReversePreView(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0:_UpdateAbilitys(arg_25_2, arg_25_1)
	arg_25_0:_UpdateAbilityAddition(arg_25_2, arg_25_1)
	arg_25_0:_UpdateTalentAddition(arg_25_2)
	arg_25_0:UpdateLevel(arg_25_2)
end

function var_0_0.UpdatePreViewWithOther(arg_26_0, arg_26_1)
	if not arg_26_1 or #arg_26_1 <= 0 then
		return
	end

	local var_26_0 = Clone(arg_26_0.commanderVO)
	local var_26_1 = CommanderCatUtil.GetSkillExpAndCommanderExp(var_26_0, arg_26_1)

	var_26_0:addExp(var_26_1)

	local var_26_2 = arg_26_1[#arg_26_1]
	local var_26_3 = getProxy(CommanderProxy):getCommanderById(var_26_2)

	arg_26_0:UpdateOtherCommander(var_26_3)
	arg_26_0:UpdateLevel(var_26_0)
	arg_26_0:UpdateAbilitys(var_26_0)
end

function var_0_0.UpdatePreviewAddition(arg_27_0, arg_27_1)
	arg_27_0:UpdateAbilityAddition(arg_27_1)
	arg_27_0:UpdateTalentAddition()
end

function var_0_0.UpdateOtherCommander(arg_28_0, arg_28_1)
	arg_28_0.otherCommanderNameTxt.text = arg_28_1:getName()

	local var_28_0 = arg_28_1:getSkills()[1]
	local var_28_1 = arg_28_1:GetDisplayTalents()

	GetImageSpriteFromAtlasAsync("commanderskillicon/" .. var_28_0:getConfig("icon"), "", arg_28_0.otherCommanderSkillImg)
	arg_28_0.otherCommanderTalentList:make(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == UIItemList.EventUpdate then
			setText(arg_29_2:Find("Text"), "")

			local var_29_0 = var_28_1[arg_29_1 + 1]

			if var_29_0 then
				arg_28_0:UpdateTalent(arg_28_1, var_29_0, arg_29_2)
				onToggle(arg_28_0, arg_29_2, function(arg_30_0)
					if arg_30_0 then
						arg_28_0.otherCommanderDescTxt:SetText(var_29_0:getConfig("desc"))
					end
				end, SFX_PANEL)

				if arg_29_1 == 0 then
					triggerToggle(arg_29_2, true)
				end
			end

			setActive(arg_29_2:Find("empty"), var_29_0 == nil)

			arg_29_2:GetComponent(typeof(Image)).enabled = var_29_0 ~= nil

			setActive(arg_29_2:Find("lock"), var_29_0 and not arg_28_1:IsLearnedTalent(var_29_0.id))
		end
	end)
	arg_28_0.otherCommanderTalentList:align(5)
end

function var_0_0.UpdateLevel(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1 or arg_31_0.commanderVO
	local var_31_1 = arg_31_1 and arg_31_1.level > arg_31_0.commanderVO.level and COLOR_GREEN or COLOR_WHITE
	local var_31_2 = setColorStr("LV." .. var_31_0.level, var_31_1)

	arg_31_0.commanderLevelTxt.text = var_31_2

	if var_31_0:isMaxLevel() then
		arg_31_0.commanderExpImg.fillAmount = 1
	else
		arg_31_0.commanderExpImg.fillAmount = var_31_0.exp / var_31_0:getNextLevelExp()
	end
end

function var_0_0.UpdateAbilitys(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.commanderVO

	arg_32_0:_UpdateAbilitys(var_32_0, arg_32_1)
end

function var_0_0._UpdateAbilitys(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_1:getAbilitys()
	local var_33_1

	if arg_33_2 then
		var_33_1 = arg_33_2:getAbilitys()
	end

	for iter_33_0, iter_33_1 in pairs(var_33_0) do
		local var_33_2 = arg_33_0.abilityTF:Find(iter_33_0)
		local var_33_3

		if var_33_1 then
			var_33_3 = var_33_1[iter_33_0].value - iter_33_1.value

			if var_33_3 <= 0 then
				var_33_3 = nil
			end
		end

		local var_33_4 = var_33_3 and setColorStr("+" .. var_33_3, COLOR_GREEN) or " "
		local var_33_5 = var_33_2:Find("add/base")

		setText(var_33_5, iter_33_1.value)

		local var_33_6 = var_33_2:Find("add")

		setText(var_33_6, var_33_4)
	end
end

function var_0_0.UpdateAbilityAddition(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0.commanderVO

	arg_34_0:_UpdateAbilityAddition(var_34_0, arg_34_1)
end

function var_0_0._UpdateAbilityAddition(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_1:getAbilitysAddition()
	local var_35_1

	if arg_35_2 then
		var_35_1 = arg_35_2:getAbilitysAddition()
	end

	local var_35_2 = 0

	for iter_35_0, iter_35_1 in pairs(var_35_0) do
		if iter_35_1 > 0 then
			local var_35_3 = arg_35_0.abilityAdditionTF:GetChild(var_35_2)

			GetImageSpriteFromAtlasAsync("attricon", iter_35_0, var_35_3:Find("bg/icon"), false)
			setText(var_35_3:Find("bg/name"), AttributeType.Type2Name(iter_35_0))

			local var_35_4 = string.format("%0.3f", iter_35_1)

			setText(var_35_3:Find("bg/value"), ("+" .. math.floor(iter_35_1 * 1000) / 1000) .. "%")

			local var_35_5 = var_35_1 and var_35_1[iter_35_0] or iter_35_1

			setActive(var_35_3:Find("up"), var_35_5 < iter_35_1)
			setActive(var_35_3:Find("down"), iter_35_1 < var_35_5)

			var_35_2 = var_35_2 + 1
		end
	end
end

function var_0_0.UpdateTalents(arg_36_0)
	local var_36_0 = arg_36_0.commanderVO
	local var_36_1 = var_36_0:GetDisplayTalents()

	arg_36_0.talentList:make(function(arg_37_0, arg_37_1, arg_37_2)
		if arg_37_0 == UIItemList.EventUpdate then
			local var_37_0 = var_36_1[arg_37_1 + 1]

			arg_36_0:UpdateTalent(var_36_0, var_37_0, arg_37_2)
		end
	end)
	arg_36_0.talentList:align(#var_36_1)
end

function var_0_0.UpdateTalent(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	setText(arg_38_3:Find("Text"), arg_38_2:getConfig("name"))
	GetImageSpriteFromAtlasAsync("CommanderTalentIcon/" .. arg_38_2:getConfig("icon"), "", arg_38_3)

	if arg_38_3:GetComponent(typeof(Button)) then
		onButton(arg_38_0, arg_38_3, function()
			arg_38_0.contextData.treePanel:ExecuteAction("Show", arg_38_2)
		end, SFX_PANEL)
	end

	setActive(arg_38_3:Find("lock"), not arg_38_1:IsLearnedTalent(arg_38_2.id))
end

function var_0_0.UpdateTalentAddition(arg_40_0)
	local var_40_0 = arg_40_0.commanderVO

	arg_40_0:_UpdateTalentAddition(var_40_0)
end

function var_0_0._UpdateTalentAddition(arg_41_0, arg_41_1)
	local var_41_0
	local var_41_1 = _.values(arg_41_1:getTalentsDesc())

	arg_41_0.talentAdditionList:make(function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_0 == UIItemList.EventUpdate then
			local var_42_0 = var_41_1[arg_42_1 + 1]

			setScrollText(findTF(arg_42_2, "bg/name_mask/name"), var_42_0.name)

			local var_42_1 = var_42_0.type == CommanderConst.TALENT_ADDITION_RATIO and "%" or ""

			setText(arg_42_2:Find("bg/value"), (var_42_0.value > 0 and "+" or "") .. var_42_0.value .. var_42_1)
			setActive(arg_42_2:Find("up"), false)
			setActive(arg_42_2:Find("down"), false)

			arg_42_2:Find("bg"):GetComponent(typeof(Image)).enabled = arg_42_1 % 2 ~= 0
		end
	end)
	arg_41_0.talentAdditionList:align(#var_41_1)
end

function var_0_0.UpdateSkills(arg_43_0)
	local var_43_0 = arg_43_0.commanderVO:getSkills()[1]

	GetImageSpriteFromAtlasAsync("commanderskillicon/" .. var_43_0:getConfig("icon"), "", arg_43_0.skillIcon)
	onButton(arg_43_0, arg_43_0.skillIcon, function()
		arg_43_0:emit(CommanderCatMediator.SKILL_INFO, var_43_0)
	end, SFX_PANEL)
end

function var_0_0.CanBack(arg_45_0)
	if arg_45_0.renamePanel and arg_45_0.renamePanel:GetLoaded() and arg_45_0.renamePanel:isShowing() then
		arg_45_0.renamePanel:Hide()

		return false
	end

	return true
end

function var_0_0.OnDestroy(arg_46_0)
	if arg_46_0.isBlur then
		pg.UIMgr.GetInstance():UnblurPanel(arg_46_0.blurPanel, arg_46_0.blurPanelParent)
	end

	if arg_46_0.renamePanel then
		arg_46_0.renamePanel:Destroy()

		arg_46_0.renamePanel = nil
	end
end

function var_0_0.Blur(arg_47_0)
	if arg_47_0.isOnAddition or arg_47_0.isOnSkill or arg_47_0.isOnOther then
		arg_47_0.isBlur = true

		pg.UIMgr.GetInstance():BlurPanel(arg_47_0.blurPanel)
	else
		arg_47_0.isBlur = false

		pg.UIMgr.GetInstance():UnblurPanel(arg_47_0.blurPanel, arg_47_0.blurPanelParent)
	end
end

return var_0_0

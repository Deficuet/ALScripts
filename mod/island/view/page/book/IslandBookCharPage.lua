local var_0_0 = class("IslandBookCharPage", import(".IslandBookItemPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandBookCharUI"
end

function var_0_0.GetIllustrationType(arg_2_0)
	return IslandIllustration.TYPES.CHAR
end

function var_0_0.OnLoaded(arg_3_0)
	var_0_0.super.OnLoaded(arg_3_0)

	arg_3_0.getPointBtn = arg_3_0.rightTF:Find("get_btn")

	setText(arg_3_0.getPointBtn:Find("Text"), i18n("island_guide_collectionpoint"))

	arg_3_0.pointPanel = arg_3_0._tf:Find("point_panel")
	arg_3_0.pointLevelTF = arg_3_0.pointPanel:Find("Text")
	arg_3_0.pointAwardTF = arg_3_0.pointPanel:Find("award")
	arg_3_0.pointAwardIcon = arg_3_0.pointPanel:Find("award/icon")
	arg_3_0.getPointAwardBtn = arg_3_0.pointPanel:Find("award/get")
	arg_3_0.gotAllPointAwardTF = arg_3_0.pointPanel:Find("award/got")
	arg_3_0.openAwardWinBtn = arg_3_0.pointPanel:Find("award_btn")
	arg_3_0.pointSliderTF = arg_3_0.pointPanel:Find("slider")
	arg_3_0.pointProgressTF = arg_3_0.pointPanel:Find("slider/progress")
	arg_3_0.awardListBox = IslandBookAwardListBox.New(arg_3_0._tf, arg_3_0.event)
	arg_3_0.starList = UIItemList.New(arg_3_0.rightTF:Find("stars"), arg_3_0.rightTF:Find("stars/tpl"))
end

function var_0_0.OnInit(arg_4_0)
	var_0_0.super.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0.getPointBtn, function()
		arg_4_0.getPointBtn:GetComponent(typeof(Animation)):Play()
		arg_4_0:emit(IslandMediator.GET_COLLECT_POINT, arg_4_0.canGetPointIds)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.getPointAwardBtn, function()
		arg_4_0.pointAwardTF:GetComponent(typeof(Animation)):Play()
		arg_4_0:emit(IslandMediator.GET_POINT_AWARD, arg_4_0.curLevelId)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.openAwardWinBtn, function()
		arg_4_0.openAwardWinBtn:GetComponent(typeof(Animation)):Play()
		arg_4_0.awardListBox:ExecuteAction("Show")
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("top/help"), function()
		arg_4_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_WHITOUT_BTN,
			content = i18n("island_guide_help"),
			title = i18n("island_guide_character_help")
		})
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_9_0)
	var_0_0.super.Flush(arg_9_0)
	arg_9_0:FlushPointInfos()
	arg_9_0:FlushPointAwardInfos()
end

function var_0_0.FlushPointInfos(arg_10_0)
	arg_10_0.canGetPointIds = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.showList) do
		if iter_10_1:GetStatus() == IslandIllustration.STATUS.UNLOCK and iter_10_1:IsTip() then
			table.insert(arg_10_0.canGetPointIds, iter_10_1.id)
		end
	end

	setActive(arg_10_0.getPointBtn, #arg_10_0.canGetPointIds > 0)
end

function var_0_0.FlushPointAwardInfos(arg_11_0)
	arg_11_0.curLevelId = arg_11_0.bookAgency:GetCurLevelPointAwardId()
	arg_11_0.awardConfig = pg.island_collection_reward[arg_11_0.curLevelId]

	setText(arg_11_0.pointLevelTF, i18n("island_book_collection_award_title", arg_11_0.awardConfig.level))

	arg_11_0.curPoint, arg_11_0.targetPoint = arg_11_0.bookAgency:GetCurPointInfos()

	setText(arg_11_0.pointProgressTF, arg_11_0.curPoint .. "/" .. arg_11_0.targetPoint)
	setSlider(arg_11_0.pointSliderTF, 0, 1, arg_11_0.curPoint / arg_11_0.targetPoint)

	local var_11_0 = arg_11_0.bookAgency:IsGotAllPointAward()

	setActive(arg_11_0.gotAllPointAwardTF, var_11_0)
	setActive(arg_11_0.getPointAwardBtn, not var_11_0 and arg_11_0.curPoint >= arg_11_0.targetPoint)

	local var_11_1 = Drop.Create(arg_11_0.awardConfig.award_display)

	GetImageSpriteFromAtlasAsync(var_11_1:getIcon(), "", arg_11_0.pointAwardIcon)
end

function var_0_0.FlushRightPanel(arg_12_0)
	if not arg_12_0.showIllustration then
		return
	end

	local var_12_0 = arg_12_0.showIllustration:GetStatus()

	setText(arg_12_0.rightNameTF, arg_12_0.showIllustration:GetName())
	setText(arg_12_0.rightEnNameTF, arg_12_0.showIllustration:GetEnName())

	local var_12_1 = var_12_0 == IslandIllustration.STATUS.UNLOCK
	local var_12_2 = var_12_1 and arg_12_0.showIllustration:GetDesc() or i18n("island_guide_lock_desc")

	setText(arg_12_0.rightDescTF, var_12_2)
	setActive(arg_12_0.unlockBtn, var_12_0 == IslandIllustration.STATUS.CAN_UNLOCK)

	local var_12_3 = arg_12_0.showIllustration:GetLinkConfigID()
	local var_12_4 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_12_3)

	setText(arg_12_0.rightNameTF:Find("level"), var_12_1 and " - Lv." .. var_12_4:GetLevel() or "")

	local var_12_5 = var_12_4 and var_12_4:GetBreakLevel() or 0

	arg_12_0.starList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_13_1 + 1

			setActive(arg_13_2:Find("Image"), var_13_0 <= var_12_5)
		end
	end)
	arg_12_0.starList:align(arg_12_0:GetShipBreakMaxLevel(var_12_3))
end

function var_0_0.GetShipBreakMaxLevel(arg_14_0, arg_14_1)
	return pg.island_chara_template[arg_14_1].upgrade_level[2] + 1
end

function var_0_0.OnDestrory(arg_15_0)
	if arg_15_0.awardListBox then
		arg_15_0.awardListBox:Destroy()

		arg_15_0.awardListBox = nil
	end
end

return var_0_0

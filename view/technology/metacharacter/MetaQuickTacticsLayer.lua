local var_0_0 = class("MetaQuickTacticsLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MetaQuickTacticsUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "MetaCharacterScene"
end

function var_0_0.init(arg_3_0)
	arg_3_0:initUITextTips()
	arg_3_0:initData()
	arg_3_0:initUI()
	arg_3_0:addListener()
	arg_3_0:overlayPanel(true)
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:initSkillInfoPanel()
	arg_4_0:initUIItemList()
end

function var_0_0.willExit(arg_5_0)
	arg_5_0:overlayPanel(false)
end

function var_0_0.onBackPressed(arg_6_0)
	arg_6_0:closeView()
end

function var_0_0.initUITextTips(arg_7_0)
	local var_7_0 = arg_7_0._tf:Find("Content/SkillInfo/UseTip")

	setText(var_7_0, i18n("metaskill_up"))
end

function var_0_0.initData(arg_8_0)
	arg_8_0.metaProxy = getProxy(MetaCharacterProxy)
	arg_8_0.bagProxy = getProxy(BagProxy)
	arg_8_0.bayProxy = getProxy(BayProxy)
	arg_8_0.shipID = arg_8_0.contextData.shipID
	arg_8_0.skillID = arg_8_0.contextData.skillID
	arg_8_0.bookIDList = pg.item_data_statistics.get_id_list_by_type[Item.METALESSON_TYPE]
	arg_8_0.useCountDict = {}
	arg_8_0.maxCountDict = {}
	arg_8_0.useCountTextDict = {}

	arg_8_0:resetUseData()

	arg_8_0.colorDict = {
		[ItemRarity.Blue] = "#70D4FAFF",
		[ItemRarity.Purple] = "#C380FBFF",
		[ItemRarity.Gold] = "#FFCC4DFF"
	}
	arg_8_0.expDict = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.bookIDList) do
		arg_8_0.expDict[iter_8_1] = tonumber(Item.getConfigData(iter_8_1).usage_arg)
	end
end

function var_0_0.initUI(arg_9_0)
	arg_9_0.bg = arg_9_0._tf:Find("BG")
	arg_9_0.tpl = arg_9_0._tf:Find("TacticsTpl")

	local var_9_0 = arg_9_0._tf:Find("Content")

	arg_9_0.closeBtn = var_9_0:Find("Title/CloseBtn")

	local var_9_1 = var_9_0:Find("SkillInfo")
	local var_9_2 = var_9_1:Find("Skill")

	arg_9_0.skillNameText = var_9_2:Find("Name")
	arg_9_0.skillLevelText = var_9_2:Find("LevelNum")
	arg_9_0.skillLevelUpText = var_9_2:Find("LevelUp")

	local var_9_3 = var_9_1:Find("Exp")

	arg_9_0.curExpText = var_9_3:Find("CurExp")
	arg_9_0.addExpText = var_9_3:Find("AddExp")
	arg_9_0.totalExpText = var_9_3:Find("TotalExp")
	arg_9_0.progressBar = var_9_1:Find("Slider")
	arg_9_0.containerTF = var_9_0:Find("Container")

	local var_9_4 = var_9_0:Find("Action")

	arg_9_0.clearBtn = var_9_4:Find("ClearBtn")
	arg_9_0.onestepBtn = var_9_4:Find("OneStepBtn")
	arg_9_0.confirmBtn = var_9_4:Find("ConfirmBtn")
end

function var_0_0.addListener(arg_10_0)
	local function var_10_0()
		arg_10_0:closeView()
	end

	onButton(arg_10_0, arg_10_0.bg, var_10_0, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.closeBtn, var_10_0, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.clearBtn, function()
		arg_10_0:resetUseData()
		arg_10_0:updateAfterModifyUseCount()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.onestepBtn, function()
		arg_10_0:oneStep()
		arg_10_0:updateAfterModifyUseCount()
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.confirmBtn, function()
		local var_14_0 = 0

		for iter_14_0, iter_14_1 in ipairs(arg_10_0.bookIDList) do
			var_14_0 = var_14_0 + arg_10_0.useCountDict[iter_14_1]
		end

		if var_14_0 <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_materal_no_enough"))
		else
			local var_14_1, var_14_2 = arg_10_0:preCalcExpOverFlow(0, 0)

			if var_14_1 then
				arg_10_0:emit(MetaQuickTacticsMediator.OPEN_OVERFLOW_LAYER, arg_10_0.shipID, arg_10_0.skillID, arg_10_0.useCountDict, var_14_2)
			else
				arg_10_0:emit(MetaQuickTacticsMediator.USE_TACTICS_BOOK, arg_10_0.shipID, arg_10_0.skillID, arg_10_0.useCountDict)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.overlayPanel(arg_15_0, arg_15_1)
	if arg_15_1 and arg_15_0._tf then
		arg_15_0:OverlayPanel(arg_15_0._tf)
	elseif arg_15_0._tf then
		arg_15_0:UnOverlayPanel(arg_15_0._tf)
	end
end

function var_0_0.initSkillInfoPanel(arg_16_0)
	local var_16_0 = arg_16_0.skillID
	local var_16_1 = arg_16_0.bayProxy:getShipById(arg_16_0.shipID):getMetaSkillLevelBySkillID(var_16_0)
	local var_16_2 = getSkillConfig(var_16_0)
	local var_16_3 = getSkillName(var_16_2.id)

	setText(arg_16_0.skillNameText, var_16_3)
	setText(arg_16_0.skillLevelText, "LEVEL:" .. var_16_1)
	setText(arg_16_0.skillLevelUpText, "")

	local var_16_4 = arg_16_0.metaProxy:getMetaTacticsInfoByShipID(arg_16_0.shipID):getSkillExp(var_16_0)
	local var_16_5 = MetaCharacterConst.getMetaSkillTacticsConfig(var_16_0, var_16_1).need_exp

	setText(arg_16_0.curExpText, var_16_4)
	setText(arg_16_0.totalExpText, var_16_5)
	setText(arg_16_0.addExpText, "[+0]")
	setSlider(arg_16_0.progressBar, 0, var_16_5, var_16_4)
end

function var_0_0.initUIItemList(arg_17_0)
	arg_17_0.uiitemList = UIItemList.New(arg_17_0.containerTF, arg_17_0.tpl)

	arg_17_0.uiitemList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			arg_18_1 = arg_18_1 + 1

			arg_17_0:updateTpl(arg_18_1, arg_18_2)
		end
	end)
	arg_17_0.uiitemList:align(#arg_17_0.bookIDList)
end

function var_0_0.updateUIItemList(arg_19_0)
	arg_19_0.uiitemList:align(#arg_19_0.bookIDList)
end

function var_0_0.updateTpl(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_2:Find("IconTpl")
	local var_20_1 = arg_20_2:Find("Name")
	local var_20_2 = arg_20_2:Find("MinusTenBtn")
	local var_20_3 = arg_20_2:Find("AddTenBtn")
	local var_20_4 = arg_20_2:Find("MinusBtn")
	local var_20_5 = arg_20_2:Find("AddBtn")
	local var_20_6 = arg_20_2:Find("TextBG/UseNum")
	local var_20_7 = arg_20_0.bookIDList[arg_20_1]
	local var_20_8 = arg_20_0:getBookItem(var_20_7)
	local var_20_9 = arg_20_0.bagProxy:getItemCountById(var_20_7)

	if var_20_9 == 0 then
		var_20_9 = "0"
	end

	local var_20_10 = Drop.New({
		id = var_20_7,
		type = DROP_TYPE_ITEM,
		count = var_20_9
	})

	updateDrop(var_20_0, var_20_10)

	local var_20_11 = var_20_8:getConfig("name")
	local var_20_12 = var_20_8:getConfig("rarity")
	local var_20_13 = setColorStr(var_20_11, arg_20_0.colorDict[var_20_12])

	setText(var_20_1, var_20_13)

	arg_20_0.useCountTextDict[var_20_7] = var_20_6

	onButton(arg_20_0, var_20_2, function()
		arg_20_0:tryModifyUseCount(var_20_7, -10)
		arg_20_0:updateAfterModifyUseCount()
	end, SFX_PANEL)
	onButton(arg_20_0, var_20_3, function()
		if not arg_20_0:isMaxLevel() and not arg_20_0:isCanUpMax() then
			arg_20_0:tryModifyUseCount(var_20_7, 10)
			arg_20_0:updateAfterModifyUseCount()
		end
	end, SFX_PANEL)
	onButton(arg_20_0, var_20_4, function()
		arg_20_0:tryModifyUseCount(var_20_7, -1)
		arg_20_0:updateAfterModifyUseCount()
	end, SFX_PANEL)
	onButton(arg_20_0, var_20_5, function()
		if not arg_20_0:isMaxLevel() and not arg_20_0:isCanUpMax() then
			arg_20_0:tryModifyUseCount(var_20_7, 1)
			arg_20_0:updateAfterModifyUseCount()
		end
	end, SFX_PANEL)
end

function var_0_0.updateAfterModifyUseCount(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.bookIDList) do
		local var_25_0 = arg_25_0.useCountTextDict[iter_25_1]
		local var_25_1 = arg_25_0.useCountDict[iter_25_1]

		setText(var_25_0, var_25_1)
	end

	local var_25_2 = arg_25_0.shipID
	local var_25_3 = arg_25_0.skillID
	local var_25_4 = arg_25_0.bayProxy:getShipById(var_25_2):getMetaSkillLevelBySkillID(var_25_3)
	local var_25_5 = arg_25_0:calcAwardExp()
	local var_25_6 = arg_25_0:calcLevelWithAwardExp(var_25_5) - var_25_4

	if var_25_6 > 0 then
		setText(arg_25_0.skillLevelUpText, "+" .. var_25_6)
	else
		setText(arg_25_0.skillLevelUpText, "")
	end

	setText(arg_25_0.addExpText, string.format("[+%d]", var_25_5))

	local var_25_7 = MetaCharacterConst.getMetaSkillTacticsConfig(var_25_3, var_25_4)

	if var_25_7 then
		local var_25_8 = var_25_7.need_exp
		local var_25_9 = arg_25_0.metaProxy:getMetaTacticsInfoByShipID(var_25_2):getSkillExp(var_25_3)

		setText(arg_25_0.curExpText, var_25_9)
		setText(arg_25_0.totalExpText, var_25_8)
		setSlider(arg_25_0.progressBar, 0, var_25_8, var_25_9 + var_25_5)
	end
end

function var_0_0.updateAfterUse(arg_26_0)
	local var_26_0 = arg_26_0.shipID
	local var_26_1 = arg_26_0.skillID
	local var_26_2 = arg_26_0.bayProxy:getShipById(var_26_0):getMetaSkillLevelBySkillID(var_26_1)

	setText(arg_26_0.skillLevelText, "LEVEL:" .. var_26_2)

	if arg_26_0:isMaxLevel() then
		setText(arg_26_0.curExpText, "MAX")
		setSlider(arg_26_0.progressBar, 0, 1, 1)
	end

	arg_26_0:updateUIItemList()
end

function var_0_0.getBookItem(arg_27_0, arg_27_1)
	return arg_27_0.bagProxy:getItemById(arg_27_1) or Drop.New({
		count = 0,
		type = DROP_TYPE_ITEM,
		id = arg_27_1
	})
end

function var_0_0.resetUseData(arg_28_0)
	arg_28_0.useCountDict = arg_28_0.useCountDict or {}
	arg_28_0.maxCountDict = arg_28_0.maxCountDict or {}

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.bookIDList) do
		arg_28_0.useCountDict[iter_28_1] = 0
		arg_28_0.maxCountDict[iter_28_1] = arg_28_0.bagProxy:getItemCountById(iter_28_1)
	end
end

function var_0_0.tryModifyUseCount(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_0.maxCountDict[arg_29_1]
	local var_29_1 = arg_29_0.useCountDict[arg_29_1]

	if var_29_0 <= 0 then
		return
	end

	if arg_29_2 < 0 then
		local var_29_2 = math.clamp(var_29_1 + arg_29_2, 0, var_29_0)

		arg_29_0.useCountDict[arg_29_1] = var_29_2
	else
		local var_29_3 = math.min(var_29_0, arg_29_2)
		local var_29_4 = arg_29_0.expDict[arg_29_1]
		local var_29_5 = 0

		for iter_29_0 = 0, var_29_3 do
			local var_29_6 = var_29_5 * var_29_4

			if not arg_29_0:preCalcExpOverFlow(var_29_6, 0) then
				var_29_5 = iter_29_0

				if var_29_3 <= var_29_5 or var_29_0 <= var_29_1 + var_29_5 then
					break
				end
			end
		end

		arg_29_0.useCountDict[arg_29_1] = var_29_1 + var_29_5
	end
end

function var_0_0.getLevelTotalExp(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.skillID
	local var_30_1 = arg_30_0.bayProxy:getShipById(arg_30_0.shipID)
	local var_30_2 = pg.skill_data_template[var_30_0].max_level
	local var_30_3 = pg.ship_meta_skilltask.get_id_list_by_skill_ID[var_30_0]
	local var_30_4 = 0

	for iter_30_0, iter_30_1 in ipairs(var_30_3) do
		local var_30_5 = pg.ship_meta_skilltask[iter_30_1]
		local var_30_6 = var_30_5.level
		local var_30_7 = var_30_5.need_exp

		if var_30_6 < arg_30_1 then
			var_30_4 = var_30_4 + var_30_7
		end
	end

	return var_30_4
end

function var_0_0.getCurLevelExp(arg_31_0)
	local var_31_0 = arg_31_0.skillID
	local var_31_1 = arg_31_0.bayProxy:getShipById(arg_31_0.shipID):getMetaSkillLevelBySkillID(var_31_0)
	local var_31_2 = arg_31_0.metaProxy:getMetaTacticsInfoByShipID(arg_31_0.shipID):getSkillExp(var_31_0)

	return arg_31_0:getLevelTotalExp(var_31_1) + var_31_2
end

function var_0_0.calcAwardExp(arg_32_0)
	local var_32_0 = 0

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.bookIDList) do
		var_32_0 = var_32_0 + arg_32_0.useCountDict[iter_32_1] * arg_32_0.expDict[iter_32_1]
	end

	return var_32_0
end

function var_0_0.calcLevelWithAwardExp(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:getCurLevelExp() + arg_33_1
	local var_33_1 = arg_33_0.skillID
	local var_33_2 = pg.ship_meta_skilltask.get_id_list_by_skill_ID[var_33_1]
	local var_33_3 = 1

	for iter_33_0, iter_33_1 in ipairs(var_33_2) do
		local var_33_4 = pg.ship_meta_skilltask[iter_33_1].need_exp

		if var_33_4 <= var_33_0 then
			var_33_0 = var_33_0 - var_33_4
			var_33_3 = var_33_3 + 1
		else
			break
		end
	end

	return var_33_3
end

function var_0_0.isCanUpMax(arg_34_0)
	local var_34_0 = arg_34_0.skillID
	local var_34_1 = pg.skill_data_template[var_34_0].max_level

	return arg_34_0:getLevelTotalExp(var_34_1) <= arg_34_0:getCurLevelExp() + arg_34_0:calcAwardExp()
end

function var_0_0.preCalcExpOverFlow(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_0.skillID
	local var_35_1 = pg.skill_data_template[var_35_0].max_level
	local var_35_2 = arg_35_0:getLevelTotalExp(var_35_1) - arg_35_0:getCurLevelExp()
	local var_35_3 = arg_35_0:calcAwardExp()
	local var_35_4 = false
	local var_35_5
	local var_35_6 = var_35_3 + arg_35_1

	if var_35_2 <= var_35_6 then
		var_35_5 = var_35_6 - var_35_2

		if arg_35_2 <= var_35_5 then
			var_35_4 = true
		end
	end

	return var_35_4, var_35_5
end

function var_0_0.oneStep(arg_36_0)
	if arg_36_0:isMaxLevel() then
		return
	end

	arg_36_0:resetUseData()

	local var_36_0 = {}

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.bookIDList) do
		if arg_36_0:getBookItem(iter_36_1).count > 0 then
			table.insert(var_36_0, iter_36_1)
		end
	end

	table.sort(var_36_0, function(arg_37_0, arg_37_1)
		return arg_37_1 < arg_37_0
	end)

	for iter_36_2, iter_36_3 in ipairs(var_36_0) do
		local var_36_1 = arg_36_0:getBookItem(iter_36_3)
		local var_36_2 = arg_36_0.expDict[iter_36_3]
		local var_36_3 = iter_36_2 + 1 > #var_36_0 and 0 or arg_36_0.expDict[var_36_0[iter_36_2 + 1]]

		for iter_36_4 = 1, var_36_1.count do
			if iter_36_2 < #var_36_0 and arg_36_0:preCalcExpOverFlow(var_36_2, var_36_3) then
				break
			else
				arg_36_0.useCountDict[iter_36_3] = arg_36_0.useCountDict[iter_36_3] + 1

				if arg_36_0:isCanUpMax() then
					return
				end
			end
		end
	end
end

function var_0_0.isMaxLevel(arg_38_0)
	local var_38_0 = arg_38_0.skillID
	local var_38_1 = arg_38_0.shipID

	return arg_38_0.bayProxy:getShipById(var_38_1):isSkillLevelMax(var_38_0)
end

return var_0_0

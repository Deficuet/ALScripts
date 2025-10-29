local var_0_0 = class("NewEducateScheduleScene", import("view.newEducate.base.NewEducateBaseUI"))

var_0_0.PLAN_CNT = 5
var_0_0.TALENT_CNT = 4

function var_0_0.getUIName(arg_1_0)
	return "NewEducateScheduleUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rootTF = arg_2_0._tf:Find("root")
	arg_2_0.bgTF = arg_2_0.rootTF:Find("bg")
	arg_2_0.mainTF = arg_2_0.rootTF:Find("main")
	arg_2_0.leftTF = arg_2_0.rootTF:Find("main/left")

	local var_2_0 = arg_2_0.leftTF:Find("title")

	arg_2_0.titleRoundTF = var_2_0:Find("round_container/title_round")

	setText(var_2_0:Find("title_front"), i18n("child2_plan_title_front"))
	setText(var_2_0:Find("title_back"), i18n("child2_plan_title_back"))

	arg_2_0.targetTF = arg_2_0.leftTF:Find("target")

	arg_2_0:InitPlanView()

	arg_2_0.planCountTF = arg_2_0.leftTF:Find("cell_title/Text")

	local var_2_1 = arg_2_0.leftTF:Find("cells")
	local var_2_2 = arg_2_0.leftTF:Find("cell_tpl")

	setActive(var_2_2, false)

	arg_2_0.cells = {}

	for iter_2_0 = 1, var_0_0.PLAN_CNT do
		arg_2_0.cells[iter_2_0] = {
			tf = cloneTplTo(var_2_2, var_2_1, iter_2_0)
		}
	end

	arg_2_0.rightTF = arg_2_0.rootTF:Find("main/right")
	arg_2_0.effectTF = arg_2_0.rightTF:Find("effect")
	arg_2_0.moneyTF = arg_2_0.rightTF:Find("money")
	arg_2_0.moodTF = arg_2_0.rightTF:Find("mood")

	setText(arg_2_0.rightTF:Find("attr_title/Text"), i18n("child2_attr_title"))

	arg_2_0.attrsTF = arg_2_0.rightTF:Find("attrs")

	setText(arg_2_0.rightTF:Find("talent_title/Text"), i18n("child2_talent_title"))

	arg_2_0.talentsTF = arg_2_0.rightTF:Find("talents")

	setText(arg_2_0.rightTF:Find("status_title/Text"), i18n("child2_status_title"))

	arg_2_0.statusTF = arg_2_0.rightTF:Find("status")

	arg_2_0:InitRightPanel()

	arg_2_0.skipToggle = arg_2_0.rightTF:Find("skip/skip_toggle")

	setText(arg_2_0.rightTF:Find("skip/Text"), i18n("child_plan_skip"))

	arg_2_0.skipToggleCom = arg_2_0.skipToggle:GetComponent(typeof(Toggle))
	arg_2_0.nextBtn = arg_2_0.rightTF:Find("next")
end

function var_0_0.GetSkipLocalKey(arg_3_0)
	return NewEducateConst.NEW_EDUCATE_SKIP_PLANS_ANIM .. "_" .. arg_3_0.playerID .. "_" .. arg_3_0.contextData.char.id
end

function var_0_0.SetData(arg_4_0)
	arg_4_0.playerID = getProxy(PlayerProxy):getRawData().id
	arg_4_0.planList = arg_4_0.contextData.char:GetPlanList()
	arg_4_0.attrIds = arg_4_0.contextData.char:GetAttrIds()
	arg_4_0.talents = arg_4_0.contextData.char:GetTalentList()
	arg_4_0.status = arg_4_0.contextData.char:GetStatusList()
	arg_4_0.unlockPlanNum = arg_4_0.contextData.char:GetRoundData():getConfig("plan_num")
	arg_4_0.moneyResId = arg_4_0.contextData.char:GetResIdByType(NewEducateChar.RES_TYPE.MONEY)
	arg_4_0.moodResId = arg_4_0.contextData.char:GetResIdByType(NewEducateChar.RES_TYPE.MOOD)
	arg_4_0.selectedCellIdx = 1
	arg_4_0.discountInfos = arg_4_0.contextData.char:GetPlanDiscountInfos()
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:OverlayPanel(arg_5_0.mainTF, {
		pbList = {
			arg_5_0.mainTF:Find("bg")
		}
	})
	onButton(arg_5_0, arg_5_0.mainTF:Find("top/return_btn"), function()
		arg_5_0:onBackPressed()
	end, SFX_PANEL)
	onToggle(arg_5_0, arg_5_0.skipToggle, function(arg_7_0)
		PlayerPrefs.SetInt(arg_5_0:GetSkipLocalKey(), arg_7_0 and 1 or 0)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.nextBtn, function()
		local var_8_0 = {}
		local var_8_1 = ""
		local var_8_2 = false

		if arg_5_0.selectedCnt < arg_5_0.unlockPlanNum then
			var_8_1 = i18n("child2_schedule_sure_tip")
			var_8_2 = true
		end

		if arg_5_0.contextData.char:GetPoint() > 0 then
			var_8_1 = var_8_2 and i18n("child2_schedule_sure_tip3") or i18n("child2_schedule_sure_tip2")
		end

		table.insert(var_8_0, function(arg_9_0)
			if var_8_1 ~= "" then
				arg_5_0:emit(var_0_0.ON_BOX, {
					content = var_8_1,
					onYes = arg_9_0
				})
			else
				arg_9_0()
			end
		end)
		seriesAsync(var_8_0, function()
			arg_5_0:emit(NewEducateScheduleMediator.ON_SELECTED_PLANS, arg_5_0.skipToggleCom.isOn, arg_5_0.cells)
		end)
	end, SFX_PANEL)
	onScroll(arg_5_0, arg_5_0.statusTF, function(arg_11_0)
		eachChild(arg_5_0.statusUIList.container, function(arg_12_0)
			triggerToggle(arg_12_0, false)
		end)
	end)
	arg_5_0:SetData()

	local var_5_0 = PlayerPrefs.GetInt(arg_5_0:GetSkipLocalKey())

	triggerToggle(arg_5_0.skipToggle, var_5_0 == 1)
	arg_5_0:UpdateTitle()
	arg_5_0:FlushPlanView()
	arg_5_0:UpdateCells()
	arg_5_0.talentUIList:align(var_0_0.TALENT_CNT)
	arg_5_0.statusUIList:align(#arg_5_0.status)
	arg_5_0:UpdateReuslt()
	arg_5_0:CheckUpgradePlans()
end

function var_0_0.CheckUpgradePlans(arg_13_0)
	local var_13_0 = underscore.select(arg_13_0.planList, function(arg_14_0)
		return arg_14_0:GetNextId() and arg_13_0.contextData.char:IsMatchComplex(arg_14_0:getConfig("level_condition"))
	end)

	if #var_13_0 > 0 then
		local var_13_1 = {}

		underscore.select(var_13_0, function(arg_15_0)
			table.insert(var_13_1, arg_15_0.id)
		end)
		arg_13_0:emit(NewEducateScheduleMediator.ON_UPGRADE_PLANS, var_13_1)
	else
		NewEducateGuideSequence.CheckGuide(arg_13_0.__cname)
	end
end

function var_0_0.OnUpgradePlans(arg_16_0)
	arg_16_0.planList = getProxy(NewEducateProxy):GetCurChar():GetPlanList()

	arg_16_0:FlushPlanView()
	NewEducateGuideSequence.CheckGuide(arg_16_0.__cname)
end

function var_0_0.InitPlanView(arg_17_0)
	local var_17_0 = arg_17_0.leftTF:Find("plan_view/content")
	local var_17_1 = var_17_0:Find("tpl")

	setText(var_17_1:Find("condition/Text"), i18n("child2_plan_upgrade_condition"))

	arg_17_0.planUIList = UIItemList.New(var_17_0, var_17_1)

	arg_17_0.planUIList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			arg_17_0:UpdatePlan(arg_18_1, arg_18_2)
		end
	end)
end

function var_0_0.InitRightPanel(arg_19_0)
	arg_19_0.attrUIList = UIItemList.New(arg_19_0.attrsTF, arg_19_0.attrsTF:Find("tpl"))

	arg_19_0.attrUIList:make(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventInit then
			local var_20_0 = arg_19_0.attrIds[arg_20_1 + 1]
			local var_20_1 = pg.child2_attr[var_20_0]

			LoadImageSpriteAsync("neweducateicon/" .. var_20_1.icon, arg_20_2:Find("icon_bg/icon"))
			setScrollText(arg_20_2:Find("name_mask/name"), var_20_1.name)
		elseif arg_20_0 == UIItemList.EventUpdate then
			arg_19_0:UpdateAttr(arg_20_1, arg_20_2)
		end
	end)

	arg_19_0.talentUIList = UIItemList.New(arg_19_0.talentsTF, arg_19_0.talentsTF:Find("tpl"))

	arg_19_0.talentUIList:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventInit then
			arg_19_0:UpdateTalent(arg_21_1, arg_21_2)
		end
	end)

	local var_19_0 = arg_19_0.statusTF:Find("content/content")

	arg_19_0.statusUIList = UIItemList.New(var_19_0, var_19_0:Find("tpl"))

	arg_19_0.statusUIList:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventInit then
			arg_19_0:UpdateStatus(arg_22_1, arg_22_2)
		end
	end)
end

function var_0_0.UpdateTitle(arg_23_0)
	local var_23_0, var_23_1, var_23_2 = arg_23_0.contextData.char:GetRoundData():GetProgressInfo()

	setText(arg_23_0.titleRoundTF, var_23_0)
	setText(arg_23_0.targetTF:Find("round"), i18n("child2_assess_round", var_23_1))

	local var_23_3 = arg_23_0.contextData.char:GetAttrSum()

	setText(arg_23_0.targetTF:Find("target"), i18n("child2_schedule_target", var_23_3, var_23_2))
	setText(arg_23_0.targetTF:Find("value"), (var_23_3 < var_23_2 and setColorStr(var_23_3, "#ff6767") or var_23_3) .. "/" .. var_23_2)

	local var_23_4 = arg_23_0.contextData.char:GetRoundData():getConfig("main_background")

	setImageSprite(arg_23_0.bgTF, LoadSprite("bg/" .. var_23_4), false)
end

function var_0_0.UpdateCells(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.cells) do
		arg_24_0:UpdateCell(iter_24_0)
	end
end

function var_0_0.UpdateCellReduce(arg_25_0)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.cells) do
		local var_25_0 = arg_25_0.cells[iter_25_0].tf

		setActive(var_25_0:Find("unlock/reduce"), arg_25_0.cells[iter_25_0].plan and iter_25_0 + 1 == arg_25_0.selectedCellIdx)
	end
end

function var_0_0.UpdateCell(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.cells[arg_26_1].tf
	local var_26_1 = arg_26_0.cells[arg_26_1].plan

	var_26_0.name = arg_26_1

	local var_26_2 = arg_26_1 <= arg_26_0.unlockPlanNum

	setActive(var_26_0:Find("unlock"), var_26_2)
	setActive(var_26_0:Find("lock"), not var_26_2)

	if var_26_2 then
		setActive(var_26_0:Find("unlock/arrows"), false)
		setActive(var_26_0:Find("unlock/icon"), var_26_1)
		setActive(var_26_0:Find("unlock/reduce"), var_26_1 and arg_26_1 + 1 == arg_26_0.selectedCellIdx)

		if var_26_1 then
			LoadImageSpriteAsync("neweducateicon/" .. var_26_1:getConfig("icon_square"), var_26_0:Find("unlock/icon"))
		end
	end

	onButton(arg_26_0, var_26_0, function()
		if var_26_1 and arg_26_1 + 1 == arg_26_0.selectedCellIdx then
			arg_26_0.cells[arg_26_1].plan = nil
			arg_26_0.selectedCellIdx = math.max(arg_26_0.selectedCellIdx - 1, 1)

			arg_26_0:UpdateCell(arg_26_1)
			arg_26_0:UpdateCellReduce()
			arg_26_0:UpdateReuslt()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdatePlan(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.showList[arg_28_1 + 1]
	local var_28_1 = var_28_0:GetNextId()

	setText(arg_28_2:Find("name"), var_28_0:getConfig("name"))
	onButton(arg_28_0, arg_28_2, function()
		arg_28_0:OnClickPlan(var_28_0)
	end, SFX_PANEL)
	LoadImageSpriteAsync("neweducateicon/" .. var_28_0:getConfig("icon_rectangle"), arg_28_2:Find("icon"))

	local var_28_2 = var_28_0:GetCostShowInfos()
	local var_28_3 = var_28_0:GetCostWithBenefit(arg_28_0.discountInfos)
	local var_28_4 = UIItemList.New(arg_28_2:Find("normal/cost"), arg_28_2:Find("normal/cost/tpl"))

	var_28_4:make(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == UIItemList.EventUpdate then
			local var_30_0 = var_28_2[arg_30_1 + 1]

			NewEducateHelper.UpdateVectorItem(arg_30_2, var_30_0, "-")

			local var_30_1 = var_28_3[arg_30_1 + 1]

			if var_30_1.number ~= var_30_0.number then
				local var_30_2 = "(" .. var_30_1.number .. ")"

				setText(arg_30_2:Find("value"), "-" .. var_30_0.number .. var_30_2)
			end
		end
	end)
	var_28_4:align(#var_28_2)
	LoadImageSpriteAtlasAsync("ui/neweducatescheduleui_atlas", var_28_0:GetAwardBg(), arg_28_2:Find("normal/award"))

	local var_28_5 = var_28_0:GetAwardShowInfos()
	local var_28_6 = UIItemList.New(arg_28_2:Find("normal/award"), arg_28_2:Find("normal/award/tpl"))

	var_28_6:make(function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 == UIItemList.EventUpdate then
			local var_31_0 = var_28_5[arg_31_1 + 1]

			NewEducateHelper.UpdateVectorItem(arg_31_2, var_31_0, var_31_0.number > 0 and "+" or "")
		end
	end)
	var_28_6:align(#var_28_5)
	setActive(arg_28_2:Find("toggle"), var_28_1)

	if var_28_1 then
		local var_28_7 = var_28_0:getConfig("condition_desc")
		local var_28_8 = UIItemList.New(arg_28_2:Find("condition/conditions"), arg_28_2:Find("condition/conditions/tpl"))

		var_28_8:make(function(arg_32_0, arg_32_1, arg_32_2)
			if arg_32_0 == UIItemList.EventUpdate then
				local var_32_0 = var_28_7[arg_32_1 + 1]
				local var_32_1 = arg_28_0.contextData.char:LogicalOperator({
					operator = "||",
					conditions = var_32_0[1]
				})
				local var_32_2 = var_32_0[2]

				if not var_32_1 then
					var_32_2 = string.gsub(var_32_2, "f7f7f7", "ff6767")
				end

				setText(arg_32_2:Find("name"), var_32_2)
				setActive(arg_32_2:Find("icon"), false)
				setActive(arg_32_2:Find("value"), false)
			end
		end)
		var_28_8:align(#var_28_7)
	end
end

function var_0_0.OnClickPlan(arg_33_0, arg_33_1)
	if arg_33_0.selectedCellIdx > arg_33_0.unlockPlanNum then
		return
	end

	seriesAsync({
		function(arg_34_0)
			local var_34_0, var_34_1, var_34_2 = arg_33_0:CalcPlanResult(arg_33_1)

			if arg_33_0.contextData.char:GetRes(arg_33_0.moneyResId) + arg_33_0.moneyResult + var_34_0 < 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("child_plan_check_tip4"))

				return
			end

			arg_34_0()
		end
	}, function()
		arg_33_0.cells[arg_33_0.selectedCellIdx].plan = arg_33_1

		arg_33_0:UpdateCell(arg_33_0.selectedCellIdx)

		arg_33_0.selectedCellIdx = arg_33_0.selectedCellIdx + 1

		arg_33_0:UpdateCellReduce()
		arg_33_0:UpdateReuslt()
	end)
end

function var_0_0.FlushPlanView(arg_36_0)
	arg_36_0.showList = underscore.select(arg_36_0.planList, function(arg_37_0)
		return arg_37_0:IsShow()
	end)

	arg_36_0.planUIList:align(#arg_36_0.showList)
end

function var_0_0.UpdateEffect(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0.contextData.char:GetMoodStage(arg_38_1)

	setText(arg_38_0.effectTF, string.gsub("$1", "$1", i18n("child2_mood_desc" .. var_38_0)))
end

function var_0_0.UpdateTalent(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0.talents[arg_39_1 + 1]

	setActive(arg_39_2:Find("unlock"), var_39_0)
	setActive(arg_39_2:Find("lock"), not var_39_0)
	setImageAlpha(arg_39_2, var_39_0 and 1 or 0.4)

	if var_39_0 then
		LoadImageSpriteAsync("neweducateicon/" .. var_39_0:getConfig("item_icon_little"), arg_39_2:Find("unlock/icon"))
		setText(arg_39_2:Find("unlock/name"), shortenString(var_39_0:getConfig("name"), 5))
		setText(arg_39_2:Find("unlock/info/content/name"), var_39_0:getConfig("name"))
		setText(arg_39_2:Find("unlock/info/content/desc"), var_39_0:getConfig("desc"))
	end
end

function var_0_0.UpdateStatus(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0.status[arg_40_1 + 1]

	LoadImageSpriteAsync("neweducateicon/" .. var_40_0:getConfig("item_icon"), arg_40_2:Find("icon"))

	local var_40_1 = var_40_0:getConfig("during_time")
	local var_40_2 = var_40_0:GetEndRound() - arg_40_0.contextData.char:GetRoundData().round
	local var_40_3 = var_40_1 == -1 and i18n("child2_status_time2") or i18n("child2_status_time1", var_40_2)

	setText(arg_40_2:Find("time/Text"), var_40_3)
	setText(arg_40_2:Find("info/content/name"), var_40_0:getConfig("name"))
	setText(arg_40_2:Find("info/content/desc"), var_40_0:getConfig("desc"))
end

function var_0_0.CalcPlanResult(arg_41_0, arg_41_1)
	local var_41_0 = 0
	local var_41_1 = 0

	underscore.each(arg_41_1:GetCostWithBenefit(arg_41_0.discountInfos), function(arg_42_0)
		switch(arg_42_0.type, {
			[NewEducateConst.DROP_TYPE.RES] = function()
				if arg_42_0.id == arg_41_0.moneyResId then
					var_41_0 = var_41_0 + arg_42_0.number
				elseif arg_42_0.id == arg_41_0.moodResId then
					var_41_1 = var_41_1 + arg_42_0.number
				end
			end
		})
	end)

	local var_41_2 = 0
	local var_41_3 = 0
	local var_41_4 = {}

	underscore.each(arg_41_1:GetAwardShowInfos(), function(arg_44_0)
		switch(arg_44_0.type, {
			[NewEducateConst.DROP_TYPE.RES] = function()
				if arg_44_0.id == arg_41_0.moneyResId then
					var_41_2 = var_41_2 + arg_44_0.number
				elseif arg_44_0.id == arg_41_0.moodResId then
					var_41_3 = var_41_3 + arg_44_0.number
				end
			end,
			[NewEducateConst.DROP_TYPE.ATTR] = function()
				if not var_41_4[arg_44_0.id] then
					var_41_4[arg_44_0.id] = 0
				end

				var_41_4[arg_44_0.id] = var_41_4[arg_44_0.id] + arg_44_0.number
			end
		})
	end)

	return var_41_2 - var_41_0, var_41_3 - var_41_1, var_41_4
end

function var_0_0.CalcCurResult(arg_47_0)
	arg_47_0.attrResult = {}
	arg_47_0.moneyResult = 0
	arg_47_0.moodResult = 0

	underscore.each(arg_47_0.cells, function(arg_48_0)
		if arg_48_0.plan then
			local var_48_0, var_48_1, var_48_2 = arg_47_0:CalcPlanResult(arg_48_0.plan)

			arg_47_0.moneyResult = arg_47_0.moneyResult + var_48_0
			arg_47_0.moodResult = arg_47_0.moodResult + var_48_1

			for iter_48_0, iter_48_1 in pairs(var_48_2) do
				if not arg_47_0.attrResult[iter_48_0] then
					arg_47_0.attrResult[iter_48_0] = 0
				end

				arg_47_0.attrResult[iter_48_0] = arg_47_0.attrResult[iter_48_0] + iter_48_1
			end
		end
	end)
end

function var_0_0.GetColor(arg_49_0, arg_49_1)
	if arg_49_1 == 0 then
		return "ffffff"
	else
		return arg_49_1 > 0 and "2df7bc" or "ff6767"
	end
end

function var_0_0.UpdateAttr(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_0.attrIds[arg_50_1 + 1]
	local var_50_1 = arg_50_0.contextData.char:GetAttr(var_50_0)
	local var_50_2, var_50_3 = NewEducateInfoPanel.GetArrtInfo(pg.child2_attr[var_50_0].rank, var_50_1)

	setText(arg_50_2:Find("rank/Text"), var_50_2)
	setImageColor(arg_50_2:Find("rank"), Color.NewHex(EducateConst.GRADE_2_COLOR[var_50_2][2]))
	setText(arg_50_2:Find("before_value"), var_50_1)

	local var_50_4 = arg_50_0.attrResult[var_50_0] or 0

	setText(arg_50_2:Find("after_value"), var_50_1 + var_50_4)

	local var_50_5 = arg_50_0:GetColor(var_50_4)

	setImageColor(arg_50_2:Find("arrow"), Color.NewHex(var_50_5))
	setTextColor(arg_50_2:Find("after_value"), Color.NewHex(var_50_5))
end

function var_0_0.UpdateReuslt(arg_51_0)
	arg_51_0.selectedCnt = underscore.reduce(arg_51_0.cells, 0, function(arg_52_0, arg_52_1)
		return arg_52_0 + (arg_52_1.plan and 1 or 0)
	end)

	setText(arg_51_0.planCountTF, arg_51_0.selectedCnt .. "/" .. arg_51_0.unlockPlanNum)
	arg_51_0:CalcCurResult()

	local var_51_0 = arg_51_0.contextData.char:GetRes(arg_51_0.moneyResId)

	setText(arg_51_0.moneyTF:Find("before_value"), var_51_0)
	setText(arg_51_0.moneyTF:Find("after_value"), var_51_0 + arg_51_0.moneyResult)

	local var_51_1 = arg_51_0:GetColor(arg_51_0.moneyResult)

	setImageColor(arg_51_0.moneyTF:Find("arrow"), Color.NewHex(var_51_1))
	setTextColor(arg_51_0.moneyTF:Find("after_value"), Color.NewHex(var_51_1))

	local var_51_2 = arg_51_0.contextData.char:GetRes(arg_51_0.moodResId)

	setText(arg_51_0.moodTF:Find("before_value"), var_51_2)

	local var_51_3 = var_51_2 + arg_51_0.moodResult
	local var_51_4 = math.max(pg.child_resource[arg_51_0.moodResId].min_value, var_51_3)
	local var_51_5 = math.min(pg.child_resource[arg_51_0.moodResId].max_value, var_51_4)

	setText(arg_51_0.moodTF:Find("after_value"), var_51_5)

	local var_51_6 = arg_51_0:GetColor(arg_51_0.moodResult)

	setImageColor(arg_51_0.moodTF:Find("arrow"), Color.NewHex(var_51_6))
	setTextColor(arg_51_0.moodTF:Find("after_value"), Color.NewHex(var_51_6))
	arg_51_0:UpdateEffect(var_51_5)
	arg_51_0.attrUIList:align(#arg_51_0.attrIds)
end

function var_0_0.SetScheduleData(arg_53_0, arg_53_1)
	arg_53_0.contextData.scheduleDataTable.OnScheduleDone = arg_53_1
end

function var_0_0.willExit(arg_54_0)
	arg_54_0:UnOverlayPanel(arg_54_0.mainTF, arg_54_0.rootTF)
end

return var_0_0

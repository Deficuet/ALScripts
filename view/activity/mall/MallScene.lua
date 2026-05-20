local var_0_0 = class("MallScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MallUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.animDft = arg_2_0._tf:GetComponent(typeof(DftAniEvent))

	arg_2_0.animDft:SetEndEvent(function(arg_3_0)
		var_0_0.super.onBackPressed(arg_2_0)
	end)
	onButton(arg_2_0, arg_2_0.uiBackBtn, function()
		arg_2_0:onBackPressed()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiHomeBtn, function()
		arg_2_0:quickExitFunc()
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.uiHelpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.mall_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiMapBtn, function()
		arg_2_0:emit(MallMediator.CHANGE_SCENE, SCENE.MALL_MAP)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiBookBtn, function()
		arg_2_0:emit(MallMediator.GO_SUBLAYER, Context.New({
			mediator = MallStoryLineMediator,
			viewComponent = MallStoryLineLayer
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiOrderBtn, function()
		arg_2_0:emit(MallMediator.GO_SUBLAYER, Context.New({
			mediator = MallOrderMediator,
			viewComponent = MallOrderLayer,
			data = {
				onExit = function()
					arg_2_0:UpdateData()
					arg_2_0:UpdateView()
				end
			}
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiSummaryBtn, function()
		arg_2_0:ShowSummaryBox()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiAwardBtn, function()
		arg_2_0:emit(MallMediator.GO_SUBLAYER, Context.New({
			mediator = MallAwardMediator,
			viewComponent = MallAwardLayer,
			data = {
				onExit = function()
					arg_2_0:UpdateData()
					arg_2_0:UpdateView()
				end
			}
		}))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiRightUpgradeBtn, function()
		setActive(arg_2_0.uiRightUpgradeTF, true)
		setActive(arg_2_0.uiRightSummaryTF, false)
		setText(arg_2_0.uiRightTitleText, i18n("mall_right_title_summary"))
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiRightSummaryBtn, function()
		setActive(arg_2_0.uiRightSummaryTF, true)
		setActive(arg_2_0.uiRightUpgradeTF, false)
		setText(arg_2_0.uiRightTitleText, i18n("mall_right_title_upgrade"))
	end, SFX_PANEL)

	arg_2_0.upgradeUIList = UIItemList.New(arg_2_0.uiUpgradeConditionTF, arg_2_0.uiUpgradeConditionTF:Find("tpl"))

	arg_2_0.upgradeUIList:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateConditionTpl(arg_16_1, arg_16_2)
		end
	end)

	arg_2_0.upgradeBox = MallUpgradeBox.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.settleBox = MallSettleBox.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.summaryBox = MallSummaryBox.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)

	setText(arg_2_0.uiTitleText, i18n("mall_title"))
	setText(arg_2_0.uiTitleEnText, i18n("mall_title_en"))
	setText(arg_2_0.uiRoundHeaderText, i18n("mall_round_header"))
	setText(arg_2_0.uiLevelHeaderText, i18n("mall_level_header"))
	setText(arg_2_0.uiRightUpgradeTF:Find("max/Text"), i18n("mall_level_max"))
end

function var_0_0.didEnter(arg_17_0)
	arg_17_0:UpdateData()
	arg_17_0:UpdateView()
	triggerButton(arg_17_0.uiRightSummaryBtn)
end

function var_0_0.UpdateData(arg_18_0)
	arg_18_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MALL)

	assert(arg_18_0.activity and not arg_18_0.activity:isEnd(), "not exist mall act, type: " .. ActivityConst.ACTIVITY_TYPE_MALL)

	arg_18_0.levelDate = arg_18_0.activity:GetLevelData()
	arg_18_0.conditionList = arg_18_0.levelDate:getConfig("upgrade_task")
	arg_18_0.conditionDescList = arg_18_0.levelDate:getConfig("upgrade_task_desc")

	local var_18_0 = getProxy(ActivityProxy):getActivityById(arg_18_0.activity:getConfig("config_id"))
	local var_18_1 = ActivityPtData.New(var_18_0)

	arg_18_0.curPt = var_18_1.count
	arg_18_0.ptTargets = var_18_1.targets
	arg_18_0.ptUnlockStamps = var_18_1:GetDayUnlockStamps()
end

function var_0_0.UpdateView(arg_19_0)
	setText(arg_19_0.uiGoldText, arg_19_0.activity:GetGold())
	setText(arg_19_0.uiRoundText, arg_19_0.activity:GetRound())
	setText(arg_19_0.uiLevelText, arg_19_0.levelDate.level)

	local var_19_0 = arg_19_0.levelDate:IsMaxLevel()

	setActive(arg_19_0.uiRightUpgradeTF:Find("conditions"), not var_19_0)
	setActive(arg_19_0.uiRightUpgradeTF:Find("max"), var_19_0)
	arg_19_0.upgradeUIList:align(var_19_0 and 0 or #arg_19_0.conditionList)
	arg_19_0:UpdateFloors()
	arg_19_0:UpdateOrderBtn()
	arg_19_0:UpdateTips()
	arg_19_0:UpdateStartBtn()
end

function var_0_0.UpdateOrderBtn(arg_20_0)
	setActive(arg_20_0.uiOrderTimeTF, false)

	arg_20_0.orderData = arg_20_0.activity:GetOrderData()

	if arg_20_0.orderData.id ~= 0 then
		if pg.TimeMgr.GetInstance():GetServerTime() < arg_20_0.orderData:GetEndTime() then
			setActive(arg_20_0.uiOrderTimeTF, true)
			arg_20_0:StartTimer()
		end
	else
		arg_20_0:StopTimer()
	end
end

function var_0_0.UpdateTips(arg_21_0)
	setActive(arg_21_0.uiAwardTip, var_0_0.IsAwardTip())
	setActive(arg_21_0.uiOrderTip, var_0_0.IsOrderTip())
	setActive(arg_21_0.uiMapTip, var_0_0.IsMapTip())
end

function var_0_0.UpdateStartBtn(arg_22_0)
	local var_22_0 = false

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.activity:GetFloorList()) do
		if iter_22_1:IsUnlock() and iter_22_1:GetStaffList()[1] ~= 0 then
			var_22_0 = false

			break
		end

		var_22_0 = true
	end

	if var_22_0 then
		setActive(arg_22_0.uiStartBtn, false)
		setActive(arg_22_0.uiStartGreyBtn, true)
		onButton(arg_22_0, arg_22_0.uiStartGreyBtn, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("mall_floor_all_empty_tip"))
		end, SFX_PANEL)

		return
	end

	local var_22_1, var_22_2, var_22_3 = (function()
		local var_24_0 = pg.TimeMgr.GetInstance()

		for iter_24_0, iter_24_1 in ipairs(arg_22_0.ptTargets) do
			local var_24_1 = arg_22_0.ptUnlockStamps[iter_24_0]

			if var_24_1 and var_24_1 > var_24_0:GetServerTime() then
				local var_24_2 = var_24_0:STimeDescS(var_24_1, "%m")
				local var_24_3 = var_24_0:STimeDescS(var_24_1, "%d")

				return iter_24_0, var_24_2, var_24_3
			end
		end

		return nil
	end)()
	local var_22_4 = var_22_1 and var_22_1 - 1 or #arg_22_0.ptTargets
	local var_22_5 = arg_22_0.ptTargets[var_22_4] <= arg_22_0.curPt + arg_22_0.activity:GetGold()

	setActive(arg_22_0.uiStartBtn, not var_22_5 or not var_22_1)
	onButton(arg_22_0, arg_22_0.uiStartBtn, function()
		if var_22_5 and var_22_1 then
			return
		end

		arg_22_0:emit(MallMediator.SETTLE_ROUND, arg_22_0.activity.id)
	end, SFX_PANEL)
	setActive(arg_22_0.uiStartGreyBtn, var_22_5 and var_22_1)
	onButton(arg_22_0, arg_22_0.uiStartGreyBtn, function()
		if not var_22_5 then
			return
		end

		if var_22_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("mall_unlock_date_tip", var_22_2, var_22_3))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("mall_finished_all_tip"))
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateConditionTpl(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_0.conditionList[arg_27_1 + 1][1]
	local var_27_1 = arg_27_0.conditionList[arg_27_1 + 1][2]
	local var_27_2 = 0
	local var_27_3 = 0
	local var_27_4 = arg_27_0.conditionDescList[arg_27_1 + 1]

	switch(var_27_0, {
		[MallLevel.CONDITION_TYPE.ROUND] = function()
			var_27_2 = arg_27_0.activity:GetRound()
			var_27_3 = var_27_1[1]
		end,
		[MallLevel.CONDITION_TYPE.ORDER] = function()
			var_27_2 = #arg_27_0.activity:GetOrderData():GetFinishedList()
			var_27_3 = var_27_1[1]
		end,
		[MallLevel.CONDITION_TYPE.ROUND_INCOME] = function()
			var_27_2 = arg_27_0.activity:GetLastIncome()
			var_27_3 = var_27_1[1]
		end,
		[MallLevel.CONDITION_TYPE.FLOOR_INCOME] = function()
			var_27_2 = arg_27_0.activity:GetFloorData()[var_27_1[1]]:GetLastIncome()
			var_27_3 = var_27_1[2]
		end
	})

	local var_27_5 = var_27_3 <= var_27_2

	setActive(arg_27_2:Find("unfinished"), not var_27_5)
	setActive(arg_27_2:Find("finished"), var_27_5)

	local var_27_6 = var_27_5 and var_27_2 or setColorStr(var_27_2, "#bd5d4a")
	local var_27_7 = string.gsub(var_27_4, "$1", var_27_6)
	local var_27_8 = string.gsub(var_27_7, "$2", var_27_3)

	setText(arg_27_2:Find("Text"), var_27_8)
end

function var_0_0.UpdateFloors(arg_32_0)
	eachChild(arg_32_0.uiFloorsTF, function(arg_33_0)
		local var_33_0 = tonumber(arg_33_0.name)

		arg_32_0:UpdateFloorTpl(var_33_0, arg_33_0)
	end)
end

function var_0_0.UpdateFloorTpl(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_0.activity:GetFloor(arg_34_1)
	local var_34_1 = var_34_0:IsUnlock()

	setActive(arg_34_2:Find("lock"), not var_34_1)

	if arg_34_2:Find("sign") then
		setActive(arg_34_2:Find("sign"), var_34_1)
	end

	local var_34_2 = var_34_0:GetStaffList()
	local var_34_3 = underscore.reduce(var_34_2, 0, function(arg_35_0, arg_35_1)
		return arg_35_0 + (arg_35_1 ~= 0 and 1 or 0)
	end)

	setActive(arg_34_2:Find("bg"), var_34_3 ~= 0)
	setActive(arg_34_2:Find("empty"), var_34_3 == 0)
	setText(arg_34_2:Find("rank/Text"), var_34_3 .. "/" .. #var_34_2)

	local var_34_4 = {}

	for iter_34_0, iter_34_1 in ipairs(var_34_0:GetTargetInfos(arg_34_0.levelDate.level)) do
		table.insert(var_34_4, {
			cur = 0,
			id = iter_34_0,
			base = iter_34_1[1],
			max = iter_34_1[2]
		})
	end

	for iter_34_2, iter_34_3 in ipairs(var_34_2) do
		if iter_34_3 ~= 0 then
			local var_34_5 = arg_34_0.activity:GetStaff(iter_34_3)

			for iter_34_4, iter_34_5 in ipairs(var_34_5:GetAttrList()) do
				var_34_4[iter_34_4].cur = var_34_4[iter_34_4].cur + iter_34_5
			end
		end
	end

	local var_34_6 = underscore.select(var_34_4, function(arg_36_0)
		return arg_36_0.base ~= 0 and arg_36_0.max ~= 0
	end)
	local var_34_7 = underscore.reduce(var_34_6, 0, function(arg_37_0, arg_37_1)
		return arg_37_0 + arg_37_1.cur
	end)
	local var_34_8 = underscore.reduce(var_34_6, 0, function(arg_38_0, arg_38_1)
		return arg_38_0 + arg_38_1.base
	end)
	local var_34_9 = MallUtil.GetFloorRank(var_34_7, var_34_8)

	GetImageSpriteFromAtlasAsync("ui/mallui_atlas", "rank_" .. var_34_9, arg_34_2:Find("rank"), true)
	onButton(arg_34_0, arg_34_2, function()
		if not var_34_1 then
			return
		end

		arg_34_0:emit(MallMediator.GO_SUBLAYER, Context.New({
			mediator = MallStaffMediator,
			viewComponent = MallStaffLayer,
			data = {
				floorId = var_34_0.id
			}
		}))
	end, SFX_PANEL)
end

function var_0_0.StartTimer(arg_40_0)
	arg_40_0:StopTimer()

	arg_40_0.orderEndTime = arg_40_0.orderData:GetEndTime()
	arg_40_0.timer = Timer.New(function()
		local var_41_0 = arg_40_0.orderEndTime - pg.TimeMgr.GetInstance():GetServerTime()

		setText(arg_40_0.uiOrderTimeTF:Find("Text"), pg.TimeMgr.GetInstance():DescCDTime(var_41_0))

		if var_41_0 <= 0 then
			arg_40_0:UpdateOrderBtn()
			setActive(arg_40_0.uiOrderTip, true)
		end
	end, 1, -1)

	arg_40_0.timer:Start()
	arg_40_0.timer.func()
end

function var_0_0.StopTimer(arg_42_0)
	if arg_42_0.timer then
		arg_42_0.timer:Stop()

		arg_42_0.timer = nil
	end
end

function var_0_0.ShowUpgradeBox(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	arg_43_0.upgradeBox:ExecuteAction("Show", arg_43_1, arg_43_2, arg_43_3)
end

function var_0_0.ShowSettleBox(arg_44_0, arg_44_1, arg_44_2)
	arg_44_0.settleBox:ExecuteAction("Show", arg_44_1, arg_44_2)
end

function var_0_0.ShowSummaryBox(arg_45_0)
	arg_45_0.summaryBox:ExecuteAction("Show")
end

function var_0_0.onBackPressed(arg_46_0)
	if arg_46_0.upgradeBox and arg_46_0.upgradeBox:isShowing() then
		arg_46_0.upgradeBox:ExecuteAction("Hide")

		return
	end

	if arg_46_0.summaryBox and arg_46_0.summaryBox:isShowing() then
		arg_46_0.summaryBox:ExecuteAction("Hide")

		return
	end

	if arg_46_0.settleBox and arg_46_0.settleBox:isShowing() then
		arg_46_0.settleBox:ExecuteAction("Hide")

		return
	end

	quickPlayAnimation(arg_46_0._tf, "anim_MallUI_out")
end

function var_0_0.willExit(arg_47_0)
	arg_47_0.animDft:SetEndEvent(nil)

	if arg_47_0.upgradeBox then
		arg_47_0.upgradeBox:Destroy()

		arg_47_0.upgradeBox = nil
	end

	if arg_47_0.settleBox then
		arg_47_0.settleBox:Destroy()

		arg_47_0.settleBox = nil
	end

	if arg_47_0.summaryBox then
		arg_47_0.summaryBox:Destroy()

		arg_47_0.summaryBox = nil
	end

	arg_47_0:StopTimer()
end

function var_0_0.IsAwardTip()
	return MallAwardLayer.IsAwardTip() or MallAwardLayer.IsInputTip() or MallAwardLayer.IsTaskTip()
end

function var_0_0.IsOrderTip()
	local var_49_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MALL)
	local var_49_1 = var_49_0:GetOrderData()

	if var_49_1:IsFinishedAll() then
		return false
	end

	local var_49_2 = var_49_1:GetFinishedList()
	local var_49_3 = underscore.detect(pg.activity_mall_custom_order.all, function(arg_50_0)
		return not table.contains(var_49_2, arg_50_0)
	end)
	local var_49_4 = pg.activity_mall_custom_order[var_49_3]

	if not (var_49_0:GetLevelData().level >= var_49_4.unlock_lv and var_49_0:getDayIndex() >= var_49_4.unlock_time) then
		var_49_3 = 0
	end

	return var_49_3 ~= 0 and (var_49_1.startTime == 0 or pg.TimeMgr.GetInstance():GetServerTime() >= var_49_1:GetEndTime())
end

function var_0_0.IsMapTip()
	local var_51_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MALL)
	local var_51_1 = var_51_0:GetTriggeredPointIds()
	local var_51_2 = var_51_0:GetLevelData():GetUnlockStoryIds()

	return #underscore.select(var_51_2, function(arg_52_0)
		local var_52_0 = pg.activity_mall_story[arg_52_0]
		local var_52_1 = var_52_0.type ~= MallActivity.POINT_TYPE.SITE

		return not table.contains(var_51_1, arg_52_0) or var_52_1 and var_52_0.lua ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_52_0.lua)
	end) > 0
end

return var_0_0

local var_0_0 = class("EducateScheduleScene", import(".base.EducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EducateScheduleUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.initData(arg_3_0)
	arg_3_0.playerID = getProxy(PlayerProxy):getRawData().id
	arg_3_0.educateProxy = getProxy(EducateProxy)
	arg_3_0.char = arg_3_0.educateProxy:GetCharData()
	arg_3_0.curTime = arg_3_0.educateProxy:GetCurTime()
	arg_3_0.planProxy = arg_3_0.educateProxy:GetPlanProxy()
	arg_3_0.buffList = arg_3_0.educateProxy:GetBuffList()
	arg_3_0.natureIds = arg_3_0.char:GetAttrIdsByType(EducateChar.ATTR_TYPE_PERSONALITY)
	arg_3_0.majorIds = arg_3_0.char:GetAttrIdsByType(EducateChar.ATTR_TYPE_MAJOR)
	arg_3_0.minorIds = arg_3_0.char:GetAttrIdsByType(EducateChar.ATTR_TYPE_MINOR)

	arg_3_0:getLocalGridData()

	arg_3_0.contextData.indexDatas = arg_3_0.contextData.indexDatas or {}
end

function var_0_0.clearLocalPlans(arg_4_0)
	getProxy(EducateProxy):GetPlanProxy():ClearLocalPlansData()
	arg_4_0:getLocalGridData()
	arg_4_0:updateResultPanel()
	arg_4_0:closeSelectPanel()
end

function var_0_0.getLocalGridData(arg_5_0)
	local var_5_0 = arg_5_0.char:GetNextWeekPlanCnt()

	arg_5_0.gridData = {}

	for iter_5_0 = 1, 6 do
		arg_5_0.gridData[iter_5_0] = {}

		for iter_5_1 = 1, 3 do
			local var_5_1 = iter_5_1 <= var_5_0 and EducateGrid.TYPE_EMPTY or EducateGrid.TYPE_LOCK

			arg_5_0.gridData[iter_5_0][iter_5_1] = EducateGrid.New({
				type = var_5_1
			})
		end
	end

	for iter_5_2 = 1, 6 do
		arg_5_0.selectDay = iter_5_2

		for iter_5_3 = 1, var_5_0 do
			arg_5_0.selectIndex = iter_5_3

			local var_5_2 = PlayerPrefs.GetString(EducateConst.PLANS_DATA_KEY .. arg_5_0.playerID .. "_" .. iter_5_2 .. "_" .. iter_5_3)

			if var_5_2 ~= "" then
				local var_5_3 = string.split(var_5_2, "_")
				local var_5_4 = tonumber(var_5_3[1])
				local var_5_5 = tonumber(var_5_3[2])

				if arg_5_0:checkLocalPlan(var_5_4, var_5_5) then
					arg_5_0.gridData[iter_5_2][iter_5_3] = EducateGrid.New({
						id = var_5_4,
						type = var_5_5
					})
				end
			end
		end
	end

	arg_5_0.selectDay = nil
	arg_5_0.selectIndex = nil

	arg_5_0:recoverSpecEventForPlans()
end

function var_0_0.checkLocalPlan(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_2 == EducateGrid.TYPE_PLAN or arg_6_2 == EducateGrid.TYPE_PLAN_OCCUPY then
		local var_6_0 = EducatePlan.New(arg_6_1)
		local var_6_1 = var_6_0:getConfig("pre_next")

		return arg_6_0:CheckCondition(var_6_0) and not var_6_0:ExistNextPlanCanFill(arg_6_0.char)
	end

	return false
end

function var_0_0.recoverSpecEventForPlans(arg_7_0)
	local var_7_0 = arg_7_0.educateProxy:GetEventProxy():GetPlanSpecEvents()

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = iter_7_1:GetGridIndexs()

		for iter_7_2, iter_7_3 in ipairs(var_7_1) do
			local var_7_2 = iter_7_2 == 1 and EducateGrid.TYPE_EVENT or EducateGrid.TYPE_EVENT_OCCUPY
			local var_7_3 = EducateGrid.New({
				type = var_7_2,
				id = iter_7_1.id
			})

			arg_7_0:setGridDataForPlan(iter_7_3[1], iter_7_3[2], var_7_3)
		end
	end
end

function var_0_0.saveGridLocalData(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = arg_8_3.id .. "_" .. arg_8_3.type

	PlayerPrefs.SetString(EducateConst.PLANS_DATA_KEY .. arg_8_0.playerID .. "_" .. arg_8_1 .. "_" .. arg_8_2, var_8_0)
end

function var_0_0.setGridDataForPlan(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if not arg_9_0.gridData[arg_9_1][arg_9_2]:IsEmpty() then
		arg_9_0:clearGridData(arg_9_1, arg_9_2)
	end

	local var_9_0 = arg_9_3:GetOccupyGridCnt()

	if var_9_0 > 1 then
		for iter_9_0 = 1, var_9_0 - 1 do
			arg_9_0.gridData[arg_9_1][arg_9_2 + iter_9_0] = EducateGrid.New({
				type = EducateGrid.TYPE_PLAN_OCCUPY,
				id = arg_9_3.id
			})

			arg_9_0:saveGridLocalData(arg_9_1, arg_9_2 + iter_9_0, arg_9_0.gridData[arg_9_1][arg_9_2 + iter_9_0])
		end
	end

	arg_9_0.gridData[arg_9_1][arg_9_2] = arg_9_3

	arg_9_0:saveGridLocalData(arg_9_1, arg_9_2, arg_9_3)
end

function var_0_0.clearGridData(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.gridData[arg_10_1][arg_10_2]

	if var_10_0:GetOccupyGridCnt() > 1 then
		for iter_10_0, iter_10_1 in pairs(arg_10_0.gridData[arg_10_1]) do
			if (iter_10_1:IsPlanOccupy() or iter_10_1:IsPlan()) and iter_10_1.id == var_10_0.id then
				arg_10_0.gridData[arg_10_1][iter_10_0] = EducateGrid.New({
					type = EducateGrid.TYPE_EMPTY
				})

				arg_10_0:saveGridLocalData(arg_10_1, iter_10_0, arg_10_0.gridData[arg_10_1][iter_10_0])
			end
		end
	end

	arg_10_0.gridData[arg_10_1][arg_10_2] = EducateGrid.New({
		type = EducateGrid.TYPE_EMPTY
	})

	arg_10_0:saveGridLocalData(arg_10_1, arg_10_2, arg_10_0.gridData[arg_10_1][arg_10_2])
end

function var_0_0.findUI(arg_11_0)
	arg_11_0.bgTF = arg_11_0._tf:Find("anim_root/bg")
	arg_11_0.topTF = arg_11_0._tf:Find("anim_root/top")
	arg_11_0.returnBtn = arg_11_0.topTF:Find("return_btn/return_btn")
	arg_11_0.mainTF = arg_11_0._tf:Find("anim_root/main")
	arg_11_0.leftPanelTF = arg_11_0.mainTF:Find("schedule_left")
	arg_11_0.targetTF = arg_11_0.leftPanelTF:Find("target")

	setText(arg_11_0.targetTF:Find("title"), i18n("child_btn_target") .. ":")

	arg_11_0.scheduleTF = arg_11_0.leftPanelTF:Find("schedule")
	arg_11_0.dayList = UIItemList.New(arg_11_0.scheduleTF, arg_11_0.leftPanelTF:Find("schedule/day_tpl"))
	arg_11_0.monthText = arg_11_0.leftPanelTF:Find("title/month")

	setText(arg_11_0.leftPanelTF:Find("title/right/content/month"), i18n("word_month"))

	arg_11_0.weekText = arg_11_0.leftPanelTF:Find("title/right/content/week")
	arg_11_0.skipToggle = arg_11_0.leftPanelTF:Find("skip_toggle")
	arg_11_0.skipToggleCom = arg_11_0.skipToggle:GetComponent(typeof(Toggle))

	local var_11_0 = PlayerPrefs.GetInt(EducateConst.SKIP_PLANS_ANIM_KEY .. "_" .. arg_11_0.playerID)

	triggerToggle(arg_11_0.skipToggle, var_11_0 == 1)
	setActive(arg_11_0.skipToggle, true)
	setText(arg_11_0.skipToggle:Find("Text"), i18n("child_plan_skip"))

	arg_11_0.selectPanelTF = arg_11_0.leftPanelTF:Find("select_panel")

	setActive(arg_11_0.selectPanelTF, false)

	arg_11_0.selectCloseBtn = arg_11_0.selectPanelTF:Find("fold_btn")
	arg_11_0.plansView = arg_11_0.selectPanelTF:Find("scrollview")
	arg_11_0.rightPanelTF = arg_11_0.mainTF:Find("result_right")
	arg_11_0.rightEmptyTF = arg_11_0.rightPanelTF:Find("empty")

	setText(arg_11_0.rightEmptyTF:Find("Text"), i18n("child_schedule_empty_tip"))

	arg_11_0.rightContentTF = arg_11_0.rightPanelTF:Find("content")
	arg_11_0.buffUIList = UIItemList.New(arg_11_0.rightContentTF:Find("buff_list"), arg_11_0.rightContentTF:Find("buff_list/tpl"))
	arg_11_0.avatarTF = arg_11_0.rightContentTF:Find("avatar")
	arg_11_0.avatarImage = arg_11_0.avatarTF:Find("mask/Image")
	arg_11_0.natureTF = arg_11_0.rightContentTF:Find("nature/unlock")
	arg_11_0.natureLockTF = arg_11_0.rightContentTF:Find("nature/lock")

	setText(arg_11_0.rightContentTF:Find("major_title/Text"), i18n("child_attr_name1"))
	setText(arg_11_0.rightContentTF:Find("minor_title/Text"), i18n("child_attr_name2"))

	arg_11_0.majorUIList = UIItemList.New(arg_11_0.rightContentTF:Find("major"), arg_11_0.rightContentTF:Find("major/tpl"))
	arg_11_0.minorUIList = UIItemList.New(arg_11_0.rightContentTF:Find("minor"), arg_11_0.rightContentTF:Find("minor/tpl"))
	arg_11_0.nextBtn = arg_11_0.rightPanelTF:Find("next_btn")
	arg_11_0.topPanel = EducateTopPanel.New(arg_11_0.topTF:Find("top_right"), arg_11_0.event)

	arg_11_0.topPanel:Load()

	arg_11_0.resPanel = EducateResPanel.New(arg_11_0.topTF:Find("res"), arg_11_0.event)

	arg_11_0.resPanel:Load()
end

function var_0_0.addListener(arg_12_0)
	setActive(arg_12_0.topTF:Find("clear_btn"), false)
	onButton(arg_12_0, arg_12_0.topTF:Find("clear_btn"), function()
		arg_12_0:clearLocalPlans()
		arg_12_0.resPanel:ActionInvoke("Flush")
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.selectPanelTF:Find("index_btn"), function()
		local var_14_0 = {
			indexDatas = Clone(arg_12_0.contextData.indexDatas) or {},
			callback = function(arg_15_0)
				arg_12_0.typeIndex = arg_15_0.typeIndex
				arg_12_0.costIndex = arg_15_0.costIndex
				arg_12_0.awardResIndex = arg_15_0.awardResIndex
				arg_12_0.awardNatureIndex = arg_15_0.awardNatureIndex
				arg_12_0.awardAttr1Index = arg_15_0.awardAttr1Index
				arg_12_0.awardAttr2Index = arg_15_0.awardAttr2Index

				arg_12_0:updateIndexDatas()
				arg_12_0:updatePlanList()
			end
		}

		arg_12_0:emit(EducateScheduleMediator.OPEN_FILTER_LAYER, var_14_0)
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.returnBtn, function()
		arg_12_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.selectCloseBtn, function()
		arg_12_0:closeSelectPanel()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.nextBtn, function()
		local var_18_0 = {}
		local var_18_1

		table.insert(var_18_0, function(arg_19_0)
			if arg_12_0:haveEmpty() then
				arg_12_0:emit(var_0_0.EDUCATE_ON_MSG_TIP, {
					content = i18n("child_schedule_sure_tip"),
					onYes = function()
						var_18_1 = true
					end,
					onExit = function()
						if var_18_1 then
							arg_19_0()
						end
					end
				})
			else
				arg_19_0()
			end
		end)
		table.insert(var_18_0, function(arg_22_0)
			if getProxy(EducateProxy):GetCharData().site > 0 then
				arg_12_0:emit(var_0_0.EDUCATE_ON_MSG_TIP, {
					content = i18n("child_schedule_sure_tip2"),
					onYes = function()
						arg_22_0()
					end
				})
			else
				arg_22_0()
			end
		end)
		seriesAsync(var_18_0, function()
			arg_12_0:executePlans(arg_12_0.skipToggleCom.isOn)
		end)
	end, SFX_PANEL)
	onToggle(arg_12_0, arg_12_0.skipToggle, function(arg_25_0)
		PlayerPrefs.SetInt(EducateConst.SKIP_PLANS_ANIM_KEY .. "_" .. arg_12_0.playerID, arg_25_0 and 1 or 0)
	end, SFX_PANEL)
end

function var_0_0.haveEmpty(arg_26_0)
	for iter_26_0 = 1, 6 do
		for iter_26_1 = 1, 3 do
			if arg_26_0.gridData[iter_26_0][iter_26_1]:IsEmpty() then
				return true
			end
		end
	end

	return false
end

function var_0_0.allEmpty(arg_27_0)
	for iter_27_0 = 1, 6 do
		for iter_27_1 = 1, 3 do
			local var_27_0 = arg_27_0.gridData[iter_27_0][iter_27_1]

			if not var_27_0:IsEmpty() and not var_27_0:IsLock() then
				return false
			end
		end
	end

	return true
end

function var_0_0.executePlans(arg_28_0, arg_28_1)
	arg_28_0:emit(EducateScheduleMediator.GET_PLANS, {
		gridData = arg_28_0.gridData,
		isSkip = arg_28_1
	})
end

function var_0_0.didEnter(arg_29_0)
	arg_29_0:updateBg()
	arg_29_0:initTimeTitle()
	arg_29_0:initTargetText()
	arg_29_0:updateIndexDatas()
	arg_29_0:initSchedulePanel()
	arg_29_0:initSelectPlans()
	arg_29_0:initResultPanel()
	arg_29_0:checkTips()
	arg_29_0:OverlayPanel(arg_29_0.mainTF, {
		pbList = {
			arg_29_0.mainTF:Find("bg")
		}
	})
	arg_29_0:OverlayPanel(arg_29_0.topTF, {
		groupDelta = 1
	})
end

function var_0_0.checkTips(arg_30_0)
	arg_30_0.newUnlcokPlanIds = EducateTipHelper.GetPlanUnlockTipIds()

	if #arg_30_0.newUnlcokPlanIds > 0 then
		arg_30_0:emit(var_0_0.EDUCATE_ON_UNLOCK_TIP, {
			type = EducateUnlockTipLayer.UNLOCK_TYPE_PLAN,
			list = arg_30_0.newUnlcokPlanIds
		})
	end
end

function var_0_0.updateBg(arg_31_0)
	local var_31_0 = LoadSprite("bg/" .. arg_31_0.char:GetBGName())

	setImageSprite(arg_31_0.bgTF, var_31_0, false)
end

function var_0_0.initTimeTitle(arg_32_0)
	local var_32_0 = EducateHelper.GetTimeAfterWeeks(arg_32_0.curTime, 1)
	local var_32_1 = EducateHelper.GetShowMonthNumber(var_32_0.month)

	setText(arg_32_0.monthText, var_32_1)

	local var_32_2 = i18n("number_" .. var_32_0.week)

	setText(arg_32_0.weekText, i18n("word_which_week", var_32_2))
end

function var_0_0.initTargetText(arg_33_0)
	arg_33_0.showAttrSubtype = 0

	local var_33_0 = arg_33_0.educateProxy:GetTaskProxy()

	if not var_33_0:CanGetTargetAward() then
		setText(arg_33_0.targetTF:Find("Text"), i18n("child_task_finish_all"))
		setActive(arg_33_0.targetTF:Find("icon"), false)
	else
		local var_33_1 = var_33_0:FilterByGroup(var_33_0:GetTargetTasksForShow())[1]

		if not var_33_1 then
			setActive(arg_33_0.targetTF, false)
		end

		setText(arg_33_0.targetTF:Find("Text"), var_33_1:getConfig("name"))

		if var_33_1:GetType() == EducateTask.TYPE_ATTR then
			setActive(arg_33_0.targetTF:Find("icon"), true)

			arg_33_0.showAttrSubtype = var_33_1:getConfig("sub_type")

			local var_33_2 = type(arg_33_0.showAttrSubtype) == "string" and arg_33_0.showAttrSubtype or arg_33_0.showAttrSubtype[1]

			GetImageSpriteFromAtlasAsync("ui/educatecommonui_atlas", "attr_" .. var_33_2, arg_33_0.targetTF:Find("icon"))
		else
			setActive(arg_33_0.targetTF:Find("icon"), false)
		end
	end
end

function var_0_0.updateIndexDatas(arg_34_0)
	arg_34_0.contextData.indexDatas = arg_34_0.contextData.indexDatas or {}
	arg_34_0.contextData.indexDatas.typeIndex = arg_34_0.typeIndex
	arg_34_0.contextData.indexDatas.costIndex = arg_34_0.costIndex
	arg_34_0.contextData.indexDatas.awardResIndex = arg_34_0.awardResIndex
	arg_34_0.contextData.indexDatas.awardNatureIndex = arg_34_0.awardNatureIndex
	arg_34_0.contextData.indexDatas.awardAttr1Index = arg_34_0.awardAttr1Index
	arg_34_0.contextData.indexDatas.awardAttr2Index = arg_34_0.awardAttr2Index
end

function var_0_0.initSchedulePanel(arg_35_0)
	arg_35_0.dayList:make(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == UIItemList.EventInit then
			local var_36_0 = arg_36_1 + 1

			arg_36_2.name = tostring(var_36_0)

			GetImageSpriteFromAtlasAsync("ui/educatescheduleui_atlas", var_36_0, arg_36_2:Find("title"), true)

			for iter_36_0 = 1, 3 do
				local var_36_1 = arg_36_2:Find("cells"):GetChild(iter_36_0 - 1)
				local var_36_2 = arg_35_0.planProxy:GetGridBgName(var_36_0, iter_36_0)

				GetImageSpriteFromAtlasAsync("ui/educatescheduleui_atlas", var_36_2[1], var_36_1:Find("empty"), true)
				GetImageSpriteFromAtlasAsync("ui/educatescheduleui_atlas", var_36_2[2], var_36_1:Find("plan/name_bg"), true)
				onButton(arg_35_0, var_36_1, function()
					local var_37_0 = arg_35_0.gridData[var_36_0][iter_36_0]

					if var_37_0:IsEvent() or var_37_0:IsEventOccupy() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("child_schedule_event_tip"))
					else
						arg_35_0:openSelectPanel(var_36_0, iter_36_0)
					end
				end, SFX_PANEL)
			end
		end

		if arg_36_0 == UIItemList.EventUpdate then
			arg_35_0:updateDayGrids(arg_36_1, arg_36_2)
		end
	end)
	arg_35_0.dayList:align(6)
end

function var_0_0._updateGrid(arg_38_0, arg_38_1, arg_38_2)
	setActive(arg_38_1, not arg_38_2:IsLock())

	if not arg_38_2:IsLock() then
		setActive(arg_38_1:Find("empty"), arg_38_2:IsEmpty())

		arg_38_1:GetComponent(typeof(Image)).enabled = not arg_38_2:IsEmpty()

		setActive(arg_38_1:Find("plan"), not arg_38_2:IsEmpty())

		if arg_38_2:IsPlan() or arg_38_2:IsPlanOccupy() then
			LoadImageSpriteAsync("educateprops/" .. arg_38_2.data:getConfig("icon"), arg_38_1:Find("plan/icon"), true)
			setScrollText(arg_38_1:Find("plan/name_bg/Text"), arg_38_2.data:getConfig("name"))
		end

		if arg_38_2:IsEvent() or arg_38_2:IsEventOccupy() then
			local var_38_0 = arg_38_2.data:getConfig("type_param")[1] or ""

			LoadImageSpriteAsync("educateprops/" .. var_38_0, arg_38_1:Find("plan/icon"), true)
			setScrollText(arg_38_1:Find("plan/name_bg/Text"), i18n("child_plan_event"))
		end
	end
end

function var_0_0.updateDayGrids(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_1 + 1

	for iter_39_0 = 1, 3 do
		local var_39_1 = arg_39_2:Find("cells"):GetChild(iter_39_0 - 1)

		var_39_1.name = tostring(iter_39_0)

		local var_39_2 = arg_39_0.gridData[var_39_0][iter_39_0]

		arg_39_0:_updateGrid(var_39_1, var_39_2)
	end
end

function var_0_0.initSelectPlans(arg_40_0)
	arg_40_0.plansRect = arg_40_0.plansView:GetComponent("LScrollRect")
	arg_40_0.planCards = {}

	function arg_40_0.plansRect.onInitItem(arg_41_0)
		local var_41_0 = EducateSchedulePlanCard.New(arg_41_0, arg_40_0)

		arg_40_0.planCards[arg_41_0] = var_41_0
	end

	function arg_40_0.plansRect.onUpdateItem(arg_42_0, arg_42_1)
		local var_42_0 = arg_40_0.planCards[arg_42_1]

		if not var_42_0 then
			local var_42_1 = EducateSchedulePlanCard.New(arg_42_1, arg_40_0)

			arg_40_0.planCards[arg_42_1] = var_42_1
		end

		local var_42_2 = arg_40_0.showPlans[arg_42_0 + 1]
		local var_42_3 = 0
		local var_42_4 = arg_40_0.gridData[arg_40_0.selectDay][arg_40_0.selectIndex]

		if var_42_4 and var_42_4:IsPlanOccupy() or var_42_4:IsPlan() then
			var_42_3 = var_42_4.id
		end

		var_42_0:update(var_42_2, var_42_3)
	end

	function arg_40_0.plansRect.onReturnItem(arg_43_0, arg_43_1)
		return
	end

	for iter_40_0 = 1, 3 do
		local var_40_0 = arg_40_0.selectPanelTF:Find("day/cells"):GetChild(iter_40_0 - 1)

		onButton(arg_40_0, var_40_0, function()
			local var_44_0 = arg_40_0.gridData[arg_40_0.selectDay][iter_40_0]

			if var_44_0:IsEvent() or var_44_0:IsEventOccupy() then
				pg.TipsMgr.GetInstance():ShowTips(i18n("child_schedule_event_tip"))
			else
				arg_40_0.selectIndex = iter_40_0

				arg_40_0:updateSelectdDay()
				arg_40_0:updatePlanList()
			end
		end, SFX_PANEL)
	end
end

function var_0_0.openSelectPanel(arg_45_0, arg_45_1, arg_45_2)
	LoadImageSpriteAtlasAsync("ui/educatescheduleui_atlas", arg_45_1, arg_45_0.selectPanelTF:Find("day/title"), true)
	setActive(arg_45_0.selectPanelTF, true)
	setActive(arg_45_0.scheduleTF, false)

	arg_45_0.selectDay = arg_45_1
	arg_45_0.selectIndex = arg_45_2

	arg_45_0:updateSelectdDay()
	arg_45_0:updatePlanList()
end

function var_0_0.updateSelectdDay(arg_46_0)
	for iter_46_0 = 1, 3 do
		local var_46_0 = arg_46_0.selectPanelTF:Find("day/cells"):GetChild(iter_46_0 - 1)
		local var_46_1 = arg_46_0.gridData[arg_46_0.selectDay][iter_46_0]
		local var_46_2 = arg_46_0.planProxy:GetGridBgName(arg_46_0.selectDay, iter_46_0)

		GetImageSpriteFromAtlasAsync("ui/educatescheduleui_atlas", var_46_2[1], var_46_0:Find("empty"), true)
		GetImageSpriteFromAtlasAsync("ui/educatescheduleui_atlas", var_46_2[2], var_46_0:Find("plan/name_bg"), true)
		setActive(var_46_0:Find("selected"), arg_46_0.selectIndex == iter_46_0)
		arg_46_0:_updateGrid(var_46_0, var_46_1)
	end
end

function var_0_0.updatePlanList(arg_47_0)
	if arg_47_0.selectIndex ~= 0 then
		arg_47_0.showPlans = arg_47_0:filter(arg_47_0.planProxy:GetShowPlans(arg_47_0.char:GetNextWeekStage(), arg_47_0.selectDay, arg_47_0.selectIndex))

		arg_47_0:sortPlans()
		arg_47_0.plansRect:SetTotalCount(#arg_47_0.showPlans, -1)
	end
end

function var_0_0.sortPlans(arg_48_0)
	table.sort(arg_48_0.showPlans, CompareFuncs({
		function(arg_49_0)
			return table.contains(arg_48_0.newUnlcokPlanIds, arg_49_0.id) and 0 or 1
		end,
		function(arg_50_0)
			return arg_50_0:IsMatchAttr(arg_48_0.char) and 0 or 1
		end,
		function(arg_51_0)
			return arg_51_0:CheckResultBySubType(EducateConst.DROP_TYPE_ATTR, arg_48_0.showAttrSubtype) and 0 or 1
		end,
		function(arg_52_0)
			return -arg_52_0:getConfig("rare")
		end,
		function(arg_53_0)
			return arg_53_0.id
		end
	}))

	arg_48_0.newUnlcokPlanIds = {}
end

function var_0_0.OnPlanCardClick(arg_54_0, arg_54_1)
	local var_54_0, var_54_1 = arg_54_0:CheckCondition(arg_54_1)

	if var_54_0 then
		local var_54_2 = EducateGrid.New({
			type = EducateGrid.TYPE_PLAN,
			id = arg_54_1.id
		})

		arg_54_0:setGridDataForPlan(arg_54_0.selectDay, arg_54_0.selectIndex, var_54_2)
		arg_54_0:updateSelectdDay()
		arg_54_0:updateResultPanel()
		arg_54_0:closeSelectPanel()
	else
		pg.TipsMgr.GetInstance():ShowTips(var_54_1)
	end
end

function var_0_0.filter(arg_55_0, arg_55_1)
	return underscore.select(arg_55_1, function(arg_56_0)
		return EducatePlanIndexConst.filterByType(arg_56_0, arg_55_0.typeIndex) and EducatePlanIndexConst.filterByCost(arg_56_0, arg_55_0.costIndex) and EducatePlanIndexConst.filterByAwardRes(arg_56_0, arg_55_0.awardResIndex) and EducatePlanIndexConst.filterByAwardNature(arg_56_0, arg_55_0.awardNatureIndex) and EducatePlanIndexConst.filterByAwardAttr1(arg_56_0, arg_55_0.awardAttr1Index) and EducatePlanIndexConst.filterByAwardAttr2(arg_56_0, arg_55_0.awardAttr2Index)
	end)
end

function var_0_0.closeSelectPanel(arg_57_0)
	setActive(arg_57_0.selectPanelTF, false)
	setActive(arg_57_0.scheduleTF, true)
	arg_57_0.dayList:align(6)
end

function var_0_0.CheckCondition(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_0.gridData[arg_58_0.selectDay][arg_58_0.selectIndex]

	if var_58_0:IsEvent() or var_58_0:IsEventOccupy() then
		return false, i18n("child_schedule_event_tip")
	end

	local var_58_1 = var_58_0.data
	local var_58_2, var_58_3, var_58_4 = arg_58_1:GetCost()

	if var_58_4 > 1 and not arg_58_0:CheckRemainGrid(var_58_4, var_58_0.id) then
		return false, i18n("child_plan_check_tip1")
	end

	if not arg_58_1:IsMatchAttr(arg_58_0.char) then
		return false, i18n("child_plan_check_tip2")
	end

	if not arg_58_1:IsInStage(arg_58_0.char:GetNextWeekStage()) then
		return false, i18n("child_plan_check_tip6")
	end

	local var_58_5 = arg_58_1:getConfig("pre")[1]

	if not arg_58_1:IsMatchPre(arg_58_0.planProxy:GetHistoryCntById(var_58_5)) then
		return false, i18n("child_plan_check_tip3")
	end

	local var_58_6, var_58_7 = arg_58_0:getPlansCost()
	local var_58_8 = 0
	local var_58_9 = 0

	if var_58_0:IsPlan() or var_58_0:IsPlanOccupy() then
		local var_58_10

		var_58_8, var_58_10 = var_58_1:GetCost()
	end

	if arg_58_0.char.money < var_58_6 + var_58_2 - var_58_8 then
		return false, i18n("child_plan_check_tip4")
	end

	return true
end

function var_0_0.CheckRemainGrid(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = arg_59_0.selectIndex + arg_59_1 - 1

	if var_59_0 > 3 then
		return false
	end

	for iter_59_0 = arg_59_0.selectIndex + 1, var_59_0 do
		local var_59_1 = arg_59_0.gridData[arg_59_0.selectDay][iter_59_0]

		if not var_59_1:IsEmpty() and (not var_59_1:IsPlanOccupy() or var_59_1.id ~= arg_59_2) then
			return false
		end
	end

	return true
end

function var_0_0.showBuffBox(arg_60_0, arg_60_1)
	arg_60_0:emit(var_0_0.EDUCATE_ON_ITEM, {
		drop = {
			number = 1,
			type = EducateConst.DROP_TYPE_BUFF,
			id = arg_60_1
		}
	})
end

function var_0_0.initResultPanel(arg_61_0)
	arg_61_0.resPanel:ActionInvoke("FlushAddValue", "", "")
	arg_61_0.buffUIList:make(function(arg_62_0, arg_62_1, arg_62_2)
		if arg_62_0 == UIItemList.EventUpdate then
			onButton(arg_61_0, arg_62_2, function()
				arg_61_0:showBuffBox(arg_61_0.buffList[arg_62_1 + 1].id)
			end, SFX_PANEL)
		end
	end)
	arg_61_0.buffUIList:align(#arg_61_0.buffList)

	local var_61_0 = arg_61_0.natureTF:Find("content")
	local var_61_1 = arg_61_0.avatarTF:Find("progress")
	local var_61_2 = arg_61_0.char:GetPaintingName()

	setImageSprite(arg_61_0.avatarTF:Find("mask/Image"), LoadSprite("squareicon/" .. var_61_2), true)

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.natureIds) do
		local var_61_3 = var_61_0:GetChild(iter_61_0 - 1)

		setActive(var_61_3:Find("tip"), false)

		var_61_3.name = iter_61_1

		setScrollText(var_61_3:Find("mask/Text"), pg.child_attr[iter_61_1].name .. " " .. arg_61_0.char:GetAttrById(iter_61_1))
	end

	arg_61_0.majorUIList:make(function(arg_64_0, arg_64_1, arg_64_2)
		if arg_64_0 == UIItemList.EventInit then
			local var_64_0 = arg_61_0.majorIds[arg_64_1 + 1]

			arg_64_2.name = var_64_0

			GetImageSpriteFromAtlasAsync("ui/educatecommonui_atlas", "attr_" .. var_64_0, arg_64_2:Find("icon"), true)
			setScrollText(arg_64_2:Find("name_mask/name"), pg.child_attr[var_64_0].name)

			local var_64_1 = arg_61_0.char:GetAttrInfo(var_64_0)

			setText(arg_64_2:Find("grade/Text"), var_64_1)
			setText(arg_64_2:Find("before_value"), arg_61_0.char:GetAttrById(var_64_0))

			local var_64_2 = EducateConst.GRADE_2_COLOR[var_64_1][2]

			setActive(arg_64_2:Find("gradient"), false)
			setImageColor(arg_64_2:Find("grade"), Color.NewHex(var_64_2))
		elseif arg_64_0 == UIItemList.EventUpdate then
			local var_64_3 = tonumber(arg_64_2.name)
			local var_64_4 = arg_61_0.char:GetAttrById(var_64_3)

			if arg_61_0.attrResults and arg_61_0.attrResults[var_64_3] then
				var_64_4 = var_64_4 + arg_61_0.attrResults[var_64_3]

				setActive(arg_64_2:Find("gradient"), true)
				setImageColor(arg_64_2:Find("arrow"), Color.NewHex("9efffe"))
				setText(arg_64_2:Find("after_value"), setColorStr(var_64_4, "#9efffe"))
			else
				setActive(arg_64_2:Find("gradient"), false)
				setImageColor(arg_64_2:Find("arrow"), Color.NewHex("dddedf"))
				setText(arg_64_2:Find("after_value"), setColorStr(var_64_4, "#ffffff"))
			end
		end
	end)
	arg_61_0.minorUIList:make(function(arg_65_0, arg_65_1, arg_65_2)
		if arg_65_0 == UIItemList.EventInit then
			local var_65_0 = arg_61_0.minorIds[arg_65_1 + 1]

			arg_65_2.name = var_65_0

			GetImageSpriteFromAtlasAsync("ui/educatecommonui_atlas", "attr_" .. var_65_0, arg_65_2:Find("icon"), true)
			setText(arg_65_2:Find("value"), arg_61_0.char:GetAttrById(var_65_0))
		elseif arg_65_0 == UIItemList.EventUpdate then
			local var_65_1 = tonumber(arg_65_2.name)
			local var_65_2 = arg_61_0.char:GetAttrById(var_65_1)

			setText(arg_65_2:Find("name"), pg.child_attr[var_65_1].name)

			if arg_61_0.attrResults and arg_61_0.attrResults[var_65_1] then
				var_65_2 = var_65_2 .. setColorStr("+" .. arg_61_0.attrResults[var_65_1], "#9efffe")
			end

			setText(arg_65_2:Find("value"), var_65_2)
		end
	end)

	arg_61_0.attrResults, arg_61_0.resResult = {}, {}

	arg_61_0:updateResultPanel()
end

function var_0_0.updateResultPanel(arg_66_0)
	local var_66_0 = arg_66_0:allEmpty()

	setActive(arg_66_0.rightEmptyTF, var_66_0)
	setActive(arg_66_0.rightContentTF, not var_66_0)

	if not var_66_0 then
		arg_66_0.attrResults, arg_66_0.resResult = arg_66_0:getPlansResult()

		arg_66_0.majorUIList:align(#arg_66_0.majorIds)
		arg_66_0.minorUIList:align(#arg_66_0.minorIds)

		local var_66_1, var_66_2 = arg_66_0:getPlansCost()
		local var_66_3 = arg_66_0.resResult[EducateChar.RES_MONEY_ID] or 0
		local var_66_4 = arg_66_0.resResult[EducateChar.RES_MOOD_ID] or 0
		local var_66_5 = var_66_3 - var_66_1 >= 0 and "+" .. var_66_3 - var_66_1 or var_66_3 - var_66_1
		local var_66_6 = var_66_4 - var_66_2 >= 0 and "+" .. var_66_4 - var_66_2 or var_66_4 - var_66_2

		arg_66_0.resPanel:ActionInvoke("FlushAddValue", var_66_6, var_66_5)

		local var_66_7 = EducateHelper.IsShowNature()

		setActive(arg_66_0.natureTF, var_66_7)
		setActive(arg_66_0.natureLockTF, not var_66_7)

		if var_66_7 then
			local var_66_8 = arg_66_0.natureTF:Find("content")

			eachChild(var_66_8, function(arg_67_0)
				local var_67_0 = tonumber(arg_67_0.name)

				if arg_66_0.attrResults and arg_66_0.attrResults[var_67_0] and arg_66_0.attrResults[var_67_0] ~= 0 then
					local var_67_1 = arg_66_0.attrResults[var_67_0]
					local var_67_2 = var_67_1 > 0 and "+" or ""
					local var_67_3 = var_67_1 > 0 and "39bfff" or "a9a9a9"

					setActive(arg_67_0:Find("tip"), true)
					setImageColor(arg_67_0:Find("tip"), Color.NewHex(var_67_3))
					setText(arg_67_0:Find("tip/Text"), var_67_2 .. var_67_1)
				else
					setActive(arg_67_0:Find("tip"), false)
				end
			end)
		end
	end
end

function var_0_0.getPlansResult(arg_68_0)
	local var_68_0 = {}
	local var_68_1 = {}

	for iter_68_0, iter_68_1 in ipairs(arg_68_0.gridData) do
		for iter_68_2, iter_68_3 in ipairs(iter_68_1) do
			if iter_68_3:IsPlan() then
				for iter_68_4, iter_68_5 in ipairs(iter_68_3.data:GetResult()) do
					if iter_68_5[1] == EducateConst.DROP_TYPE_ATTR then
						local var_68_2 = var_68_0[iter_68_5[2]] or 0

						var_68_0[iter_68_5[2]] = var_68_2 + iter_68_5[3]
					elseif iter_68_5[1] == EducateConst.DROP_TYPE_RES then
						local var_68_3 = var_68_1[iter_68_5[2]] or 0

						var_68_1[iter_68_5[2]] = var_68_3 + iter_68_5[3]
					end
				end
			end
		end
	end

	return var_68_0, var_68_1
end

function var_0_0.getPlansCost(arg_69_0)
	local var_69_0 = 0
	local var_69_1 = 0
	local var_69_2 = {}

	for iter_69_0, iter_69_1 in pairs(arg_69_0.gridData) do
		for iter_69_2, iter_69_3 in pairs(iter_69_1) do
			if iter_69_3:IsPlan() then
				local var_69_3, var_69_4 = iter_69_3.data:GetCost()

				var_69_0 = var_69_0 + var_69_3
				var_69_1 = var_69_1 + var_69_4
			end
		end
	end

	return var_69_0, var_69_1
end

function var_0_0.getRemainGridCnt(arg_70_0, arg_70_1, arg_70_2)
	local var_70_0 = arg_70_0.gridData[arg_70_1]
	local var_70_1 = 1

	for iter_70_0, iter_70_1 in pairs(var_70_0) do
		if arg_70_2 < iter_70_0 and iter_70_1:IsEmpty() then
			var_70_1 = var_70_1 + 1
		end
	end

	return var_70_1
end

function var_0_0.DoRecommend(arg_71_0)
	local var_71_0 = arg_71_0.char:GetAttrSortIds()

	for iter_71_0, iter_71_1 in pairs(arg_71_0.gridData) do
		for iter_71_2, iter_71_3 in pairs(iter_71_1) do
			if iter_71_3:IsEmpty() then
				local var_71_1, var_71_2 = arg_71_0:getPlansCost()
				local var_71_3 = arg_71_0:getRemainGridCnt(iter_71_0, iter_71_2)
				local var_71_4 = arg_71_0.planProxy:GetRecommendPlan(iter_71_0, iter_71_2, arg_71_0.char, var_71_1, var_71_2, var_71_3, var_71_0)

				if var_71_4 then
					local var_71_5 = EducateGrid.New({
						type = EducateGrid.TYPE_PLAN,
						id = var_71_4.id
					})

					arg_71_0:setGridDataForPlan(iter_71_0, iter_71_2, var_71_5)
				end
			end
		end
	end

	arg_71_0:updateResultPanel()
	arg_71_0:closeSelectPanel()
end

function var_0_0.onBackPressed(arg_72_0)
	if isActive(arg_72_0.selectPanelTF) then
		arg_72_0:closeSelectPanel()
	else
		var_0_0.super.onBackPressed(arg_72_0)
	end
end

function var_0_0.willExit(arg_73_0)
	arg_73_0.topPanel:Destroy()

	arg_73_0.topPanel = nil

	arg_73_0.resPanel:Destroy()

	arg_73_0.resPanel = nil

	arg_73_0:UnOverlayPanel(arg_73_0.mainTF, arg_73_0._tf:Find("anim_root"))
	arg_73_0:UnOverlayPanel(arg_73_0.topTF, arg_73_0._tf:Find("anim_root"))

	for iter_73_0, iter_73_1 in pairs(arg_73_0.planCards) do
		iter_73_1:dispose()
	end
end

return var_0_0

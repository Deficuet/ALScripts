local var_0_0 = class("ChapterAutoPanelTypeWorld", import("view.base.BaseSubView"))

var_0_0.Listeners = {
	onUpdateStamina = "OnUpdateStamina"
}

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoPanelTypeWorld"
end

function var_0_0.OnLoaded(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(var_0_0.Listeners) do
		arg_2_0[iter_2_0] = function(...)
			var_0_0[iter_2_1](arg_2_0, ...)
		end
	end

	setText(arg_2_0.uiStartBtn:Find("Text"), i18n("auto_battle_confirm_button"))
	setText(arg_2_0.uiUtilTime:Find("header"), i18n("auto_battle_time_left"))
	setText(arg_2_0.uiUtilCost:Find("header"), i18n("auto_battle_cost_extra"))
	setText(arg_2_0.uiUtilTime:Find("header"), i18n("auto_battle_time_left"))
	setText(arg_2_0.uiUtilCost:Find("header"), i18n("auto_battle_cost_extra"))
	setText(arg_2_0.uiLeftProficiencyHeaderText, i18n("auto_battle_class_exp_head"))
	setText(arg_2_0.uiUtilLevel:Find("title_bg/Text"), i18n("world_auto_plan_level"))
	setText(arg_2_0.uiUtilCount:Find("title_bg/Text"), i18n("world_auto_plan_quantity"))
	setText(arg_2_0.uiProficiency:Find("title_bg/Text"), i18n("auto_battle_base_loot"))
	setText(arg_2_0.uiDrops:Find("title_bg/Text"), i18n("world_auto_plan_award"))
	setText(arg_2_0.uiUtilLevel:Find("toggles/until_3/Text"), i18n("world_auto_level_less_3"))
	setText(arg_2_0.uiUtilLevel:Find("toggles/4/Text"), "4")
	setText(arg_2_0.uiUtilLevel:Find("toggles/5/Text"), "5")
	setText(arg_2_0.uiUtilLevel:Find("toggles/all/Text"), i18n("world_auto_level_all"))

	arg_2_0.ticketUIList = UIItemList.New(arg_2_0.uiTicketTF, arg_2_0.uiTicketTF:Find("tpl"))
	arg_2_0.awardUIList = UIItemList.New(arg_2_0.uiRightAwardContentTF, arg_2_0.uiRightAwardContentTF:Find("item"))
end

function var_0_0.InitData(arg_4_0)
	arg_4_0.mapDic = nowWorld():GetDelegateMapDic()
	arg_4_0.countMax = getGameset("world_auto_battle_map_limit")[1]
	arg_4_0.needTicket = false

	setActive(arg_4_0.uiUtilCost:Find("Image_1"), arg_4_0.needTicket)
end

function var_0_0.CheckHazardInFilter(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in pairs(arg_5_0.toggleDic) do
		if iter_5_1 and switch(iter_5_0, {
			until_3 = function()
				return arg_5_1 < 4
			end,
			["4"] = function()
				return arg_5_1 == 4
			end,
			["5"] = function()
				return arg_5_1 == 5
			end,
			["6"] = function()
				return arg_5_1 == 6
			end,
			all = function()
				return true
			end
		}) then
			return true
		end
	end

	return false
end

function var_0_0.CheckToggles(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.toggleDic) do
		if iter_11_1 then
			table.insert(var_11_0, iter_11_0)
		end
	end

	if #var_11_0 == 0 or #var_11_0 >= arg_11_0.uiUtilLevel:Find("toggles").childCount - 1 then
		arg_11_0.toggleDic = {
			all = true
		}
	else
		arg_11_0.toggleDic = {}

		for iter_11_2, iter_11_3 in ipairs(var_11_0) do
			arg_11_0.toggleDic[iter_11_3] = true
		end
	end

	eachChild(arg_11_0.uiUtilLevel:Find("toggles"), function(arg_12_0, arg_12_1)
		triggerToggle(arg_12_0, tobool(arg_11_0.toggleDic[arg_12_0.name]))
	end)

	arg_11_0.filterMaps = {}

	for iter_11_4, iter_11_5 in pairs(arg_11_0.mapDic) do
		if arg_11_0:CheckHazardInFilter(iter_11_4) then
			table.insertto(arg_11_0.filterMaps, iter_11_5)
		end
	end

	table.sort(arg_11_0.filterMaps, CompareFuncs({
		function(arg_13_0)
			return arg_13_0:GetDanger()
		end,
		function(arg_14_0)
			return arg_14_0.id
		end
	}))

	local var_11_1 = math.min(arg_11_0.countMax, #arg_11_0.filterMaps)
	local var_11_2 = math.min(var_11_1, arg_11_0.countMaps or 0)

	arg_11_0.countMaps = nil

	arg_11_0:SetSlider(var_11_2)
	setSlider(arg_11_0.uiUtilCount:Find("Slider"), 0, var_11_1, var_11_2)
end

function var_0_0.SetSlider(arg_15_0, arg_15_1)
	arg_15_1 = calcFloor(arg_15_1)

	if arg_15_0.countMaps == arg_15_1 then
		return
	end

	arg_15_0.countMaps = arg_15_1

	setText(arg_15_0.uiUtilCount:Find("Slider/Text"), string.format("%d/%d", arg_15_0.countMaps, math.min(arg_15_0.countMax, #arg_15_0.filterMaps)))

	arg_15_0.staminaCount, arg_15_0.bookCount, arg_15_0.timeCount, arg_15_0.expCount = 0, 0, 0, 0
	arg_15_0.awards = {}

	for iter_15_0 = 1, arg_15_0.countMaps do
		local var_15_0 = arg_15_0.filterMaps[iter_15_0]
		local var_15_1 = pg.world_auto_statistics[var_15_0.id]

		arg_15_0.staminaCount = arg_15_0.staminaCount + var_15_1.oil_limit
		arg_15_0.bookCount = arg_15_0.bookCount + 1
		arg_15_0.timeCount = arg_15_0.timeCount + var_15_1.time_correction
		arg_15_0.expCount = arg_15_0.expCount + var_15_1.drop_expbook

		table.insertto(arg_15_0.awards, var_15_1.award_display)
	end

	local var_15_2 = arg_15_0.staminaMgr:GetTotalStamina()

	setText(arg_15_0.uiUtilCost:Find("value"), string.format("<icon name=stamina h=0.8 w=0.8 /><color=%s>%s×%d</color>", var_15_2 < arg_15_0.staminaCount and COLOR_RED or COLOR_GREEN, i18n("world_ap"), arg_15_0.staminaCount))

	local var_15_3 = ChapterAutoTicket.GetDrop(ChapterAutoTicket.TYPE.WORLD)

	var_15_3.count = arg_15_0.bookCount

	local var_15_4 = arg_15_0.needTicket and string.format("<icon name=ticket h=0.8 w=0.8 /><color=%s>%s×%d</color>", var_15_3.count > arg_15_0.ownTicketCnt and COLOR_RED or COLOR_GREEN, var_15_3:getName(), var_15_3.count) or ""

	setText(arg_15_0.uiUtilCost:Find("value_1"), var_15_4)
	setText(arg_15_0.uiUtilTime:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(arg_15_0.timeCount))
	setText(arg_15_0.uiLeftProficiencyText, arg_15_0.expCount)

	local var_15_5 = {}
	local var_15_6 = {}

	for iter_15_1, iter_15_2 in ipairs(arg_15_0.awards) do
		local var_15_7 = Drop.New({
			count = 0,
			type = iter_15_2[1],
			id = iter_15_2[2]
		})

		if var_15_5[var_15_7.type .. "_" .. var_15_7.id] then
			-- block empty
		else
			var_15_5[var_15_7.type .. "_" .. var_15_7.id] = var_15_7

			table.insert(var_15_6, var_15_7)
		end
	end

	arg_15_0.awards = var_15_6

	arg_15_0.awardUIList:align(#arg_15_0.awards)
end

function var_0_0.OnInit(arg_16_0)
	arg_16_0.toggleDic = {}

	eachChild(arg_16_0.uiUtilLevel:Find("toggles"), function(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_0.name

		onToggle(arg_16_0, arg_17_0, function(arg_18_0)
			if tobool(arg_16_0.toggleDic[var_17_0]) == arg_18_0 then
				return
			end

			if var_17_0 == "all" then
				arg_16_0.toggleDic = {
					all = true
				}
			else
				arg_16_0.toggleDic[var_17_0] = arg_18_0
				arg_16_0.toggleDic.all = false
			end

			arg_16_0:CheckToggles()
		end, SFX_PANEL)
	end)
	onSlider(arg_16_0, arg_16_0.uiUtilCount:Find("Slider"), function(arg_19_0)
		arg_16_0:SetSlider(arg_19_0)

		local var_19_0 = math.min(arg_16_0.countMax, #arg_16_0.filterMaps)

		setSlider(arg_16_0.uiUtilCount:Find("Slider"), 0, var_19_0, calcFloor(arg_19_0))
	end)
	arg_16_0.ticketUIList:make(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			local var_20_0 = arg_16_0.ticketList[arg_20_1 + 1]

			setText(arg_20_2:Find("Text"), var_20_0:GetCount())

			local var_20_1 = var_20_0:IsForever()

			setActive(arg_20_2:Find("time"), not var_20_1)

			if not var_20_1 then
				local var_20_2 = var_20_0:GetRemainTime()
				local var_20_3 = var_20_2 > 86400
				local var_20_4 = var_20_3 and "auto_battle_book_day" or "auto_battle_book_hour"
				local var_20_5 = math.floor(var_20_2 / (var_20_3 and 86400 or 3600))

				setText(arg_20_2:Find("time/Text"), i18n(var_20_4, var_20_5))
			end
		end
	end)
	arg_16_0.awardUIList:make(function(arg_21_0, arg_21_1, arg_21_2)
		arg_21_1 = arg_21_1 + 1

		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = arg_16_0.awards[arg_21_1]

			updateDrop(arg_21_2, var_21_0)
			onButton(arg_16_0, arg_21_2, function()
				arg_16_0:emit(BaseUI.ON_DROP, var_21_0)
			end, SFX_PANEL)
		end
	end)
	onButton(arg_16_0, arg_16_0.uiStartBtn, function()
		if arg_16_0.countMaps < 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_times_zero"))

			return
		end

		if arg_16_0.needTicket and arg_16_0.bookCount > arg_16_0.ownTicketCnt then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

			return
		end

		if arg_16_0.staminaCount > arg_16_0.staminaMgr:GetTotalStamina() then
			arg_16_0.staminaMgr:Show()

			return
		end

		arg_16_0:OnStart()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0._tf:Find("bg"), function()
		arg_16_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_16_0, arg_16_0.uiCloseBtn, function()
		arg_16_0:Hide()
	end, SFX_CANCEL)
end

function var_0_0.Show(arg_26_0, ...)
	arg_26_0:BlurPanel(arg_26_0._tf)
	arg_26_0:RegisterStaminaMgr()
	arg_26_0:Enter(...)
	var_0_0.super.Show(arg_26_0)
end

function var_0_0.Hide(arg_27_0)
	arg_27_0:UnOverlayPanel(arg_27_0._tf, arg_27_0.viewComponent.rtPanelList)
	arg_27_0:RemoveStaminaMgr()
	var_0_0.super.Hide(arg_27_0)
end

function var_0_0.OnDestroy(arg_28_0)
	if arg_28_0:isShowing() then
		arg_28_0:Hide()
	end
end

function var_0_0.RegisterStaminaMgr(arg_29_0)
	arg_29_0:RemoveStaminaMgr()

	arg_29_0.staminaMgr = nowWorld().staminaMgr

	arg_29_0.staminaMgr:AddListener(WorldStaminaManager.EventUpdateStamina, arg_29_0.onUpdateStamina)
end

function var_0_0.RemoveStaminaMgr(arg_30_0)
	if not arg_30_0.staminaMgr then
		return
	end

	arg_30_0.staminaMgr:RemoveListener(WorldStaminaManager.EventUpdateStamina, arg_30_0.onUpdateStamina)

	arg_30_0.staminaMgr = nil
end

function var_0_0.OnUpdateStamina(arg_31_0)
	arg_31_0:RefreshView()
end

function var_0_0.Enter(arg_32_0)
	arg_32_0:InitData()

	arg_32_0.ticketCnt = 0

	arg_32_0:RefreshTickets()

	arg_32_0.toggleDic = {
		all = true
	}

	arg_32_0:CheckToggles()
end

function var_0_0.RefreshView(arg_33_0)
	arg_33_0:Enter()
end

function var_0_0.RefreshTickets(arg_34_0)
	local var_34_0 = getProxy(ChapterAutoProxy)

	arg_34_0.ticketList = var_34_0:GetTicketListByType(ChapterAutoTicket.TYPE.WORLD)

	table.sort(arg_34_0.ticketList, CompareFuncs({
		function(arg_35_0)
			return arg_35_0.id
		end
	}))
	arg_34_0.ticketUIList:align(#arg_34_0.ticketList)

	arg_34_0.ownTicketCnt = var_34_0:GetValidTicketCntByType(ChapterAutoTicket.TYPE.WORLD)
end

function var_0_0.OnStart(arg_36_0, arg_36_1)
	pg.m02:sendNotification(GAME.START_WORLD_CHAPTER_AUTO, {
		type = ChapterAutoProxy.TYPE.WORLD,
		list = underscore(arg_36_0.filterMaps):chain():first(arg_36_0.countMaps):map(function(arg_37_0)
			return arg_37_0.id
		end):value(),
		needTicket = arg_36_0.needTicket
	})
end

return var_0_0

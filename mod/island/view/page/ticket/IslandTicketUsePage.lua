local var_0_0 = class("IslandTicketUsePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTicketUseUI"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("window/time_panel")

	setText(var_2_0:Find("left/Text"), i18n("island_ticket_remain_time"))

	arg_2_0.remainTimeTF = var_2_0:Find("left/time")
	arg_2_0.progressSliderTF = var_2_0:Find("right/progress")
	arg_2_0.progressUpSliderTF = var_2_0:Find("right/progress_up")
	arg_2_0.reduceTimeTF = var_2_0:Find("right/Text")
	arg_2_0.formulaNumTF = arg_2_0._tf:Find("window/Text")
	arg_2_0.viewBtn = arg_2_0._tf:Find("window/view")

	setText(arg_2_0.viewBtn:Find("Text"), i18n("island_ticket_view"))

	arg_2_0.autoBtn = arg_2_0._tf:Find("window/auto")

	setText(arg_2_0.autoBtn:Find("Text"), i18n("island_ticket_auto_select"))

	arg_2_0.useBtn = arg_2_0._tf:Find("window/use")

	setText(arg_2_0.useBtn:Find("Text"), i18n("island_ticket_use"))

	arg_2_0.scrollRect = arg_2_0._tf:Find("window/scrollrect"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("window/close"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("mask"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.viewBtn, function()
		arg_5_0:OpenPage(IslandTicketStoragePage)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.viewBtn, function()
		arg_5_0:OpenPage(IslandTicketStoragePage)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.autoBtn, function()
		arg_5_0:AutoSelect()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.useBtn, function()
		arg_5_0:UseTickets()
	end, SFX_PANEL)

	arg_5_0.cards = {}
	arg_5_0.displayGroups = underscore.keys(pg.island_speedup_ticket.get_id_list_by_speedup_time)

	table.sort(arg_5_0.displayGroups)
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	local var_12_0 = IslandTicketGroupCard.New(arg_12_1)

	arg_12_0.cards[arg_12_1] = var_12_0

	onButton(arg_12_0, var_12_0.shopBtn, function()
		if not IslandMainBtnTipHelper.IsUnlock("shop") then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_shop_lock_tip"))

			return
		end

		local var_13_0 = pg.island_set.island_ticket_shopid.key_value_varchar

		arg_12_0:OpenPage(IslandShopPage, unpack(var_13_0))
	end, SFX_PANEL)
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.cards[arg_14_2]

	if not var_14_0 then
		arg_14_0:OnInitItem(arg_14_2)

		var_14_0 = arg_14_0.cards[arg_14_2]
	end

	local function var_14_1(arg_15_0, arg_15_1)
		arg_14_0.selCounts[arg_15_0] = arg_15_1

		var_14_0:UpdateSelCnt(arg_14_0.selCounts[arg_15_0])
		arg_14_0:UpdataSelected()
		arg_14_0:SetOverflowFlag()
	end

	local var_14_2 = arg_14_1 + 1

	onButton(arg_14_0, var_14_0._go, function()
		if arg_14_0.overflowFlag then
			return
		end

		local var_16_0 = arg_14_0.selCounts[var_14_2] + 1

		if var_16_0 > arg_14_0.allCounts[var_14_2] then
			return
		end

		var_14_1(var_14_2, var_16_0)
	end, SFX_PANEL)
	onButton(arg_14_0, var_14_0.reduceBtn, function()
		local var_17_0 = arg_14_0.selCounts[var_14_2] - 1

		if var_17_0 < 0 then
			return
		end

		var_14_1(var_14_2, var_17_0)
	end, SFX_PANEL)
	onInputEndEdit(arg_14_0, var_14_0.countInput, function(arg_18_0)
		local var_18_0 = 0

		if not arg_18_0 or arg_18_0 == "" or not tonumber(arg_18_0) then
			local var_18_1 = 0
		end

		local var_18_2 = tonumber(arg_18_0)
		local var_18_3 = math.max(0, var_18_2)
		local var_18_4 = math.min(var_18_3, arg_14_0.allCounts[var_14_2])

		if var_18_4 > arg_14_0.selCounts[var_14_2] and arg_14_0.overflowFlag then
			return
		end

		var_14_1(var_14_2, var_18_4)
	end)

	local var_14_3 = arg_14_0.displayGroups[var_14_2]
	local var_14_4 = arg_14_0.displayDic[var_14_3]

	if var_14_4 then
		var_14_0:Update(var_14_3, var_14_4, arg_14_0.allCounts[var_14_2], arg_14_0.selCounts[var_14_2])
	end
end

function var_0_0.SetOverflowFlag(arg_19_0)
	arg_19_0.overflowFlag = arg_19_0.endTime - arg_19_0.timeMgr:GetServerTime() - arg_19_0.reduceTime <= 0
end

function var_0_0.AddListeners(arg_20_0)
	arg_20_0:AddListener(GAME.ISLAND_REMOVE_EXPIRED_TICKET_DONE, arg_20_0.Flush)
	arg_20_0:AddListener(GAME.ISLAND_USE_TICKET_DONE, arg_20_0.Flush)
	arg_20_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_20_0.Flush)
end

function var_0_0.RemoveListeners(arg_21_0)
	arg_21_0:RemoveListener(GAME.ISLAND_REMOVE_EXPIRED_TICKET_DONE, arg_21_0.Flush)
	arg_21_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_21_0.Flush)
	arg_21_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_21_0.Flush)
end

function var_0_0.OnShow(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0:BlurPanel()

	arg_22_0.type = arg_22_1
	arg_22_0.id = arg_22_2
	arg_22_0.timeMgr = pg.TimeMgr.GetInstance()

	arg_22_0:Flush()
end

function var_0_0.Flush(arg_23_0)
	arg_23_0:SetSystemData()
	arg_23_0:SetTicketsData()
	arg_23_0.scrollRect:SetTotalCount(#arg_23_0.displayGroups, -1)
	arg_23_0:UpdataSelected()
	arg_23_0:StopTimer()
	arg_23_0:StartTimer()

	arg_23_0.overflowFlag = false
end

function var_0_0.SetSystemData(arg_24_0)
	arg_24_0.allTime = 0
	arg_24_0.endTime = 0

	switch(arg_24_0.type, {
		[IslandUseTicketCommand.TYPES.ORDER_CD] = function()
			local var_25_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_24_0.id)

			if not var_25_0 then
				return
			end

			arg_24_0.endTime = var_25_0:GetCanSubmitTime()
			arg_24_0.allTime = var_25_0:GetTotalTime()
		end,
		[IslandUseTicketCommand.TYPES.SHIP_ORDER] = function()
			local var_26_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetShipOrderSlot(arg_24_0.id)

			if not var_26_0 then
				return
			end

			arg_24_0.endTime = var_26_0:GetEndTime()
			arg_24_0.allTime = var_26_0:GetNeedTime()
		end,
		[IslandUseTicketCommand.TYPES.MANAGE] = function()
			local var_27_0 = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurant(arg_24_0.id)

			if not var_27_0 then
				return
			end

			arg_24_0.endTime = var_27_0:GetEndTime()
			arg_24_0.allTime = var_27_0:getConfig("opening_time")
		end,
		[IslandUseTicketCommand.TYPES.APPOINT] = function()
			local var_28_0 = pg.island_production_slot[arg_24_0.id].place
			local var_28_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_28_0):GetDelegationSlotData(arg_24_0.id)

			arg_24_0.appointRoleData = var_28_1:GetSlotRoleData()

			if not arg_24_0.appointRoleData then
				return
			end

			arg_24_0.endTime = arg_24_0.appointRoleData:GetFinishTime()
			arg_24_0.allTime = arg_24_0.appointRoleData:GetAllTime()
		end
	}, function()
		assert(false, "no ticket use type: " .. arg_24_0.type)
	end)
end

function var_0_0.SetTicketsData(arg_30_0)
	arg_30_0.ticketAgency = getProxy(IslandProxy):GetIsland():GetTicketAgency()
	arg_30_0.displayDic = {}

	local var_30_0 = arg_30_0.ticketAgency:GetTicketData()

	for iter_30_0, iter_30_1 in pairs(var_30_0) do
		local var_30_1 = underscore.values(iter_30_1)

		if #var_30_1 > 0 then
			local var_30_2 = var_30_1[1]:GetTime()

			if not arg_30_0.displayDic[var_30_2] then
				arg_30_0.displayDic[var_30_2] = {}
			end

			arg_30_0.displayDic[var_30_2] = table.mergeArray(arg_30_0.displayDic[var_30_2], var_30_1)
		end
	end

	for iter_30_2, iter_30_3 in pairs(arg_30_0.displayDic) do
		table.sort(iter_30_3, CompareFuncs({
			function(arg_31_0)
				return arg_31_0:IsForever() and 1 or 0
			end,
			function(arg_32_0)
				return arg_32_0:GetEndTime()
			end,
			function(arg_33_0)
				return arg_33_0.id
			end
		}))
	end

	arg_30_0.allCounts = {}
	arg_30_0.selCounts = {}

	for iter_30_4, iter_30_5 in ipairs(arg_30_0.displayGroups) do
		if not arg_30_0.displayDic[iter_30_5] then
			arg_30_0.displayDic[iter_30_5] = {}
		end

		local var_30_3 = underscore.reduce(arg_30_0.displayDic[iter_30_5], 0, function(arg_34_0, arg_34_1)
			return arg_34_0 + arg_34_1:GetCount()
		end)

		table.insert(arg_30_0.allCounts, var_30_3)
		table.insert(arg_30_0.selCounts, 0)
	end

	arg_30_0.reduceTime = 0
end

function var_0_0.UpdateSliderUI(arg_35_0)
	local var_35_0 = arg_35_0.timeMgr:GetServerTime()
	local var_35_1 = arg_35_0.endTime - var_35_0
	local var_35_2 = var_35_1 - arg_35_0.reduceTime

	if var_35_2 > 0 then
		setText(arg_35_0.remainTimeTF, arg_35_0.timeMgr:DescCDTime(var_35_2))
	else
		setText(arg_35_0.remainTimeTF, i18n("island_ticket_finished"))
	end

	setText(arg_35_0.reduceTimeTF, "-" .. arg_35_0.timeMgr:DescCDTime(arg_35_0.reduceTime))
	setSlider(arg_35_0.progressSliderTF, 0, 1, 1 - var_35_1 / arg_35_0.allTime)
	setSlider(arg_35_0.progressUpSliderTF, 0, 1, 1 - (var_35_1 - arg_35_0.reduceTime) / arg_35_0.allTime)

	local var_35_3 = arg_35_0.type == IslandUseTicketCommand.TYPES.APPOINT

	setActive(arg_35_0.formulaNumTF, var_35_3)

	if var_35_3 and arg_35_0.appointRoleData then
		local var_35_4 = arg_35_0.appointRoleData:GetCountByTimestamp(var_35_0 + arg_35_0.reduceTime)

		setText(arg_35_0.formulaNumTF, i18n("island_ticket_completed_quantity", var_35_4))
	end
end

function var_0_0.UpdateReduceTime(arg_36_0)
	arg_36_0.reduceTime = 0

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.selCounts) do
		arg_36_0.reduceTime = arg_36_0.reduceTime + arg_36_0.displayGroups[iter_36_0] * iter_36_1
	end
end

function var_0_0.UpdataSelected(arg_37_0)
	arg_37_0:UpdateReduceTime()
	arg_37_0:UpdateSliderUI()

	local var_37_0 = underscore.any(arg_37_0.selCounts, function(arg_38_0)
		return arg_38_0 > 0
	end)

	setGray(arg_37_0.useBtn, not var_37_0, true)
	setButtonEnabled(arg_37_0.useBtn, var_37_0)
end

function var_0_0._SelectTickets(arg_39_0)
	local var_39_0 = arg_39_0.endTime - arg_39_0.timeMgr:GetServerTime()
	local var_39_1 = 0

	arg_39_0.selCounts = {}

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.displayGroups) do
		table.insert(arg_39_0.selCounts, 0)
	end

	for iter_39_2, iter_39_3 in ipairs(arg_39_0.displayGroups) do
		local var_39_2 = arg_39_0.displayDic[iter_39_3]

		for iter_39_4, iter_39_5 in ipairs(var_39_2) do
			for iter_39_6 = 1, iter_39_5:GetCount() do
				var_39_1 = var_39_1 + iter_39_5:GetTime()

				if var_39_0 <= var_39_1 then
					return
				end

				arg_39_0.selCounts[iter_39_2] = arg_39_0.selCounts[iter_39_2] + 1
			end
		end
	end
end

function var_0_0.AutoSelect(arg_40_0)
	arg_40_0:_SelectTickets()
	arg_40_0:UpdataSelected()
	arg_40_0.scrollRect:SetTotalCount(#arg_40_0.displayGroups, -1)
end

function var_0_0.GetSelectedTickets(arg_41_0)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.selCounts) do
		local var_41_1 = arg_41_0.displayGroups[iter_41_0]
		local var_41_2 = arg_41_0.displayDic[var_41_1]
		local var_41_3 = 0

		for iter_41_2, iter_41_3 in ipairs(var_41_2) do
			local var_41_4 = iter_41_1 - var_41_3

			if var_41_4 <= iter_41_3:GetCount() then
				table.insert(var_41_0, IslandTicket.New(iter_41_3.id, iter_41_3.endTime, var_41_4))

				break
			else
				table.insert(var_41_0, IslandTicket.New(iter_41_3.id, iter_41_3.endTime, iter_41_3:GetCount()))

				local var_41_5 = var_41_3 + iter_41_3:GetCount()
			end
		end
	end

	return (underscore.select(var_41_0, function(arg_42_0)
		return arg_42_0:GetCount() > 0
	end))
end

function var_0_0.UseTickets(arg_43_0)
	seriesAsync({
		function(arg_44_0)
			if arg_43_0.endTime - arg_43_0.timeMgr:GetServerTime() <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_ticket_finished"))
			else
				arg_44_0()
			end
		end,
		function(arg_45_0)
			if arg_43_0.endTime - arg_43_0.timeMgr:GetServerTime() < arg_43_0.reduceTime then
				arg_43_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_sure_ticket_overflow"),
					onYes = arg_45_0
				})
			else
				arg_45_0()
			end
		end
	}, function()
		local var_46_0 = arg_43_0:GetSelectedTickets()

		arg_43_0:emit(IslandMediator.USE_TICKETS, arg_43_0.type, arg_43_0.id, var_46_0)
	end)
end

function var_0_0.StartTimer(arg_47_0)
	arg_47_0.timer = Timer.New(function()
		arg_47_0:UpdateTimer()
	end, 1, -1)

	arg_47_0.timer:Start()
	arg_47_0:UpdateTimer()
end

function var_0_0.UpdateTimer(arg_49_0)
	arg_49_0:UpdateSliderUI()
end

function var_0_0.StopTimer(arg_50_0)
	if arg_50_0.timer then
		arg_50_0.timer:Stop()

		arg_50_0.timer = nil
	end
end

function var_0_0.OnHide(arg_51_0)
	arg_51_0:UnBlurPanel()
	arg_51_0:StopTimer()
end

function var_0_0.OnDisable(arg_52_0)
	arg_52_0:OnHide()
end

function var_0_0.OnDestroy(arg_53_0)
	for iter_53_0, iter_53_1 in pairs(arg_53_0.cards) do
		iter_53_1:Dispose()
	end

	arg_53_0.cards = {}
end

return var_0_0

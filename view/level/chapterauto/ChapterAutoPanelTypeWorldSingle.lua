local var_0_0 = class("ChapterAutoPanelTypeWorldSingle", import(".ChapterAutoPanelTypeWorld"))

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoPanelTypeWorldSingle"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.ticketUIList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = arg_2_0.ticketList[arg_3_1 + 1]

			setText(arg_3_2:Find("Text"), var_3_0:GetCount())

			local var_3_1 = var_3_0:IsForever()

			setActive(arg_3_2:Find("time"), not var_3_1)

			if not var_3_1 then
				local var_3_2 = var_3_0:GetRemainTime()
				local var_3_3 = var_3_2 > 86400
				local var_3_4 = var_3_3 and "auto_battle_book_day" or "auto_battle_book_hour"
				local var_3_5 = math.floor(var_3_2 / (var_3_3 and 86400 or 3600))

				setText(arg_3_2:Find("time/Text"), i18n(var_3_4, var_3_5))
			end
		end
	end)
	arg_2_0.awardUIList:make(function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0 = arg_2_0.awards[arg_4_1]

			updateDrop(arg_4_2, var_4_0)
			onButton(arg_2_0, arg_4_2, function()
				arg_2_0:emit(BaseUI.ON_DROP, var_4_0)
			end, SFX_PANEL)
		end
	end)
	onButton(arg_2_0, arg_2_0.uiStartBtn, function()
		if arg_2_0.countMaps < 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_times_zero"))

			return
		end

		if arg_2_0.needTicket and arg_2_0.bookCount > arg_2_0.ownTicketCnt then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

			return
		end

		if arg_2_0.staminaCount > arg_2_0.staminaMgr:GetTotalStamina() then
			arg_2_0.staminaMgr:Show()

			return
		end

		arg_2_0:OnStart()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0._tf:Find("bg"), function()
		arg_2_0:Hide()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:Hide()
	end, SFX_CANCEL)
end

function var_0_0.SetSlider(arg_9_0)
	arg_9_0.countMaps = 1
	arg_9_0.staminaCount, arg_9_0.bookCount, arg_9_0.timeCount, arg_9_0.expCount = 0, 0, 0, 0
	arg_9_0.awards = {}

	for iter_9_0 = 1, arg_9_0.countMaps do
		local var_9_0 = arg_9_0.filterMaps[iter_9_0]
		local var_9_1 = pg.world_auto_statistics[var_9_0.id]

		arg_9_0.staminaCount = arg_9_0.staminaCount + var_9_1.oil_limit
		arg_9_0.bookCount = arg_9_0.bookCount + 1
		arg_9_0.timeCount = arg_9_0.timeCount + var_9_1.time_correction
		arg_9_0.expCount = arg_9_0.expCount + var_9_1.drop_expbook

		table.insertto(arg_9_0.awards, var_9_1.award_display)
	end

	local var_9_2 = arg_9_0.world.staminaMgr:GetTotalStamina()

	setText(arg_9_0.uiUtilCost:Find("value"), string.format("<icon name=stamina h=0.8 w=0.8 /><color=%s>%s×%d</color>", var_9_2 < arg_9_0.staminaCount and COLOR_RED or COLOR_GREEN, i18n("world_ap"), arg_9_0.staminaCount))

	local var_9_3 = ChapterAutoTicket.GetDrop(ChapterAutoTicket.TYPE.WORLD)

	var_9_3.count = arg_9_0.bookCount

	local var_9_4 = arg_9_0.needTicket and string.format("<icon name=ticket h=0.8 w=0.8 /><color=%s>%s×%d</color>", var_9_3.count > arg_9_0.ownTicketCnt and COLOR_RED or COLOR_GREEN, var_9_3:getName(), var_9_3.count) or ""

	setText(arg_9_0.uiUtilCost:Find("value_1"), var_9_4)
	setText(arg_9_0.uiUtilTime:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(arg_9_0.timeCount))
	setText(arg_9_0.uiLeftProficiencyText, arg_9_0.expCount)

	local var_9_5 = {}
	local var_9_6 = {}

	for iter_9_1, iter_9_2 in ipairs(arg_9_0.awards) do
		local var_9_7 = Drop.New({
			count = 0,
			type = iter_9_2[1],
			id = iter_9_2[2]
		})

		if var_9_5[var_9_7.type .. "_" .. var_9_7.id] then
			-- block empty
		else
			var_9_5[var_9_7.type .. "_" .. var_9_7.id] = var_9_7

			table.insert(var_9_6, var_9_7)
		end
	end

	arg_9_0.awards = var_9_6

	arg_9_0.awardUIList:align(#arg_9_0.awards)
end

function var_0_0.Enter(arg_10_0, arg_10_1)
	arg_10_0.world = nowWorld()
	arg_10_0.ticketCnt = 0

	arg_10_0:RefreshTickets()

	arg_10_0.needTicket = false

	setActive(arg_10_0.uiUtilCost:Find("Image_1"), arg_10_0.needTicket)

	arg_10_0.filterMaps = {
		arg_10_0.world:GetMap(arg_10_1)
	}

	arg_10_0:SetSlider()
end

function var_0_0.RefreshView(arg_11_0)
	arg_11_0:Enter(arg_11_0.filterMaps[1].id)
end

function var_0_0.OnStart(arg_12_0)
	pg.m02:sendNotification(GAME.START_WORLD_CHAPTER_AUTO, {
		type = ChapterAutoProxy.TYPE.WORLD,
		list = {
			arg_12_0.filterMaps[1].id
		},
		needTicket = arg_12_0.needTicket
	})
end

return var_0_0

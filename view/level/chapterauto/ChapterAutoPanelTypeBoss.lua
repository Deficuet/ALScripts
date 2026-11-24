local var_0_0 = class("ChapterAutoPanelTypeBoss", import(".ChapterAutoPanel"))

function var_0_0.getUIName(arg_1_0)
	return "ChapterAutoPanelTypeBoss"
end

function var_0_0.Enter(arg_2_0, arg_2_1)
	arg_2_0.expeditionId = arg_2_1
	arg_2_0.config = pg.expedition_auto_statistics[arg_2_0.expeditionId]
	arg_2_0.oilCostOnce = arg_2_0.config.oil_limit
	arg_2_0.proficiencyOnce = arg_2_0.config.base_class_exp

	local var_2_0 = getProxy(ChapterAutoProxy)

	arg_2_0.timeCostOnce = var_2_0:GetRecord(ChapterAutoProxy.TYPE.BOSS, arg_2_0.expeditionId)
	arg_2_0.remainTime = var_2_0:GetRemainTime()
	arg_2_0.storeOil = var_2_0:GetOil()

	setActive(arg_2_0.uiStoreOilTF, arg_2_0.storeOil > 0)
	setText(arg_2_0.uiStoreOilTF:Find("Text"), i18n("auto_battle_oil_store_tip", arg_2_0.storeOil))

	arg_2_0.count = arg_2_0.remainTime >= arg_2_0.timeCostOnce and 1 or 0
	arg_2_0.ticketCnt = 0

	arg_2_0:RefreshTickets()
	arg_2_0.leftPageUtil:setDefaultNum(arg_2_0.count)
	arg_2_0:RefreshLeftPageUtil()
	arg_2_0:UpdateLeftContent()
	arg_2_0.rightPageUtil:setDefaultNum(0)
	arg_2_0:RefreshRightPageUtil()
	arg_2_0:UpdateRightContent()

	arg_2_0.awards = var_0_0.GetAwards(arg_2_0.expeditionId)

	arg_2_0.awardUIList:align(#arg_2_0.awards)
	arg_2_0:Show()
end

function var_0_0.RefreshView(arg_3_0)
	arg_3_0:Enter(arg_3_0.expeditionId)
end

function var_0_0.UpdateRightContent(arg_4_0)
	local var_4_0 = arg_4_0.ticketCnt <= 0
	local var_4_1 = arg_4_0.oilCostOnce * arg_4_0.ticketCnt
	local var_4_2 = i18n("auto_battle_cost_oil", var_4_1)
	local var_4_3 = getProxy(PlayerProxy):getRawData()
	local var_4_4 = var_4_1 - arg_4_0.storeOil > var_4_3.oil

	if var_4_4 then
		var_4_2 = string.gsub(var_4_2, "#92fc63", COLOR_RED)
	end

	setText(arg_4_0.uiRightCostOilText, var_4_0 and "" or var_4_2)

	local var_4_5 = i18n("auto_battle_cost_book", arg_4_0.ticketCnt)
	local var_4_6 = arg_4_0.ticketCnt > arg_4_0.ownTicketCnt

	if var_4_6 then
		var_4_5 = string.gsub(var_4_5, "#92fc63", COLOR_RED)
	end

	setText(arg_4_0.uiRightCostTicketText, var_4_0 and "" or var_4_5)
	setActive(arg_4_0.awardEmptyTF, var_4_0)
	setActive(arg_4_0.oilCostTF:Find("empty"), var_4_0)
	setActive(arg_4_0.ticketCostTF:Find("empty"), var_4_0)

	GetOrAddComponent(arg_4_0.oilCostTF, typeof(CanvasGroup)).alpha = var_4_0 and 0.5 or 1
	GetOrAddComponent(arg_4_0.ticketCostTF, typeof(CanvasGroup)).alpha = var_4_0 and 0.5 or 1

	onButton(arg_4_0, arg_4_0.uiStartBtn, function()
		if arg_4_0.count <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_times_zero"))

			return
		end

		if var_4_4 or var_4_6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

			return
		end

		pg.m02:sendNotification(GAME.START_CHAPTER_AUTO, {
			type = ChapterAutoProxy.TYPE.BOSS,
			id = arg_4_0.expeditionId,
			num = arg_4_0.count,
			ticketNum = arg_4_0.ticketCnt
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateAwardTpl(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.awards[arg_6_1 + 1]
	local var_6_1 = Drop.Create(var_6_0)

	updateDrop(arg_6_2, var_6_1)
	onButton(arg_6_0, arg_6_2, function()
		arg_6_0:emit(BaseUI.ON_DROP, var_6_1)
	end, SFX_PANEL)
end

function var_0_0.GetAwards(arg_8_0)
	local var_8_0 = pg.expedition_data_template[arg_8_0]
	local var_8_1 = Clone(var_8_0.award_display)
	local var_8_2 = checkExist(pg.expedition_activity_template[arg_8_0], {
		"pt_drop_display"
	})

	if var_8_2 and type(var_8_2) == "table" then
		local var_8_3 = getProxy(ActivityProxy)

		for iter_8_0 = #var_8_2, 1, -1 do
			local var_8_4, var_8_5, var_8_6, var_8_7 = unpack(var_8_2)
			local var_8_8 = var_8_3:getActivityById(var_8_4)

			if var_8_8 and not var_8_8:isEnd() then
				if var_8_5 == DROP_TYPE_RESOURCE then
					table.insert(var_8_1, 1, {
						DROP_TYPE_ITEM,
						id2ItemId(var_8_6)
					})
				else
					table.insert(var_8_1, 1, {
						var_8_5,
						var_8_6
					})
				end
			end
		end
	end

	local var_8_9 = pg.expedition_auto_statistics[arg_8_0].drop_display_extra

	if type(var_8_9) == "table" then
		for iter_8_1, iter_8_2 in ipairs(var_8_9) do
			table.insert(var_8_1, {
				iter_8_2[1],
				iter_8_2[2]
			})
		end
	end

	return var_8_1
end

return var_0_0

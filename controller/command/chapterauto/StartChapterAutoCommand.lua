local var_0_0 = class("StartChapterAutoCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.id
	local var_1_3 = var_1_0.num
	local var_1_4 = var_1_0.ticketNum
	local var_1_5 = getProxy(ChapterProxy):getRemasterTicketCost()

	if BeginStageCommand.DockOverload() then
		return
	end

	local var_1_6 = getProxy(ChapterAutoProxy)
	local var_1_7 = var_1_6:GetRemainTime()

	if var_1_7 <= 0 or var_1_7 <= var_1_6:GetRecord(var_1_1, var_1_2) * (var_1_3 - 1) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_time"))

		return
	end

	if var_1_4 > var_1_6:GetValidTicketCntByType(ChapterAutoTicket.TYPE.MAIN) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

		return
	end

	local var_1_8 = ChapterAutoCommission.GetOnceOil(var_1_1, var_1_2) * var_1_4
	local var_1_9 = math.max(0, var_1_8 - var_1_6:GetOil())

	if var_1_9 > getProxy(PlayerProxy):getRawData().oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

		return
	end

	local var_1_10 = false
	local var_1_11 = getProxy(ChapterProxy)

	if var_1_1 == ChapterAutoProxy.TYPE.SLG then
		local var_1_12 = var_1_11:getChapterById(var_1_2, true)

		if var_1_11:getMapById(var_1_12:getConfig("map")):isRemaster() then
			var_1_10 = true
		end
	end

	if var_1_10 and var_1_11.remasterTickets < var_1_4 * var_1_5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_tickets_not_enough"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(13012, {
		type = var_1_1,
		id = var_1_2,
		num = var_1_3,
		ticket_num = var_1_4
	}, 13013, function(arg_2_0)
		if arg_2_0.result == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_start_tips"))

			local var_2_0 = getProxy(ChapterAutoProxy)

			var_2_0:SetCommissionList(arg_2_0.chapter_auto_battle_list)

			local var_2_1 = underscore.reduce(arg_2_0.chapter_auto_battle_list, 0, function(arg_3_0, arg_3_1)
				return arg_3_0 + arg_3_1.seconds
			end)

			var_2_0:AddCostTime(var_2_1)
			var_2_0:ReduceTicketByType(ChapterAutoTicket.TYPE.MAIN, var_1_4)

			if var_1_9 > 0 then
				local var_2_2 = getProxy(PlayerProxy)
				local var_2_3 = var_2_2:getData()

				var_2_3:consume({
					oil = var_1_9
				})
				var_2_2:updatePlayer(var_2_3)
			end

			var_2_0:ReduceOil(var_1_8 - var_1_9)

			if var_1_10 then
				local var_2_4 = getProxy(ChapterProxy)

				var_2_4.remasterTickets = var_2_4.remasterTickets - var_1_4 * var_1_5
			end

			arg_1_0:sendNotification(GAME.START_CHAPTER_AUTO_DONE, {
				isRemaster = var_1_10,
				type = var_1_1,
				id = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("chapter_auto_start_fail", arg_2_0.result))
		end
	end)
end

return var_0_0

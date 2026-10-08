local var_0_0 = class("StartWorldChapterAutoCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.list
	local var_1_2 = var_1_0.needTicket
	local var_1_3 = nowWorld()

	assert(var_1_3.type == World.TypeFull)

	local var_1_4 = getProxy(ChapterAutoProxy)

	if var_1_2 and var_1_4:GetValidTicketCntByType(ChapterAutoTicket.TYPE.WORLD) < #var_1_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

		return
	end

	local var_1_5 = 0

	for iter_1_0, iter_1_1 in ipairs(var_1_1) do
		var_1_5 = var_1_5 + ChapterAutoCommission.GetOnceOil(ChapterAutoProxy.TYPE.WORLD, iter_1_1)
	end

	if var_1_5 > var_1_3.staminaMgr:GetTotalStamina() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_not_enough_resource"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(13018, {
		map_id_list = var_1_1
	}, 13019, function(arg_2_0)
		if arg_2_0.result == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("auto_battle_start_tips"))

			local var_2_0 = getProxy(ChapterAutoProxy)

			var_2_0:SetCommissionList(arg_2_0.chapter_auto_battle_list)

			if var_1_2 then
				var_2_0:ReduceTicketByType(ChapterAutoTicket.TYPE.WORLD, #var_1_1)
			end

			var_1_3 = nowWorld()

			var_1_3.staminaMgr:ConsumeStamina(var_1_5)
			arg_1_0:sendNotification(GAME.START_WORLD_CHAPTER_AUTO_DONE, {})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("chapter_auto_start_fail", arg_2_0.result))
		end
	end)
end

return var_0_0

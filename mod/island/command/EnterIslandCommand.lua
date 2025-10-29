local var_0_0 = class("EnterIslandCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.code
	local var_1_3 = var_1_0.reconnect

	if var_1_2 and var_1_2 ~= "" then
		arg_1_0:Send(0, var_1_2, var_1_3)
	else
		arg_1_0:Send(var_1_1, 0, var_1_3)
	end
end

function var_0_0.Send(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	pg.ConnectionMgr.GetInstance():Send(21202, {
		island_id = arg_2_1,
		code = tostring(arg_2_2)
	}, 21203, function(arg_3_0)
		if arg_3_0.result == 0 then
			arg_2_0:sendNotification(GAME.ISLAND_GET_DATA, {
				id = arg_3_0.island_id,
				list = arg_3_0.player_list,
				reconnect = arg_2_3
			})
			getProxy(IslandProxy):EnterIsland(arg_3_0.island_id)
		elseif arg_3_0.result == 6 then
			arg_2_0:sendNotification(GAME.ISLAND_QUEUE_UP, {
				pos = arg_3_0.pos,
				id = arg_3_0.island_id
			})
		elseif arg_3_0.result == 19 then
			local var_3_0 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_3_1 = arg_3_0.cd - var_3_0
			local var_3_2 = pg.TimeMgr.GetInstance():DescCDTime(var_3_1)

			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip5", var_3_2))
		elseif arg_3_0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip1"))
		elseif arg_3_0.result == 20 or arg_3_0.result == 40 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip2"))
		elseif arg_3_0.result == 9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip3"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.result)
		end
	end)
end

return var_0_0

local var_0_0 = class("IslandFishingResultCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = var_1_0.fishId
	local var_1_3 = var_1_0.weight
	local var_1_4 = var_1_0.cupType
	local var_1_5 = var_1_0.fishPointId
	local var_1_6 = var_1_0.op
	local var_1_7 = var_1_0.islandId

	pg.ConnectionMgr.GetInstance():Send(21062, {
		island_id = var_1_7,
		point_id = var_1_5,
		end_result = var_1_6
	}, 21063, function(arg_2_0)
		if arg_2_0.result == 0 then
			if var_1_6 == IslandConst.FISHING_OP_SUCCESS then
				getProxy(IslandProxy):GetIsland():GetFishingAgency():AddFish(var_1_2, var_1_3, var_1_4)
				IslandBookHelper.OnFishingEnd(var_1_2)
			end

			if var_1_1 then
				var_1_1()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

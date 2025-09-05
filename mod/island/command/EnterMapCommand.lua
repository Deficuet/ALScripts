local var_0_0 = class("EnterMapCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback

	pg.ConnectionMgr.GetInstance():Send(21213, {
		island_id = var_1_0.islandId,
		map_id = var_1_0.mapId
	}, 21214, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):SetSyncObjInitData(arg_2_0.object_list)

			local var_2_0 = arg_1_0:IsSelf(var_1_0.islandId)
			local var_2_1 = var_2_0 and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()

			var_2_1:GetWildCollectAgency():InitGatherData(arg_2_0, var_1_0.islandId, var_2_0)
			var_2_1:GetVisitorAgency():InitMapVisitorList(var_1_0.mapId)
			existCall(var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

function var_0_0.IsSelf(arg_3_0, arg_3_1)
	return getProxy(PlayerProxy):getRawData().id == arg_3_1
end

return var_0_0

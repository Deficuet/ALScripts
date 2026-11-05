local var_0_0 = class("IslandSaveAgoraCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.list
	local var_1_2 = var_1_0.floorList
	local var_1_3 = var_1_0.tileList
	local var_1_4 = getProxy(IslandProxy):GetIsland()
	local var_1_5 = var_1_4:GetAgoraAgency()
	local var_1_6 = AgoraCalc.EncodeLayer(var_1_2)
	local var_1_7 = AgoraCalc.EncodeLayer(var_1_3)
	local var_1_8 = AgoraCalc.EncodePlaced(var_1_1)
	local var_1_9 = {
		placed_list = var_1_8,
		floor_data = var_1_6,
		tile_data = var_1_7
	}

	pg.ConnectionMgr.GetInstance():Send(21307, {
		update_data = var_1_9
	}, 21308, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_5:UpdatePlacedData(var_1_9, true)
			var_1_4:GetInteractSyncAgency():RebuildAgoraSlotMeta()
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_save_success"))
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandAgoraSave())
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

local var_0_0 = class("IslandSaveAgoraThemeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.themeData.id
	local var_1_2 = var_1_0.themeData.name
	local var_1_3 = var_1_0.themeData.updateList
	local var_1_4 = var_1_0.themeData.floorList
	local var_1_5 = var_1_0.themeData.tileList
	local var_1_6 = AgoraCalc.EncodePlaced(var_1_3)
	local var_1_7 = AgoraCalc.EncodeLayer(var_1_4)
	local var_1_8 = AgoraCalc.EncodeLayer(var_1_5)
	local var_1_9 = {
		id = var_1_1,
		name = var_1_2,
		placed_data = {
			placed_list = var_1_6,
			floor_data = var_1_7,
			tile_data = var_1_8
		}
	}

	pg.ConnectionMgr.GetInstance():Send(21317, {
		theme = var_1_9
	}, 21318, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetAgoraAgency():AddTheme(IslandTheme.New(var_1_9))
			arg_1_0:sendNotification(GAME.ISLAND_SAVE_AGORA_THEME_DONE)
		end
	end)
end

return var_0_0

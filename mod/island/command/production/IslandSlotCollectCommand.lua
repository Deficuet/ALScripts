local var_0_0 = class("IslandSlotCollectCommand", pm.SimpleCommand)

var_0_0.START_HAND_COLLECT_DONE = "IslandSlotCollectCommand:START_HAND_COLLECT_DONE"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.build_id
	local var_1_2 = var_1_0.area_id
	local var_1_3 = getProxy(IslandProxy):GetIsland()
	local var_1_4 = var_1_3:GetBuildingAgency()
	local var_1_5 = pg.island_set.mission_gather_point.key_value_varchar
	local var_1_6 = 1

	for iter_1_0, iter_1_1 in ipairs(var_1_5) do
		if var_1_2 == iter_1_1[1] then
			var_1_6 = 2
		end
	end

	pg.ConnectionMgr.GetInstance():Send(21507, {
		build_id = var_1_1,
		area_id = var_1_2,
		type = var_1_6
	}, 21508, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_4:GetBuilding(var_1_1)
			local var_2_1 = arg_2_0.collect_area

			if var_1_6 == 2 then
				var_2_1 = {
					id = var_1_2
				}
			end

			var_2_0:UpdateCollectDataBySlotId(var_2_1, var_1_6)

			local var_2_2 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_DROPMAIN_AWARD, {
				dropData = var_2_2
			})
			var_1_3:DispatchEvent(var_0_0.START_HAND_COLLECT_DONE, {
				build_id = var_1_1,
				area_id = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

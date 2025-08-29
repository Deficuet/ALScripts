local var_0_0 = class("IslandRecordLastPositionCommmand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.islandId
	local var_1_2 = var_1_0.mapId
	local var_1_3 = var_1_0.position
	local var_1_4 = var_1_0.rotation

	pg.ConnectionMgr.GetInstance():Send(21229, {
		island_id = var_1_1,
		player_position = {
			map_id = var_1_2,
			position = {
				x = var_1_3.x,
				y = var_1_3.y,
				z = var_1_3.z
			},
			rotation = {
				x = var_1_4.x,
				y = var_1_4.y,
				z = var_1_4.z
			}
		}
	})
end

return var_0_0

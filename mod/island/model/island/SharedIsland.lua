local var_0_0 = class("SharedIsland", import(".BaseIsland"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1.public_data)
	arg_1_0:HandleAgora()

	arg_1_0.mapID = pg.island_set.initial_visitor_scene.key_value_int

	arg_1_0:SetSpawnPointId(pg.island_set.initial_visitor_spawn_point.key_value_int)
end

function var_0_0.HandleAgora(arg_2_0)
	local var_2_0 = arg_2_0:GetAgoraAgency()
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(pg.island_furniture_template.all) do
		local var_2_2 = pg.island_furniture_template[iter_2_1]

		table.insert(var_2_1, {
			id = iter_2_1,
			count = var_2_2.setNum
		})
	end

	local var_2_3 = {
		furniture_list = var_2_1
	}

	var_2_0:InitPrivateData(var_2_3)
end

return var_0_0

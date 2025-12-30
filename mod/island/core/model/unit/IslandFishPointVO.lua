local var_0_0 = class("IslandFishPointVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = pg.island_world_objects[arg_1_2]

	var_0_0.super.Ctor(arg_1_0, {
		behaviourTree = "",
		id = arg_1_1,
		name = "fishPoint" .. arg_1_1,
		type = IslandConst.UNIT_TYPE_FISH_POINT,
		modelId = var_1_0.unitId,
		position = var_1_0.param.position,
		rotation = var_1_0.param.rotation,
		scale = {
			1,
			1,
			1
		}
	})
end

return var_0_0

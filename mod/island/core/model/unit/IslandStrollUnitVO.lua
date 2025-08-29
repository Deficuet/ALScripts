local var_0_0 = class("IslandStrollUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = pg.island_strollnpc[arg_1_1]

	var_0_0.super.Ctor(arg_1_0, {
		name = "StrollNpc",
		id = arg_1_1,
		type = IslandConst.UNIT_TYPE_STROLL,
		modelId = arg_1_2 or var_1_0.unit_id,
		behaviourTree = arg_1_0:GetDefaultBt(var_1_0),
		position = {
			0,
			0,
			0
		},
		rotation = {
			0,
			0,
			0
		},
		scale = {
			0,
			0,
			0
		}
	})

	arg_1_0.config = var_1_0
end

function var_0_0.GetDefaultBt(arg_2_0, arg_2_1)
	if not arg_2_1.behaviourTree or arg_2_1.behaviourTree == "" then
		return "Island/NodeCanvas/Npc/StrollNpc"
	end

	return arg_2_1.behaviourTree
end

function var_0_0.GetDefaultPathId(arg_3_0, arg_3_1)
	local var_3_0 = _.detect(arg_3_0.config.mapId, function(arg_4_0)
		return arg_4_0[1] == arg_3_1
	end)

	return var_3_0 and var_3_0[2]
end

function var_0_0.SetPath(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.position = BuildVector3(arg_5_2)
	arg_5_0.pathId = arg_5_1
end

function var_0_0.GetPath(arg_6_0)
	return arg_6_0.pathId
end

return var_0_0

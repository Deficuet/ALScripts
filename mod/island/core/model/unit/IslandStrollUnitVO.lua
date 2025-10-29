local var_0_0 = class("IslandStrollUnitVO", import(".IslandUnitVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	local var_1_0 = pg.island_strollnpc[arg_1_2]

	arg_1_0.shipId = arg_1_1

	var_0_0.super.Ctor(arg_1_0, {
		name = "StrollNpc",
		id = arg_1_2,
		type = IslandConst.UNIT_TYPE_STROLL,
		modelId = arg_1_3 or var_1_0.unit_id,
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
	arg_1_0.actionFeedback = nil
end

function var_0_0.IsSameShip(arg_2_0, arg_2_1)
	return arg_2_0.shipId == arg_2_1
end

function var_0_0.SetActionFeedback(arg_3_0, arg_3_1)
	arg_3_0.actionFeedback = arg_3_1
end

function var_0_0.GetActionFeedback(arg_4_0)
	return arg_4_0.actionFeedback
end

function var_0_0.ExistActionFeedback(arg_5_0)
	return arg_5_0.actionFeedback
end

function var_0_0.ClearActionFeedback(arg_6_0)
	arg_6_0.actionFeedback = nil
end

local function var_0_1(arg_7_0, arg_7_1)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		if pg.island_action_feedback[iter_7_1].feedback_type == arg_7_0 then
			table.insert(var_7_0, iter_7_1)
		end
	end

	if #var_7_0 <= 0 then
		return nil
	end

	return var_7_0[math.random(1, #var_7_0)]
end

function var_0_0.GetResponeAction(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.actionFeedback and arg_8_0.actionFeedback == arg_8_1
	local var_8_1 = pg.island_action[arg_8_1].feedback_type

	if var_8_0 then
		local var_8_2 = pg.island_action_feedback.get_id_list_by_condition[1]

		return var_0_1(var_8_1, var_8_2), true
	else
		local var_8_3 = pg.island_action_feedback.get_id_list_by_condition[2]

		return var_0_1(var_8_1, var_8_3), false
	end
end

function var_0_0.GetDefaultBt(arg_9_0, arg_9_1)
	if not arg_9_1.behaviourTree or arg_9_1.behaviourTree == "" then
		return "Island/NodeCanvas/Npc/StrollNpc"
	end

	return arg_9_1.behaviourTree
end

function var_0_0.GetDefaultPathId(arg_10_0, arg_10_1)
	local var_10_0 = _.detect(arg_10_0.config.mapId, function(arg_11_0)
		return arg_11_0[1] == arg_10_1
	end)

	return var_10_0 and var_10_0[2]
end

function var_0_0.SetPath(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.position = BuildVector3(arg_12_2)
	arg_12_0.pathId = arg_12_1
end

function var_0_0.GetPath(arg_13_0)
	return arg_13_0.pathId
end

return var_0_0

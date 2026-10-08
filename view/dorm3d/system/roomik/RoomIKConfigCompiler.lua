local var_0_0 = class("RoomIKConfigCompiler")

local function var_0_1(arg_1_0)
	local var_1_0 = arg_1_0[1]

	return switch(var_1_0, {
		function(arg_2_0, arg_2_1)
			return 0
		end,
		function()
			return 0
		end,
		function(arg_4_0, arg_4_1)
			return arg_4_0
		end,
		function(arg_5_0, arg_5_1)
			return arg_5_0
		end,
		function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
			return arg_6_0
		end,
		function(arg_7_0)
			return 0
		end
	}, function(arg_8_0)
		return type(arg_8_0) == "number" and arg_8_0 or 0
	end, unpack(arg_1_0, 2))
end

function var_0_0.BuildSubTargets(arg_9_0)
	local var_9_0 = arg_9_0:GetSubTargets()
	local var_9_1 = arg_9_0:GetPlaneRotations()
	local var_9_2 = arg_9_0:GetPlaneScales()

	return _.map(_.range(#var_9_0), function(arg_10_0)
		return {
			name = var_9_0[arg_10_0][1],
			planeRot = var_9_1[arg_10_0],
			planeScale = var_9_2[arg_10_0]
		}
	end)
end

function var_0_0.BuildController(arg_11_0, arg_11_1)
	arg_11_1 = arg_11_1 or {}

	return Dorm3dIKController.New({
		triggerName = arg_11_0:getConfig("trigger_param")[2],
		controllerName = arg_11_0:GetControllerPath(),
		subTargets = var_0_0.BuildSubTargets(arg_11_0),
		actionType = arg_11_0:GetActionTriggerParams()[1],
		controlRect = arg_11_0:GetRect(),
		actionRect = arg_11_0:GetTriggerRect(),
		backTime = arg_11_1.backTime or arg_11_0:GetRevertTime(),
		actionRevertTime = arg_11_1.actionRevertTime or arg_11_0:GetActionRevertTime(),
		timelineActionEvent = arg_11_1.timelineActionEvent,
		ignoreDrag = arg_11_1.ignoreDrag or false
	})
end

local function var_0_2(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_2.target_ik

	if _.detect(arg_12_0, function(arg_13_0)
		return arg_13_0[1] == var_12_0
	end) then
		return
	end

	arg_12_1[var_12_0] = {
		back_time = arg_12_2.back_time
	}

	local var_12_1 = {
		var_12_0,
		0,
		{}
	}

	if arg_12_2.trigger_dialogue > 0 then
		var_12_1[3] = {
			4,
			0,
			arg_12_2.trigger_dialogue
		}
	end

	table.insert(arg_12_0, var_12_1)
end

local function var_0_3(arg_14_0, arg_14_1)
	local var_14_0 = Dorm3dIK.New({
		configId = arg_14_0[1]
	})
	local var_14_1 = arg_14_0[3]
	local var_14_2 = var_0_1(var_14_1)
	local var_14_3 = var_14_0:GetRevertTime()
	local var_14_4 = arg_14_1[var_14_0:GetConfigID()]
	local var_14_5 = tobool(var_14_4)

	if var_14_5 then
		var_14_2 = var_14_4.back_time
		var_14_3 = var_14_4.back_time
		var_14_0.ignoreDrag = true
	end

	return {
		ikData = var_14_0,
		link = var_14_1,
		controller = var_0_0.BuildController(var_14_0, {
			backTime = var_14_3,
			actionRevertTime = var_14_2,
			ignoreDrag = var_14_5
		})
	}
end

function var_0_0.Compile(arg_15_0)
	assert(type(arg_15_0) == "table", "Invalid IK status config")
	assert(type(arg_15_0.ik_id) == "table", "Invalid IK status ik_id: " .. tostring(arg_15_0.id))
	assert(type(arg_15_0.touch_data) == "table", "Invalid IK status touch_data: " .. tostring(arg_15_0.id))

	local var_15_0 = table.shallowCopy(arg_15_0.ik_id)
	local var_15_1 = {}

	_.each(arg_15_0.touch_data, function(arg_16_0)
		assert(type(arg_16_0) == "table" and type(arg_16_0[3]) == "table", "Invalid IK touch link in status: " .. tostring(arg_15_0.id))

		local var_16_0 = arg_16_0[3]

		if var_16_0[1] == 7 then
			local var_16_1 = var_16_0[2]

			assert(var_16_1, "Missing IK touch move id in status: " .. tostring(arg_15_0.id))

			local var_16_2 = pg.dorm3d_ik_touch_move[var_16_1]

			assert(var_16_2, "Missing dorm3d_ik_touch_move config: " .. tostring(var_16_1))
			var_0_2(var_15_0, var_15_1, var_16_2)
		end
	end)

	local var_15_2 = {}
	local var_15_3 = {}
	local var_15_4 = {}

	_.each(var_15_0, function(arg_17_0)
		local var_17_0 = var_0_3(arg_17_0, var_15_1)

		table.insert(var_15_2, var_17_0.ikData)
		table.insert(var_15_3, var_17_0.controller)

		var_15_4[var_17_0.ikData:GetControllerPath()] = var_17_0.link
	end)

	local var_15_5 = {}
	local var_15_6 = {}

	_.each(arg_15_0.touch_data, function(arg_18_0)
		local var_18_0 = pg.dorm3d_ik_touch[arg_18_0[1]]

		assert(var_18_0, "Missing dorm3d_ik_touch config: " .. tostring(arg_18_0[1]))

		if #var_18_0.scene_item > 0 and not var_15_6[var_18_0.scene_item] then
			var_15_6[var_18_0.scene_item] = true

			table.insert(var_15_5, {
				id = arg_18_0[1],
				path = var_18_0.scene_item
			})
		end
	end)

	return {
		touchDatas = arg_15_0.touch_data,
		layers = var_15_2,
		controllers = var_15_3,
		actionDict = var_15_4,
		sceneItems = var_15_5
	}
end

return var_0_0

local var_0_0 = class("RoomIKTipBuilder")

function var_0_0.GetWorldTipPosition(arg_1_0)
	if not arg_1_0 then
		return
	end

	local var_1_0 = arg_1_0.position
	local var_1_1 = arg_1_0:GetComponent(typeof(UnityEngine.Collider))

	if var_1_1 then
		var_1_0 = var_1_1.bounds.center
	end

	return var_1_0
end

local function var_0_1(arg_2_0, arg_2_1)
	local var_2_0 = var_0_0.GetWorldTipPosition(arg_2_0)

	if not var_2_0 then
		return
	end

	return arg_2_1(var_2_0)
end

function var_0_0.BuildTextTips(arg_3_0)
	local var_3_0 = {}

	_.each(arg_3_0 or {}, function(arg_4_0)
		local var_4_0 = arg_4_0:getConfig("tip_text")

		if var_4_0 and #var_4_0 > 0 then
			table.insert(var_3_0, var_4_0)
		end
	end)

	return var_3_0
end

function var_0_0.BuildTouchTips(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0 = {}

	if not arg_5_2 then
		return var_5_0
	end

	_.each(arg_5_0 or {}, function(arg_6_0)
		local var_6_0 = arg_5_1[arg_6_0[1]]

		assert(var_6_0, "Missing dorm3d_ik_touch config: " .. tostring(arg_6_0[1]))

		local var_6_1
		local var_6_2 = Vector2.zero

		if var_6_0.tip_offset and var_6_0.tip_offset ~= "" then
			var_6_2 = Vector2.New(unpack(var_6_0.tip_offset))
		end

		if #var_6_0.scene_item > 0 then
			var_6_1 = arg_5_3(var_6_0.scene_item)
		else
			var_6_1 = arg_5_2.Colliders[var_6_0.body]
		end

		table.insert(var_5_0, {
			active = tobool(var_6_1),
			screenPosition = var_0_1(var_6_1, arg_5_4),
			offset = var_6_2,
			triggerType = var_6_0.trigger_type
		})
	end)

	return var_5_0
end

function var_0_0.BuildIKTips(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {}

	if not arg_7_1 then
		return var_7_0
	end

	local var_7_1 = _.filter(arg_7_0 or {}, function(arg_8_0)
		return not arg_8_0.ignoreDrag
	end)

	_.each(var_7_1, function(arg_9_0)
		local var_9_0 = arg_9_0:GetTriggerBoneName()
		local var_9_1 = var_9_0 and arg_7_1.Colliders[var_9_0] or nil

		table.insert(var_7_0, {
			active = tobool(var_9_1),
			screenPosition = var_0_1(var_9_1, arg_7_2),
			offset = arg_9_0:GetIKTipOffset(),
			triggerRect = arg_9_0:GetTriggerRect()
		})
	end)

	return var_7_0
end

return var_0_0

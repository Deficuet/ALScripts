local var_0_0 = class("RoomTouchTriggerRunner")

var_0_0.TRIGGER_CLICK = 1
var_0_0.TRIGGER_LONG_PRESS = 2
var_0_0.HOLD_PROGRESS_SHOW_DELAY = 0.5

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.owner = arg_1_1
end

function var_0_0.Dispose(arg_2_0)
	arg_2_0:CancelAllTouchPress()
end

function var_0_0.Update(arg_3_0)
	arg_3_0:UpdateHoldProgress()
end

function var_0_0.GetTouchPressKey(arg_4_0, arg_4_1, arg_4_2)
	return tostring(arg_4_1) .. ":" .. tostring(arg_4_2)
end

function var_0_0.AssertTouchSource(arg_5_0, arg_5_1, arg_5_2)
	assert(arg_5_1 == "body" or arg_5_1 == "scene_item", "Unknown touch source: " .. tostring(arg_5_1))
	assert(arg_5_2 and arg_5_2 ~= "", "Invalid touch target: " .. tostring(arg_5_2))
end

function var_0_0.GetTouchConfigSourceTarget(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = type(arg_6_1.body) == "string" and arg_6_1.body ~= ""
	local var_6_1 = type(arg_6_1.scene_item) == "string" and arg_6_1.scene_item ~= ""

	assert(var_6_0 ~= var_6_1, "Invalid dorm3d_ik_touch source: " .. tostring(arg_6_2 or arg_6_1.id))

	if var_6_1 then
		return "scene_item", arg_6_1.scene_item
	else
		return "body", arg_6_1.body
	end
end

function var_0_0.AssertTouchConfig(arg_7_0, arg_7_1)
	local var_7_0 = pg.dorm3d_ik_touch[arg_7_1]

	assert(var_7_0, "Missing dorm3d_ik_touch config: " .. tostring(arg_7_1))
	assert(var_7_0.trigger_type == var_0_0.TRIGGER_CLICK or var_7_0.trigger_type == var_0_0.TRIGGER_LONG_PRESS, "Invalid dorm3d_ik_touch trigger_type: " .. tostring(arg_7_1))

	if var_7_0.trigger_type == var_0_0.TRIGGER_LONG_PRESS then
		assert(type(var_7_0.hold_time) == "number" and var_7_0.hold_time > 0, "Invalid dorm3d_ik_touch hold_time: " .. tostring(arg_7_1))
	end

	arg_7_0:GetTouchConfigSourceTarget(var_7_0, arg_7_1)

	return var_7_0
end

function var_0_0.ValidateTouchConfigs(arg_8_0, arg_8_1, arg_8_2)
	assert(type(arg_8_1) == "table", "Invalid dorm3d_ik_status touch_data: " .. tostring(arg_8_2))

	local var_8_0 = {}

	_.each(arg_8_1, function(arg_9_0)
		local var_9_0 = arg_9_0[1]
		local var_9_1 = arg_8_0:AssertTouchConfig(var_9_0)
		local var_9_2, var_9_3 = arg_8_0:GetTouchConfigSourceTarget(var_9_1, var_9_0)
		local var_9_4 = var_9_2 .. ":" .. var_9_3 .. ":" .. tostring(var_9_1.trigger_type)

		assert(not var_8_0[var_9_4], string.format("Duplicate dorm3d_ik_touch trigger: ids=%s,%s source=%s target=%s trigger_type=%s", tostring(var_8_0[var_9_4]), tostring(var_9_0), var_9_2, var_9_3, tostring(var_9_1.trigger_type)))

		var_8_0[var_9_4] = var_9_0
	end)
end

function var_0_0.GetTouchInfos(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0:AssertTouchSource(arg_10_1, arg_10_2)

	local var_10_0 = arg_10_0.owner:GetActiveIKTouchData()

	if not var_10_0 then
		return {}
	end

	assert(type(var_10_0) == "table", "Invalid current IK touch data")

	local var_10_1 = {}

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_2 = iter_10_1[1]
		local var_10_3 = arg_10_0:AssertTouchConfig(var_10_2)
		local var_10_4, var_10_5 = arg_10_0:GetTouchConfigSourceTarget(var_10_3, var_10_2)

		if var_10_4 == arg_10_1 and var_10_5 == arg_10_2 and var_10_3.trigger_type == arg_10_3 then
			table.insert(var_10_1, iter_10_1)
		end
	end

	assert(#var_10_1 <= 1, string.format("Duplicate dorm3d_ik_touch trigger: source=%s target=%s trigger_type=%s", tostring(arg_10_1), tostring(arg_10_2), tostring(arg_10_3)))

	return var_10_1
end

function var_0_0.GetFirstLongPressInfo(arg_11_0, arg_11_1, arg_11_2)
	return arg_11_0:GetTouchInfos(arg_11_1, arg_11_2, var_0_0.TRIGGER_LONG_PRESS)[1]
end

function var_0_0.OnTouchPressDown(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	arg_12_0:AssertTouchSource(arg_12_1, arg_12_2)
	arg_12_0:ClearTouchPressConsumed(arg_12_1, arg_12_2)
	arg_12_0:CancelTouchPress(arg_12_1, arg_12_2)

	local var_12_0 = arg_12_0:GetFirstLongPressInfo(arg_12_1, arg_12_2)

	if not var_12_0 then
		return
	end

	assert(arg_12_3, "Missing touch press screenPosition")

	local var_12_1 = var_12_0[1]
	local var_12_2 = arg_12_0:AssertTouchConfig(var_12_1)
	local var_12_3 = arg_12_0:GetTouchPressKey(arg_12_1, arg_12_2)
	local var_12_4 = {
		triggered = false,
		holdTime = var_12_2.hold_time,
		screenPosition = arg_12_3,
		startTime = Time.time
	}

	var_12_4.timer = Timer.New(function()
		var_12_4.triggered = true
		var_12_4.timer = nil

		arg_12_0:HideHoldProgress()
		arg_12_0:SetTouchPressConsumed(arg_12_1, arg_12_2)
		arg_12_0.owner:TriggerTouchInfo(var_12_0)
	end, var_12_2.hold_time, 1)

	var_12_4.timer:Start()

	arg_12_0.touchPressStates = arg_12_0.touchPressStates or {}
	arg_12_0.touchPressStates[var_12_3] = var_12_4
end

function var_0_0.OnTouchPressUp(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:AssertTouchSource(arg_14_1, arg_14_2)

	local var_14_0 = arg_14_0:GetTouchPressKey(arg_14_1, arg_14_2)
	local var_14_1 = arg_14_0.touchPressStates and arg_14_0.touchPressStates[var_14_0] or nil
	local var_14_2 = var_14_1 and var_14_1.triggered or arg_14_0.touchPressConsumed and arg_14_0.touchPressConsumed[var_14_0]

	arg_14_0:CancelTouchPress(arg_14_1, arg_14_2)
	arg_14_0:ClearTouchPressConsumed(arg_14_1, arg_14_2)

	if var_14_2 then
		return
	end

	local var_14_3 = arg_14_0:GetTouchInfos(arg_14_1, arg_14_2, var_0_0.TRIGGER_CLICK)

	if not var_14_3[1] then
		return
	end

	arg_14_0.owner:TriggerTouchInfo(var_14_3[1])
end

function var_0_0.SetTouchPressConsumed(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.touchPressConsumed = arg_15_0.touchPressConsumed or {}
	arg_15_0.touchPressConsumed[arg_15_0:GetTouchPressKey(arg_15_1, arg_15_2)] = true
end

function var_0_0.ClearTouchPressConsumed(arg_16_0, arg_16_1, arg_16_2)
	if not arg_16_0.touchPressConsumed then
		return
	end

	arg_16_0.touchPressConsumed[arg_16_0:GetTouchPressKey(arg_16_1, arg_16_2)] = nil
end

function var_0_0.CancelTouchPress(arg_17_0, arg_17_1, arg_17_2)
	if not arg_17_0.touchPressStates then
		return
	end

	local var_17_0 = arg_17_0:GetTouchPressKey(arg_17_1, arg_17_2)
	local var_17_1 = arg_17_0.touchPressStates[var_17_0]

	if var_17_1 and var_17_1.timer then
		var_17_1.timer:Stop()
	end

	arg_17_0:HideHoldProgress()

	arg_17_0.touchPressStates[var_17_0] = nil
end

function var_0_0.CancelAllTouchPress(arg_18_0)
	arg_18_0:HideHoldProgress()

	if not arg_18_0.touchPressStates then
		return
	end

	for iter_18_0, iter_18_1 in pairs(arg_18_0.touchPressStates) do
		if iter_18_1.timer then
			iter_18_1.timer:Stop()
		end
	end

	arg_18_0.touchPressStates = nil
end

function var_0_0.HideHoldProgress(arg_19_0)
	if not arg_19_0.holdProgressActive then
		return
	end

	arg_19_0.holdProgressActive = nil

	arg_19_0.owner:Emit(Dorm3dIKView.UPDATE_HOLD_PROGRESS, false)
end

function var_0_0.UpdateHoldProgress(arg_20_0)
	if not arg_20_0.touchPressStates then
		arg_20_0:HideHoldProgress()

		return
	end

	for iter_20_0, iter_20_1 in pairs(arg_20_0.touchPressStates) do
		if not iter_20_1.triggered and iter_20_1.holdTime > var_0_0.HOLD_PROGRESS_SHOW_DELAY then
			local var_20_0 = Time.time - iter_20_1.startTime

			if var_20_0 >= var_0_0.HOLD_PROGRESS_SHOW_DELAY then
				arg_20_0.holdProgressActive = true

				arg_20_0.owner:Emit(Dorm3dIKView.UPDATE_HOLD_PROGRESS, true, iter_20_1.screenPosition, var_20_0 / iter_20_1.holdTime)

				return
			end
		end
	end

	arg_20_0:HideHoldProgress()
end

return var_0_0

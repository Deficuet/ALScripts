local var_0_0 = class("Live2dDrag")
local var_0_1 = 4
local var_0_2 = {
	Live2D.DRAG_DOWN_ACTION
}
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3
local var_0_6 = 1
local var_0_7 = 2
local var_0_8 = 1

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.live2dData = arg_1_2
	arg_1_0.frameRate = Application.targetFrameRate or 60
	arg_1_0.id = arg_1_1.id
	arg_1_0.drawAbleName = arg_1_1.draw_able_name or ""
	arg_1_0.parameterName = arg_1_1.parameter
	arg_1_0.mode = arg_1_1.mode and arg_1_1.mode ~= 0 and arg_1_1.mode or 1
	arg_1_0.startValue = arg_1_1.start_value or 0
	arg_1_0.range = arg_1_1.range and arg_1_0.range ~= "" and arg_1_1.range or {
		0,
		0
	}
	arg_1_0.offsetX = arg_1_1.offset_x

	if arg_1_0.offsetX == 0 then
		arg_1_0.offsetX = nil
	end

	arg_1_0.offsetY = arg_1_1.offset_y

	if arg_1_0.offsetY == 0 then
		arg_1_0.offsetY = nil
	end

	arg_1_0.smooth = arg_1_1.smooth / 1000
	arg_1_0.smoothRevert = arg_1_1.revert_smooth / 1000
	arg_1_0.revert = arg_1_1.revert
	arg_1_0.ignoreReact = arg_1_1.ignore_react == 1
	arg_1_0.gyro = arg_1_1.gyro == 1 or nil
	arg_1_0.gyroX = arg_1_1.gyro_x == 1
	arg_1_0.gyroY = arg_1_1.gyro_y == 1
	arg_1_0.gyroZ = arg_1_1.gyro_z == 1
	arg_1_0.ignoreAction = arg_1_1.ignore_action == 1
	arg_1_0.dragDirect = arg_1_1.drag_direct
	arg_1_0.rangeAbs = arg_1_1.range_abs == 1
	arg_1_0.partsData = arg_1_1.parts_data
	arg_1_0.actionTrigger = arg_1_1.action_trigger
	arg_1_0.reactX = arg_1_1.react_pos_x ~= 0 and arg_1_1.react_pos_x or nil
	arg_1_0.reactY = arg_1_1.react_pos_y ~= 0 and arg_1_1.react_pos_y or nil
	arg_1_0.actionTriggerActive = arg_1_1.action_trigger_active
	arg_1_0.relationParameter = arg_1_1.relation_parameter
	arg_1_0.relationParts = arg_1_0.relationParameter.parts
	arg_1_0.limitTime = arg_1_1.limit_time > 0 and arg_1_1.limit_time or var_0_1
	arg_1_0.offsetCircle = arg_1_1.offset_circle or ""
	arg_1_0.offsetCirclePos = arg_1_0.offsetCircle.pos and arg_1_0.offsetCircle.pos or nil
	arg_1_0.offsetCircleStart = arg_1_0.offsetCircle.start and arg_1_0.offsetCircle.start or nil
	arg_1_0.listenerData = arg_1_1.listener_data
	arg_1_0.listenerType = arg_1_0.listenerData.type
	arg_1_0.listenerChange = arg_1_0.listenerData.change
	arg_1_0.listenerApply = arg_1_0.listenerData.apply
	arg_1_0.reactCondition = arg_1_1.react_condition and arg_1_1.react_condition ~= "" and arg_1_1.react_condition or {}
	arg_1_0.idleOn = arg_1_0.reactCondition.idle_on and arg_1_0.reactCondition.idle_on or {}
	arg_1_0.idleOff = arg_1_0.reactCondition.idle_off and arg_1_0.reactCondition.idle_off or {}

	local var_1_0 = false

	if type(arg_1_1.revert_idle_index) == "number" then
		var_1_0 = arg_1_1.revert_idle_index == 1 and true or false
	elseif type(arg_1_1.revert_idle_index) == "table" then
		var_1_0 = arg_1_1.revert_idle_index
	end

	arg_1_0.revertIdleIndex = var_1_0
	arg_1_0.revertActionIndex = arg_1_1.revert_action_index == 1 and true or false
	arg_1_0.saveParameterFlag = true

	if arg_1_1.save_parameter == -1 then
		arg_1_0.saveParameterFlag = false
	end

	arg_1_0.randomAttitudeIndex = L2D_RANDOM_PARAM
	arg_1_0._active = false
	arg_1_0._parameterCom = nil
	arg_1_0.parameterValue = arg_1_0.startValue
	arg_1_0.parameterTargetValue = arg_1_0.startValue
	arg_1_0.parameterSmooth = 0
	arg_1_0.parameterSmoothTime = arg_1_0.smooth
	arg_1_0.mouseInputDown = Vector2(0, 0)
	arg_1_0.nextTriggerTime = 0
	arg_1_0.triggerActionTime = 0
	arg_1_0.sensitive = 4
	arg_1_0.l2dIdleIndex = 0
	arg_1_0.reactPos = Vector2(0, 0)
	arg_1_0.actionListIndex = 1
	arg_1_0._relationParameterList = {}
	arg_1_0.offsetDragX = arg_1_0.startValue
	arg_1_0.offsetDragY = arg_1_0.startValue
	arg_1_0.rangeOffset = arg_1_0.range[2] - arg_1_0.range[1]
	arg_1_0.offsetDragTargetX = arg_1_0.startValue
	arg_1_0.offsetDragTargetY = arg_1_0.startValue
	arg_1_0._relationFlag = false
	arg_1_0.ableFlag = false

	if arg_1_0.relationParameter and arg_1_0.relationParameter.list then
		arg_1_0._relationFlag = true
	end

	arg_1_0.extendActionFlag = false
	arg_1_0.parameterComAdd = true
	arg_1_0.reactConditionFlag = false
	arg_1_0.loadL2dStep = true
end

function var_0_0.onListenerEvent(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:onListenerTrigger(arg_2_1, arg_2_2)

	if not arg_2_0.listenerType then
		return
	end

	if arg_2_0.listenerType == arg_2_1 then
		local var_2_0 = arg_2_2.action
		local var_2_1 = arg_2_2.values
		local var_2_2 = arg_2_2.idle
		local var_2_3 = arg_2_2.idle_change
		local var_2_4 = arg_2_2.draw_able_name
		local var_2_5 = arg_2_2.parameter_name
		local var_2_6 = false

		if arg_2_0.listenerChange and #arg_2_0.listenerChange > 0 then
			local var_2_7 = arg_2_0:getChangeCheckName(arg_2_1, arg_2_2)

			if var_2_7 then
				for iter_2_0 = 1, #arg_2_0.listenerChange do
					local var_2_8 = arg_2_0.listenerChange[iter_2_0]
					local var_2_9 = var_2_8[1]
					local var_2_10 = var_2_8[2]
					local var_2_11 = var_2_8[3]
					local var_2_12 = #var_2_8 >= 4 and var_2_8[4] or 1

					if table.contains(var_2_10, var_2_7) then
						local var_2_13

						if var_2_9 == var_0_6 then
							var_2_13 = arg_2_0.parameterTargetValue + var_2_11
						elseif var_2_9 == var_0_7 then
							var_2_13 = var_2_11
						end

						if var_2_13 then
							var_2_6 = true

							local var_2_14 = arg_2_0:fixParameterTargetValue(var_2_13, arg_2_0.range, arg_2_0.rangeAbs, arg_2_0.dragDirect)

							if arg_2_0.actionTrigger.change_focus == false then
								arg_2_0.prepareTargetValue = var_2_14

								print(arg_2_0.parameterName .. "等待动作结束后的target赋值" .. arg_2_0.parameterTargetValue)
							else
								arg_2_0:setTargetValue(var_2_14)
								print(arg_2_0.parameterName .. "监听 数值变更为" .. arg_2_0.parameterTargetValue)
							end
						end

						if var_2_12 and var_2_12 > 0 then
							var_2_6 = true
							arg_2_0.actionListIndex = var_2_12
						end
					end
				end
			end
		end

		if arg_2_0.listenerApply and #arg_2_0.listenerApply > 0 then
			local var_2_15 = arg_2_0.listenerApply[1]
			local var_2_16 = arg_2_0.listenerApply[2]

			if var_2_15 == var_0_8 and var_2_6 then
				local var_2_17 = arg_2_0.parameterTargetValue

				if arg_2_0.prepareTargetValue ~= nil then
					var_2_17 = arg_2_0.prepareTargetValue
				end

				local var_2_18

				for iter_2_1 = 1, #var_2_16 do
					local var_2_19 = var_2_16[iter_2_1]

					if var_2_17 >= var_2_19[1] and var_2_17 < var_2_19[2] then
						var_2_18 = var_2_19[3]
					end
				end

				if var_2_18 and arg_2_0.l2dIdleIndex ~= var_2_18 then
					arg_2_0:onEventCallback(Live2D.EVENT_CHANGE_IDLE_INDEX, {
						id = arg_2_0.id,
						idle = var_2_18,
						activeData = arg_2_0.actionTriggerActive
					})
				end
			end
		end
	end
end

function var_0_0.onListenerTrigger(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_0.actionTrigger.click_cd and arg_3_1 == Live2D.ON_ACTION_DRAG_CLICK and table.contains(arg_3_0.actionTrigger.click_cd, arg_3_2.draw_able_name) then
		arg_3_0.nextTriggerTime = arg_3_0.limitTime
	end
end

function var_0_0.getChangeCheckName(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_1 == Live2D.ON_ACTION_PLAY then
		return arg_4_2.action
	elseif arg_4_1 == Live2D.ON_ACTION_DRAG_CLICK then
		return arg_4_2.draw_able_name
	elseif arg_4_1 == Live2D.ON_ACTION_CHANGE_IDLE then
		return arg_4_2.idle
	elseif arg_4_1 == Live2D.ON_ACTION_PARAMETER then
		-- block empty
	elseif arg_4_1 == Live2D.ON_ACTION_DOWN then
		-- block empty
	elseif arg_4_1 == Live2D.ON_ACTION_XY_TRIGGER then
		-- block empty
	elseif arg_4_1 == Live2D.ON_ACTION_DRAG_TRIGGER then
		-- block empty
	end

	return nil
end

function var_0_0.startDrag(arg_5_0, arg_5_1)
	if arg_5_0.ignoreAction and arg_5_0.l2dIsPlaying then
		return
	end

	print(arg_5_0.drawAbleName .. " 按下了")

	if not arg_5_0._active then
		arg_5_0._active = true
		arg_5_0.mouseInputDown = Input.mousePosition
		arg_5_0.mouseInputDownTime = Time.time
		arg_5_0.triggerActionTime = 0

		if table.contains(var_0_2, arg_5_0.actionTrigger.type) then
			arg_5_0.actionListIndex = 1
		end

		arg_5_0.parameterSmoothTime = arg_5_0.smooth
	end
end

function var_0_0.stopDrag(arg_6_0, arg_6_1)
	if arg_6_0._active then
		arg_6_0._active = false

		arg_6_0:setParameterRevert()

		if arg_6_0.offsetDragX then
			arg_6_0.offsetDragTargetX = arg_6_0:fixParameterTargetValue(arg_6_0.offsetDragX, arg_6_0.range, arg_6_0.rangeAbs, arg_6_0.dragDirect)
		end

		if arg_6_0.offsetDragY then
			arg_6_0.offsetDragTargetY = arg_6_0:fixParameterTargetValue(arg_6_0.offsetDragY, arg_6_0.range, arg_6_0.rangeAbs, arg_6_0.dragDirect)
		end

		arg_6_0:checkResetTriggerTime()

		arg_6_0.mouseInputUp = Input.mousePosition
		arg_6_0.mouseInputUpTime = Time.time
		arg_6_0.mouseWorld = nil
		arg_6_0.circleDragWorld = nil

		arg_6_0:updatePartsParameter()
		arg_6_0:saveData()
	end
end

function var_0_0.setParameterRevert(arg_7_0)
	if arg_7_0.revert > 0 then
		arg_7_0.parameterToStart = arg_7_0.revert / 1000
		arg_7_0.parameterSmoothTime = arg_7_0.smoothRevert
	end
end

function var_0_0.onDrag(arg_8_0, arg_8_1)
	arg_8_0.mouseWorld = arg_8_1.pointerCurrentRaycast.worldPosition
end

function var_0_0.checkResetTriggerTime(arg_9_0)
	local var_9_0 = false

	if arg_9_0.actionTrigger.type == Live2D.DRAG_DOWN_ACTION and arg_9_0.actionTrigger.last then
		var_9_0 = true
	end

	if var_9_0 then
		arg_9_0:resetNextTriggerTime()
	end
end

function var_0_0.resetNextTriggerTime(arg_10_0)
	arg_10_0.nextTriggerTime = 0
end

function var_0_0.updatePartsParameter(arg_11_0)
	if type(arg_11_0.partsData) == "table" then
		local var_11_0 = arg_11_0.partsData.parts
		local var_11_1 = arg_11_0.partsData.type
		local var_11_2 = false

		if arg_11_0.offsetX or arg_11_0.offsetY then
			var_11_2 = true
		elseif arg_11_0.actionTrigger and arg_11_0.actionTrigger.type == Live2D.DRAG_DOWN_TOUCH then
			var_11_2 = true
		elseif arg_11_0.offsetCirclePos then
			var_11_2 = true
		end

		if var_11_2 then
			local var_11_3 = arg_11_0.parameterTargetValue
			local var_11_4
			local var_11_5

			for iter_11_0 = 1, #var_11_0 do
				local var_11_6 = var_11_0[iter_11_0]
				local var_11_7 = math.abs(var_11_3 - var_11_6)

				if var_11_1 == var_0_3 or not var_11_1 then
					if not var_11_4 or var_11_7 < var_11_4 then
						var_11_4 = var_11_7
						var_11_5 = iter_11_0
					end
				elseif var_11_1 == var_0_4 then
					if var_11_6 <= var_11_3 and (not var_11_4 or var_11_7 < var_11_4) then
						var_11_4 = var_11_7
						var_11_5 = iter_11_0
					end
				elseif var_11_1 == var_0_5 and var_11_3 <= var_11_6 and (not var_11_4 or var_11_7 < var_11_4) then
					var_11_4 = var_11_7
					var_11_5 = iter_11_0
				end
			end

			if var_11_5 then
				if math.abs(arg_11_0.parameterTargetValue - var_11_0[var_11_5]) >= 0.05 then
					print("吸附数值" .. var_11_0[var_11_5])
				end

				arg_11_0:setTargetValue(var_11_0[var_11_5])
			end
		end
	end
end

function var_0_0.getIgnoreReact(arg_12_0)
	return arg_12_0.ignoreReact
end

function var_0_0.setParameterCom(arg_13_0, arg_13_1)
	if not arg_13_1 then
		-- block empty
	end

	arg_13_0._parameterCom = arg_13_1
end

function var_0_0.getParameterCom(arg_14_0)
	return arg_14_0._parameterCom
end

function var_0_0.addRelationComData(arg_15_0, arg_15_1, arg_15_2)
	table.insert(arg_15_0._relationParameterList, {
		com = arg_15_1,
		data = arg_15_2
	})
end

function var_0_0.getRelationParameterList(arg_16_0)
	return arg_16_0._relationParameterList
end

function var_0_0.getReactCondition(arg_17_0)
	return arg_17_0.reactConditionFlag
end

function var_0_0.getActive(arg_18_0)
	return arg_18_0._active
end

function var_0_0.getParameterUpdateFlag(arg_19_0)
	return arg_19_0._parameterUpdateFlag
end

function var_0_0.setEventCallback(arg_20_0, arg_20_1)
	arg_20_0._eventCallback = arg_20_1
end

function var_0_0.onEventCallback(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	if arg_21_1 == Live2D.EVENT_ACTION_APPLY then
		local var_21_0 = {}
		local var_21_1
		local var_21_2 = false
		local var_21_3
		local var_21_4
		local var_21_5
		local var_21_6 = false

		if arg_21_0.actionTrigger.action then
			var_21_1 = arg_21_0:fillterAction(arg_21_0.actionTrigger.action)
			var_21_0 = arg_21_0.actionTriggerActive
			var_21_2 = arg_21_0.actionTrigger.focus == 1 and true or false
			var_21_3 = arg_21_0.actionTrigger.target or nil
			var_21_6 = arg_21_0.actionTrigger.target_focus == 1 and true or false

			if (arg_21_0.actionTrigger.circle or nil) and var_21_3 and var_21_3 == arg_21_0.parameterTargetValue then
				var_21_3 = arg_21_0.startValue
			end

			var_21_4 = arg_21_0.actionTrigger.react or nil

			arg_21_0:triggerAction()
			arg_21_0:stopDrag()
		elseif arg_21_0.actionTrigger.action_list then
			local var_21_7 = arg_21_0.actionTrigger.action_list[arg_21_0.actionListIndex]

			var_21_1 = arg_21_0:fillterAction(var_21_7.action)

			if arg_21_0.actionTriggerActive.active_list and arg_21_0.actionListIndex <= #arg_21_0.actionTriggerActive.active_list then
				var_21_0 = arg_21_0.actionTriggerActive.active_list[arg_21_0.actionListIndex]
			else
				var_21_0 = arg_21_0.actionTriggerActive
			end

			var_21_2 = var_21_7.focus == 1 and true or false
			var_21_3 = var_21_7.target or nil
			var_21_6 = var_21_7.target_focus == 1 and true or false
			var_21_4 = var_21_7.react or nil

			if var_21_1 and #var_21_1 > 0 then
				arg_21_0:triggerAction()
			end

			if arg_21_0.actionListIndex == #arg_21_0.actionTrigger.action_list then
				arg_21_0:stopDrag()

				arg_21_0.actionListIndex = 1
			else
				arg_21_0.actionListIndex = arg_21_0.actionListIndex + 1
			end

			print("id = " .. arg_21_0.id .. " action list index = " .. arg_21_0.actionListIndex)
		elseif not arg_21_0.actionTrigger.action then
			var_21_1 = arg_21_0:fillterAction(arg_21_0.actionTrigger.action)
			var_21_0 = arg_21_0.actionTriggerActive
			var_21_2 = arg_21_0.actionTrigger.focus == 1 and true or false
			var_21_3 = arg_21_0.actionTrigger.target or nil
			var_21_6 = arg_21_0.actionTrigger.target_focus == 1 and true or false

			local var_21_8 = arg_21_0.actionTrigger.circle or nil

			var_21_4 = arg_21_0.actionTrigger.react or nil

			if var_21_8 and var_21_3 and var_21_3 == arg_21_0.parameterTargetValue then
				var_21_3 = arg_21_0.startValue
			end

			arg_21_0:triggerAction()
			arg_21_0:setTriggerActionFlag(false)
			arg_21_0:stopDrag()
		end

		if var_21_0.idle then
			if type(var_21_0.idle) == "number" then
				if var_21_0.idle == arg_21_0.l2dIdleIndex and not var_21_0.repeat_flag then
					return
				end
			elseif type(var_21_0.idle) == "table" and #var_21_0.idle == 1 and var_21_0.idle[1] == arg_21_0.l2dIdleIndex and not var_21_0.repeat_flag then
				return
			end
		end

		print("执行aplly数据 id = " .. arg_21_0.id .. "播放action = " .. tostring(var_21_1) .. " active idle is " .. tostring(var_21_0.idle))

		if var_21_3 then
			arg_21_0:setTargetValue(var_21_3)

			if var_21_6 then
				arg_21_0:setParameterValue(var_21_3)
			end

			if not var_21_1 then
				arg_21_0.revertResetFlag = true
			end
		end

		if var_21_2 then
			arg_21_0:setTriggerActionFlag(false)
		end

		arg_21_2 = {
			id = arg_21_0.id,
			action = var_21_1,
			activeData = var_21_0,
			focus = var_21_2,
			react = var_21_4,
			callback = arg_21_3,
			finishCall = function()
				arg_21_0:actionApplyFinish()
			end
		}
	elseif arg_21_1 == Live2D.EVENT_ACTION_ABLE then
		-- block empty
	elseif arg_21_1 == Live2D.EVENT_CHANGE_IDLE_INDEX then
		print("change idle")
	elseif arg_21_1 == Live2D.EVENT_GET_PARAMETER then
		arg_21_2.callback = arg_21_3
	elseif arg_21_1 == Live2D.EVENT_GET_DRAG_PARAMETER then
		arg_21_2.callback = arg_21_3
	elseif arg_21_1 == Live2D.EVENT_GET_WORLD_POSITION then
		arg_21_2.callback = arg_21_3
	end

	arg_21_0._eventCallback(arg_21_1, arg_21_2)
end

function var_0_0.fillterAction(arg_23_0, arg_23_1)
	if type(arg_23_1) == "table" then
		return arg_23_1[math.random(1, #arg_23_1)]
	else
		return arg_23_1
	end
end

function var_0_0.onEventNotice(arg_24_0, arg_24_1)
	if arg_24_0._eventCallback then
		local var_24_0 = arg_24_0:getCommonNoticeData()

		arg_24_0._eventCallback(arg_24_1, var_24_0)
	end
end

function var_0_0.getCommonNoticeData(arg_25_0)
	return {
		draw_able_name = arg_25_0.drawAbleName,
		parameter_name = arg_25_0.parameterName,
		parameter_target = arg_25_0.parameterTargetValue
	}
end

function var_0_0.setTargetValue(arg_26_0, arg_26_1)
	arg_26_0.parameterTargetValue = arg_26_1
end

function var_0_0.getParameter(arg_27_0)
	return arg_27_0.parameterValue
end

function var_0_0.getParameToTargetFlag(arg_28_0)
	if arg_28_0.parameterValue ~= arg_28_0.parameterTargetValue then
		return true
	end

	if arg_28_0.parameterToStart and arg_28_0.parameterToStart > 0 then
		return true
	end

	return false
end

function var_0_0.actionApplyFinish(arg_29_0)
	return
end

function var_0_0.stepParameter(arg_30_0, arg_30_1)
	arg_30_0:updateStepData(arg_30_1)
	arg_30_0:updateState()
	arg_30_0:updateTrigger()
	arg_30_0:updateParameterUpdateFlag()
	arg_30_0:updateGyro()
	arg_30_0:updateDrag()
	arg_30_0:updateCircleDrag()
	arg_30_0:updateReactValue()
	arg_30_0:updateParameterValue()
	arg_30_0:updateRelationValue()
	arg_30_0:checkReset()

	arg_30_0.loadL2dStep = false
end

function var_0_0.updateStepData(arg_31_0, arg_31_1)
	arg_31_0.reactPos = arg_31_1.reactPos
	arg_31_0.lastNormalTime = arg_31_0.normalTime
	arg_31_0.normalTime = arg_31_1.normalTime
	arg_31_0.stateInfo = arg_31_1.stateInfo
end

function var_0_0.updateParameterUpdateFlag(arg_32_0)
	if arg_32_0.actionTrigger.type == Live2D.DRAG_CLICK_ACTION then
		arg_32_0._parameterUpdateFlag = true
	elseif arg_32_0.actionTrigger.type == Live2D.DRAG_RELATION_IDLE then
		if not arg_32_0._parameterUpdateFlag then
			if not arg_32_0.l2dIsPlaying then
				arg_32_0._parameterUpdateFlag = true

				arg_32_0:changeParameComAble(true)
			elseif not table.contains(arg_32_0.actionTrigger.remove_com_list, arg_32_0.l2dPlayActionName) then
				arg_32_0._parameterUpdateFlag = true

				arg_32_0:changeParameComAble(true)
			end
		elseif arg_32_0._parameterUpdateFlag == true and arg_32_0.l2dIsPlaying and table.contains(arg_32_0.actionTrigger.remove_com_list, arg_32_0.l2dPlayActionName) then
			arg_32_0._parameterUpdateFlag = false

			arg_32_0:changeParameComAble(false)
		end
	elseif arg_32_0.actionTrigger.type == Live2D.DRAG_DOWN_TOUCH then
		arg_32_0._parameterUpdateFlag = true
	elseif arg_32_0.actionTrigger.type == Live2D.DRAG_LISTENER_EVENT then
		arg_32_0._parameterUpdateFlag = true
	elseif arg_32_0.actionTrigger.type == Live2D.DRAG_ANIMATION_PLAY then
		arg_32_0._parameterUpdateFlag = true
	elseif arg_32_0.actionTrigger.type == Live2D.DRAG_WITH_PARAMETER_MOVE then
		arg_32_0._parameterUpdateFlag = true
	else
		arg_32_0._parameterUpdateFlag = false
	end
end

function var_0_0.changeParameComAble(arg_33_0, arg_33_1)
	if arg_33_0.parameterComAdd == arg_33_1 then
		return
	end

	arg_33_0.parameterComAdd = arg_33_1

	if arg_33_1 then
		arg_33_0:onEventCallback(Live2D.EVENT_ADD_PARAMETER_COM, {
			com = arg_33_0._parameterCom,
			start = arg_33_0.startValue,
			mode = arg_33_0.mode
		})
	else
		arg_33_0:onEventCallback(Live2D.EVENT_REMOVE_PARAMETER_COM, {
			com = arg_33_0._parameterCom,
			mode = arg_33_0.mode
		})
	end
end

function var_0_0.updateDrag(arg_34_0)
	if not arg_34_0.offsetX and not arg_34_0.offsetY then
		return
	end

	local var_34_0

	if arg_34_0._active then
		local var_34_1 = Input.mousePosition

		if arg_34_0.offsetX and arg_34_0.offsetX ~= 0 then
			local var_34_2 = var_34_1.x - arg_34_0.mouseInputDown.x

			var_34_0 = arg_34_0.offsetDragTargetX + var_34_2 / arg_34_0.offsetX
			arg_34_0.offsetDragX = var_34_0
		end

		if arg_34_0.offsetY and arg_34_0.offsetY ~= 0 then
			local var_34_3 = var_34_1.y - arg_34_0.mouseInputDown.y

			var_34_0 = arg_34_0.offsetDragTargetY + var_34_3 / arg_34_0.offsetY
			arg_34_0.offsetDragY = var_34_0
		end

		if var_34_0 then
			arg_34_0:setTargetValue(arg_34_0:fixParameterTargetValue(var_34_0, arg_34_0.range, arg_34_0.rangeAbs, arg_34_0.dragDirect))
		end
	end

	arg_34_0._parameterUpdateFlag = true
end

function var_0_0.updateCircleDrag(arg_35_0)
	if not arg_35_0.offsetCirclePos then
		return
	end

	if arg_35_0._active and arg_35_0.mouseWorld ~= nil then
		if not arg_35_0.circleDragWorld then
			arg_35_0:onEventCallback(Live2D.EVENT_GET_WORLD_POSITION, {
				pos = arg_35_0.offsetCirclePos,
				name = arg_35_0.drawAbleName
			}, function(arg_36_0)
				arg_35_0.circleDragWorld = arg_36_0
			end)
		end

		local var_35_0 = (math.atan2(arg_35_0.mouseWorld.x - arg_35_0.circleDragWorld.x, arg_35_0.mouseWorld.y - arg_35_0.circleDragWorld.y) * math.rad2Deg + 360 - arg_35_0.offsetCircleStart) % 360 / 360
		local var_35_1 = arg_35_0.range[2] * var_35_0

		arg_35_0:setTargetValue(var_35_1)

		arg_35_0._parameterUpdateFlag = true
	elseif arg_35_0.parameterTargetValue ~= arg_35_0.parameterValue then
		arg_35_0._parameterUpdateFlag = true
	end
end

function var_0_0.updateGyro(arg_37_0)
	if not arg_37_0.gyro then
		return
	end

	if not Input.gyro.enabled then
		arg_37_0:setTargetValue(0)

		arg_37_0._parameterUpdateFlag = true

		return
	end

	local var_37_0 = Input.gyro and Input.gyro.attitude or Vector3.zero
	local var_37_1 = 0

	if arg_37_0.gyroX and not math.isnan(var_37_0.y) then
		var_37_1 = Mathf.Clamp(var_37_0.y * arg_37_0.sensitive, -0.5, 0.5)
	elseif arg_37_0.gyroY and not math.isnan(var_37_0.x) then
		var_37_1 = Mathf.Clamp(var_37_0.x * arg_37_0.sensitive, -0.5, 0.5)
	elseif arg_37_0.gyroZ and not math.isnan(var_37_0.z) then
		var_37_1 = Mathf.Clamp(var_37_0.z * arg_37_0.sensitive, -0.5, 0.5)
	end

	if IsUnityEditor then
		if L2D_USE_RANDOM_ATTI then
			if arg_37_0.randomAttitudeIndex == 0 then
				var_37_1 = math.random() - 0.5

				local var_37_2 = (var_37_1 + 0.5) * (arg_37_0.range[2] - arg_37_0.range[1]) + arg_37_0.range[1]

				arg_37_0:setTargetValue(var_37_2)

				arg_37_0.randomAttitudeIndex = L2D_RANDOM_PARAM
			elseif arg_37_0.randomAttitudeIndex > 0 then
				arg_37_0.randomAttitudeIndex = arg_37_0.randomAttitudeIndex - 1
			end
		end
	else
		local var_37_3 = (var_37_1 + 0.5) * (arg_37_0.range[2] - arg_37_0.range[1]) + arg_37_0.range[1]

		arg_37_0:setTargetValue(var_37_3)
	end

	arg_37_0._parameterUpdateFlag = true
end

function var_0_0.updateReactValue(arg_38_0)
	if not arg_38_0.reactX and not arg_38_0.reactY then
		return
	end

	local var_38_0
	local var_38_1 = false

	if arg_38_0.l2dIgnoreReact then
		var_38_0 = arg_38_0.parameterTargetValue
	elseif arg_38_0.reactX then
		var_38_0 = arg_38_0.reactPos.x * arg_38_0.reactX
		var_38_1 = true
	else
		var_38_0 = arg_38_0.reactPos.y * arg_38_0.reactY
		var_38_1 = true
	end

	if var_38_1 then
		arg_38_0:setTargetValue(arg_38_0:fixParameterTargetValue(var_38_0, arg_38_0.range, arg_38_0.rangeAbs, arg_38_0.dragDirect))
	end

	arg_38_0._parameterUpdateFlag = true
end

function var_0_0.updateParameterValue(arg_39_0)
	if arg_39_0.prepareTargetValue and not arg_39_0.l2dIsPlaying then
		arg_39_0:setTargetValue(arg_39_0.prepareTargetValue)

		arg_39_0.prepareTargetValue = nil
	end

	if arg_39_0._parameterUpdateFlag and arg_39_0.parameterValue ~= arg_39_0.parameterTargetValue then
		if math.abs(arg_39_0.parameterValue - arg_39_0.parameterTargetValue) < 0.01 then
			arg_39_0:setParameterValue(arg_39_0.parameterTargetValue)
		elseif arg_39_0.parameterSmoothTime and arg_39_0.parameterSmoothTime > 0 then
			local var_39_0 = arg_39_0.parameterValue
			local var_39_1 = arg_39_0.parameterTargetValue
			local var_39_2 = arg_39_0:checkUpdateParameterNum(var_39_1, var_39_0)
			local var_39_3, var_39_4 = Mathf.SmoothDamp(var_39_0, var_39_2, arg_39_0.parameterSmooth, arg_39_0.parameterSmoothTime)

			arg_39_0:setParameterValue(var_39_3, var_39_4)
		else
			arg_39_0:setParameterValue(arg_39_0.parameterTargetValue, 0)
		end
	end
end

function var_0_0.checkUpdateParameterNum(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_0.offsetCirclePos and math.abs(arg_40_1 - arg_40_2) >= arg_40_0.rangeOffset / 2 then
		if arg_40_2 < arg_40_1 then
			arg_40_1 = arg_40_1 - arg_40_0.rangeOffset
		else
			arg_40_1 = arg_40_1 + arg_40_0.rangeOffset
		end
	end

	return arg_40_1
end

function var_0_0.updateRelationValue(arg_41_0)
	for iter_41_0, iter_41_1 in ipairs(arg_41_0._relationParameterList) do
		local var_41_0 = iter_41_1.data
		local var_41_1 = var_41_0.type
		local var_41_2 = var_41_0.relation_value
		local var_41_3 = var_41_0.target
		local var_41_4
		local var_41_5

		if var_41_1 == Live2D.relation_type_drag_x then
			var_41_4 = arg_41_0.offsetDragX or iter_41_1.start or arg_41_0.startValue or 0
			var_41_5 = true
		elseif var_41_1 == Live2D.relation_type_drag_y then
			var_41_4 = arg_41_0.offsetDragY or iter_41_1.start or arg_41_0.startValue or 0
			var_41_5 = true
		elseif var_41_1 == Live2D.relation_type_action_index then
			var_41_4 = var_41_2[arg_41_0.actionListIndex]
			var_41_4 = var_41_4 or 0
			var_41_5 = true
		elseif var_41_1 == Live2D.relation_type_idle then
			if arg_41_0.loadL2dStep and arg_41_0.l2dIdleIndex == var_41_0.idle then
				var_41_5 = true
			end

			if arg_41_0.l2dIsPlaying then
				if arg_41_0.l2dPlayActionName == arg_41_0.actionTrigger.action then
					arg_41_0.relationActive = true
				end
			else
				arg_41_0.relationActive = false
				arg_41_0.relationCountTime = nil
			end

			if not var_41_5 and arg_41_0.relationActive and arg_41_0.l2dIdleIndex == var_41_0.idle then
				if not arg_41_0.relationCountTime then
					arg_41_0.relationCountTime = Time.GetTimestamp() + var_41_0.time
				end

				if arg_41_0.relationCountTime and Time.GetTimestamp() >= arg_41_0.relationCountTime then
					var_41_5 = true
				end
			end
		else
			var_41_4 = arg_41_0.parameterTargetValue
			var_41_5 = false
		end

		local var_41_6
		local var_41_7

		if var_41_3 then
			var_41_6 = var_41_3
		else
			local var_41_8 = arg_41_0:fixRelationParameter(var_41_4, var_41_0)
			local var_41_9 = iter_41_1.value or arg_41_0.startValue
			local var_41_10 = iter_41_1.parameterSmooth or 0
			local var_41_11 = var_41_0.smooth and var_41_0.smooth / 1000 or arg_41_0.smooth

			var_41_6, var_41_7 = Mathf.SmoothDamp(var_41_9, var_41_8, var_41_10, var_41_11)
		end

		iter_41_1.value = var_41_6
		iter_41_1.parameterSmooth = var_41_7
		iter_41_1.enable = var_41_5
		iter_41_1.comId = arg_41_0.id
	end
end

function var_0_0.fixRelationParameter(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_2.range or arg_42_0.range
	local var_42_1 = arg_42_2.rangeAbs and arg_42_2.rangeAbs == 1 or arg_42_0.rangeAbs
	local var_42_2 = arg_42_2.drag_direct and arg_42_2.drag_direct or arg_42_0.dragDirect

	return arg_42_0:fixParameterTargetValue(arg_42_1, var_42_0, var_42_1, var_42_2)
end

function var_0_0.fixParameterTargetValue(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4)
	if arg_43_1 < 0 and arg_43_4 == 1 then
		arg_43_1 = 0
	elseif arg_43_1 > 0 and arg_43_4 == 2 then
		arg_43_1 = 0
	end

	arg_43_1 = arg_43_3 and math.abs(arg_43_1) or arg_43_1

	if arg_43_1 < arg_43_2[1] then
		arg_43_1 = arg_43_2[1]
	elseif arg_43_1 > arg_43_2[2] then
		arg_43_1 = arg_43_2[2]
	end

	return arg_43_1
end

function var_0_0.checkReset(arg_44_0)
	if not arg_44_0._active and arg_44_0.parameterToStart then
		if arg_44_0.parameterToStart > 0 then
			arg_44_0.parameterToStart = arg_44_0.parameterToStart - Time.deltaTime
		end

		if arg_44_0.parameterToStart <= 0 then
			arg_44_0:setTargetValue(arg_44_0.startValue)

			arg_44_0.parameterToStart = nil

			if arg_44_0.revertResetFlag then
				arg_44_0:setTriggerActionFlag(false)

				arg_44_0.revertResetFlag = false
			end

			if arg_44_0.offsetDragX then
				arg_44_0.offsetDragX = arg_44_0.startValue
				arg_44_0.offsetDragTargetX = arg_44_0.startValue
			end

			if arg_44_0.offsetDragY then
				arg_44_0.offsetDragY = arg_44_0.startValue
				arg_44_0.offsetDragTargetY = arg_44_0.startValue
			end
		end
	end
end

function var_0_0.setParameterValue(arg_45_0, arg_45_1, arg_45_2)
	if arg_45_1 then
		arg_45_0.parameterValue = arg_45_1
	end

	if arg_45_2 then
		arg_45_0.parameterSmooth = arg_45_2
	end
end

function var_0_0.updateState(arg_46_0)
	if not arg_46_0.lastFrameActive and arg_46_0._active then
		arg_46_0.firstActive = true
	else
		arg_46_0.firstActive = false
	end

	if arg_46_0.lastFrameActive and not arg_46_0._active then
		arg_46_0.firstStop = true
	else
		arg_46_0.firstStop = false
	end

	arg_46_0.lastFrameActive = arg_46_0._active
end

function var_0_0.updateTrigger(arg_47_0)
	if not arg_47_0:isActionTriggerAble() then
		return
	end

	local var_47_0 = arg_47_0.actionTrigger.type
	local var_47_1 = arg_47_0.actionTrigger.action
	local var_47_2

	if arg_47_0.actionTrigger.time then
		var_47_2 = arg_47_0.actionTrigger.time
	elseif arg_47_0.actionTrigger.action_list and arg_47_0.actionListIndex > 0 then
		var_47_2 = arg_47_0.actionTrigger.action_list[arg_47_0.actionListIndex].time
	end

	local var_47_3

	if arg_47_0.actionTrigger.num then
		var_47_3 = arg_47_0.actionTrigger.num
	elseif arg_47_0.actionTrigger.action_list and arg_47_0.actionTrigger.action_list[arg_47_0.actionListIndex].num and arg_47_0.actionListIndex > 0 then
		var_47_3 = arg_47_0.actionTrigger.action_list[arg_47_0.actionListIndex].num
	end

	if var_47_0 == Live2D.DRAG_TIME_ACTION then
		if arg_47_0._active and math.abs(arg_47_0.parameterValue - var_47_3) < math.abs(var_47_3) * 0.25 then
			arg_47_0.triggerActionTime = arg_47_0.triggerActionTime + Time.deltaTime

			if var_47_2 < arg_47_0.triggerActionTime and not arg_47_0.l2dIsPlaying then
				arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_48_0)
					if arg_48_0 then
						arg_47_0:onEventNotice(Live2D.ON_ACTION_DRAG_TRIGGER)
					end
				end)
			end
		end
	elseif var_47_0 == Live2D.DRAG_CLICK_ACTION then
		if arg_47_0:checkClickAction() then
			arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_49_0)
				arg_47_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
			end)
		end
	elseif var_47_0 == Live2D.DRAG_CLICK_RANGE then
		if arg_47_0:checkClickAction() then
			local var_47_4 = arg_47_0.actionTrigger.parameter and arg_47_0.actionTrigger.parameter or arg_47_0.parameterName
			local var_47_5 = var_47_3

			arg_47_0:onEventCallback(Live2D.EVENT_GET_PARAMETER, {
				name = var_47_4
			}, function(arg_50_0)
				print("获取到数值 " .. var_47_4 .. " = " .. arg_50_0)

				if arg_50_0 >= var_47_5[1] and arg_50_0 < var_47_5[2] then
					print("数值范围内，开始触发")
					arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_51_0)
						arg_47_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
					end)
				end
			end)
		end
	elseif var_47_0 == Live2D.DRAG_DOWN_ACTION then
		if arg_47_0._active then
			arg_47_0:setAbleWithFlag(true)

			if var_47_2 <= Time.time - arg_47_0.mouseInputDownTime and not arg_47_0.l2dIsPlaying then
				print("触发按压动作")
				arg_47_0:setAbleWithFlag(false)
				arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_52_0)
					if arg_52_0 then
						arg_47_0:onEventNotice(Live2D.ON_ACTION_DOWN)
					end
				end)

				if arg_47_0.actionListIndex ~= 1 then
					arg_47_0:setTriggerActionFlag(false)
				end

				arg_47_0:setAbleWithFlag(true)

				arg_47_0.mouseInputDownTime = Time.time
			end
		elseif arg_47_0.actionTrigger.last and arg_47_0.actionListIndex ~= 1 then
			arg_47_0.actionListIndex = #arg_47_0.actionTrigger.action_list

			arg_47_0:setAbleWithFlag(false)
			arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_53_0)
				return
			end)
			arg_47_0:resetNextTriggerTime()
			arg_47_0:setTriggerActionFlag(false)
		else
			arg_47_0:setAbleWithFlag(false)
		end
	elseif var_47_0 == Live2D.DRAG_RELATION_XY then
		if arg_47_0._active then
			local var_47_6 = arg_47_0:fixParameterTargetValue(arg_47_0.offsetDragX, arg_47_0.range, arg_47_0.rangeAbs, arg_47_0.dragDirect)
			local var_47_7 = arg_47_0:fixParameterTargetValue(arg_47_0.offsetDragY, arg_47_0.range, arg_47_0.rangeAbs, arg_47_0.dragDirect)
			local var_47_8 = var_47_3[1]
			local var_47_9 = var_47_3[2]

			if math.abs(var_47_6 - var_47_8) < math.abs(var_47_8) * 0.25 and math.abs(var_47_7 - var_47_9) < math.abs(var_47_9) * 0.25 then
				arg_47_0.triggerActionTime = arg_47_0.triggerActionTime + Time.deltaTime

				if var_47_2 < arg_47_0.triggerActionTime and not arg_47_0.l2dIsPlaying then
					arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_54_0)
						if arg_54_0 then
							arg_47_0:onEventNotice(Live2D.ON_ACTION_XY_TRIGGER)
						end
					end)
				end
			else
				arg_47_0.triggerActionTime = arg_47_0.triggerActionTime + 0
			end
		end
	elseif var_47_0 == Live2D.DRAG_RELATION_IDLE then
		if arg_47_0.actionTrigger.const_fit then
			for iter_47_0 = 1, #arg_47_0.actionTrigger.const_fit do
				local var_47_10 = arg_47_0.actionTrigger.const_fit[iter_47_0]

				if arg_47_0.l2dIdleIndex == var_47_10.idle and not arg_47_0.l2dIsPlaying then
					arg_47_0:setTargetValue(var_47_10.target)
				end
			end
		end
	elseif var_47_0 == Live2D.DRAG_CLICK_MANY then
		if arg_47_0:checkClickAction() then
			arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
		end
	elseif var_47_0 == Live2D.DRAG_LISTENER_EVENT then
		if arg_47_0._listenerTrigger then
			arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
		end
	elseif var_47_0 == Live2D.DRAG_DOWN_TOUCH then
		arg_47_0:setAbleWithFlag(arg_47_0._active)

		if arg_47_0._active then
			local var_47_11 = Time.deltaTime / arg_47_0.actionTrigger.delta
			local var_47_12 = arg_47_0.parameterTargetValue + var_47_11
			local var_47_13 = arg_47_0:fixParameterTargetValue(var_47_12, arg_47_0.range, arg_47_0.rangeAbs, arg_47_0.dragDirect)

			arg_47_0:setTargetValue(var_47_13)
		end
	elseif var_47_0 == Live2D.DRAG_CLICK_PARAMETER then
		if arg_47_0:checkClickAction() then
			local var_47_14 = var_47_3
			local var_47_15 = arg_47_0.actionTrigger.parameter

			arg_47_0:onEventCallback(Live2D.EVENT_GET_PARAMETER, {
				name = var_47_15
			}, function(arg_55_0)
				if math.abs(var_47_14 - arg_55_0) <= 0.05 then
					print("数值允许播放，开始执行动作 " .. arg_47_0.actionTrigger.action)
					arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_56_0)
						arg_47_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
					end)
				end
			end)
		end
	elseif var_47_0 == Live2D.DRAG_ANIMATION_PLAY then
		local var_47_16 = arg_47_0.actionTrigger.trigger_name

		if arg_47_0.actionTrigger.trigger_index > 0 and arg_47_0.actionTrigger.trigger_name == "idle" then
			var_47_16 = var_47_16 .. arg_47_0.actionTrigger.trigger_index
		end

		if arg_47_0.stateInfo:IsName(var_47_16) and arg_47_0.l2dIdleIndex == arg_47_0.actionTrigger.trigger_index then
			local var_47_17 = false
			local var_47_18 = arg_47_0.actionTrigger.parameter_range

			if var_47_18 then
				local var_47_19 = var_47_18[1]
				local var_47_20 = var_47_18[2]

				arg_47_0:onEventCallback(Live2D.EVENT_GET_PARAMETER, {
					name = var_47_19
				}, function(arg_57_0)
					if arg_57_0 and arg_57_0 >= var_47_20[1] and arg_57_0 < var_47_20[2] then
						var_47_17 = true
					end
				end)
			else
				var_47_17 = true
			end

			if var_47_17 and arg_47_0.normalTime >= arg_47_0.actionTrigger.trigger_rate and not arg_47_0.animationPlayApply then
				arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function()
					return
				end)
				arg_47_0:setTriggerActionFlag(false)

				arg_47_0.animationPlayApply = true
			end
		elseif arg_47_0.animationPlayApply then
			arg_47_0.animationPlayApply = false
		end
	elseif var_47_0 == Live2D.DRAG_EXTEND_ACTION_RULE then
		if not arg_47_0.extendActionFlag then
			arg_47_0.extendActionFlag = true
		end
	elseif var_47_0 == Live2D.DRAG_WITH_PARAMETER_MOVE and not arg_47_0.l2dIsPlaying then
		local var_47_21
		local var_47_22

		if var_47_3 then
			var_47_21 = var_47_3 and math.abs(arg_47_0.parameterValue - var_47_3) or 0
			var_47_22 = math.abs(var_47_3) * 0.1
		end

		if var_47_3 and var_47_21 <= var_47_22 and not arg_47_0.parameterMoveTrigger then
			arg_47_0.parameterMoveTrigger = true

			arg_47_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_59_0)
				return
			end)
		else
			if not arg_47_0.moveCheckStep then
				arg_47_0.moveCheckStep = 10
			end

			if arg_47_0.parameterMoveTrigger then
				arg_47_0.parameterMoveTrigger = false

				arg_47_0:setParameterValue(arg_47_0.startValue)
				arg_47_0:setTargetValue(arg_47_0.startValue)
			end

			arg_47_0.moveCheckStep = arg_47_0.moveCheckStep - 1

			if arg_47_0.moveCheckStep <= 0 then
				arg_47_0.moveCheckStep = 10

				local var_47_23 = arg_47_0.actionTrigger.parameter

				arg_47_0.lastParameterMove = arg_47_0.parameterMove

				arg_47_0:onEventCallback(Live2D.EVENT_GET_PARAMETER, {
					name = var_47_23
				}, function(arg_60_0)
					arg_47_0.parameterMove = arg_60_0
				end)

				if arg_47_0.lastParameterMove and arg_47_0.parameterMove then
					local var_47_24 = math.abs(arg_47_0.parameterMove - arg_47_0.lastParameterMove)

					if var_47_24 ~= 0 then
						local var_47_25 = arg_47_0.actionTrigger.rate and arg_47_0.actionTrigger.rate or 0
						local var_47_26 = arg_47_0.parameterTargetValue + var_47_24 * var_47_25

						arg_47_0:setTargetValue(arg_47_0:fixParameterTargetValue(var_47_26, arg_47_0.range, arg_47_0.rangeAbs, arg_47_0.dragDirect))
						print("检测数值发生改变 = " .. arg_47_0.parameterTargetValue)
					end
				end
			end
		end
	end
end

function var_0_0.getExtendAction(arg_61_0)
	return arg_61_0.extendActionFlag
end

function var_0_0.checkActionInExtendFlag(arg_62_0, arg_62_1)
	local var_62_0 = false
	local var_62_1 = false

	if not arg_62_0.extendActionFlag then
		return var_62_0, var_62_1
	end

	local var_62_2 = arg_62_0.actionTrigger.parameter
	local var_62_3 = arg_62_0.actionTrigger.num
	local var_62_4 = false

	arg_62_0:onEventCallback(Live2D.EVENT_GET_DRAG_PARAMETER, {
		name = var_62_2
	}, function(arg_63_0)
		if arg_63_0 > var_62_3[1] and arg_63_0 <= var_62_3[2] then
			var_62_4 = true
		end
	end)

	if not var_62_4 then
		return var_62_0, var_62_0
	end

	local var_62_5 = arg_62_0.actionTriggerActive.ignore
	local var_62_6 = arg_62_0.actionTriggerActive.enable

	if var_62_5 and table.contains(var_62_5, arg_62_1) then
		var_62_0 = true
	end

	if var_62_6 and table.contains(var_62_6, arg_62_1) then
		var_62_1 = true
	end

	return var_62_0, var_62_1
end

function var_0_0.setAbleWithFlag(arg_64_0, arg_64_1)
	if arg_64_0.ableFlag ~= arg_64_1 then
		arg_64_0.ableFlag = arg_64_1

		arg_64_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
			ableFlag = arg_64_1
		})
	end
end

function var_0_0.triggerAction(arg_65_0)
	arg_65_0.nextTriggerTime = arg_65_0.limitTime

	arg_65_0:setTriggerActionFlag(true)
end

function var_0_0.isActionTriggerAble(arg_66_0)
	if arg_66_0.actionTrigger.type == nil then
		return false
	end

	if not arg_66_0.actionTrigger or arg_66_0.actionTrigger == "" then
		return false
	end

	if arg_66_0.nextTriggerTime - Time.deltaTime >= 0 then
		arg_66_0.nextTriggerTime = arg_66_0.nextTriggerTime - Time.deltaTime

		return false
	end

	if arg_66_0.isTriggerAtion then
		return false
	end

	return true
end

function var_0_0.updateStateData(arg_67_0, arg_67_1)
	if arg_67_0.l2dIdleIndex ~= arg_67_1.idleIndex then
		if type(arg_67_0.revertIdleIndex) == "boolean" and arg_67_0.revertIdleIndex == true then
			arg_67_0:setTargetValue(arg_67_0.startValue)
		elseif type(arg_67_0.revertIdleIndex) == "table" and table.contains(arg_67_0.revertIdleIndex, arg_67_1.idleIndex) then
			arg_67_0:setTargetValue(arg_67_0.startValue)
		end
	end

	arg_67_0.lastActionIndex = arg_67_0.actionListIndex

	if arg_67_1.isPlaying and arg_67_0.actionTrigger.reset_index_action and arg_67_1.actionName and table.contains(arg_67_0.actionTrigger.reset_index_action, arg_67_1.actionName) then
		arg_67_0.actionListIndex = 1
	end

	if arg_67_0.revertActionIndex and arg_67_0.lastActionIndex ~= arg_67_0.actionListIndex then
		arg_67_0:setTargetValue(arg_67_0.startValue)
	end

	arg_67_0.l2dIdleIndex = arg_67_1.idleIndex
	arg_67_0.l2dIsPlaying = arg_67_1.isPlaying
	arg_67_0.l2dIgnoreReact = arg_67_1.ignoreReact
	arg_67_0.l2dPlayActionName = arg_67_1.actionName

	if not arg_67_0.l2dIsPlaying and arg_67_0.isTriggerAtion then
		arg_67_0:setTriggerActionFlag(false)
	end

	if arg_67_0.l2dIdleIndex and arg_67_0.idleOn and #arg_67_0.idleOn > 0 then
		arg_67_0.reactConditionFlag = not table.contains(arg_67_0.idleOn, arg_67_0.l2dIdleIndex)
	end

	if arg_67_0.l2dIdleIndex and arg_67_0.idleOff and #arg_67_0.idleOff > 0 then
		arg_67_0.reactConditionFlag = table.contains(arg_67_0.idleOff, arg_67_0.l2dIdleIndex)
	end
end

function var_0_0.checkClickAction(arg_68_0)
	if arg_68_0.firstActive then
		if arg_68_0.actionTrigger.down then
			if arg_68_0.actionTrigger.focus == 1 and arg_68_0.l2dIsPlaying then
				return true
			elseif not arg_68_0.l2dIsPlaying then
				return true
			end
		else
			arg_68_0:setAbleWithFlag(true)
		end
	elseif arg_68_0.firstStop then
		local var_68_0 = math.abs(arg_68_0.mouseInputUp.x - arg_68_0.mouseInputDown.x) < 30 and math.abs(arg_68_0.mouseInputUp.y - arg_68_0.mouseInputDown.y) < 30
		local var_68_1 = arg_68_0.mouseInputUpTime - arg_68_0.mouseInputDownTime < 0.5

		if not arg_68_0.actionTrigger.down and var_68_0 and var_68_1 then
			if arg_68_0.actionTrigger.focus == 1 and arg_68_0.l2dIsPlaying then
				if arg_68_0.l2dPlayActionName == arg_68_0.actionTrigger.action then
					arg_68_0.clickTriggerTime = 0.01
					arg_68_0.clickApplyFlag = true
				end
			elseif not arg_68_0.l2dIsPlaying then
				arg_68_0.clickTriggerTime = 0.01
				arg_68_0.clickApplyFlag = true
			end
		else
			arg_68_0:setAbleWithFlag(false)
		end
	elseif arg_68_0.clickTriggerTime and arg_68_0.clickTriggerTime > 0 then
		arg_68_0.clickTriggerTime = arg_68_0.clickTriggerTime - Time.deltaTime

		if arg_68_0.clickTriggerTime <= 0 then
			arg_68_0.clickTriggerTime = nil

			arg_68_0:setAbleWithFlag(false)

			if arg_68_0.clickApplyFlag then
				arg_68_0.clickApplyFlag = false

				return true
			end
		end
	end

	return false
end

function var_0_0.saveData(arg_69_0)
	local var_69_0 = arg_69_0.id
	local var_69_1 = arg_69_0.live2dData:GetShipSkinConfig().id
	local var_69_2 = arg_69_0.live2dData.ship.id

	if arg_69_0.revert == -1 and arg_69_0.saveParameterFlag then
		Live2dConst.SaveDragData(var_69_0, var_69_1, var_69_2, arg_69_0.parameterTargetValue)
	end

	if arg_69_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		print("保存actionListIndex" .. arg_69_0.actionListIndex)
		Live2dConst.SetDragActionIndex(var_69_0, var_69_1, var_69_2, arg_69_0.actionListIndex)
	end

	if arg_69_0._relationFlag then
		Live2dConst.SetRelationData(var_69_0, var_69_1, var_69_2, arg_69_0:getRelationSaveData())
	end
end

function var_0_0.loadData(arg_70_0)
	local var_70_0 = arg_70_0.id
	local var_70_1 = arg_70_0.live2dData:GetShipSkinConfig().id
	local var_70_2 = arg_70_0.live2dData.ship.id

	if arg_70_0.revert == -1 and arg_70_0.saveParameterFlag then
		local var_70_3 = Live2dConst.GetDragData(arg_70_0.id, arg_70_0.live2dData:GetShipSkinConfig().id, arg_70_0.live2dData.ship.id)

		if var_70_3 then
			arg_70_0:setParameterValue(var_70_3)
			arg_70_0:setTargetValue(var_70_3)
		end

		if var_70_3 == arg_70_0.startValue and arg_70_0._relationParameterList and #arg_70_0._relationParameterList > 0 then
			arg_70_0:clearRelationValue()
		end
	end

	if arg_70_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		arg_70_0.actionListIndex = Live2dConst.GetDragActionIndex(arg_70_0.id, arg_70_0.live2dData:GetShipSkinConfig().id, arg_70_0.live2dData.ship.id) or 1
	end

	if arg_70_0._relationFlag then
		local var_70_4 = Live2dConst.GetRelationData(var_70_0, var_70_1, var_70_2)

		arg_70_0.offsetDragX = var_70_4.drag_x and var_70_4.drag_x or arg_70_0.startValue
		arg_70_0.offsetDragY = var_70_4.drag_y and var_70_4.drag_y or arg_70_0.startValue
	end
end

function var_0_0.getRelationSaveData(arg_71_0)
	return {
		[Live2dConst.RELATION_DRAG_X] = arg_71_0.offsetDragX,
		[Live2dConst.RELATION_DRAG_Y] = arg_71_0.offsetDragY
	}
end

function var_0_0.clearRelationValue(arg_72_0)
	if arg_72_0._relationParameterList and #arg_72_0._relationParameterList > 0 then
		for iter_72_0 = 1, #arg_72_0._relationParameterList do
			local var_72_0 = arg_72_0._relationParameterList[iter_72_0]

			if var_72_0.data.type == Live2D.relation_type_drag_x or var_72_0.data.type == Live2D.relation_type_drag_y then
				var_72_0.value = var_72_0.start or arg_72_0.startValue or 0
				var_72_0.enable = true
			end

			arg_72_0.offsetDragX, arg_72_0.offsetDragY = arg_72_0.startValue, arg_72_0.startValue
		end
	end
end

function var_0_0.loadL2dFinal(arg_73_0)
	arg_73_0.loadL2dStep = true
end

function var_0_0.clearData(arg_74_0)
	if arg_74_0.revert == -1 then
		arg_74_0.actionListIndex = 1

		arg_74_0:setParameterValue(arg_74_0.startValue)
		arg_74_0:setTargetValue(arg_74_0.startValue)
		arg_74_0:clearRelationValue()
	end
end

function var_0_0.setTriggerActionFlag(arg_75_0, arg_75_1)
	arg_75_0.isTriggerAtion = arg_75_1
end

function var_0_0.dispose(arg_76_0)
	arg_76_0._active = false
	arg_76_0._parameterCom = nil
	arg_76_0.parameterValue = arg_76_0.startValue
	arg_76_0.parameterTargetValue = 0
	arg_76_0.parameterSmooth = 0
	arg_76_0.mouseInputDown = Vector2(0, 0)
	arg_76_0.live2dData = nil
end

return var_0_0

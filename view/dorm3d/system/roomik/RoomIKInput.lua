local var_0_0 = class("RoomIKInput")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.system = arg_1_1
	arg_1_0.controlTouchPressTarget = nil
	arg_1_0.controlDragIsIK = nil
end

function var_0_0.GetSession(arg_2_0)
	return arg_2_0.system and arg_2_0.system:GetSession()
end

function var_0_0.CanHandleInput(arg_3_0)
	return arg_3_0.system and arg_3_0.system:CanHandleIKInput()
end

function var_0_0.OnControlPointerDown(arg_4_0, arg_4_1)
	if not arg_4_0:CanHandleInput() then
		return
	end

	arg_4_0.controlTouchPressTarget = nil

	local var_4_0 = arg_4_0:ResolveTouchTarget(arg_4_1)

	if not var_4_0 then
		return
	end

	arg_4_0.controlTouchPressTarget = var_4_0

	arg_4_0:EmitTouchPress(true, var_4_0, arg_4_1)
end

function var_0_0.OnControlPointerUp(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.controlTouchPressTarget

	arg_5_0.controlTouchPressTarget = nil

	if not var_5_0 then
		return
	end

	arg_5_0:EmitTouchPress(false, var_5_0, arg_5_1)
end

function var_0_0.OnControlBeginDrag(arg_6_0, arg_6_1)
	if not arg_6_0:CanHandleInput() then
		return
	end

	arg_6_0.controlDragIsIK = nil

	local var_6_0 = arg_6_0:ResolveBodyTarget(arg_6_1)

	if not var_6_0 then
		return
	end

	local var_6_1 = arg_6_0:GetSession()

	if var_6_1:IsBlocked() or var_6_1.ikHandler then
		return
	end

	arg_6_0.system:BeginIKBodyDrag(var_6_0, arg_6_1)

	arg_6_0.controlDragIsIK = tobool(var_6_1.ikHandler)
end

function var_0_0.OnControlDrag(arg_7_0, arg_7_1, arg_7_2)
	if not arg_7_0:CanHandleInput() then
		return
	end

	if arg_7_0:GetSession().ikHandler then
		arg_7_0.system:DragIKBody(arg_7_1)

		return
	end

	if arg_7_0.controlDragIsIK then
		return
	end

	arg_7_0.system:Emit(Dorm3dRoomTemplateScene.ON_STICK_MOVE, arg_7_2)
end

function var_0_0.OnControlEndDrag(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:GetSession()
	local var_8_1 = var_8_0 and var_8_0.ikHandler or arg_8_0.controlDragIsIK

	arg_8_0.controlDragIsIK = nil

	if var_8_1 then
		arg_8_0.system:ReleaseIKBody()
	end
end

function var_0_0.Cancel(arg_9_0)
	arg_9_0.controlTouchPressTarget = nil
	arg_9_0.controlDragIsIK = nil

	if arg_9_0.system then
		arg_9_0.system:ReleaseIKBody()
	end
end

function var_0_0.Dispose(arg_10_0)
	arg_10_0:Cancel()

	arg_10_0.system = nil
end

function var_0_0.GetIKRaycastTargets(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:GetSession()
	local var_11_1 = var_11_0 and var_11_0.ikSettings

	if not var_11_1 or not var_11_1.CameraRaycaster then
		return {}
	end

	local var_11_2 = CameraMgr.instance:Raycast(var_11_1.CameraRaycaster, arg_11_1)

	return var_11_2 and var_11_2:ToTable() or {}
end

function var_0_0.ResolveBodyTarget(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:GetSession()
	local var_12_1 = var_12_0 and var_12_0.ikSettings

	if not var_12_1 then
		return
	end

	for iter_12_0, iter_12_1 in ipairs(arg_12_0:GetIKRaycastTargets(arg_12_1)) do
		local var_12_2 = iter_12_1.gameObject.transform
		local var_12_3 = table.keyof(var_12_1.Colliders or {}, var_12_2)

		if var_12_3 then
			return var_12_3
		end
	end
end

function var_0_0.ResolveTouchTarget(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:GetSession()

	if not var_13_0 or not var_13_0.ikSettings then
		return
	end

	for iter_13_0, iter_13_1 in ipairs(arg_13_0:GetIKRaycastTargets(arg_13_1)) do
		local var_13_1 = iter_13_1.gameObject.transform
		local var_13_2 = table.keyof(var_13_0.ikSettings.Colliders or {}, var_13_1)

		if var_13_2 then
			return {
				source = "body",
				target = var_13_2
			}
		end

		local var_13_3 = arg_13_0:ResolveTouchSceneItem(var_13_1)

		if var_13_3 then
			return {
				source = "scene_item",
				target = var_13_3
			}
		end
	end
end

function var_0_0.ResolveTouchSceneItem(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetSession()

	if not var_14_0 or not var_14_0.ikTouchDatas then
		return
	end

	for iter_14_0, iter_14_1 in ipairs(var_14_0.ikTouchDatas) do
		local var_14_1 = pg.dorm3d_ik_touch[iter_14_1[1]]

		if #var_14_1.scene_item > 0 then
			local var_14_2 = arg_14_0.system:GetSceneItem(var_14_1.scene_item)

			if var_14_2 and var_0_0.IsTransformInHierarchy(arg_14_1, var_14_2) then
				return var_14_1.scene_item
			end
		end
	end
end

function var_0_0.IsTransformInHierarchy(arg_15_0, arg_15_1)
	while arg_15_0 do
		if arg_15_0 == arg_15_1 then
			return true
		end

		arg_15_0 = arg_15_0.parent
	end

	return false
end

function var_0_0.EmitTouchPress(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_2.source == "body" then
		arg_16_0.system:Emit(arg_16_1 and RoomTouchSystem.ON_TOUCH_CHARACTER_DOWN or RoomTouchSystem.ON_TOUCH_CHARACTER_UP, arg_16_2.target, arg_16_3)
	elseif arg_16_2.source == "scene_item" then
		arg_16_0.system:Emit(arg_16_1 and RoomTouchSystem.ON_TOUCH_SCENE_ITEM_DOWN or RoomTouchSystem.ON_TOUCH_SCENE_ITEM_UP, arg_16_2.target, arg_16_3)
	end
end

return var_0_0

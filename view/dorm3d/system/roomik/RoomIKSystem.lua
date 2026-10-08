local var_0_0 = class("RoomIKSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.ENTER_IK = "RoomIKSystem.ENTER_IK"
var_0_0.REPLACE_IK_STATUS = "RoomIKSystem.REPLACE_IK_STATUS"
var_0_0.EXIT_IK_WITH_RETURN = "RoomIKSystem.EXIT_IK_WITH_RETURN"
var_0_0.ENTER_STOCKING_IK_MODE = "RoomIKSystem.ENTER_STOCKING_IK_MODE"
var_0_0.EXIT_STOCKING_IK_MODE = "RoomIKSystem.EXIT_STOCKING_IK_MODE"
var_0_0.ON_CONTROL_POINTER_DOWN = "RoomIKSystem.ON_CONTROL_POINTER_DOWN"
var_0_0.ON_CONTROL_POINTER_UP = "RoomIKSystem.ON_CONTROL_POINTER_UP"
var_0_0.ON_CONTROL_BEGIN_DRAG = "RoomIKSystem.ON_CONTROL_BEGIN_DRAG"
var_0_0.ON_CONTROL_DRAG = "RoomIKSystem.ON_CONTROL_DRAG"
var_0_0.ON_CONTROL_END_DRAG = "RoomIKSystem.ON_CONTROL_END_DRAG"
var_0_0.ON_IK_STATUS_CHANGED = "RoomIKSystem.ON_IK_STATUS_CHANGED"
var_0_0.ON_IK_LAYER_ACTION = "RoomIKSystem.ON_IK_LAYER_ACTION"
var_0_0.SET_IK_TIMELINE_STATUS = "RoomIKSystem.SET_IK_TIMELINE_STATUS"
var_0_0.EXIT_IK_TIMELINE_STATUS = "RoomIKSystem.EXIT_IK_TIMELINE_STATUS"
var_0_0.CYCLE_IK_CAMERA_GROUP = "RoomIKSystem.CYCLE_IK_CAMERA_GROUP"
var_0_0.SET_IK_SPECIAL_CALL = "RoomIKSystem.SET_IK_SPECIAL_CALL"
var_0_0.CONSUME_IK_SPECIAL_CALL = "RoomIKSystem.CONSUME_IK_SPECIAL_CALL"
var_0_0.GET_IK_BLOCK = "RoomIKSystem.GET_IK_BLOCK"
var_0_0.SET_IK_BLOCK = "RoomIKSystem.SET_IK_BLOCK"
var_0_0.RESET_IK_TIP_TIMER = "RoomIKSystem.RESET_IK_TIP_TIMER"
var_0_0.SET_IK_SWITCH_SKIN_ID = "RoomIKSystem.SET_IK_SWITCH_SKIN_ID"
var_0_0.SWITCH_IK_SKIN = "RoomIKSystem.SWITCH_IK_SKIN"
var_0_0.PLAY_TOUCH_IK_MOVE = "RoomIKSystem.PLAY_TOUCH_IK_MOVE"
var_0_0.IK_STATUS_DELTA = 0.5
var_0_0.IK_TIP_WAIT_TIME = 5
var_0_0.IK_STATUS = {
	RELEASE = 3,
	BEGIN = 1,
	TRIGGER = 4,
	DRAG = 2
}
var_0_0.MODE_STATE = {
	IDLE = "idle",
	REPLACING = "replacing",
	ENTERING = "entering",
	EXITING = "exiting",
	ACTIVE = "active"
}

function var_0_0.OnInit(arg_1_0)
	arg_1_0.modeState = var_0_0.MODE_STATE.IDLE
	arg_1_0.transitionSerial = 0
	arg_1_0.pendingExitCallbacks = {}
	arg_1_0.session = RoomIKSession.New()
	arg_1_0.sessionBuilder = RoomIKSessionBuilder.New(arg_1_0)
	arg_1_0.driver = RoomIKDriver.New()
	arg_1_0.input = RoomIKInput.New(arg_1_0)
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.ENTER_IK, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_2_0:EnterIK(arg_3_1, arg_3_2, arg_3_3)
	end)
	arg_2_0:Bind(var_0_0.REPLACE_IK_STATUS, function(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
		arg_2_0:ReplaceIKStatus(arg_4_1, arg_4_2, arg_4_3)
	end)
	arg_2_0:Bind(var_0_0.EXIT_IK_WITH_RETURN, function(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
		arg_2_0:ExitIKWithReturn(arg_5_1, arg_5_2, arg_5_3)
	end)
	arg_2_0:Bind(var_0_0.ENTER_STOCKING_IK_MODE, function(arg_6_0, arg_6_1)
		arg_2_0:EnterStockingIKMode(arg_6_1)
	end)
	arg_2_0:Bind(var_0_0.EXIT_STOCKING_IK_MODE, function(arg_7_0, arg_7_1)
		arg_2_0:ExitStockingIKMode(arg_7_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_POINTER_DOWN, function(arg_8_0, arg_8_1)
		arg_2_0.input:OnControlPointerDown(arg_8_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_POINTER_UP, function(arg_9_0, arg_9_1)
		arg_2_0.input:OnControlPointerUp(arg_9_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_BEGIN_DRAG, function(arg_10_0, arg_10_1)
		arg_2_0.input:OnControlBeginDrag(arg_10_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_DRAG, function(arg_11_0, arg_11_1, arg_11_2)
		arg_2_0.input:OnControlDrag(arg_11_1, arg_11_2)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_END_DRAG, function(arg_12_0, arg_12_1)
		arg_2_0.input:OnControlEndDrag(arg_12_1)
	end)
	arg_2_0:Bind(var_0_0.SET_IK_TIMELINE_STATUS, function(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
		arg_2_0:SetIKTimelineStatus(arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	end)
	arg_2_0:Bind(var_0_0.EXIT_IK_TIMELINE_STATUS, function(arg_14_0, arg_14_1)
		arg_2_0:ExitIKTimelineStatus(arg_14_1)
	end)
	arg_2_0:Bind(var_0_0.CYCLE_IK_CAMERA_GROUP, function()
		arg_2_0:CycleIKCameraGroup()
	end)
	arg_2_0:Bind(var_0_0.SET_IK_SPECIAL_CALL, function(arg_16_0, arg_16_1)
		arg_2_0.session.ikSpecialCall = arg_16_1
	end)
	arg_2_0:Bind(var_0_0.CONSUME_IK_SPECIAL_CALL, function(arg_17_0, arg_17_1)
		local var_17_0 = arg_2_0:ConsumeIKSpecialCall()

		if arg_17_1 then
			arg_17_1.consumed = var_17_0
		end
	end)
	arg_2_0:Bind(var_0_0.GET_IK_BLOCK, function(arg_18_0, arg_18_1)
		if arg_18_1 then
			arg_18_1.blockIK = arg_2_0.session:IsBlocked()
		end
	end)
	arg_2_0:Bind(var_0_0.SET_IK_BLOCK, function(arg_19_0, arg_19_1)
		arg_2_0.session:SetLegacyBlock(arg_19_1)
	end)
	arg_2_0:Bind(var_0_0.RESET_IK_TIP_TIMER, function()
		arg_2_0:ResetIKTipTimer()
	end)
	arg_2_0:Bind(var_0_0.SET_IK_SWITCH_SKIN_ID, function(arg_21_0, arg_21_1)
		arg_2_0:SetIKSwitchSkinId(arg_21_1)
	end)
	arg_2_0:Bind(var_0_0.SWITCH_IK_SKIN, function(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
		arg_2_0:SwitchIKSkin(arg_22_1, arg_22_2, arg_22_3)
	end)
	arg_2_0:Bind(var_0_0.PLAY_TOUCH_IK_MOVE, function(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4, arg_23_5)
		arg_2_0:PlayTouchIKMove(arg_23_1, arg_23_2, arg_23_3, arg_23_4, arg_23_5)
	end)
end

function var_0_0.OnUpdate(arg_24_0)
	arg_24_0:UpdateIKTarget()
end

function var_0_0.OnDispose(arg_25_0)
	arg_25_0.transitionSerial = arg_25_0.transitionSerial + 1

	local var_25_0 = arg_25_0:GetCurrentLadyEnv()

	if arg_25_0:IsInIKTimelineMode() then
		arg_25_0:ClearIKTimelineRuntime()
	elseif arg_25_0.session.active and var_25_0 then
		arg_25_0:ClearIKStatusRuntime(var_25_0)
	else
		arg_25_0:RestoreIKTimelineColliders()
		arg_25_0:CancelControlInput()
		arg_25_0.driver:Detach()
	end

	arg_25_0:ReleaseIKBlock()

	arg_25_0.modeState = var_0_0.MODE_STATE.IDLE

	if arg_25_0.input then
		arg_25_0.input:Dispose()

		arg_25_0.input = nil
	end

	arg_25_0.pendingExitCallbacks = {}

	arg_25_0.session:Invalidate()
end

function var_0_0.WrapCallbackOnce(arg_26_0, arg_26_1)
	if not arg_26_1 then
		return nil
	end

	local var_26_0 = false

	return function(...)
		if var_26_0 then
			return
		end

		var_26_0 = true

		existCall(arg_26_1, ...)
	end
end

function var_0_0.FlushExitCallbacks(arg_28_0, arg_28_1)
	existCall(arg_28_1)

	local var_28_0 = arg_28_0.pendingExitCallbacks

	arg_28_0.pendingExitCallbacks = {}

	for iter_28_0, iter_28_1 in ipairs(var_28_0) do
		existCall(iter_28_1)
	end
end

function var_0_0.ResolveIKConfig(arg_29_0, arg_29_1, arg_29_2)
	warning("switchIkstatus", arg_29_2)

	local var_29_0 = pg.dorm3d_ik_status[arg_29_2]

	assert(var_29_0, "Missing dorm3d_ik_status config: " .. tostring(arg_29_2))

	local function var_29_1()
		if var_29_0.skin_id ~= arg_29_1.skinId then
			local var_30_0 = pg.dorm3d_ik_status.get_id_list_by_base[var_29_0.base]
			local var_30_1 = _.detect(var_30_0, function(arg_31_0)
				return pg.dorm3d_ik_status[arg_31_0].skin_id == arg_29_1.skinId
			end)

			assert(var_30_1, string.format("Missing Status Config By Skin: %s original Status: %s", arg_29_1.skinId, arg_29_2))

			var_29_0 = pg.dorm3d_ik_status[var_30_1]
		end
	end

	if type(var_29_0.skin_id) == "table" then
		if not table.contains(var_29_0.skin_id, arg_29_1.skinId) then
			var_29_1()
		end
	else
		var_29_1()
	end

	return var_29_0
end

function var_0_0.BeginIKTransition(arg_32_0, arg_32_1)
	arg_32_0.transitionSerial = arg_32_0.transitionSerial + 1
	arg_32_0.modeState = arg_32_1

	return arg_32_0.transitionSerial
end

function var_0_0.IsIKTransitionActive(arg_33_0, arg_33_1, arg_33_2)
	return arg_33_0.transitionSerial == arg_33_1 and arg_33_0.modeState == arg_33_2
end

function var_0_0.AcquireIKBlock(arg_34_0)
	if arg_34_0.session.uiBlockHeld then
		return
	end

	arg_34_0.session.uiBlockHeld = true

	arg_34_0:Emit(Dorm3dRoomTemplateScene.SHOW_BLOCK)
end

function var_0_0.ReleaseIKBlock(arg_35_0)
	if not arg_35_0.session.uiBlockHeld then
		return
	end

	arg_35_0.session.uiBlockHeld = false

	arg_35_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)
end

function var_0_0.RunIKStatusTransition(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7)
	arg_36_6 = arg_36_6 or {}
	arg_36_5 = arg_36_0:WrapCallbackOnce(arg_36_5)

	local var_36_0 = {}

	table.insert(var_36_0, function(arg_37_0)
		if not arg_36_0:IsIKTransitionActive(arg_36_4, arg_36_3) then
			return
		end

		arg_36_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_BLACKBOARD_VALUE, arg_36_1, "inIK", true)
		arg_36_0:AcquireIKBlock()

		local var_37_0 = arg_36_2.camera_group

		arg_36_0:Emit(Dorm3dIKView.SET_CAMERA_BUTTON_ACTIVE, #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_37_0] > 1)
		arg_36_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, true)
		arg_37_0()
	end)

	if arg_36_0:GetUIState() ~= "ik" then
		table.insert(var_36_0, function(arg_38_0)
			if not arg_36_0:IsIKTransitionActive(arg_36_4, arg_36_3) then
				return
			end

			arg_36_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, arg_38_0, "ik")
		end)
	end

	table.insert(var_36_0, function(arg_39_0)
		if not arg_36_0:IsIKTransitionActive(arg_36_4, arg_36_3) then
			return
		end

		if arg_36_3 == var_0_0.MODE_STATE.REPLACING then
			arg_36_0:ClearIKStatusRuntime(arg_36_1, arg_36_6)

			arg_36_0.session.currentIkConfig = arg_36_2
		end

		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_36_0:SetIKStatus(arg_36_1, arg_36_2, arg_39_0, arg_36_6, arg_36_4, arg_36_3, arg_36_7)
	end)
	table.insert(var_36_0, function(arg_40_0)
		if not arg_36_0:IsIKTransitionActive(arg_36_4, arg_36_3) then
			return
		end

		arg_36_0:ReleaseIKBlock()
		arg_40_0()
	end)
	seriesAsync(var_36_0, function()
		if not arg_36_0:IsIKTransitionActive(arg_36_4, arg_36_3) then
			return
		end

		arg_36_0.modeState = var_0_0.MODE_STATE.ACTIVE

		existCall(arg_36_5)
	end)
end

function var_0_0.EnterIK(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	arg_42_2 = arg_42_0:WrapCallbackOnce(arg_42_2)

	assert(arg_42_0.modeState == var_0_0.MODE_STATE.IDLE, string.format("Cannot enter IK from state: %s", tostring(arg_42_0.modeState)))
	assert(not arg_42_0:IsInIKTimelineMode(), "Cannot enter IK during timeline IK")

	local var_42_0 = arg_42_0:GetCurrentLadyEnv()

	assert(var_42_0, "Missing LadyEnv when enter IK")

	local var_42_1 = arg_42_0:ResolveIKConfig(var_42_0, arg_42_1)
	local var_42_2 = arg_42_0.sessionBuilder:BuildNormal(var_42_0, var_42_1, function(arg_43_0)
		arg_42_0:OnNormalIKLayerAction(arg_43_0)
	end)

	arg_42_0:ValidateIKSpec(var_42_2)

	local var_42_3 = arg_42_0:BeginIKTransition(var_0_0.MODE_STATE.ENTERING)

	arg_42_0.session.currentIkConfig = var_42_1

	arg_42_0:RunIKStatusTransition(var_42_0, var_42_1, var_0_0.MODE_STATE.ENTERING, var_42_3, arg_42_2, arg_42_3, var_42_2)
end

function var_0_0.ReplaceIKStatus(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	arg_44_2 = arg_44_0:WrapCallbackOnce(arg_44_2)

	assert(arg_44_0.modeState == var_0_0.MODE_STATE.ACTIVE, string.format("Cannot replace IK status from state: %s", tostring(arg_44_0.modeState)))

	local var_44_0 = arg_44_0:GetCurrentLadyEnv()

	assert(var_44_0, "Missing LadyEnv when replace IK status")

	local var_44_1 = arg_44_0:ResolveIKConfig(var_44_0, arg_44_1)
	local var_44_2 = arg_44_0.sessionBuilder:BuildNormal(var_44_0, var_44_1, function(arg_45_0)
		arg_44_0:OnNormalIKLayerAction(arg_45_0)
	end)

	arg_44_0:ValidateIKSpec(var_44_2)

	local var_44_3 = arg_44_0:BeginIKTransition(var_0_0.MODE_STATE.REPLACING)

	arg_44_0.session.currentIkConfig = var_44_1

	arg_44_0:RunIKStatusTransition(var_44_0, var_44_1, var_0_0.MODE_STATE.REPLACING, var_44_3, arg_44_2, arg_44_3, var_44_2)
end

function var_0_0.ExitIK(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_0.session.currentIkConfig

	assert(var_46_0, "Missing current IK config")
	arg_46_0:ExitIKWithReturn({
		character_position = var_46_0.character_position,
		character_action = var_46_0.character_action
	}, arg_46_1, arg_46_2)
end

function var_0_0.ExitIKWithReturn(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	arg_47_2 = arg_47_0:WrapCallbackOnce(arg_47_2)

	if arg_47_0.modeState == var_0_0.MODE_STATE.EXITING then
		if arg_47_2 then
			table.insert(arg_47_0.pendingExitCallbacks, arg_47_2)
		end

		return
	end

	assert(arg_47_0.modeState == var_0_0.MODE_STATE.ACTIVE, string.format("Cannot exit IK from state: %s", tostring(arg_47_0.modeState)))

	arg_47_3 = arg_47_3 or {}

	local var_47_0 = arg_47_0:GetCurrentLadyEnv()

	assert(var_47_0, "Missing LadyEnv when exit IK")
	assert(arg_47_0.session.currentIkConfig, "Missing current IK config when exit IK")
	assert(arg_47_0:GetUIState() == "ik")

	arg_47_1 = arg_47_0:BuildIKReturnInfo(arg_47_1)

	local var_47_1 = arg_47_0:BeginIKTransition(var_0_0.MODE_STATE.EXITING)

	seriesAsync({
		function(arg_48_0)
			if not arg_47_0:IsIKTransitionActive(var_47_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_47_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, false)
			arg_47_0:AcquireIKBlock()
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_48_0()
		end,
		function(arg_49_0)
			if not arg_47_0:IsIKTransitionActive(var_47_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_47_0:ClearIKRuntime(var_47_0, arg_47_3)
			arg_47_0:ApplyIKReturn(var_47_0, arg_47_1, arg_49_0, var_47_1)
		end,
		function(arg_50_0)
			if not arg_47_0:IsIKTransitionActive(var_47_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_47_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, arg_50_0, "back")
		end,
		function(arg_51_0)
			if not arg_47_0:IsIKTransitionActive(var_47_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_47_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_BLACKBOARD_VALUE, var_47_0, "inIK", false)
			arg_47_0:ReleaseIKBlock()
			arg_51_0()
		end
	}, function()
		if not arg_47_0:IsIKTransitionActive(var_47_1, var_0_0.MODE_STATE.EXITING) then
			return
		end

		arg_47_0.modeState = var_0_0.MODE_STATE.IDLE

		arg_47_0:FlushExitCallbacks(arg_47_2)
	end)
end

function var_0_0.EnterStockingIKMode(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0:GetCurrentLadyEnv()

	assert(var_53_0, "Missing LadyEnv when enter stocking IK mode")
	assert(arg_53_0.modeState == var_0_0.MODE_STATE.ACTIVE, "Stocking mode requires active IK")
	assert(arg_53_0.session.currentIkStatus, "Missing current IK status when enter stocking IK mode")

	arg_53_0.session.stockingCachedIkStatus = arg_53_0.session.currentIkStatus

	arg_53_0:ExitIK(arg_53_1, {
		ignoreResetExtraItem = true
	})
end

function var_0_0.ExitStockingIKMode(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0:GetCurrentLadyEnv()

	assert(var_54_0, "Missing LadyEnv when exit stocking IK mode")
	assert(arg_54_0.modeState == var_0_0.MODE_STATE.IDLE, "Exit stocking mode requires idle IK")

	local var_54_1 = arg_54_0.session.stockingCachedIkStatus

	assert(var_54_1, "Missing cached IK status when exit stocking IK mode")

	arg_54_0.session.stockingCachedIkStatus = nil

	arg_54_0:EnterIK(var_54_1, arg_54_1)
end

function var_0_0.GetSession(arg_55_0)
	return arg_55_0.session
end

function var_0_0.CancelControlInput(arg_56_0)
	if arg_56_0.input then
		arg_56_0.input:Cancel()
	end
end

function var_0_0.BeginIKBodyDrag(arg_57_0, arg_57_1, arg_57_2)
	if not arg_57_0:CanHandleIKInput() then
		return
	end

	if arg_57_0.session:IsBlocked() or arg_57_0.session.ikHandler then
		return
	end

	arg_57_0.driver:BeginDrag(arg_57_1, arg_57_2)
end

function var_0_0.DragIKBody(arg_58_0, arg_58_1)
	if not arg_58_0:CanHandleIKInput() then
		return
	end

	if not arg_58_0.session.ikHandler then
		return
	end

	arg_58_0.driver:Drag(arg_58_1)
end

function var_0_0.ReleaseIKBody(arg_59_0)
	arg_59_0.driver:Release()
end

function var_0_0.OnControlPointerDown(arg_60_0, arg_60_1)
	arg_60_0.input:OnControlPointerDown(arg_60_1)
end

function var_0_0.OnControlPointerUp(arg_61_0, arg_61_1)
	arg_61_0.input:OnControlPointerUp(arg_61_1)
end

function var_0_0.OnControlBeginDrag(arg_62_0, arg_62_1)
	arg_62_0.input:OnControlBeginDrag(arg_62_1)
end

function var_0_0.OnControlDrag(arg_63_0, arg_63_1, arg_63_2)
	arg_63_0.input:OnControlDrag(arg_63_1, arg_63_2)
end

function var_0_0.OnControlEndDrag(arg_64_0, arg_64_1)
	arg_64_0.input:OnControlEndDrag(arg_64_1)
end

function var_0_0.GetIKRaycastTargets(arg_65_0, arg_65_1)
	return arg_65_0.input:GetIKRaycastTargets(arg_65_1)
end

function var_0_0.ResolveBodyTarget(arg_66_0, arg_66_1)
	return arg_66_0.input:ResolveBodyTarget(arg_66_1)
end

function var_0_0.ResolveTouchTarget(arg_67_0, arg_67_1)
	return arg_67_0.input:ResolveTouchTarget(arg_67_1)
end

function var_0_0.ResolveTouchSceneItem(arg_68_0, arg_68_1)
	return arg_68_0.input:ResolveTouchSceneItem(arg_68_1)
end

function var_0_0.IsTransformInHierarchy(arg_69_0, arg_69_1)
	return RoomIKInput.IsTransformInHierarchy(arg_69_0, arg_69_1)
end

function var_0_0.EmitTouchPress(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	arg_70_0.input:EmitTouchPress(arg_70_1, arg_70_2, arg_70_3)
end

function var_0_0.OnIKLayerActive(arg_71_0, arg_71_1)
	arg_71_0.session.ikHandler = arg_71_1

	local var_71_0 = _.detect(arg_71_0.session.readyIKLayers or {}, function(arg_72_0)
		return arg_72_0:GetControllerPath() == arg_71_1.ikData:GetControllerPath()
	end)

	if not var_71_0 then
		return
	end

	arg_71_0.session:AcquireBlock("drag")
	arg_71_0:EnableIKLayer(var_71_0)

	arg_71_0.session.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	arg_71_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_71_0:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
end

function var_0_0.OnIKLayerDrag(arg_73_0, arg_73_1)
	arg_73_0.session.ikHandler = arg_73_1

	arg_73_0:ResetIKTipTimer()
end

function var_0_0.OnIKLayerDeactive(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = _.detect(arg_74_0.session.readyIKLayers or {}, function(arg_75_0)
		return arg_75_0:GetControllerPath() == arg_74_1.ikData:GetControllerPath()
	end)

	if not var_74_0 then
		return
	end

	arg_74_0:DeactiveIKLayer(var_74_0)

	arg_74_0.session.ikHandler = nil

	arg_74_0.session:ReleaseBlock("drag")

	if arg_74_2 then
		arg_74_0.session:AcquireBlock("trigger")
	end

	arg_74_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_74_0:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
end

function var_0_0.OnIKLayerAction(arg_76_0, arg_76_1)
	arg_76_0.session:ReleaseBlock("trigger")

	local var_76_0 = _.detect(arg_76_0.session.readyIKLayers or {}, function(arg_77_0)
		return arg_77_0:GetControllerPath() == arg_76_1.ikData:GetControllerPath()
	end)

	if not var_76_0 then
		return
	end

	arg_76_0:OnTriggerIK(var_76_0)
	arg_76_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_76_0:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
end

function var_0_0.GetDriverCallbacks(arg_78_0)
	return {
		active = function(arg_79_0)
			arg_78_0:OnIKLayerActive(arg_79_0)
		end,
		drag = function(arg_80_0)
			arg_78_0:OnIKLayerDrag(arg_80_0)
		end,
		deactive = function(arg_81_0, arg_81_1)
			arg_78_0:OnIKLayerDeactive(arg_81_0, arg_81_1)
		end,
		action = function(arg_82_0)
			arg_78_0:OnIKLayerAction(arg_82_0)
		end
	}
end

function var_0_0.ValidateIKSpec(arg_83_0, arg_83_1)
	return arg_83_0.sessionBuilder:ValidateSpec(arg_83_1)
end

function var_0_0.ActivateIKSession(arg_84_0, arg_84_1, arg_84_2)
	assert(arg_84_1 and arg_84_1.validated, "RoomIK session spec must be validated before activation")

	if not arg_84_1.raycaster then
		arg_84_1.raycaster = GetOrAddComponent(arg_84_1.raycastCameraTF, typeof(UnityEngine.EventSystems.PhysicsRaycaster))

		assert(arg_84_1.raycaster, "Missing RoomIK raycaster")
	end

	local var_84_0 = arg_84_0.session:Start(arg_84_1.mode)

	arg_84_0.session:ApplySpec(arg_84_1)

	arg_84_0.session.enableIKTip = true

	arg_84_0:ResetIKTipTimer()
	arg_84_0:CancelControlInput()
	existCall(arg_84_2, arg_84_1)
	arg_84_0:Emit(RoomTouchSystem.CANCEL_TOUCH_PRESS)

	if arg_84_1.mode == "normal" then
		arg_84_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, arg_84_0.session.ikTouchDatas, arg_84_1.statusId)
	else
		arg_84_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, nil)
	end

	arg_84_0.driver:Attach(arg_84_0.session, arg_84_0:GetDriverCallbacks())
	arg_84_0:Emit(Dorm3dIKView.UPDATE_TEXT_TIPS, RoomIKTipBuilder.BuildTextTips(arg_84_0.session.readyIKLayers))

	return var_84_0
end

function var_0_0.SetIKStatus(arg_85_0, arg_85_1, arg_85_2, arg_85_3, arg_85_4, arg_85_5, arg_85_6, arg_85_7)
	warning("Set IKStatus " .. (arg_85_2.id or "NIL"))

	if not arg_85_7 then
		arg_85_7 = arg_85_0.sessionBuilder:BuildNormal(arg_85_1, arg_85_2, function(arg_86_0)
			arg_85_0:OnNormalIKLayerAction(arg_86_0)
		end)

		arg_85_0:ValidateIKSpec(arg_85_7)
	end

	local var_85_0 = arg_85_0:GetCameras()
	local var_85_1 = Dorm3dRoomTemplateScene.CAMERA.IK_WATCH
	local var_85_2 = arg_85_0:ActivateIKSession(arg_85_7, function()
		setActive(arg_85_1.ladyCollider, false)
		_.each(arg_85_1.ladyTouchColliders, function(arg_88_0)
			setActive(arg_88_0, true)
		end)
		_.each(arg_85_7.sceneItems, function(arg_89_0)
			if IsNil(GetComponent(arg_89_0.target, typeof(UnityEngine.Collider))) then
				go(arg_89_0.target):AddComponent(typeof(UnityEngine.BoxCollider))
			end
		end)
	end)

	if var_85_0[var_85_1] then
		setActive(var_85_0[var_85_1], false)

		var_85_0[var_85_1] = nil
	end

	var_85_0[var_85_1] = arg_85_7.ikCameraTF

	arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_ACTIVE_CAMERA, var_85_0[var_85_1])

	local var_85_3 = arg_85_7.ikCameraTF:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_85_3 then
		arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REGISTER_ORBITS, var_85_3)
	else
		arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REVERT_CAMERA_ORBIT)
	end

	arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SWITCH_ANIM, arg_85_1, arg_85_2.character_action, nil, true)
	arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_HEAD_AIM_IK, arg_85_1, arg_85_2.head_track)
	arg_85_1:EnableCloth(false)
	arg_85_1:EnableCloth(arg_85_2.use_cloth, arg_85_2.cloth_colliders)
	arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_SCENE_ANIM, arg_85_2.enter_scene_anim, true)
	arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_EXTRA_ITEM, arg_85_1, arg_85_2.enter_extra_item, true)
	arg_85_0:Emit(Dorm3dRoomTemplateScene.EXTRA_HIDE_SCENE_ITEM, arg_85_2.hide_scene_item)
	onNextTick(function()
		if not arg_85_0.session:IsCurrent(var_85_2) then
			return
		end

		if arg_85_5 and not arg_85_0:IsIKTransitionActive(arg_85_5, arg_85_6) then
			return
		end

		arg_85_1.lady.position = arg_85_7.stayPoint.position
		arg_85_1.lady.rotation = arg_85_7.stayPoint.rotation

		existCall(arg_85_3)
	end)
end

function var_0_0.ClearIKStatusRuntime(arg_91_0, arg_91_1, arg_91_2)
	arg_91_2 = arg_91_2 or {}
	arg_91_0.session.enableIKTip = false

	arg_91_0:CancelControlInput()
	setActive(arg_91_1.ladyCollider, true)
	_.each(arg_91_1.ladyTouchColliders, function(arg_92_0)
		setActive(arg_92_0, false)
	end)
	arg_91_0.session:ClearBlocks()
	arg_91_0.driver:Detach()

	arg_91_0.session.ikHandler = nil

	arg_91_0:Emit(Dorm3dIKView.SET_TIPS_ACTIVE, false)
	arg_91_0:Emit(RoomTouchSystem.CANCEL_TOUCH_PRESS)
	arg_91_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, nil)
	arg_91_0.session:ClearRuntime()
	arg_91_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REVERT_CAMERA_ORBIT)

	local var_91_0 = arg_91_0:GetCameras()[Dorm3dRoomTemplateScene.CAMERA.IK_WATCH]

	if var_91_0 then
		setActive(var_91_0, false)

		arg_91_0:GetCameras()[Dorm3dRoomTemplateScene.CAMERA.IK_WATCH] = nil
	end

	arg_91_1:EnableCloth(false)
	arg_91_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_HEAD_AIM_IK, arg_91_1)
	arg_91_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_SCENE_ITEM_ANIMATORS)

	if not arg_91_2.ignoreResetExtraItem then
		arg_91_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_CHARACTER_EXTRA_ITEM)
		arg_91_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_TEMP_HIDE_SCENE_ITEMS)
	end
end

function var_0_0.ClearIKRuntime(arg_93_0, arg_93_1, arg_93_2)
	arg_93_2 = arg_93_2 or {}

	if arg_93_0.session.ikSwitchSkinId then
		local var_93_0 = arg_93_0:GetApartment():GetConfigID()

		arg_93_1:SwitchCharacterSkin(var_93_0, arg_93_0.session.ikSwitchSkinId)

		arg_93_0.session.ikSwitchSkinId = nil
	end

	arg_93_0:ClearIKStatusRuntime(arg_93_1, arg_93_2)
end

function var_0_0.BuildIKReturnInfo(arg_94_0, arg_94_1)
	assert(type(arg_94_1) == "table", "Invalid IK return info")
	assert(type(arg_94_1.character_action) == "string", "Invalid IK return character_action")
	assert(arg_94_1.character_position == nil or type(arg_94_1.character_position) == "string" and arg_94_1.character_position ~= "", "Invalid IK return character_position")

	local var_94_0 = arg_94_1.character_position or arg_94_0:GetLadyBaseZone(arg_94_0:GetApartment():GetConfigID())

	assert(type(var_94_0) == "string" and var_94_0 ~= "", "Invalid IK return character_position")

	local var_94_1 = arg_94_0:GetIKPointByName(var_94_0) or arg_94_0:GetZoneByName(var_94_0)

	assert(var_94_1 and var_94_1:Find("StayPoint"), "Missing IK return character position: " .. var_94_0)

	return {
		character_position = var_94_0,
		character_action = arg_94_1.character_action
	}
end

function var_0_0.ApplyIKReturn(arg_95_0, arg_95_1, arg_95_2, arg_95_3, arg_95_4)
	arg_95_3 = arg_95_0:WrapCallbackOnce(arg_95_3)

	arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SWITCH_ANIM, arg_95_1, arg_95_2.character_action)
	onNextTick(function()
		if arg_95_4 and not arg_95_0:IsIKTransitionActive(arg_95_4, var_0_0.MODE_STATE.EXITING) then
			return
		end

		arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_CHANGE_CHARACTER_POSITION, arg_95_1, arg_95_2.character_position)
		arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_TRIGGER_LADY_DISTANCE)
		arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_CHECK_IN_SECTOR)
		existCall(arg_95_3)
	end)
end

function var_0_0.SaveIKTimelineColliderState(arg_97_0, arg_97_1)
	arg_97_0.session.ikTimelineColliderStates = arg_97_0.session.ikTimelineColliderStates or {}

	if arg_97_0.session.ikTimelineColliderStates[arg_97_1] == nil then
		arg_97_0.session.ikTimelineColliderStates[arg_97_1] = isActive(arg_97_1)
	end
end

function var_0_0.SetIKTimelineColliderActive(arg_98_0, arg_98_1, arg_98_2)
	arg_98_0:SaveIKTimelineColliderState(arg_98_1)
	setActive(arg_98_1, arg_98_2)
end

function var_0_0.RestoreIKTimelineColliders(arg_99_0)
	if not arg_99_0.session.ikTimelineColliderStates then
		return
	end

	for iter_99_0, iter_99_1 in pairs(arg_99_0.session.ikTimelineColliderStates) do
		if iter_99_0 and not IsNil(iter_99_0) then
			setActive(iter_99_0, iter_99_1)
		end
	end

	arg_99_0.session.ikTimelineColliderStates = nil
end

function var_0_0.ClearIKTimelineRuntime(arg_100_0)
	if not arg_100_0:IsInIKTimelineMode() and not arg_100_0.session.ikTimelineColliderStates then
		return
	end

	arg_100_0:SetCurrentIkTimelineStatus(nil)

	arg_100_0.session.enableIKTip = false

	arg_100_0:CancelControlInput()
	arg_100_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, false)
	arg_100_0.session:ClearBlocks()
	arg_100_0.driver:Detach()
	arg_100_0.session:ClearRuntime()
	arg_100_0:RestoreIKTimelineColliders()
	arg_100_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, nil)
	arg_100_0:Emit(Dorm3dIKView.SET_TIPS_ACTIVE, false)
end

function var_0_0.SetIKTimelineStatus(arg_101_0, arg_101_1, arg_101_2, arg_101_3, arg_101_4)
	arg_101_4 = arg_101_0:WrapCallbackOnce(arg_101_4)

	if not arg_101_0:CheckIkTimelineStatus(arg_101_2) then
		existCall(arg_101_4)

		return
	end

	local var_101_0 = arg_101_0.sessionBuilder:BuildTimeline(arg_101_1, arg_101_2, arg_101_3, function(arg_102_0)
		arg_101_0:OnTimelineIKLayerAction(arg_102_0)
	end)

	arg_101_0:ValidateIKSpec(var_101_0)

	if arg_101_0:IsInIKTimelineMode() then
		arg_101_0:ClearIKTimelineRuntime()
	else
		assert(arg_101_0.modeState == var_0_0.MODE_STATE.IDLE, string.format("Cannot enter timeline IK from state: %s", tostring(arg_101_0.modeState)))
	end

	warning("Set IKStatus " .. (arg_101_2 or "NIL"))
	arg_101_0:ActivateIKSession(var_101_0, function()
		_.each(var_101_0.colliderChanges, function(arg_104_0)
			arg_101_0:SetIKTimelineColliderActive(arg_104_0.target, arg_104_0.active)
		end)
	end)
	arg_101_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, true)
	existCall(arg_101_4)
end

function var_0_0.ExitIKTimelineStatus(arg_105_0, arg_105_1)
	arg_105_1 = arg_105_0:WrapCallbackOnce(arg_105_1)

	if not arg_105_0:IsInIKTimelineMode() then
		existCall(arg_105_1)

		return
	end

	arg_105_0:ClearIKTimelineRuntime()
	existCall(arg_105_1)
end

function var_0_0.SetCurrentIkTimelineStatus(arg_106_0, arg_106_1)
	arg_106_0.session.currentIkTimelineStatus = arg_106_1
end

function var_0_0.CheckIkTimelineStatus(arg_107_0, arg_107_1)
	if not arg_107_0.session.currentIkTimelineStatus then
		return true
	end

	return arg_107_0.session.currentIkTimelineStatus ~= arg_107_1
end

function var_0_0.IsInIKTimelineMode(arg_108_0)
	return arg_108_0.session.mode == "timeline"
end

function var_0_0.IsIKModeActive(arg_109_0)
	return arg_109_0.modeState == var_0_0.MODE_STATE.ACTIVE
end

function var_0_0.CanHandleIKInput(arg_110_0)
	return arg_110_0:IsIKModeActive() or arg_110_0:IsInIKTimelineMode()
end

function var_0_0.EnableIKLayer(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_0:GetCurrentLadyEnv()

	if #arg_111_1:GetHeadTrackPath() > 0 then
		arg_111_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_HEAD_AIM_IK, var_111_0, {
			2,
			arg_111_1:GetHeadTrackPath()
		}, true)
	end

	local var_111_1 = arg_111_1:GetTriggerFaceAnim()

	if #var_111_1 > 0 then
		arg_111_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_FACE_ANIM, var_111_0, var_111_1)
	end

	if not arg_111_1.ignoreDrag then
		arg_111_0:Emit(Dorm3dIKView.PLAY_HAND_BEGIN)
	end

	if not arg_111_0:IsInIKTimelineMode() then
		local var_111_2 = arg_111_0.session.currentIkConfig

		assert(var_111_2, "Missing current IK config")
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_111_0:GetApartment().configId, arg_111_0:GetApartment().level, var_111_2.character_action, arg_111_1:GetTriggerParams()[2], arg_111_0:GetRoom():GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0:GetCurrentLadyEnv()

	if not arg_112_0:IsInIKTimelineMode() and #arg_112_1:GetHeadTrackPath() > 0 then
		local var_112_1 = arg_112_0.session.currentIkConfig

		assert(var_112_1, "Missing current IK config")
		arg_112_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_HEAD_AIM_IK, var_112_0, var_112_1.head_track)
	end

	if not arg_112_1.ignoreDrag then
		arg_112_0:Emit(Dorm3dIKView.PLAY_HAND_END)
	end
end

function var_0_0.ResetIKTipTimer(arg_113_0)
	if not arg_113_0.session.enableIKTip then
		return
	end

	arg_113_0.session.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.PlayTouchIKMove(arg_114_0, arg_114_1, arg_114_2, arg_114_3, arg_114_4, arg_114_5)
	arg_114_5 = arg_114_0:WrapCallbackOnce(arg_114_5)

	assert(arg_114_0:IsIKModeActive(), "Touch IK move requires active IK")
	assert(type(arg_114_2) == "table" and #arg_114_2 == 2, "Invalid touch IK move point: " .. tostring(arg_114_1))
	assert(type(arg_114_3) == "number", "Invalid touch IK move step: " .. tostring(arg_114_1))
	assert(type(arg_114_4) == "number", "Invalid touch IK move time: " .. tostring(arg_114_1))

	local var_114_0 = arg_114_0.session.ikSettings

	assert(var_114_0, "Missing IK settings when play touch IK move")

	local var_114_1 = var_114_0.Colliders

	assert(var_114_1, "Missing IK colliders when play touch IK move")

	local var_114_2 = Dorm3dIK.New({
		configId = arg_114_1
	}):GetTriggerBoneName()
	local var_114_3 = var_114_1[var_114_2]

	assert(var_114_3, "Missing IK collider: " .. tostring(var_114_2))

	local var_114_4 = arg_114_0:GetRaycastCamera():WorldToScreenPoint(var_114_3.position)

	arg_114_0.driver:Reset(var_114_2)
	arg_114_0.driver:PlayMove(var_114_4, var_114_2, Vector2.New(unpack(arg_114_2)), arg_114_3, arg_114_4, arg_114_5)
end

function var_0_0.OnNormalIKLayerAction(arg_115_0, arg_115_1)
	if not arg_115_0:IsIKModeActive() then
		return
	end

	if not arg_115_0.session.currentIkConfig then
		return
	end

	local var_115_0 = arg_115_0:GetCurrentLadyEnv()
	local var_115_1 = arg_115_1:GetControllerPath()
	local var_115_2 = arg_115_0.session.ikActionDict[var_115_1]

	if not var_115_2 then
		return
	end

	arg_115_0.session:AcquireBlock("layer_action")

	local var_115_3 = arg_115_0:WrapCallbackOnce(function()
		arg_115_0:ResetIKTipTimer()
		arg_115_0.session:ReleaseBlock("layer_action")
	end)

	arg_115_0:Emit(var_0_0.ON_IK_LAYER_ACTION, var_115_0, arg_115_1:GetConfigID(), var_115_2, var_115_3)
end

function var_0_0.OnTimelineIKLayerAction(arg_117_0, arg_117_1)
	if not arg_117_0:IsInIKTimelineMode() then
		return
	end

	arg_117_0:ExitIKTimelineStatus()

	local var_117_0 = arg_117_1:GetTimelineAction()

	if var_117_0 then
		arg_117_0:GetNowTimelinePlayer():TriggerEvent(var_117_0)
	end
end

function var_0_0.OnTriggerIK(arg_118_0, arg_118_1)
	if not arg_118_0:CanHandleIKInput() then
		return
	end

	local var_118_0 = arg_118_0.session.spec

	if not var_118_0 or not var_118_0.onLayerAction then
		return
	end

	var_118_0.onLayerAction(arg_118_1)
end

function var_0_0.UpdateIKTarget(arg_119_0)
	if not arg_119_0:CanHandleIKInput() then
		return
	end

	if not arg_119_0:GetApartment() then
		return
	end

	if not arg_119_0:GetCurrentLadyEnv() then
		return
	end

	if arg_119_0.session.ikHandler then
		if not arg_119_0.session.readyIKLayers then
			return
		end

		local var_119_0 = arg_119_0.session.ikHandler.screenPosition
		local var_119_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
		local var_119_2 = var_119_0 - Vector2.New(var_119_1.width, var_119_1.height) * 0.5

		arg_119_0:Emit(Dorm3dIKView.SET_HAND_POSITION, var_119_2)

		if Time.time > arg_119_0.session.ikNextCheckStamp then
			arg_119_0.session.ikNextCheckStamp = arg_119_0.session.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

			local var_119_3 = _.detect(arg_119_0.session.readyIKLayers, function(arg_120_0)
				return arg_120_0:GetControllerPath() == arg_119_0.session.ikHandler.ikData:GetControllerPath()
			end)

			arg_119_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_119_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
		end
	end

	if arg_119_0.session.enableIKTip then
		if not arg_119_0.session.readyIKLayers or not arg_119_0.session.ikSettings then
			return
		end

		arg_119_0:UpdateIKTips()
	end
end

function var_0_0.UpdateIKTips(arg_121_0)
	if not arg_121_0.session.nextTipIKTime then
		return
	end

	local var_121_0 = not arg_121_0.session:IsBlocked() and Time.time > arg_121_0.session.nextTipIKTime

	local function var_121_1(arg_122_0)
		local var_122_0 = {}

		arg_121_0:Emit(Dorm3dRoomTemplateScene.EXTRA_GET_SCREEN_POSITION, var_122_0, arg_122_0, arg_121_0.session.ikSettings.CameraRaycaster.eventCamera)

		return var_122_0.value
	end

	local function var_121_2(arg_123_0)
		return arg_121_0:GetSceneItem(arg_123_0)
	end

	arg_121_0:Emit(Dorm3dIKView.UPDATE_TIPS, var_121_0, RoomIKTipBuilder.BuildIKTips(arg_121_0.session.readyIKLayers, arg_121_0.session.ikSettings, var_121_1), RoomIKTipBuilder.BuildTouchTips(arg_121_0.session.ikTouchDatas, pg.dorm3d_ik_touch, arg_121_0.session.ikSettings, var_121_2, var_121_1))
end

function var_0_0.CycleIKCameraGroup(arg_124_0)
	local var_124_0 = arg_124_0:GetCurrentLadyEnv()

	assert(var_124_0, "Missing LadyEnv when cycle IK camera group")
	assert(arg_124_0:IsIKModeActive(), "Cycle IK camera group requires active IK")
	arg_124_0.driver:ResetActiveLayers()

	local var_124_1 = arg_124_0.session.currentIkConfig

	assert(var_124_1, "Missing current IK config")

	local var_124_2 = var_124_1.camera_group
	local var_124_3 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_124_2]
	local var_124_4 = var_124_3[table.indexof(var_124_3, var_124_1.id) % #var_124_3 + 1]

	arg_124_0:ReplaceIKStatus(var_124_4)
end

function var_0_0.SetIKSwitchSkinId(arg_125_0, arg_125_1)
	arg_125_0.session.ikSwitchSkinId = arg_125_1
end

function var_0_0.SwitchIKSkin(arg_126_0, arg_126_1, arg_126_2, arg_126_3)
	assert(arg_126_0:IsIKModeActive(), "Switch IK skin requires active IK")

	local var_126_0 = arg_126_0.session.currentIkConfig

	assert(var_126_0, "Missing current IK config")

	local var_126_1 = var_126_0.id

	seriesAsync({
		function(arg_127_0)
			arg_126_0:ExitIK(arg_127_0)
		end,
		function(arg_128_0)
			arg_126_1:SwitchCharacterSkin(arg_126_2, arg_126_3)
			arg_126_0:EnterIK(var_126_1, arg_128_0)
		end
	})
end

function var_0_0.ConsumeIKSpecialCall(arg_129_0)
	if not arg_129_0.session.ikSpecialCall then
		return false
	end

	local var_129_0 = arg_129_0.session.ikSpecialCall

	arg_129_0.session.ikSpecialCall = nil

	existCall(var_129_0)

	return true
end

return var_0_0

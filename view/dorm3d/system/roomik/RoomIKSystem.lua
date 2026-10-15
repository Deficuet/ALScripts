local var_0_0 = class("RoomIKSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.ENTER_IK = "RoomIKSystem.ENTER_IK"
var_0_0.REPLACE_IK_STATUS = "RoomIKSystem.REPLACE_IK_STATUS"
var_0_0.EXIT_IK_WITH_RETURN = "RoomIKSystem.EXIT_IK_WITH_RETURN"
var_0_0.ENTER_STOCKING_IK_MODE = "RoomIKSystem.ENTER_STOCKING_IK_MODE"
var_0_0.EXIT_STOCKING_IK_MODE = "RoomIKSystem.EXIT_STOCKING_IK_MODE"
var_0_0.ENTER_AIMIK_IK_MODE = "RoomIKSystem.ENTER_AIMIK_IK_MODE"
var_0_0.EXIT_AIMIK_IK_MODE = "RoomIKSystem.EXIT_AIMIK_IK_MODE"
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
	arg_2_0:Bind(var_0_0.ENTER_AIMIK_IK_MODE, function(arg_8_0, arg_8_1)
		arg_2_0:EnterAimIKMode(arg_8_1)
	end)
	arg_2_0:Bind(var_0_0.EXIT_AIMIK_IK_MODE, function(arg_9_0, arg_9_1)
		arg_2_0:ExitAimIKMode(arg_9_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_POINTER_DOWN, function(arg_10_0, arg_10_1)
		arg_2_0.input:OnControlPointerDown(arg_10_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_POINTER_UP, function(arg_11_0, arg_11_1)
		arg_2_0.input:OnControlPointerUp(arg_11_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_BEGIN_DRAG, function(arg_12_0, arg_12_1)
		arg_2_0.input:OnControlBeginDrag(arg_12_1)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_DRAG, function(arg_13_0, arg_13_1, arg_13_2)
		arg_2_0.input:OnControlDrag(arg_13_1, arg_13_2)
	end)
	arg_2_0:Bind(var_0_0.ON_CONTROL_END_DRAG, function(arg_14_0, arg_14_1)
		arg_2_0.input:OnControlEndDrag(arg_14_1)
	end)
	arg_2_0:Bind(var_0_0.SET_IK_TIMELINE_STATUS, function(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
		arg_2_0:SetIKTimelineStatus(arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	end)
	arg_2_0:Bind(var_0_0.EXIT_IK_TIMELINE_STATUS, function(arg_16_0, arg_16_1)
		arg_2_0:ExitIKTimelineStatus(arg_16_1)
	end)
	arg_2_0:Bind(var_0_0.CYCLE_IK_CAMERA_GROUP, function()
		arg_2_0:CycleIKCameraGroup()
	end)
	arg_2_0:Bind(var_0_0.SET_IK_SPECIAL_CALL, function(arg_18_0, arg_18_1)
		arg_2_0.session.ikSpecialCall = arg_18_1
	end)
	arg_2_0:Bind(var_0_0.CONSUME_IK_SPECIAL_CALL, function(arg_19_0, arg_19_1)
		local var_19_0 = arg_2_0:ConsumeIKSpecialCall()

		if arg_19_1 then
			arg_19_1.consumed = var_19_0
		end
	end)
	arg_2_0:Bind(var_0_0.GET_IK_BLOCK, function(arg_20_0, arg_20_1)
		if arg_20_1 then
			arg_20_1.blockIK = arg_2_0.session:IsBlocked()
		end
	end)
	arg_2_0:Bind(var_0_0.SET_IK_BLOCK, function(arg_21_0, arg_21_1)
		arg_2_0.session:SetLegacyBlock(arg_21_1)
	end)
	arg_2_0:Bind(var_0_0.RESET_IK_TIP_TIMER, function()
		arg_2_0:ResetIKTipTimer()
	end)
	arg_2_0:Bind(var_0_0.SET_IK_SWITCH_SKIN_ID, function(arg_23_0, arg_23_1)
		arg_2_0:SetIKSwitchSkinId(arg_23_1)
	end)
	arg_2_0:Bind(var_0_0.SWITCH_IK_SKIN, function(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
		arg_2_0:SwitchIKSkin(arg_24_1, arg_24_2, arg_24_3)
	end)
	arg_2_0:Bind(var_0_0.PLAY_TOUCH_IK_MOVE, function(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
		arg_2_0:PlayTouchIKMove(arg_25_1, arg_25_2, arg_25_3, arg_25_4, arg_25_5)
	end)
end

function var_0_0.OnUpdate(arg_26_0)
	arg_26_0:UpdateIKTarget()
end

function var_0_0.OnDispose(arg_27_0)
	arg_27_0.transitionSerial = arg_27_0.transitionSerial + 1

	local var_27_0 = arg_27_0:GetCurrentLadyEnv()

	if arg_27_0:IsInIKTimelineMode() then
		arg_27_0:ClearIKTimelineRuntime()
	elseif arg_27_0.session.active and var_27_0 then
		arg_27_0:ClearIKStatusRuntime(var_27_0)
	else
		arg_27_0:RestoreIKTimelineColliders()
		arg_27_0:CancelControlInput()
		arg_27_0.driver:Detach()
	end

	arg_27_0:ReleaseIKBlock()

	arg_27_0.modeState = var_0_0.MODE_STATE.IDLE

	if arg_27_0.input then
		arg_27_0.input:Dispose()

		arg_27_0.input = nil
	end

	arg_27_0.pendingExitCallbacks = {}

	arg_27_0.session:Invalidate()
end

function var_0_0.WrapCallbackOnce(arg_28_0, arg_28_1)
	if not arg_28_1 then
		return nil
	end

	local var_28_0 = false

	return function(...)
		if var_28_0 then
			return
		end

		var_28_0 = true

		existCall(arg_28_1, ...)
	end
end

function var_0_0.FlushExitCallbacks(arg_30_0, arg_30_1)
	existCall(arg_30_1)

	local var_30_0 = arg_30_0.pendingExitCallbacks

	arg_30_0.pendingExitCallbacks = {}

	for iter_30_0, iter_30_1 in ipairs(var_30_0) do
		existCall(iter_30_1)
	end
end

function var_0_0.ResolveIKConfig(arg_31_0, arg_31_1, arg_31_2)
	warning("switchIkstatus", arg_31_2)

	local var_31_0 = pg.dorm3d_ik_status[arg_31_2]

	assert(var_31_0, "Missing dorm3d_ik_status config: " .. tostring(arg_31_2))

	local function var_31_1()
		if var_31_0.skin_id ~= arg_31_1.skinId then
			local var_32_0 = pg.dorm3d_ik_status.get_id_list_by_base[var_31_0.base]
			local var_32_1 = _.detect(var_32_0, function(arg_33_0)
				return pg.dorm3d_ik_status[arg_33_0].skin_id == arg_31_1.skinId
			end)

			assert(var_32_1, string.format("Missing Status Config By Skin: %s original Status: %s", arg_31_1.skinId, arg_31_2))

			var_31_0 = pg.dorm3d_ik_status[var_32_1]
		end
	end

	if type(var_31_0.skin_id) == "table" then
		if not table.contains(var_31_0.skin_id, arg_31_1.skinId) then
			var_31_1()
		end
	else
		var_31_1()
	end

	return var_31_0
end

function var_0_0.BeginIKTransition(arg_34_0, arg_34_1)
	arg_34_0.transitionSerial = arg_34_0.transitionSerial + 1
	arg_34_0.modeState = arg_34_1

	return arg_34_0.transitionSerial
end

function var_0_0.IsIKTransitionActive(arg_35_0, arg_35_1, arg_35_2)
	return arg_35_0.transitionSerial == arg_35_1 and arg_35_0.modeState == arg_35_2
end

function var_0_0.AcquireIKBlock(arg_36_0)
	if arg_36_0.session.uiBlockHeld then
		return
	end

	arg_36_0.session.uiBlockHeld = true

	arg_36_0:Emit(Dorm3dRoomTemplateScene.SHOW_BLOCK)
end

function var_0_0.ReleaseIKBlock(arg_37_0)
	if not arg_37_0.session.uiBlockHeld then
		return
	end

	arg_37_0.session.uiBlockHeld = false

	arg_37_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)
end

function var_0_0.RunIKStatusTransition(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4, arg_38_5, arg_38_6, arg_38_7)
	arg_38_6 = arg_38_6 or {}
	arg_38_5 = arg_38_0:WrapCallbackOnce(arg_38_5)

	local var_38_0 = {}

	table.insert(var_38_0, function(arg_39_0)
		if not arg_38_0:IsIKTransitionActive(arg_38_4, arg_38_3) then
			return
		end

		arg_38_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_BLACKBOARD_VALUE, arg_38_1, "inIK", true)
		arg_38_0:AcquireIKBlock()

		local var_39_0 = arg_38_2.camera_group

		arg_38_0:Emit(Dorm3dIKView.SET_CAMERA_BUTTON_ACTIVE, #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_39_0] > 1)
		arg_38_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, true)
		arg_39_0()
	end)

	if arg_38_0:GetUIState() ~= "ik" then
		table.insert(var_38_0, function(arg_40_0)
			if not arg_38_0:IsIKTransitionActive(arg_38_4, arg_38_3) then
				return
			end

			arg_38_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, arg_40_0, "ik")
		end)
	end

	table.insert(var_38_0, function(arg_41_0)
		if not arg_38_0:IsIKTransitionActive(arg_38_4, arg_38_3) then
			return
		end

		if arg_38_3 == var_0_0.MODE_STATE.REPLACING then
			arg_38_0:ClearIKStatusRuntime(arg_38_1, arg_38_6)

			arg_38_0.session.currentIkConfig = arg_38_2
		end

		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_38_0:SetIKStatus(arg_38_1, arg_38_2, arg_41_0, arg_38_6, arg_38_4, arg_38_3, arg_38_7)
	end)
	table.insert(var_38_0, function(arg_42_0)
		if not arg_38_0:IsIKTransitionActive(arg_38_4, arg_38_3) then
			return
		end

		arg_38_0:ReleaseIKBlock()
		arg_42_0()
	end)
	seriesAsync(var_38_0, function()
		if not arg_38_0:IsIKTransitionActive(arg_38_4, arg_38_3) then
			return
		end

		arg_38_0.modeState = var_0_0.MODE_STATE.ACTIVE

		existCall(arg_38_5)
	end)
end

function var_0_0.EnterIK(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	arg_44_2 = arg_44_0:WrapCallbackOnce(arg_44_2)

	assert(arg_44_0.modeState == var_0_0.MODE_STATE.IDLE, string.format("Cannot enter IK from state: %s", tostring(arg_44_0.modeState)))
	assert(not arg_44_0:IsInIKTimelineMode(), "Cannot enter IK during timeline IK")

	local var_44_0 = arg_44_0:GetCurrentLadyEnv()

	assert(var_44_0, "Missing LadyEnv when enter IK")

	local var_44_1 = arg_44_0:ResolveIKConfig(var_44_0, arg_44_1)
	local var_44_2 = arg_44_0.sessionBuilder:BuildNormal(var_44_0, var_44_1, function(arg_45_0)
		arg_44_0:OnNormalIKLayerAction(arg_45_0)
	end)

	arg_44_0:ValidateIKSpec(var_44_2)

	local var_44_3 = arg_44_0:BeginIKTransition(var_0_0.MODE_STATE.ENTERING)

	arg_44_0.session.currentIkConfig = var_44_1

	arg_44_0:RunIKStatusTransition(var_44_0, var_44_1, var_0_0.MODE_STATE.ENTERING, var_44_3, arg_44_2, arg_44_3, var_44_2)
end

function var_0_0.ReplaceIKStatus(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	arg_46_2 = arg_46_0:WrapCallbackOnce(arg_46_2)

	assert(arg_46_0.modeState == var_0_0.MODE_STATE.ACTIVE, string.format("Cannot replace IK status from state: %s", tostring(arg_46_0.modeState)))

	local var_46_0 = arg_46_0:GetCurrentLadyEnv()

	assert(var_46_0, "Missing LadyEnv when replace IK status")

	local var_46_1 = arg_46_0:ResolveIKConfig(var_46_0, arg_46_1)
	local var_46_2 = arg_46_0.sessionBuilder:BuildNormal(var_46_0, var_46_1, function(arg_47_0)
		arg_46_0:OnNormalIKLayerAction(arg_47_0)
	end)

	arg_46_0:ValidateIKSpec(var_46_2)

	local var_46_3 = arg_46_0:BeginIKTransition(var_0_0.MODE_STATE.REPLACING)

	arg_46_0.session.currentIkConfig = var_46_1

	arg_46_0:RunIKStatusTransition(var_46_0, var_46_1, var_0_0.MODE_STATE.REPLACING, var_46_3, arg_46_2, arg_46_3, var_46_2)
end

function var_0_0.ExitIK(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = arg_48_0.session.currentIkConfig

	assert(var_48_0, "Missing current IK config")
	arg_48_0:ExitIKWithReturn({
		character_position = var_48_0.character_position,
		character_action = var_48_0.character_action
	}, arg_48_1, arg_48_2)
end

function var_0_0.ExitIKWithReturn(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	arg_49_2 = arg_49_0:WrapCallbackOnce(arg_49_2)

	if arg_49_0.modeState == var_0_0.MODE_STATE.EXITING then
		if arg_49_2 then
			table.insert(arg_49_0.pendingExitCallbacks, arg_49_2)
		end

		return
	end

	assert(arg_49_0.modeState == var_0_0.MODE_STATE.ACTIVE, string.format("Cannot exit IK from state: %s", tostring(arg_49_0.modeState)))

	arg_49_3 = arg_49_3 or {}

	local var_49_0 = arg_49_0:GetCurrentLadyEnv()

	assert(var_49_0, "Missing LadyEnv when exit IK")
	assert(arg_49_0.session.currentIkConfig, "Missing current IK config when exit IK")
	assert(arg_49_0:GetUIState() == "ik")

	arg_49_1 = arg_49_0:BuildIKReturnInfo(arg_49_1)

	local var_49_1 = arg_49_0:BeginIKTransition(var_0_0.MODE_STATE.EXITING)

	seriesAsync({
		function(arg_50_0)
			if not arg_49_0:IsIKTransitionActive(var_49_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_49_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, false)
			arg_49_0:AcquireIKBlock()
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_50_0()
		end,
		function(arg_51_0)
			if not arg_49_0:IsIKTransitionActive(var_49_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_49_0:ClearIKRuntime(var_49_0, arg_49_3)
			arg_49_0:ApplyIKReturn(var_49_0, arg_49_1, arg_51_0, var_49_1)
		end,
		function(arg_52_0)
			if not arg_49_0:IsIKTransitionActive(var_49_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_49_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, arg_52_0, "back")
		end,
		function(arg_53_0)
			if not arg_49_0:IsIKTransitionActive(var_49_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_49_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_BLACKBOARD_VALUE, var_49_0, "inIK", false)
			arg_49_0:ReleaseIKBlock()
			arg_53_0()
		end
	}, function()
		if not arg_49_0:IsIKTransitionActive(var_49_1, var_0_0.MODE_STATE.EXITING) then
			return
		end

		arg_49_0.modeState = var_0_0.MODE_STATE.IDLE

		arg_49_0:FlushExitCallbacks(arg_49_2)
	end)
end

function var_0_0.EnterStockingIKMode(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_0:GetCurrentLadyEnv()

	assert(var_55_0, "Missing LadyEnv when enter stocking IK mode")
	assert(arg_55_0.modeState == var_0_0.MODE_STATE.ACTIVE, "Stocking mode requires active IK")
	assert(arg_55_0.session.currentIkStatus, "Missing current IK status when enter stocking IK mode")

	arg_55_0.session.stockingCachedIkStatus = arg_55_0.session.currentIkStatus

	arg_55_0:ExitIK(arg_55_1, {
		ignoreResetExtraItem = true
	})
end

function var_0_0.ExitStockingIKMode(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:GetCurrentLadyEnv()

	assert(var_56_0, "Missing LadyEnv when exit stocking IK mode")
	assert(arg_56_0.modeState == var_0_0.MODE_STATE.IDLE, "Exit stocking mode requires idle IK")

	local var_56_1 = arg_56_0.session.stockingCachedIkStatus

	assert(var_56_1, "Missing cached IK status when exit stocking IK mode")

	arg_56_0.session.stockingCachedIkStatus = nil

	arg_56_0:EnterIK(var_56_1, arg_56_1)
end

function var_0_0.EnterAimIKMode(arg_57_0, arg_57_1)
	assert(arg_57_0.modeState == var_0_0.MODE_STATE.ACTIVE, "Touch AimIK mode requires active IK")
	assert(arg_57_0.session.currentIkStatus, "Missing current IK status when enter touch AimIK mode")
	assert(not arg_57_0.session.aimIKCachedIkStatus, "Touch AimIK mode is already active")

	arg_57_0.session.aimIKCachedIkStatus = arg_57_0.session.currentIkStatus

	arg_57_0:ExitIK(arg_57_1, {
		ignoreResetExtraItem = true
	})
end

function var_0_0.ExitAimIKMode(arg_58_0, arg_58_1)
	assert(arg_58_0.modeState == var_0_0.MODE_STATE.IDLE, "Exit touch AimIK mode requires idle IK")

	local var_58_0 = arg_58_0.session.aimIKCachedIkStatus

	assert(var_58_0, "Missing cached IK status when exit touch AimIK mode")

	arg_58_0.session.aimIKCachedIkStatus = nil

	arg_58_0:EnterIK(var_58_0, arg_58_1)
end

function var_0_0.GetSession(arg_59_0)
	return arg_59_0.session
end

function var_0_0.CancelControlInput(arg_60_0)
	if arg_60_0.input then
		arg_60_0.input:Cancel()
	end
end

function var_0_0.BeginIKBodyDrag(arg_61_0, arg_61_1, arg_61_2)
	if not arg_61_0:CanHandleIKInput() then
		return
	end

	if arg_61_0.session:IsBlocked() or arg_61_0.session.ikHandler then
		return
	end

	arg_61_0.driver:BeginDrag(arg_61_1, arg_61_2)
end

function var_0_0.DragIKBody(arg_62_0, arg_62_1)
	if not arg_62_0:CanHandleIKInput() then
		return
	end

	if not arg_62_0.session.ikHandler then
		return
	end

	arg_62_0.driver:Drag(arg_62_1)
end

function var_0_0.ReleaseIKBody(arg_63_0)
	arg_63_0.driver:Release()
end

function var_0_0.OnControlPointerDown(arg_64_0, arg_64_1)
	arg_64_0.input:OnControlPointerDown(arg_64_1)
end

function var_0_0.OnControlPointerUp(arg_65_0, arg_65_1)
	arg_65_0.input:OnControlPointerUp(arg_65_1)
end

function var_0_0.OnControlBeginDrag(arg_66_0, arg_66_1)
	arg_66_0.input:OnControlBeginDrag(arg_66_1)
end

function var_0_0.OnControlDrag(arg_67_0, arg_67_1, arg_67_2)
	arg_67_0.input:OnControlDrag(arg_67_1, arg_67_2)
end

function var_0_0.OnControlEndDrag(arg_68_0, arg_68_1)
	arg_68_0.input:OnControlEndDrag(arg_68_1)
end

function var_0_0.GetIKRaycastTargets(arg_69_0, arg_69_1)
	return arg_69_0.input:GetIKRaycastTargets(arg_69_1)
end

function var_0_0.ResolveBodyTarget(arg_70_0, arg_70_1)
	return arg_70_0.input:ResolveBodyTarget(arg_70_1)
end

function var_0_0.ResolveTouchTarget(arg_71_0, arg_71_1)
	return arg_71_0.input:ResolveTouchTarget(arg_71_1)
end

function var_0_0.ResolveTouchSceneItem(arg_72_0, arg_72_1)
	return arg_72_0.input:ResolveTouchSceneItem(arg_72_1)
end

function var_0_0.IsTransformInHierarchy(arg_73_0, arg_73_1)
	return RoomIKInput.IsTransformInHierarchy(arg_73_0, arg_73_1)
end

function var_0_0.EmitTouchPress(arg_74_0, arg_74_1, arg_74_2, arg_74_3)
	arg_74_0.input:EmitTouchPress(arg_74_1, arg_74_2, arg_74_3)
end

function var_0_0.OnIKLayerActive(arg_75_0, arg_75_1)
	arg_75_0.session.ikHandler = arg_75_1

	local var_75_0 = _.detect(arg_75_0.session.readyIKLayers or {}, function(arg_76_0)
		return arg_76_0:GetControllerPath() == arg_75_1.ikData:GetControllerPath()
	end)

	if not var_75_0 then
		return
	end

	arg_75_0.session:AcquireBlock("drag")
	arg_75_0:EnableIKLayer(var_75_0)

	arg_75_0.session.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	arg_75_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_75_0:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
end

function var_0_0.OnIKLayerDrag(arg_77_0, arg_77_1)
	arg_77_0.session.ikHandler = arg_77_1

	arg_77_0:ResetIKTipTimer()
end

function var_0_0.OnIKLayerDeactive(arg_78_0, arg_78_1, arg_78_2)
	local var_78_0 = _.detect(arg_78_0.session.readyIKLayers or {}, function(arg_79_0)
		return arg_79_0:GetControllerPath() == arg_78_1.ikData:GetControllerPath()
	end)

	if not var_78_0 then
		return
	end

	arg_78_0:DeactiveIKLayer(var_78_0)

	arg_78_0.session.ikHandler = nil

	arg_78_0.session:ReleaseBlock("drag")

	if arg_78_2 then
		arg_78_0.session:AcquireBlock("trigger")
	end

	arg_78_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_78_0:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
end

function var_0_0.OnIKLayerAction(arg_80_0, arg_80_1)
	arg_80_0.session:ReleaseBlock("trigger")

	local var_80_0 = _.detect(arg_80_0.session.readyIKLayers or {}, function(arg_81_0)
		return arg_81_0:GetControllerPath() == arg_80_1.ikData:GetControllerPath()
	end)

	if not var_80_0 then
		return
	end

	arg_80_0:OnTriggerIK(var_80_0)
	arg_80_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_80_0:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
end

function var_0_0.GetDriverCallbacks(arg_82_0)
	return {
		active = function(arg_83_0)
			arg_82_0:OnIKLayerActive(arg_83_0)
		end,
		drag = function(arg_84_0)
			arg_82_0:OnIKLayerDrag(arg_84_0)
		end,
		deactive = function(arg_85_0, arg_85_1)
			arg_82_0:OnIKLayerDeactive(arg_85_0, arg_85_1)
		end,
		action = function(arg_86_0)
			arg_82_0:OnIKLayerAction(arg_86_0)
		end
	}
end

function var_0_0.ValidateIKSpec(arg_87_0, arg_87_1)
	return arg_87_0.sessionBuilder:ValidateSpec(arg_87_1)
end

function var_0_0.ActivateIKSession(arg_88_0, arg_88_1, arg_88_2)
	assert(arg_88_1 and arg_88_1.validated, "RoomIK session spec must be validated before activation")

	if not arg_88_1.raycaster then
		arg_88_1.raycaster = GetOrAddComponent(arg_88_1.raycastCameraTF, typeof(UnityEngine.EventSystems.PhysicsRaycaster))

		assert(arg_88_1.raycaster, "Missing RoomIK raycaster")
	end

	local var_88_0 = arg_88_0.session:Start(arg_88_1.mode)

	arg_88_0.session:ApplySpec(arg_88_1)

	arg_88_0.session.enableIKTip = true

	arg_88_0:ResetIKTipTimer()
	arg_88_0:CancelControlInput()
	existCall(arg_88_2, arg_88_1)
	arg_88_0:Emit(RoomTouchSystem.CANCEL_TOUCH_PRESS)

	if arg_88_1.mode == "normal" then
		arg_88_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, arg_88_0.session.ikTouchDatas, arg_88_1.statusId)
	else
		arg_88_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, nil)
	end

	arg_88_0.driver:Attach(arg_88_0.session, arg_88_0:GetDriverCallbacks())
	arg_88_0:Emit(Dorm3dIKView.UPDATE_TEXT_TIPS, RoomIKTipBuilder.BuildTextTips(arg_88_0.session.readyIKLayers))

	return var_88_0
end

function var_0_0.SetIKStatus(arg_89_0, arg_89_1, arg_89_2, arg_89_3, arg_89_4, arg_89_5, arg_89_6, arg_89_7)
	warning("Set IKStatus " .. (arg_89_2.id or "NIL"))

	if not arg_89_7 then
		arg_89_7 = arg_89_0.sessionBuilder:BuildNormal(arg_89_1, arg_89_2, function(arg_90_0)
			arg_89_0:OnNormalIKLayerAction(arg_90_0)
		end)

		arg_89_0:ValidateIKSpec(arg_89_7)
	end

	local var_89_0 = arg_89_0:GetCameras()
	local var_89_1 = Dorm3dRoomTemplateScene.CAMERA.IK_WATCH
	local var_89_2 = arg_89_0:ActivateIKSession(arg_89_7, function()
		setActive(arg_89_1.ladyCollider, false)
		_.each(arg_89_1.ladyTouchColliders, function(arg_92_0)
			setActive(arg_92_0, true)
		end)
		_.each(arg_89_7.sceneItems, function(arg_93_0)
			if IsNil(GetComponent(arg_93_0.target, typeof(UnityEngine.Collider))) then
				go(arg_93_0.target):AddComponent(typeof(UnityEngine.BoxCollider))
			end
		end)
	end)

	if var_89_0[var_89_1] then
		setActive(var_89_0[var_89_1], false)

		var_89_0[var_89_1] = nil
	end

	var_89_0[var_89_1] = arg_89_7.ikCameraTF

	arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_ACTIVE_CAMERA, var_89_0[var_89_1])

	local var_89_3 = arg_89_7.ikCameraTF:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_89_3 then
		arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REGISTER_ORBITS, var_89_3)
	else
		arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REVERT_CAMERA_ORBIT)
	end

	arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SWITCH_ANIM, arg_89_1, arg_89_2.character_action, nil, true)
	arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_HEAD_AIM_IK, arg_89_1, arg_89_2.head_track)
	arg_89_1:EnableCloth(false)
	arg_89_1:EnableCloth(arg_89_2.use_cloth, arg_89_2.cloth_colliders)
	arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_SCENE_ANIM, arg_89_2.enter_scene_anim, true)
	arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_EXTRA_ITEM, arg_89_1, arg_89_2.enter_extra_item, true)
	arg_89_0:Emit(Dorm3dRoomTemplateScene.EXTRA_HIDE_SCENE_ITEM, arg_89_2.hide_scene_item)
	onNextTick(function()
		if not arg_89_0.session:IsCurrent(var_89_2) then
			return
		end

		if arg_89_5 and not arg_89_0:IsIKTransitionActive(arg_89_5, arg_89_6) then
			return
		end

		arg_89_1.lady.position = arg_89_7.stayPoint.position
		arg_89_1.lady.rotation = arg_89_7.stayPoint.rotation

		existCall(arg_89_3)
	end)
end

function var_0_0.ClearIKStatusRuntime(arg_95_0, arg_95_1, arg_95_2)
	arg_95_2 = arg_95_2 or {}
	arg_95_0.session.enableIKTip = false

	arg_95_0:CancelControlInput()
	setActive(arg_95_1.ladyCollider, true)
	_.each(arg_95_1.ladyTouchColliders, function(arg_96_0)
		setActive(arg_96_0, false)
	end)
	arg_95_0.session:ClearBlocks()
	arg_95_0.driver:Detach()

	arg_95_0.session.ikHandler = nil

	arg_95_0:Emit(Dorm3dIKView.SET_TIPS_ACTIVE, false)
	arg_95_0:Emit(RoomTouchSystem.CANCEL_TOUCH_PRESS)
	arg_95_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, nil)
	arg_95_0.session:ClearRuntime()
	arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REVERT_CAMERA_ORBIT)

	local var_95_0 = arg_95_0:GetCameras()[Dorm3dRoomTemplateScene.CAMERA.IK_WATCH]

	if var_95_0 then
		setActive(var_95_0, false)

		arg_95_0:GetCameras()[Dorm3dRoomTemplateScene.CAMERA.IK_WATCH] = nil
	end

	arg_95_1:EnableCloth(false)
	arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_HEAD_AIM_IK, arg_95_1)
	arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_SCENE_ITEM_ANIMATORS)

	if not arg_95_2.ignoreResetExtraItem then
		arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_CHARACTER_EXTRA_ITEM)
		arg_95_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_TEMP_HIDE_SCENE_ITEMS)
	end
end

function var_0_0.ClearIKRuntime(arg_97_0, arg_97_1, arg_97_2)
	arg_97_2 = arg_97_2 or {}

	if arg_97_0.session.ikSwitchSkinId then
		local var_97_0 = arg_97_0:GetApartment():GetConfigID()

		arg_97_1:SwitchCharacterSkin(var_97_0, arg_97_0.session.ikSwitchSkinId)

		arg_97_0.session.ikSwitchSkinId = nil
	end

	arg_97_0:ClearIKStatusRuntime(arg_97_1, arg_97_2)
end

function var_0_0.BuildIKReturnInfo(arg_98_0, arg_98_1)
	assert(type(arg_98_1) == "table", "Invalid IK return info")
	assert(type(arg_98_1.character_action) == "string", "Invalid IK return character_action")
	assert(arg_98_1.character_position == nil or type(arg_98_1.character_position) == "string" and arg_98_1.character_position ~= "", "Invalid IK return character_position")

	local var_98_0 = arg_98_1.character_position or arg_98_0:GetLadyBaseZone(arg_98_0:GetApartment():GetConfigID())

	assert(type(var_98_0) == "string" and var_98_0 ~= "", "Invalid IK return character_position")

	local var_98_1 = arg_98_0:GetIKPointByName(var_98_0) or arg_98_0:GetZoneByName(var_98_0)

	assert(var_98_1 and var_98_1:Find("StayPoint"), "Missing IK return character position: " .. var_98_0)

	return {
		character_position = var_98_0,
		character_action = arg_98_1.character_action
	}
end

function var_0_0.ApplyIKReturn(arg_99_0, arg_99_1, arg_99_2, arg_99_3, arg_99_4)
	arg_99_3 = arg_99_0:WrapCallbackOnce(arg_99_3)

	arg_99_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SWITCH_ANIM, arg_99_1, arg_99_2.character_action)
	onNextTick(function()
		if arg_99_4 and not arg_99_0:IsIKTransitionActive(arg_99_4, var_0_0.MODE_STATE.EXITING) then
			return
		end

		arg_99_0:Emit(Dorm3dRoomTemplateScene.EXTRA_CHANGE_CHARACTER_POSITION, arg_99_1, arg_99_2.character_position)
		arg_99_0:Emit(Dorm3dRoomTemplateScene.EXTRA_TRIGGER_LADY_DISTANCE)
		arg_99_0:Emit(Dorm3dRoomTemplateScene.EXTRA_CHECK_IN_SECTOR)
		existCall(arg_99_3)
	end)
end

function var_0_0.SaveIKTimelineColliderState(arg_101_0, arg_101_1)
	arg_101_0.session.ikTimelineColliderStates = arg_101_0.session.ikTimelineColliderStates or {}

	if arg_101_0.session.ikTimelineColliderStates[arg_101_1] == nil then
		arg_101_0.session.ikTimelineColliderStates[arg_101_1] = isActive(arg_101_1)
	end
end

function var_0_0.SetIKTimelineColliderActive(arg_102_0, arg_102_1, arg_102_2)
	arg_102_0:SaveIKTimelineColliderState(arg_102_1)
	setActive(arg_102_1, arg_102_2)
end

function var_0_0.RestoreIKTimelineColliders(arg_103_0)
	if not arg_103_0.session.ikTimelineColliderStates then
		return
	end

	for iter_103_0, iter_103_1 in pairs(arg_103_0.session.ikTimelineColliderStates) do
		if iter_103_0 and not IsNil(iter_103_0) then
			setActive(iter_103_0, iter_103_1)
		end
	end

	arg_103_0.session.ikTimelineColliderStates = nil
end

function var_0_0.ClearIKTimelineRuntime(arg_104_0)
	if not arg_104_0:IsInIKTimelineMode() and not arg_104_0.session.ikTimelineColliderStates then
		return
	end

	arg_104_0:SetCurrentIkTimelineStatus(nil)

	arg_104_0.session.enableIKTip = false

	arg_104_0:CancelControlInput()
	arg_104_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, false)
	arg_104_0.session:ClearBlocks()
	arg_104_0.driver:Detach()
	arg_104_0.session:ClearRuntime()
	arg_104_0:RestoreIKTimelineColliders()
	arg_104_0:Emit(RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA, nil)
	arg_104_0:Emit(Dorm3dIKView.SET_TIPS_ACTIVE, false)
end

function var_0_0.SetIKTimelineStatus(arg_105_0, arg_105_1, arg_105_2, arg_105_3, arg_105_4)
	arg_105_4 = arg_105_0:WrapCallbackOnce(arg_105_4)

	if not arg_105_0:CheckIkTimelineStatus(arg_105_2) then
		existCall(arg_105_4)

		return
	end

	local var_105_0 = arg_105_0.sessionBuilder:BuildTimeline(arg_105_1, arg_105_2, arg_105_3, function(arg_106_0)
		arg_105_0:OnTimelineIKLayerAction(arg_106_0)
	end)

	arg_105_0:ValidateIKSpec(var_105_0)

	if arg_105_0:IsInIKTimelineMode() then
		arg_105_0:ClearIKTimelineRuntime()
	else
		assert(arg_105_0.modeState == var_0_0.MODE_STATE.IDLE, string.format("Cannot enter timeline IK from state: %s", tostring(arg_105_0.modeState)))
	end

	warning("Set IKStatus " .. (arg_105_2 or "NIL"))
	arg_105_0:ActivateIKSession(var_105_0, function()
		_.each(var_105_0.colliderChanges, function(arg_108_0)
			arg_105_0:SetIKTimelineColliderActive(arg_108_0.target, arg_108_0.active)
		end)
	end)
	arg_105_0:Emit(Dorm3dIKView.SET_CONTROL_ACTIVE, true)
	existCall(arg_105_4)
end

function var_0_0.ExitIKTimelineStatus(arg_109_0, arg_109_1)
	arg_109_1 = arg_109_0:WrapCallbackOnce(arg_109_1)

	if not arg_109_0:IsInIKTimelineMode() then
		existCall(arg_109_1)

		return
	end

	arg_109_0:ClearIKTimelineRuntime()
	existCall(arg_109_1)
end

function var_0_0.SetCurrentIkTimelineStatus(arg_110_0, arg_110_1)
	arg_110_0.session.currentIkTimelineStatus = arg_110_1
end

function var_0_0.CheckIkTimelineStatus(arg_111_0, arg_111_1)
	if not arg_111_0.session.currentIkTimelineStatus then
		return true
	end

	return arg_111_0.session.currentIkTimelineStatus ~= arg_111_1
end

function var_0_0.IsInIKTimelineMode(arg_112_0)
	return arg_112_0.session.mode == "timeline"
end

function var_0_0.IsIKModeActive(arg_113_0)
	return arg_113_0.modeState == var_0_0.MODE_STATE.ACTIVE
end

function var_0_0.CanHandleIKInput(arg_114_0)
	return arg_114_0:IsIKModeActive() or arg_114_0:IsInIKTimelineMode()
end

function var_0_0.EnableIKLayer(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_0:GetCurrentLadyEnv()

	if #arg_115_1:GetHeadTrackPath() > 0 then
		arg_115_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_HEAD_AIM_IK, var_115_0, {
			2,
			arg_115_1:GetHeadTrackPath()
		}, true)
	end

	local var_115_1 = arg_115_1:GetTriggerFaceAnim()

	if #var_115_1 > 0 then
		arg_115_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_FACE_ANIM, var_115_0, var_115_1)
	end

	if not arg_115_1.ignoreDrag then
		arg_115_0:Emit(Dorm3dIKView.PLAY_HAND_BEGIN)
	end

	if not arg_115_0:IsInIKTimelineMode() then
		local var_115_2 = arg_115_0.session.currentIkConfig

		assert(var_115_2, "Missing current IK config")
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_115_0:GetApartment().configId, arg_115_0:GetApartment().level, var_115_2.character_action, arg_115_1:GetTriggerParams()[2], arg_115_0:GetRoom():GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_0:GetCurrentLadyEnv()

	if not arg_116_0:IsInIKTimelineMode() and #arg_116_1:GetHeadTrackPath() > 0 then
		local var_116_1 = arg_116_0.session.currentIkConfig

		assert(var_116_1, "Missing current IK config")
		arg_116_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_HEAD_AIM_IK, var_116_0, var_116_1.head_track)
	end

	if not arg_116_1.ignoreDrag then
		arg_116_0:Emit(Dorm3dIKView.PLAY_HAND_END)
	end
end

function var_0_0.ResetIKTipTimer(arg_117_0)
	if not arg_117_0.session.enableIKTip then
		return
	end

	arg_117_0.session.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.PlayTouchIKMove(arg_118_0, arg_118_1, arg_118_2, arg_118_3, arg_118_4, arg_118_5)
	arg_118_5 = arg_118_0:WrapCallbackOnce(arg_118_5)

	assert(arg_118_0:IsIKModeActive(), "Touch IK move requires active IK")
	assert(type(arg_118_2) == "table" and #arg_118_2 == 2, "Invalid touch IK move point: " .. tostring(arg_118_1))
	assert(type(arg_118_3) == "number", "Invalid touch IK move step: " .. tostring(arg_118_1))
	assert(type(arg_118_4) == "number", "Invalid touch IK move time: " .. tostring(arg_118_1))

	local var_118_0 = arg_118_0.session.ikSettings

	assert(var_118_0, "Missing IK settings when play touch IK move")

	local var_118_1 = var_118_0.Colliders

	assert(var_118_1, "Missing IK colliders when play touch IK move")

	local var_118_2 = Dorm3dIK.New({
		configId = arg_118_1
	}):GetTriggerBoneName()
	local var_118_3 = var_118_1[var_118_2]

	assert(var_118_3, "Missing IK collider: " .. tostring(var_118_2))

	local var_118_4 = arg_118_0:GetRaycastCamera():WorldToScreenPoint(var_118_3.position)

	arg_118_0.driver:Reset(var_118_2)
	arg_118_0.driver:PlayMove(var_118_4, var_118_2, Vector2.New(unpack(arg_118_2)), arg_118_3, arg_118_4, arg_118_5)
end

function var_0_0.OnNormalIKLayerAction(arg_119_0, arg_119_1)
	if not arg_119_0:IsIKModeActive() then
		return
	end

	if not arg_119_0.session.currentIkConfig then
		return
	end

	local var_119_0 = arg_119_0:GetCurrentLadyEnv()
	local var_119_1 = arg_119_1:GetControllerPath()
	local var_119_2 = arg_119_0.session.ikActionDict[var_119_1]

	if not var_119_2 then
		return
	end

	arg_119_0.session:AcquireBlock("layer_action")

	local var_119_3 = arg_119_0:WrapCallbackOnce(function()
		arg_119_0:ResetIKTipTimer()
		arg_119_0.session:ReleaseBlock("layer_action")
	end)

	arg_119_0:Emit(var_0_0.ON_IK_LAYER_ACTION, var_119_0, arg_119_1:GetConfigID(), var_119_2, var_119_3)
end

function var_0_0.OnTimelineIKLayerAction(arg_121_0, arg_121_1)
	if not arg_121_0:IsInIKTimelineMode() then
		return
	end

	arg_121_0:ExitIKTimelineStatus()

	local var_121_0 = arg_121_1:GetTimelineAction()

	if var_121_0 then
		arg_121_0:GetNowTimelinePlayer():TriggerEvent(var_121_0)
	end
end

function var_0_0.OnTriggerIK(arg_122_0, arg_122_1)
	if not arg_122_0:CanHandleIKInput() then
		return
	end

	local var_122_0 = arg_122_0.session.spec

	if not var_122_0 or not var_122_0.onLayerAction then
		return
	end

	var_122_0.onLayerAction(arg_122_1)
end

function var_0_0.UpdateIKTarget(arg_123_0)
	if not arg_123_0:CanHandleIKInput() then
		return
	end

	if not arg_123_0:GetApartment() then
		return
	end

	if not arg_123_0:GetCurrentLadyEnv() then
		return
	end

	if arg_123_0.session.ikHandler then
		if not arg_123_0.session.readyIKLayers then
			return
		end

		local var_123_0 = arg_123_0.session.ikHandler.screenPosition
		local var_123_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
		local var_123_2 = var_123_0 - Vector2.New(var_123_1.width, var_123_1.height) * 0.5

		arg_123_0:Emit(Dorm3dIKView.SET_HAND_POSITION, var_123_2)

		if Time.time > arg_123_0.session.ikNextCheckStamp then
			arg_123_0.session.ikNextCheckStamp = arg_123_0.session.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

			local var_123_3 = _.detect(arg_123_0.session.readyIKLayers, function(arg_124_0)
				return arg_124_0:GetControllerPath() == arg_123_0.session.ikHandler.ikData:GetControllerPath()
			end)

			arg_123_0:Emit(var_0_0.ON_IK_STATUS_CHANGED, var_123_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
		end
	end

	if arg_123_0.session.enableIKTip then
		if not arg_123_0.session.readyIKLayers or not arg_123_0.session.ikSettings then
			return
		end

		arg_123_0:UpdateIKTips()
	end
end

function var_0_0.UpdateIKTips(arg_125_0)
	if not arg_125_0.session.nextTipIKTime then
		return
	end

	local var_125_0 = not arg_125_0.session:IsBlocked() and Time.time > arg_125_0.session.nextTipIKTime

	local function var_125_1(arg_126_0)
		local var_126_0 = {}

		arg_125_0:Emit(Dorm3dRoomTemplateScene.EXTRA_GET_SCREEN_POSITION, var_126_0, arg_126_0, arg_125_0.session.ikSettings.CameraRaycaster.eventCamera)

		return var_126_0.value
	end

	local function var_125_2(arg_127_0)
		return arg_125_0:GetSceneItem(arg_127_0)
	end

	arg_125_0:Emit(Dorm3dIKView.UPDATE_TIPS, var_125_0, RoomIKTipBuilder.BuildIKTips(arg_125_0.session.readyIKLayers, arg_125_0.session.ikSettings, var_125_1), RoomIKTipBuilder.BuildTouchTips(arg_125_0.session.ikTouchDatas, pg.dorm3d_ik_touch, arg_125_0.session.ikSettings, var_125_2, var_125_1))
end

function var_0_0.CycleIKCameraGroup(arg_128_0)
	local var_128_0 = arg_128_0:GetCurrentLadyEnv()

	assert(var_128_0, "Missing LadyEnv when cycle IK camera group")
	assert(arg_128_0:IsIKModeActive(), "Cycle IK camera group requires active IK")
	arg_128_0.driver:ResetActiveLayers()

	local var_128_1 = arg_128_0.session.currentIkConfig

	assert(var_128_1, "Missing current IK config")

	local var_128_2 = var_128_1.camera_group
	local var_128_3 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_128_2]
	local var_128_4 = var_128_3[table.indexof(var_128_3, var_128_1.id) % #var_128_3 + 1]

	arg_128_0:ReplaceIKStatus(var_128_4)
end

function var_0_0.SetIKSwitchSkinId(arg_129_0, arg_129_1)
	arg_129_0.session.ikSwitchSkinId = arg_129_1
end

function var_0_0.SwitchIKSkin(arg_130_0, arg_130_1, arg_130_2, arg_130_3)
	assert(arg_130_0:IsIKModeActive(), "Switch IK skin requires active IK")

	local var_130_0 = arg_130_0.session.currentIkConfig

	assert(var_130_0, "Missing current IK config")

	local var_130_1 = var_130_0.id

	seriesAsync({
		function(arg_131_0)
			arg_130_0:ExitIK(arg_131_0)
		end,
		function(arg_132_0)
			arg_130_1:SwitchCharacterSkin(arg_130_2, arg_130_3)
			arg_130_0:EnterIK(var_130_1, arg_132_0)
		end
	})
end

function var_0_0.ConsumeIKSpecialCall(arg_133_0)
	if not arg_133_0.session.ikSpecialCall then
		return false
	end

	local var_133_0 = arg_133_0.session.ikSpecialCall

	arg_133_0.session.ikSpecialCall = nil

	existCall(var_133_0)

	return true
end

return var_0_0

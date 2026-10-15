local var_0_0 = class("RoomTouchSystem", import("view.dorm3d.Core.BaseSystem"))
local var_0_1 = import("view.dorm3d.System.RoomTouch.RoomTouchTriggerRunner")

var_0_0.ENTER_TOUCH_MODE = "RoomTouchSystem.ENTER_TOUCH_MODE"
var_0_0.EXIT_TOUCH_MODE = "RoomTouchSystem.EXIT_TOUCH_MODE"
var_0_0.EXIT_HEARTBEAT_MODE = "RoomTouchSystem.EXIT_HEARTBEAT_MODE"
var_0_0.ON_TOUCH_CHARACTER_DOWN = "RoomTouchSystem.ON_TOUCH_CHARACTER_DOWN"
var_0_0.ON_TOUCH_CHARACTER_UP = "RoomTouchSystem.ON_TOUCH_CHARACTER_UP"
var_0_0.ON_TOUCH_SCENE_ITEM_DOWN = "RoomTouchSystem.ON_TOUCH_SCENE_ITEM_DOWN"
var_0_0.ON_TOUCH_SCENE_ITEM_UP = "RoomTouchSystem.ON_TOUCH_SCENE_ITEM_UP"
var_0_0.CANCEL_TOUCH_PRESS = "RoomTouchSystem.CANCEL_TOUCH_PRESS"
var_0_0.SET_ACTIVE_IK_TOUCH_DATA = "RoomTouchSystem.SET_ACTIVE_IK_TOUCH_DATA"
var_0_0.UPDATE_TOUCH_PANEL = "RoomTouchSystem.UPDATE_TOUCH_PANEL"
var_0_0.UPDATE_TOUCH_COUNT = "RoomTouchSystem.UPDATE_TOUCH_COUNT"
var_0_0.UPDATE_TOUCH_LEVEL = "RoomTouchSystem.UPDATE_TOUCH_LEVEL"
var_0_0.UPDATE_TOUCH_DISPLAY = "RoomTouchSystem.UPDATE_TOUCH_DISPLAY"
var_0_0.GET_TOUCH_GAME_STATE = "RoomTouchSystem.GET_TOUCH_GAME_STATE"
var_0_0.SET_TOUCH_EXIT_CALL = "RoomTouchSystem.SET_TOUCH_EXIT_CALL"
var_0_0.TRIGGER_CLICK = var_0_1.TRIGGER_CLICK
var_0_0.TRIGGER_LONG_PRESS = var_0_1.TRIGGER_LONG_PRESS
var_0_0.MODE_STATE = {
	IDLE = "idle",
	ENTERING = "entering",
	EXITING = "exiting",
	ACTIVE = "active"
}

function var_0_0.OnInit(arg_1_0)
	arg_1_0.modeState = var_0_0.MODE_STATE.IDLE
	arg_1_0.transitionSerial = 0
	arg_1_0.touchTriggerRunner = var_0_1.New(arg_1_0)
	arg_1_0.activeIkTouchData = nil
	arg_1_0.touchForceMove = nil
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.ENTER_TOUCH_MODE, function(arg_3_0, arg_3_1)
		arg_2_0:EnterTouchMode(arg_3_1)
	end)
	arg_2_0:Bind(var_0_0.EXIT_TOUCH_MODE, function()
		arg_2_0:ExitTouchMode()
	end)
	arg_2_0:Bind(var_0_0.EXIT_HEARTBEAT_MODE, function()
		arg_2_0:ExitHeartbeatMode()
	end)
	arg_2_0:Bind(var_0_0.ON_TOUCH_CHARACTER_DOWN, function(arg_6_0, arg_6_1, arg_6_2)
		arg_2_0.touchTriggerRunner:OnTouchPressDown("body", arg_6_1, arg_6_2)
	end)
	arg_2_0:Bind(var_0_0.ON_TOUCH_CHARACTER_UP, function(arg_7_0, arg_7_1)
		arg_2_0.touchTriggerRunner:OnTouchPressUp("body", arg_7_1)
	end)
	arg_2_0:Bind(var_0_0.ON_TOUCH_SCENE_ITEM_DOWN, function(arg_8_0, arg_8_1, arg_8_2)
		arg_2_0.touchTriggerRunner:OnTouchPressDown("scene_item", arg_8_1, arg_8_2)
	end)
	arg_2_0:Bind(var_0_0.ON_TOUCH_SCENE_ITEM_UP, function(arg_9_0, arg_9_1)
		arg_2_0.touchTriggerRunner:OnTouchPressUp("scene_item", arg_9_1)
	end)
	arg_2_0:Bind(var_0_0.CANCEL_TOUCH_PRESS, function()
		arg_2_0.touchTriggerRunner:CancelAllTouchPress()
	end)
	arg_2_0:Bind(var_0_0.SET_ACTIVE_IK_TOUCH_DATA, function(arg_11_0, arg_11_1, arg_11_2)
		arg_2_0:SetActiveIKTouchData(arg_11_1, arg_11_2)
	end)
	arg_2_0:Bind(RoomIKSystem.ON_IK_STATUS_CHANGED, function(arg_12_0, arg_12_1, arg_12_2)
		if not arg_2_0:IsTouchModeActive() then
			return
		end

		arg_2_0:DoTouch(arg_12_1, arg_12_2)
	end)
	arg_2_0:Bind(RoomIKSystem.ON_IK_LAYER_ACTION, function(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
		arg_2_0:TouchModeAction(arg_13_1, arg_13_2, unpack(arg_13_3))(arg_13_4)
	end)
	arg_2_0:Bind(var_0_0.GET_TOUCH_GAME_STATE, function(arg_14_0, arg_14_1)
		if arg_14_1 then
			arg_14_1.inTouchGame = arg_2_0.inTouchGame
		end
	end)
	arg_2_0:Bind(var_0_0.SET_TOUCH_EXIT_CALL, function(arg_15_0, arg_15_1)
		arg_2_0.touchExitCall = arg_15_1
	end)
end

function var_0_0.OnDispose(arg_16_0)
	arg_16_0.transitionSerial = arg_16_0.transitionSerial + 1

	arg_16_0.touchTriggerRunner:CancelAllTouchPress()

	arg_16_0.modeState = var_0_0.MODE_STATE.IDLE
	arg_16_0.activeIkTouchData = nil
	arg_16_0.touchForceMove = nil

	if arg_16_0.downTimer then
		arg_16_0.downTimer:Stop()

		arg_16_0.downTimer = nil
	end

	if arg_16_0.sliderLT and LeanTween.isTweening(arg_16_0.sliderLT) then
		LeanTween.cancel(arg_16_0.sliderLT)

		arg_16_0.sliderLT = nil
	end
end

function var_0_0.SetActiveIKTouchData(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 then
		arg_17_0.touchTriggerRunner:ValidateTouchConfigs(arg_17_1, arg_17_2)
	end

	arg_17_0.activeIkTouchData = arg_17_1
	arg_17_0.touchForceMove = arg_17_1 and {} or nil
end

function var_0_0.GetActiveIKTouchData(arg_18_0)
	return arg_18_0.activeIkTouchData
end

function var_0_0.IsTouchModeActive(arg_19_0)
	return arg_19_0.modeState == var_0_0.MODE_STATE.ACTIVE
end

function var_0_0.BeginTouchTransition(arg_20_0, arg_20_1)
	arg_20_0.transitionSerial = arg_20_0.transitionSerial + 1
	arg_20_0.modeState = arg_20_1

	return arg_20_0.transitionSerial
end

function var_0_0.IsTouchTransitionActive(arg_21_0, arg_21_1, arg_21_2)
	return arg_21_0.transitionSerial == arg_21_1 and arg_21_0.modeState == arg_21_2
end

function var_0_0.OnUpdate(arg_22_0)
	arg_22_0.touchTriggerRunner:Update()
end

function var_0_0.EnterTouchMode(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:GetCurrentLadyEnv()

	if arg_23_0.modeState ~= var_0_0.MODE_STATE.IDLE then
		return
	end

	local var_23_1 = arg_23_0:GetApartment():GetConfigID()

	arg_23_1 = arg_23_1 or arg_23_0:GetRoom():getApartmentZoneConfig(arg_23_0:GetLadyBaseZone(var_23_1), "touch_id", var_23_1)
	arg_23_0.touchConfig = pg.dorm3d_touch_data[arg_23_1]

	assert(arg_23_0.touchConfig, "Missing dorm3d_touch_data config: " .. tostring(arg_23_1))

	local var_23_2 = arg_23_0:BeginTouchTransition(var_0_0.MODE_STATE.ENTERING)

	arg_23_0.inTouchGame = arg_23_0.touchConfig.heartbeat_enable > 0

	arg_23_0:Emit(var_0_0.UPDATE_TOUCH_PANEL, arg_23_0.inTouchGame)

	if arg_23_0.inTouchGame then
		arg_23_0.touchCount = 0
		arg_23_0.touchLevel = 1
		arg_23_0.lastCount = 0
		arg_23_0.topCount = 0

		arg_23_0:Emit(var_0_0.UPDATE_TOUCH_DISPLAY, arg_23_0.touchLevel, arg_23_0.touchCount)

		arg_23_0.downTimer = Timer.New(function()
			if not arg_23_0:IsTouchModeActive() then
				return
			end

			local var_24_0 = pg.dorm3d_set.reduce_interaction.key_value_int

			if arg_23_0.touchLevel > 1 then
				var_24_0 = pg.dorm3d_set.reduce_heartbeat.key_value_int
			end

			arg_23_0:UpdateTouchCount(var_24_0)
		end, 1, -1)

		arg_23_0.downTimer:Start()
	end

	local var_23_3 = {}

	table.insert(var_23_3, function(arg_25_0)
		if not arg_23_0:IsTouchTransitionActive(var_23_2, var_0_0.MODE_STATE.ENTERING) then
			return
		end

		arg_23_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_BLACKBOARD_VALUE, var_23_0, "inTouching", true)
		arg_23_0:Emit(Dorm3dRoomTemplateScene.SHOW_BLOCK)
		arg_23_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, arg_25_0, "blank")
	end)
	table.insert(var_23_3, function(arg_26_0)
		if not arg_23_0:IsTouchTransitionActive(var_23_2, var_0_0.MODE_STATE.ENTERING) then
			return
		end

		local var_26_0 = arg_23_0.touchConfig.ik_status[1]

		arg_23_0:Emit(RoomIKSystem.ENTER_IK, var_26_0, arg_26_0)
	end)
	table.insert(var_23_3, function(arg_27_0)
		if not arg_23_0:IsTouchTransitionActive(var_23_2, var_0_0.MODE_STATE.ENTERING) then
			return
		end

		existCall(arg_27_0)
	end)
	seriesAsync(var_23_3, function()
		if not arg_23_0:IsTouchTransitionActive(var_23_2, var_0_0.MODE_STATE.ENTERING) then
			return
		end

		arg_23_0.modeState = var_0_0.MODE_STATE.ACTIVE

		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_23_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_29_0)
	local var_29_0 = arg_29_0:GetCurrentLadyEnv()

	if arg_29_0.modeState ~= var_0_0.MODE_STATE.ACTIVE then
		return
	end

	local var_29_1 = arg_29_0:BeginTouchTransition(var_0_0.MODE_STATE.EXITING)
	local var_29_2 = {}

	arg_29_0.touchTriggerRunner:CancelAllTouchPress()
	table.insert(var_29_2, function(arg_30_0)
		if not arg_29_0:IsTouchTransitionActive(var_29_1, var_0_0.MODE_STATE.EXITING) then
			return
		end

		arg_29_0:Emit(AimIKSystem.ON_EXIT_TOUCH_MODE, arg_30_0)
	end)

	if arg_29_0.inTouchGame then
		table.insert(var_29_2, function(arg_31_0)
			if not arg_29_0:IsTouchTransitionActive(var_29_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_29_0:Emit(Dorm3dRoomTemplateScene.SHOW_BLOCK)
			arg_29_0:Emit(var_0_0.UPDATE_TOUCH_PANEL, false, true, arg_31_0)
		end)
		table.insert(var_29_2, function(arg_32_0)
			if not arg_29_0:IsTouchTransitionActive(var_29_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			local var_32_0 = 0

			for iter_32_0, iter_32_1 in ipairs(arg_29_0.touchConfig.heartbeat_favor) do
				if iter_32_1[1] > arg_29_0.topCount then
					break
				else
					var_32_0 = iter_32_1[2]
				end
			end

			if var_32_0 > 0 then
				arg_29_0:Emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_29_0:GetApartment().configId, var_32_0)
			end

			arg_29_0.touchCount = nil
			arg_29_0.touchLevel = nil
			arg_29_0.topCount = nil

			if arg_29_0.downTimer then
				arg_29_0.downTimer:Stop()

				arg_29_0.downTimer = nil
			end

			arg_29_0.inTouchGame = false

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_32_0()
		end)
	else
		table.insert(var_29_2, function(arg_33_0)
			if not arg_29_0:IsTouchTransitionActive(var_29_1, var_0_0.MODE_STATE.EXITING) then
				return
			end

			arg_29_0:Emit(Dorm3dRoomTemplateScene.SHOW_BLOCK)

			local var_33_0 = arg_29_0.touchConfig.default_favor

			if var_33_0 > 0 then
				arg_29_0:Emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_29_0:GetApartment().configId, var_33_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_33_0()
		end)
	end

	table.insert(var_29_2, function(arg_34_0)
		if not arg_29_0:IsTouchTransitionActive(var_29_1, var_0_0.MODE_STATE.EXITING) then
			return
		end

		local var_34_0 = {
			character_position = arg_29_0:GetLadyBaseZone(arg_29_0:GetApartment():GetConfigID()),
			character_action = arg_29_0.touchConfig.finish_action
		}

		arg_29_0:Emit(Dorm3dStockingMgr.ON_EXIT_TOUCH_MODE)
		arg_29_0:Emit(RoomIKSystem.EXIT_IK_WITH_RETURN, var_34_0, arg_34_0)
	end)
	table.insert(var_29_2, function(arg_35_0)
		if not arg_29_0:IsTouchTransitionActive(var_29_1, var_0_0.MODE_STATE.EXITING) then
			return
		end

		arg_29_0:Emit(RoomIKSystem.SET_IK_SPECIAL_CALL, nil)
		arg_29_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, arg_35_0, "back")
	end)
	seriesAsync(var_29_2, function()
		if not arg_29_0:IsTouchTransitionActive(var_29_1, var_0_0.MODE_STATE.EXITING) then
			return
		end

		arg_29_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SET_BLACKBOARD_VALUE, var_29_0, "inTouching", false)
		arg_29_0:Emit(Dorm3dRoomTemplateScene.HIDE_BLOCK)

		arg_29_0.touchConfig = nil

		local var_36_0 = arg_29_0.touchExitCall

		arg_29_0.touchExitCall = nil
		arg_29_0.modeState = var_0_0.MODE_STATE.IDLE

		existCall(var_36_0)
	end)
end

function var_0_0.TouchModeAction(arg_37_0, arg_37_1, arg_37_2, arg_37_3, ...)
	return switch(arg_37_3, {
		function(arg_38_0, arg_38_1)
			return function(arg_39_0)
				seriesAsync({
					function(arg_40_0)
						if not arg_38_1 or arg_38_1 == "" then
							return arg_40_0()
						end

						arg_37_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_SINGLE_ACTION, arg_37_1, arg_38_1, arg_40_0)
					end,
					function(arg_41_0)
						arg_37_0:Emit(RoomIKSystem.REPLACE_IK_STATUS, arg_38_0, arg_41_0)
					end,
					arg_39_0
				})
			end
		end,
		function()
			return function()
				local var_43_0 = {}

				arg_37_0:Emit(RoomIKSystem.CONSUME_IK_SPECIAL_CALL, var_43_0)

				if var_43_0.consumed then
					return
				end

				arg_37_0:ExitTouchMode()
			end
		end,
		function(arg_44_0, arg_44_1)
			return function(arg_45_0)
				arg_37_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_SINGLE_ACTION, arg_37_1, arg_44_1, arg_45_0)
			end
		end,
		function(arg_46_0, arg_46_1, arg_46_2)
			return function(arg_47_0)
				seriesAsync({
					function(arg_48_0)
						arg_37_0:Emit(Dorm3dRoomScene.EXTRA_DO_TALK, arg_46_1, arg_48_0)
					end,
					function(arg_49_0)
						if not arg_46_2 or arg_46_2 == 0 then
							return arg_49_0()
						end

						arg_37_0:Emit(RoomIKSystem.REPLACE_IK_STATUS, arg_46_2, arg_49_0)
					end,
					arg_47_0
				})
			end
		end,
		function(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
			return function(arg_51_0)
				arg_37_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_SCENE_ITEM_ANIM, arg_50_2, arg_50_3)
				arg_37_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_SINGLE_ACTION, arg_37_1, arg_50_1, arg_51_0)
			end
		end,
		function(arg_52_0)
			return function(arg_53_0)
				local var_53_0 = pg.dorm3d_ik_touch[arg_37_2]

				if #var_53_0.scene_item == 0 then
					return
				end

				local var_53_1 = arg_37_0:GetSceneItem(var_53_0.scene_item)

				if not var_53_1 then
					warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_37_2, var_53_0.scene_item))

					return
				end

				local var_53_2 = var_53_1:Find(arg_52_0)

				if not IsNil(var_53_2) then
					setActive(var_53_2, false)
					setActive(var_53_2, true)
				end

				arg_53_0()
			end
		end,
		function(arg_54_0)
			local var_54_0 = pg.dorm3d_ik_touch_move[arg_54_0]

			assert(var_54_0, "Missing dorm3d_ik_touch_move config: " .. tostring(arg_54_0))

			local var_54_1 = var_54_0.target_ik
			local var_54_2 = var_54_0.move_time
			local var_54_3 = var_54_0.ik_point
			local var_54_4 = var_54_0.touch_step
			local var_54_5 = arg_37_0.touchForceMove

			assert(var_54_5, "Missing touch force move runtime")

			var_54_5[var_54_1] = var_54_5[var_54_1] or {}
			var_54_5[var_54_1].count = var_54_5[var_54_1].count or 0

			return function(arg_55_0)
				seriesAsync({
					function(arg_56_0)
						if var_54_5[var_54_1].count >= #var_54_4 then
							return arg_56_0()
						end

						local var_56_0 = var_54_5[var_54_1].count

						var_54_5[var_54_1].count = var_56_0 + 1

						arg_37_0:Emit(RoomIKSystem.PLAY_TOUCH_IK_MOVE, var_54_1, var_54_3, var_54_4[var_56_0 + 1], var_54_2, function()
							var_54_5[var_54_1].count = 0

							arg_56_0()
						end)
					end,
					arg_55_0
				})
			end
		end,
		function(arg_58_0)
			return function(arg_59_0)
				arg_37_0:Emit(Dorm3dStockingMgr.SET_STOCKING_STATUS, arg_58_0)
			end
		end,
		function(arg_60_0, arg_60_1)
			return function()
				local var_61_0 = arg_37_0:GetApartment():GetConfigID()

				arg_37_0:Emit(RoomIKSystem.SET_IK_SWITCH_SKIN_ID, arg_37_0:GetApartment():GetCurSkinId())
				arg_37_1:SwitchCharacterSkin(var_61_0, arg_60_0)
				arg_37_0:Emit(RoomIKSystem.REPLACE_IK_STATUS, arg_60_1)
			end
		end,
		function(arg_62_0)
			return function()
				arg_37_0:Emit(AimIKSystem.ENTER_TOUCH_AIMIK_STATUS, arg_62_0)
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.TriggerTouchInfo(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0:GetCurrentLadyEnv()
	local var_66_1, var_66_2, var_66_3 = unpack(arg_66_1)
	local var_66_4 = arg_66_0.touchTriggerRunner:AssertTouchConfig(var_66_1)
	local var_66_5 = var_66_4.action_emote

	if #var_66_5 > 0 then
		arg_66_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_FACE_ANIM, var_66_0, var_66_5)
	end

	local var_66_6 = var_66_4.vibrate

	if type(var_66_6) == "table" and VibrateMgr.Instance:IsSupport() then
		local var_66_7 = {}
		local var_66_8 = {}
		local var_66_9 = {}

		underscore.each(var_66_6, function(arg_67_0)
			local var_67_0 = arg_67_0[1]

			if PLATFORM == PLATFORM_IPHONEPLAYER then
				var_67_0 = var_67_0 / 1000
			end

			table.insert(var_66_7, var_67_0)
			table.insert(var_66_8, arg_67_0[2])
			table.insert(var_66_9, 1)
		end)

		if PLATFORM == PLATFORM_ANDROID then
			VibrateMgr.Instance:VibrateWaveform(var_66_7, var_66_8)
		elseif PLATFORM == PLATFORM_IPHONEPLAYER then
			VibrateMgr.Instance:VibrateWaveform(var_66_7, var_66_8, var_66_9)
		end
	end

	arg_66_0:Emit(RoomIKSystem.SET_IK_BLOCK, true)
	arg_66_0:TouchModeAction(var_66_0, var_66_1, unpack(var_66_3))(function()
		arg_66_0:Emit(RoomIKSystem.RESET_IK_TIP_TIMER)
		arg_66_0:Emit(RoomIKSystem.SET_IK_BLOCK, nil)
	end)
end

function var_0_0.UpdateTouchCount(arg_69_0, arg_69_1)
	if not arg_69_0:IsTouchModeActive() then
		return
	end

	if arg_69_0.touchLevel > 1 then
		arg_69_1 = math.min(0, arg_69_1)
	end

	local var_69_0 = arg_69_0.touchLevel > 1 and 100 or 0
	local var_69_1 = arg_69_0.touchLevel > 1 and 200 or 100

	arg_69_0.touchCount = math.clamp(arg_69_0.touchCount + arg_69_1, var_69_0, var_69_1)

	local var_69_2

	if arg_69_0.touchLevel == 1 and arg_69_0.touchCount >= 100 then
		var_69_2 = 2
	elseif arg_69_0.touchLevel > 1 and arg_69_0.touchCount <= 100 then
		var_69_2 = 1
	end

	if var_69_2 and var_69_2 ~= arg_69_0.touchLevel then
		local var_69_3 = {}

		arg_69_0:Emit(RoomIKSystem.GET_IK_BLOCK, var_69_3)

		if var_69_3.blockIK then
			arg_69_0:Emit(var_0_0.UPDATE_TOUCH_COUNT, arg_69_0.touchCount)

			arg_69_0.topCount = math.max(arg_69_0.topCount, arg_69_0.touchCount)

			return
		end

		arg_69_0.touchLevel = var_69_2

		local var_69_4 = arg_69_0.touchConfig.ik_status[var_69_2]

		if var_69_4 then
			if var_69_2 > 1 then
				arg_69_0.touchCount = 200
			elseif var_69_2 == 1 then
				arg_69_0.touchCount = 0
			end

			local var_69_5 = arg_69_0:GetCurrentLadyEnv()

			seriesAsync({
				function(arg_70_0)
					arg_69_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SHOW_BLACK_SCREEN, true, arg_70_0)
				end,
				function(arg_71_0)
					arg_69_0:Emit(RoomIKSystem.REPLACE_IK_STATUS, var_69_4, arg_71_0)

					if var_69_2 > 1 and arg_69_0.touchConfig.heartbeat_enter_anim ~= "" then
						arg_69_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SWITCH_ANIM, var_69_5, arg_69_0.touchConfig.heartbeat_enter_anim)
					end
				end,
				function(arg_72_0)
					arg_69_0:Emit(Dorm3dRoomTemplateScene.EXTRA_SHOW_BLACK_SCREEN, false, arg_72_0)
				end
			})
		end

		arg_69_0:Emit(var_0_0.UPDATE_TOUCH_DISPLAY, arg_69_0.touchLevel, arg_69_0.touchCount)
	else
		arg_69_0:Emit(var_0_0.UPDATE_TOUCH_COUNT, arg_69_0.touchCount)
	end

	arg_69_0.topCount = math.max(arg_69_0.topCount, arg_69_0.touchCount)
end

function var_0_0.ExitHeartbeatMode(arg_73_0)
	if not arg_73_0.touchLevel or arg_73_0.touchLevel == 1 then
		return
	end

	arg_73_0.touchCount = 0

	arg_73_0:UpdateTouchCount(0)
end

function var_0_0.DoTouch(arg_74_0, arg_74_1, arg_74_2)
	if arg_74_0.inTouchGame then
		switch(arg_74_2, {
			function()
				arg_74_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_74_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_74_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_74_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat_trriger.key_value_int)
			end
		})
	end
end

return var_0_0

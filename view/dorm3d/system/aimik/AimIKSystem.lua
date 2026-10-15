local var_0_0 = class("AimIKSystem", import("view.dorm3d.Core.BaseSystem"))

var_0_0.GET_TIP_SHOW_INFO = "AimIKSystem.GetTipShowInfo"
var_0_0.ON_BEGIN_DRAG = "AimIKSystem.OnBeginDrag"
var_0_0.ON_DRAG = "AimIKSystem.OnDrag"
var_0_0.ON_END_DRAG = "AimIKSystem.OnEndDrag"
var_0_0.ENTER_TIMELINE_AIMIK_STATUS = "AimIKSystem.EnterTimelineAimIKStatus"
var_0_0.EXIT_TIMELINE_AIMIK_STATUS = "AimIKSystem.ExitTimelineAimIKStatus"
var_0_0.ENTER_TOUCH_AIMIK_STATUS = "AimIKSystem.EnterTouchAimIKStatus"
var_0_0.EXIT_TOUCH_AIMIK_STATUS = "AimIKSystem.ExitTouchAimIKStatus"
var_0_0.ON_EXIT_TOUCH_MODE = "AimIKSystem.OnExitTouchMode"

function var_0_0.OnInit(arg_1_0)
	arg_1_0.inStatus = false
	arg_1_0.inExitProcessing = false
	arg_1_0.exitProcessToken = 0
	arg_1_0.touchProcessToken = 0
	arg_1_0.inputEnabled = false
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.GET_TIP_SHOW_INFO, function(arg_3_0, arg_3_1)
		return arg_2_0:GetTipShowInfo(arg_3_1)
	end)
	arg_2_0:Bind(var_0_0.ON_BEGIN_DRAG, function(arg_4_0, arg_4_1, arg_4_2)
		arg_2_0:OnBeginDrag(arg_4_1, arg_4_2)
	end)
	arg_2_0:Bind(var_0_0.ON_DRAG, function(arg_5_0, arg_5_1, arg_5_2)
		arg_2_0:OnDrag(arg_5_1, arg_5_2)
	end)
	arg_2_0:Bind(var_0_0.ON_END_DRAG, function(arg_6_0, arg_6_1, arg_6_2)
		arg_2_0:OnEndDrag(arg_6_1, arg_6_2)
	end)
	arg_2_0:Bind(var_0_0.ENTER_TIMELINE_AIMIK_STATUS, function(arg_7_0, arg_7_1)
		arg_2_0:EnterTimelineAimIKStatus(arg_7_1)
	end)
	arg_2_0:Bind(var_0_0.EXIT_TIMELINE_AIMIK_STATUS, function()
		arg_2_0:ExitTimelineAimIKStatus()
	end)
	arg_2_0:Bind(var_0_0.ENTER_TOUCH_AIMIK_STATUS, function(arg_9_0, arg_9_1)
		arg_2_0:EnterTouchAimIKStatus(arg_9_1)
	end)
	arg_2_0:Bind(var_0_0.EXIT_TOUCH_AIMIK_STATUS, function()
		arg_2_0:ExitTouchAimIKStatus()
	end)
	arg_2_0:Bind(var_0_0.ON_EXIT_TOUCH_MODE, function(arg_11_0, arg_11_1)
		arg_2_0:ExitTouchAimIKStatus(true, arg_11_1)
	end)
end

function var_0_0.OnHandleNotification(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_1 == Dorm3dRoomTemplateScene.TIMELINE_END and arg_12_0.statusMode == "timeline" then
		if not arg_12_0.inStatus and not arg_12_0.inExitProcessing then
			return
		end

		arg_12_0:ForceExitTimelineAimIKStatus()
	end
end

function var_0_0.GetInterests()
	return {
		Dorm3dRoomTemplateScene.TIMELINE_END
	}
end

function var_0_0.OnDispose(arg_14_0)
	arg_14_0.touchProcessToken = arg_14_0.touchProcessToken + 1

	arg_14_0:InvalidateExitProcess()
	arg_14_0:UnregisterTrigger()

	if arg_14_0.statusMode == "touch" then
		arg_14_0:ResetTouchItem()
	end

	arg_14_0:FinishExitTimelineAimIKStatus()

	arg_14_0.inputEnabled = false

	arg_14_0:Emit(Dorm3dAimIKView.SHOW_OR_HIDE, false)

	arg_14_0.statusMode = nil
	arg_14_0.touchExitCallbacks = nil
end

function var_0_0.EnterTimelineAimIKStatus(arg_15_0, arg_15_1)
	warning("enteraimikstatus")

	if arg_15_0.statusMode or arg_15_0.inExitProcessing then
		warning("重复进入TimelineAimIK状态")

		return
	end

	arg_15_0.inStatus = true
	arg_15_0.statusMode = "timeline"

	local var_15_0 = pg.dorm3d_aim_ik[arg_15_1]

	assert(var_15_0, "AimIK config is nil for id: " .. tostring(arg_15_1))

	local var_15_1 = GameObject.Find(var_15_0.item_path)

	assert(not IsNil(var_15_1), "Timeline AimIK item not found: " .. var_15_0.item_path)
	arg_15_0:InitAimIKComponents(var_15_0, Dorm3dHxHelper.GetTimelineMainCharacter(), var_15_1.transform)

	arg_15_0.mainCamera = Camera.main
	arg_15_0.headAimIKComp.weight = 0
	arg_15_0.stickAimComp.weight = 0

	setActive(arg_15_0.configRoot, true)
	arg_15_0:LerpAimWeight(0, 1, arg_15_0.config.fade_in, function()
		arg_15_0:Emit(Dorm3dAimIKView.BIND_DRAG_AREA, arg_15_0.dragComp)
		arg_15_0:Emit(Dorm3dAimIKView.SHOW_OR_HIDE, true)

		arg_15_0.inputEnabled = true
		arg_15_0.triggerAction = System.Action(function()
			arg_15_0:Emit(Dorm3dRoomTemplateScene.TRIGGER_TIMELINE_PLAYER_EVENT, {
				intParameter = 1919810,
				stringParameter = "TimelineSelect",
				floatParameter = 0
			})
			arg_15_0:ExitTimelineAimIKStatus()
		end)

		arg_15_0.dragComp:RegisterOnTargetReachBoundary(arg_15_0.triggerAction)
	end)
end

function var_0_0.ExitTimelineAimIKStatus(arg_18_0, arg_18_1)
	if arg_18_0.statusMode ~= "timeline" then
		return
	end

	warning("exitaimikstatus")

	arg_18_0.inStatus = false
	arg_18_0.inputEnabled = false

	arg_18_0:Emit(Dorm3dAimIKView.SHOW_OR_HIDE, false)
	arg_18_0:UnregisterTrigger()
	arg_18_0:FadeOutAimIK(function()
		arg_18_0:FinishExitTimelineAimIKStatus()

		arg_18_0.statusMode = nil
	end, arg_18_1)
end

function var_0_0.FadeOutAimIK(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_2 then
		arg_20_0:InvalidateExitProcess()
		arg_20_0:StopWeightLerp()

		arg_20_0.headAimIKComp.weight = 0
		arg_20_0.stickAimComp.weight = 0

		existCall(arg_20_1)
	else
		if not arg_20_0.cachedDampTime then
			arg_20_0.cachedDampTime = {
				arg_20_0.headAimIKComp.DampTime,
				arg_20_0.stickAimComp.rotateDampTime,
				arg_20_0.stickAimComp.followDampTime
			}
		end

		local var_20_0 = arg_20_0.headAimIKComp.weight

		arg_20_0:InvalidateExitProcess()

		arg_20_0.inExitProcessing = true

		local var_20_1 = arg_20_0.exitProcessToken

		arg_20_0:SetDampTime({
			0,
			0,
			0
		})
		arg_20_0:LerpAimWeight(var_20_0, 0, arg_20_0.config.fade_out, function()
			if not arg_20_0:IsExitProcessValid(var_20_1) then
				return
			end

			arg_20_0.inExitProcessing = false

			existCall(arg_20_1)
		end)
	end
end

function var_0_0.ForceExitTimelineAimIKStatus(arg_22_0)
	if arg_22_0.statusMode ~= "timeline" or not arg_22_0.inStatus and not arg_22_0.inExitProcessing then
		return
	end

	arg_22_0:ExitTimelineAimIKStatus(true)
end

function var_0_0.FinishExitTimelineAimIKStatus(arg_23_0)
	arg_23_0:StopWeightLerp()

	if arg_23_0.cachedDampTime then
		arg_23_0:SetDampTime(arg_23_0.cachedDampTime)
	end

	if arg_23_0.headAimIKComp then
		arg_23_0.headAimIKComp.weight = 0
	end

	if arg_23_0.stickAimComp then
		arg_23_0.stickAimComp.weight = 0

		if arg_23_0.hasAimIKBinding then
			arg_23_0.stickAimComp.bindTransform = arg_23_0.cachedBindTransform
		end
	end

	if not IsNil(arg_23_0.configRoot) then
		setActive(arg_23_0.configRoot, false)
	end

	arg_23_0.cachedDampTime = nil
	arg_23_0.cachedBindTransform = nil
	arg_23_0.hasAimIKBinding = false
end

function var_0_0.InitAimIKComponents(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	assert(not IsNil(arg_24_2), "AimIK character not found")
	assert(not IsNil(arg_24_3), "AimIK item not found: " .. tostring(arg_24_1.item_path))
	assert(type(arg_24_1.fade_in) == "number" and arg_24_1.fade_in >= 0, "Invalid AimIK fade_in")
	assert(type(arg_24_1.fade_out) == "number" and arg_24_1.fade_out >= 0, "Invalid AimIK fade_out")

	local var_24_0 = arg_24_2:Find("AimIKLayers/" .. arg_24_1.layer_config)

	assert(not IsNil(var_24_0), "AimIK config root not found: " .. arg_24_1.layer_config)

	local var_24_1 = var_24_0:Find("plane")
	local var_24_2 = var_24_0:Find("headAim")
	local var_24_3 = var_24_0:Find("stickAim")

	assert(not IsNil(var_24_1) and not IsNil(var_24_2) and not IsNil(var_24_3), "AimIK layer nodes missing")

	local var_24_4 = var_24_1:GetComponent(typeof(CanvasRectDragTarget))
	local var_24_5 = var_24_2:GetComponent(typeof(HeadAimIKHotfix))
	local var_24_6 = var_24_3:GetComponent(typeof(StickAim))

	assert(not IsNil(var_24_4) and not IsNil(var_24_5) and not IsNil(var_24_6), "AimIK layer components missing")
	assert(not IsNil(var_24_4.target), "AimIK drag target missing")

	arg_24_0.config, arg_24_0.character, arg_24_0.configRoot = arg_24_1, arg_24_2, var_24_0
	arg_24_0.dragGo, arg_24_0.dragComp = var_24_1, var_24_4
	arg_24_0.headAimIKGo, arg_24_0.headAimIKComp = var_24_2, var_24_5
	arg_24_0.stickAimGo, arg_24_0.stickAimComp = var_24_3, var_24_6
	arg_24_0.stickSceneGo = arg_24_3.gameObject
	arg_24_0.cachedBindTransform = var_24_6.bindTransform
	arg_24_0.hasAimIKBinding = true
	var_24_6.bindTransform = arg_24_3
end

function var_0_0.UnregisterTrigger(arg_25_0)
	if not arg_25_0.triggerAction or not arg_25_0.dragComp then
		return
	end

	if arg_25_0.statusMode == "touch" then
		arg_25_0.dragComp:UnregisterOnDragOutOfUI(arg_25_0.triggerAction)
	else
		arg_25_0.dragComp:UnregisterOnTargetReachBoundary(arg_25_0.triggerAction)
	end

	arg_25_0.triggerAction = nil
end

function var_0_0.IsTouchProcessValid(arg_26_0, arg_26_1)
	return arg_26_0.statusMode == "touch" and arg_26_0.touchProcessToken == arg_26_1
end

function var_0_0.EnterTouchAimIKStatus(arg_27_0, arg_27_1)
	if arg_27_0.statusMode or arg_27_0.inExitProcessing then
		return
	end

	local var_27_0 = pg.dorm3d_aim_ik_touch[arg_27_1]

	assert(var_27_0, "Missing dorm3d_aim_ik_touch config: " .. tostring(arg_27_1))

	local var_27_1 = arg_27_0:GetCurrentLadyEnv()

	assert(var_27_1, "Touch AimIK character not found")
	assert(arg_27_0:GetApartment():GetConfigID() == var_27_0.character_id, "Touch AimIK character mismatch")
	assert(var_27_1.skinId == var_27_0.skin_id, "Touch AimIK skin mismatch")
	assert(type(var_27_0.item_path) == "string" and var_27_0.item_path ~= "", "Touch AimIK item_path is empty")
	assert(pg.dorm3d_dialogue_group[var_27_0.trigger_talk], "Touch AimIK feedback dialogue missing")

	local var_27_2 = arg_27_0:GetSceneItem(var_27_0.item_path)

	arg_27_0:InitAimIKComponents(var_27_0, var_27_1.lady, var_27_2)

	local var_27_3 = arg_27_0:GetIKPointByName(var_27_0.character_position)

	assert(not IsNil(var_27_3) and not IsNil(var_27_3:Find("StayPoint")), "Touch AimIK StayPoint missing")

	local var_27_4 = arg_27_0:GetCameraRoot():Find(var_27_0.camera)

	assert(not IsNil(var_27_4), "Touch AimIK camera missing: " .. var_27_0.camera)

	arg_27_0.statusMode, arg_27_0.touchState, arg_27_0.inStatus = "touch", "entering", true
	arg_27_0.touchProcessToken = arg_27_0.touchProcessToken + 1

	local var_27_5 = arg_27_0.touchProcessToken

	arg_27_0.ladyEnv = var_27_1
	arg_27_0.mainCamera = arg_27_0:GetMainCameraTF():GetComponent(typeof(Camera))
	arg_27_0.touchExitRequested = false
	arg_27_0.touchExitCallbacks = {}

	arg_27_0:Emit(RoomIKSystem.ENTER_AIMIK_IK_MODE, function()
		if not arg_27_0:IsTouchProcessValid(var_27_5) then
			return
		end

		arg_27_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, function()
			if not arg_27_0:IsTouchProcessValid(var_27_5) then
				return
			end

			arg_27_0:ResetTouchLady()
			arg_27_0:Emit(Dorm3dRoomTemplateScene.EXTRA_ACTIVE_CAMERA_BY_NAME, var_27_0.camera)

			local var_29_0 = var_27_4:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

			if var_29_0 then
				arg_27_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REGISTER_ORBITS, var_29_0)
			end

			arg_27_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_SCENE_ANIM, var_27_0.enter_scene_anim)
			arg_27_0:Emit(Dorm3dRoomTemplateScene.EXTRA_PLAY_ENTER_EXTRA_ITEM, var_27_1, var_27_0.enter_extra_item)
			arg_27_0:Emit(Dorm3dRoomTemplateScene.EXTRA_HIDE_SCENE_ITEM, var_27_0.hide_scene_item)

			arg_27_0.touchItemPosition, arg_27_0.touchItemRotation = var_27_2.localPosition, var_27_2.localRotation

			setActive(var_27_1.ladyCollider, false)
			_.each(var_27_1.ladyTouchColliders, function(arg_30_0)
				setActive(arg_30_0, false)
			end)

			arg_27_0.touchState = "recovering"

			if arg_27_0.touchExitRequested then
				arg_27_0:ExitTouchAimIKStatus(true)
			else
				arg_27_0:EnableTouchAimIK(var_27_5)
			end
		end, "aimik")
	end)
end

function var_0_0.ResetTouchLady(arg_31_0)
	local var_31_0 = arg_31_0:GetIKPointByName(arg_31_0.config.character_position):Find("StayPoint")

	arg_31_0.ladyEnv:SetPosition(var_31_0.position)
	arg_31_0.ladyEnv:SetRotation(var_31_0.rotation)
	arg_31_0.ladyEnv:PlaySingleAction(arg_31_0.config.character_action)
end

function var_0_0.ResetTouchItem(arg_32_0)
	if arg_32_0.touchItemPosition and not IsNil(arg_32_0.stickSceneGo) then
		arg_32_0.stickSceneGo.transform.localPosition = arg_32_0.touchItemPosition
		arg_32_0.stickSceneGo.transform.localRotation = arg_32_0.touchItemRotation
	end
end

function var_0_0.EnableTouchAimIK(arg_33_0, arg_33_1)
	if not arg_33_0:IsTouchProcessValid(arg_33_1) then
		return
	end

	if arg_33_0.cachedDampTime then
		arg_33_0:SetDampTime(arg_33_0.cachedDampTime)

		arg_33_0.cachedDampTime = nil
	end

	arg_33_0.headAimIKComp.weight, arg_33_0.stickAimComp.weight = 0, 0

	setActive(arg_33_0.configRoot, false)
	setActive(arg_33_0.configRoot, true)
	arg_33_0:Emit(Dorm3dAimIKView.BIND_DRAG_AREA, arg_33_0.dragComp)
	arg_33_0:LerpAimWeight(0, 1, arg_33_0.config.fade_in, function()
		if not arg_33_0:IsTouchProcessValid(arg_33_1) then
			return
		end

		arg_33_0.touchState, arg_33_0.inputEnabled = "active", true
		arg_33_0.triggerAction = System.Action(function()
			arg_33_0:TriggerTouchFeedback()
		end)

		arg_33_0.dragComp:RegisterOnDragOutOfUI(arg_33_0.triggerAction)
		arg_33_0:Emit(Dorm3dAimIKView.SHOW_OR_HIDE, true, true)
	end)
end

function var_0_0.TriggerTouchFeedback(arg_36_0)
	if arg_36_0.touchState ~= "active" or not arg_36_0.inputEnabled then
		return
	end

	local var_36_0 = arg_36_0.touchProcessToken

	arg_36_0.touchState, arg_36_0.inputEnabled = "feedback", false

	arg_36_0.dragComp:OnPointerUp(nil)
	arg_36_0:UnregisterTrigger()
	arg_36_0:Emit(Dorm3dAimIKView.SHOW_OR_HIDE, false)
	arg_36_0:FadeOutAimIK(function()
		if not arg_36_0:IsTouchProcessValid(var_36_0) then
			return
		end

		setActive(arg_36_0.configRoot, false)
		arg_36_0:ResetTouchItem()
		arg_36_0:ResetTouchLady()

		arg_36_0.touchState = "story"

		arg_36_0:Emit(Dorm3dRoomScene.EXTRA_DO_TALK, arg_36_0.config.trigger_talk, function()
			if not arg_36_0:IsTouchProcessValid(var_36_0) then
				return
			end

			arg_36_0.touchState = "recovering"

			if arg_36_0.touchExitRequested then
				arg_36_0:ExitTouchAimIKStatus(true)
			else
				arg_36_0:ResetTouchLady()
				arg_36_0:ResetTouchItem()
				arg_36_0:Emit(Dorm3dRoomTemplateScene.EXTRA_ACTIVE_CAMERA_BY_NAME, arg_36_0.config.camera)
				arg_36_0:EnableTouchAimIK(var_36_0)
			end
		end)
	end)
end

function var_0_0.ExitTouchAimIKStatus(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_0.statusMode ~= "touch" then
		existCall(arg_39_2)

		return
	end

	if arg_39_2 then
		table.insert(arg_39_0.touchExitCallbacks, arg_39_2)
	end

	arg_39_0.touchExitRequested = true

	if arg_39_0.touchState == "entering" or arg_39_0.touchState == "story" or arg_39_0.touchState == "exiting" then
		return
	end

	arg_39_0.touchState, arg_39_0.inputEnabled, arg_39_0.inStatus = "exiting", false, false

	local var_39_0 = arg_39_0.touchProcessToken

	arg_39_0.dragComp:OnPointerUp(nil)
	arg_39_0:UnregisterTrigger()
	arg_39_0:Emit(Dorm3dAimIKView.SHOW_OR_HIDE, false)
	arg_39_0:FadeOutAimIK(function()
		if not arg_39_0:IsTouchProcessValid(var_39_0) then
			return
		end

		arg_39_0:ResetTouchItem()
		arg_39_0:FinishExitTimelineAimIKStatus()
		arg_39_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_SCENE_ITEM_ANIMATORS)
		arg_39_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_CHARACTER_EXTRA_ITEM)
		arg_39_0:Emit(Dorm3dRoomTemplateScene.EXTRA_RESET_TEMP_HIDE_SCENE_ITEMS)
		arg_39_0:Emit(Dorm3dRoomTemplateScene.EXTRA_REVERT_CAMERA_ORBIT)
		arg_39_0:Emit(Dorm3dRoomScene.EXTRA_SET_UI, function()
			if not arg_39_0:IsTouchProcessValid(var_39_0) then
				return
			end

			arg_39_0:Emit(RoomIKSystem.EXIT_AIMIK_IK_MODE, function()
				if not arg_39_0:IsTouchProcessValid(var_39_0) then
					return
				end

				local var_42_0 = arg_39_0.touchExitCallbacks

				arg_39_0.statusMode, arg_39_0.touchState = nil
				arg_39_0.touchItemPosition, arg_39_0.touchItemRotation = nil
				arg_39_0.touchExitCallbacks, arg_39_0.touchExitRequested = nil

				for iter_42_0, iter_42_1 in ipairs(var_42_0) do
					iter_42_1()
				end
			end)
		end, "back")
	end, arg_39_1)
end

function var_0_0.InvalidateExitProcess(arg_43_0)
	arg_43_0.exitProcessToken = (arg_43_0.exitProcessToken or 0) + 1
	arg_43_0.inExitProcessing = false
end

function var_0_0.IsExitProcessValid(arg_44_0, arg_44_1)
	return arg_44_0.inExitProcessing and arg_44_0.exitProcessToken == arg_44_1
end

function var_0_0.OnBeginDrag(arg_45_0, arg_45_1, arg_45_2)
	if not arg_45_0.inputEnabled or not arg_45_2 then
		return
	end

	arg_45_0.dragComp:OnPointerDown(arg_45_2)
end

function var_0_0.OnDrag(arg_46_0, arg_46_1, arg_46_2)
	if not arg_46_0.inputEnabled or not arg_46_2 then
		return
	end

	arg_46_0.dragComp:OnDrag(arg_46_2)
end

function var_0_0.OnEndDrag(arg_47_0, arg_47_1, arg_47_2)
	if not arg_47_0.inputEnabled then
		return
	end

	arg_47_0.dragComp:OnPointerUp(arg_47_2)
end

function var_0_0.GetTipShowInfo(arg_48_0, arg_48_1)
	local var_48_0 = {}

	if not arg_48_0.inputEnabled or IsNil(arg_48_0.stickSceneGo) then
		if arg_48_1 then
			table.insert(arg_48_1, var_48_0)
		end

		return var_48_0
	end

	local var_48_1 = {}

	arg_48_0:Emit(Dorm3dRoomTemplateScene.EXTRA_GET_SCREEN_POSITION, var_48_1, arg_48_0.stickSceneGo.transform.position, arg_48_0.mainCamera)
	table.insert(var_48_0, {
		pos = var_48_1.value
	})

	if arg_48_1 then
		table.insert(arg_48_1, var_48_0)
	end

	return var_48_0
end

function var_0_0.StopWeightLerp(arg_49_0)
	if not arg_49_0.weightLerpTweenId then
		return
	end

	if LeanTween.isTweening(arg_49_0.weightLerpTweenId) then
		LeanTween.cancel(arg_49_0.weightLerpTweenId)
	end

	arg_49_0.weightLerpTweenId = nil
end

function var_0_0.LerpAimWeight(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
	arg_50_0:StopWeightLerp()

	local function var_50_0(arg_51_0)
		arg_50_0.headAimIKComp.weight = arg_51_0
		arg_50_0.stickAimComp.weight = arg_51_0
	end

	var_50_0(arg_50_1)

	if arg_50_3 <= 0 then
		var_50_0(arg_50_2)
		existCall(arg_50_4)

		return
	end

	arg_50_0.weightLerpTweenId = LeanTween.value(go(arg_50_0.configRoot), arg_50_1, arg_50_2, arg_50_3):setEase(LeanTweenType.easeInOutSine):setOnUpdate(System.Action_float(function(arg_52_0)
		var_50_0(arg_52_0)
	end)):setOnComplete(System.Action(function()
		arg_50_0.weightLerpTweenId = nil

		var_50_0(arg_50_2)

		if arg_50_4 then
			arg_50_4()
		end
	end)).uniqueId
end

function var_0_0.SetDampTime(arg_54_0, arg_54_1)
	arg_54_0.headAimIKComp.DampTime = arg_54_1[1]
	arg_54_0.stickAimComp.rotateDampTime = arg_54_1[2]
	arg_54_0.stickAimComp.followDampTime = arg_54_1[3]
end

return var_0_0

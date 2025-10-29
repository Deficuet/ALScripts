ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleVariable
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = singletonClass("BattleCameraUtil")

var_0_0.Battle.BattleCameraUtil = var_0_4
var_0_4.__name = "BattleCameraUtil"
var_0_4.FOCUS_PILOT = "FOCUS_PILOT"
var_0_4.TWEEN_TO_CHARACTER = "TWEEN_TO_CHARACTER"
var_0_4.FOLLOW_GESTURE = "FOLLOW_GESTURE"

function var_0_4.Ctor(arg_1_0)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_1_0)

	arg_1_0._camera = pg.UIMgr.GetInstance():GetMainCamera():GetComponent(typeof(Camera))
	arg_1_0._cameraTF = arg_1_0._camera.transform
	arg_1_0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	arg_1_0._cameraFixMgr = pg.CameraFixMgr.GetInstance()
end

function var_0_4.ActiveMainCamera(arg_2_0)
	CameraMgr.instance:SetActiveMainCamera(arg_2_0)
end

function var_0_4.Initialize(arg_3_0)
	arg_3_0._cameraTF.localPosition = var_0_3.CAMERA_INIT_POS

	CameraMgr.instance:SetCameraOrthographicSize(arg_3_0._camera, 20)
	var_0_1.UpdateCameraPositionArgs()
	arg_3_0:setArrowPoint()

	arg_3_0._boundFix = var_0_0.Battle.BattleCameraBoundFixDecorate.New()
	arg_3_0._followPilot = var_0_0.Battle.BattleCameraFollowPilot.New()
	arg_3_0._focusCharacter = var_0_0.Battle.BattleCameraFocusChar.New()
	arg_3_0._fromTo = var_0_0.Battle.BattleCameraTween.New()
	arg_3_0._gesture = var_0_0.Battle.BattleCameraFollowGesture.New()

	arg_3_0:active()
	arg_3_0:SwitchCameraPos()

	arg_3_0._shakeEnabled = true
	arg_3_0._uiMediator = var_0_0.Battle.BattleState.GetInstance():GetMediatorByName(var_0_0.Battle.BattleUIMediator.__name)
end

function var_0_4.Clear(arg_4_0)
	arg_4_0.ActiveMainCamera(false)
	LeanTween.cancel(go(arg_4_0._camera))
	arg_4_0:Deactive()
	arg_4_0:StopShake()
	arg_4_0._boundFix:Dispose()
	arg_4_0._followPilot:Dispose()
	arg_4_0._focusCharacter:Dispose()
	arg_4_0._fromTo:Dispose()
	arg_4_0._gesture:Dispose()

	arg_4_0._cameraTF.localPosition = Vector3(0, 62, -10)

	CameraMgr.instance:SetCameraOrthographicSize(arg_4_0._camera, 20)

	arg_4_0._uiMediator = nil
end

function var_0_4.SetMapData(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0, var_5_1, var_5_2, var_5_3 = arg_5_0._boundFix:SetMapData(arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_4 = pg.CameraFixMgr.GetInstance().actualWidth

	arg_5_0._followPilot:SetGoldenRation(arg_5_0._camera:ScreenToWorldPoint(Vector3(var_5_4 * var_0_3.CAMERA_GOLDEN_RATE, 0, 0)).x - arg_5_0._cameraTF.position.x)

	return var_5_0, var_5_1, var_5_2, var_5_3
end

function var_0_4.SetFocusFleet(arg_6_0, arg_6_1)
	arg_6_0._followPilot:SetFleetVO(arg_6_1)

	arg_6_0._cameraTF.position = arg_6_0._boundFix:GetCameraPos(arg_6_0._followPilot:GetCameraPos())

	var_0_1.UpdateCameraPositionArgs()
end

function var_0_4.SetCameraSilder(arg_7_0, arg_7_1)
	arg_7_0._gesture:SetGestureComponent(arg_7_1)
end

function var_0_4.SwitchCameraPos(arg_8_0, arg_8_1)
	if arg_8_1 == "TWEEN_TO_CHARACTER" then
		function arg_8_0._currentCameraPos()
			return arg_8_0._fromTo:GetCameraPos()
		end
	elseif arg_8_1 == "FOLLOW_GESTURE" then
		function arg_8_0._currentCameraPos()
			return arg_8_0._boundFix:GetCameraPos(arg_8_0._gesture:GetCameraPos(arg_8_0._cameraTF.position))
		end
	else
		function arg_8_0._currentCameraPos()
			return arg_8_0._boundFix:GetCameraPos(arg_8_0._followPilot:GetCameraPos())
		end
	end
end

function var_0_4.GetS2WPoint(arg_12_0, arg_12_1)
	return arg_12_0._camera:ScreenToWorldPoint(arg_12_1)
end

function var_0_4.setArrowPoint(arg_13_0)
	local var_13_0 = 1
	local var_13_1 = arg_13_0._uiCamera:ScreenToWorldPoint(arg_13_0._cameraFixMgr.leftBottomVector) + Vector3(var_13_0, var_13_0, 0)
	local var_13_2 = arg_13_0._uiCamera:ScreenToWorldPoint(arg_13_0._cameraFixMgr.rightTopVector) - Vector3(var_13_0, var_13_0, 0)

	arg_13_0._arrowCenterPos = (var_13_1 + var_13_2) * 0.5
	arg_13_0._arrowRightHorizon = var_13_2.x + 4
	arg_13_0._arrowTopHorizon = var_13_2.y + 4
	arg_13_0._arrowBottomHorizon = var_13_1.y - 4
	arg_13_0._arrowLeftHorizon = var_13_1.x - 3.75
	arg_13_0._arrowLeftBottomPos_notch = arg_13_0._uiCamera:ScreenToWorldPoint(arg_13_0._cameraFixMgr.notchAdaptLBVector) + Vector3(var_13_0, var_13_0, 0)
	arg_13_0._arrowRightTopPos_notch = arg_13_0._uiCamera:ScreenToWorldPoint(arg_13_0._cameraFixMgr.notchAdaptRTVector) - Vector3(var_13_0, var_13_0, 0)
	arg_13_0._arrowFieldHalfWidth_notch = arg_13_0._arrowRightTopPos_notch.x - arg_13_0._arrowCenterPos.x
end

function var_0_4.Update(arg_14_0)
	local var_14_0 = arg_14_0:GetCameraPoint()
	local var_14_1 = arg_14_0._cameraTF.position

	if var_14_1.x ~= var_14_0.x or var_14_1.z ~= var_14_0 then
		arg_14_0._cameraTF.position = var_14_0

		var_0_1.UpdateCameraPositionArgs()
	end

	if arg_14_0._shakeInfo and arg_14_0._shakeEnabled then
		arg_14_0:DoShake()
	end
end

function var_0_4.StartShake(arg_15_0, arg_15_1)
	if arg_15_0._shakeInfo and (arg_15_0._shakeInfo._priority > arg_15_1.priority or arg_15_1.priority == 0) then
		return
	end

	arg_15_0._shakeInfo = {}
	arg_15_0._shakeInfo._elapsed = 0
	arg_15_0._shakeInfo._duration = arg_15_1.time or 0
	arg_15_0._shakeInfo._count = 0
	arg_15_0._shakeInfo._loop = arg_15_1.loop or 1
	arg_15_0._shakeInfo._direction = 1
	arg_15_0._shakeInfo._vibrationH = arg_15_1.vibration_H or 0
	arg_15_0._shakeInfo._fricConstH = arg_15_1.friction_const_H or 0
	arg_15_0._shakeInfo._fricCoefH = arg_15_1.friction_coefficient_H or 1
	arg_15_0._shakeInfo._vibrationV = arg_15_1.vibration_V or 0
	arg_15_0._shakeInfo._fricConstV = arg_15_1.friction_const_V or 0
	arg_15_0._shakeInfo._fricCoefV = arg_15_1.friction_coefficient_V or 1
	arg_15_0._shakeInfo._diff = Vector3.zero
	arg_15_0._shakeInfo._bounce = arg_15_1.bounce

	if arg_15_0._shakeInfo._bounce then
		arg_15_0._shakeInfo._duration = arg_15_0._shakeInfo._duration * 0.5
	end

	arg_15_0._shakeInfo._priority = arg_15_1.priority
end

function var_0_4.StopShake(arg_16_0)
	arg_16_0._shakeInfo = nil
end

function var_0_4.DoShake(arg_17_0)
	arg_17_0._shakeInfo._count = arg_17_0._shakeInfo._count + 1
	arg_17_0._shakeInfo._elapsed = arg_17_0._shakeInfo._elapsed + Time.deltaTime

	local var_17_0 = arg_17_0._shakeInfo._vibrationH * (math.random() * 0.5 + 0.5) * arg_17_0._shakeInfo._count
	local var_17_1 = arg_17_0._shakeInfo._vibrationV * (math.random() * 0.5 + 0.5) * arg_17_0._shakeInfo._count
	local var_17_2 = Vector3(var_17_0, var_17_1, 0):Mul(arg_17_0._shakeInfo._direction)

	LuaHelper.UpdateTFLocalPos(arg_17_0._cameraTF, var_17_2 - arg_17_0._shakeInfo._diff)

	if arg_17_0._shakeInfo._count >= arg_17_0._shakeInfo._loop then
		arg_17_0._shakeInfo._vibrationH = arg_17_0._shakeInfo._vibrationH * arg_17_0._shakeInfo._fricCoefH + arg_17_0._shakeInfo._fricConstH
		arg_17_0._shakeInfo._vibrationV = arg_17_0._shakeInfo._vibrationV * arg_17_0._shakeInfo._fricCoefV + arg_17_0._shakeInfo._fricConstV
		arg_17_0._shakeInfo._direction = -arg_17_0._shakeInfo._direction
		arg_17_0._shakeInfo._count = 0
	end

	if arg_17_0._shakeInfo._elapsed > arg_17_0._shakeInfo._duration then
		if arg_17_0._shakeInfo._bounce then
			var_0_4.bounceReverse(arg_17_0._shakeInfo)

			arg_17_0._shakeInfo._elapsed = 0
			arg_17_0._shakeInfo._bounce = false
		else
			arg_17_0:StopShake()
		end
	else
		arg_17_0._shakeInfo._diff = var_17_2
	end
end

function var_0_4.bounceReverse(arg_18_0)
	if arg_18_0._fricCoefH ~= 0 then
		arg_18_0._fricCoefH = 1 / arg_18_0._fricCoefH
	end

	if arg_18_0._fricCoefV ~= 0 then
		arg_18_0._fricCoefV = 1 / arg_18_0._fricCoefV
	end

	arg_18_0._fricConstH = arg_18_0._fricConstH * -1
	arg_18_0._fricConstV = arg_18_0._fricConstV * -1
end

function var_0_4.PauseShake(arg_19_0)
	arg_19_0._shakeEnabled = false
end

function var_0_4.ResumeShake(arg_20_0)
	arg_20_0._shakeEnabled = true
end

function var_0_4.active(arg_21_0)
	UpdateBeat:Add(arg_21_0.Update, arg_21_0)
end

function var_0_4.Deactive(arg_22_0)
	UpdateBeat:Remove(arg_22_0.Update, arg_22_0)
end

function var_0_4.CutInPainting(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0:DispatchEvent(var_0_0.Event.New(var_0_2.SHOW_PAINTING, {
		caster = arg_23_1,
		speed = arg_23_2
	}))
end

function var_0_4.BulletTime(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = {
		key = arg_24_1,
		speed = arg_24_2,
		exemptUnit = arg_24_3
	}

	arg_24_0:DispatchEvent(var_0_0.Event.New(var_0_2.BULLET_TIME, var_24_0))
	var_0_0.Battle.BattleState.GetInstance():ScaleTimer(arg_24_2)

	if arg_24_0._uiMediator then
		local var_24_1 = 1 / (arg_24_2 or 1)

		arg_24_0._uiMediator:ScaleUISpeed(var_24_1)

		if arg_24_0._uiMediator:GetAppearFX() ~= nil then
			arg_24_0._uiMediator:GetAppearFX():GetComponent(typeof(Animator)).speed = var_24_1
		end
	end
end

function var_0_4.ZoomCamara(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	arg_25_3 = arg_25_3 or 1.6
	arg_25_2 = arg_25_2 or var_0_3.CAMERA_SIZE
	arg_25_1 = arg_25_1 or CameraMgr.instance:GetCameraOrthographicSize(arg_25_0._camera)

	local var_25_0 = LeanTween.value(go(arg_25_0._camera), arg_25_1, arg_25_2, arg_25_3):setOnUpdate(System.Action_float(function(arg_26_0)
		CameraMgr.instance:SetCameraOrthographicSize(arg_25_0._camera, arg_26_0)
	end))

	if arg_25_4 then
		var_25_0:setEase(LeanTweenType.easeOutExpo)
	end
end

function var_0_4.FocusCharacter(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5)
	arg_27_0:StopShake()

	delay = delay or 0

	local var_27_0 = {
		unit = arg_27_1,
		duration = arg_27_2,
		extraBulletTime = arg_27_3,
		skill = arg_27_4 or false
	}

	LeanTween.cancel(go(arg_27_0._camera))

	local var_27_1 = arg_27_0._cameraTF.position

	if arg_27_1 ~= nil then
		arg_27_0._focusCharacter:SetUnit(arg_27_1)

		local var_27_2 = arg_27_0._focusCharacter:GetCameraPos()

		if arg_27_5 == nil then
			arg_27_5 = true
		end

		arg_27_0._fromTo:SetFromTo(arg_27_0._camera, var_27_1, var_27_2, arg_27_2, delay, arg_27_5)
		arg_27_0:SwitchCameraPos(var_0_4.TWEEN_TO_CHARACTER)
	else
		local var_27_3 = arg_27_0._boundFix:GetCameraPos(arg_27_0._followPilot:GetCameraPos())

		local function var_27_4()
			arg_27_0:SwitchCameraPos()
		end

		if arg_27_5 == nil then
			arg_27_5 = false
		end

		arg_27_0._fromTo:SetFromTo(arg_27_0._camera, var_27_1, var_27_3, arg_27_2, delay, arg_27_5, var_27_4)
		arg_27_0:SwitchCameraPos(var_0_4.TWEEN_TO_CHARACTER)
	end

	arg_27_0:DispatchEvent(var_0_0.Event.New(var_0_2.CAMERA_FOCUS, var_27_0))
end

function var_0_4.ResetFocus(arg_29_0)
	arg_29_0:StopShake()
	LeanTween.cancel(go(arg_29_0._camera))
	LeanTween.cancel(go(arg_29_0._uiCamera))

	local var_29_0 = arg_29_0._boundFix:GetCameraPos(arg_29_0._followPilot:GetCameraPos())

	LeanTween.move(go(arg_29_0._camera), var_29_0, var_0_3.CAM_RESET_DURATION):setOnUpdate(System.Action_float(function(arg_30_0)
		var_0_1.UpdateCameraPositionArgs()
	end))
	arg_29_0:DispatchEvent(var_0_0.Event.New(var_0_2.CAMERA_FOCUS_RESET, {}))
end

function var_0_4.GetCharacterArrowBarPosition(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0._arrowLeftBottomPos_notch
	local var_31_1 = arg_31_0._arrowRightTopPos_notch
	local var_31_2 = arg_31_0._arrowCenterPos

	if arg_31_1.x >= arg_31_0._arrowLeftHorizon and arg_31_1.x < arg_31_0._arrowRightHorizon and arg_31_1.y >= arg_31_0._arrowBottomHorizon and arg_31_1.y <= arg_31_0._arrowTopHorizon then
		return nil
	else
		local var_31_3 = arg_31_1.y - var_31_2.y
		local var_31_4
		local var_31_5
		local var_31_6
		local var_31_7

		if arg_31_1.x > var_31_2.x then
			var_31_6 = var_31_1.x
			var_31_7 = arg_31_1.x - var_31_2.x
		else
			var_31_6 = var_31_0.x
			var_31_7 = var_31_2.x - arg_31_1.x
		end

		local var_31_8 = var_31_3 / var_31_7 * arg_31_0._arrowFieldHalfWidth_notch

		if var_31_8 > var_31_1.y then
			var_31_8 = var_31_1.y
			var_31_6 = var_31_7 / var_31_3 * (var_31_8 - var_31_2.y)
		elseif var_31_8 < var_31_0.y then
			var_31_8 = var_31_0.y
			var_31_6 = var_31_7 / var_31_3 * (var_31_8 - var_31_2.y)
		end

		if arg_31_2 then
			arg_31_2:Set(var_31_6, var_31_8, 10)

			return arg_31_2
		else
			return Vector3(var_31_6, var_31_8, 10)
		end
	end
end

function var_0_4.GetCameraPoint(arg_32_0)
	return arg_32_0._currentCameraPos()
end

function var_0_4.GetArrowCenterPos(arg_33_0)
	return arg_33_0._arrowCenterPos
end

function var_0_4.GetCamera(arg_34_0)
	return arg_34_0._camera
end

function var_0_4.Add2Camera(arg_35_0, arg_35_1, arg_35_2)
	arg_35_2 = arg_35_2 or 0
	arg_35_1 = tf(arg_35_1)

	arg_35_1:SetParent(arg_35_0._cameraTF)
	pg.ViewUtils.SetSortingOrder(arg_35_1, arg_35_2)

	return arg_35_0._cameraTF.localScale
end

function var_0_4.PauseCameraTween(arg_36_0)
	LeanTween.pause(go(arg_36_0._camera))
	LeanTween.pause(go(arg_36_0._uiCamera))
end

function var_0_4.ResumeCameraTween(arg_37_0)
	LeanTween.resume(go(arg_37_0._camera))
	LeanTween.resume(go(arg_37_0._uiCamera))
end

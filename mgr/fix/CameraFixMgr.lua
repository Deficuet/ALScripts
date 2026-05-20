pg = pg or {}
pg.CameraFixMgr = singletonClass("CameraFixMgr", import("view.base.BaseEventLogic"))

local var_0_0 = pg.CameraFixMgr

var_0_0.ASPECT_RATIO_UPDATE = "aspect_ratio_update"

function var_0_0.Init(arg_1_0, arg_1_1)
	arg_1_0.targetRatio = 1.7777777777777777

	arg_1_0:AddListener()
	arg_1_0:Adapt()
	arg_1_1()
end

function var_0_0.AddListener(arg_2_0)
	arg_2_0:Clear()

	function arg_2_0.adaptCall(arg_3_0)
		arg_2_0:AfterCall(arg_3_0)
	end

	CameraMgr.instance:AddListener(arg_2_0.adaptCall)
end

function var_0_0.Adapt(arg_4_0)
	CameraMgr.instance:Adapt()
end

function var_0_0.AfterCall(arg_5_0, arg_5_1)
	arg_5_0.targetRatio = arg_5_1
	arg_5_0.currentWidth = Screen.width
	arg_5_0.currentHeight = Screen.height

	local var_5_0 = arg_5_0.currentWidth / arg_5_0.currentHeight

	if var_5_0 < arg_5_0.targetRatio then
		arg_5_0.actualWidth = arg_5_0.currentWidth
		arg_5_0.actualHeight = arg_5_0.currentWidth / arg_5_0.targetRatio

		local var_5_1 = (arg_5_0.currentHeight - arg_5_0.actualHeight) * 0.5

		arg_5_0.leftBottomVector = Vector3(0, var_5_1, 0)
		arg_5_0.rightTopVector = Vector3(arg_5_0.currentWidth, arg_5_0.currentHeight - var_5_1, 0)
	else
		arg_5_0.actualWidth = arg_5_0.currentHeight * arg_5_0.targetRatio
		arg_5_0.actualHeight = arg_5_0.currentHeight

		local var_5_2 = (arg_5_0.currentWidth - arg_5_0.actualWidth) * 0.5

		arg_5_0.leftBottomVector = Vector3(var_5_2, 0, 0)
		arg_5_0.rightTopVector = Vector3(arg_5_0.currentWidth - var_5_2, arg_5_0.currentHeight, 0)
	end

	local var_5_3 = NotchAdapt.CheckNotchRatio

	if var_5_0 > ADAPT_NOTICE and var_5_3 < arg_5_0.targetRatio then
		arg_5_0.notchAdaptWidth = arg_5_0.currentHeight * var_5_3
		arg_5_0.notchAdaptHeight = arg_5_0.currentHeight

		local var_5_4 = (arg_5_0.currentWidth - arg_5_0.notchAdaptWidth) * 0.5

		arg_5_0.notchAdaptLBVector = Vector3(var_5_4, 0, 0)
		arg_5_0.notchAdaptRTVector = Vector3(arg_5_0.currentWidth - var_5_4, arg_5_0.currentHeight, 0)
	else
		arg_5_0.notchAdaptWidth = arg_5_0.actualWidth
		arg_5_0.notchAdaptHeight = arg_5_0.actualHeight
		arg_5_0.notchAdaptLBVector = arg_5_0.leftBottomVector
		arg_5_0.notchAdaptRTVector = arg_5_0.rightTopVector
	end

	arg_5_0:FixOverlayPadding(var_5_0)
	arg_5_0:emit(var_0_0.ASPECT_RATIO_UPDATE, arg_5_0.targetRatio)
end

function var_0_0.GetBattleUIRatio(arg_6_0)
	return arg_6_0.targetRatio
end

function var_0_0.GetCurrentWidth(arg_7_0)
	return arg_7_0.currentWidth
end

function var_0_0.GetCurrentHeight(arg_8_0)
	return arg_8_0.currentHeight
end

function var_0_0.SetForceRatio(arg_9_0, arg_9_1)
	if not arg_9_1 then
		CameraMgr.instance:SetForceRatio(-1)
	else
		CameraMgr.instance:SetForceRatio(arg_9_1)
	end
end

function var_0_0.BlockCameraRatioControll(arg_10_0, arg_10_1)
	local var_10_0 = CameraMgr.instance

	if arg_10_1 then
		local var_10_1 = System.Array.CreateInstance(typeof("System.Single"), 2)

		var_10_1[0] = 0
		var_10_1[1] = 100

		ReflectionHelp.RefSetField(var_10_0:GetType(), "AspectRatioRange", var_10_0, var_10_1)
	else
		local var_10_2 = System.Array.CreateInstance(typeof("System.Single"), 2)

		var_10_2[0] = 1.3333333333333333
		var_10_2[1] = 2.3333333333333335

		ReflectionHelp.RefSetField(var_10_0:GetType(), "AspectRatioRange", var_10_0, var_10_2)
	end

	arg_10_0:Adapt()
end

function var_0_0.Clear(arg_11_0)
	if arg_11_0.adaptCall then
		CameraMgr.instance:RemoveListener(arg_11_0.adaptCall)

		arg_11_0.adaptCall = nil
	end
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0:Clear()
end

local var_0_1 = 1920
local var_0_2 = 1080

local function var_0_3(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0 and not IsNil(arg_13_0)
	local var_13_1 = var_0_1
	local var_13_2 = var_0_2

	if var_13_0 then
		local var_13_3 = arg_13_0.referenceResolution

		var_13_1 = var_13_3.x
		var_13_2 = var_13_3.y
	end

	if var_13_1 <= 0 or var_13_2 <= 0 then
		var_13_1 = var_0_1
		var_13_2 = var_0_2
	end

	local var_13_4 = arg_13_1 / var_13_1
	local var_13_5 = arg_13_2 / var_13_2

	if var_13_0 and arg_13_0.screenMatchMode == CanvasScaler.ScreenMatchMode.MatchWidthOrHeight then
		local var_13_6 = math.log(var_13_4) / math.log(2)
		local var_13_7 = math.log(var_13_5) / math.log(2)
		local var_13_8 = arg_13_0.matchWidthOrHeight

		return math.pow(2, var_13_6 + (var_13_7 - var_13_6) * var_13_8)
	elseif var_13_0 and arg_13_0.screenMatchMode == CanvasScaler.ScreenMatchMode.Shrink then
		return math.max(var_13_4, var_13_5)
	else
		return math.min(var_13_4, var_13_5)
	end
end

function var_0_0.FixOverlayPadding(arg_14_0, arg_14_1)
	if not arg_14_0.paddingCanvas or IsNil(arg_14_0.paddingCanvas) then
		local var_14_0 = GameObject.Find("/OverlayCamera/Adpter")

		if not var_14_0 or IsNil(var_14_0) then
			return
		end

		arg_14_0.paddingCanvas = rtf(var_14_0)
		arg_14_0.paddingCanvasScaler = var_14_0:GetComponent(typeof(CanvasScaler))
		arg_14_0.paddingTop = arg_14_0.paddingCanvas:Find("top")
		arg_14_0.paddingBottom = arg_14_0.paddingCanvas:Find("bottom")
		arg_14_0.paddingLeft = arg_14_0.paddingCanvas:Find("left")
		arg_14_0.paddingRight = arg_14_0.paddingCanvas:Find("right")
	end

	if IsNil(arg_14_0.paddingTop) or IsNil(arg_14_0.paddingBottom) or IsNil(arg_14_0.paddingLeft) or IsNil(arg_14_0.paddingRight) then
		return
	end

	local var_14_1 = var_0_3(arg_14_0.paddingCanvasScaler, arg_14_0.currentWidth, arg_14_0.currentHeight)

	if var_14_1 <= 0 then
		return
	end

	local var_14_2 = arg_14_0.currentWidth / var_14_1
	local var_14_3 = arg_14_0.currentHeight / var_14_1
	local var_14_4
	local var_14_5

	if arg_14_1 < arg_14_0.targetRatio then
		var_14_4 = var_14_2
		var_14_5 = var_14_2 / arg_14_0.targetRatio
	else
		var_14_5 = var_14_3
		var_14_4 = var_14_3 * arg_14_0.targetRatio
	end

	local var_14_6 = math.max((var_14_2 - var_14_4) * 0.5, 0)
	local var_14_7 = math.max((var_14_3 - var_14_5) * 0.5, 0)

	arg_14_0.paddingLeft.sizeDelta = Vector2(var_14_6, arg_14_0.paddingLeft.sizeDelta.y)
	arg_14_0.paddingRight.sizeDelta = Vector2(var_14_6, arg_14_0.paddingRight.sizeDelta.y)
	arg_14_0.paddingTop.sizeDelta = Vector2(arg_14_0.paddingTop.sizeDelta.x, var_14_7)
	arg_14_0.paddingBottom.sizeDelta = Vector2(arg_14_0.paddingBottom.sizeDelta.x, var_14_7)
end

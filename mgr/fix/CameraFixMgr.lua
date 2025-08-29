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

function var_0_0.Clear(arg_10_0)
	if arg_10_0.adaptCall then
		CameraMgr.instance:RemoveListener(arg_10_0.adaptCall)

		arg_10_0.adaptCall = nil
	end
end

function var_0_0.Dispose(arg_11_0)
	arg_11_0:Clear()
end

ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleVariable = var_0_0.Battle.BattleVariable or {}

local var_0_1 = var_0_0.Battle.BattleVariable
local var_0_2 = var_0_0.Battle.BattleConfig

function var_0_1.Init(arg_1_0)
	var_0_1.speedRatioByIFF = {
		[0] = 1,
		1,
		[-1] = 1
	}
	var_0_1.focusExemptList = {}
	var_0_1.MapSpeedRatio = 1
	var_0_1.MapSpeedFacotrList = {}
	var_0_1.IFFFactorList = {}

	for iter_1_0, iter_1_1 in pairs(var_0_1.speedRatioByIFF) do
		var_0_1.IFFFactorList[iter_1_0] = {}
	end

	var_0_1._lastCameraPos = nil

	local var_1_0 = pg.UIMgr.GetInstance():GetMainCamera()

	if not arg_1_0 then
		setActive(var_1_0, true)
	end

	var_0_1._camera = var_1_0:GetComponent(typeof(Camera))
	var_0_1._cameraTF = var_0_1._camera.transform
	var_0_1._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))

	local var_1_1 = math.deg2Rad * var_0_1._cameraTF.localEulerAngles.x

	var_0_1._camera_radian_x_sin = math.sin(var_1_1)
	var_0_1._camera_radian_x_cos = math.cos(var_1_1)
	var_0_1._camera_radian_x_tan = var_0_1._camera_radian_x_sin / var_0_1._camera_radian_x_cos
	var_0_1.CameraNormalHeight = var_0_1._camera_radian_x_cos * var_0_2.CAMERA_SIZE + var_0_2.CAMERA_BASE_HEIGH
	var_0_1.CameraFocusHeight = var_0_1._camera_radian_x_cos * var_0_2.CAST_CAM_ZOOM_SIZE + var_0_2.CAMERA_BASE_HEIGH
end

function var_0_1.Clear()
	var_0_1.speedRatioByIFF = nil
	var_0_1.focusExemptList = nil
	var_0_1.MapSpeedRatio = nil
	var_0_1.MapSpeedFacotrList = nil
	var_0_1.IFFFactorList = nil
	var_0_1._lastCameraPos = nil
	var_0_1._camera = nil
	var_0_1._cameraTF = nil
	var_0_1._uiCamera = nil
	var_0_1._camera_radian_x_sin = nil
	var_0_1._camera_radian_x_cos = nil
	var_0_1._camera_radian_x_tan = nil
	var_0_1.CameraNormalHeight = nil
	var_0_1.CameraFocusHeight = nil
end

local var_0_3 = 0
local var_0_4 = 0
local var_0_5 = 0
local var_0_6 = 0
local var_0_7 = 0
local var_0_8 = 0

function var_0_1.UpdateCameraPositionArgs()
	local var_3_0 = var_0_1._cameraTF.position
	local var_3_1 = CameraMgr.instance:GetCameraOrthographicSize(var_0_1._camera)

	if var_0_1._lastCameraPos == var_3_0 and var_0_1._lastCameraSize == var_3_1 then
		return
	else
		var_0_1._lastCameraPos = var_3_0
		var_0_1._lastCameraSize = var_3_1
	end

	local var_3_2 = pg.CameraFixMgr.GetInstance()
	local var_3_3 = var_0_1._camera:ScreenToWorldPoint(var_3_2.leftBottomVector)
	local var_3_4 = var_0_1._camera:ScreenToWorldPoint(var_3_2.rightTopVector)
	local var_3_5 = var_0_1._uiCamera:ScreenToWorldPoint(var_3_2.leftBottomVector)
	local var_3_6 = var_0_1._uiCamera:ScreenToWorldPoint(var_3_2.rightTopVector)

	var_0_3 = var_3_3.x
	var_0_4 = var_3_5.x
	var_0_5 = (var_3_6.x - var_3_5.x) / (var_3_4.x - var_3_3.x)

	local var_3_7 = var_3_3.y * 0.866 + var_3_3.z * 0.5
	local var_3_8 = var_3_4.y * 0.866 + var_3_4.z * 0.5

	var_0_6 = var_3_7
	var_0_7 = var_3_5.y
	var_0_8 = (var_3_6.y - var_3_5.y) / (var_3_8 - var_3_7)
end

function var_0_1.CameraPosToUICamera(arg_4_0)
	var_0_1.CameraPosToUICameraByRef(arg_4_0)

	return arg_4_0
end

function var_0_1.CameraPosToUICameraByRef(arg_5_0)
	local var_5_0 = (arg_5_0.x - var_0_3) * var_0_5 + var_0_4

	arg_5_0.y, arg_5_0.x = (arg_5_0.y * 0.866 + arg_5_0.z * 0.5 - var_0_6) * var_0_8 + var_0_7, var_5_0
	arg_5_0.z = 0
end

function var_0_1.UIPosToScenePos(arg_6_0, arg_6_1)
	local var_6_0 = pg.CameraFixMgr.GetInstance()
	local var_6_1 = var_6_0:GetCurrentWidth()
	local var_6_2 = var_6_0:GetCurrentHeight()
	local var_6_3 = var_6_1 / 1920
	local var_6_4 = var_6_2 / 1080

	arg_6_0 = Vector2(var_6_3 * arg_6_0.x, var_6_4 * arg_6_0.y)

	local var_6_5 = var_0_1._uiCamera:ScreenToWorldPoint(arg_6_0)
	local var_6_6 = (var_6_5.x - var_0_4) / var_0_5 + var_0_3
	local var_6_7 = (var_6_5.y - var_0_7) / var_0_8 + var_0_6
	local var_6_8 = math.tan(30 * Mathf.Deg2Rad)
	local var_6_9 = var_6_7 / var_6_8 + var_6_7 * var_6_8 * 0.5

	arg_6_1:Set(var_6_6, 0, var_6_9)
end

function var_0_1.AppendMapFactor(arg_7_0, arg_7_1)
	if var_0_1.MapSpeedFacotrList[arg_7_0] ~= nil then
		var_0_1.RemoveMapFactor(arg_7_0)
	end

	var_0_1.MapSpeedRatio = var_0_1.MapSpeedRatio * arg_7_1
	var_0_1.MapSpeedFacotrList[arg_7_0] = arg_7_1
end

function var_0_1.RemoveMapFactor(arg_8_0)
	local var_8_0 = var_0_1.MapSpeedFacotrList[arg_8_0]

	if var_8_0 ~= nil then
		var_0_1.MapSpeedRatio = var_0_1.MapSpeedRatio / var_8_0
		var_0_1.MapSpeedFacotrList[arg_8_0] = nil
	end
end

function var_0_1.AppendIFFFactor(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = var_0_1.IFFFactorList[arg_9_0]

	if var_9_0[arg_9_1] ~= nil then
		var_0_1.RemoveIFFFactor(arg_9_0, arg_9_1)
	end

	var_0_1.speedRatioByIFF[arg_9_0] = var_0_1.speedRatioByIFF[arg_9_0] * arg_9_2
	var_9_0[arg_9_1] = arg_9_2
	var_0_1.focusExemptList = {}
end

function var_0_1.RemoveIFFFactor(arg_10_0, arg_10_1)
	local var_10_0 = var_0_1.IFFFactorList[arg_10_0]
	local var_10_1 = var_10_0[arg_10_1]

	if var_10_1 ~= nil then
		var_0_1.speedRatioByIFF[arg_10_0] = var_0_1.speedRatioByIFF[arg_10_0] / var_10_1
		var_10_0[arg_10_1] = nil
		var_0_1.focusExemptList = {}
	end
end

function var_0_1.GetSpeedRatio(arg_11_0, arg_11_1)
	return var_0_1.focusExemptList[arg_11_0] or var_0_1.speedRatioByIFF[arg_11_1]
end

function var_0_1.AddExempt(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = var_0_1.IFFFactorList[arg_12_1][arg_12_2]

	if var_12_0 ~= nil then
		var_0_1.focusExemptList[arg_12_0] = var_0_1.speedRatioByIFF[arg_12_1] / var_12_0
	end
end

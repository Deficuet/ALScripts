local var_0_0 = class("CarWashPovControlSystem", import("view.dorm3d.Game.CarWash.CarWashBaseSystem"))

var_0_0.ON_STICK_MOVE_BEGIN = "CarWashPovControlSystem.ON_STICK_MOVE_BEGIN"
var_0_0.ON_STICK_MOVE = "CarWashPovControlSystem.ON_STICK_MOVE"
var_0_0.ON_STICK_MOVE_END = "CarWashPovControlSystem.ON_STICK_MOVE_END"
var_0_0.ON_STICK_VIEW = "CarWashPovControlSystem.ON_STICK_VIEW"
var_0_0.SWITCH_CAMERA = "CarWashPovControlSystem.SWITCH_CAMERA"
var_0_0.MOVE_SPEED = 2
var_0_0.MOVE_STICK_RANGE = 200
var_0_0.VIEW_STICK_RATIO = 0.05
var_0_0.FP_CAMERA = "FP Camera"

function var_0_0.OnInit(arg_1_0)
	arg_1_0:InitSceneRefs()
	arg_1_0:ResetMoveStick()
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.ON_STICK_MOVE_BEGIN, function(arg_3_0, arg_3_1)
		arg_2_0:StartMove(arg_3_1)
	end)
	arg_2_0:Bind(var_0_0.ON_STICK_MOVE, function(arg_4_0, arg_4_1)
		arg_2_0:UpdateMoveStick(arg_4_1)
	end)
	arg_2_0:Bind(var_0_0.ON_STICK_MOVE_END, function()
		arg_2_0:ResetMoveStick()
	end)
	arg_2_0:Bind(var_0_0.ON_STICK_VIEW, function(arg_6_0, arg_6_1)
		arg_2_0:UpdateViewStick(arg_6_1)
	end)
	arg_2_0:Bind(var_0_0.SWITCH_CAMERA, function(arg_7_0, arg_7_1)
		arg_2_0:SwitchCameraByName(arg_7_1)
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_GAME_STATE, function(arg_8_0, arg_8_1)
		if arg_8_1.newValue == CarWashConst.GAME_STATE.PHASE_1 then
			arg_2_0:SwitchCameraByName(var_0_0.FP_CAMERA)
		elseif arg_8_1.newValue == CarWashConst.GAME_STATE.PHASE_2 then
			arg_2_0:SwitchCameraByName(arg_2_0.posConfig.phase2_camera)
		end
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_LADY_POS, function(arg_9_0, arg_9_1)
		arg_2_0.posConfig = arg_9_1.newValue
	end)
	arg_2_0:Bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_BEGIN, function()
		setActive(arg_2_0.mainCameraTF, false)
	end)
	arg_2_0:Bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_END, function()
		setActive(arg_2_0.mainCameraTF, true)
	end)
end

function var_0_0.OnUpdate(arg_12_0, arg_12_1)
	arg_12_0:UpdatePlayerMove()
end

function var_0_0.OnDispose(arg_13_0)
	arg_13_0:ResetMoveStick()

	arg_13_0.compPovAim = nil
	arg_13_0.povCamera = nil
	arg_13_0.currentCamera = nil
	arg_13_0.currentCameraTF = nil
	arg_13_0.currentCameraName = nil
	arg_13_0.posConfig = nil
	arg_13_0.cameras = nil
	arg_13_0.cameraNames = nil
	arg_13_0.cameraRoot = nil
	arg_13_0.characterController = nil
	arg_13_0.player = nil
end

function var_0_0.InitSceneRefs(arg_14_0)
	arg_14_0.mainCameraTF = arg_14_0:GetMainCameraTF()
	arg_14_0.player = GameObject.Find("Player").transform
	arg_14_0.characterController = arg_14_0.player:GetComponent(typeof(UnityEngine.CharacterController))

	assert(arg_14_0.characterController, "CarWash Player CharacterController not found")
	arg_14_0:InitCameras()
end

function var_0_0.InitCameras(arg_15_0)
	arg_15_0.cameraRoot = arg_15_0:GetCameraRoot()

	assert(arg_15_0.cameraRoot, "CarWash camera root not found")

	arg_15_0.cameras = {}
	arg_15_0.cameraNames = {}

	for iter_15_0 = 0, arg_15_0.cameraRoot.childCount - 1 do
		local var_15_0 = arg_15_0.cameraRoot:GetChild(iter_15_0)

		arg_15_0.cameras[var_15_0.name] = {
			tf = var_15_0,
			virtualCamera = var_15_0:GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)),
			freeLook = var_15_0:GetComponent(typeof(Cinemachine.CinemachineFreeLook))
		}

		table.insert(arg_15_0.cameraNames, var_15_0.name)
	end
end

function var_0_0.GetCameraInfo(arg_16_0, arg_16_1)
	if not arg_16_0.cameras then
		return nil
	end

	return arg_16_0.cameras[arg_16_1]
end

function var_0_0.GetCameraNames(arg_17_0)
	return arg_17_0.cameraNames or {}
end

function var_0_0.GetCurrentCameraName(arg_18_0)
	return arg_18_0.currentCameraName
end

function var_0_0.GetCurrentCamera(arg_19_0)
	return arg_19_0.currentCamera
end

function var_0_0.GetCurrentCameraTF(arg_20_0)
	return arg_20_0.currentCameraTF
end

function var_0_0.SwitchCameraByName(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0:GetCameraInfo(arg_21_1)

	assert(var_21_0, "CarWash camera not found: " .. tostring(arg_21_1))

	for iter_21_0, iter_21_1 in pairs(arg_21_0.cameras) do
		setActive(iter_21_1.tf, iter_21_1 == var_21_0)
	end

	arg_21_0.currentCameraName = arg_21_1
	arg_21_0.currentCameraTF = var_21_0.tf
	arg_21_0.currentCamera = var_21_0.virtualCamera or var_21_0.freeLook
	arg_21_0.povCamera = var_21_0.virtualCamera
	arg_21_0.compPovAim = arg_21_0.povCamera and arg_21_0.povCamera:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim) or nil

	return arg_21_0.currentCamera
end

function var_0_0.StartMove(arg_22_0, arg_22_1)
	if not arg_22_1 then
		return
	end

	arg_22_0.moveStickOrigin = arg_22_1.position
	arg_22_0.moveStickPosition = arg_22_0.moveStickOrigin
	arg_22_0.isMoveStickDragging = true
end

function var_0_0.ResetMoveStick(arg_23_0)
	arg_23_0.moveStickOrigin = nil
	arg_23_0.moveStickPosition = nil
	arg_23_0.isMoveStickDragging = false
end

function var_0_0.UpdateMoveStick(arg_24_0, arg_24_1)
	if not arg_24_0.isMoveStickDragging then
		return
	end

	if not arg_24_1 then
		return
	end

	arg_24_0.moveStickPosition = arg_24_0.moveStickPosition + arg_24_1
end

function var_0_0.UpdateViewStick(arg_25_0, arg_25_1)
	if not arg_25_0.compPovAim then
		return
	end

	if not arg_25_1 then
		return
	end

	arg_25_1 = arg_25_1 * (var_0_0.VIEW_STICK_RATIO * 1080 / Screen.height)

	arg_25_0:SetAxisInput("m_HorizontalAxis", arg_25_1.x)
	arg_25_0:SetAxisInput("m_VerticalAxis", arg_25_1.y)
end

function var_0_0.SetAxisInput(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.compPovAim[arg_26_1]

	var_26_0.m_InputAxisValue = arg_26_2
	arg_26_0.compPovAim[arg_26_1] = var_26_0
end

function var_0_0.UpdatePlayerMove(arg_27_0)
	if not arg_27_0.isMoveStickDragging then
		return
	end

	local var_27_0 = Vector2.ClampMagnitude(arg_27_0.moveStickPosition - arg_27_0.moveStickOrigin, var_0_0.MOVE_STICK_RANGE)
	local var_27_1 = var_27_0 / var_0_0.MOVE_STICK_RANGE

	arg_27_0.moveStickPosition = arg_27_0.moveStickOrigin + var_27_0

	local var_27_2 = Vector3.New(var_27_1.x, 0, var_27_1.y)

	if var_27_2:SqrMagnitude() <= 0 then
		return
	end

	local var_27_3 = arg_27_0.mainCameraTF:TransformDirection(var_27_2)

	var_27_3.y = 0

	local var_27_4 = var_27_3:Normalize()

	var_27_4:Mul(var_0_0.MOVE_SPEED)
	arg_27_0.characterController:SimpleMove(var_27_4)
end

return var_0_0

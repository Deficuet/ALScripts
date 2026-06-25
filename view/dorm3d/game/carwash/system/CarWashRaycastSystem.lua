local var_0_0 = class("CarWashRaycastSystem", import("view.dorm3d.Game.CarWash.CarWashBaseSystem"))

var_0_0.UPDATE_COMMON_RAYCAST = "CarWashRaycastSystem.UPDATE_COMMON_RAYCAST"
var_0_0.UPDATE_DECAL_RAYCAST = "CarWashRaycastSystem.UPDATE_DECAL_RAYCAST"

function var_0_0.OnInit(arg_1_0)
	arg_1_0:InitSceneRefs()

	arg_1_0.isShooting = false
	arg_1_0.onShootTime = 0
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_IS_SHOOTING, function(arg_3_0, arg_3_1)
		arg_2_0.isShooting = arg_3_1.newValue
		arg_2_0.onShootTime = 0
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_CURRENT_GUN_TYPE, function(arg_4_0, arg_4_1)
		arg_2_0:OnSwitchGun(arg_4_1.newValue)
	end)
end

function var_0_0.OnDispose(arg_5_0)
	arg_5_0.mainCamera = nil
	arg_5_0.sceneRaycaster = nil
	arg_5_0.gunTF = nil
	arg_5_0.muzzle = nil
	arg_5_0.isShooting = nil
	arg_5_0.onShootTime = nil
end

function var_0_0.OnUpdate(arg_6_0, arg_6_1)
	if not arg_6_0.isShooting then
		return
	end

	arg_6_0:UpdateCommonRaycast(arg_6_1)
	arg_6_0:UpdateDecalRaycast(arg_6_1)
end

function var_0_0.InitSceneRefs(arg_7_0)
	arg_7_0.mainCamera = arg_7_0:GetMainCamera()
	arg_7_0.sceneRaycaster = arg_7_0:GetRaycaster()
	arg_7_0.gunTF = arg_7_0:GetMainCameraTF():Find("[GUNROOT]/gun")

	assert(arg_7_0.gunTF, "CarWash gun node not found: gun")
end

function var_0_0.OnSwitchGun(arg_8_0, arg_8_1)
	local var_8_0 = CarWashConst.GetGunConfig(arg_8_1)

	assert(var_8_0, "CarWash gun config not found: " .. tostring(arg_8_1))
	assert(var_8_0.name, "CarWash gun name not found: " .. tostring(arg_8_1))

	local var_8_1 = arg_8_0.gunTF:Find(var_8_0.name)

	assert(var_8_1, "CarWash gun model not found: " .. var_8_0.name)

	arg_8_0.muzzle = var_8_1:Find("muzzle")

	assert(arg_8_0.muzzle, "CarWash gun muzzle not found: " .. var_8_0.name .. "/muzzle")
end

function var_0_0.UpdateCommonRaycast(arg_9_0, arg_9_1)
	local var_9_0, var_9_1 = arg_9_0:RaycastScreenCenter(CarWashConst.EFFECT_LAYER_MASK, CarWashConst.DEFAULT_RAY_DISTANCE)

	arg_9_0:EmitRaycastResult(var_0_0.UPDATE_COMMON_RAYCAST, var_9_0, var_9_1, {}, arg_9_1)
end

function var_0_0.UpdateDecalRaycast(arg_10_0, arg_10_1)
	arg_10_0.onShootTime = arg_10_0.onShootTime + arg_10_1

	if arg_10_0.onShootTime < CarWashDecalSystem.ON_SHOOT_INTERVAL then
		return
	end

	arg_10_0.onShootTime = arg_10_0.onShootTime - CarWashDecalSystem.ON_SHOOT_INTERVAL

	local var_10_0 = arg_10_0:RaycastSceneRaycasterScreenCenter()
	local var_10_1, var_10_2 = arg_10_0:RaycastScreenCenter(CarWashConst.LAYER_MASK, CarWashConst.DEFAULT_RAY_DISTANCE)

	arg_10_0:EmitRaycastResult(var_0_0.UPDATE_DECAL_RAYCAST, var_10_1, var_10_2, var_10_0, CarWashDecalSystem.ON_SHOOT_INTERVAL)
end

function var_0_0.EmitRaycastResult(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
	arg_11_0:Emit(arg_11_1, {
		hit = arg_11_2,
		hitInfo = arg_11_3,
		targets = arg_11_4,
		ray = arg_11_0:GetScreenCenterRay(),
		muzzleRay = arg_11_0:GetMuzzleRay(arg_11_2, arg_11_3),
		deltaTime = arg_11_5
	})
end

function var_0_0.GetScreenCenterPoint(arg_12_0)
	return Vector3.New(Screen.width * 0.5, Screen.height * 0.5, 0)
end

function var_0_0.GetScreenCenterRay(arg_13_0)
	local var_13_0 = arg_13_0:GetScreenCenterPoint()

	return arg_13_0.mainCamera:ScreenPointToRay(var_13_0)
end

function var_0_0.GetMuzzleRay(arg_14_0, arg_14_1, arg_14_2)
	if not arg_14_0.muzzle then
		return nil
	end

	local var_14_0 = arg_14_0.muzzle.position
	local var_14_1 = (arg_14_1 and arg_14_2 and arg_14_2.point or var_14_0 + arg_14_0.muzzle.forward * CarWashConst.DEFAULT_RAY_DISTANCE) - var_14_0

	if var_14_1:SqrMagnitude() <= 1e-06 then
		var_14_1 = arg_14_0.muzzle.forward
	else
		var_14_1 = var_14_1:Normalize()
	end

	return Ray.New(var_14_1, var_14_0)
end

function var_0_0.RaycastScreenCenter(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0:GetScreenCenterRay()

	arg_15_2 = arg_15_2 or CarWashConst.DEFAULT_RAY_DISTANCE

	return Physics.Raycast(var_15_0.origin, var_15_0.direction, nil, arg_15_2, arg_15_1)
end

function var_0_0.RaycastSceneRaycasterScreenCenter(arg_16_0)
	return CameraMgr.instance:Raycast(arg_16_0.sceneRaycaster, arg_16_0:GetScreenCenterPoint()):ToTable()
end

return var_0_0

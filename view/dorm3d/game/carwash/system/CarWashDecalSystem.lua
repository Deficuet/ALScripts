local var_0_0 = class("CarWashDecalSystem", import("view.dorm3d.Game.CarWash.CarWashBaseSystem"))

var_0_0.GENERATE_DECALS = "CarWashDecalSystem.GENERATE_DECALS"
var_0_0.GENERATOR_NAME = "[DECALROOT]/[DECAL GENERATOR]"
var_0_0.ON_SHOOT_INTERVAL = 0.1

function var_0_0.OnInit(arg_1_0)
	arg_1_0:InitSceneRefs()

	arg_1_0.selectedCarDecalType = nil
	arg_1_0.selectedLadyDecalType = nil
	arg_1_0.isShooting = false
end

function var_0_0.RegisterEvents(arg_2_0)
	arg_2_0:Bind(var_0_0.GENERATE_DECALS, function(arg_3_0)
		arg_2_0:RegenerateAll(System.Action_int(function(arg_4_0)
			arg_2_0:Emit(CarWashGameFlowSystem.SET_STAINS_COUNT_MAX, arg_4_0)
			arg_2_0:Emit(CarWashGameFlowSystem.SET_STAINS_COUNT, arg_4_0)
		end))
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_IS_SHOOTING, function(arg_5_0, arg_5_1)
		arg_2_0.isShooting = arg_5_1.newValue
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_CURRENT_GUN_TYPE, function(arg_6_0, arg_6_1)
		arg_2_0:OnSwitchGun(arg_6_1.newValue)
	end)
	arg_2_0:Bind(CarWashRaycastSystem.UPDATE_DECAL_RAYCAST, function(arg_7_0, arg_7_1)
		arg_2_0:OnShootLogic(arg_7_1)
	end)
	arg_2_0:Bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_BEGIN, function(arg_8_0)
		arg_2_0:EnableDecalRoot(false)
	end)
	arg_2_0:Bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_END, function(arg_9_0)
		arg_2_0:EnableDecalRoot(true)
	end)
	arg_2_0:Bind(CarWashGameFlowSystem.UPDATE_GAME_STATE, function(arg_10_0, arg_10_1)
		if arg_10_1.newValue == CarWashConst.GAME_STATE.PHASE_2 then
			arg_2_0:EnableDecalRoot(false)
		elseif arg_10_1.newValue == CarWashConst.GAME_STATE.PHASE_1 then
			arg_2_0:EnableDecalRoot(true)
		end
	end)
end

function var_0_0.OnDispose(arg_11_0)
	arg_11_0.randomDecalGenerator = nil
	arg_11_0.generatorTF = nil
	arg_11_0.decalParent = nil
end

function var_0_0.InitSceneRefs(arg_12_0)
	local var_12_0 = GameObject.Find(var_0_0.GENERATOR_NAME)

	assert(var_12_0, "CarWash RandomDecalGenerator object not found: " .. var_0_0.GENERATOR_NAME)

	arg_12_0.generatorTF = var_12_0.transform
	arg_12_0.decalParent = arg_12_0.generatorTF
	arg_12_0.randomDecalGenerator = var_12_0:GetComponent(typeof(RandomDecalGenerator))

	assert(arg_12_0.randomDecalGenerator, "RandomDecalGenerator component not found on " .. var_0_0.GENERATOR_NAME)
end

function var_0_0.EnableDecalRoot(arg_13_0, arg_13_1)
	if arg_13_0.decalParent then
		setActive(arg_13_0.decalParent, arg_13_1)
	end
end

function var_0_0.GenerateDecals(arg_14_0)
	return arg_14_0:GenerateAll()
end

function var_0_0.OnSwitchGun(arg_15_0, arg_15_1)
	local var_15_0 = CarWashConst.GetGunConfig(arg_15_1)

	assert(var_15_0, "CarWash gun config not found: " .. tostring(arg_15_1))

	local var_15_1 = var_15_0.decalType

	assert(var_15_1, "CarWash decal types not found for gun type: " .. tostring(arg_15_1))
	assert(var_15_1.onCar, "CarWash car decal type not found for gun type: " .. tostring(arg_15_1))
	assert(var_15_1.onLady, "CarWash lady decal type not found for gun type: " .. tostring(arg_15_1))

	arg_15_0.currentGunType = arg_15_1
	arg_15_0.selectedCarDecalType = var_15_1.onCar
	arg_15_0.selectedLadyDecalType = var_15_1.onLady
end

function var_0_0.OnShootLogic(arg_16_0, arg_16_1)
	if not arg_16_0.isShooting then
		return
	end

	local var_16_0 = arg_16_1.targets
	local var_16_1 = arg_16_1.hit
	local var_16_2 = arg_16_1.hitInfo
	local var_16_3 = false
	local var_16_4
	local var_16_5 = false
	local var_16_6 = {}
	local var_16_7 = 16191
	local var_16_8 = 16191

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		local var_16_9 = iter_16_1.gameObject
		local var_16_10 = var_16_9.transform

		if var_16_9.layer == CarWashConst.CAR_LAYER then
			var_16_5 = true
			var_16_7 = math.min(var_16_7, iter_16_0)
		end

		if var_16_9.layer == CarWashConst.LADY_LAYER then
			var_16_3 = true
			var_16_4 = var_16_10
			var_16_8 = math.min(var_16_8, iter_16_0)
		end

		local var_16_11 = var_16_9:GetComponent(typeof(DecalController))

		if var_16_11 then
			table.insert(var_16_6, var_16_11)
		end
	end

	if var_16_1 and var_16_3 and var_16_8 < var_16_7 and not table.contains(arg_16_0:GetGameConfig().non_decal_colliders, var_16_2.collider.name) then
		assert(var_16_2, "CarWash decal hitInfo is nil")

		if not _.any(var_16_6, function(arg_17_0)
			return arg_17_0.decalType == arg_16_0.selectedLadyDecalType
		end) then
			arg_16_0:GenerateDecalAtScreenCenter(arg_16_0.selectedLadyDecalType, var_16_2, arg_16_0:GetColliderBone(var_16_4), arg_16_0:GetCapsuleColliderRadius(var_16_4))
		end
	end

	if var_16_1 and var_16_5 and var_16_7 < var_16_8 then
		assert(var_16_2, "CarWash decal hitInfo is nil")

		if not _.any(var_16_6, function(arg_18_0)
			return arg_18_0.decalType == arg_16_0.selectedCarDecalType
		end) then
			arg_16_0:GenerateDecalAtScreenCenter(arg_16_0.selectedCarDecalType, var_16_2)
		end

		for iter_16_2, iter_16_3 in ipairs(var_16_6) do
			local var_16_12 = CarWashConst.GetStainsConfig(iter_16_3.decalType)

			if var_16_12 then
				local var_16_13 = 0
				local var_16_14 = arg_16_0.currentGunType == var_16_12.targetGunType
				local var_16_15 = var_16_12.coverDecal and _.any(var_16_6, function(arg_19_0)
					return arg_19_0.decalType == var_16_12.coverDecal
				end)
				local var_16_16 = var_16_13 + (var_16_14 and var_16_12.fadePerSec or 0) + (var_16_14 and var_16_15 and var_16_12.coverBuff or 0)

				if var_16_16 > 0 then
					iter_16_3:SetAlpha(iter_16_3.Alpha - var_16_16 * var_0_0.ON_SHOOT_INTERVAL)
				end

				if iter_16_3.Alpha <= 0 then
					StaticDecalSpawner.Despawn(iter_16_3)
					arg_16_0:Emit(CarWashGameFlowSystem.DECREASE_STAINS_COUNT, 1)
				end
			end
		end
	end
end

function var_0_0.GetColliderBone(arg_20_0, arg_20_1)
	return arg_20_1.parent
end

function var_0_0.GetCapsuleColliderRadius(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:GetComponent(typeof("UnityEngine.CapsuleCollider"))
	local var_21_1 = 16191

	if var_21_0 then
		var_21_1 = var_21_0.radius * 2 - 0.01
	end

	return math.min(var_21_1, CarWashConst.DEFAULT_LADY_DECAL_SIZE)
end

function var_0_0.GenerateDecalAtScreenCenter(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	assert(arg_22_1, "CarWash decal type is nil")

	local var_22_0 = CarWashConst.GetDecalConfig(arg_22_1)

	assert(var_22_0, "CarWash decal config not found: " .. tostring(arg_22_1))

	local var_22_1 = arg_22_4 or math.random() * (CarWashConst.ORTHOGRAPHIC_SIZE_RANGE[2] - CarWashConst.ORTHOGRAPHIC_SIZE_RANGE[1]) + CarWashConst.ORTHOGRAPHIC_SIZE_RANGE[1]
	local var_22_2 = math.floor(var_22_1 * 100) / 100
	local var_22_3 = math.random() * (CarWashConst.ROTATE_RANGE[2] - CarWashConst.ROTATE_RANGE[1]) + CarWashConst.ROTATE_RANGE[1]
	local var_22_4, var_22_5 = DecalRaycastUtil.TryComputeDecalPlacement(arg_22_2.point, arg_22_2.normal, var_22_2, var_22_0.aspectRatio, CarWashConst.LAYER_MASK, var_22_3, nil)

	if not var_22_4 then
		return nil
	end

	local var_22_6 = arg_22_0:GetSourceMaterial(var_22_0.sourceMaterial)

	if not var_22_6 then
		return nil
	end

	return DecalControllerPoolMgr.Inst:Acquire(var_22_5.position, var_22_5.rotation, arg_22_3 or arg_22_0.decalParent, var_22_6, var_22_2, var_22_0.aspectRatio, var_22_5.nearClip, var_22_5.farClip, var_22_0.renderQueue, var_22_0.decalType or arg_22_1, var_22_0.useAutoFade, var_22_0.autoFadeStartTime, var_22_0.autoFadeTime)
end

function var_0_0.GetSourceMaterial(arg_23_0, arg_23_1)
	assert(type(arg_23_1) == "table", "CarWash decal sourceMaterial config should be table")
	assert(#arg_23_1 > 0, "CarWash decal sourceMaterial config is empty")

	local var_23_0 = arg_23_1[math.random(1, #arg_23_1)]
	local var_23_1 = DecalMaterialPoolMgr.Inst

	assert(var_23_1, "DecalMaterialPoolMgr.Inst not found")

	local var_23_2 = var_23_1.sourceMaterials

	assert(var_23_2, "DecalMaterialPoolMgr.sourceMaterials not found")
	assert(var_23_0 >= 0 and var_23_0 < var_23_2.Count, "Invalid decal sourceMaterial index: " .. tostring(var_23_0))

	return var_23_2:get_Item(var_23_0)
end

function var_0_0.GenerateAll(arg_24_0)
	if not arg_24_0.randomDecalGenerator then
		return 0
	end

	return arg_24_0.randomDecalGenerator:GenerateAll()
end

function var_0_0.GenerateRegion(arg_25_0, arg_25_1)
	if not arg_25_0.randomDecalGenerator then
		return 0
	end

	return arg_25_0.randomDecalGenerator:GenerateRegion(arg_25_1)
end

function var_0_0.RegenerateAll(arg_26_0, arg_26_1)
	if not arg_26_0.randomDecalGenerator then
		return 0
	end

	return arg_26_0.randomDecalGenerator:RegenerateAll(arg_26_1)
end

function var_0_0.RegenerateRegion(arg_27_0, arg_27_1)
	if not arg_27_0.randomDecalGenerator then
		return 0
	end

	return arg_27_0.randomDecalGenerator:RegenerateRegion(arg_27_1)
end

function var_0_0.ClearGenerated(arg_28_0)
	if not arg_28_0.randomDecalGenerator then
		return
	end

	arg_28_0.randomDecalGenerator:ClearGenerated()
end

return var_0_0

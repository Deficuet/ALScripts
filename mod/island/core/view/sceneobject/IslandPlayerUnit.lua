local var_0_0 = require("Framework.toLua.UnityEngine.Vector3")
local var_0_1 = require("Framework.toLua.UnityEngine.Vector2")
local var_0_2 = var_0_0.zero
local var_0_3 = class("IslandPlayerUnit", import(".IslandNavigableUnit"))
local var_0_4 = 5
local var_0_5 = 150
local var_0_6 = var_0_1(1.8, 1.8)
local var_0_7 = var_0_1(0, 2)
local var_0_8 = LayerMask.NameToLayer("IgnoreIslandCharacter")
local var_0_9 = bit.bnot(bit.lshift(1, var_0_8))
local var_0_10 = {
	LoadToolHandle = 2,
	JumpHandle = 1,
	NoMoveAndWork = 3,
	AttackHandle = 4
}

function var_0_3.OnAttach(arg_1_0, arg_1_1)
	var_0_3.super.OnAttach(arg_1_0, arg_1_1)

	arg_1_0.mapId = getProxy(IslandProxy):GetIsland():GetMapId()
	arg_1_0._tf = arg_1_0._go.transform
	arg_1_0.animator = arg_1_0._tf:GetChild(0):GetComponent(typeof(Animator))
	arg_1_0.characterController = arg_1_0._go:GetComponent(typeof(CharacterController))
	arg_1_0.characterHandleController = arg_1_0._go:GetComponent(typeof(CharacterHandleController))

	local var_1_0 = pg.island_set.detection_parameters.key_value_varchar

	var_0_4 = var_1_0[2]
	var_0_5 = var_1_0[1]
	var_0_7 = var_0_1(0, var_1_0[3])

	arg_1_0.characterHandleController:SetDrawParameter(var_0_4, var_0_5, var_1_0[3])
	arg_1_0.characterHandleController:AddStateEnterFunc(function(arg_2_0, arg_2_1)
		arg_1_0:StateEnterHandle(arg_2_0, arg_2_1)
	end)
	arg_1_0.characterHandleController:AddStateExitFunc(function(arg_3_0, arg_3_1)
		arg_1_0:StateExitHandle(arg_3_0, arg_3_1)
	end)
	arg_1_0.characterHandleController:AddStateEnterFixCompleteFunc(function(arg_4_0, arg_4_1)
		arg_1_0:StateEnterFixHandle(arg_4_0, arg_4_1)
	end)
	arg_1_0.characterHandleController:AddStateExitFixCompleteFunc(function(arg_5_0, arg_5_1)
		arg_1_0:StateExitFixHandle(arg_5_0, arg_5_1)
	end)

	arg_1_0.targetSpeed = 0
	arg_1_0.speed = 0
	arg_1_0.gravitySpeed = 0
	arg_1_0.jumpVector = Vector3.zero

	local var_1_1 = pg.island_set.player_movement_parameters.key_value_varchar

	arg_1_0.degreeSpeed = 720
	arg_1_0.maxSpeed = var_1_1[1]
	arg_1_0.sprintSpeed = var_1_1[2]
	arg_1_0.upSpeedDamping = 3
	arg_1_0.downSpeedDamping = 6
	arg_1_0.jumpHeight = var_1_1[3]
	arg_1_0.targetDir = Vector3.zero
	arg_1_0.velocity = Vector3.zero
	arg_1_0.extraVelocity = Vector3.zero
	arg_1_0.isSitting = false
	arg_1_0.prevStandPosition = nil
	arg_1_0.checkInSet = {}
	arg_1_0.lastCrossCount = 0
	arg_1_0.orginTargetDir = var_0_2

	arg_1_0:InitDress()
	arg_1_0:InitFarmCheckWorldObject()

	arg_1_0.objTfList = {}
	arg_1_0.islandid = arg_1_0:GetView():GetIsland().id
	arg_1_0.isSelfIsland = getProxy(PlayerProxy):getRawData().id == arg_1_0.islandid
end

function var_0_3.InitJump(arg_6_0, arg_6_1)
	arg_6_0.jumpCurve = arg_6_1
	arg_6_0.jumpCruveAllTime = arg_6_0.jumpCurve.keys[arg_6_0.jumpCurve.length - 1].time
end

function var_0_3.OnLateUpdate(arg_7_0)
	return
end

function var_0_3.OnUpdate(arg_8_0)
	arg_8_0:RefreshTemp()

	local var_8_0 = Time.deltaTime

	arg_8_0:PositionTween(var_8_0)
	arg_8_0:Rotation(var_8_0)
	arg_8_0:Move(var_8_0)
	arg_8_0:Detectionobject()
end

function var_0_3.RefreshTemp(arg_9_0)
	arg_9_0.ignoreStepdown = false
	arg_9_0.gravityAcc = IslandConst.GRAVITYACC

	if arg_9_0.orginTargetDir.x ~= 0 or arg_9_0.orginTargetDir.z ~= 0 then
		local var_9_0 = IslandCameraMgr.instance._mainCamera.transform:TransformVector(arg_9_0.orginTargetDir)

		arg_9_0.targetDir = var_0_0(var_9_0.x, 0, var_9_0.z).normalized

		if arg_9_0.targetDir ~= Vector3.zero then
			arg_9_0.targetRotation = Quaternion.LookRotation(arg_9_0.targetDir)
		end
	end
end

function var_0_3.Rotation(arg_10_0, arg_10_1)
	if arg_10_0.targetRotation then
		local var_10_0 = Quaternion.RotateTowards(arg_10_0._tf.rotation, arg_10_0.targetRotation, arg_10_0.degreeSpeed * arg_10_1)

		arg_10_0._tf.rotation = var_10_0
	end
end

function var_0_3.SetTargetRotation(arg_11_0, arg_11_1)
	arg_11_0.targetRotation = arg_11_1
end

function var_0_3.Move(arg_12_0, arg_12_1)
	if Mathf.Approximately(arg_12_0.speed, arg_12_0.targetSpeed) then
		arg_12_0.speed = arg_12_0.targetSpeed
	elseif arg_12_0.targetSpeed > arg_12_0.speed then
		arg_12_0.speed = Mathf.Lerp(arg_12_0.speed, arg_12_0.targetSpeed, arg_12_0.upSpeedDamping * arg_12_1)
	else
		arg_12_0.speed = Mathf.Lerp(arg_12_0.speed, arg_12_0.targetSpeed, arg_12_0.downSpeedDamping * arg_12_1)
	end

	arg_12_0.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_12_0.speed)

	arg_12_0.velocity = arg_12_0.targetDir * arg_12_0.speed

	local var_12_0 = arg_12_0.gravityAcc * arg_12_1

	arg_12_0.gravitySpeed = arg_12_0.gravitySpeed + var_12_0
	arg_12_0.onGroud = true

	local var_12_1 = 0

	if arg_12_0.gravitySpeed >= 0 then
		local var_12_2, var_12_3 = arg_12_0:CalcGrounded()

		if var_12_2 then
			arg_12_0.gravitySpeed = 0
			var_12_1 = var_12_3
		else
			local var_12_4, var_12_5 = arg_12_0:CalcNotFalling()

			if var_12_4 then
				arg_12_0.gravitySpeed = 0
				var_12_1 = var_12_5
			else
				arg_12_0.onGroud = false
			end
		end
	else
		arg_12_0.onGroud = false
	end

	arg_12_0.animator:SetBool(IslandConst.GROUD_FLAG, arg_12_0.onGroud)

	local var_12_6 = Vector3(0, IslandConst.GRAVITYDIR.y * var_12_1, 0)

	if arg_12_0.ignoreStepdown then
		var_12_6 = var_0_2
	end

	local var_12_7 = arg_12_0.jumpVector + var_12_6
	local var_12_8 = Vector3(0, IslandConst.GRAVITYDIR.y * arg_12_0.gravitySpeed, 0)

	arg_12_0.characterController:Move((arg_12_0.velocity + var_12_8) * Time.deltaTime + var_12_7 + arg_12_0.extraVelocity * Time.deltaTime)
end

function var_0_3.PositionTween(arg_13_0, arg_13_1)
	if arg_13_0._positionTweenCom ~= nil then
		arg_13_0._positionTweenCom.elapse = arg_13_0._positionTweenCom.elapse + arg_13_1

		local var_13_0 = arg_13_0.jumpCurve:Evaluate(arg_13_0._positionTweenCom.elapse)
		local var_13_1 = var_13_0 - arg_13_0._positionTweenCom.oldPosition

		arg_13_0._positionTweenCom.oldPosition = var_13_0

		local var_13_2 = UnityEngine.Matrix4x4.TRS(arg_13_0._tf.position, arg_13_0._tf.rotation, Vector3.one):MultiplyVector(var_0_0.New(0, var_13_1, 0))

		arg_13_0.gravityAcc = 0
		arg_13_0.ignoreStepdown = true

		if arg_13_0._positionTweenCom.elapse >= arg_13_0._positionTweenCom.duration - 0.001 then
			arg_13_0._positionTweenCom = nil
			arg_13_0.gravitySpeed = Vector3.Dot(Vector3(0, -1, 0), var_13_2) / arg_13_1
			arg_13_0.jumpVector = var_0_2
		else
			arg_13_0.jumpVector = var_13_2
			arg_13_0.gravitySpeed = 0
		end
	end
end

function var_0_3.CalcGrounded(arg_14_0)
	local var_14_0, var_14_1 = Physics.SphereCast(arg_14_0._tf.position + arg_14_0.characterController.center, arg_14_0.characterController.radius, Vector3.down, nil, 2 * arg_14_0.characterController.skinWidth + (0.5 * arg_14_0.characterController.height - arg_14_0.characterController.radius), var_0_9)

	if var_14_0 then
		local var_14_2 = arg_14_0._tf.position.y + arg_14_0.characterController.skinWidth - var_14_1.point.y

		if var_14_1.collider.isTrigger then
			return true, 0
		end

		return true, var_14_2
	end

	return false
end

function var_0_3.CalcNotFalling(arg_15_0)
	local var_15_0, var_15_1 = Physics.SphereCast(arg_15_0._tf.position + arg_15_0.characterController.center, arg_15_0.characterController.radius, Vector3.down, nil, 0.3 + 2 * arg_15_0.characterController.skinWidth + (0.5 * arg_15_0.characterController.height - arg_15_0.characterController.radius), var_0_9)

	if var_15_0 then
		local var_15_2 = arg_15_0._tf.position.y + arg_15_0.characterController.skinWidth - var_15_1.point.y

		if var_15_1.collider.isTrigger then
			return false
		end

		return true, var_15_2
	end

	return false
end

function var_0_3.Sit(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.characterController.enabled = false
	arg_16_0.prevStandPosition = arg_16_0._tf.position
	arg_16_0._tf.position = arg_16_1

	local var_16_0 = arg_16_0._tf:Find("all/foot_l_d_mount")
	local var_16_1 = Quaternion.LookRotation(arg_16_2, Vector3.New(0, 1, 0))

	arg_16_0._tf.rotation = var_16_1

	arg_16_0.animator:SetBool(IslandConst.SIT_HASH, true)

	arg_16_0.isSitting = true
end

function var_0_3.MoveHandle(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0.cantMove then
		return
	end

	if arg_17_0.isSitting and arg_17_0.prevStandPosition then
		arg_17_0.characterController.enabled = true
		arg_17_0._tf.position = arg_17_0.prevStandPosition

		arg_17_0.animator:SetBool(IslandConst.SIT_HASH, false)

		arg_17_0.isSitting = false

		return
	end

	if arg_17_0.animator then
		arg_17_0.animator:SetFloat(IslandConst.INPUT_MAGNITUDE, arg_17_2)
	end

	arg_17_0.orginTargetDir = arg_17_1
	arg_17_0.lastTargetSpeed = arg_17_2 * arg_17_0.maxSpeed
	arg_17_0.targetSpeed = arg_17_0.isSprint and arg_17_0.sprintSpeed or arg_17_0.lastTargetSpeed
end

function var_0_3.StopMoveHandle(arg_18_0)
	arg_18_0.targetSpeed = 0
	arg_18_0.speed = 0

	arg_18_0.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, 0)
	arg_18_0.animator:SetFloat(IslandConst.INPUT_MAGNITUDE, 0)

	arg_18_0.orginTargetDir = var_0_2
	arg_18_0.isSprint = false
end

function var_0_3.StopMoveHandleByInput(arg_19_0)
	arg_19_0.targetSpeed = 0

	arg_19_0.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, 0)
	arg_19_0.animator:SetFloat(IslandConst.INPUT_MAGNITUDE, 0)

	arg_19_0.orginTargetDir = var_0_2
	arg_19_0.isSprint = false
end

function var_0_3.JumpHandle(arg_20_0)
	if arg_20_0.cantMove then
		return
	end

	if arg_20_0:CheckCanJump() then
		arg_20_0.animator:SetTrigger(IslandConst.JUMP_FLAG)
	end
end

function var_0_3.WorkHandle(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0.cantMove then
		return
	end

	if arg_21_2 then
		arg_21_0.unitData = arg_21_2

		local var_21_0 = arg_21_2.position - arg_21_0:GetCurrentPosition()
		local var_21_1 = var_0_0(var_21_0.x, 0, var_21_0.z).normalized

		arg_21_0.targetRotation = Quaternion.LookRotation(var_21_1)
	end

	arg_21_0.animator:SetTrigger(arg_21_1)
end

function var_0_3.DeviceStateHandle(arg_22_0, arg_22_1)
	if not arg_22_0.animator then
		return
	end

	if arg_22_0.view:GetController():IsPlayerInTimeline() then
		return
	end

	if arg_22_1 then
		arg_22_0.animator:SetTrigger(IslandConst.DEVICE_SHOW_FLAG)
		arg_22_0.animator:ResetTrigger(IslandConst.UN_DEVICE_SHOW_FLAG)
	else
		arg_22_0.animator:SetTrigger(IslandConst.UN_DEVICE_SHOW_FLAG)
	end
end

function var_0_3.OnPlayerPlayerSprint(arg_23_0)
	if arg_23_0.targetSpeed ~= 0 then
		arg_23_0.isSprint = true
		arg_23_0.lastTargetSpeed = arg_23_0.targetSpeed
		arg_23_0.targetSpeed = arg_23_0.sprintSpeed
		arg_23_0.speed = arg_23_0.targetSpeed
	end
end

function var_0_3.OnStopPlayerSprint(arg_24_0)
	if arg_24_0.isSprint and arg_24_0.targetSpeed ~= 0 then
		arg_24_0.targetSpeed = arg_24_0.lastTargetSpeed
		arg_24_0.speed = arg_24_0.lastTargetSpeed
		arg_24_0.isSprint = false
	end
end

function var_0_3.LoadInteractiveTool(arg_25_0, arg_25_1)
	if arg_25_1 == 0 then
		arg_25_0.toolId = arg_25_0.unitData:GetToolId()
	else
		arg_25_0.toolId = arg_25_1
	end

	local var_25_0 = arg_25_0.objTfList[arg_25_0.toolId]

	if var_25_0 then
		setActive(var_25_0, true)
		setParent(var_25_0, arg_25_0._tf)
		pg.ViewUtils.SetLayer(var_25_0, Layer.UIHidden)

		return
	end

	local var_25_1 = pg.island_animation_attachments[arg_25_0.toolId]
	local var_25_2 = LoadAny(var_25_1.model, nil)
	local var_25_3 = Object.Instantiate(var_25_2)

	arg_25_0.objTfList[arg_25_0.toolId] = var_25_3.transform

	local var_25_4 = LoadAny(var_25_1.animator, nil, typeof(RuntimeAnimatorController))

	GetOrAddComponent(arg_25_0.objTfList[arg_25_0.toolId], typeof(Animator)).runtimeAnimatorController = var_25_4

	setParent(arg_25_0.objTfList[arg_25_0.toolId], arg_25_0._tf)
	pg.ViewUtils.SetLayer(arg_25_0.objTfList[arg_25_0.toolId], Layer.UIHidden)
end

function var_0_3.UnLoadInteractiveTool(arg_26_0)
	if arg_26_0.objTfList[arg_26_0.toolId] then
		setActive(arg_26_0.objTfList[arg_26_0.toolId], false)
	end
end

function var_0_3.NoMoveHandle(arg_27_0, arg_27_1)
	arg_27_0.cantMove = true

	if arg_27_0.delayMoveTimer then
		arg_27_0.delayMoveTimer:Stop()

		arg_27_0.delayMoveTimer = nil
	end

	arg_27_0.delayMoveTimer = Timer.New(function()
		arg_27_0.cantMove = false
	end, arg_27_1, 1)

	arg_27_0.delayMoveTimer:Start()
end

function var_0_3.AttackHandle(arg_29_0, arg_29_1)
	if arg_29_0.delayAttackTimer then
		arg_29_0.delayAttackTimer:Stop()

		arg_29_0.delayAttackTimer = nil
	end

	arg_29_0.delayAttackTimer = Timer.New(function()
		if arg_29_0.unitData then
			arg_29_0:NotifiyCore(ISLAND_EVT.Take_Plant_Attact, {
				type = arg_29_0.unitData.unitType,
				id = arg_29_0.unitData.id
			})
		end
	end, arg_29_1, 1)

	arg_29_0.delayAttackTimer:Start()
end

function var_0_3.StateEnterHandle(arg_31_0, arg_31_1, arg_31_2)
	if arg_31_1 == var_0_10.JumpHandle then
		arg_31_0:OnEnterJumpState()
	elseif arg_31_1 == var_0_10.LoadToolHandle then
		arg_31_0:LoadInteractiveTool(arg_31_2)
	elseif arg_31_1 == var_0_10.NoMoveAndWork then
		arg_31_0:NoMoveHandle(arg_31_2)
	elseif arg_31_1 == var_0_10.AttackHandle then
		arg_31_0:AttackHandle(arg_31_2)
	end
end

function var_0_3.StateEnterFixHandle(arg_32_0, arg_32_1, arg_32_2)
	pg.ViewUtils.SetLayer(arg_32_0.objTfList[arg_32_0.toolId], Layer.Default)
end

function var_0_3.StateExitFixHandle(arg_33_0, arg_33_1, arg_33_2)
	pg.ViewUtils.SetLayer(arg_33_0.objTfList[arg_33_0.toolId], Layer.UIHidden)
end

function var_0_3.StateExitHandle(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_1 == var_0_10.LoadToolHandle then
		arg_34_0:UnLoadInteractiveTool(arg_34_2)
	end
end

function var_0_3.OnEnterJumpState(arg_35_0)
	arg_35_0._positionTweenCom = {
		elapse = 0,
		oldPosition = 0,
		duration = arg_35_0.jumpCruveAllTime
	}
end

local var_0_11 = var_0_1(0, 0)

function var_0_3.InitFarmCheckWorldObject(arg_36_0)
	if not arg_36_0:IsSpecialMap() then
		return
	end

	arg_36_0.detectionList = {}

	for iter_36_0, iter_36_1 in ipairs(pg.island_production_place.get_id_list_by_map_id[arg_36_0.mapId] or {}) do
		for iter_36_2, iter_36_3 in ipairs(pg.island_production_farm.get_id_list_by_place_id[iter_36_1] or {}) do
			local var_36_0 = pg.island_production_farm[iter_36_3]
			local var_36_1 = pg.island_world_objects[var_36_0.objId]

			table.insert(arg_36_0.detectionList, {
				id = var_36_1.id,
				position = var_36_1.param.position
			})
		end
	end
end

function var_0_3.IsSpecialMap(arg_37_0)
	return arg_37_0.mapId == 1001 or arg_37_0.mapId == 1005
end

function var_0_3.IsSelf(arg_38_0)
	return
end

function var_0_3.Detectionobject(arg_39_0)
	if not arg_39_0:IsSpecialMap() or not arg_39_0.isSelfIsland then
		return
	end

	local var_39_0 = {}

	local function var_39_1(arg_40_0)
		local var_40_0 = arg_40_0.position[1]
		local var_40_1 = arg_40_0.position[3]
		local var_40_2 = var_0_6.x / 2
		local var_40_3 = arg_39_0._tf.position.x
		local var_40_4 = arg_39_0._tf.position.z
		local var_40_5 = var_0_4
		local var_40_6 = math.max(var_40_0 - var_40_2, math.min(var_40_3, var_40_0 + var_40_2))
		local var_40_7 = math.max(var_40_1 - var_40_2, math.min(var_40_4, var_40_1 + var_40_2))
		local var_40_8 = var_40_6 - var_40_3
		local var_40_9 = var_40_7 - var_40_4

		return var_40_8 * var_40_8 + var_40_9 * var_40_9 <= var_40_5 * var_40_5
	end

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.detectionList) do
		if arg_39_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, iter_39_1.id):CanCheckByPlayer() and var_39_1(iter_39_1) then
			table.insert(var_39_0, iter_39_1)
		end
	end

	local function var_39_2(arg_41_0, arg_41_1, arg_41_2)
		return (arg_41_2.x - arg_41_0.x) * (arg_41_1.y - arg_41_0.y) - (arg_41_2.y - arg_41_0.y) * (arg_41_1.x - arg_41_0.x)
	end

	local function var_39_3(arg_42_0, arg_42_1, arg_42_2)
		return Mathf.Min(arg_42_0.x, arg_42_1.x) <= arg_42_2.x and arg_42_2.x <= Mathf.Max(arg_42_0.x, arg_42_1.x) and Mathf.Min(arg_42_0.y, arg_42_1.y) <= arg_42_2.y and arg_42_2.y <= Mathf.Max(arg_42_0.y, arg_42_1.y)
	end

	local function var_39_4(arg_43_0, arg_43_1)
		local var_43_0 = #arg_43_1

		for iter_43_0 = 0, var_43_0 do
			local var_43_1 = arg_43_1[iter_43_0]
			local var_43_2 = arg_43_1[(iter_43_0 + 1) % var_43_0] - var_43_1
			local var_43_3 = arg_43_0 - var_43_1

			if var_0_1.Dot(var_43_2.normalized, var_43_3) > 0 then
				return false
			end
		end

		return true
	end

	local function var_39_5(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
		local var_44_0 = var_39_2(arg_44_2, arg_44_3, arg_44_0)
		local var_44_1 = var_39_2(arg_44_2, arg_44_3, arg_44_1)
		local var_44_2 = var_39_2(arg_44_0, arg_44_1, arg_44_2)
		local var_44_3 = var_39_2(arg_44_0, arg_44_1, arg_44_3)

		if (var_44_0 > 0 and var_44_1 < 0 or var_44_0 < 0 and var_44_1 > 0) and (var_44_2 > 0 and var_44_3 < 0 or var_44_2 < 0 and var_44_3 > 0) then
			return true
		end

		if var_44_0 == 0 and var_39_3(arg_44_2, arg_44_3, arg_44_0) then
			return true
		end

		if var_44_1 == 0 and var_39_3(arg_44_2, arg_44_3, arg_44_1) then
			return true
		end

		if var_44_2 == 0 and var_39_3(arg_44_0, arg_44_1, arg_44_2) then
			return true
		end

		if var_44_3 == 0 and var_39_3(arg_44_0, arg_44_1, arg_44_3) then
			return true
		end

		return false
	end

	local function var_39_6(arg_45_0, arg_45_1)
		local var_45_0 = {}
		local var_45_1 = arg_45_1 * Mathf.Deg2Rad
		local var_45_2 = Mathf.Cos(var_45_1)
		local var_45_3 = Mathf.Sin(var_45_1)
		local var_45_4 = var_0_6 * 0.5

		var_45_0[0] = arg_45_0 + var_0_1(-var_45_4.x * var_45_2 - var_45_4.y * var_45_3, -var_45_4.x * var_45_3 + var_45_4.y * var_45_2)
		var_45_0[1] = arg_45_0 + var_0_1(var_45_4.x * var_45_2 - var_45_4.y * var_45_3, var_45_4.x * var_45_3 + var_45_4.y * var_45_2)
		var_45_0[2] = arg_45_0 + var_0_1(var_45_4.x * var_45_2 + var_45_4.y * var_45_3, var_45_4.x * var_45_3 - var_45_4.y * var_45_2)
		var_45_0[3] = arg_45_0 + var_0_1(-var_45_4.x * var_45_2 + var_45_4.y * var_45_3, -var_45_4.x * var_45_3 - var_45_4.y * var_45_2)

		return var_45_0
	end

	local function var_39_7(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
		local var_46_0 = var_39_6(arg_46_0, arg_46_1)

		for iter_46_0 = 0, 3 do
			local var_46_1 = var_46_0[iter_46_0]
			local var_46_2 = var_46_0[(iter_46_0 + 1) % 4]

			if var_39_5(arg_46_2, arg_46_3, var_46_1, var_46_2) then
				return true
			end
		end

		if var_39_4(arg_46_2, var_46_0) or var_39_4(arg_46_3, var_46_0) then
			return true
		end

		return false
	end

	local function var_39_8(arg_47_0, arg_47_1, arg_47_2)
		local var_47_0 = arg_47_0 - arg_47_2
		local var_47_1 = var_0_1.Dot(var_47_0, arg_47_1)
		local var_47_2 = var_0_1.Dot(var_47_0, var_0_1(-arg_47_1.y, arg_47_1.x))
		local var_47_3 = var_0_1(var_47_1, var_47_2)
		local var_47_4 = var_0_6 * 0.5
		local var_47_5 = var_0_1.Max(var_47_3 - var_0_1.zero, var_0_1.zero - var_47_3)
		local var_47_6 = var_0_1.Max(var_47_5 - var_47_4, var_0_1.zero)
		local var_47_7 = var_0_1.Angle(var_47_6, var_0_1.right)
		local var_47_8 = (180 - var_0_5) / 2
		local var_47_9 = var_39_7(var_47_5, 0, var_0_1.zero, var_0_1(var_0_4 * Mathf.Cos(15 * Mathf.Deg2Rad), var_0_4 * Mathf.Sin(15 * Mathf.Deg2Rad)))

		return var_47_8 <= var_47_7 or var_47_9
	end

	local function var_39_9(arg_48_0)
		if var_0_0.Dot(var_0_0(arg_48_0.position[1], arg_48_0.position[2], arg_48_0.position[3]) - arg_39_0._tf.position, arg_39_0._tf.forward) < 0 then
			return
		end

		local var_48_0 = var_0_1(arg_48_0.position[1], arg_48_0.position[3])
		local var_48_1 = arg_39_0:Vector3ToVector2(arg_39_0._tf.position) + var_0_11

		return var_39_8(var_48_0, arg_39_0:Vector3ToVector2(arg_39_0._tf.right), var_48_1)
	end

	local var_39_10 = {}

	for iter_39_2, iter_39_3 in ipairs(var_39_0) do
		if var_39_9(iter_39_3) then
			table.insert(var_39_10, iter_39_3)
		end
	end

	local var_39_11 = #var_39_10
	local var_39_12 = false

	if var_39_11 ~= 0 then
		local var_39_13
		local var_39_14 = arg_39_0:Vector3ToVector2(arg_39_0._tf.position) + var_0_11 + arg_39_0:Vector3ToVector2(arg_39_0._tf.forward) * 2
		local var_39_15 = 10
		local var_39_16 = {}

		for iter_39_4, iter_39_5 in ipairs(var_39_10) do
			local var_39_17 = (var_0_1(iter_39_5.position[1], iter_39_5.position[3]) - var_39_14):Magnitude()

			if var_39_17 < var_39_15 then
				var_39_15 = var_39_17
				var_39_13 = iter_39_5
			end
		end

		if var_39_13 then
			itemId = var_39_13.id

			if itemId ~= arg_39_0.nearId then
				arg_39_0.nearId = itemId
				arg_39_0.nearItem = var_39_13
				var_39_12 = true
			end
		end
	end

	if var_39_11 ~= arg_39_0.lastCrossCount or var_39_12 then
		arg_39_0.lastCrossCount = var_39_11

		if var_39_11 == 0 then
			arg_39_0:NotifiyCore(ISLAND_EVT.HIDE_UNIT_HUD_OP, {
				isHighLightControl = true,
				id = tonumber(arg_39_0.nearId),
				type = IslandConst.UNIT_LIST_OBJ
			})

			arg_39_0.nearId = 0
		else
			arg_39_0:NotifiyCore(ISLAND_EVT.SHOW_UNIT_HUD_OP, {
				isHighLightControl = true,
				id = tonumber(arg_39_0.nearId),
				operationType = IslandOpView.OperationType.Plant,
				type = IslandConst.UNIT_LIST_OBJ
			})
		end
	end
end

function var_0_3.Vector3ToVector2(arg_49_0, arg_49_1)
	return var_0_1(arg_49_1.x, arg_49_1.z)
end

function var_0_3.GetNearItemId(arg_50_0)
	return arg_50_0.nearId
end

function var_0_3.GetCurrentPosition(arg_51_0)
	return arg_51_0._tf.position
end

function var_0_3.LastGroundedPosition(arg_52_0)
	local var_52_0 = arg_52_0._tf.eulerAngles

	if not arg_52_0.onGroud then
		local var_52_1, var_52_2 = Physics.Raycast(arg_52_0._tf.position, Vector3.down, nil, math.huge, var_0_9)

		if var_52_1 then
			return var_52_2.point, var_52_0
		end
	end

	return arg_52_0._tf.position, var_52_0
end

function var_0_3.CheckCanJump(arg_53_0)
	if arg_53_0.onGroud then
		return true
	end

	if arg_53_0.jumpVector.y > 0 then
		return false
	end

	local var_53_0, var_53_1 = Physics.Raycast(arg_53_0._tf.position + arg_53_0.characterController.center, Vector3.down, nil, 2, var_0_9)

	if var_53_0 then
		return true
	end

	return false
end

function var_0_3.OnDetach(arg_54_0)
	if arg_54_0.delayMoveTimer then
		arg_54_0.delayMoveTimer:Stop()

		arg_54_0.delayMoveTimer = nil
	end

	if arg_54_0.delayAttackTimer then
		arg_54_0.delayAttackTimer:Stop()

		arg_54_0.delayAttackTimer = nil
	end

	arg_54_0:ClearAnimationTools()
	arg_54_0.shipDressHelper:Destroy()
	arg_54_0.characterHandleController:AddStateEnterFunc(nil)
	arg_54_0.characterHandleController:AddStateExitFunc(nil)
end

function var_0_3.ClearAnimationTools(arg_55_0)
	for iter_55_0, iter_55_1 in pairs(arg_55_0.objTfList) do
		Object.Destroy(iter_55_1.gameObject)
	end

	arg_55_0.objTfList = {}
end

function var_0_3.SetActiveByLayer(arg_56_0, arg_56_1)
	if arg_56_1 then
		pg.ViewUtils.SetLayer(arg_56_0._tf, Layer.Default)
	else
		pg.ViewUtils.SetLayer(arg_56_0._tf, Layer.UIHidden)
	end
end

function var_0_3.SetShipDressHelper(arg_57_0, arg_57_1)
	arg_57_0.shipDressHelper = arg_57_1
end

function var_0_3.OnChangeDress(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = {}
	local var_58_1 = getProxy(IslandProxy):GetIsland():GetDressUpAgency()

	local function var_58_2(arg_59_0)
		for iter_59_0, iter_59_1 in ipairs(arg_58_2) do
			if arg_59_0 == iter_59_1.id then
				return iter_59_1.color, true
			end
		end

		return var_58_1:GetCurrentColorByDressId(arg_59_0), false
	end

	for iter_58_0, iter_58_1 in ipairs(arg_58_1) do
		local var_58_3, var_58_4 = var_58_2(iter_58_1.id)

		if var_58_4 then
			var_58_0[iter_58_1.id] = true
		end

		arg_58_0.shipDressHelper:ChangeDressByType(iter_58_1.type, {
			id = iter_58_1.id,
			colorId = var_58_3
		})
	end

	for iter_58_2, iter_58_3 in ipairs(arg_58_2) do
		local var_58_5 = iter_58_3.id

		if not var_58_0[var_58_5] then
			local var_58_6 = pg.island_dress_template[var_58_5].type

			arg_58_0.shipDressHelper:ChangeCommanderPartColor(var_58_6, iter_58_3.color)
		end
	end
end

function var_0_3.InitDress(arg_60_0)
	return
end

return var_0_3

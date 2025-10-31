local var_0_0 = require("Framework.toLua.UnityEngine.Vector3")
local var_0_1 = require("Framework.toLua.UnityEngine.Vector2")
local var_0_2 = var_0_0.zero
local var_0_3 = class("IslandTakePhotoUnit", import(".IslandSceneUnit"))
local var_0_4 = LayerMask.NameToLayer("IgnoreIslandCharacter")
local var_0_5 = bit.bnot(bit.lshift(1, var_0_4))

function var_0_3.OnAttach(arg_1_0, arg_1_1)
	var_0_3.super.OnAttach(arg_1_0, arg_1_1)

	arg_1_0._tf = arg_1_0._go.transform
	arg_1_0.characterController = arg_1_0._go:GetComponent(typeof(CharacterController))
	arg_1_0.targetSpeed = 0
	arg_1_0.speed = 0
	arg_1_0.gravitySpeed = 0
	arg_1_0.jumpVector = Vector3.zero

	local var_1_0 = pg.island_set.player_movement_parameters.key_value_varchar

	arg_1_0.degreeSpeed = 720
	arg_1_0.maxSpeed = var_1_0[1]
	arg_1_0.sprintSpeed = var_1_0[2]
	arg_1_0.upSpeedDamping = 3
	arg_1_0.downSpeedDamping = 6
	arg_1_0.jumpHeight = var_1_0[3]
	arg_1_0.targetDir = Vector3.zero
	arg_1_0.velocity = Vector3.zero
	arg_1_0.extraVelocity = Vector3.zero
	arg_1_0.orginTargetDir = var_0_2

	setActive(arg_1_0._go, false)
	arg_1_0:ActiveOrDisactive(false)
end

function var_0_3.OnLateUpdate(arg_2_0)
	return
end

function var_0_3.OnUpdate(arg_3_0)
	arg_3_0:RefreshTemp()

	local var_3_0 = Time.deltaTime

	arg_3_0:Rotation(var_3_0)
	arg_3_0:Move(var_3_0)
end

function var_0_3.RefreshTemp(arg_4_0)
	arg_4_0.ignoreStepdown = false
	arg_4_0.gravityAcc = IslandConst.GRAVITYACC

	if arg_4_0.orginTargetDir.x ~= 0 or arg_4_0.orginTargetDir.z ~= 0 then
		local var_4_0 = IslandCameraMgr.instance._mainCamera.transform:TransformVector(arg_4_0.orginTargetDir)

		arg_4_0.targetDir = var_0_0(var_4_0.x, 0, var_4_0.z).normalized
		arg_4_0.targetRotation = Quaternion.LookRotation(arg_4_0.targetDir)
	end
end

function var_0_3.Rotation(arg_5_0, arg_5_1)
	if arg_5_0.targetRotation then
		local var_5_0 = Quaternion.RotateTowards(arg_5_0._tf.rotation, arg_5_0.targetRotation, arg_5_0.degreeSpeed * arg_5_1)

		arg_5_0._tf.rotation = var_5_0
	end
end

function var_0_3.SetTargetRotation(arg_6_0, arg_6_1)
	arg_6_0.targetRotation = arg_6_1
end

function var_0_3.Move(arg_7_0, arg_7_1)
	if Mathf.Approximately(arg_7_0.speed, arg_7_0.targetSpeed) then
		arg_7_0.speed = arg_7_0.targetSpeed
	elseif arg_7_0.targetSpeed > arg_7_0.speed then
		arg_7_0.speed = Mathf.Lerp(arg_7_0.speed, arg_7_0.targetSpeed, arg_7_0.upSpeedDamping * arg_7_1)
	else
		arg_7_0.speed = Mathf.Lerp(arg_7_0.speed, arg_7_0.targetSpeed, arg_7_0.downSpeedDamping * arg_7_1)
	end

	arg_7_0.velocity = arg_7_0.targetDir * arg_7_0.speed

	local var_7_0 = arg_7_0.gravityAcc * arg_7_1

	arg_7_0.gravitySpeed = arg_7_0.gravitySpeed + var_7_0
	arg_7_0.onGroud = true

	local var_7_1 = 0

	if arg_7_0.gravitySpeed >= 0 then
		local var_7_2, var_7_3 = arg_7_0:CalcGrounded()

		if var_7_2 then
			arg_7_0.gravitySpeed = 0
			var_7_1 = var_7_3
		else
			local var_7_4, var_7_5 = arg_7_0:CalcNotFalling()

			if var_7_4 then
				arg_7_0.gravitySpeed = 0
				var_7_1 = var_7_5
			else
				arg_7_0.onGroud = false
			end
		end
	else
		arg_7_0.onGroud = false
	end

	local var_7_6 = Vector3(0, IslandConst.GRAVITYDIR.y * var_7_1, 0)

	if arg_7_0.ignoreStepdown then
		var_7_6 = var_0_2
	end

	local var_7_7 = arg_7_0.jumpVector + var_7_6
	local var_7_8 = Vector3(0, IslandConst.GRAVITYDIR.y * arg_7_0.gravitySpeed, 0)

	arg_7_0.characterController:Move((arg_7_0.velocity + var_7_8) * Time.deltaTime + var_7_7 + arg_7_0.extraVelocity * Time.deltaTime)
end

function var_0_3.CalcGrounded(arg_8_0)
	local var_8_0, var_8_1 = Physics.SphereCast(arg_8_0._tf.position + arg_8_0.characterController.center, arg_8_0.characterController.radius, Vector3.down, nil, 2 * arg_8_0.characterController.skinWidth + (0.5 * arg_8_0.characterController.height - arg_8_0.characterController.radius), var_0_5)

	if var_8_0 then
		local var_8_2 = arg_8_0._tf.position.y + arg_8_0.characterController.skinWidth - var_8_1.point.y

		return true, var_8_2
	end

	return false
end

function var_0_3.CalcNotFalling(arg_9_0)
	local var_9_0, var_9_1 = Physics.SphereCast(arg_9_0._tf.position + arg_9_0.characterController.center, arg_9_0.characterController.radius, Vector3.down, nil, 0.3 + 2 * arg_9_0.characterController.skinWidth + (0.5 * arg_9_0.characterController.height - arg_9_0.characterController.radius), var_0_5)

	if var_9_0 then
		local var_9_2 = arg_9_0._tf.position.y + arg_9_0.characterController.skinWidth - var_9_1.point.y

		return true, var_9_2
	end

	return false
end

function var_0_3.OnPlayerPlayerSprint(arg_10_0)
	if arg_10_0.targetSpeed ~= 0 then
		arg_10_0.isSprint = true
		arg_10_0.lastTargetSpeed = arg_10_0.targetSpeed
		arg_10_0.targetSpeed = arg_10_0.sprintSpeed
		arg_10_0.speed = arg_10_0.targetSpeed
	end
end

function var_0_3.OnStopPlayerSprint(arg_11_0)
	if arg_11_0.isSprint and arg_11_0.targetSpeed ~= 0 then
		arg_11_0.targetSpeed = arg_11_0.lastTargetSpeed
		arg_11_0.speed = arg_11_0.lastTargetSpeed
		arg_11_0.isSprint = false
	end
end

function var_0_3.MoveHandle(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.orginTargetDir = arg_12_1
	arg_12_0.lastTargetSpeed = arg_12_2 * arg_12_0.maxSpeed
	arg_12_0.targetSpeed = arg_12_0.isSprint and arg_12_0.sprintSpeed or arg_12_0.lastTargetSpeed
end

function var_0_3.StopMoveHandle(arg_13_0)
	arg_13_0.targetSpeed = 0
	arg_13_0.speed = 0
	arg_13_0.orginTargetDir = var_0_2
	arg_13_0.isSprint = false
end

return var_0_3

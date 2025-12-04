local var_0_0 = require("Framework.toLua.UnityEngine.Vector3")
local var_0_1 = require("Framework.toLua.UnityEngine.Quaternion")
local var_0_2 = class("IslandDelegationFishUnit", import(".IslandSceneUnit"))
local var_0_3 = LayerMask.NameToLayer("IgnoreIslandCharacter")
local var_0_4 = bit.bnot(bit.lshift(1, var_0_3))
local var_0_5 = {
	baseSpeed = 2,
	turnDetectionThreshold = 0.4,
	noiseScale = 0.5,
	avoidBoost = 1.5,
	avoidTurnAngle = 45,
	noiseAmplitude = 0.8,
	speedChangeRate = 0.5,
	minSpeedFactor = 0.5,
	turnSpeed = 2,
	maxSpeedFactor = 2,
	turnSlowdownFactor = 0.6,
	avoidBoostDuration = 1,
	changeTargetInterval = 4,
	avoidDistance = 2
}

function var_0_2.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_2.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.speed = arg_1_2.speed or var_0_5.baseSpeed
end

function var_0_2.OnAttach(arg_2_0, arg_2_1)
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform
	arg_2_0.baseSpeed = arg_2_0.speed or var_0_5.baseSpeed
	arg_2_0.turnSpeed = arg_2_0.turnSpeed or var_0_5.turnSpeed
	arg_2_0.avoidDistance = arg_2_0.avoidDistance or var_0_5.avoidDistance
	arg_2_0.avoidTurnAngle = arg_2_0.avoidTurnAngle or var_0_5.avoidTurnAngle
	arg_2_0.obstacleMask = arg_2_0.obstacleMask or var_0_5.obstacleMask
	arg_2_0.avoidBoost = arg_2_0.avoidBoost or var_0_5.avoidBoost
	arg_2_0.avoidBoostDuration = arg_2_0.avoidBoostDuration or var_0_5.avoidBoostDuration
	arg_2_0.minSpeed = arg_2_0.baseSpeed * var_0_5.minSpeedFactor
	arg_2_0.maxSpeed = arg_2_0.baseSpeed or var_0_5.maxSpeedFactor
	arg_2_0.speedChangeRate = arg_2_0.speedChangeRate or var_0_5.speedChangeRate
	arg_2_0.noiseScale = arg_2_0.noiseScale or var_0_5.noiseScale
	arg_2_0.noiseAmplitude = arg_2_0.noiseAmplitude or var_0_5.noiseAmplitude
	arg_2_0.turnSlowdownFactor = arg_2_0.turnSlowdownFactor or var_0_5.turnSlowdownFactor
	arg_2_0.turnDetectionThreshold = arg_2_0.turnDetectionThreshold or var_0_5.turnDetectionThreshold
	arg_2_0.changeTargetInterval = var_0_5.changeTargetInterval
	arg_2_0.targetPos = var_0_0.zero
	arg_2_0.timer = 0
	arg_2_0.currentSpeed = arg_2_0.baseSpeed
	arg_2_0.noiseSeed = math.random() * 100
	arg_2_0.avoidBoostTimer = 0
	arg_2_0.lastRotation = arg_2_0._tf.rotation or var_0_1.identity
	arg_2_0.animator = arg_2_0._tf:GetChild(0):GetComponent(typeof(Animator))
end

function var_0_2.SetFishPonds(arg_3_0, arg_3_1)
	arg_3_0.pond = arg_3_0.view:GetUnitModuleWithType(IslandConst.UNIT_LIST_OBJ, arg_3_1)._go.transform:GetComponent(typeof(FishPond)):GetBounds()
end

function var_0_2.GetRandomPoint(arg_4_0)
	local var_4_0 = arg_4_0.pond:GetMin()
	local var_4_1 = arg_4_0.pond:GetMax()

	return var_0_0.New(math.random() * (var_4_1.x - var_4_0.x) + var_4_0.x, math.random() * (var_4_1.y - var_4_0.y) + var_4_0.y, math.random() * (var_4_1.z - var_4_0.z) + var_4_0.z)
end

function var_0_2.StartFishing(arg_5_0)
	arg_5_0.startFishing = true
	arg_5_0._tf.position = arg_5_0:GetRandomPoint()

	arg_5_0.animator:Play("walk")
end

function var_0_2.OnUpdate(arg_6_0)
	if not arg_6_0.startFishing then
		return
	end

	local var_6_0 = Time.deltaTime

	arg_6_0.timer = arg_6_0.timer + var_6_0

	if arg_6_0.timer > arg_6_0.changeTargetInterval then
		arg_6_0:SetNewTarget()
	end

	arg_6_0:UpdateSpeed()
	arg_6_0:Move()
	arg_6_0:KeepInsideBounds()
end

function var_0_2.Move(arg_7_0)
	local var_7_0 = arg_7_0._tf.position
	local var_7_1 = arg_7_0.targetPos - var_7_0

	if var_7_1.sqrMagnitude < 0.01 then
		return
	end

	local var_7_2 = var_7_1.normalized

	if var_7_2 ~= var_0_0.zero then
		local var_7_3 = var_0_1.LookRotation(var_7_2)

		arg_7_0._tf.rotation = var_0_1.Slerp(arg_7_0._tf.rotation, var_7_3, arg_7_0.turnSpeed * Time.deltaTime)
	end

	local var_7_4 = var_0_1.Angle(arg_7_0._tf.rotation, arg_7_0.lastRotation) * Mathf.Deg2Rad

	arg_7_0.lastRotation = arg_7_0._tf.rotation

	local var_7_5 = 1

	if var_7_4 > arg_7_0.turnDetectionThreshold then
		var_7_5 = var_7_5 * arg_7_0.turnSlowdownFactor
	end

	if arg_7_0.avoidBoostTimer > 0 then
		arg_7_0.avoidBoostTimer = arg_7_0.avoidBoostTimer - Time.deltaTime
		var_7_5 = var_7_5 * arg_7_0.avoidBoost
	end

	local var_7_6 = arg_7_0._tf.forward * (arg_7_0.currentSpeed * var_7_5) * Time.deltaTime

	arg_7_0._tf.position = arg_7_0._tf.position + var_7_6
end

function var_0_2.UpdateSpeed(arg_8_0)
	local var_8_0 = Mathf.PerlinNoise(arg_8_0.noiseSeed, Time.time * arg_8_0.noiseScale)
	local var_8_1 = Mathf.Lerp(arg_8_0.minSpeed, arg_8_0.maxSpeed, var_8_0 * arg_8_0.noiseAmplitude)

	arg_8_0.currentSpeed = Mathf.Lerp(arg_8_0.currentSpeed, var_8_1, Time.deltaTime * arg_8_0.speedChangeRate)
end

function var_0_2.SetNewTarget(arg_9_0)
	arg_9_0.timer = 0

	local var_9_0 = arg_9_0.pond
	local var_9_1 = Mathf.Lerp(var_9_0.min.x, var_9_0.max.x, math.random())
	local var_9_2 = Mathf.Lerp(var_9_0.min.y, var_9_0.max.y, math.random())
	local var_9_3 = Mathf.Lerp(var_9_0.min.z, var_9_0.max.z, math.random())

	arg_9_0.targetPos = var_0_0.New(var_9_1, var_9_2, var_9_3)
	arg_9_0.changeTargetInterval = (arg_9_0.targetPos - arg_9_0._tf.position).magnitude / arg_9_0.speed
end

function var_0_2.AvoidCollision(arg_10_0)
	local var_10_0 = arg_10_0._tf.position
	local var_10_1 = arg_10_0._tf.forward
	local var_10_2 = 0.5
	local var_10_3 = arg_10_0.avoidDistance or var_0_5.avoidDistance
	local var_10_4, var_10_5 = Physics.SphereCast(var_10_0, var_10_2, var_10_1, nil, var_10_3, var_0_4)

	if var_10_4 and var_10_5 and var_10_5.collider then
		local var_10_6 = (math.random() - 0.5) * 2 * arg_10_0.avoidTurnAngle
		local var_10_7 = var_0_1.Euler(0, var_10_6, 0) * arg_10_0._tf.forward
		local var_10_8 = var_0_1.LookRotation(var_10_7)

		arg_10_0._tf.rotation = var_0_1.Slerp(arg_10_0._tf.rotation, var_10_8, arg_10_0.turnSpeed * Time.deltaTime)

		arg_10_0:SetNewTarget()

		arg_10_0.avoidBoostTimer = arg_10_0.avoidBoostDuration
	end
end

function var_0_2.KeepInsideBounds(arg_11_0)
	local var_11_0 = arg_11_0.pond
	local var_11_1 = arg_11_0._tf.position
	local var_11_2 = false

	if var_11_0.Contains then
		var_11_2 = var_11_0:Contains(var_11_1)
	else
		var_11_2 = var_11_1.x >= var_11_0.min.x and var_11_1.x <= var_11_0.max.x and var_11_1.y >= var_11_0.min.y and var_11_1.y <= var_11_0.max.y and var_11_1.z >= var_11_0.min.z and var_11_1.z <= var_11_0.max.z
	end

	if not var_11_2 then
		local var_11_3 = (arg_11_0.pond.center - var_11_1).normalized

		if var_11_3 ~= var_0_0.zero then
			local var_11_4 = var_0_1.LookRotation(var_11_3)

			arg_11_0._tf.rotation = var_0_1.Slerp(arg_11_0._tf.rotation, var_11_4, arg_11_0.turnSpeed * Time.deltaTime)
		end

		if var_11_0.ClosestPoint then
			local var_11_5 = var_11_0:ClosestPoint(var_11_1)

			arg_11_0._tf.position = var_0_0.Lerp(var_11_1, var_11_5, 0.5)
		else
			arg_11_0._tf.position = var_0_0.Lerp(var_11_1, arg_11_0.pond.center, 0.5)
		end

		arg_11_0:SetNewTarget()
	end
end

return var_0_2

local var_0_0 = class("IslandSystemDelegationUnit", import(".IslandNpcUnit"))

function var_0_0.OnLaterAttach(arg_1_0, arg_1_1)
	arg_1_0.agent = GetOrAddComponent(arg_1_1, typeof(UnityEngine.AI.NavMeshAgent))
	arg_1_0.agent.updatePosition = true
	arg_1_0.agent.updateRotation = true
	arg_1_0._tf = arg_1_0._go.transform
	arg_1_0._degreeSpeedDamping = 10
	arg_1_0._targetSpeed = 0
	arg_1_0._speed = 0
	arg_1_0._speedDamping = 1
	arg_1_0._walkingMaxSpeed = 1.5
	arg_1_0._runMaxSpeed = 5
	arg_1_0._targetPosition = Vector3.zero
	arg_1_0._velocity = Vector3.zero
	arg_1_0._extraVelocity = Vector3.zero
	arg_1_0._animator = arg_1_0._tf:GetChild(0):GetComponent(typeof(Animator))

	local var_1_0 = pg.island_unit_character[arg_1_0.modelId]

	arg_1_0._characterController = arg_1_0._go:GetComponent(typeof(UnityEngine.CharacterController))

	if var_1_0.CollisionParam ~= "" then
		arg_1_0._characterController.enabled = false

		local var_1_1 = GetOrAddComponent(arg_1_0._go, typeof("UnityEngine.CapsuleCollider"))

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.CapsuleCollider"), "center", var_1_1, Vector3(0, var_1_0.CollisionParam[1], 0))
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.CapsuleCollider"), "radius", var_1_1, var_1_0.CollisionParam[2])
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.CapsuleCollider"), "height", var_1_1, var_1_0.CollisionParam[3])

		arg_1_0.agent.radius = var_1_0.CollisionParam[2]
	else
		arg_1_0._characterController.enabled = falses

		local var_1_2 = GetOrAddComponent(arg_1_0._go, typeof("UnityEngine.CapsuleCollider"))

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.CapsuleCollider"), "center", var_1_2, Vector3(0, 0.96, 0))
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.CapsuleCollider"), "radius", var_1_2, 0.5)
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.CapsuleCollider"), "height", var_1_2, 1.76)

		arg_1_0.agent.radius = 0.5
	end

	arg_1_0:SetNavAgentStopDistance(2.1)

	arg_1_0.lookingFor = false
end

function var_0_0.SetDestination(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.lookingFor = true

	arg_2_0:SetNavAgentDestination(arg_2_1)

	arg_2_0._targetSpeed = Mathf.Clamp(arg_2_2 or 0, arg_2_0._walkingMaxSpeed, arg_2_0._runMaxSpeed)
	arg_2_0._targetPosition = arg_2_1
end

function var_0_0.StopMove(arg_3_0)
	arg_3_0.lookingFor = false

	arg_3_0:StopNavAgent()

	arg_3_0._targetSpeed = 0
	arg_3_0._targetPosition = Vector3.zero

	arg_3_0._animator:SetFloat(IslandConst.SPEED_FLAG_HASH, 0)
end

function var_0_0.OnUpdate(arg_4_0)
	if arg_4_0.lookingFor then
		arg_4_0:NavUpdate()
	else
		arg_4_0:OnNormalUpdate()
	end
end

function var_0_0.NavUpdate(arg_5_0)
	arg_5_0._speed = Mathf.Lerp(arg_5_0._speed, arg_5_0._targetSpeed, arg_5_0._speedDamping)

	arg_5_0:SetNavAgentSpeed(arg_5_0._speed * 0.5)
	arg_5_0._animator:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_5_0._speed)
end

function var_0_0.SetNavAgentStopDistance(arg_6_0, arg_6_1)
	arg_6_0.agent.stoppingDistance = arg_6_1
end

function var_0_0.SetNavAgentDestination(arg_7_0, arg_7_1)
	arg_7_0.agent.isStopped = false
	arg_7_0.agent.destination = arg_7_1
end

function var_0_0.SetNavPosition(arg_8_0, arg_8_1)
	arg_8_0.agent.nextPosition = arg_8_1
end

function var_0_0.CalculateNavPath(arg_9_0, arg_9_1)
	local var_9_0 = UnityEngine.AI.NavMeshPath.New()

	arg_9_0.agent:CalculatePath(arg_9_1, var_9_0)

	return (var_9_0.corners:ToTable())
end

function var_0_0.SetNavAgentSpeed(arg_10_0, arg_10_1)
	arg_10_0.agent.speed = arg_10_1
end

function var_0_0.GetNavAgentSpeed(arg_11_0, arg_11_1)
	return arg_11_0.agent.speed
end

function var_0_0.SetNavAgentVelocity(arg_12_0, arg_12_1)
	arg_12_0.agent.velocity = arg_12_1
end

function var_0_0.GetNavAgentVelocity(arg_13_0)
	return arg_13_0.agent.desiredVelocity * arg_13_0.agent.speed
end

function var_0_0.GetDesiredVelocity(arg_14_0)
	return arg_14_0.agent.desiredVelocity
end

function var_0_0.StopNavAgent(arg_15_0)
	arg_15_0.agent.isStopped = true
end

function var_0_0.OnNormalUpdate(arg_16_0, ...)
	return
end

function var_0_0.GetAnimator(arg_17_0)
	return arg_17_0._animator
end

return var_0_0

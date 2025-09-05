local var_0_0 = class("IslandNavigableUnit", import(".IslandSceneUnit"))

function var_0_0.OnLaterAttach(arg_1_0, arg_1_1)
	arg_1_0.agent = GetOrAddComponent(arg_1_1, typeof(UnityEngine.AI.NavMeshAgent))
	arg_1_0.agent.updatePosition = false
	arg_1_0.agent.updateRotation = false
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
	arg_1_0._characterController = arg_1_0._go:GetComponent(typeof(UnityEngine.CharacterController))

	arg_1_0:SetNavAgentStopDistance(2)

	arg_1_0.lookingFor = false
end

function var_0_0.SetDestination(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.agent:Warp(arg_2_0._tf.position)

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
	arg_5_0:_Move()
	arg_5_0._animator:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_5_0._speed)

	arg_5_0._velocity = arg_5_0:GetNavAgentVelocity()
end

function var_0_0._Move(arg_6_0)
	local var_6_0 = arg_6_0:GetDesiredVelocity() + arg_6_0._extraVelocity

	if var_6_0.magnitude <= 0 or var_6_0.normalized == Vector3.zero then
		return
	end

	local var_6_1 = Quaternion.LookRotation(var_6_0.normalized)

	arg_6_0._tf.rotation = Quaternion.Slerp(arg_6_0._tf.rotation, var_6_1, Time.deltaTime * arg_6_0._degreeSpeedDamping)

	local var_6_2 = Vector3.up * IslandConst.GRAVITY

	if Physics.CheckSphere(arg_6_0._tf.position + Vector3.up * (arg_6_0._characterController.radius - arg_6_0._characterController.skinWidth), arg_6_0._characterController.radius, LayerMask.GetMask("Ground")) then
		var_6_2 = Vector3.zero
	end

	arg_6_0._characterController:Move(var_6_0.normalized * arg_6_0:GetNavAgentSpeed() * Time.deltaTime + var_6_2 * Time.deltaTime)
	arg_6_0:SetNavAgentVelocity(arg_6_0._characterController.velocity)
end

function var_0_0.SetNavAgentStopDistance(arg_7_0, arg_7_1)
	arg_7_0.agent.stoppingDistance = arg_7_1
end

function var_0_0.SetNavAgentDestination(arg_8_0, arg_8_1)
	arg_8_0.agent.isStopped = false
	arg_8_0.agent.destination = arg_8_1
end

function var_0_0.SetNavPosition(arg_9_0, arg_9_1)
	arg_9_0.agent.nextPosition = arg_9_1
end

function var_0_0.CalculateNavPath(arg_10_0, arg_10_1)
	local var_10_0 = UnityEngine.AI.NavMeshPath.New()

	arg_10_0.agent:CalculatePath(arg_10_1, var_10_0)

	return (var_10_0.corners:ToTable())
end

function var_0_0.SetNavAgentSpeed(arg_11_0, arg_11_1)
	arg_11_0.agent.speed = arg_11_1
end

function var_0_0.GetNavAgentSpeed(arg_12_0, arg_12_1)
	return arg_12_0.agent.speed
end

function var_0_0.SetNavAgentVelocity(arg_13_0, arg_13_1)
	arg_13_0.agent.velocity = arg_13_1
end

function var_0_0.GetNavAgentVelocity(arg_14_0)
	return arg_14_0.agent.desiredVelocity * arg_14_0.agent.speed
end

function var_0_0.GetDesiredVelocity(arg_15_0)
	return arg_15_0.agent.desiredVelocity
end

function var_0_0.StopNavAgent(arg_16_0)
	arg_16_0.agent.isStopped = true
end

function var_0_0.OnNormalUpdate(arg_17_0, ...)
	return
end

function var_0_0.GetAnimator(arg_18_0)
	return arg_18_0._animator
end

function var_0_0.Enable(arg_19_0)
	var_0_0.super.Enable(arg_19_0)

	if not arg_19_0:IsLoaded() then
		return
	end

	arg_19_0.agent.enabled = true
end

function var_0_0.Disable(arg_20_0)
	var_0_0.super.Disable(arg_20_0)

	if not arg_20_0:IsLoaded() then
		return
	end

	arg_20_0.agent.enabled = false
end

return var_0_0

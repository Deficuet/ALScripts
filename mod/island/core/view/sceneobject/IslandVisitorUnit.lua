local var_0_0 = class("IslandVisitorUnit", import(".IslandNavigableUnit"))
local var_0_1 = 3
local var_0_2 = 6

function var_0_0.OnUpdate(arg_1_0)
	if arg_1_0.delayTime == 0 then
		return
	end

	if arg_1_0.isSleeping then
		return
	end

	arg_1_0:MoveHandle()
	arg_1_0:AnimHandle()
end

function var_0_0.OnStart(arg_2_0)
	arg_2_0.behaviourTreeOwner.graph.blackboard:SetVariableValue("playerId", tostring(arg_2_0.id))
end

function var_0_0.OnLaterAttach(arg_3_0, arg_3_1)
	var_0_0.super.OnLaterAttach(arg_3_0, arg_3_1)

	arg_3_0.delayTime = 0
	arg_3_0.syncData = nil
	arg_3_0.animSpeed = 0
end

function var_0_0.UpdateSyncData(arg_4_0, arg_4_1)
	arg_4_0.syncData = arg_4_1
	arg_4_0.delayTime = IslandConst.SYNC_TIME_INTERVAL
end

function var_0_0.Sleep(arg_5_0)
	arg_5_0.isSleeping = true
end

function var_0_0.WakeUp(arg_6_0)
	arg_6_0.isSleeping = false
end

function var_0_0.MoveHandle(arg_7_0)
	local var_7_0 = arg_7_0.delayTime - Time.deltaTime
	local var_7_1 = Time.deltaTime / arg_7_0.delayTime
	local var_7_2
	local var_7_3

	if var_7_0 > 0 then
		var_7_2 = Vector3.Lerp(arg_7_0:GetPosition(), arg_7_0.syncData.pos, var_7_1)
		var_7_3 = Quaternion.Lerp(arg_7_0:GetRotation(), arg_7_0:GetSyncDataRotation(), var_7_1)
		arg_7_0.delayTime = var_7_0
	else
		var_7_2 = arg_7_0.syncData.pos
		var_7_3 = arg_7_0:GetSyncDataRotation()
		arg_7_0.delayTime = 0
	end

	if Time.deltaTime > 0 then
		local var_7_4 = (var_7_2 - arg_7_0:GetPosition()) / Time.deltaTime

		arg_7_0.speed = Vector2(var_7_4.x, var_7_4.z).magnitude
	end

	arg_7_0:SetPosition(var_7_2)
	arg_7_0:SetRotation(var_7_3)
end

function var_0_0.AnimHandle(arg_8_0)
	local var_8_0 = arg_8_0.speed or 0

	if var_8_0 < 0.1 then
		var_8_0 = 0
	end

	local var_8_1 = var_8_0 > arg_8_0.animSpeed and var_0_1 or var_0_2

	arg_8_0.animSpeed = Mathf.Lerp(arg_8_0.animSpeed, var_8_0, var_8_1 * Time.deltaTime)

	local var_8_2 = arg_8_0:GetAnimator()

	var_8_2:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_8_0.animSpeed)

	for iter_8_0 = 1, var_8_2.layerCount do
		local var_8_3 = iter_8_0 - 1

		if not var_8_2:IsInTransition(var_8_3) then
			local var_8_4 = arg_8_0.syncData.status[iter_8_0]
			local var_8_5 = var_8_2:GetCurrentAnimatorStateInfo(var_8_3)

			if var_8_4 and var_8_5.shortNameHash ~= var_8_4 then
				var_8_2:CrossFadeInFixedTime(var_8_4, 0.25, var_8_3)
			end
		end
	end
end

function var_0_0.GetSyncDataRotation(arg_9_0)
	return arg_9_0.syncData.dir
end

function var_0_0.GetPosition(arg_10_0)
	return arg_10_0._go.transform.position
end

function var_0_0.GetRotation(arg_11_0)
	return arg_11_0._go.transform.rotation
end

function var_0_0.SetPosition(arg_12_0, arg_12_1)
	arg_12_0._go.transform.position = arg_12_1
end

function var_0_0.SetRotation(arg_13_0, arg_13_1)
	arg_13_0._go.transform.rotation = arg_13_1
end

function var_0_0.SetShipDressHelper(arg_14_0, arg_14_1)
	arg_14_0.shipDressHelper = arg_14_1
end

function var_0_0.OnDetach(arg_15_0)
	if arg_15_0.shipDressHelper then
		arg_15_0.shipDressHelper:Destroy()
	end
end

function var_0_0.OnChangeDress(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in pairs(arg_16_1) do
		if iter_16_1.changedDressColorId then
			if not iter_16_1.changeedDressId then
				arg_16_0.shipDressHelper:ChangeCommanderPartColor(iter_16_0, iter_16_1.changedDressColorId)
			else
				arg_16_0.shipDressHelper:ChangeDressByType(iter_16_0, {
					id = iter_16_1.changeedDressId,
					colorId = iter_16_1.changedDressColorId
				})
			end
		end
	end
end

return var_0_0

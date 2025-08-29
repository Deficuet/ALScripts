local var_0_0 = class("SyncUnitVisitor")

var_0_0.ANIMATOR_LAYER = {
	0,
	1,
	2
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.sceneObject = arg_1_1
	arg_1_0.animHash = {}
	arg_1_0.animator = arg_1_1:GetAnimator()
	arg_1_0.delayTime = 0
	arg_1_0.syncData = nil
end

function var_0_0.RecordLastInteract(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.lastInteract = {
		type = arg_2_2,
		id = arg_2_1
	}
end

function var_0_0.ClearLastInteract(arg_3_0)
	arg_3_0.lastInteract = nil
end

function var_0_0.GetLastInteract(arg_4_0)
	return arg_4_0.lastInteract
end

function var_0_0.UpdateSyncData(arg_5_0, arg_5_1)
	arg_5_0.syncData = arg_5_1
	arg_5_0.delayTime = IslandConst.SYNC_TIME_INTERVAL
end

function var_0_0.Update(arg_6_0)
	if arg_6_0.delayTime == 0 then
		return
	end

	arg_6_0:MoveHandle()
	arg_6_0:AnimHandle()
end

function var_0_0.MoveHandle(arg_7_0)
	local var_7_0 = arg_7_0.delayTime - Time.deltaTime
	local var_7_1 = Time.deltaTime / arg_7_0.delayTime
	local var_7_2
	local var_7_3

	if var_7_0 > 0 then
		var_7_2 = Vector3.Lerp(arg_7_0:GetLocalPosition(), arg_7_0.syncData.pos, var_7_1)
		var_7_3 = Quaternion.Lerp(arg_7_0:GetRotation(), arg_7_0:GetSyncDataRotation(), var_7_1)
		arg_7_0.delayTime = var_7_0
	else
		var_7_2 = arg_7_0.syncData.pos
		var_7_3 = arg_7_0:GetSyncDataRotation()
		arg_7_0.delayTime = 0
	end

	local var_7_4 = (var_7_2 - arg_7_0:GetLocalPosition()) / Time.deltaTime

	arg_7_0.speed = Vector2(var_7_4.x, var_7_4.z).magnitude

	arg_7_0:SetLocalPosition(var_7_2)
	arg_7_0:SetRotation(var_7_3)
end

function var_0_0.AnimHandle(arg_8_0)
	if arg_8_0.speed < 7.5 and arg_8_0.speed > 5 then
		arg_8_0.speed = 5
	end

	arg_8_0.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_8_0.speed)

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.ANIMATOR_LAYER) do
		if not arg_8_0.animator:IsInTransition(iter_8_1) then
			local var_8_0 = arg_8_0.syncData.status[iter_8_0]

			if arg_8_0.animator:GetCurrentAnimatorStateInfo(iter_8_1).shortNameHash ~= var_8_0 then
				arg_8_0.animator:Play(var_8_0, iter_8_1)
			end
		end
	end
end

function var_0_0.IsLoaded(arg_9_0)
	return arg_9_0.sceneObject and arg_9_0.sceneObject:IsLoaded()
end

function var_0_0.GetSyncDataRotation(arg_10_0)
	return arg_10_0.syncData.dir
end

function var_0_0.GetLocalPosition(arg_11_0)
	return arg_11_0.sceneObject._go.transform.localPosition
end

function var_0_0.GetRotation(arg_12_0)
	return arg_12_0.sceneObject._go.transform.rotation
end

function var_0_0.SetLocalPosition(arg_13_0, arg_13_1)
	arg_13_0.sceneObject._go.transform.localPosition = arg_13_1
end

function var_0_0.SetRotation(arg_14_0, arg_14_1)
	arg_14_0.sceneObject._go.transform.rotation = arg_14_1
end

function var_0_0.Dispose(arg_15_0)
	return
end

return var_0_0

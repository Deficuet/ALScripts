local var_0_0 = class("IslandCalcUtil")

function var_0_0.SignedAngle(arg_1_0, arg_1_1)
	local var_1_0 = Vector2.Angle(arg_1_0, arg_1_1)
	local var_1_1 = arg_1_0.x * arg_1_1.y - arg_1_0.y * arg_1_1.x
	local var_1_2 = var_1_0 * math.sign(var_1_1)

	if var_1_2 == -0 then
		var_1_2 = 180
	end

	return var_1_2
end

function var_0_0.WorldPosition2LocalPosition(arg_2_0, arg_2_1)
	local var_2_0 = pg.UIMgr.GetInstance().overlayCameraComp
	local var_2_1 = IslandCameraMgr.instance._mainCamera:WorldToViewportPoint(arg_2_1)
	local var_2_2 = var_2_0:ViewportToScreenPoint(var_2_1)
	local var_2_3 = arg_2_0:GetComponent("RectTransform")

	return (LuaHelper.ScreenToLocal(var_2_3, var_2_2, var_2_0))
end

function var_0_0.IsInViewport(arg_3_0)
	local var_3_0 = IslandCameraMgr.instance._mainCamera:WorldToViewportPoint(arg_3_0)

	if var_3_0.x > 0 and var_3_0.x < 1 and var_3_0.y > 0 and var_3_0.y < 1 and var_3_0.z > 0 then
		return true
	end

	return false
end

function var_0_0.GetNavPath(arg_4_0, arg_4_1)
	local var_4_0 = GetOrAddComponent(arg_4_0, typeof(UnityEngine.AI.NavMeshAgent))

	var_4_0.nextPosition = arg_4_0.transform.position

	local var_4_1 = UnityEngine.AI.NavMeshPath.New()

	var_4_0:CalculatePath(arg_4_1, var_4_1)

	return (var_4_1.corners:ToTable())
end

function var_0_0.GetRandomPointOnCircle(arg_5_0, arg_5_1)
	local var_5_0 = UnityEngine.Random.insideUnitCircle.normalized

	return arg_5_0 + Vector3(var_5_0.x, 0, var_5_0.y) * arg_5_1
end

function var_0_0.GetPointOffset(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_2 % 2 == 0 then
		return arg_6_0 + Vector3(arg_6_1 * 2, 0, 0) * math.ceil(arg_6_2 * 0.5)
	else
		return arg_6_0 - Vector3(arg_6_1 * 2, 0, 0) * math.ceil(arg_6_2 * 0.5)
	end
end

function var_0_0.GetTypeAndIdByUniqueId(arg_7_0)
	local var_7_0 = WorldObjectItem.GetTypeAndIdByUniqueId(arg_7_0)

	return var_7_0[0], var_7_0[1]
end

function var_0_0.GetUnReHexPoints(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0 * 0.5
	local var_8_1 = arg_8_1 * 0.5
	local var_8_2 = {}
	local var_8_3 = arg_8_2 * math.pi / 180
	local var_8_4 = arg_8_0 * math.tan(var_8_3) * 0.5

	table.insert(var_8_2, Vector2(0, var_8_1))
	table.insert(var_8_2, Vector2(var_8_0, var_8_4))
	table.insert(var_8_2, Vector2(var_8_0, -var_8_4))
	table.insert(var_8_2, Vector2(0, -var_8_1))
	table.insert(var_8_2, Vector2(-var_8_0, -var_8_4))
	table.insert(var_8_2, Vector2(-var_8_0, var_8_4))

	return var_8_2
end

function var_0_0.Vetor3Table2Array(arg_9_0)
	local var_9_0 = System.Array.CreateInstance(typeof(UnityEngine.Vector3), #arg_9_0)

	for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
		var_9_0[iter_9_0 - 1] = iter_9_1
	end

	return var_9_0
end

function var_0_0.ClampRect(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	local var_10_0 = arg_10_0 * 0.5 - arg_10_2 * 0.5
	local var_10_1 = arg_10_1 * 0.5 - arg_10_3 * 0.5

	if var_10_0 < arg_10_4.x then
		arg_10_4.x = var_10_0
	elseif arg_10_4.x < -var_10_0 then
		arg_10_4.x = -var_10_0
	end

	if var_10_1 < arg_10_4.y then
		arg_10_4.y = var_10_1
	elseif arg_10_4.y < -var_10_1 then
		arg_10_4.y = -var_10_1
	end

	return arg_10_4
end

function var_0_0.IsBehindCamera(arg_11_0)
	local var_11_0 = IslandCameraMgr.instance._mainCamera

	return Vector3.Dot(var_11_0.transform.forward, arg_11_0 - var_11_0.transform.position) < 0
end

return var_0_0

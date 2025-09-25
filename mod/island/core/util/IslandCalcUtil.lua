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

function var_0_0.GetRandomPointInSector(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	arg_6_4 = arg_6_4 or 0.7

	local var_6_0 = Vector3.New(arg_6_1.x, 0, arg_6_1.z)

	if var_6_0.magnitude < 0.01 then
		var_6_0 = Vector3.New(1, 0, 0)
	else
		var_6_0 = var_6_0.normalized
	end

	local var_6_1 = math.atan2(var_6_0.z, var_6_0.x)
	local var_6_2 = arg_6_3 * 0.5
	local var_6_3 = -var_6_2 + UnityEngine.Random.value * (2 * var_6_2)
	local var_6_4 = var_6_1 + math.rad(var_6_3)
	local var_6_5 = arg_6_2 * arg_6_4
	local var_6_6 = var_6_5 + UnityEngine.Random.value * (arg_6_2 - var_6_5)

	return arg_6_0 + Vector3.New(math.cos(var_6_4), 0, math.sin(var_6_4)) * var_6_6
end

function var_0_0.GetPointOffset(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_2 % 2 == 0 then
		return arg_7_0 + Vector3(arg_7_1 * 2, 0, 0) * math.ceil(arg_7_2 * 0.5)
	else
		return arg_7_0 - Vector3(arg_7_1 * 2, 0, 0) * math.ceil(arg_7_2 * 0.5)
	end
end

function var_0_0.GetTypeAndIdByUniqueId(arg_8_0)
	local var_8_0 = WorldObjectItem.GetTypeAndIdByUniqueId(arg_8_0)

	return var_8_0[0], var_8_0[1]
end

function var_0_0.GetUnReHexPoints(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0 * 0.5
	local var_9_1 = arg_9_1 * 0.5
	local var_9_2 = {}
	local var_9_3 = arg_9_2 * math.pi / 180
	local var_9_4 = arg_9_0 * math.tan(var_9_3) * 0.5

	table.insert(var_9_2, Vector2(0, var_9_1))
	table.insert(var_9_2, Vector2(-var_9_0, var_9_4))
	table.insert(var_9_2, Vector2(-var_9_0, -var_9_4))
	table.insert(var_9_2, Vector2(0, -var_9_1))
	table.insert(var_9_2, Vector2(var_9_0, -var_9_4))
	table.insert(var_9_2, Vector2(var_9_0, var_9_4))

	return var_9_2
end

function var_0_0.Vetor3Table2Array(arg_10_0)
	local var_10_0 = System.Array.CreateInstance(typeof(UnityEngine.Vector3), #arg_10_0)

	for iter_10_0, iter_10_1 in ipairs(arg_10_0) do
		var_10_0[iter_10_0 - 1] = iter_10_1
	end

	return var_10_0
end

function var_0_0.ClampRect(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = arg_11_0 * 0.5 - arg_11_2 * 0.5
	local var_11_1 = arg_11_1 * 0.5 - arg_11_3 * 0.5

	if var_11_0 < arg_11_4.x then
		arg_11_4.x = var_11_0
	elseif arg_11_4.x < -var_11_0 then
		arg_11_4.x = -var_11_0
	end

	if var_11_1 < arg_11_4.y then
		arg_11_4.y = var_11_1
	elseif arg_11_4.y < -var_11_1 then
		arg_11_4.y = -var_11_1
	end

	return arg_11_4
end

function var_0_0.IsBehindCamera(arg_12_0)
	local var_12_0 = IslandCameraMgr.instance._mainCamera.transform.forward

	return Vector3.Dot(var_12_0, arg_12_0) > 0
end

function var_0_0.GetSurroundPoints(arg_13_0)
	local var_13_0 = {}

	table.insert(var_13_0, arg_13_0)
	table.insert(var_13_0, Vector3(arg_13_0.x * -1, arg_13_0.y, arg_13_0.z * -1))
	table.insert(var_13_0, Vector3(arg_13_0.x, arg_13_0.y, arg_13_0.z * -1))
	table.insert(var_13_0, Vector3(arg_13_0.x * -1, arg_13_0.y, arg_13_0.z))

	return var_13_0
end

function var_0_0.GetRandomSurroundPoints(arg_14_0)
	local var_14_0 = Vector2(arg_14_0.x, arg_14_0.z).magnitude
	local var_14_1 = math.Random(1, 360)
	local var_14_2 = Vector2(Mathf.Cos(var_14_1) * var_14_0, Mathf.Sin(var_14_1) * var_14_0)

	return Vector3(var_14_2.x, arg_14_0.y, var_14_2.y)
end

function var_0_0.IsHappen(arg_15_0)
	return arg_15_0 >= math.random(0, 100)
end

function var_0_0.IsCircleInsideNavMesh(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	return #IslandHelper.CircleInsideNavMesh(arg_16_0, arg_16_1, arg_16_2, arg_16_3):ToTable() > 0
end

function var_0_0.GetCanReachPoints(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = IslandHelper.CircleInsideNavMesh(arg_17_2, arg_17_3, arg_17_1, arg_17_4):ToTable()
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if IslandHelper.CanReachPoint(arg_17_0, iter_17_1) then
			table.insert(var_17_1, iter_17_1)
		end
	end

	return var_17_1
end

function var_0_0.GetCanReachOptPoint(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4, arg_18_5)
	local var_18_0 = var_0_0.GetCanReachPoints(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_5)

	if #var_18_0 <= 0 then
		return nil
	end

	table.sort(var_18_0, function(arg_19_0, arg_19_1)
		return Vector3.Distance(arg_19_0, arg_18_4) < Vector3.Distance(arg_19_1, arg_18_4)
	end)

	return var_18_0[1]
end

function var_0_0.CanReachPoint(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	return #var_0_0.GetCanReachPoints(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4) > 0
end

function var_0_0.RotationOffset(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_1 - arg_21_0

	var_21_0.y = 0

	local var_21_1 = Vector3.Normalize(var_21_0)
	local var_21_2 = arg_21_2 - arg_21_0

	var_21_2.y = 0

	local var_21_3 = Vector3.Normalize(var_21_2)
	local var_21_4 = Quaternion.FromToRotation(var_21_1, var_21_3).eulerAngles

	return (Quaternion.Euler(0, var_21_4.y, 0))
end

return var_0_0

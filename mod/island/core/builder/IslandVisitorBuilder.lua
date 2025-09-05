local var_0_0 = class("IslandVisitorBuilder", import(".IslandCharUnitBuilder"))

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandVisitorUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.SetTag(arg_2_0, arg_2_1)
	return
end

function var_0_0.SetupBT(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_3()
end

function var_0_0.AddComponents(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = GetOrAddComponent(arg_4_1, typeof(CharacterController))

	var_4_0.slopeLimit = 50
	var_4_0.stepOffset = 0.3
	var_4_0.stepOffset = 0.08
	var_4_0.minMoveDistance = 0
	var_4_0.height = 1.76
	var_4_0.stepOffset = 0.4
	var_4_0.center = Vector3(0, 0.96, 0)

	GetOrAddComponent(arg_4_1, typeof(CharacterHandleController))

	arg_4_1.name = "Visitor_" .. arg_4_2.id
end

return var_0_0

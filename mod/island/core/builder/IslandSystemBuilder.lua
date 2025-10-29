local var_0_0 = class("IslandSystemBuilder", import(".IslandGenericBuilder"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, IslandConst.UNIT_LIST_SYSTEM)

	arg_1_0.cls = arg_1_2
end

function var_0_0.LoadAsset(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = GameObject.New()

	arg_2_2(var_2_0)
end

function var_0_0.GetModule(arg_3_0, arg_3_1, arg_3_2)
	return arg_3_0.cls.New(arg_3_1, arg_3_2)
end

return var_0_0

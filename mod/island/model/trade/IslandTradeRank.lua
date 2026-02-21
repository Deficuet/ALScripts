local var_0_0 = class("IslandTradeRank")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.value = arg_1_1.value
	arg_1_0.skinId = arg_1_1.skinId
	arg_1_0.islandLevel = arg_1_1.islandLevel
	arg_1_0.name = arg_1_1.name
end

function var_0_0.IsSelf(arg_2_0)
	local var_2_0 = getProxy(PlayerProxy):getRawData()

	return arg_2_0.id == var_2_0.id
end

function var_0_0.SetValue(arg_3_0, arg_3_1)
	arg_3_0.value = arg_3_1
end

return var_0_0

local var_0_0 = class("PoolObjPack")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.key = arg_1_1
	arg_1_0.ab = arg_1_2
	arg_1_0.items = {}
	arg_1_0.typeDic = {}
end

function var_0_0.Get(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_1
	local var_2_1 = true

	if HXSet.isHx() and var_2_0 ~= "" then
		var_2_0 = var_2_0 .. "_hx"

		local var_2_2 = arg_2_0.ab:ChangeAssetName(var_2_0)
		local var_2_3 = arg_2_0.ab:GetAllAssetNames()

		var_2_1 = table.contains(var_2_3, var_2_2)
	end

	var_2_0 = var_2_1 and var_2_0 or arg_2_1

	if not arg_2_0.items[var_2_0] then
		arg_2_0.items[var_2_0] = arg_2_0.ab:LoadAssetSync(var_2_0, arg_2_2, false, false)
		arg_2_0.typeDic[var_2_0] = arg_2_2
	end

	return arg_2_0.items[var_2_0]
end

function var_0_0.Remove(arg_3_0, arg_3_1)
	return table.removebykey(arg_3_0.items, arg_3_1)
end

function var_0_0.GetAmount(arg_4_0)
	return table.getCount(arg_4_0.items)
end

function var_0_0.Clear(arg_5_0)
	arg_5_0.items = nil
	arg_5_0.typeDic = nil

	arg_5_0.ab:Dispose()

	arg_5_0.ab = nil
end

return var_0_0

local var_0_0 = class("IslandAssetPool", import(".IslandObjectPool"))

function var_0_0.CanDelete(arg_1_0)
	return true
end

function var_0_0.Dequeue(arg_2_0)
	return arg_2_0:NewItem()
end

function var_0_0.Enqueue(arg_3_0, arg_3_1)
	Object.Destroy(arg_3_1)
end

return var_0_0

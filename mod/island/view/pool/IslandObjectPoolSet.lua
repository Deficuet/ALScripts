local var_0_0 = class("IslandObjectPoolSet", import(".IslandPoolBase"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.root = arg_1_1
	arg_1_0.pools = {}
	arg_1_0.capacity = arg_1_2
	arg_1_0.poolCapacity = arg_1_3
end

function var_0_0.CreatePool(arg_2_0, arg_2_1, arg_2_2)
	return IslandObjectPool.New(arg_2_0.root, arg_2_1, arg_2_2, arg_2_0.poolCapacity)
end

function var_0_0.GetPool(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_0.pools[arg_3_1]

	if not var_3_0 then
		var_3_0 = arg_3_0:CreatePool(arg_3_1, arg_3_2)
		arg_3_0.pools[arg_3_1] = var_3_0
	end

	return var_3_0
end

function var_0_0.RawGetPool(arg_4_0, arg_4_1)
	return arg_4_0.pools[arg_4_1]
end

function var_0_0.GetObject(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0:GetPool(arg_5_1, arg_5_2)

	arg_5_0:CheckOverFlow(var_5_0)

	local var_5_1 = {}

	if not var_5_0:Isloaded() then
		table.insert(var_5_1, function(arg_6_0)
			var_5_0:Load(arg_6_0)
		end)
	end

	seriesAsync(var_5_1, function()
		local var_7_0 = var_5_0:Dequeue()

		arg_5_3(var_7_0)
	end)
end

function var_0_0.ReturnObject(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0:RawGetPool(arg_8_1)

	if not var_8_0 then
		Object.Destroy(arg_8_2)

		return
	end

	var_8_0:Enqueue(arg_8_2)
end

function var_0_0.CheckOverFlow(arg_9_0, arg_9_1)
	local var_9_0 = table.getCount(arg_9_0.pools)

	if var_9_0 > arg_9_0.capacity then
		arg_9_0:DeleteOverflowPools(var_9_0 - arg_9_0.capacity, arg_9_1)
	end
end

function var_0_0.DeleteOverflowPools(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.pools) do
		if iter_10_1 ~= arg_10_2 and arg_10_1 > #var_10_0 and iter_10_1:CanDelete() then
			table.insert(var_10_0, iter_10_0)
		end
	end

	if #var_10_0 <= 0 then
		return
	end

	for iter_10_2, iter_10_3 in pairs(var_10_0) do
		arg_10_0.pools[iter_10_3]:Dispose()

		arg_10_0.pools[iter_10_3] = nil
	end
end

function var_0_0.Clear(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.pools) do
		iter_11_1:Clear()
	end

	arg_11_0.pools = {}
end

function var_0_0.Dispose(arg_12_0)
	for iter_12_0, iter_12_1 in pairs(arg_12_0.pools) do
		iter_12_1:Dispose()
	end

	arg_12_0.pools = nil
end

return var_0_0

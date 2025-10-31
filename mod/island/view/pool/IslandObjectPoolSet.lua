local var_0_0 = class("IslandObjectPoolSet", import(".IslandPoolBase"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.root = arg_1_1
	arg_1_0.pools = {}
	arg_1_0.capacity = arg_1_2
	arg_1_0.poolCapacity = arg_1_3
	arg_1_0.loadingCallbacks = {}
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

	if not arg_5_0.loadingCallbacks[var_5_0.key] then
		arg_5_0.loadingCallbacks[var_5_0.key] = {}
	end

	table.insert(arg_5_0.loadingCallbacks[var_5_0.key], arg_5_3)

	if var_5_0:IsLoading() then
		return
	end

	local var_5_1 = {}

	if not var_5_0:Isloaded() then
		table.insert(var_5_1, function(arg_6_0)
			var_5_0:Load(arg_6_0)
		end)
	end

	seriesAsync(var_5_1, function()
		arg_5_0:CheckOverFlow(var_5_0)

		local var_7_0 = {}

		for iter_7_0, iter_7_1 in ipairs(arg_5_0.loadingCallbacks[var_5_0.key]) do
			table.insert(var_7_0, function(arg_8_0)
				var_5_0:DequeueAsyn(function(arg_9_0)
					iter_7_1(arg_9_0)
					arg_8_0()
				end)
			end)
		end

		parallelAsync(var_7_0)

		arg_5_0.loadingCallbacks[var_5_0.key] = {}
	end)
end

function var_0_0.ReturnObject(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0:RawGetPool(arg_10_1)

	if not var_10_0 then
		Object.Destroy(arg_10_2)

		return
	end

	var_10_0:Enqueue(arg_10_2)
end

function var_0_0.CheckOverFlow(arg_11_0, arg_11_1)
	local var_11_0 = table.getCount(arg_11_0.pools)

	if var_11_0 > arg_11_0.capacity then
		arg_11_0:DeleteOverflowPools(var_11_0 - arg_11_0.capacity, arg_11_1)
	end
end

function var_0_0.DeleteOverflowPools(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0.pools) do
		if iter_12_1 ~= arg_12_2 and arg_12_1 > #var_12_0 and iter_12_1:CanDelete() and (not arg_12_0.loadingCallbacks[iter_12_1.key] or #arg_12_0.loadingCallbacks[iter_12_1.key] == 0) then
			table.insert(var_12_0, iter_12_0)
		end
	end

	if #var_12_0 <= 0 then
		return
	end

	for iter_12_2, iter_12_3 in pairs(var_12_0) do
		arg_12_0.pools[iter_12_3]:Dispose()

		arg_12_0.pools[iter_12_3] = nil
	end
end

function var_0_0.Clear(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.pools) do
		iter_13_1:Clear()
	end

	arg_13_0.pools = {}
	arg_13_0.loadingCallbacks = {}
end

function var_0_0.Dispose(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.pools) do
		iter_14_1:Dispose()
	end

	arg_14_0.pools = nil
	arg_14_0.loadingCallbacks = {}
end

return var_0_0

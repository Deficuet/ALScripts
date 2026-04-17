local var_0_0 = class("IslandObjectPoolSet", import(".IslandPoolBase"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.root = arg_1_1
	arg_1_0.pools = {}
	arg_1_0.capacity = arg_1_2
	arg_1_0.poolCapacity = arg_1_3
	arg_1_0.loadingCallbacks = {}
end

function var_0_0.SetInstanceDestroyPreProcessor(arg_2_0, arg_2_1)
	arg_2_0.instanceDestroyPreProcessor = arg_2_1
end

function var_0_0.CreatePool(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = IslandObjectPool.New(arg_3_0.root, arg_3_1, arg_3_2, arg_3_0.poolCapacity)

	var_3_0:SetInstanceDestroyPreProcessor(arg_3_0.instanceDestroyPreProcessor)

	return var_3_0
end

function var_0_0.GetPool(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.pools[arg_4_1]

	if not var_4_0 then
		var_4_0 = arg_4_0:CreatePool(arg_4_1, arg_4_2)
		arg_4_0.pools[arg_4_1] = var_4_0
	end

	return var_4_0
end

function var_0_0.RawGetPool(arg_5_0, arg_5_1)
	return arg_5_0.pools[arg_5_1]
end

function var_0_0.GetObject(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_0:GetPool(arg_6_1, arg_6_2)

	if not arg_6_0.loadingCallbacks[var_6_0.key] then
		arg_6_0.loadingCallbacks[var_6_0.key] = {}
	end

	table.insert(arg_6_0.loadingCallbacks[var_6_0.key], arg_6_3)

	if var_6_0:IsLoading() then
		return
	end

	local var_6_1 = {}

	if not var_6_0:Isloaded() then
		table.insert(var_6_1, function(arg_7_0)
			var_6_0:Load(arg_7_0)
		end)
	end

	seriesAsync(var_6_1, function()
		arg_6_0:CheckOverFlow(var_6_0)

		local var_8_0 = {}
		local var_8_1 = Clone(arg_6_0.loadingCallbacks[var_6_0.key])

		arg_6_0.loadingCallbacks[var_6_0.key] = {}

		for iter_8_0, iter_8_1 in ipairs(var_8_1) do
			table.insert(var_8_0, function(arg_9_0)
				var_6_0:DequeueAsyn(function(arg_10_0)
					iter_8_1(arg_10_0)
					arg_9_0()
				end)
			end)
		end

		parallelAsync(var_8_0)
	end)
end

function var_0_0.ReturnObject(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0:RawGetPool(arg_11_1)

	if not var_11_0 then
		existCall(arg_11_0.instanceDestroyPreProcessor, arg_11_2)
		Object.Destroy(arg_11_2)

		return
	end

	var_11_0:Enqueue(arg_11_2)
end

function var_0_0.CheckOverFlow(arg_12_0, arg_12_1)
	local var_12_0 = table.getCount(arg_12_0.pools)

	if var_12_0 > arg_12_0.capacity then
		arg_12_0:DeleteOverflowPools(var_12_0 - arg_12_0.capacity, arg_12_1)
	end
end

function var_0_0.DeleteOverflowPools(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0.pools) do
		if iter_13_1 ~= arg_13_2 and arg_13_1 > #var_13_0 and iter_13_1:CanDelete() and (not arg_13_0.loadingCallbacks[iter_13_1.key] or #arg_13_0.loadingCallbacks[iter_13_1.key] == 0) then
			table.insert(var_13_0, iter_13_0)
		end
	end

	if #var_13_0 <= 0 then
		return
	end

	for iter_13_2, iter_13_3 in pairs(var_13_0) do
		arg_13_0.pools[iter_13_3]:Dispose()

		arg_13_0.pools[iter_13_3] = nil
	end
end

function var_0_0.Clear(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.pools) do
		iter_14_1:Clear()
	end

	arg_14_0.pools = {}
	arg_14_0.loadingCallbacks = {}
end

function var_0_0.Dispose(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.pools) do
		iter_15_1:Dispose()
	end

	arg_15_0.pools = nil
	arg_15_0.loadingCallbacks = {}
end

return var_0_0

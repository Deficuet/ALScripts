local var_0_0 = class("IslandObjectPool")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.root = arg_1_1
	arg_1_0.assetPath = arg_1_2
	arg_1_0.assetType = arg_1_3
	arg_1_0.capacity = arg_1_4 or 3
	arg_1_0.asset = nil
	arg_1_0.key = arg_1_0.assetPath
	arg_1_0.items = {}
	arg_1_0.isLoading = false
	arg_1_0.insIdList = {}
end

function var_0_0.Isloaded(arg_2_0)
	return arg_2_0.asset ~= nil
end

function var_0_0.IsLoading(arg_3_0)
	return arg_3_0.isLoading
end

function var_0_0.CanDelete(arg_4_0)
	return arg_4_0:Isloaded() and #arg_4_0.items > 0
end

function var_0_0.ActiveOrDisactiveItem(arg_5_0, arg_5_1, arg_5_2)
	SetActive(arg_5_1, arg_5_2)
end

function var_0_0.Load(arg_6_0, arg_6_1)
	arg_6_0.isLoading = true
	arg_6_0.loadingId = IslandAssetLoadDispatcher.Instance:Enqueue(arg_6_0.assetPath, "", arg_6_0.assetType, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_7_0)
		assert(arg_7_0, "asset is nil >>>" .. arg_6_0.assetPath)

		arg_6_0.asset = arg_7_0

		if arg_6_0:Isloaded() then
			arg_6_1()
		end

		arg_6_0.isLoading = false
	end), true, true)
end

function var_0_0.NewItem(arg_8_0)
	assert(arg_8_0:Isloaded(), "call load first")

	return Object.Instantiate(arg_8_0.asset)
end

function var_0_0.NewItemAsyn(arg_9_0, arg_9_1)
	assert(arg_9_0:Isloaded(), "call load first")

	local var_9_0 = FrameAsyncInstantiateManager.Instance:EnqueueInstantiate(arg_9_0.asset, function(arg_10_0)
		arg_9_1(arg_10_0)
	end)

	table.insert(arg_9_0.insIdList, var_9_0)
end

function var_0_0.DequeueAsyn(arg_11_0, arg_11_1)
	if #arg_11_0.items > 0 then
		local var_11_0 = table.remove(arg_11_0.items, 1)

		if UIUtil.IsGameObject(var_11_0) then
			arg_11_0:ActiveOrDisactiveItem(var_11_0, true)
		end

		arg_11_1(var_11_0)
	else
		arg_11_0:NewItemAsyn(function(arg_12_0)
			if UIUtil.IsGameObject(arg_12_0) then
				arg_11_0:ActiveOrDisactiveItem(arg_12_0, true)
			end

			arg_11_1(arg_12_0)
		end)
	end
end

function var_0_0.Dequeue(arg_13_0)
	local var_13_0

	if #arg_13_0.items > 0 then
		var_13_0 = table.remove(arg_13_0.items, 1)
	else
		var_13_0 = arg_13_0:NewItem()
	end

	if UIUtil.IsGameObject(var_13_0) then
		arg_13_0:ActiveOrDisactiveItem(var_13_0, true)
	end

	assert(var_13_0, "item is nil", arg_13_0.assetPath)

	return var_13_0
end

function var_0_0.Enqueue(arg_14_0, arg_14_1)
	assert(arg_14_1, "item is nil")

	if #arg_14_0.items >= arg_14_0.capacity then
		Object.Destroy(arg_14_1)

		return
	end

	if UIUtil.IsGameObject(arg_14_1) then
		setParent(arg_14_1, arg_14_0.root)
		arg_14_0:ActiveOrDisactiveItem(arg_14_1, false)
	end

	table.insert(arg_14_0.items, arg_14_1)
end

function var_0_0.Clear(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0.items) do
		Object.Destroy(iter_15_1)
	end

	arg_15_0.items = {}

	for iter_15_2, iter_15_3 in ipairs(arg_15_0.insIdList) do
		FrameAsyncInstantiateManager.Instance:Cancel(iter_15_3)
	end

	arg_15_0.insIdList = {}
end

function var_0_0.Dispose(arg_16_0)
	arg_16_0:Clear()

	arg_16_0.items = nil
	arg_16_0.asset = nil

	if arg_16_0.loadingId then
		IslandAssetLoadDispatcher.Instance:Cancel(arg_16_0.loadingId)

		arg_16_0.loadingId = nil
	end
end

return var_0_0

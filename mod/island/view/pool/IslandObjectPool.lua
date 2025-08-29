local var_0_0 = class("IslandObjectPool")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	arg_1_0.root = arg_1_1
	arg_1_0.assetPath = arg_1_2
	arg_1_0.assetType = arg_1_3
	arg_1_0.capacity = arg_1_4 or 3
	arg_1_0.asset = nil
	arg_1_0.items = {}
end

function var_0_0.Isloaded(arg_2_0)
	return arg_2_0.asset ~= nil
end

function var_0_0.CanDelete(arg_3_0)
	return arg_3_0:Isloaded() and #arg_3_0.items > 0
end

function var_0_0.Load(arg_4_0, arg_4_1)
	ResourceMgr.Inst:getAssetAsync(arg_4_0.assetPath, "", arg_4_0.assetType, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_5_0)
		assert(arg_5_0, "asset is nil >>>" .. arg_4_0.assetPath)

		arg_4_0.asset = arg_5_0

		if arg_4_0:Isloaded() then
			arg_4_1()
		end
	end), true, true)
end

function var_0_0.NewItem(arg_6_0)
	assert(arg_6_0:Isloaded(), "call load first")

	return Object.Instantiate(arg_6_0.asset)
end

function var_0_0.Dequeue(arg_7_0)
	local var_7_0

	if #arg_7_0.items > 0 then
		var_7_0 = table.remove(arg_7_0.items, 1)
	else
		var_7_0 = arg_7_0:NewItem()
	end

	if UIUtil.IsGameObject(var_7_0) then
		setActive(var_7_0, true)
	end

	assert(var_7_0, "item is nil", arg_7_0.assetPath)

	return var_7_0
end

function var_0_0.Enqueue(arg_8_0, arg_8_1)
	assert(arg_8_1, "item is nil")

	if #arg_8_0.items >= arg_8_0.capacity then
		Object.Destroy(arg_8_1)

		return
	end

	if UIUtil.IsGameObject(arg_8_1) then
		setParent(arg_8_1, arg_8_0.root)
		setActive(arg_8_1, false)
	end

	table.insert(arg_8_0.items, arg_8_1)
end

function var_0_0.Clear(arg_9_0)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.items) do
		Object.Destroy(iter_9_1)
	end

	arg_9_0.items = {}
end

function var_0_0.Dispose(arg_10_0)
	arg_10_0:Clear()

	arg_10_0.items = nil
	arg_10_0.asset = nil
end

return var_0_0

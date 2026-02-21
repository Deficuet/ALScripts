local var_0_0 = class("PacGameItemController")
local var_0_1 = 5
local var_0_2 = 1

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._sceneMask = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._runningData = arg_1_3
	arg_1_0._content = findTF(arg_1_0._sceneMask, "sceneContainer/scene/content/map")
end

function var_0_0.Prepare(arg_2_0)
	arg_2_0._itemConfig = arg_2_0._runningData:GetMapConfig("item")
	arg_2_0._gridDic = arg_2_0._runningData:GetGridDic()
	arg_2_0._mapTFDic = arg_2_0._runningData:GetMapTFDic()
	arg_2_0._player = arg_2_0._runningData:GetPlayer()
end

function var_0_0.Start(arg_3_0)
	arg_3_0._createItemTime = PacGameConst.item_time
	arg_3_0._items = {}
end

function var_0_0.Step(arg_4_0, arg_4_1)
	arg_4_0._deltaTime = arg_4_1

	if arg_4_0._runningData:GetEditor() then
		return
	end

	if arg_4_0._createItemTime and arg_4_0._createItemTime > 0 then
		arg_4_0._createItemTime = arg_4_0._createItemTime - arg_4_1

		if arg_4_0._createItemTime <= 0 then
			arg_4_0:tryCreateItem()

			arg_4_0._createItemTime = PacGameConst.item_time
		end
	end

	local var_4_0 = arg_4_0._player:GetGridIndex()

	for iter_4_0 = #arg_4_0._items, 1, -1 do
		local var_4_1 = arg_4_0._items[iter_4_0]
		local var_4_2 = var_4_1:GetIndex()
		local var_4_3 = var_4_1:GetConfig("effect")
		local var_4_4 = var_4_1:GetConfig("effect_time")

		if var_4_2 == var_4_0 then
			arg_4_0:SetItemEffect(var_4_3, var_4_4)
			var_4_1:Dispose()
			table.remove(arg_4_0._items, iter_4_0)
		end
	end
end

function var_0_0.Clear(arg_5_0)
	arg_5_0._player = nil

	for iter_5_0 = #arg_5_0._items, 1, -1 do
		arg_5_0._items[iter_5_0]:Dispose()
	end

	arg_5_0._items = {}
end

function var_0_0.Stop(arg_6_0)
	return
end

function var_0_0.Resume(arg_7_0)
	return
end

function var_0_0.Dispose(arg_8_0)
	return
end

function var_0_0.SetItemEffect(arg_9_0, arg_9_1, arg_9_2)
	if not arg_9_0._player then
		return
	end

	if arg_9_1 == var_0_2 then
		arg_9_0._player:SetRush(true, arg_9_2)
	end
end

function var_0_0.tryCreateItem(arg_10_0)
	local var_10_0 = {}
	local var_10_1 = arg_10_0._player:GetGridIndex()

	for iter_10_0, iter_10_1 in pairs(arg_10_0._gridDic) do
		if iter_10_1:GetPassAble() and not iter_10_1:GetScoreFlag() and iter_10_1:GetIndex() ~= var_10_1 then
			table.insert(var_10_0, iter_10_1:GetIndex())
		end
	end

	if #arg_10_0._items <= PacGameConst.max_item_count and #var_10_0 >= 10 and math.random() <= PacGameConst.item_rate then
		local var_10_2 = var_10_0[math.random(1, #var_10_0)]
		local var_10_3 = arg_10_0._gridDic[var_10_2]
		local var_10_4 = var_10_3:GetIndex()
		local var_10_5 = var_10_3:GetPosition()
		local var_10_6, var_10_7 = var_10_3:GetVH()
		local var_10_8 = arg_10_0._mapTFDic[var_10_6]
		local var_10_9 = arg_10_0._itemConfig[math.random(1, #arg_10_0._itemConfig)]
		local var_10_10 = arg_10_0:createItem(var_10_9, var_10_4, var_10_8)

		var_10_10:SetPosition(var_10_5)
		table.insert(arg_10_0._items, var_10_10)
	end
end

function var_0_0.createItem(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = PacGameConst.item_data[arg_11_1]
	local var_11_1 = var_11_0.prefab
	local var_11_2 = arg_11_0._runningData:GetTplItemFromPool(var_11_1, arg_11_3)

	return (PacGameItem.New(var_11_2, arg_11_2, var_11_0))
end

return var_0_0

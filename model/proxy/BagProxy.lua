local var_0_0 = class("BagProxy", import(".NetProxy"))

var_0_0.ITEM_UPDATED = "item updated"

function var_0_0.register(arg_1_0)
	arg_1_0:on(15001, function(arg_2_0)
		arg_1_0.data = {}
		arg_1_0.loveLetterRepairDic = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.item_list) do
			local var_2_0 = Item.New({
				id = iter_2_1.id,
				count = iter_2_1.count
			})

			var_2_0:display("loaded")

			arg_1_0.data[var_2_0.id] = var_2_0
		end

		arg_1_0.limitList = {}

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.limit_list) do
			arg_1_0.limitList[iter_2_3.id] = iter_2_3.count
		end

		arg_1_0.extraItemData = {}

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.item_misc_list) do
			arg_1_0.extraItemData[iter_2_5.id] = arg_1_0.extraItemData[iter_2_5.id] or {}

			table.insert(arg_1_0.extraItemData[iter_2_5.id], iter_2_5.data)
		end
	end)
end

function var_0_0.addExtraData(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.extraItemData[arg_3_1] = arg_3_0.extraItemData[arg_3_1] or {}

	table.insert(arg_3_0.extraItemData[arg_3_1], arg_3_2)
end

function var_0_0.removeExtraData(arg_4_0, arg_4_1, arg_4_2)
	table.removebyvalue(arg_4_0.extraItemData[arg_4_1] or {}, arg_4_2)
end

function var_0_0.hasExtraData(arg_5_0, arg_5_1, arg_5_2)
	warning(PrintTable(arg_5_0.extraItemData[arg_5_1] or {}))

	return table.contains(arg_5_0.extraItemData[arg_5_1] or {}, arg_5_2)
end

function var_0_0.addItemById(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	assert(arg_6_2 > 0, "count should greater than zero")

	if arg_6_1 == ITEM_ID_CUBE then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_CUBE_ADD, arg_6_2)
	end

	for iter_6_0 = 1, arg_6_2 do
		arg_6_0:addExtraData(arg_6_1, arg_6_3)
	end

	arg_6_0:updateItem(arg_6_1, arg_6_2, arg_6_3)
end

function var_0_0.removeItemById(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	assert(arg_7_2 > 0, "count should greater than zero")

	if arg_7_1 == ITEM_ID_CUBE then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_CUBE_CONSUME, arg_7_2)
	end

	for iter_7_0 = 1, arg_7_2 do
		arg_7_0:removeExtraData(arg_7_1, arg_7_3)
	end

	arg_7_0:updateItem(arg_7_1, -arg_7_2, arg_7_3)
end

function var_0_0.getItemsByExclude(arg_8_0)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0.data) do
		local var_8_1 = iter_8_1:getConfig("type")

		if not Item.INVISIBLE_TYPE[var_8_1] and iter_8_1.count > 0 then
			if arg_8_0.extraItemData[iter_8_0] then
				local var_8_2 = iter_8_1.count

				for iter_8_2, iter_8_3 in ipairs(arg_8_0.extraItemData[iter_8_0]) do
					table.insert(var_8_0, Item.New({
						count = 1,
						id = iter_8_0,
						extra = iter_8_3
					}))

					var_8_2 = var_8_2 - 1
				end

				if var_8_2 > 0 then
					table.insert(var_8_0, Item.New({
						id = iter_8_0,
						count = var_8_2
					}))
				end
			else
				table.insert(var_8_0, iter_8_1)
			end
		end
	end

	return var_8_0
end

function var_0_0.getItemsByType(arg_9_0, arg_9_1)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.data) do
		if iter_9_1:getConfig("type") == arg_9_1 and iter_9_1.count ~= 0 then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return Clone(var_9_0)
end

function var_0_0.ExitTypeItems(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.data) do
		if iter_10_1:getConfig("type") == arg_10_1 and iter_10_1.count > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetItemsByCondition(arg_11_0, arg_11_1)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.data) do
		local var_11_1 = true

		if arg_11_1 then
			for iter_11_2, iter_11_3 in pairs(arg_11_1) do
				if iter_11_1:getConfig(iter_11_2) ~= iter_11_3 then
					var_11_1 = false

					break
				end
			end
		end

		if var_11_1 then
			table.insert(var_11_0, iter_11_1)
		end
	end

	return var_11_0
end

function var_0_0.getItemById(arg_12_0, arg_12_1)
	if arg_12_0.data[arg_12_1] ~= nil then
		return arg_12_0.data[arg_12_1]:clone()
	end

	return nil
end

function var_0_0.RawGetItemById(arg_13_0, arg_13_1)
	if arg_13_0.data[arg_13_1] ~= nil then
		return arg_13_0.data[arg_13_1]
	end

	return nil
end

function var_0_0.getItemCountById(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.data[arg_14_1] and arg_14_0.data[arg_14_1].count or 0

	if arg_14_0.extraItemData[arg_14_1] and #arg_14_0.extraItemData[arg_14_1] > 0 then
		var_14_0 = math.max(var_14_0, 1)
	end

	return var_14_0
end

function var_0_0.getBoxCount(arg_15_0)
	local var_15_0 = arg_15_0:getItemsByType(Item.EQUIPMENT_BOX_TYPE_5)

	return table.getCount(var_15_0)
end

function var_0_0.getCanComposeCount(arg_16_0)
	local var_16_0 = 0
	local var_16_1 = pg.compose_data_template

	for iter_16_0, iter_16_1 in pairs(var_16_1.all) do
		local var_16_2 = var_16_1[iter_16_1].material_id
		local var_16_3 = var_16_1[iter_16_1].material_num
		local var_16_4 = arg_16_0:getItemById(var_16_2)

		if var_16_4 and var_16_3 <= var_16_4.count then
			var_16_0 = var_16_0 + 1
		end
	end

	return var_16_0
end

function var_0_0.updateItem(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0.data[arg_17_1] or Item.New({
		count = 0,
		id = arg_17_1
	})

	var_17_0.count = var_17_0.count + arg_17_2

	assert(var_17_0.count >= 0, "item count error: " .. var_17_0.id)

	arg_17_0.data[var_17_0.id] = var_17_0

	arg_17_0.data[var_17_0.id]:display("updated")

	local var_17_1 = var_17_0:clone()

	var_17_1.extra = arg_17_3

	arg_17_0.facade:sendNotification(var_0_0.ITEM_UPDATED, var_17_1)
end

function var_0_0.canUpgradeFlagShipEquip(arg_18_0)
	local var_18_0 = getProxy(BayProxy):getEquipment2ByflagShip()

	if var_18_0 then
		for iter_18_0, iter_18_1 in pairs(var_18_0:getConfig("trans_use_item")) do
			local var_18_1 = arg_18_0:getItemById(iter_18_1[1])

			if not var_18_1 or var_18_1.count < iter_18_1[2] then
				return false
			end
		end

		return true
	end
end

function var_0_0.AddLimitCnt(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.limitList[arg_19_1] = (arg_19_0.limitList[arg_19_1] or 0) + arg_19_2
end

function var_0_0.GetLimitCntById(arg_20_0, arg_20_1)
	return arg_20_0.limitList[arg_20_1] or 0
end

function var_0_0.ClearLimitCnt(arg_21_0, arg_21_1)
	arg_21_0.limitList[arg_21_1] = 0
end

function var_0_0.GetSkinShopDiscountItemList(arg_22_0)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in pairs(arg_22_0.data) do
		if iter_22_1.count > 0 and iter_22_1:IsSkinShopDiscountType() then
			table.insert(var_22_0, iter_22_1)
		end
	end

	return var_22_0
end

function var_0_0.GetExclusiveDiscountItem4Shop(arg_23_0, arg_23_1)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0.data) do
		if iter_23_1.count > 0 and iter_23_1:IsExclusiveDiscountType() and iter_23_1:CanUseForShop(arg_23_1) then
			table.insert(var_23_0, iter_23_1)
		end
	end

	return var_23_0
end

function var_0_0.SetLoveLetterRepairInfo(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.loveLetterRepairDic[arg_24_1] = arg_24_2
end

function var_0_0.GetLoveLetterRepairInfo(arg_25_0, arg_25_1)
	return arg_25_0.loveLetterRepairDic[arg_25_1]
end

function var_0_0.GetSellingPrice(arg_26_0, arg_26_1)
	local var_26_0 = getProxy(BagProxy)
	local var_26_1 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_1) do
		local var_26_2 = var_26_0:RawGetItemById(iter_26_1.id):GetPrice() or {}
		local var_26_3 = var_26_2[1] or 0
		local var_26_4 = var_26_2[2] or 0

		if not var_26_1[var_26_3] then
			var_26_1[var_26_3] = 0
		end

		var_26_1[var_26_3] = var_26_1[var_26_3] + var_26_4 * iter_26_1.count
	end

	local var_26_5 = {}

	for iter_26_2, iter_26_3 in pairs(var_26_1) do
		if iter_26_2 > 0 and iter_26_3 > 0 then
			table.insert(var_26_5, {
				DROP_TYPE_RESOURCE,
				iter_26_2,
				iter_26_3
			})
		end
	end

	return var_26_5
end

function var_0_0.GetSkinExperienceItems(arg_27_0)
	local var_27_0 = {}
	local var_27_1 = getProxy(BagProxy):getRawData()

	for iter_27_0, iter_27_1 in pairs(var_27_1) do
		if iter_27_1.count > 0 and iter_27_1:IsSkinExperienceType() then
			table.insert(var_27_0, iter_27_1)
		end
	end

	return var_27_0
end

return var_0_0

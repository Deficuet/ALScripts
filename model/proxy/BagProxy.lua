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
	if arg_3_2 == nil then
		return
	end

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

		if not Item.INVISIBLE_TYPE[var_8_1] and iter_8_1.count > 0 and not iter_8_1:IsExpired() then
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

function var_0_0.getItemsByTypeList(arg_9_0, arg_9_1)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.data) do
		local var_9_1 = iter_9_1:getConfig("type")

		if table.contains(arg_9_1, var_9_1) and iter_9_1.count > 0 then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return Clone(var_9_0)
end

function var_0_0.getItemsByType(arg_10_0, arg_10_1)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.data) do
		if iter_10_1:getConfig("type") == arg_10_1 and iter_10_1.count ~= 0 then
			table.insert(var_10_0, iter_10_1)
		end
	end

	return Clone(var_10_0)
end

function var_0_0.ExitTypeItems(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.data) do
		if iter_11_1:getConfig("type") == arg_11_1 and iter_11_1.count > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetItemsByCondition(arg_12_0, arg_12_1)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0.data) do
		local var_12_1 = true

		if arg_12_1 then
			for iter_12_2, iter_12_3 in pairs(arg_12_1) do
				if iter_12_1:getConfig(iter_12_2) ~= iter_12_3 then
					var_12_1 = false

					break
				end
			end
		end

		if var_12_1 then
			table.insert(var_12_0, iter_12_1)
		end
	end

	return var_12_0
end

function var_0_0.getItemById(arg_13_0, arg_13_1)
	if arg_13_0.data[arg_13_1] ~= nil then
		return arg_13_0.data[arg_13_1]:clone()
	end

	return nil
end

function var_0_0.RawGetItemById(arg_14_0, arg_14_1)
	if arg_14_0.data[arg_14_1] ~= nil then
		return arg_14_0.data[arg_14_1]
	end

	return nil
end

function var_0_0.getItemCountById(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.data[arg_15_1] and arg_15_0.data[arg_15_1].count or 0

	if arg_15_0.extraItemData[arg_15_1] and #arg_15_0.extraItemData[arg_15_1] > 0 then
		var_15_0 = math.max(var_15_0, 1)
	end

	return var_15_0
end

function var_0_0.getBoxCount(arg_16_0)
	local var_16_0 = arg_16_0:getItemsByType(Item.EQUIPMENT_BOX_TYPE_5)

	return table.getCount(var_16_0)
end

function var_0_0.getCanComposeCount(arg_17_0)
	local var_17_0 = 0
	local var_17_1 = pg.compose_data_template

	for iter_17_0, iter_17_1 in pairs(var_17_1.all) do
		local var_17_2 = var_17_1[iter_17_1].material_id
		local var_17_3 = var_17_1[iter_17_1].material_num
		local var_17_4 = arg_17_0:getItemById(var_17_2)

		if var_17_4 and var_17_3 <= var_17_4.count then
			var_17_0 = var_17_0 + 1
		end
	end

	return var_17_0
end

function var_0_0.updateItem(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0.data[arg_18_1] or Item.New({
		count = 0,
		id = arg_18_1
	})

	var_18_0.count = var_18_0.count + arg_18_2

	assert(var_18_0.count >= 0, "item count error: " .. var_18_0.id)

	arg_18_0.data[var_18_0.id] = var_18_0

	arg_18_0.data[var_18_0.id]:display("updated")

	local var_18_1 = var_18_0:clone()

	var_18_1.extra = arg_18_3

	arg_18_0.facade:sendNotification(var_0_0.ITEM_UPDATED, var_18_1)
end

function var_0_0.canUpgradeFlagShipEquip(arg_19_0)
	local var_19_0 = getProxy(BayProxy):getEquipment2ByflagShip()

	if var_19_0 then
		for iter_19_0, iter_19_1 in pairs(var_19_0:getConfig("trans_use_item")) do
			local var_19_1 = arg_19_0:getItemById(iter_19_1[1])

			if not var_19_1 or var_19_1.count < iter_19_1[2] then
				return false
			end
		end

		return true
	end
end

function var_0_0.AddLimitCnt(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.limitList[arg_20_1] = (arg_20_0.limitList[arg_20_1] or 0) + arg_20_2
end

function var_0_0.GetLimitCntById(arg_21_0, arg_21_1)
	return arg_21_0.limitList[arg_21_1] or 0
end

function var_0_0.ClearLimitCnt(arg_22_0, arg_22_1)
	arg_22_0.limitList[arg_22_1] = 0
end

function var_0_0.GetSkinShopDiscountItemList(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0.data) do
		if iter_23_1.count > 0 and iter_23_1:IsSkinShopDiscountType() then
			table.insert(var_23_0, iter_23_1)
		end
	end

	return var_23_0
end

function var_0_0.GetExclusiveDiscountItem4Shop(arg_24_0, arg_24_1)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.data) do
		if iter_24_1.count > 0 and iter_24_1:IsExclusiveDiscountType() and iter_24_1:CanUseForShop(arg_24_1) then
			table.insert(var_24_0, iter_24_1)
		end
	end

	return var_24_0
end

function var_0_0.ExistMeshImageSkinExchangeItem4Skin(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.data) do
		if iter_25_1.count > 0 and iter_25_1:IsMeshImageSkinExchangeType() then
			local var_25_0 = iter_25_1:GetValidSkinList()

			return _.any(var_25_0, function(arg_26_0)
				return arg_26_0 == arg_25_1
			end)
		end
	end

	return false
end

function var_0_0.GetMeshImageSkinsExchangeItem4Skin(arg_27_0, arg_27_1)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.data) do
		if iter_27_1.count > 0 and iter_27_1:IsMeshImageSkinExchangeType() then
			local var_27_1 = iter_27_1:GetValidSkinList()

			if _.any(var_27_1, function(arg_28_0)
				return arg_28_0 == arg_27_1
			end) then
				table.insert(var_27_0, iter_27_1)
			end
		end
	end

	return var_27_0
end

function var_0_0.SetLoveLetterRepairInfo(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0.loveLetterRepairDic[arg_29_1] = arg_29_2
end

function var_0_0.GetLoveLetterRepairInfo(arg_30_0, arg_30_1)
	return arg_30_0.loveLetterRepairDic[arg_30_1]
end

function var_0_0.GetSellingPrice(arg_31_0, arg_31_1)
	local var_31_0 = getProxy(BagProxy)
	local var_31_1 = {}

	for iter_31_0, iter_31_1 in pairs(arg_31_1) do
		local var_31_2 = var_31_0:RawGetItemById(iter_31_1.id):GetPrice() or {}
		local var_31_3 = var_31_2[1] or 0
		local var_31_4 = var_31_2[2] or 0

		if not var_31_1[var_31_3] then
			var_31_1[var_31_3] = 0
		end

		var_31_1[var_31_3] = var_31_1[var_31_3] + var_31_4 * iter_31_1.count
	end

	local var_31_5 = {}

	for iter_31_2, iter_31_3 in pairs(var_31_1) do
		if iter_31_2 > 0 and iter_31_3 > 0 then
			table.insert(var_31_5, {
				DROP_TYPE_RESOURCE,
				iter_31_2,
				iter_31_3
			})
		end
	end

	return var_31_5
end

function var_0_0.GetSkinExperienceItems(arg_32_0)
	local var_32_0 = {}
	local var_32_1 = getProxy(BagProxy):getRawData()

	for iter_32_0, iter_32_1 in pairs(var_32_1) do
		if iter_32_1.count > 0 and iter_32_1:IsSkinExperienceType() then
			table.insert(var_32_0, iter_32_1)
		end
	end

	return var_32_0
end

function var_0_0.GetAllLoveLetterItem(arg_33_0)
	local var_33_0 = {}
	local var_33_1 = getProxy(LoveLetterProxy):GetLoveLetterItemDic()

	for iter_33_0, iter_33_1 in pairs(arg_33_0.data) do
		assert(not arg_33_0.extraItemData[iter_33_0] or iter_33_1.count == #arg_33_0.extraItemData[iter_33_0])

		for iter_33_2 = 1, iter_33_1.count do
			local var_33_2 = arg_33_0.extraItemData[iter_33_0] and arg_33_0.extraItemData[iter_33_0][iter_33_2] or nil

			if not var_33_1[iter_33_0 .. "_" .. (var_33_2 or 0)] then
				break
			end

			table.insert(var_33_0, {
				iter_33_0,
				var_33_2
			})
		end
	end

	return var_33_0
end

return var_0_0

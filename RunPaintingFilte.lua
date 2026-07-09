PaintingfilteConst = {}

local var_0_0 = PaintingfilteConst

function var_0_0.GetStandardTimeConfig(arg_1_0)
	local var_1_0 = {}

	local function var_1_1(arg_2_0)
		for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
			if type(iter_2_1) == "table" and #iter_2_1 == 2 then
				table.insert(var_1_0, iter_2_1)
			end
		end
	end

	local function var_1_2(arg_3_0)
		for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
			if type(iter_3_1) == "table" and type(iter_3_1[1]) == "string" and type(iter_3_1[2]) == "table" then
				var_1_1(iter_3_1)
			end
		end
	end

	if #arg_1_0 == 2 and type(arg_1_0[1][1]) == "string" and type(arg_1_0[2][1]) == "string" then
		var_1_2(arg_1_0)
	else
		var_1_1(arg_1_0)
	end

	return var_1_0
end

function var_0_0.IsTwoTimeCross(arg_4_0, arg_4_1)
	local var_4_0 = pg.TimeMgr.GetInstance()
	local var_4_1 = var_4_0:parseTimeFromConfig(arg_4_0[1])
	local var_4_2 = var_4_0:parseTimeFromConfig(arg_4_0[2])
	local var_4_3 = var_4_0:parseTimeFromConfig(arg_4_1[1])
	local var_4_4 = var_4_0:parseTimeFromConfig(arg_4_1[2])

	if var_4_2 <= var_4_3 or var_4_4 <= var_4_1 then
		return false
	else
		return true
	end
end

function var_0_0.IsActMatchTime(arg_5_0)
	local var_5_0 = pg.activity_template[arg_5_0]
	local var_5_1 = var_5_0.type
	local var_5_2 = var_5_0.time

	if type(var_5_2) == "string" and var_5_2 == "always" then
		return true
	elseif type(var_5_2) == "table" then
		local var_5_3 = var_0_0.GetStandardTimeConfig(var_5_2)
		local var_5_4 = var_0_0.GetfilteTime()

		if var_0_0.IsTwoTimeCross(var_5_4, var_5_3) then
			return true
		end
	end
end

function var_0_0.IsBuildActMatch(arg_6_0)
	if pg.activity_template[arg_6_0].type == 1 or pg.activity_template[arg_6_0].type == 85 then
		return (var_0_0.IsActMatchTime(arg_6_0))
	else
		return false
	end
end

function var_0_0.IsNormalShopMatch(arg_7_0)
	local var_7_0 = pg.shop_template[arg_7_0]
	local var_7_1 = var_7_0.genre
	local var_7_2 = var_7_0.time

	if var_7_1 == "skin_shop" then
		if type(var_7_2) == "string" and var_7_2 == "always" then
			return true
		elseif type(var_7_2) == "table" then
			local var_7_3 = var_0_0.GetStandardTimeConfig(var_7_2)
			local var_7_4 = var_0_0.GetfilteTime()

			if var_0_0.IsTwoTimeCross(var_7_4, var_7_3) then
				return true
			end
		end
	end

	return false
end

function var_0_0.IsActShopMatch(arg_8_0)
	local var_8_0 = pg.activity_shop_extra[arg_8_0]
	local var_8_1 = var_8_0.commodity_type
	local var_8_2 = var_8_0.time

	if var_8_1 == DROP_TYPE_SKIN then
		if type(var_8_2) == "string" and var_8_2 == "always" then
			return true
		elseif type(var_8_2) == "table" then
			local var_8_3 = var_0_0.GetStandardTimeConfig(var_8_2)
			local var_8_4 = var_0_0.GetfilteTime()

			if var_0_0.IsTwoTimeCross(var_8_4, var_8_3) then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetfilteTime()
	return pg.painting_filte_config.time
end

function var_0_0.GetConstPoolIndexList()
	return pg.painting_filte_config.pool_id_list
end

function var_0_0.IsPoolWeightConfigMatch(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		if arg_11_0[iter_11_1] > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetBuildActIDList()
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in ipairs(pg.activity_template.all) do
		if var_0_0.IsBuildActMatch(iter_12_1) then
			table.insert(var_12_0, iter_12_1)
		end
	end

	return var_12_0
end

function var_0_0.GetActPoolIndexList()
	local var_13_0 = {}
	local var_13_1 = var_0_0.GetBuildActIDList()

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		local var_13_2 = pg.activity_template[iter_13_1].config_id

		if not table.contains(var_13_0, var_13_2) then
			table.insert(var_13_0, var_13_2)
		end
	end

	return var_13_0
end

function var_0_0.GetShipConfigIDListByPoolList(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(pg.ship_data_create) do
		local var_14_1 = iter_14_1.weight_group

		if var_0_0.IsPoolWeightConfigMatch(var_14_1, arg_14_0) and not table.contains(var_14_0, iter_14_0) then
			table.insert(var_14_0, iter_14_0)
		end
	end

	return var_14_0
end

function var_0_0.GetLightPoolBlueDestroyerShipConfigIDList(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0 = arg_15_0 or 2
	arg_15_1 = arg_15_1 or 3
	arg_15_2 = arg_15_2 or 1

	local var_15_0 = {}

	if type(arg_15_0) ~= "number" or type(arg_15_1) ~= "number" or type(arg_15_2) ~= "number" or type(pg.ship_data_create) ~= "table" or type(pg.ship_data_statistics) ~= "table" then
		return var_15_0
	end

	for iter_15_0, iter_15_1 in pairs(pg.ship_data_create) do
		if type(iter_15_0) == "number" and type(iter_15_1) == "table" then
			local var_15_1 = iter_15_1[arg_15_0]
			local var_15_2 = pg.ship_data_statistics[iter_15_0]

			if type(var_15_1) == "number" and var_15_1 > 0 and type(var_15_2) == "table" and var_15_2.rarity == arg_15_1 and var_15_2.type == arg_15_2 then
				table.insert(var_15_0, iter_15_0)
			end
		end
	end

	return var_15_0
end

function var_0_0.GetActID2MemoryMap()
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(pg.memory_group.all) do
		local var_16_1 = pg.memory_group[iter_16_1]
		local var_16_2 = var_16_1.link_event
		local var_16_3 = var_16_1.memories

		if var_16_2 and var_16_2 > 0 then
			if not var_16_0[var_16_2] then
				var_16_0[var_16_2] = {}
			end

			for iter_16_2, iter_16_3 in ipairs(var_16_3) do
				if not table.contains(var_16_0[var_16_2], iter_16_3) then
					table.insert(var_16_0[var_16_2], iter_16_3)
				end
			end
		end
	end

	return var_16_0
end

function var_0_0.GetActPoolShipConfigIDList()
	local var_17_0 = var_0_0.GetActPoolIndexList()

	return var_0_0.GetShipConfigIDListByPoolList(var_17_0)
end

function var_0_0.GetConstPoolShipConfigIDList()
	local var_18_0 = var_0_0.GetConstPoolIndexList()

	return var_0_0.GetShipConfigIDListByPoolList(var_18_0)
end

function var_0_0.GetCreateExchangeShipConfigIDList()
	local var_19_0 = {}
	local var_19_1 = {
		10,
		11
	}

	for iter_19_0, iter_19_1 in ipairs(var_19_1) do
		local var_19_2 = var_0_0.GetBuildActIDList()

		for iter_19_2, iter_19_3 in ipairs(var_19_2) do
			if pg.ship_data_create_exchange[iter_19_3] then
				for iter_19_4, iter_19_5 in ipairs(pg.ship_data_create_exchange[iter_19_3].exchange_ship_id) do
					if not table.contains(var_19_0, iter_19_5) then
						table.insert(var_19_0, iter_19_5)
					end
				end
			end
		end
	end

	return var_19_0
end

function var_0_0.GetNPCShipConfigIDList()
	local var_20_0 = {}

	for iter_20_0, iter_20_1 in ipairs(getGameset("act_npc_ship_id")[2]) do
		if var_0_0.IsActMatchTime(iter_20_1) then
			local var_20_1 = pg.activity_template[iter_20_1].config_data[1]
			local var_20_2 = pg.task_data_template[var_20_1].award_display[1][2]

			table.insert(var_20_0, var_20_2)
		end
	end

	return var_20_0
end

function var_0_0.GetSkinIDFromNormalShopID(arg_21_0)
	local var_21_0 = pg.shop_template[arg_21_0].effect_args

	assert(#var_21_0 == 1, "shop_template的effect_args字段,元素个数大于1,ID:", arg_21_0)

	return var_21_0[1]
end

function var_0_0.GetNormalShopSkinIDList()
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		if var_0_0.IsNormalShopMatch(iter_22_1) then
			local var_22_1 = var_0_0.GetSkinIDFromNormalShopID(iter_22_1)

			if not table.contains(var_22_0, var_22_1) then
				table.insert(var_22_0, var_22_1)
			end

			if ShipSkin.IsChangeSkin(var_22_1) then
				local var_22_2 = ShipSkin.GetAllChangeSkinIds(var_22_1)

				for iter_22_2, iter_22_3 in ipairs(var_22_2) do
					if not table.contains(var_22_0, iter_22_3) then
						table.insert(var_22_0, iter_22_3)
					end
				end
			end
		end
	end

	warning("普通商店皮肤个数" .. #var_22_0)

	return var_22_0
end

function var_0_0.GetSkinIDFromActShopID(arg_23_0)
	return pg.activity_shop_extra[arg_23_0].commodity_id
end

function var_0_0.GetActShopSkinIDList()
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in ipairs(pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]) do
		if var_0_0.IsActShopMatch(iter_24_1) then
			local var_24_1 = var_0_0.GetSkinIDFromActShopID(iter_24_1)

			if not table.contains(var_24_0, var_24_1) then
				table.insert(var_24_0, var_24_1)
			end

			if ShipSkin.IsChangeSkin(var_24_1) then
				local var_24_2 = ShipSkin.GetAllChangeSkinIds(var_24_1)

				for iter_24_2, iter_24_3 in ipairs(var_24_2) do
					if not table.contains(var_24_0, iter_24_3) then
						table.insert(var_24_0, iter_24_3)
					end
				end
			end
		end
	end

	warning("活动商店皮肤个数" .. #var_24_0)

	return var_24_0
end

local function var_0_1(arg_25_0, arg_25_1)
	arg_25_1 = string.lower(arg_25_1)

	local var_25_0 = pg.painting_filte_map[arg_25_1].res_list

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		if not table.contains(arg_25_0, iter_25_1) then
			table.insert(arg_25_0, iter_25_1)
		end
	end
end

local function var_0_2(arg_26_0, arg_26_1)
	local var_26_0 = ShipGroup.getDefaultSkin(arg_26_1).painting

	var_0_1(arg_26_0, var_26_0)
end

local function var_0_3(arg_27_0, arg_27_1)
	local var_27_0 = {
		configId = arg_27_1
	}
	local var_27_1 = Ship.getGroupId(var_27_0)

	var_0_2(arg_27_0, var_27_1)
end

local function var_0_4(arg_28_0, arg_28_1)
	local var_28_0 = pg.ship_skin_template[arg_28_1].painting

	var_0_1(arg_28_0, var_28_0)
end

function SpecialFilteForChange()
	local var_29_0 = {}

	local function var_29_1(arg_30_0)
		for iter_30_0, iter_30_1 in ipairs(arg_30_0) do
			var_0_3(var_29_0, iter_30_1)
		end
	end

	local function var_29_2(arg_31_0)
		for iter_31_0, iter_31_1 in ipairs(arg_31_0) do
			var_0_4(var_29_0, iter_31_1)
		end
	end

	if pg.painting_filte_config.current_act_pool == 1 then
		local var_29_3 = PaintingfilteConst.GetActPoolShipConfigIDList()

		var_29_1(var_29_3)
	end

	local var_29_4 = PaintingfilteConst.GetConstPoolShipConfigIDList()

	var_29_1(var_29_4)

	local var_29_5 = PaintingfilteConst.GetLightPoolBlueDestroyerShipConfigIDList()

	var_29_1(var_29_5)

	local var_29_6 = PaintingfilteConst.GetNPCShipConfigIDList()

	var_29_1(var_29_6)

	local var_29_7 = PaintingfilteConst.GetCreateExchangeShipConfigIDList()

	var_29_1(var_29_7)

	if pg.painting_filte_config.current_sale_skin == 1 then
		local var_29_8 = PaintingfilteConst.GetNormalShopSkinIDList()

		warning("normalShopSkinIDList:" .. #var_29_8)
		var_29_2(var_29_8)

		local var_29_9 = PaintingfilteConst.GetActShopSkinIDList()

		warning("actShopSkinIDList:" .. #var_29_9)
		var_29_2(var_29_9)
	end

	for iter_29_0, iter_29_1 in ipairs(pg.secretary_special_ship.all) do
		local var_29_10 = pg.secretary_special_ship[iter_29_1].prefab

		var_0_1(var_29_0, var_29_10)
	end

	return table.concat(var_29_0, ";")
end

function SpecialFilteForConst()
	local var_32_0 = {}

	local function var_32_1(arg_33_0)
		for iter_33_0, iter_33_1 in ipairs(arg_33_0) do
			var_0_2(var_32_0, iter_33_1)
		end
	end

	local function var_32_2(arg_34_0)
		for iter_34_0, iter_34_1 in ipairs(arg_34_0) do
			var_0_4(var_32_0, iter_34_1)
		end
	end

	local var_32_3 = pg.painting_filte_config.skin_id_list

	var_32_2(var_32_3)

	return table.concat(var_32_0, ";")
end

function SpecialFilterForWorldStory(arg_35_0)
	local var_35_0 = arg_35_0:ToTable()

	return pg.NewStoryMgr.GetInstance():GetStoryPaintingsByNameList(var_35_0)
end

function SpecialFilteForActStory()
	local var_36_0 = PaintingfilteConst.GetActID2MemoryMap()
	local var_36_1 = PaintingfilteConst.GetfilteTime()
	local var_36_2 = {}

	for iter_36_0, iter_36_1 in ipairs(pg.activity_template.all) do
		if var_36_0[iter_36_1] and PaintingfilteConst.IsActMatchTime(iter_36_1) then
			for iter_36_2, iter_36_3 in ipairs(var_36_0[iter_36_1]) do
				table.insert(var_36_2, iter_36_3)
			end
		end
	end

	local var_36_3 = {}

	for iter_36_4, iter_36_5 in ipairs(var_36_2) do
		local var_36_4 = pg.memory_template[iter_36_5]

		for iter_36_6, iter_36_7 in ipairs(var_36_4.unlock_pre) do
			table.insert(var_36_3, iter_36_7)
		end
	end

	return pg.NewStoryMgr.GetInstance():GetStoryPaintingsByNameList(var_36_3)
end

function SpecialFilteForShopSkinPrefab()
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in ipairs(pg.activity_template.all) do
		local var_37_1 = pg.activity_template[iter_37_1]

		if PaintingfilteConst.IsActMatchTime(iter_37_1) and var_37_1.config_client and type(var_37_1.config_client) == "table" and var_37_1.config_client.painting then
			if type(var_37_1.config_client.painting) == "string" then
				table.insert(var_37_0, var_37_1.config_client.painting)
			end

			if type(var_37_1.config_client.painting) == "table" then
				for iter_37_2, iter_37_3 in ipairs(var_37_1.config_client.painting) do
					table.insert(var_37_0, iter_37_3)
				end
			end
		end
	end

	return table.concat(var_37_0, ";")
end

PLATFORM_CH = 1
PLATFORM_JP = 2
PLATFORM_KR = 3
PLATFORM_US = 4
PLATFORM_CHT = 5

function SetPlatform(arg_38_0)
	if arg_38_0 == "zh" then
		PLATFORM_CODE = PLATFORM_CH
	elseif arg_38_0 == "jp" then
		PLATFORM_CODE = PLATFORM_JP
	elseif arg_38_0 == "us" then
		PLATFORM_CODE = PLATFORM_US
	elseif arg_38_0 == "tw" then
		PLATFORM_CODE = PLATFORM_CHT
	elseif arg_38_0 == "kr" then
		PLATFORM_CODE = PLATFORM_KR
	else
		return false
	end

	return true
end

UnGamePlayState = true

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

function var_0_0.GetActID2MemoryMap()
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(pg.memory_group.all) do
		local var_15_1 = pg.memory_group[iter_15_1]
		local var_15_2 = var_15_1.link_event
		local var_15_3 = var_15_1.memories

		if var_15_2 and var_15_2 > 0 then
			if not var_15_0[var_15_2] then
				var_15_0[var_15_2] = {}
			end

			for iter_15_2, iter_15_3 in ipairs(var_15_3) do
				if not table.contains(var_15_0[var_15_2], iter_15_3) then
					table.insert(var_15_0[var_15_2], iter_15_3)
				end
			end
		end
	end

	return var_15_0
end

function var_0_0.GetActPoolShipConfigIDList()
	local var_16_0 = var_0_0.GetActPoolIndexList()

	return var_0_0.GetShipConfigIDListByPoolList(var_16_0)
end

function var_0_0.GetConstPoolShipConfigIDList()
	local var_17_0 = var_0_0.GetConstPoolIndexList()

	return var_0_0.GetShipConfigIDListByPoolList(var_17_0)
end

function var_0_0.GetCreateExchangeShipConfigIDList()
	local var_18_0 = {}
	local var_18_1 = {
		10,
		11
	}

	for iter_18_0, iter_18_1 in ipairs(var_18_1) do
		local var_18_2 = var_0_0.GetBuildActIDList()

		for iter_18_2, iter_18_3 in ipairs(var_18_2) do
			if pg.ship_data_create_exchange[iter_18_3] then
				for iter_18_4, iter_18_5 in ipairs(pg.ship_data_create_exchange[iter_18_3].exchange_ship_id) do
					if not table.contains(var_18_0, iter_18_5) then
						table.insert(var_18_0, iter_18_5)
					end
				end
			end
		end
	end

	return var_18_0
end

function var_0_0.GetNPCShipConfigIDList()
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in ipairs(getGameset("act_npc_ship_id")[2]) do
		if var_0_0.IsActMatchTime(iter_19_1) then
			local var_19_1 = pg.activity_template[iter_19_1].config_data[1]
			local var_19_2 = pg.task_data_template[var_19_1].award_display[1][2]

			table.insert(var_19_0, var_19_2)
		end
	end

	return var_19_0
end

function var_0_0.GetSkinIDFromNormalShopID(arg_20_0)
	local var_20_0 = pg.shop_template[arg_20_0].effect_args

	assert(#var_20_0 == 1, "shop_template的effect_args字段,元素个数大于1,ID:", arg_20_0)

	return var_20_0[1]
end

function var_0_0.GetNormalShopSkinIDList()
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		if var_0_0.IsNormalShopMatch(iter_21_1) then
			local var_21_1 = var_0_0.GetSkinIDFromNormalShopID(iter_21_1)

			if not table.contains(var_21_0, var_21_1) then
				table.insert(var_21_0, var_21_1)
			end

			if ShipSkin.IsChangeSkin(var_21_1) then
				local var_21_2 = ShipSkin.GetAllChangeSkinIds(var_21_1)

				for iter_21_2, iter_21_3 in ipairs(var_21_2) do
					if not table.contains(var_21_0, iter_21_3) then
						table.insert(var_21_0, iter_21_3)
					end
				end
			end
		end
	end

	warning("普通商店皮肤个数" .. #var_21_0)

	return var_21_0
end

function var_0_0.GetSkinIDFromActShopID(arg_22_0)
	return pg.activity_shop_extra[arg_22_0].commodity_id
end

function var_0_0.GetActShopSkinIDList()
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]) do
		if var_0_0.IsActShopMatch(iter_23_1) then
			local var_23_1 = var_0_0.GetSkinIDFromActShopID(iter_23_1)

			if not table.contains(var_23_0, var_23_1) then
				table.insert(var_23_0, var_23_1)
			end

			if ShipSkin.IsChangeSkin(var_23_1) then
				local var_23_2 = ShipSkin.GetAllChangeSkinIds(var_23_1)

				for iter_23_2, iter_23_3 in ipairs(var_23_2) do
					if not table.contains(var_23_0, iter_23_3) then
						table.insert(var_23_0, iter_23_3)
					end
				end
			end
		end
	end

	warning("活动商店皮肤个数" .. #var_23_0)

	return var_23_0
end

local function var_0_1(arg_24_0, arg_24_1)
	arg_24_1 = string.lower(arg_24_1)

	local var_24_0 = pg.painting_filte_map[arg_24_1].res_list

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		if not table.contains(arg_24_0, iter_24_1) then
			table.insert(arg_24_0, iter_24_1)
		end
	end
end

local function var_0_2(arg_25_0, arg_25_1)
	local var_25_0 = ShipGroup.getDefaultSkin(arg_25_1).painting

	var_0_1(arg_25_0, var_25_0)
end

local function var_0_3(arg_26_0, arg_26_1)
	local var_26_0 = {
		configId = arg_26_1
	}
	local var_26_1 = Ship.getGroupId(var_26_0)

	var_0_2(arg_26_0, var_26_1)
end

local function var_0_4(arg_27_0, arg_27_1)
	local var_27_0 = pg.ship_skin_template[arg_27_1].painting

	var_0_1(arg_27_0, var_27_0)
end

function SpecialFilteForChange()
	local var_28_0 = {}

	local function var_28_1(arg_29_0)
		for iter_29_0, iter_29_1 in ipairs(arg_29_0) do
			var_0_3(var_28_0, iter_29_1)
		end
	end

	local function var_28_2(arg_30_0)
		for iter_30_0, iter_30_1 in ipairs(arg_30_0) do
			var_0_4(var_28_0, iter_30_1)
		end
	end

	if pg.painting_filte_config.current_act_pool == 1 then
		local var_28_3 = PaintingfilteConst.GetActPoolShipConfigIDList()

		var_28_1(var_28_3)
	end

	local var_28_4 = PaintingfilteConst.GetConstPoolShipConfigIDList()

	var_28_1(var_28_4)

	local var_28_5 = PaintingfilteConst.GetNPCShipConfigIDList()

	var_28_1(var_28_5)

	local var_28_6 = PaintingfilteConst.GetCreateExchangeShipConfigIDList()

	var_28_1(var_28_6)

	if pg.painting_filte_config.current_sale_skin == 1 then
		local var_28_7 = PaintingfilteConst.GetNormalShopSkinIDList()

		warning("normalShopSkinIDList:" .. #var_28_7)
		var_28_2(var_28_7)

		local var_28_8 = PaintingfilteConst.GetActShopSkinIDList()

		warning("actShopSkinIDList:" .. #var_28_8)
		var_28_2(var_28_8)
	end

	for iter_28_0, iter_28_1 in ipairs(pg.secretary_special_ship.all) do
		local var_28_9 = pg.secretary_special_ship[iter_28_1].prefab

		var_0_1(var_28_0, var_28_9)
	end

	return table.concat(var_28_0, ";")
end

function SpecialFilteForConst()
	local var_31_0 = {}

	local function var_31_1(arg_32_0)
		for iter_32_0, iter_32_1 in ipairs(arg_32_0) do
			var_0_2(var_31_0, iter_32_1)
		end
	end

	local function var_31_2(arg_33_0)
		for iter_33_0, iter_33_1 in ipairs(arg_33_0) do
			var_0_4(var_31_0, iter_33_1)
		end
	end

	local var_31_3 = pg.painting_filte_config.skin_id_list

	var_31_2(var_31_3)

	return table.concat(var_31_0, ";")
end

function SpecialFilterForWorldStory(arg_34_0)
	local var_34_0 = arg_34_0:ToTable()

	return pg.NewStoryMgr.GetInstance():GetStoryPaintingsByNameList(var_34_0)
end

function SpecialFilteForActStory()
	local var_35_0 = PaintingfilteConst.GetActID2MemoryMap()
	local var_35_1 = PaintingfilteConst.GetfilteTime()
	local var_35_2 = {}

	for iter_35_0, iter_35_1 in ipairs(pg.activity_template.all) do
		if var_35_0[iter_35_1] and PaintingfilteConst.IsActMatchTime(iter_35_1) then
			for iter_35_2, iter_35_3 in ipairs(var_35_0[iter_35_1]) do
				table.insert(var_35_2, iter_35_3)
			end
		end
	end

	local var_35_3 = {}

	for iter_35_4, iter_35_5 in ipairs(var_35_2) do
		local var_35_4 = pg.memory_template[iter_35_5]

		for iter_35_6, iter_35_7 in ipairs(var_35_4.unlock_pre) do
			table.insert(var_35_3, iter_35_7)
		end
	end

	return pg.NewStoryMgr.GetInstance():GetStoryPaintingsByNameList(var_35_3)
end

function SpecialFilteForShopSkinPrefab()
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in ipairs(pg.activity_template.all) do
		local var_36_1 = pg.activity_template[iter_36_1]

		if PaintingfilteConst.IsActMatchTime(iter_36_1) and var_36_1.config_client and type(var_36_1.config_client) == "table" and var_36_1.config_client.painting then
			if type(var_36_1.config_client.painting) == "string" then
				table.insert(var_36_0, var_36_1.config_client.painting)
			end

			if type(var_36_1.config_client.painting) == "table" then
				for iter_36_2, iter_36_3 in ipairs(var_36_1.config_client.painting) do
					table.insert(var_36_0, iter_36_3)
				end
			end
		end
	end

	return table.concat(var_36_0, ";")
end

PLATFORM_CH = 1
PLATFORM_JP = 2
PLATFORM_KR = 3
PLATFORM_US = 4
PLATFORM_CHT = 5

function SetPlatform(arg_37_0)
	if arg_37_0 == "zh" then
		PLATFORM_CODE = PLATFORM_CH
	elseif arg_37_0 == "jp" then
		PLATFORM_CODE = PLATFORM_JP
	elseif arg_37_0 == "us" then
		PLATFORM_CODE = PLATFORM_US
	elseif arg_37_0 == "tw" then
		PLATFORM_CODE = PLATFORM_CHT
	elseif arg_37_0 == "kr" then
		PLATFORM_CODE = PLATFORM_KR
	else
		return false
	end

	return true
end

UnGamePlayState = true

local var_0_0 = class("Dorm", import("..BaseVO"))

var_0_0.MAX_FLOOR = 2
var_0_0.MAX_LEVEL = 4
var_0_0.DORM_2_FLOOR_COMFORTABLE_ADDITION = 20
var_0_0.COMFORTABLE_LEVEL_1 = 1
var_0_0.COMFORTABLE_LEVEL_2 = 2
var_0_0.COMFORTABLE_LEVEL_3 = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.configId = arg_1_1.id or arg_1_1.lv
	arg_1_0.id = arg_1_0.configId
	arg_1_0.level = arg_1_0.id
	arg_1_0.food = arg_1_1.food or 0
	arg_1_0.food_extend_count = arg_1_1.food_max_increase_count
	arg_1_0.dorm_food_max = arg_1_1.food_max_increase
	arg_1_0.next_timestamp = arg_1_1.next_timestamp or 0
	arg_1_0.exp_pos = arg_1_1.exp_pos or 2
	arg_1_0.rest_pos = arg_1_0.exp_pos
	arg_1_0.load_exp = 0
	arg_1_0.load_food = 0
	arg_1_0.load_time = arg_1_1.load_time or 0
	arg_1_0.name = arg_1_1.name
	arg_1_0.shipIds = arg_1_1.shipIds or {}
	arg_1_0.floorNum = arg_1_1.floor_num or 1
	arg_1_0.furnitures = {}
	arg_1_0.themes = {}
	arg_1_0.expandIds = {
		50011,
		50012,
		50013
	}
	arg_1_0.shopCfg = pg.shop_template
end

function var_0_0.GetExpandId(arg_2_0)
	local var_2_0 = arg_2_0.level - 1

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.expandIds) do
		if arg_2_0.shopCfg[iter_2_1].limit_args[1][2] == var_2_0 then
			return iter_2_1
		end
	end
end

function var_0_0.IsMaxLevel(arg_3_0)
	return arg_3_0.level >= var_0_0.MAX_LEVEL
end

function var_0_0.GetMapSize(arg_4_0)
	return var_0_0.StaticGetMapSize(arg_4_0.level)
end

function var_0_0.StaticGetMapSize(arg_5_0)
	local var_5_0 = 12 - (arg_5_0 - 1) * 4
	local var_5_1 = var_5_0
	local var_5_2 = var_5_0
	local var_5_3 = BackYardConst.MAX_MAP_SIZE
	local var_5_4 = var_5_3.x
	local var_5_5 = var_5_3.y

	return Vector4(var_5_1, var_5_2, var_5_4, var_5_5)
end

function var_0_0.isUnlockFloor(arg_6_0, arg_6_1)
	return arg_6_1 <= arg_6_0.floorNum
end

function var_0_0.setFloorNum(arg_7_0, arg_7_1)
	assert(arg_7_1 <= var_0_0.MAX_FLOOR, "floornum more than max" .. arg_7_1)

	arg_7_0.floorNum = arg_7_1
end

function var_0_0.setName(arg_8_0, arg_8_1)
	arg_8_0.name = arg_8_1
end

function var_0_0.GetName(arg_9_0)
	return arg_9_0.name
end

function var_0_0.getExtendTrainPosShopId(arg_10_0)
	local var_10_0 = pg.shop_template

	for iter_10_0, iter_10_1 in pairs({
		3,
		4,
		18,
		26
	}) do
		if var_10_0[iter_10_1].effect_args == ShopArgs.EffectDromExpPos and arg_10_0.exp_pos >= var_10_0[iter_10_1].limit_args[1][2] and arg_10_0.exp_pos <= var_10_0[iter_10_1].limit_args[1][3] then
			return iter_10_1
		end
	end
end

function var_0_0.bindConfigTable(arg_11_0)
	return pg.dorm_data_template
end

function var_0_0.getComfortable(arg_12_0, arg_12_1)
	local var_12_0 = 0
	local var_12_1 = {}

	local function var_12_2(arg_13_0)
		local var_13_0 = arg_13_0:getTypeForComfortable()

		if not var_12_1[var_13_0] then
			var_12_1[var_13_0] = {}
		end

		table.insert(var_12_1[var_13_0], arg_13_0:getConfig("comfortable"))
	end

	for iter_12_0, iter_12_1 in pairs(arg_12_0.furnitures) do
		local var_12_3 = iter_12_1.count or 1

		for iter_12_2 = 1, var_12_3 do
			var_12_2(iter_12_1)
		end
	end

	for iter_12_3, iter_12_4 in pairs(arg_12_1 or {}) do
		var_12_2(iter_12_4)
	end

	local var_12_4 = arg_12_0:getConfig("comfortable_count")

	for iter_12_5, iter_12_6 in pairs(var_12_4) do
		local var_12_5 = var_12_1[iter_12_6[1]] or {}

		table.sort(var_12_5, function(arg_14_0, arg_14_1)
			return arg_14_1 < arg_14_0
		end)

		for iter_12_7 = 1, iter_12_6[2] do
			var_12_0 = var_12_0 + (var_12_5[iter_12_7] or 0)
		end
	end

	local var_12_6 = var_12_0 + arg_12_0:getConfig("comfortable")

	if arg_12_0:isUnlockFloor(2) then
		var_12_6 = var_12_6 + var_0_0.DORM_2_FLOOR_COMFORTABLE_ADDITION
	end

	return var_12_6
end

function var_0_0.GetComfortableLevel(arg_15_0, arg_15_1)
	if arg_15_1 < 30 then
		return var_0_0.COMFORTABLE_LEVEL_1
	elseif arg_15_1 >= 30 and arg_15_1 < 68 then
		return var_0_0.COMFORTABLE_LEVEL_2
	else
		return var_0_0.COMFORTABLE_LEVEL_3
	end
end

function var_0_0._GetComfortableLevel(arg_16_0)
	local var_16_0 = arg_16_0:getComfortable()

	return arg_16_0:GetComfortableLevel(var_16_0)
end

function var_0_0.GetComfortableColor(arg_17_0, arg_17_1)
	return ({
		Color.New(0.9490196, 0.772549, 0.772549, 1),
		Color.New(0.9882353, 0.9333333, 0.7647059, 1),
		Color.New(0.8588235, 0.9490196, 0.772549, 1)
	})[arg_17_1]
end

function var_0_0.increaseTrainPos(arg_18_0)
	arg_18_0.exp_pos = arg_18_0.exp_pos + 1
end

function var_0_0.increaseRestPos(arg_19_0)
	arg_19_0.rest_pos = arg_19_0.rest_pos + 1
end

function var_0_0.increaseFoodExtendCount(arg_20_0)
	arg_20_0.food_extend_count = arg_20_0.food_extend_count + 1
end

function var_0_0.extendFoodCapacity(arg_21_0, arg_21_1)
	arg_21_0.dorm_food_max = arg_21_0.dorm_food_max + arg_21_1
end

function var_0_0.levelUp(arg_22_0)
	arg_22_0.configId = arg_22_0.configId + 1
	arg_22_0.id = arg_22_0.configId
	arg_22_0.level = arg_22_0.configId
	arg_22_0.comfortable = arg_22_0:getConfig("comfortable")
end

function var_0_0.consumeFood(arg_23_0, arg_23_1)
	arg_23_0.food = math.max(arg_23_0.food - arg_23_1, 0)
end

function var_0_0.restNextTime(arg_24_0)
	local var_24_0 = arg_24_0:bindConfigTable()[arg_24_0.id]

	arg_24_0.next_timestamp = pg.TimeMgr.GetInstance():GetServerTime() + var_24_0.time
end

function var_0_0.isMaxFood(arg_25_0)
	local var_25_0 = arg_25_0:bindConfigTable()[arg_25_0.id]

	return arg_25_0.food >= arg_25_0.dorm_food_max + var_25_0.capacity
end

function var_0_0.getFoodLeftTime(arg_26_0)
	local var_26_0 = arg_26_0:bindConfigTable()[arg_26_0.id]
	local var_26_1 = getProxy(DormProxy):getTrainShipCount()

	if var_26_1 == 0 then
		return 0
	end

	local var_26_2 = pg.gameset["dorm_food_ratio_by_" .. var_26_1].key_value / 100 * var_26_0.consume
	local var_26_3 = arg_26_0.food - arg_26_0.food % var_26_2

	return arg_26_0.next_timestamp + (var_26_3 / var_26_2 - 1) * var_26_0.time
end

function var_0_0.GetCapcity(arg_27_0)
	local var_27_0 = arg_27_0.dorm_food_max

	return arg_27_0:getConfig("capacity") + var_27_0
end

function var_0_0.setShipIds(arg_28_0, arg_28_1)
	arg_28_0.shipIds = arg_28_1
end

function var_0_0.addShip(arg_29_0, arg_29_1)
	table.insert(arg_29_0.shipIds, arg_29_1)
end

function var_0_0.deleteShip(arg_30_0, arg_30_1)
	for iter_30_0, iter_30_1 in ipairs(arg_30_0.shipIds) do
		if iter_30_1 == arg_30_1 then
			table.remove(arg_30_0.shipIds, iter_30_0)

			break
		end
	end
end

function var_0_0.GetStateShipCnt(arg_31_0, arg_31_1)
	local var_31_0 = 0

	for iter_31_0, iter_31_1 in ipairs(arg_31_0.shipIds) do
		if getProxy(BayProxy):RawGetShipById(iter_31_1).state == arg_31_1 then
			var_31_0 = var_31_0 + 1
		end
	end

	return var_31_0
end

function var_0_0.GetStateShips(arg_32_0, arg_32_1)
	local var_32_0 = {}

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.shipIds) do
		local var_32_1 = getProxy(BayProxy):RawGetShipById(iter_32_1)

		if var_32_1.state == arg_32_1 then
			table.insert(var_32_0, var_32_1)
		end
	end

	return var_32_0
end

function var_0_0.GetStateShipsById(arg_33_0, arg_33_1)
	local var_33_0 = {}

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.shipIds) do
		local var_33_1 = getProxy(BayProxy):RawGetShipById(iter_33_1)

		if var_33_1.state == arg_33_1 then
			var_33_0[var_33_1.id] = var_33_1
		end
	end

	return var_33_0
end

function var_0_0.GetNonStateShips(arg_34_0, arg_34_1)
	local var_34_0 = {}

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.shipIds) do
		local var_34_1 = getProxy(BayProxy):RawGetShipById(iter_34_1)

		if var_34_1.state ~= arg_34_1 then
			table.insert(var_34_0, var_34_1)
		end
	end

	return var_34_0
end

function var_0_0.GetShips(arg_35_0)
	local var_35_0 = {}
	local var_35_1 = getProxy(BayProxy)

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.shipIds) do
		local var_35_2 = var_35_1:RawGetShipById(iter_35_1)

		if var_35_2 then
			var_35_0[var_35_2.id] = var_35_2
		else
			print("not found ship >>>", iter_35_1)
		end
	end

	return var_35_0
end

function var_0_0.AnyShipExistIntimacyOrMoney(arg_36_0)
	local var_36_0 = arg_36_0:GetShips()

	for iter_36_0, iter_36_1 in pairs(var_36_0) do
		if iter_36_1.state_info_3 > 0 or iter_36_1.state_info_4 > 0 then
			return true
		end
	end

	return false
end

function var_0_0.GetThemeList(arg_37_0, arg_37_1)
	return arg_37_0.themes
end

function var_0_0.SetTheme(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0.themes[arg_38_1] = arg_38_2
end

function var_0_0.GetTheme(arg_39_0, arg_39_1)
	return arg_39_0.themes[arg_39_1]
end

function var_0_0.GetPurchasedFurnitures(arg_40_0)
	return arg_40_0.furnitures
end

function var_0_0.GetOwnFurnitureCount(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0.furnitures[arg_41_1]

	if not var_41_0 then
		return 0
	else
		return var_41_0.count
	end
end

function var_0_0.SetFurnitures(arg_42_0, arg_42_1)
	arg_42_0.furnitures = arg_42_1
end

function var_0_0.AddFurniture(arg_43_0, arg_43_1)
	if not arg_43_0.furnitures[arg_43_1.id] then
		arg_43_1:MarkNew()

		arg_43_0.furnitures[arg_43_1.id] = arg_43_1
	else
		local var_43_0 = arg_43_0.furnitures[arg_43_1.id]

		var_43_0:setCount(var_43_0.count + arg_43_1.count)
	end
end

function var_0_0.IsPurchasedFurniture(arg_44_0, arg_44_1)
	return arg_44_0.furnitures[arg_44_1] ~= nil and arg_44_0.furnitures[arg_44_1].count > 0
end

function var_0_0.HasFurniture(arg_45_0, arg_45_1)
	return arg_45_0.furnitures[arg_45_1] ~= nil
end

function var_0_0.GetFurniture(arg_46_0, arg_46_1)
	return arg_46_0.furnitures[arg_46_1]
end

function var_0_0.GetPutFurnitureList(arg_47_0, arg_47_1)
	local var_47_0 = {}
	local var_47_1 = arg_47_0:GetTheme(arg_47_1)
	local var_47_2 = var_47_1 and var_47_1:GetAllFurniture() or {}

	for iter_47_0, iter_47_1 in pairs(var_47_2) do
		table.insert(var_47_0, iter_47_1)
	end

	table.sort(var_47_0, BackyardThemeFurniture._LoadWeight)

	return var_47_0
end

function var_0_0.GetPutShipList(arg_48_0, arg_48_1)
	local var_48_0 = {}
	local var_48_1 = ({
		Ship.STATE_TRAIN,
		Ship.STATE_REST
	})[arg_48_1]

	for iter_48_0, iter_48_1 in pairs(arg_48_0:GetShips()) do
		if iter_48_1.state == var_48_1 then
			table.insert(var_48_0, iter_48_1)
		end
	end

	return var_48_0
end

return var_0_0

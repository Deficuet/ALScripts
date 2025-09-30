local var_0_0 = class("IslandAblityAgency", import(".IslandBaseAgency"))

var_0_0.UNLOCK_SYSTEM = "IslandAblityAgency:UNLOCK_SYSTEM"
var_0_0.TYPE_SYSTEM = 1
var_0_0.TYPE_PLACE = 2
var_0_0.TYPE_FORMULA = 3
var_0_0.TYPE_SHOP_NORMAL = 4
var_0_0.TYPE_INVENTORY_MAXCNT = 6
var_0_0.TYPE_SHOP_TEMPORARY = 7
var_0_0.TYPE_ORDER = 8
var_0_0.TYPE_SLOT = 9
var_0_0.TYPE_MAP = 11
var_0_0.TYPE_ANIMAL = 15
var_0_0.TYPE_RESTAURANT = 17
var_0_0.TYPE_ASSISTANT = 18
var_0_0.TYPE_COLLECT_TOOL = 19
var_0_0.TYPE_ORDER_DAILY_CNT = 20
var_0_0.TYPE_SIGN_GIFT_CNT = 21
var_0_0.TYPE_RECOVER_CAMP = 22
var_0_0.TYPE_RECOVER_ORE = 23
var_0_0.TYPE_SECOND_PRODUCT = 24
var_0_0.TYPE_PRODUCT_FELLING = 26
var_0_0.TYPE_PRODUCT_MINING = 27
var_0_0.TYPE_ORDER_EXP = 31
var_0_0.TYPE_POST_MANAGE = 37
var_0_0.TYPE_PRODUCT_FARM = 38
var_0_0.TYPE_PRODUCT_ORCHARD = 39
var_0_0.TYPE_PRODUCT_GARDEN = 40
var_0_0.ANIMATION_OP_ID = 40

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.abilitys = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.ability_list or {}) do
		table.insert(arg_1_0.abilitys, iter_1_1)
	end
end

function var_0_0.AddAblity(arg_2_0, arg_2_1)
	table.insert(arg_2_0.abilitys, arg_2_1)

	if var_0_0.GetAblityType(arg_2_1) == var_0_0.TYPE_SYSTEM then
		arg_2_0:DispatchEvent(var_0_0.UNLOCK_SYSTEM, arg_2_1)
	end

	if var_0_0.IsMapType(arg_2_1) then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandUnlockMap(var_0_0.GetEffect(arg_2_1)))
		getProxy(IslandProxy):GetIsland():GetTechnologyAgency():TryAutoUnlock()
	end
end

function var_0_0.IsUnlockOrderExp(arg_3_0)
	return _.any(arg_3_0.abilitys, function(arg_4_0)
		return var_0_0.IsOrderExpType(arg_4_0)
	end)
end

function var_0_0.IsUnlockPostManage(arg_5_0)
	return _.any(arg_5_0.abilitys, function(arg_6_0)
		return var_0_0.GetAblityType(arg_6_0) == var_0_0.TYPE_POST_MANAGE
	end)
end

function var_0_0.IsUnlockMap(arg_7_0, arg_7_1)
	return _.any(arg_7_0.abilitys, function(arg_8_0)
		return var_0_0.IsMapType(arg_8_0) and var_0_0.GetEffect(arg_8_0) == arg_7_1
	end)
end

function var_0_0.IsUnlockShipOrder(arg_9_0, arg_9_1)
	return _.any(arg_9_0.abilitys, function(arg_10_0)
		return var_0_0.IsOrderType(arg_10_0) and var_0_0.GetEffect(arg_10_0) == arg_9_1
	end)
end

function var_0_0.IsUnlockFormuate(arg_11_0, arg_11_1)
	return _.any(arg_11_0.abilitys, function(arg_12_0)
		return var_0_0.IsFormuateType(arg_12_0) and var_0_0.GetEffect(arg_12_0) == arg_11_1
	end)
end

function var_0_0.IsUnlcokSecondProduct(arg_13_0, arg_13_1)
	return _.any(arg_13_0.abilitys, function(arg_14_0)
		return var_0_0.IsSecondProductType(arg_14_0) and var_0_0.GetEffect(arg_14_0) == arg_13_1
	end)
end

function var_0_0.IsUnlockCollectTool(arg_15_0, arg_15_1)
	return _.any(arg_15_0.abilitys, function(arg_16_0)
		return var_0_0.IsCollectToolType(arg_16_0) and var_0_0.GetEffect(arg_16_0) == arg_15_1
	end)
end

function var_0_0.IsUnlockAreaPlant(arg_17_0)
	return _.any(arg_17_0.abilitys, function(arg_18_0)
		return var_0_0.GetAblityType(arg_18_0) == var_0_0.TYPE_SYSTEM and var_0_0.GetEffect(arg_18_0) == 17
	end)
end

function var_0_0.HasAbility(arg_19_0, arg_19_1)
	if arg_19_1 == 0 then
		return true
	end

	return _.any(arg_19_0.abilitys, function(arg_20_0)
		return arg_19_1 == arg_20_0
	end)
end

function var_0_0.GetOrderDailyCntAddition(arg_21_0)
	local var_21_0 = 0

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.abilitys) do
		if var_0_0.IsOrderDailyCntType(iter_21_1) then
			var_21_0 = var_21_0 + pg.island_ability_template[iter_21_1].effect
		end
	end

	return var_21_0
end

function var_0_0.GetProductAdditionSpeedByAblityType(arg_22_0, arg_22_1)
	local var_22_0 = 0

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.abilitys) do
		local var_22_1 = pg.island_ability_template[iter_22_1]

		if var_22_1.type == arg_22_1 then
			var_22_0 = var_22_0 + var_22_1.effect
		end
	end

	return var_22_0
end

function var_0_0.GetAdditionEffectByAblityType(arg_23_0, arg_23_1)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.abilitys) do
		local var_23_1 = pg.island_ability_template[iter_23_1]

		if var_23_1.type == arg_23_1 then
			var_23_0 = var_23_0 + var_23_1.effect
		end
	end

	return var_23_0
end

function var_0_0.GetSignInGiftAddition(arg_24_0)
	local var_24_0 = 0

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.abilitys) do
		if var_0_0.IsSignInGiftType(iter_24_1) then
			var_24_0 = var_24_0 + pg.island_ability_template[iter_24_1].effect
		end
	end

	return var_24_0
end

function var_0_0.GetInventoryMaxCntAddition(arg_25_0)
	local var_25_0 = 0

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.abilitys) do
		if var_0_0.IsInventoryMaxCntType(iter_25_1) then
			var_25_0 = var_25_0 + pg.island_ability_template[iter_25_1].effect
		end
	end

	return var_25_0
end

function var_0_0.IsInventoryMaxCntType(arg_26_0)
	return pg.island_ability_template[arg_26_0].type == var_0_0.TYPE_INVENTORY_MAXCNT
end

function var_0_0.IsSignInGiftType(arg_27_0)
	local var_27_0 = pg.island_ability_template[arg_27_0]

	assert(var_27_0, "island_ability_template" .. arg_27_0)

	return var_27_0.type == var_0_0.TYPE_SIGN_GIFT_CNT
end

function var_0_0.IsOrderDailyCntType(arg_28_0)
	return pg.island_ability_template[arg_28_0].type == var_0_0.TYPE_ORDER_DAILY_CNT
end

function var_0_0.IsMapType(arg_29_0)
	local var_29_0 = pg.island_ability_template[arg_29_0]

	assert(var_29_0, "island_ability_template >>>>" .. arg_29_0)

	return var_29_0.type == var_0_0.TYPE_MAP
end

function var_0_0.IsOrderType(arg_30_0)
	return pg.island_ability_template[arg_30_0].type == var_0_0.TYPE_ORDER
end

function var_0_0.IsShopTypeNormal(arg_31_0)
	return pg.island_ability_template[arg_31_0].type == var_0_0.TYPE_SHOP_NORMAL
end

function var_0_0.IsShopTypeTemporary(arg_32_0)
	return pg.island_ability_template[arg_32_0].type == var_0_0.TYPE_SHOP_TEMPORARY
end

function var_0_0.IsCommodityType(arg_33_0)
	return pg.island_ability_template[arg_33_0].type == var_0_0.TYPE_COMMODITY
end

function var_0_0.IsFormuateType(arg_34_0)
	return pg.island_ability_template[arg_34_0].type == var_0_0.TYPE_FORMULA
end

function var_0_0.IsSecondProductType(arg_35_0)
	return pg.island_ability_template[arg_35_0].type == var_0_0.TYPE_SECOND_PRODUCT
end

function var_0_0.IsCollectToolType(arg_36_0)
	return pg.island_ability_template[arg_36_0].type == var_0_0.TYPE_COLLECT_TOOL
end

function var_0_0.GetAblityType(arg_37_0)
	return pg.island_ability_template[arg_37_0].type
end

function var_0_0.GetEffect(arg_38_0)
	return pg.island_ability_template[arg_38_0].effect
end

function var_0_0.IsOrderExpType(arg_39_0)
	return pg.island_ability_template[arg_39_0].type == var_0_0.TYPE_ORDER_EXP
end

return var_0_0

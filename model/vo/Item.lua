local var_0_0 = class("Item", import(".BaseVO"))

var_0_0.REVERT_EQUIPMENT_ID = 15007
var_0_0.COMMANDER_QUICKLY_TOOL_ID = 20010
var_0_0.QUICK_TASK_PASS_TICKET_ID = 15013
var_0_0.DOA_SELECT_CHAR_ID = 70144
var_0_0.INVISIBLE_TYPE = {
	[0] = true,
	[9] = true
}
var_0_0.PUZZLA_TYPE = 0
var_0_0.EQUIPMENT_BOX_TYPE_5 = 5
var_0_0.DESIGN_TYPE = 9
var_0_0.LESSON_TYPE = 10
var_0_0.EQUIPMENT_SKIN_BOX = 11
var_0_0.BLUEPRINT_TYPE = 12
var_0_0.ASSIGNED_TYPE = 13
var_0_0.GOLD_BOX_TYPE = 14
var_0_0.OIL_BOX_TYPE = 15
var_0_0.EQUIPMENT_ASSIGNED_TYPE = 16
var_0_0.GIFT_BOX = 17
var_0_0.TEC_SPEEDUP_TYPE = 18
var_0_0.SPECIAL_OPERATION_TICKET = 19
var_0_0.GUILD_OPENABLE = 20
var_0_0.INVITATION_TYPE = 21
var_0_0.EXP_BOOK_TYPE = 22
var_0_0.LOVE_LETTER_TYPE = 23
var_0_0.SPWEAPON_MATERIAL_TYPE = 24
var_0_0.METALESSON_TYPE = 25
var_0_0.SKIN_ASSIGNED_TYPE = 26
var_0_0.MESH_SKIN_ASSIGNED_TYPE = 27
var_0_0.SHIP_GIFT = 50

function var_0_0.Ctor(arg_1_0, arg_1_1)
	assert(not arg_1_1.type or arg_1_1.type == DROP_TYPE_VITEM or arg_1_1.type == DROP_TYPE_ITEM)

	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.count = arg_1_1.count
	arg_1_0.name = arg_1_1.name
	arg_1_0.extra = arg_1_1.extra

	arg_1_0:InitConfig()
end

function var_0_0.CanOpen(arg_2_0)
	local var_2_0 = arg_2_0:getConfig("type")

	return var_2_0 == var_0_0.EQUIPMENT_BOX_TYPE_5 or var_2_0 == var_0_0.EQUIPMENT_SKIN_BOX or var_2_0 == var_0_0.GOLD_BOX_TYPE or var_2_0 == var_0_0.OIL_BOX_TYPE or var_2_0 == var_0_0.GIFT_BOX or var_2_0 == var_0_0.GUILD_OPENABLE
end

function var_0_0.IsShipExpType(arg_3_0)
	return arg_3_0:getConfig("type") == var_0_0.EXP_BOOK_TYPE
end

function var_0_0.getConfigData(arg_4_0)
	local var_4_0 = {
		pg.item_virtual_data_statistics,
		pg.item_data_statistics
	}
	local var_4_1

	if underscore.any(var_4_0, function(arg_5_0)
		return arg_5_0[arg_4_0] ~= nil
	end) then
		var_4_1 = setmetatable({}, {
			__index = function(arg_6_0, arg_6_1)
				for iter_6_0, iter_6_1 in ipairs(var_4_0) do
					if iter_6_1[arg_4_0] and iter_6_1[arg_4_0][arg_6_1] ~= nil then
						arg_6_0[arg_6_1] = iter_6_1[arg_4_0][arg_6_1]

						return arg_6_0[arg_6_1]
					end
				end
			end
		})
	end

	return var_4_1
end

function var_0_0.InitConfig(arg_7_0)
	arg_7_0.cfg = var_0_0.getConfigData(arg_7_0.configId)

	assert(arg_7_0.cfg, string.format("without item config from id_%d", arg_7_0.id))
end

function var_0_0.getConfigTable(arg_8_0)
	return arg_8_0.cfg
end

function var_0_0.CanInBag(arg_9_0)
	return tobool(pg.item_data_statistics[arg_9_0])
end

function var_0_0.couldSell(arg_10_0)
	return table.getCount(arg_10_0:getConfig("price")) > 0
end

function var_0_0.GetPrice(arg_11_0)
	if arg_11_0:couldSell() then
		return arg_11_0:getConfig("price")
	else
		return nil
	end
end

function var_0_0.isEnough(arg_12_0, arg_12_1)
	return arg_12_1 <= arg_12_0.count
end

function var_0_0.consume(arg_13_0, arg_13_1)
	arg_13_0.count = arg_13_0.count - arg_13_1
end

function var_0_0.isDesignDrawing(arg_14_0)
	return arg_14_0:getConfig("type") == 9
end

function var_0_0.isVirtualItem(arg_15_0)
	return arg_15_0:getConfig("type") == 0
end

function var_0_0.isEquipmentSkinBox(arg_16_0)
	return arg_16_0:getConfig("type") == var_0_0.EQUIPMENT_SKIN_BOX
end

function var_0_0.isBluePrintType(arg_17_0)
	return arg_17_0:getConfig("type") == var_0_0.BLUEPRINT_TYPE
end

function var_0_0.isTecSpeedUpType(arg_18_0)
	return arg_18_0:getConfig("type") == var_0_0.TEC_SPEEDUP_TYPE
end

function var_0_0.IsMaxCnt(arg_19_0)
	return arg_19_0:getConfig("max_num") <= arg_19_0.count
end

function var_0_0.IsDoaSelectCharItem(arg_20_0)
	return arg_20_0.id == var_0_0.DOA_SELECT_CHAR_ID
end

function var_0_0.IsExpired(arg_21_0)
	if arg_21_0:IsExchangeSkinType() then
		local var_21_0 = pg.item_data_limted[arg_21_0.id]

		if not var_21_0 then
			return false
		end

		return not getProxy(ActivityProxy):IsActivityNotEnd(var_21_0.acticity_id)
	else
		return false
	end
end

function var_0_0.getConfig(arg_22_0, arg_22_1)
	if arg_22_1 == "display" then
		local var_22_0 = var_0_0.super.getConfig(arg_22_0, "combination_display")

		if var_22_0 and #var_22_0 > 0 then
			return arg_22_0:CombinationDisplay(var_22_0)
		end
	end

	if var_0_0.super.getConfig(arg_22_0, "type") == var_0_0.MESH_SKIN_ASSIGNED_TYPE and arg_22_1 == "usage_arg" then
		local var_22_1 = getProxy(ShipSkinProxy):GetAllCanPurchaseMeshImageSkins()

		assert(pg.item_data_limted[arg_22_0.id], string.format("item_data_limted not found for id %d", arg_22_0.id))

		local var_22_2 = pg.item_data_limted[arg_22_0.id].acticity_id

		return {
			var_22_2,
			var_22_1,
			{},
			0,
			0
		}
	elseif arg_22_1 == "usage_arg" and arg_22_0:IsVItemSkinCoupon() then
		local var_22_3 = arg_22_0:getConfig("link_id")
		local var_22_4 = pg.activity_event_shop_discount[var_22_3]
		local var_22_5 = {}

		for iter_22_0, iter_22_1 in ipairs(var_22_4.shop_list) do
			if pg.shop_template[iter_22_1] then
				table.insert(var_22_5, pg.shop_template[iter_22_1].effect_args[1])
			end
		end

		return {
			var_22_3,
			var_22_5,
			{},
			0,
			0
		}
	end

	return var_0_0.super.getConfig(arg_22_0, arg_22_1)
end

function var_0_0.IsVItemSkinCoupon(arg_23_0)
	return arg_23_0:getConfig("type") == Item.PUZZLA_TYPE and arg_23_0:getConfig("virtual_type") == VIRTUAL_DROP_TYPE_SKIN_COUPON
end

function var_0_0.StaticCombinationDisplay(arg_24_0)
	local var_24_0 = _.map(arg_24_0, function(arg_25_0)
		local var_25_0 = string.format("%0.2f", arg_25_0[2] / 100)
		local var_25_1 = ShipSkin.New({
			id = arg_25_0[1]
		})
		local var_25_2 = {}

		for iter_25_0, iter_25_1 in ipairs(getGameset("random_skin_tag")[2]) do
			var_25_2[iter_25_1[1]] = iter_25_1[2]
		end

		local var_25_3 = underscore(var_25_1:getConfig("tag")):chain():filter(function(arg_26_0)
			return var_25_2[arg_26_0]
		end):map(function(arg_27_0)
			return var_25_2[arg_27_0]
		end):value()
		local var_25_4 = #var_25_3 > 0 and string.format("（<color=#92fc63>%s</color>）", table.concat(var_25_3, " ")) or ""
		local var_25_5 = i18n("random_skin_list_item_desc_label")
		local var_25_6 = ""

		if var_25_1:ExistReward() then
			var_25_6 = i18n("word_show_extra_reward_at_fudai_dialog", var_25_1:GetRewardListDesc())
		end

		return "\n（<color=#92fc63>" .. var_25_0 .. "%%</color>）" .. var_25_1.shipName .. var_25_5 .. var_25_1.skinName .. var_25_4 .. var_25_6
	end)
	local var_24_1 = table.concat(var_24_0, ";")

	return i18n("skin_gift_desc", var_24_1)
end

function var_0_0.CombinationDisplay(arg_28_0, arg_28_1)
	return var_0_0.StaticCombinationDisplay(arg_28_1)
end

function var_0_0.InTimeLimitSkinAssigned(arg_29_0)
	local var_29_0 = Item.New({
		id = arg_29_0
	})

	if not var_0_0.StaticIsExchangeSkinType(var_29_0:getConfig("type"), var_29_0:getConfig("virtual_type")) then
		return false
	end

	local var_29_1 = var_29_0:getConfig("usage_arg")[1]

	return getProxy(ActivityProxy):IsActivityNotEnd(var_29_1)
end

function var_0_0.GetValidSkinList(arg_30_0)
	assert(var_0_0.StaticIsExchangeSkinType(arg_30_0:getConfig("type"), arg_30_0:getConfig("virtual_type")))

	local var_30_0 = arg_30_0:getConfig("usage_arg")

	if Item.InTimeLimitSkinAssigned(arg_30_0.id) then
		return table.mergeArray(var_30_0[2], var_30_0[3], true)
	else
		return underscore.to_array(var_30_0[3])
	end
end

function var_0_0.IsOwningAllCurrentSkins(arg_31_0)
	assert(var_0_0.StaticIsExchangeSkinType(arg_31_0:getConfig("type"), arg_31_0:getConfig("virtual_type")))

	local var_31_0 = getProxy(ShipSkinProxy)

	return underscore.all(arg_31_0:GetValidSkinList(), function(arg_32_0)
		return var_31_0:hasNonLimitSkin(arg_32_0)
	end)
end

function var_0_0.IsAllSkinOwner(arg_33_0)
	local var_33_0 = arg_33_0:getConfig("type")

	assert(var_0_0.StaticIsExchangeSkinType(var_33_0, arg_33_0:getConfig("virtual_type")))

	if var_33_0 == Item.MESH_SKIN_ASSIGNED_TYPE then
		return false
	end

	return arg_33_0:IsOwningAllCurrentSkins()
end

function var_0_0.StaticIsExchangeSkinType(arg_34_0, arg_34_1)
	return arg_34_0 == Item.SKIN_ASSIGNED_TYPE or arg_34_0 == Item.MESH_SKIN_ASSIGNED_TYPE or arg_34_0 == Item.PUZZLA_TYPE and arg_34_1 == VIRTUAL_DROP_TYPE_SKIN_COUPON
end

function var_0_0.IsExchangeSkinType(arg_35_0)
	return var_0_0.StaticIsExchangeSkinType(arg_35_0:getConfig("type"), arg_35_0:getConfig("virtual_type"))
end

function var_0_0.GetOverflowCheckItems(arg_36_0, arg_36_1)
	arg_36_1 = arg_36_1 or 1

	local var_36_0 = {}

	if arg_36_0:getConfig("usage") == ItemUsage.DROP_TEMPLATE then
		local var_36_1, var_36_2, var_36_3 = unpack(arg_36_0:getConfig("usage_arg"))

		if var_36_2 > 0 then
			table.insert(var_36_0, {
				type = DROP_TYPE_RESOURCE,
				id = PlayerConst.ResGold,
				count = var_36_2 * arg_36_1
			})
		end

		if var_36_3 > 0 then
			table.insert(var_36_0, {
				type = DROP_TYPE_RESOURCE,
				id = PlayerConst.ResOil,
				count = var_36_3 * arg_36_1
			})
		end
	end

	switch(arg_36_0:getConfig("type"), {
		[Item.EQUIPMENT_BOX_TYPE_5] = function()
			table.insert(var_36_0, {
				type = DROP_TYPE_EQUIP,
				id = EQUIP_OCCUPATION_ID,
				count = arg_36_1
			})
		end,
		[Item.EQUIPMENT_ASSIGNED_TYPE] = function()
			table.insert(var_36_0, {
				type = DROP_TYPE_EQUIP,
				id = EQUIP_OCCUPATION_ID,
				count = arg_36_1
			})
		end
	})
	underscore.map(var_36_0, function(arg_39_0)
		return Drop.New(arg_39_0)
	end)

	return var_36_0
end

function var_0_0.IsSkinShopDiscountType(arg_40_0)
	return arg_40_0:getConfig("usage") == ItemUsage.SKIN_SHOP_DISCOUNT
end

function var_0_0.IsExclusiveDiscountType(arg_41_0)
	return arg_41_0:getConfig("usage") == ItemUsage.USAGE_SHOP_DISCOUNT
end

function var_0_0.IsSkinExperienceType(arg_42_0)
	return arg_42_0:getConfig("usage") == ItemUsage.USAGE_SKIN_EXP
end

function var_0_0.IsMeshImageSkinExchangeType(arg_43_0)
	return arg_43_0:getConfig("usage") == ItemUsage.MESH_IMAGE_SKIN_EXCHANGE
end

function var_0_0.GetDiscount(arg_44_0)
	if arg_44_0:IsExclusiveDiscountType() then
		return arg_44_0:getConfig("usage_arg")[2] or 0
	end
end

function var_0_0.CanUseForShop(arg_45_0, arg_45_1)
	if arg_45_0:IsSkinShopDiscountType() then
		local var_45_0 = arg_45_0:getConfig("usage_arg")

		if not var_45_0 or type(var_45_0) ~= "table" then
			return false
		end

		local var_45_1 = var_45_0[1] or {}

		return #var_45_1 == 1 and var_45_1[1] == 0 or table.contains(var_45_1, arg_45_1)
	elseif arg_45_0:IsSkinExperienceType() then
		local var_45_2 = arg_45_0:getConfig("usage_arg")

		if not var_45_2 or type(var_45_2) ~= "table" then
			return false
		end

		return (var_45_2[1] or -1) == arg_45_1
	elseif arg_45_0:IsExclusiveDiscountType() then
		local var_45_3 = arg_45_0:getConfig("usage_arg")[1]

		if not var_45_3 or type(var_45_3) ~= "table" then
			return false
		end

		return (var_45_3[1] or -1) == arg_45_1
	end

	return false
end

function var_0_0.GetConsumeForSkinShopDiscount(arg_46_0, arg_46_1)
	if arg_46_0:IsSkinShopDiscountType() or arg_46_0:IsExclusiveDiscountType() and arg_46_0:CanUseForShop(arg_46_1) then
		local var_46_0 = pg.item_data_statistics[arg_46_0.configId].usage_arg[2] or 0
		local var_46_1 = Goods.Create({
			shop_id = arg_46_1
		}, Goods.TYPE_SKIN)

		return math.max(0, var_46_1:GetPrice() - var_46_0), var_46_1:getConfig("resource_type")
	else
		return 0
	end
end

function var_0_0.getName(arg_47_0)
	return arg_47_0.name or arg_47_0:getConfig("name")
end

function var_0_0.getIcon(arg_48_0)
	return arg_48_0:getConfig("Icon")
end

local var_0_1

function var_0_0.IsLoveLetterCheckItem(arg_49_0)
	if not var_0_1 then
		var_0_1 = {}

		for iter_49_0, iter_49_1 in ipairs(getGameset("loveletter_item_old_year")[2]) do
			local var_49_0, var_49_1 = unpack(iter_49_1)

			var_0_1[var_49_0] = underscore.flatten({
				var_49_1
			})
		end

		for iter_49_2, iter_49_3 in ipairs(pg.loveletter_2018_2021.all) do
			var_0_1[iter_49_3] = {
				pg.loveletter_2018_2021[iter_49_3].year
			}
		end
	end

	return var_0_1[arg_49_0]
end

function var_0_0.IsRepairLoveLetterItem(arg_50_0)
	for iter_50_0, iter_50_1 in ipairs(getGameset("loveletter2018_item")[2]) do
		if arg_50_0.id == iter_50_1 then
			return true
		end
	end

	return false
end

return var_0_0

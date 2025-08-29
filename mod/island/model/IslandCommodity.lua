local var_0_0 = class("IslandCommodity", import("model.vo.BaseVO"))
local var_0_1 = pg.pay_data_display

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.configId = arg_1_1.id
	arg_1_0.id = arg_1_1.id
	arg_1_0.purchasedNum = arg_1_1.num
	arg_1_0.shopId = arg_1_2
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_shop_goods
end

function var_0_0.GetName(arg_3_0)
	return arg_3_0:getConfig("goods_name")
end

function var_0_0.GetDescription(arg_4_0)
	return arg_4_0:getConfig("desc")
end

function var_0_0.GetIcon(arg_5_0)
	return "island/" .. arg_5_0:getConfig("icon")
end

function var_0_0.GetResourceConsume(arg_6_0)
	return arg_6_0:getConfig("resource_consume")
end

function var_0_0.GetItems(arg_7_0)
	return arg_7_0:getConfig("items")
end

function var_0_0.GetItemsWithPt(arg_8_0)
	local var_8_0 = arg_8_0:getConfig("pt_award")
	local var_8_1 = Clone(arg_8_0:GetItems())

	if var_8_0 > 0 then
		table.insert(var_8_1, {
			VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT,
			0,
			var_8_0
		})
	end

	return var_8_1
end

function var_0_0.GetPayId(arg_9_0)
	return arg_9_0:getConfig("pay_id")
end

function var_0_0.GetMaxNum(arg_10_0)
	return arg_10_0:getConfig("limited_num")
end

function var_0_0.IsShowPurchaseLimit(arg_11_0)
	return arg_11_0:getConfig("limited_show") == 1
end

function var_0_0.IsShowSellOut(arg_12_0)
	return arg_12_0:getConfig("remian_show") == 1
end

function var_0_0.IsShowHave(arg_13_0)
	return arg_13_0:getConfig("goods_have") == 1 and #arg_13_0:GetItems() == 1
end

function var_0_0.IsShowHold(arg_14_0)
	return arg_14_0:getConfig("have_show") == 1 and #arg_14_0:GetItems() == 1
end

function var_0_0.GetDiscount(arg_15_0)
	local var_15_0 = 0

	if pg.TimeMgr.GetInstance():inTime(arg_15_0:getConfig("discount_time")) then
		var_15_0 = arg_15_0:getConfig("discount")
	end

	return var_15_0
end

function var_0_0.GetCommodityShowType(arg_16_0)
	return arg_16_0:getConfig("goods_detail_type")
end

function var_0_0.GetPacketItemsShowTypes(arg_17_0)
	return arg_17_0:getConfig("groups_detail_type")
end

function var_0_0.GetModel(arg_18_0)
	return arg_18_0:getConfig("items_model")
end

function var_0_0.GetModelParam(arg_19_0)
	return arg_19_0:getConfig("model_param")
end

function var_0_0.UpdateNum(arg_20_0, arg_20_1)
	arg_20_0.purchasedNum = arg_20_1
end

function var_0_0.AddNum(arg_21_0, arg_21_1)
	arg_21_0.purchasedNum = arg_21_0.purchasedNum + arg_21_1
end

function var_0_0.GetPayConfig(arg_22_0)
	return var_0_1[arg_22_0:GetPayId()]
end

function var_0_0.IsTimeLimitCommodity(arg_23_0)
	local var_23_0 = arg_23_0:getConfig("time")

	if type(var_23_0) == "table" then
		return true
	end

	return false
end

function var_0_0.IsCharacterInviteItemHold(arg_24_0)
	local var_24_0 = arg_24_0:GetItems()
	local var_24_1 = pg.island_chara_template.all
	local var_24_2 = {}

	for iter_24_0, iter_24_1 in ipairs(pg.island_chara_template.all) do
		table.insert(var_24_2, pg.island_chara_template[iter_24_1].invite_item)
	end

	if #var_24_0 ~= 1 or not table.contains(var_24_2, var_24_0[1][2]) then
		return false
	end

	local var_24_3 = var_24_1[table.indexof(var_24_2, var_24_0[1][2])]

	return getProxy(IslandProxy):GetIsland():GetCharacterAgency():HasInvite(var_24_3)
end

function var_0_0.GetDressType(arg_25_0)
	local var_25_0 = arg_25_0:GetItems()

	if not var_25_0[1] or var_25_0[1][1] ~= DROP_TYPE_ISLAND_DRESS then
		return nil
	end

	local var_25_1 = pg.island_dress_template[var_25_0[1][2]]

	if not var_25_1 then
		return nil
	end

	return var_25_1.type
end

return var_0_0

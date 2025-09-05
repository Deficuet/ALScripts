local var_0_0 = class("IslandDressItem", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.hasSend = arg_1_1.hasSend
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_dress_template
end

function var_0_0.GetSortValue(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = 0

	if arg_3_1 == IslandShipDressUpPageNew.SORT_RARITY then
		var_3_0 = arg_3_0:GetRarity()
	elseif arg_3_1 == IslandShipDressUpPageNew.SORT_CANSEND then
		var_3_0 = arg_3_0.hasSend and 1 or 0
	else
		var_3_0 = arg_3_0.id
	end

	return arg_3_2 == 1 and var_3_0 or -1 * var_3_0
end

function var_0_0.GetRarity(arg_4_0)
	return arg_4_0:getConfig("quality")
end

return var_0_0

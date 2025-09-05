local var_0_0 = class("IslandShipDressItem", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.state = arg_1_1.state
	arg_1_0.color = arg_1_1.color
	arg_1_0.color_list = arg_1_1.color_list or {}
end

function var_0_0.ChangeColor(arg_2_0, arg_2_1)
	arg_2_0.color = arg_2_1
end

function var_0_0.CheckColorIsOwned(arg_3_0, arg_3_1)
	if arg_3_1 == 0 then
		return true
	end

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.color_list) do
		if iter_3_1 == arg_3_1 then
			return true
		end
	end

	return false
end

function var_0_0.AddDressColor(arg_4_0, arg_4_1)
	table.insert(arg_4_0.color_list, arg_4_1)
end

function var_0_0.bindConfigTable(arg_5_0)
	return pg.island_dress_template
end

function var_0_0.GetSortValue(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = 0

	if arg_6_1 == IslandShipDressUpPageNew.SORT_RARITY then
		var_6_0 = arg_6_0:GetRarity()
	else
		var_6_0 = arg_6_0.id
	end

	return arg_6_2 == 1 and var_6_0 or -1 * var_6_0
end

function var_0_0.GetRarity(arg_7_0)
	return arg_7_0:getConfig("quality")
end

return var_0_0

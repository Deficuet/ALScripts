local var_0_0 = class("IslandShipOrder")

var_0_0.OP_TYPE_UNLOCK = 1
var_0_0.OP_TYPE_GET_AWARD = 2
var_0_0.OP_TYPE_LOADUP = 3
var_0_0.OPOP_TYPE_LOADUP_ALL = 4

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.consumeList = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.cost or {}) do
		table.insert(arg_1_0.consumeList, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_1_1.id,
			count = iter_1_1.num,
			state = iter_1_1.state
		})
	end

	arg_1_0.awardList = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.reward or {}) do
		table.insert(arg_1_0.awardList, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_1_3.id,
			count = iter_1_3.num
		})
	end

	table.insert(arg_1_0.awardList, {
		id = 0,
		type = VIRTUAL_DROP_TYPE_ISLAND_SEASON_PT,
		count = arg_1_1.add_pt
	})
end

function var_0_0.IsLoadUpAll(arg_2_0)
	return _.all(arg_2_0.consumeList, function(arg_3_0)
		return arg_3_0.state == 1
	end)
end

function var_0_0.MarkLoadUp(arg_4_0, arg_4_1)
	arg_4_0:GetComsume(arg_4_1).state = 1
end

function var_0_0.GetConsumeList(arg_5_0)
	return arg_5_0.consumeList
end

function var_0_0.GetComsume(arg_6_0, arg_6_1)
	return arg_6_0.consumeList[arg_6_1] or {}
end

function var_0_0.AnyCanLoadUp(arg_7_0)
	if arg_7_0:IsLoadUpAll() then
		return false
	end

	return _.any(arg_7_0.consumeList, function(arg_8_0)
		local var_8_0 = Drop.New(arg_8_0)

		return arg_8_0.state ~= 1 and var_8_0:getOwnedCount() >= arg_8_0.count
	end)
end

function var_0_0.ItemIsSubmited(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.consumeList[arg_9_1]

	return var_9_0 and var_9_0.state == 1
end

function var_0_0.GetConsumeAwards(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:GetComsume(arg_10_1)
	local var_10_1 = pg.island_item_data_template[var_10_0.id]
	local var_10_2 = pg.island_set.order_ship_award_coefficient.key_value_varchar
	local var_10_3 = var_10_1.order_price * var_10_0.count

	return {
		{
			type = DROP_TYPE_ISLAND_ITEM,
			id = var_10_2[1],
			count = math.floor(var_10_3 * (var_10_2[2] / 100))
		},
		{
			id = 2,
			type = DROP_TYPE_ISLAND_ITEM,
			count = math.floor(var_10_3 * (var_10_2[3] / 100))
		}
	}
end

function var_0_0.GetAwardList(arg_11_0)
	return arg_11_0.awardList
end

return var_0_0

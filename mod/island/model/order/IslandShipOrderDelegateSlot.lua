local var_0_0 = class("IslandShipOrderDelegateSlot")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.showTime = arg_1_1.view_time
	arg_1_0.request = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.cost or {}) do
		table.insert(arg_1_0.request, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_1_1.id,
			count = iter_1_1.num
		})
	end

	arg_1_0.awards = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.reward or {}) do
		table.insert(arg_1_0.awards, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_1_3.id,
			count = iter_1_3.num
		})
	end
end

function var_0_0.GetShowTime(arg_2_0)
	return arg_2_0.showTime
end

function var_0_0.CanShow(arg_3_0)
	return pg.TimeMgr.GetInstance():GetServerTime() >= arg_3_0.showTime
end

function var_0_0.GetRequestList(arg_4_0)
	return arg_4_0.request
end

function var_0_0.GetAwardList(arg_5_0)
	return arg_5_0.awards
end

return var_0_0

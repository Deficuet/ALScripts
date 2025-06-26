local var_0_0 = class("CollectionEventActivity", import(".Activity"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.collections = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.collection_list) do
		local var_1_0 = EventInfo.New(iter_1_1)

		var_1_0:SetActivityId(arg_1_0.id)
		table.insert(arg_1_0.collections, var_1_0)
	end
end

function var_0_0.getDayIndex(arg_2_0)
	local var_2_0 = arg_2_0.data1
	local var_2_1 = pg.TimeMgr.GetInstance()
	local var_2_2 = var_2_1:GetServerTime()

	return var_2_1:DiffDay(var_2_0, var_2_2) + 1
end

function var_0_0.GetCollectionList(arg_3_0)
	local var_3_0 = arg_3_0:getConfig("config_data")
	local var_3_1 = arg_3_0:getDayIndex()

	if #arg_3_0.collections > 0 and var_3_1 > table.indexof(var_3_0, arg_3_0.collections[1].id) then
		table.remove(arg_3_0.collections, 1)
	end

	if #arg_3_0.collections == 0 and var_3_1 > 0 and var_3_1 <= #var_3_0 then
		local var_3_2 = var_3_0[var_3_1]

		if not table.contains(arg_3_0.data1_list, var_3_2) then
			table.insert(arg_3_0.collections, EventInfo.New({
				finish_time = 0,
				over_time = 0,
				id = var_3_2,
				ship_id_list = {},
				activity_id = arg_3_0.id
			}))
		end
	end

	return arg_3_0.collections
end

return var_0_0

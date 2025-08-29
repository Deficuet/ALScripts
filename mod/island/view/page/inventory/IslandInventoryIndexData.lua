local var_0_0 = class("IslandInventoryIndexData")

var_0_0.MODE_SINGLE = 1
var_0_0.MODE_MULTI = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1
	arg_1_0.layoutData = arg_1_0:GenLayoutData(arg_1_1)
	arg_1_0.data = _.map(arg_1_0.layoutData, function(arg_2_0)
		return arg_2_0.list[1]
	end)
end

function var_0_0.GenLayoutData(arg_3_0, arg_3_1)
	local var_3_0 = pg.island_storage_filter_template.get_id_list_by_belong_filter_id[arg_3_1]
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_2 = pg.island_storage_filter_template[iter_3_1].name
		local var_3_3 = {}
		local var_3_4 = {}
		local var_3_5 = pg.island_storage_filter_template.get_id_list_by_belong_filter_id[iter_3_1]

		for iter_3_2, iter_3_3 in ipairs(var_3_5) do
			local var_3_6 = bit.lshift(1, iter_3_2)
			local var_3_7 = pg.island_storage_filter_template[iter_3_3].name

			table.insert(var_3_3, var_3_6)
			table.insert(var_3_4, var_3_7)
		end

		table.insert(var_3_3, 1, IndexConst.BitAll(var_3_3))
		table.insert(var_3_4, 1, i18n("index_all"))
		table.insert(var_3_1, {
			mode = var_0_0.MODE_MULTI,
			list = var_3_3,
			names = var_3_4,
			title = var_3_2
		})
	end

	local var_3_8 = pg.island_storage_filter_template[arg_3_1].sort_id
	local var_3_9 = pg.island_storage_filter_template[var_3_8]
	local var_3_10 = {}
	local var_3_11 = {}
	local var_3_12 = {}
	local var_3_13 = pg.island_storage_filter_template.get_id_list_by_belong_filter_id[var_3_8]

	for iter_3_4, iter_3_5 in ipairs(var_3_13) do
		local var_3_14 = pg.island_storage_filter_template[iter_3_5]

		table.insert(var_3_10, bit.lshift(1, iter_3_4))
		table.insert(var_3_11, var_3_14.name)
		table.insert(var_3_12, var_3_14.args)
	end

	local var_3_15 = {
		mode = var_0_0.MODE_SINGLE,
		list = var_3_10,
		names = var_3_11,
		sortFuncName = var_3_12,
		title = i18n("island_word_sort")
	}

	table.insert(var_3_1, 1, var_3_15)

	return var_3_1
end

function var_0_0.GetLayoutData(arg_4_0)
	return arg_4_0.layoutData
end

function var_0_0.GetData(arg_5_0, arg_5_1)
	return arg_5_0.data
end

function var_0_0.SetData(arg_6_0, arg_6_1)
	arg_6_0.data = arg_6_1
end

function var_0_0.Match(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1:getConfig("filter")
	local var_7_1 = pg.island_storage_filter_template.get_id_list_by_belong_filter_id[arg_7_0.id]
	local var_7_2 = 0

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		local var_7_3 = pg.island_storage_filter_template.get_id_list_by_belong_filter_id[iter_7_1]
		local var_7_4 = {}

		for iter_7_2, iter_7_3 in ipairs(var_7_0) do
			local var_7_5 = table.indexof(var_7_3, iter_7_3)

			if var_7_5 then
				table.insert(var_7_4, bit.lshift(1, var_7_5))
			end
		end

		local var_7_6 = IndexConst.BitAll(var_7_4)
		local var_7_7 = arg_7_0.data[iter_7_0 + 1]
		local var_7_8 = arg_7_0.layoutData[iter_7_0 + 1].list

		if var_0_0.CheckSelectedAll(var_7_8, var_7_7) or bit.band(var_7_6, var_7_7) > 0 then
			var_7_2 = var_7_2 + 1
		end
	end

	return var_7_2 == #var_7_1
end

function var_0_0.GetSortData(arg_8_0)
	return arg_8_0.data[1]
end

function var_0_0.GetSortText(arg_9_0)
	local var_9_0 = arg_9_0:GetSortData()
	local var_9_1 = arg_9_0:GetLayoutData()[1]
	local var_9_2 = 0

	for iter_9_0, iter_9_1 in ipairs(var_9_1.list) do
		if bit.band(var_9_0, iter_9_1) > 0 then
			var_9_2 = iter_9_0

			break
		end
	end

	return var_9_1.names[var_9_2] or ""
end

function var_0_0.Sort(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = arg_10_0:GetSortData()
	local var_10_1 = 0
	local var_10_2 = 0
	local var_10_3 = arg_10_0:GetLayoutData()[1]
	local var_10_4 = 0

	for iter_10_0, iter_10_1 in ipairs(var_10_3.list) do
		if bit.band(var_10_0, iter_10_1) > 0 then
			var_10_4 = iter_10_0

			break
		end
	end

	if var_10_4 > 0 then
		local var_10_5 = var_10_3.sortFuncName[var_10_4]

		assert(arg_10_1[var_10_5], "func should be exist")

		var_10_1, var_10_2 = arg_10_1[var_10_5](arg_10_1), arg_10_2[var_10_5](arg_10_2)
	end

	local function var_10_6(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0.id == arg_11_1.id then
			return arg_11_0:GetCount() > arg_11_1:GetCount()
		else
			return (arg_11_2 and {
				arg_11_0.id < arg_11_1.id
			} or {
				arg_11_0.id > arg_11_1.id
			})[1]
		end
	end

	if var_10_1 == var_10_2 then
		local var_10_7 = arg_10_1:GetType()
		local var_10_8 = arg_10_2:GetType()

		if var_10_7 == var_10_8 then
			return var_10_6(arg_10_1, arg_10_2, arg_10_3)
		else
			return (arg_10_3 and {
				var_10_7 < var_10_8
			} or {
				var_10_8 < var_10_7
			})[1]
		end
	else
		return (arg_10_3 and {
			var_10_1 < var_10_2
		} or {
			var_10_2 < var_10_1
		})[1]
	end
end

function var_0_0.CheckSelectedAll(arg_12_0, arg_12_1)
	if #arg_12_0 <= 1 then
		return true
	end

	return arg_12_1 == arg_12_0[1]
end

return var_0_0

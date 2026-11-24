local var_0_0 = class("BossRushActivity", import("model.vo.Activity"))

function var_0_0.SetSeriesData(arg_1_0, arg_1_1)
	getProxy(ActivityProxy):GetBossRushRuntime(arg_1_0.id).seriesData = arg_1_1
end

function var_0_0.GetSeriesData(arg_2_0)
	return getProxy(ActivityProxy):GetBossRushRuntime(arg_2_0.id).seriesData
end

function var_0_0.HasAwards(arg_3_0)
	return arg_3_0.data1 == 1
end

function var_0_0.GetUsedBonus(arg_4_0)
	return arg_4_0.data1_list
end

function var_0_0.AddUsedBonus(arg_5_0, arg_5_1)
	local var_5_0 = table.indexof(arg_5_0:GetActiveSeriesIds(), arg_5_1)

	if not var_5_0 or var_5_0 < 0 then
		return
	end

	arg_5_0:GetUsedBonus()[var_5_0] = (arg_5_0:GetUsedBonus()[var_5_0] or 0) + 1
end

function var_0_0.GetPassCounts(arg_6_0)
	return table.mergeArray(arg_6_0.data2_list, arg_6_0.data3_list, true)
end

function var_0_0.AddPassSeries(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_2 then
		if table.contains(arg_7_0.data2_list, arg_7_1) then
			return
		end

		table.insert(arg_7_0.data2_list, arg_7_1)
	else
		if table.contains(arg_7_0.data3_list, arg_7_1) then
			return
		end

		table.insert(arg_7_0.data3_list, arg_7_1)
	end
end

function var_0_0.HasPassSeries(arg_8_0, arg_8_1)
	return table.contains(arg_8_0:GetPassCounts(), arg_8_1)
end

function var_0_0.IsPassWithMulti(arg_9_0, arg_9_1)
	return table.contains(arg_9_0.data3_list, arg_9_1)
end

function var_0_0.GetActiveSeriesIds(arg_10_0)
	return arg_10_0:getConfig("config_data")
end

return var_0_0

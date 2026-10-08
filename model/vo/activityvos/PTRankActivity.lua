local var_0_0 = class("PTRankActivity", import("model.vo.Activity"))

function var_0_0.GetPTDrop(arg_1_0)
	local var_1_0 = arg_1_0:getConfig("config_data")
	local var_1_1 = type(var_1_0) == "table" and var_1_0[1] or DROP_TYPE_RESOURCE

	return Drop.New({
		count = 0,
		type = var_1_1,
		id = arg_1_0:getConfig("config_id")
	})
end

function var_0_0.GetTotalPtCount(arg_2_0)
	return arg_2_0.data1
end

function var_0_0.IsShowRank(arg_3_0)
	local var_3_0 = arg_3_0:getConfig("config_data")
	local var_3_1 = type(var_3_0)

	return (var_3_1 == "table" and var_3_0[2] or var_3_1 == "number" and tonumber(var_3_0) or 0) > 0
end

return var_0_0

local var_0_0 = class("PTBuffActivity", import("model.vo.Activity"))

function var_0_0.GetPTDrop(arg_1_0)
	local var_1_0 = switch(arg_1_0:getDataConfig("type"), {
		function()
			return DROP_TYPE_RESOURCE
		end,
		function()
			return DROP_TYPE_RESOURCE
		end,
		[8] = function()
			return DROP_TYPE_VITEM
		end,
		[9] = function()
			return DROP_TYPE_VITEM
		end
	})

	return var_1_0 and Drop.New({
		count = 0,
		type = var_1_0,
		id = arg_1_0:getDataConfig("pt")
	}) or nil
end

function var_0_0.GetTotalPtCount(arg_6_0)
	assert(arg_6_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_BUFF_MARK2)

	return arg_6_0.data4
end

return var_0_0

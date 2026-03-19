local var_0_0 = {
	GetTaskIDList = function()
		local var_1_0 = {}

		for iter_1_0, iter_1_1 in ipairs(pg.task_data_template.get_id_list_by_sub_type[1070]) do
			if table.keyof(pg.task_data_template.get_id_list_by_type[6], iter_1_1) then
				table.insert(var_1_0, iter_1_1)
			end
		end

		for iter_1_2, iter_1_3 in ipairs(pg.task_data_template.get_id_list_by_sub_type[1071]) do
			if table.keyof(pg.task_data_template.get_id_list_by_type[6], iter_1_3) then
				table.insert(var_1_0, iter_1_3)
			end
		end

		table.sort(var_1_0, function(arg_2_0, arg_2_1)
			return arg_2_0 < arg_2_1
		end)

		return var_1_0
	end
}

function var_0_0.NeedShowRedPoint()
	local var_3_0 = var_0_0.GetTaskIDList()
	local var_3_1 = getProxy(TaskProxy)

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_2 = var_3_1:getTaskVO(iter_3_1)

		if var_3_2 then
			local var_3_3 = var_3_2:isReceive()

			if var_3_2:isFinish() and not var_3_3 then
				return true
			end
		end
	end

	return false
end

function var_0_0.IsPopActivity(arg_4_0)
	local var_4_0 = var_0_0.GetTaskIDList()
	local var_4_1 = getProxy(TaskProxy)

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_2 = var_4_1:getTaskVO(iter_4_1)

		if var_4_2 and tonumber(var_4_2:getConfig("target_id")) == arg_4_0 then
			local var_4_3 = var_4_2:isReceive()

			if var_4_2:isFinish() and not var_4_3 then
				return true
			end
		end
	end

	return false
end

return var_0_0

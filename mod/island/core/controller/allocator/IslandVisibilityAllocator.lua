local var_0_0 = class("IslandVisibilityAllocator", import(".IslandComparableAllocator"))

function var_0_0.OnInitFlags(arg_1_0)
	for iter_1_0, iter_1_1 in ipairs(arg_1_0.controller.sceneData.unitList) do
		arg_1_0.flags[iter_1_1.id] = not iter_1_1.isDynamic

		arg_1_0:ApplyCondition(iter_1_1)
	end
end

function var_0_0.OnCompareSample(arg_2_0, arg_2_1, arg_2_2)
	for iter_2_0, iter_2_1 in pairs(arg_2_1) do
		local var_2_0 = iter_2_1
		local var_2_1 = arg_2_2[iter_2_0]

		if var_2_0 ~= nil and var_2_1 ~= nil and var_2_0 ~= var_2_1 then
			if var_2_0 == true and var_2_1 == false then
				arg_2_0:RemoveUnit(IslandConst.UNIT_LIST_OBJ, iter_2_0)
			elseif var_2_0 == false and var_2_1 == true then
				local var_2_2 = arg_2_0:GetUnitData(iter_2_0)

				if var_2_2 then
					arg_2_0:GenUnit(var_2_2)
				end
			end
		end
	end
end

function var_0_0.GetUnitData(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.controller.sceneData.unitList) do
		if iter_3_1.id == arg_3_1 then
			return iter_3_1
		end
	end

	return nil
end

function var_0_0.ApplyCondition(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:GetShowCondition()
	local var_4_1 = arg_4_1:GetHideCondition()

	if #var_4_0 == 0 and #var_4_1 == 0 then
		return
	end

	local var_4_2 = arg_4_0.controller.island:GetTaskAgency()
	local var_4_3 = var_4_2:GetTraceId()
	local var_4_4 = arg_4_0:CollectAllTaskStatus(var_4_2)
	local var_4_5 = pg.NewStoryMgr.GetInstance():GetPlayedList()
	local var_4_6 = arg_4_0.flags[arg_4_1.id]
	local var_4_7 = arg_4_0:GetCondition(var_4_4, var_4_5, var_4_3, var_4_0)
	local var_4_8 = arg_4_0:GetCondition(var_4_4, var_4_5, var_4_3, var_4_1)

	if #var_4_0 > 0 and #var_4_1 == 0 then
		if var_4_7 then
			var_4_6 = true
		end
	elseif #var_4_0 == 0 and #var_4_1 > 0 then
		if var_4_8 then
			var_4_6 = false
		end
	elseif #var_4_0 > 0 and #var_4_1 > 0 then
		var_4_6 = arg_4_0:SortCondition(arg_4_1, var_4_3, var_4_7, var_4_8)
	end

	arg_4_0.flags[arg_4_1.id] = var_4_6
end

function var_0_0.SortCondition(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	if not arg_5_3 and not arg_5_4 then
		return false
	elseif arg_5_3 and not arg_5_4 then
		return true
	elseif not arg_5_3 and arg_5_4 then
		return false
	end

	if arg_5_0:IsTaskType(arg_5_3) and arg_5_0:IsTaskType(arg_5_4) then
		return arg_5_0:SortTaskCondition(arg_5_2, arg_5_3, arg_5_4)
	elseif arg_5_0:IsStoryType(arg_5_3) and arg_5_0:IsStoryType(arg_5_4) then
		return arg_5_0:SortStoryCondition(arg_5_3, arg_5_4)
	elseif arg_5_3[3] == arg_5_4[3] then
		if arg_5_0:IsStoryType(arg_5_3) then
			return true
		end

		if arg_5_0:IsStoryType(arg_5_4) then
			return false
		end

		return true
	else
		return arg_5_3[3] > arg_5_4[3]
	end
end

function var_0_0.SortStoryCondition(arg_6_0, arg_6_1, arg_6_2)
	if arg_6_1[3] == arg_6_2[3] then
		local var_6_0 = {
			arg_6_1[2],
			arg_6_2[2]
		}

		table.sort(var_6_0, function(arg_7_0, arg_7_1)
			return arg_7_1 < arg_7_0
		end)

		return var_6_0[1] == arg_6_1[2]
	else
		return arg_6_1[3] > arg_6_2[3]
	end
end

function var_0_0.SortTaskCondition(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_2[2] == arg_8_1 and arg_8_3[2] == arg_8_1 then
		if arg_8_2[3] == arg_8_3[3] then
			local var_8_0 = {
				arg_8_2[2],
				arg_8_3[2]
			}

			table.sort(var_8_0, CompareFuncs({
				function(arg_9_0)
					return -1 * pg.island_task[arg_9_0].type
				end,
				function(arg_10_0)
					return arg_10_0
				end
			}))

			return var_8_0[1] == arg_8_2[2]
		else
			return arg_8_2[3] > arg_8_3[3]
		end
	else
		return arg_8_2[2] == arg_8_1
	end
end

function var_0_0.CollectAllTaskStatus(arg_11_0, arg_11_1)
	local var_11_0 = {}
	local var_11_1 = arg_11_1:GetTasks()

	for iter_11_0, iter_11_1 in pairs(var_11_1) do
		var_11_0[iter_11_1.id] = IslandConst.UNIT_SHOW_TYPE_ACCEPT_TASK

		if iter_11_1:IsFinish() then
			var_11_0[iter_11_1.id] = IslandConst.UNIT_SHOW_TYPE_FINISH_TASK
		end
	end

	for iter_11_2, iter_11_3 in ipairs(arg_11_1.finishedIds) do
		var_11_0[iter_11_3] = IslandConst.UNIT_SHOW_TYPE_RECIVE_TASK
	end

	return var_11_0
end

function var_0_0.IsTaskType(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1[1]

	return var_12_0 == IslandConst.UNIT_SHOW_TYPE_ACCEPT_TASK or var_12_0 == IslandConst.UNIT_SHOW_TYPE_FINISH_TASK or var_12_0 == IslandConst.UNIT_SHOW_TYPE_RECIVE_TASK
end

function var_0_0.IsStoryType(arg_13_0, arg_13_1)
	return arg_13_1[1] == IslandConst.UNIT_SHOW_TYPE_STORY_PLAYED
end

function var_0_0.GetCondition(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	local var_14_0 = {}
	local var_14_1 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_4) do
		if arg_14_0:IsTaskType(iter_14_1) then
			table.insert(var_14_0, iter_14_1)
		elseif arg_14_0:IsStoryType(iter_14_1) then
			table.insert(var_14_1, iter_14_1)
		end
	end

	local var_14_2 = arg_14_0:GetTaskCondition(var_14_0, arg_14_3, arg_14_1)
	local var_14_3 = arg_14_0:GetStoryCondition(arg_14_2, var_14_1)

	if var_14_2 and var_14_3 then
		return var_14_3[3] >= var_14_2[3] and var_14_3 or var_14_2
	elseif var_14_2 and not var_14_3 then
		return var_14_2
	elseif var_14_3 and not var_14_2 then
		return var_14_3
	end

	return nil
end

function var_0_0.GetTaskCondition(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	table.sort(arg_15_1, CompareFuncs({
		function(arg_16_0)
			return arg_16_0[2] == arg_15_2 and 1 or 0
		end,
		function(arg_17_0)
			return arg_17_0[3]
		end
	}))

	for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
		local var_15_0 = iter_15_1[1]

		if arg_15_3[iter_15_1[2]] == var_15_0 then
			return iter_15_1
		end
	end

	return nil
end

function var_0_0.GetStoryCondition(arg_18_0, arg_18_1, arg_18_2)
	table.sort(arg_18_2, CompareFuncs({
		function(arg_19_0)
			return arg_19_0[3]
		end
	}))

	for iter_18_0, iter_18_1 in ipairs(arg_18_2) do
		if arg_18_1[iter_18_1[2]] == true then
			return iter_18_1
		end
	end

	return nil
end

function var_0_0.IsVisible(arg_20_0, arg_20_1)
	return arg_20_0.flags[arg_20_1] == true
end

return var_0_0

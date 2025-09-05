local var_0_0 = class("IslandAchievementAgency", import(".IslandBaseAgency"))

var_0_0.NEW_CAN_GET = "IslandAchievementAgency.NEW_CAN_GET"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.achievement_sys

	arg_1_0.gotList = var_1_0.finish_list or {}
	arg_1_0.recordDic = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.achieve_list or {}) do
		local var_1_1 = iter_1_1.event_type
		local var_1_2 = iter_1_1.event_arg
		local var_1_3 = iter_1_1.value

		if not arg_1_0.recordDic[var_1_1] then
			arg_1_0.recordDic[var_1_1] = {}
		end

		arg_1_0.recordDic[var_1_1][var_1_2] = var_1_3
	end
end

function var_0_0.InitRuntimeRecords(arg_2_0)
	local var_2_0 = IslandAchievementType.GetRuntimeTypes()
	local var_2_1 = IslandAchievementType.GetClientTypes()

	for iter_2_0, iter_2_1 in ipairs(pg.island_achievement.all) do
		local var_2_2 = pg.island_achievement[iter_2_1]
		local var_2_3 = var_2_2.target_type
		local var_2_4 = var_2_2.target_value1

		if table.contains(var_2_0, var_2_3) then
			if not arg_2_0.recordDic[var_2_3] then
				arg_2_0.recordDic[var_2_3] = {}
			end

			if not arg_2_0.recordDic[var_2_3][var_2_4] then
				arg_2_0.recordDic[var_2_3][var_2_4] = IslandAchievementHelper.GetRuntimeData(var_2_3, var_2_4)
			end
		elseif table.contains(var_2_1, var_2_3) then
			if not arg_2_0.recordDic[var_2_3] then
				arg_2_0.recordDic[var_2_3] = {}
			end

			if not arg_2_0.recordDic[var_2_3][var_2_4] then
				arg_2_0.recordDic[var_2_3][var_2_4] = 0
			end
		end
	end

	arg_2_0:BuildDataDic()
end

function var_0_0.BuildDataDic(arg_3_0)
	arg_3_0.groupDic = {}
	arg_3_0.achvDic = {}

	for iter_3_0, iter_3_1 in ipairs(pg.island_achievement.get_id_list_by_group) do
		local var_3_0 = IslandAchievementGroup.New(iter_3_0, iter_3_1)

		for iter_3_2, iter_3_3 in ipairs(iter_3_1) do
			local var_3_1 = var_3_0:GetAchvById(iter_3_3)

			if table.contains(arg_3_0.gotList, iter_3_3) then
				var_3_1:SetStatus(IslandAchievement.STATUS.GOT)
			else
				var_3_1:SetStatus(arg_3_0:IsCanGet(var_3_1) and IslandAchievement.STATUS.GET or IslandAchievement.STATUS.NORMAL)
			end

			local var_3_2 = var_3_1:GetType()
			local var_3_3 = var_3_1:GetParam()

			if not arg_3_0.achvDic[var_3_2] then
				arg_3_0.achvDic[var_3_2] = {}
			end

			if not arg_3_0.achvDic[var_3_2][var_3_3] then
				arg_3_0.achvDic[var_3_2][var_3_3] = {}
			end

			table.insert(arg_3_0.achvDic[var_3_2][var_3_3], var_3_1)
		end

		arg_3_0.groupDic[iter_3_0] = var_3_0
	end
end

function var_0_0.GetRecordsByType(arg_4_0, arg_4_1)
	return arg_4_0.recordDic[arg_4_1] or {}
end

function var_0_0.IsGot(arg_5_0, arg_5_1)
	return table.contains(arg_5_0.gotList, arg_5_1)
end

function var_0_0.GetGotList(arg_6_0)
	return arg_6_0.gotList
end

function var_0_0.GetGroup(arg_7_0, arg_7_1)
	return arg_7_0.groupDic[arg_7_1]
end

function var_0_0.IsCanGet(arg_8_0, arg_8_1)
	if arg_8_1:GetStatus() == IslandAchievement.STATUS.GOT then
		return
	end

	local var_8_0 = arg_8_1:GetType()
	local var_8_1 = arg_8_1:GetParam()
	local var_8_2 = arg_8_1:GetNum()

	if not arg_8_0.recordDic[var_8_0] then
		return false
	end

	local var_8_3 = arg_8_0.recordDic[var_8_0][var_8_1]

	return var_8_3 and var_8_2 <= var_8_3
end

function var_0_0.GetCurProgress(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:GetType()
	local var_9_1 = arg_9_1:GetParam()
	local var_9_2 = arg_9_1:GetNum()

	if not arg_9_0.recordDic[var_9_0] then
		return 0
	end

	return arg_9_0.recordDic[var_9_0][var_9_1] or 0
end

function var_0_0.GetTotalCnt(arg_10_0)
	local var_10_0 = 0

	for iter_10_0, iter_10_1 in pairs(arg_10_0.groupDic) do
		var_10_0 = underscore.reduce(iter_10_1:GetSortAchvList(), var_10_0, function(arg_11_0, arg_11_1)
			return arg_11_0 + (arg_11_1:IsHideType() and (arg_10_0:IsCanGet(arg_11_1) and 1 or 0) or 1)
		end)
	end

	return var_10_0
end

function var_0_0.CheckRecordExist(arg_12_0, arg_12_1, arg_12_2)
	return arg_12_0.recordDic[arg_12_1] and arg_12_0.recordDic[arg_12_1][arg_12_2]
end

function var_0_0.UpdateRecord(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	if not arg_13_0.recordDic[arg_13_1] then
		arg_13_0.recordDic[arg_13_1] = {}
	end

	if not arg_13_0.recordDic[arg_13_1][arg_13_2] then
		local var_13_0 = 0
	end

	arg_13_0.recordDic[arg_13_1][arg_13_2] = arg_13_3

	arg_13_0:CheckAchvStatus(arg_13_1, arg_13_2)
end

function var_0_0.UpdateRecordWithAdd(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if not arg_14_0.recordDic[arg_14_1] then
		arg_14_0.recordDic[arg_14_1] = {}
	end

	local var_14_0 = arg_14_0.recordDic[arg_14_1][arg_14_2] or 0

	arg_14_0.recordDic[arg_14_1][arg_14_2] = var_14_0 + arg_14_3

	arg_14_0:CheckAchvStatus(arg_14_1, arg_14_2)
end

function var_0_0.CheckAchvStatus(arg_15_0, arg_15_1, arg_15_2)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0.achvDic[arg_15_1][arg_15_2]) do
		if iter_15_1:GetStatus() == IslandAchievement.STATUS.NORMAL and arg_15_0:IsCanGet(iter_15_1) then
			iter_15_1:SetStatus(IslandAchievement.STATUS.GET)
			arg_15_0:DispatchEvent(var_0_0.NEW_CAN_GET, iter_15_1)
		end
	end
end

function var_0_0.AddGotIds(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_1) do
		table.insert(arg_16_0.gotList, iter_16_1)

		local var_16_0 = pg.island_achievement[iter_16_1].group

		arg_16_0.groupDic[var_16_0]:SetGotTagById(iter_16_1)
	end
end

function var_0_0.IsTip(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.groupDic) do
		for iter_17_2, iter_17_3 in ipairs(iter_17_1:GetSortAchvList()) do
			if iter_17_3:GetStatus() == IslandAchievement.STATUS.GET then
				return true
			end
		end
	end

	return false
end

return var_0_0

local var_0_0 = class("IslandTask", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.acceptTime = arg_1_1.timestamp or 0

	arg_1_0:InitEndTime()
	arg_1_0:UpdateTargetData(arg_1_1.process_list)
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_task
end

function var_0_0.GetAcceptTime(arg_3_0)
	return arg_3_0.acceptTime
end

function var_0_0.InitEndTime(arg_4_0)
	local var_4_0 = arg_4_0:getConfig("unlock_condition")

	if var_4_0 == "" or #var_4_0 == 0 then
		arg_4_0.endTime = 0
	end

	local var_4_1 = underscore.detect(var_4_0, function(arg_5_0)
		return arg_5_0[1] == IslandTaskConditionType.IN_TIME
	end)

	if not var_4_1 then
		arg_4_0.endTime = 0
	else
		arg_4_0.endTime = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_4_1[2][2])
	end
end

function var_0_0.SetEndTime(arg_6_0, arg_6_1)
	arg_6_0.endTime = arg_6_1
end

function var_0_0.UpdateTargetData(arg_7_0, arg_7_1)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		var_7_0[iter_7_1.target_id] = iter_7_1
	end

	arg_7_0.targetList = {}

	for iter_7_2, iter_7_3 in ipairs(arg_7_0:getConfig("target_id")) do
		table.insert(arg_7_0.targetList, IslandTaskTarget.New(var_7_0[iter_7_3] or {
			target_id = iter_7_3
		}))
	end
end

function var_0_0.GetTargetList(arg_8_0)
	return arg_8_0.targetList
end

function var_0_0.GetTargetById(arg_9_0, arg_9_1)
	return underscore.detect(arg_9_0.targetList, function(arg_10_0)
		return arg_10_0.id == arg_9_1
	end)
end

function var_0_0.GetRecycleItemInfos(arg_11_0)
	local var_11_0 = {}

	underscore.each(arg_11_0.targetList, function(arg_12_0)
		if arg_12_0:GetType() == IslandTaskTargetType.RECYCLE then
			table.insert(var_11_0, Drop.New({
				type = DROP_TYPE_ISLAND_ITEM,
				id = arg_12_0:GetTargetId(),
				count = arg_12_0:GetTargetNum()
			}))
		end
	end)

	return var_11_0
end

function var_0_0.ExistTargetType(arg_13_0, arg_13_1)
	return underscore.any(arg_13_0.targetList, function(arg_14_0)
		return arg_14_0:GetType() == arg_13_1
	end)
end

function var_0_0.GetTargetIdByTypeAndParam(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.targetList) do
		if iter_15_1:CheckTypeAndTargetId(arg_15_1, arg_15_2) and not table.contains(var_15_0, iter_15_1.id) then
			table.insert(var_15_0, iter_15_1.id)
		end
	end

	return var_15_0
end

function var_0_0.GetRemainTimeStr(arg_16_0)
	local var_16_0 = arg_16_0.endTime - pg.TimeMgr.GetInstance():GetServerTime()
	local var_16_1 = math.floor(var_16_0 / 86400)
	local var_16_2 = math.floor(var_16_0 % 86400 / 3600)

	return i18n("island_task_lefttime", var_16_1, var_16_2)
end

function var_0_0.IsFinish(arg_17_0)
	return underscore.all(arg_17_0.targetList, function(arg_18_0)
		return arg_18_0:IsFinish()
	end)
end

function var_0_0.IsSubmitOnUI(arg_19_0)
	return arg_19_0:getConfig("complete_type") == 3
end

function var_0_0.GetSubmitObjectId(arg_20_0)
	return arg_20_0:getConfig("complete_data")
end

function var_0_0.IsSubmitImmediately(arg_21_0)
	return arg_21_0:getConfig("complete_type") == 2 and arg_21_0:GetSubmitObjectId() == 0
end

function var_0_0.CheckSubmitOnApproach(arg_22_0, arg_22_1)
	return arg_22_0:GetSubmitObjectId() == arg_22_1 and arg_22_0:getConfig("complete_type") == 2
end

function var_0_0.GetFinishedDesc(arg_23_0)
	return arg_23_0:getConfig("complete_tips")
end

function var_0_0.InTime(arg_24_0)
	if arg_24_0.endTime == 0 then
		return true
	end

	return pg.TimeMgr.GetInstance():GetServerTime() < arg_24_0.endTime
end

function var_0_0.GetType(arg_25_0)
	return arg_25_0:getConfig("type")
end

function var_0_0.GetShowType(arg_26_0)
	return IslandTaskType.Type2ShowType[arg_26_0:getConfig("type")]
end

function var_0_0.GetName(arg_27_0)
	return arg_27_0:getConfig("name")
end

function var_0_0.GetDesc(arg_28_0)
	return arg_28_0:getConfig("task_desc")
end

function var_0_0.IsSeries(arg_29_0)
	return arg_29_0:getConfig("series") ~= ""
end

function var_0_0.GetSeriesTitle(arg_30_0)
	return arg_30_0:getConfig("series") .. " " .. arg_30_0:getConfig("series_name")
end

function var_0_0.GetAddedStory(arg_31_0)
	return arg_31_0:getConfig("rec_perform")
end

function var_0_0.GetSubmitStory(arg_32_0)
	return arg_32_0:getConfig("com_perform")
end

function var_0_0.GetTraceId(arg_33_0)
	return arg_33_0:getConfig("navigation")
end

function var_0_0.GetTraceParam(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0.targetList) do
		if not iter_34_1:IsFinish() then
			return iter_34_1:GetTrackParma(), iter_34_0
		end
	end

	return arg_34_0:GetSubmitObjectId() ~= 0 and arg_34_0:GetSubmitObjectId() or ""
end

function var_0_0.GetAwards(arg_35_0)
	local var_35_0 = underscore.map(arg_35_0:getConfig("reward_show"), function(arg_36_0)
		return Drop.Create(arg_36_0)
	end)

	if arg_35_0:GetExpAward() then
		table.insert(var_35_0, arg_35_0:GetExpAward())
	end

	return var_35_0
end

function var_0_0.GetExp(arg_37_0)
	return arg_37_0:getConfig("reward_exp")
end

function var_0_0.GetExpAward(arg_38_0)
	if arg_38_0:GetExp() ~= 0 then
		return {
			id = 2,
			type = DROP_TYPE_ISLAND_ITEM,
			count = arg_38_0:GetExp()
		}
	end

	return nil
end

function var_0_0.GetAwardsStatic(arg_39_0)
	return underscore.map(pg.island_task[arg_39_0].reward_show, function(arg_40_0)
		return Drop.Create(arg_40_0)
	end)
end

function var_0_0.GetSubmitPlayInfo(arg_41_0)
	local var_41_0 = pg.island_task[arg_41_0].com_perform

	if var_41_0 == "" or #var_41_0 == 0 then
		return nil
	end

	return var_41_0[1], var_41_0[2]
end

return var_0_0

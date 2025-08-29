local var_0_0 = class("IslandSeason", import("model.vo.BaseVO"))

var_0_0.RESET_TIP_KEY = "IslandSeason.RESET_TIP_KEY"

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.pt = arg_1_1.pt or 0
	arg_1_0.gotPtAwardList = arg_1_1.fetch_list or {}
	arg_1_0.records = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.count_list or {}) do
		arg_1_0.records[iter_1_1.key] = iter_1_1.value
	end

	arg_1_0.endTime = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_1_0:getConfig("time")[2])
	arg_1_0.localTipKey = var_0_0.RESET_TIP_KEY .. "_" .. getProxy(PlayerProxy):getRawData().id .. "_" .. arg_1_0.id
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_season
end

function var_0_0.GetTimeStr(arg_3_0)
	local var_3_0 = arg_3_0:getConfig("time")
	local var_3_1 = var_3_0[1][1]
	local var_3_2 = var_3_0[2][1]

	return string.format("%d.%d.%d - %d.%d.%d", var_3_1[1], var_3_1[2], var_3_1[3], var_3_2[1], var_3_2[2], var_3_2[3])
end

function var_0_0.GetRemainTime(arg_4_0)
	return arg_4_0.endTime - pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.NeedTip(arg_5_0)
	local var_5_0 = arg_5_0.endTime - pg.TimeMgr.GetInstance():GetServerTime()
	local var_5_1 = math.floor(var_5_0 / 86400)

	if var_5_1 > 3 then
		return false
	end

	if PlayerPrefs.GetInt(arg_5_0.localTipKey .. "_" .. arg_5_0:GetTipStamp(var_5_1)) == 1 then
		return false
	end

	return true, var_5_1, math.floor(var_5_0 / 3600)
end

function var_0_0.SetTipFlag(arg_6_0, arg_6_1)
	PlayerPrefs.SetInt(arg_6_0.localTipKey .. "_" .. arg_6_0:GetTipStamp(arg_6_1), 1)
end

function var_0_0.GetTipStamp(arg_7_0, arg_7_1)
	return arg_7_1 .. "_" .. arg_7_0.endTime - arg_7_1 * 86400
end

function var_0_0.AddPt(arg_8_0, arg_8_1)
	if arg_8_0.pt == 0 then
		IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.SEASON_NUM, 0, 1)
	end

	arg_8_0.pt = arg_8_0.pt + arg_8_1
end

function var_0_0.GetPt(arg_9_0)
	return arg_9_0.pt
end

function var_0_0.GetGotPtAwardList(arg_10_0)
	return arg_10_0.gotPtAwardList
end

function var_0_0.AddGotPtAwardList(arg_11_0, arg_11_1)
	if arg_11_1 == 0 then
		for iter_11_0, iter_11_1 in ipairs(arg_11_0:getConfig("target")) do
			if iter_11_1 <= arg_11_0.pt and not table.contains(arg_11_0.gotPtAwardList, iter_11_1) then
				table.insert(arg_11_0.gotPtAwardList, iter_11_1)
			end
		end
	else
		table.insert(arg_11_0.gotPtAwardList, arg_11_1)
	end
end

function var_0_0.GanGetPtAward(arg_12_0)
	return underscore.any(arg_12_0:getConfig("target"), function(arg_13_0)
		return arg_13_0 <= arg_12_0.pt and not table.contains(arg_12_0.gotPtAwardList, arg_13_0)
	end)
end

function var_0_0.GetTaskIds(arg_14_0)
	return arg_14_0:getConfig("task_list")
end

function var_0_0.GetAwardsByRank(arg_15_0, arg_15_1)
	local var_15_0 = pg.island_season[arg_15_0].rank
	local var_15_1 = pg.island_season[arg_15_0].rankaward_display

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		if arg_15_1 >= iter_15_1[1] and arg_15_1 <= iter_15_1[2] then
			return underscore.map(var_15_1[iter_15_0], function(arg_16_0)
				return Drop.Create(arg_16_0)
			end)
		end
	end

	return {}
end

function var_0_0.GetPtAwardInfos(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = pg.island_season[arg_17_0]

	for iter_17_0, iter_17_1 in ipairs(var_17_1.target) do
		table.insert(var_17_0, {
			target = iter_17_1,
			drop = Drop.Create(var_17_1.ptaward_display[iter_17_0]),
			isImportant = table.contains(var_17_1.ptaward_highvalue, iter_17_0)
		})
	end

	return var_17_0
end

return var_0_0

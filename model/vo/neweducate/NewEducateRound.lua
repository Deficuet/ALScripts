local var_0_0 = class("NewEducateRound", import("model.vo.BaseVO"))

var_0_0.TYPE = {
	NORMAL = 1,
	ENDLESS = 2
}

function var_0_0.bindConfigTable(arg_1_0)
	return pg.child2_round
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_1.id

	arg_2_0.difficulty = arg_2_1.difficulty

	arg_2_0:InitConfig(var_2_0)
	arg_2_0:InitEndlessConfig(var_2_0)

	local var_2_1 = arg_2_1.round

	arg_2_0.round = var_2_1.round
	arg_2_0.isTemp = var_2_1.in_temp == 1
	arg_2_0.tempCnt = var_2_1.temp_round

	arg_2_0:InitRoundId()

	arg_2_0.isEndlessFail = arg_2_1.eval_fail == 1
end

function var_0_0.InitConfig(arg_3_0, arg_3_1)
	arg_3_0.round2Id = {}
	arg_3_0.assessRoundIds = {}
	arg_3_0.talentRoundIds = {}

	for iter_3_0, iter_3_1 in ipairs(pg.child2_round.get_id_list_by_character[arg_3_1]) do
		local var_3_0 = pg.child2_round[iter_3_1]

		if var_3_0.round_type == var_0_0.TYPE.NORMAL and arg_3_0.difficulty == var_3_0.is_hard_mode then
			arg_3_0.round2Id[var_3_0.round] = iter_3_1

			if var_3_0.target_id ~= 0 then
				table.insert(arg_3_0.assessRoundIds, var_3_0.round)
			end

			if var_3_0.benefit_select ~= "" and #var_3_0.benefit_select ~= 0 then
				table.insert(arg_3_0.talentRoundIds, var_3_0.round)
			end
		end
	end

	table.sort(arg_3_0.assessRoundIds)
	table.sort(arg_3_0.talentRoundIds)

	arg_3_0.gameRoundCnt = #underscore.keys(arg_3_0.round2Id)
end

function var_0_0.InitRoundId(arg_4_0)
	if arg_4_0:IsEndless() then
		arg_4_0:InitEndlessRoundId()
	else
		arg_4_0.id = arg_4_0.round2Id[arg_4_0.round]
		arg_4_0.configId = arg_4_0.id
	end
end

function var_0_0.GetTalentRoundIds(arg_5_0)
	return arg_5_0.talentRoundIds
end

function var_0_0.IsTalentRound(arg_6_0)
	return not arg_6_0:IsTemp() and table.contains(arg_6_0.talentRoundIds, arg_6_0.round)
end

function var_0_0.IsShowAssessTip(arg_7_0)
	if arg_7_0.round == 1 then
		return true
	end

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.assessRoundIds) do
		if arg_7_0.round == iter_7_1 + 1 then
			return true
		end
	end

	return false
end

function var_0_0.GetProgressInfo(arg_8_0)
	local var_8_0 = underscore.detect(arg_8_0.assessRoundIds, function(arg_9_0)
		return arg_9_0 >= arg_8_0.round
	end)
	local var_8_1 = pg.child2_round[arg_8_0.round2Id[var_8_0]].target_id

	return arg_8_0.round, var_8_0 - arg_8_0.round, pg.child2_target[var_8_1].attr_sum
end

function var_0_0.GetGameRoundCnt(arg_10_0)
	return arg_10_0.gameRoundCnt
end

function var_0_0.IsEndRound(arg_11_0)
	return not arg_11_0.round2Id[arg_11_0.round + 1]
end

function var_0_0.OnNextRound(arg_12_0)
	if arg_12_0.tempCnt > 0 then
		arg_12_0.tempCnt = arg_12_0.tempCnt - 1
		arg_12_0.isTemp = true
	else
		arg_12_0.isTemp = false
		arg_12_0.round = arg_12_0.round + 1
	end

	arg_12_0:InitRoundId()
end

function var_0_0.IsTemp(arg_13_0)
	return arg_13_0.isTemp
end

function var_0_0.NextIsTemp(arg_14_0)
	return arg_14_0.tempCnt > 0
end

function var_0_0.AddTempCnt(arg_15_0, arg_15_1)
	arg_15_0.tempCnt = arg_15_0.tempCnt + arg_15_1
end

function var_0_0.ExistEndless(arg_16_0)
	return #arg_16_0.cycleIds > 0
end

function var_0_0.InitEndlessConfig(arg_17_0, arg_17_1)
	arg_17_0.cycleIds = {}

	for iter_17_0, iter_17_1 in ipairs(pg.child2_round.get_id_list_by_character[arg_17_1]) do
		local var_17_0 = pg.child2_round[iter_17_1]

		if var_17_0.round_type == var_0_0.TYPE.ENDLESS and arg_17_0.difficulty == var_17_0.is_hard_mode then
			table.insert(arg_17_0.cycleIds, iter_17_1)
		end
	end

	table.sort(arg_17_0.cycleIds)

	arg_17_0.endlessRoundCnt = #arg_17_0.cycleIds
end

function var_0_0.InitEndlessRoundId(arg_18_0)
	local var_18_0 = arg_18_0.round - arg_18_0.gameRoundCnt

	arg_18_0.cycleCnt = 1 + math.floor(var_18_0 / arg_18_0.endlessRoundCnt)
	arg_18_0.cycleIdx = var_18_0 % arg_18_0.endlessRoundCnt

	if arg_18_0.cycleIdx == 0 then
		arg_18_0.cycleIdx = #arg_18_0.cycleIds
	end

	arg_18_0.id = arg_18_0.cycleIds[arg_18_0.cycleIdx]
	arg_18_0.configId = arg_18_0.id
end

function var_0_0.IsEndless(arg_19_0)
	return arg_19_0.round > arg_19_0.gameRoundCnt
end

function var_0_0.GetWave(arg_20_0)
	return arg_20_0.round - arg_20_0.gameRoundCnt
end

function var_0_0.IsEndlessFail(arg_21_0)
	return arg_21_0:IsEndless() and arg_21_0.isEndlessFail
end

function var_0_0.SetEndlessFail(arg_22_0)
	arg_22_0.isEndlessFail = true
end

function var_0_0.GetHeighestWave(arg_23_0)
	return getProxy(NewEducateProxy):GetCurChar():GetPermanentData():GetMaxRound() - arg_23_0.gameRoundCnt
end

function var_0_0.GetExtraFactor(arg_24_0)
	if not arg_24_0:IsEndless() then
		return 1
	end

	local var_24_0 = arg_24_0:getConfig("endless_factor")
	local var_24_1 = arg_24_0.difficulty == NewEducateChar.DIFFICULTY.EASY and "child2_endless_loop_extra_factor" or "child2_endless_loop_extra_factor_hard"
	local var_24_2 = pg.gameset[var_24_1].description

	for iter_24_0, iter_24_1 in ipairs(var_24_2) do
		if arg_24_0.round >= iter_24_1[1] and arg_24_0.round <= iter_24_1[2] then
			return iter_24_1[3] * (tonumber(var_24_0) or 1)
		end
	end

	return var_24_2[#var_24_2][3] * (tonumber(var_24_0) or 1)
end

function var_0_0.GetEndlessProgressInfos(arg_25_0)
	local var_25_0 = pg.child2_target[arg_25_0:getConfig("target_id")].attr_sum * arg_25_0:GetExtraFactor()
	local var_25_1 = arg_25_0:GetWave()

	return var_25_1, var_25_1 > arg_25_0:GetHeighestWave(), var_25_0
end

return var_0_0

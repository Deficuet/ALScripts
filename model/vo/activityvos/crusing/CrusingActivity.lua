local var_0_0 = class("CrusingActivity", import("model.vo.Activity"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.previousPeriodAct = arg_1_0:CreatePreviousPeriodAct()

	print("========================&", arg_1_0.id, arg_1_0.data3, arg_1_0.data4)
end

function var_0_0.GetCrusingUnreceiveAward(arg_2_0)
	assert(arg_2_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_2_0 = pg.battlepass_event_pt[arg_2_0.id]
	local var_2_1 = {}
	local var_2_2 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.data1_list) do
		var_2_2[iter_2_1] = true
	end

	for iter_2_2, iter_2_3 in ipairs(var_2_0.target) do
		if iter_2_3 > arg_2_0.data1 then
			break
		elseif not var_2_2[iter_2_3] then
			table.insert(var_2_1, Drop.Create(pg.battlepass_event_award[var_2_0.award[iter_2_2]].drop_client))
		end
	end

	if arg_2_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_2_1)
	end

	local var_2_3 = {}

	for iter_2_4, iter_2_5 in ipairs(arg_2_0.data2_list) do
		var_2_3[iter_2_5] = true
	end

	for iter_2_6, iter_2_7 in ipairs(var_2_0.target) do
		if iter_2_7 > arg_2_0.data1 then
			break
		elseif not var_2_3[iter_2_7] then
			table.insert(var_2_1, Drop.Create(pg.battlepass_event_award[var_2_0.award_pay[iter_2_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_2_1)
end

function var_0_0.GetCrusingInfo(arg_3_0)
	assert(arg_3_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_3_0 = pg.battlepass_event_pt[arg_3_0.id]
	local var_3_1 = var_3_0.pt
	local var_3_2 = {}
	local var_3_3 = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0.key_point_display) do
		var_3_3[iter_3_1] = true
	end

	for iter_3_2, iter_3_3 in ipairs(var_3_0.target) do
		table.insert(var_3_2, {
			id = iter_3_2,
			pt = iter_3_3,
			award = pg.battlepass_event_award[var_3_0.award[iter_3_2]].drop_client,
			award_pay = pg.battlepass_event_award[var_3_0.award_pay[iter_3_2]].drop_client,
			isImportent = var_3_3[iter_3_2]
		})
	end

	local var_3_4 = arg_3_0.data1
	local var_3_5 = arg_3_0.data2 == 1
	local var_3_6 = {}

	for iter_3_4, iter_3_5 in ipairs(arg_3_0.data1_list) do
		var_3_6[iter_3_5] = true
	end

	local var_3_7 = {}

	for iter_3_6, iter_3_7 in ipairs(arg_3_0.data2_list) do
		var_3_7[iter_3_7] = true
	end

	local var_3_8 = 0

	for iter_3_8, iter_3_9 in ipairs(var_3_2) do
		if var_3_4 < iter_3_9.pt then
			break
		else
			var_3_8 = iter_3_8
		end
	end

	return {
		ptId = var_3_1,
		awardList = var_3_2,
		pt = var_3_4,
		isPay = var_3_5,
		awardDic = var_3_6,
		awardPayDic = var_3_7,
		phase = var_3_8
	}
end

function var_0_0.GetUpdateToastData(arg_4_0, arg_4_1)
	local var_4_0 = pg.battlepass_event_pt[arg_4_0.id]
	local var_4_1 = var_4_0.target

	if arg_4_1 and arg_4_1.data1 < var_4_1[#var_4_1] and arg_4_0.data1 - arg_4_1.data1 > 0 then
		return {
			ptId = var_4_0.pt,
			ptCount = arg_4_0.data1 - arg_4_1.data1
		}
	end
end

function var_0_0.SyncAwardRecords(arg_5_0, arg_5_1)
	arg_5_0.data1_list = {}
	arg_5_1 = arg_5_1 or pg.battlepass_event_pt[arg_5_0.id]

	for iter_5_0, iter_5_1 in ipairs(arg_5_1.target) do
		if iter_5_1 <= arg_5_0.data1 then
			table.insert(arg_5_0.data1_list, iter_5_1)
		else
			break
		end
	end

	if arg_5_0.data2 == 1 then
		arg_5_0.data2_list = underscore.rest(arg_5_0.data1_list, 1)
	else
		arg_5_0.data2_list = {}
	end
end

function var_0_0.AddAwardRecord(arg_6_0, arg_6_1)
	if not table.contains(arg_6_0.data1_list, arg_6_1) then
		table.insert(arg_6_0.data1_list, arg_6_1)
	end
end

function var_0_0.AddPayAwardRecord(arg_7_0, arg_7_1)
	if not table.contains(arg_7_0.data2_list, arg_7_1) then
		table.insert(arg_7_0.data2_list, arg_7_1)
	end
end

function var_0_0.CreatePreviousPeriodAct(arg_8_0)
	local var_8_0 = pg.battlepass_event_pt[arg_8_0.id]

	if arg_8_0.data3 > 0 and var_8_0.related_activity and var_8_0.related_activity ~= 0 then
		return PrevPeriodCrusingActivity.New(var_8_0.related_activity, arg_8_0)
	end

	return nil
end

function var_0_0.GetPreviousPeriodAct(arg_9_0)
	return arg_9_0.previousPeriodAct
end

function var_0_0.UpdatePreviousPeriodAct(arg_10_0)
	if not arg_10_0.previousPeriodAct then
		return
	end

	arg_10_0.previousPeriodAct:RevertSynCrusingActivity(arg_10_0)

	arg_10_0.previousPeriodAct = arg_10_0:CreatePreviousPeriodAct()
end

return var_0_0

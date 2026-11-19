local var_0_0 = class("Hei5Activity", import("model.vo.Activity"))

function var_0_0.GetHei5Info(arg_1_0)
	local var_1_0 = pg.black_friday_battlepass_event_pt[arg_1_0.id]
	local var_1_1 = var_1_0.pt
	local var_1_2 = {}
	local var_1_3 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.key_point_display) do
		var_1_3[iter_1_1] = true
	end

	for iter_1_2, iter_1_3 in ipairs(var_1_0.target) do
		table.insert(var_1_2, {
			id = iter_1_2,
			pt = iter_1_3,
			award = pg.black_friday_battlepass_event_award[var_1_0.award[iter_1_2]].drop_client,
			award_pay = pg.black_friday_battlepass_event_award[var_1_0.award_pay[iter_1_2]].drop_client,
			isImportent = var_1_3[iter_1_2]
		})
	end

	local var_1_4 = arg_1_0.data1
	local var_1_5 = arg_1_0.data2 == 1
	local var_1_6 = {}

	for iter_1_4, iter_1_5 in ipairs(arg_1_0.data1_list) do
		var_1_6[iter_1_5] = true
	end

	local var_1_7 = {}

	for iter_1_6, iter_1_7 in ipairs(arg_1_0.data2_list) do
		var_1_7[iter_1_7] = true
	end

	local var_1_8 = 0

	for iter_1_8, iter_1_9 in ipairs(var_1_2) do
		if var_1_4 < iter_1_9.pt then
			break
		else
			var_1_8 = iter_1_8
		end
	end

	return {
		ptId = var_1_1,
		awardList = var_1_2,
		pt = var_1_4,
		isPay = var_1_5,
		awardDic = var_1_6,
		awardPayDic = var_1_7,
		phase = var_1_8
	}
end

function var_0_0.GetHei5UnreceiveAward(arg_2_0)
	local var_2_0 = pg.black_friday_battlepass_event_pt[arg_2_0.id]
	local var_2_1 = {}
	local var_2_2 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.data1_list) do
		var_2_2[iter_2_1] = true
	end

	for iter_2_2, iter_2_3 in ipairs(var_2_0.target) do
		if iter_2_3 > arg_2_0.data1 then
			break
		elseif not var_2_2[iter_2_3] then
			table.insert(var_2_1, Drop.Create(pg.black_friday_battlepass_event_award[var_2_0.award[iter_2_2]].drop_client))
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
			table.insert(var_2_1, Drop.Create(pg.black_friday_battlepass_event_award[var_2_0.award_pay[iter_2_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_2_1)
end

function var_0_0.GetUpdateToastData(arg_3_0, arg_3_1)
	local var_3_0 = pg.black_friday_battlepass_event_pt[arg_3_0.id]
	local var_3_1 = var_3_0.target

	if arg_3_1 and arg_3_1.data1 < var_3_1[#var_3_1] and arg_3_0.data1 - arg_3_1.data1 > 0 then
		return {
			ptId = var_3_0.pt,
			ptCount = arg_3_0.data1 - arg_3_1.data1
		}
	end
end

function var_0_0.SyncAwardRecords(arg_4_0, arg_4_1)
	arg_4_0.data1_list = {}
	arg_4_1 = arg_4_1 or pg.black_friday_battlepass_event_pt[arg_4_0.id]

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.target) do
		if iter_4_1 <= arg_4_0.data1 then
			table.insert(arg_4_0.data1_list, iter_4_1)
		else
			break
		end
	end

	if arg_4_0.data2 == 1 then
		arg_4_0.data2_list = underscore.rest(arg_4_0.data1_list, 1)
	else
		arg_4_0.data2_list = {}
	end
end

function var_0_0.AddAwardRecord(arg_5_0, arg_5_1)
	if not table.contains(arg_5_0.data1_list, arg_5_1) then
		table.insert(arg_5_0.data1_list, arg_5_1)
	end
end

function var_0_0.AddPayAwardRecord(arg_6_0, arg_6_1)
	if not table.contains(arg_6_0.data2_list, arg_6_1) then
		table.insert(arg_6_0.data2_list, arg_6_1)
	end
end

return var_0_0

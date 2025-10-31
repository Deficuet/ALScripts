local var_0_0 = class("CityRebuildProxy", import(".NetProxy"))

var_0_0.GET_DATA = 1
var_0_0.REBUILD_OR_START_RECRUIT = 2
var_0_0.END_RECRUIT = 3
var_0_0.UPGRADE_BUFF = 4
var_0_0.RESULT = 5
var_0_0.CHOOSE_LEVEL = 6
var_0_0.INIT_TIME = 7

local var_0_1 = pg.activity_ninja_building

function var_0_0.register(arg_1_0)
	arg_1_0.cityRebuildDataDic = {}
end

function var_0_0.SetData(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.cityRebuildDataDic[arg_2_1] = CityRebuildData.New(arg_2_2)
end

function var_0_0.GetData(arg_3_0, arg_3_1)
	return arg_3_0.cityRebuildDataDic[arg_3_1]
end

function var_0_0.Adjust(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_0.cityRebuildDataDic[arg_4_1]

	if not var_4_0 then
		return
	end

	var_4_0:Adjust(arg_4_2)
end

function var_0_0.RebuildOrStartRecruit(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.cityRebuildDataDic[arg_5_1]

	if not var_5_0 then
		return
	end

	if var_0_1[arg_5_2].type == 1 then
		var_5_0:RebuildDone(arg_5_2)
	else
		var_5_0:StartRecruit(arg_5_2)
	end
end

function var_0_0.RecruitDone(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.cityRebuildDataDic[arg_6_1]

	if not var_6_0 then
		return
	end

	var_6_0:RecruitDone(arg_6_2)
end

function var_0_0.UpgradeBuff(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_0.cityRebuildDataDic[arg_7_1]

	if not var_7_0 then
		return
	end

	var_7_0:UpgradeBuff(arg_7_2, arg_7_3)
end

function var_0_0.Result(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.cityRebuildDataDic[arg_8_1]

	if not var_8_0 then
		return
	end

	var_8_0:Result(arg_8_2)
end

function var_0_0.UpdateChooseLevel(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.cityRebuildDataDic[arg_9_1]

	if not var_9_0 then
		return
	end

	var_9_0:UpdateChooseLevel(arg_9_2)
end

function var_0_0.ComsumePt(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.cityRebuildDataDic[arg_10_1]

	if not var_10_0 then
		return
	end

	var_10_0:ConsumePt(arg_10_2)
end

function var_0_0.AddPt(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.cityRebuildDataDic[arg_11_1]

	if not var_11_0 then
		return
	end

	var_11_0:AddPt(arg_11_2)
end

return var_0_0

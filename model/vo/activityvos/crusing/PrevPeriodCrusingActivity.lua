local var_0_0 = class("PrevPeriodCrusingActivity", import(".CrusingActivity"))

function var_0_0.StaticExistPrevPeriodCrusingActivity()
	local var_1_0 = getProxy(ActivityProxy)

	if not var_1_0 then
		return false
	end

	local var_1_1 = var_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_1_1 and not var_1_1:isEnd() then
		local var_1_2 = var_1_1:GetPreviousPeriodAct()

		if var_1_2 and var_1_2:CanRecharge() then
			return true, var_1_2.id
		end
	end

	return false
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.crusingActivity = arg_2_2
	arg_2_0.id = arg_2_1
	arg_2_0.configId = arg_2_0.id

	arg_2_0:SynCrusingActivity(arg_2_2)
end

function var_0_0.CanRecharge(arg_3_0)
	local var_3_0 = pg.gameset.last_worldcruise_pay.key_value
	local var_3_1 = arg_3_0:GetCrusingInfo()

	return var_3_1 and not var_3_1.isPay and var_3_0 <= var_3_1.phase
end

function var_0_0.SynCrusingActivity(arg_4_0, arg_4_1)
	arg_4_1 = arg_4_1 or arg_4_0.crusingActivity
	arg_4_0.stopTime = arg_4_1.stopTime
	arg_4_0.data1 = arg_4_1.data3
	arg_4_0.data2 = arg_4_1.data4
	arg_4_0.data3 = 0
	arg_4_0.data4 = 0
	arg_4_0.str_data1 = ""
	arg_4_0.data1_list = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_1.data3_list or {}) do
		table.insert(arg_4_0.data1_list, iter_4_1)
	end

	arg_4_0.data2_list = {}

	for iter_4_2, iter_4_3 in ipairs(arg_4_1.data4_list or {}) do
		table.insert(arg_4_0.data2_list, iter_4_3)
	end

	arg_4_0.data3_list = {}
	arg_4_0.data4_list = {}
	arg_4_0.data1KeyValueList = {}
	arg_4_0.buffList = {}
	arg_4_0.clientData1 = 0
end

function var_0_0.RevertSynCrusingActivity(arg_5_0)
	local var_5_0 = arg_5_0.crusingActivity

	var_5_0.data3 = arg_5_0.data1
	var_5_0.data4 = arg_5_0.data2
	var_5_0.data3_list = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.data1_list or {}) do
		table.insert(var_5_0.data3_list, iter_5_1)
	end

	var_5_0.data4_list = {}

	for iter_5_2, iter_5_3 in ipairs(arg_5_0.data2_list or {}) do
		table.insert(var_5_0.data4_list, iter_5_3)
	end
end

return var_0_0

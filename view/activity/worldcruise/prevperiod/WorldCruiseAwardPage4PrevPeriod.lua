local var_0_0 = class("WorldCruiseAwardPage4PrevPeriod", import("..pages.WorldCruiseAwardPage"))

function var_0_0.getUIName(arg_1_0)
	return "WorldCruiseAwardPage4PrevPeriod"
end

function var_0_0.UpdateActivity(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING):GetPreviousPeriodAct()

	arg_2_0.activity = var_2_0

	assert(var_2_0, "prev period crusing activity is nil")

	for iter_2_0, iter_2_1 in pairs(var_2_0:GetCrusingInfo()) do
		arg_2_0[iter_2_0] = iter_2_1
	end
end

function var_0_0.Flush(arg_3_0)
	arg_3_0:UpdateActivity()
	var_0_0.super.Flush(arg_3_0, nil)
end

return var_0_0

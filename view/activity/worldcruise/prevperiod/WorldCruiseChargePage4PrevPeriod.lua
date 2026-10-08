local var_0_0 = class("WorldCruiseChargePage4PrevPeriod", import("..pages.WorldCruiseChargePage"))

function var_0_0.getUIName(arg_1_0)
	return "WorldCruiseChargePage4PrevPeriod"
end

function var_0_0.GetPassId(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_2_0 and not var_2_0:isEnd() then
		local var_2_1 = var_2_0:GetPreviousPeriodAct()

		assert(var_2_1, "prev period crusing activity is nil")

		for iter_2_0, iter_2_1 in ipairs(pg.pay_data_display.all) do
			local var_2_2 = pg.pay_data_display[iter_2_1]

			if var_2_2.sub_display and type(var_2_2.sub_display) == "table" and var_2_2.sub_display[1] == var_2_1.id then
				return iter_2_1
			end
		end
	end

	return nil
end

return var_0_0

local var_0_0 = class("ActivityRemasterInfoWithoutTextDisplayPage", import(".ActivityRemasterInfoDisplayPage"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityRemasterInfoWithoutTextDisplayPage"
end

function var_0_0.OpenDesc(arg_2_0, arg_2_1)
	arg_2_0.awardPage:ExecuteAction("Show", arg_2_1)
end

return var_0_0

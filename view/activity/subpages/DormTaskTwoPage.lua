local var_0_0 = class("DormTaskTwoPage", import("view.activity.subPages.DormTaskPage"))

function var_0_0.getResource(arg_1_0)
	return {
		"ui/activityuipage/dormtasktwopage_atlas"
	}
end

function var_0_0.GetBgParams(arg_2_0)
	return arg_2_0.bg, "ui/activityuipage/dormtasktwopage_atlas", "bg"
end

return var_0_0

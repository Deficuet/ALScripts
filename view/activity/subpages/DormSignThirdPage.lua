local var_0_0 = class("DormSignThirdPage", import("view.activity.subPages.DormSignTwoPage"))

function var_0_0.getResource(arg_1_0)
	return {
		"ui/activityuipage/dormsignthirdpage_atlas"
	}
end

function var_0_0.getUIName(arg_2_0)
	return "DormSignThirdPage"
end

function var_0_0.GetBgParams(arg_3_0)
	return arg_3_0.bg:Find("bg"), "ui/activityuipage/dormsignthirdpage_atlas", "bg"
end

return var_0_0

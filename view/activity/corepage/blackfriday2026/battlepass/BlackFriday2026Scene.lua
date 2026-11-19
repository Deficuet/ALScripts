local var_0_0 = class("BlackFriday2026Scene", import("view.activity.CorePage.PSS.Hei5.PSSHei5Scene"))

function var_0_0.getUIName(arg_1_0)
	return "BlackFriday2026UI"
end

function var_0_0.initTplVar(arg_2_0)
	var_0_0.super.initTplVar(arg_2_0)

	arg_2_0.awardPageCls = BlackFriday2026AwardPage
	arg_2_0.taskPageCls = BlackFriday2026TaskPage
	arg_2_0.chargePageCls = BlackFriday2026ChargePage
end

return var_0_0

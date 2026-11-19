local var_0_0 = class("BlackFriday2026TaskPage", import("view.activity.CorePage.PSS.Hei5.PSSHei5TaskPage"))

function var_0_0.getUIName(arg_1_0)
	return "BlackFriday2026TaskPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0:initTplVar()
	arg_2_0:UpdateActivity()

	local var_2_0 = arg_2_0._tf:Find("frame")

	arg_2_0.togglesTF = var_2_0:Find("week_list")
	arg_2_0.toggleCount = arg_2_0.togglesTF:Find("count")

	local var_2_1 = var_2_0:Find("view/content")
	local var_2_2 = var_2_1:Find("tpl")

	setText(var_2_2:Find("info/go/Text"), i18n(arg_2_0.btnGoText))
	setText(var_2_2:Find("info/get/Text"), i18n(arg_2_0.btnGetText))
	setText(var_2_2:Find("info/got/Image/Text"), i18n("task_got"))

	arg_2_0.taskGroupItemList = UIItemList.New(var_2_1, var_2_2)
end

return var_0_0

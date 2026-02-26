local var_0_0 = class("MoscowURCoreActivityUI", import("view.activity.CorePage.Helena.HelenaCoreActivityUI"))

function var_0_0.getUIName(arg_1_0)
	return "MoscowURCoreActivityUI"
end

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)

	arg_2_0.topPage = arg_2_0._tf:Find("adapt/TopPage")

	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text"), i18n("HelenaCoreActivity_title"))
	setText(arg_2_0._tf:Find("adapt/TopPage/top/deco/Text/Text_1"), i18n("HelenaCoreActivity_title2"))
end

function var_0_0.verifyTabs(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.activities[arg_3_0:getActivityIndex(arg_3_1) or arg_3_0:getActivityIndex(arg_3_0:GetActiveActivity()) or 1]

	if var_3_0 == nil then
		return
	end

	local var_3_1 = var_3_0:getConfig("is_show")
	local var_3_2 = arg_3_0.tabs:Find(tostring(var_3_1))

	triggerToggle(var_3_2, true)
end

function var_0_0.OnAnimations(arg_4_0, arg_4_1, arg_4_2)
	SetActive(arg_4_0._tf:Find("adapt/decorate"), id == 50261 or id == 0)
end

function var_0_0.OnToggleName(arg_5_0, arg_5_1, arg_5_2)
	setText(arg_5_1:Find("name"), i18n(arg_5_2:getConfig("title_res_tag")))
end

function var_0_0.willExit(arg_6_0)
	var_0_0.super.willExit(arg_6_0)
end

return var_0_0

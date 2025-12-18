local var_0_0 = class("WinterFestival2025CoreActivityUI", import("view.activity.CorePage.CoreAdaptActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "WinterFestival2025CoreActivityUI"
end

function var_0_0.GetButtonNameText(arg_2_0, arg_2_1)
	if arg_2_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_POOL then
		return i18n(arg_2_1:getConfig("title_res_tag"))
	end

	return (i18n("general_activity_side_bar" .. arg_2_1:getConfig("is_show")))
end

function var_0_0.didEnter(arg_3_0)
	var_0_0.super.didEnter(arg_3_0)

	if arg_3_0.contextData.actID then
		arg_3_0:verifyTabs(arg_3_0.contextData.actID)
	end
end

return var_0_0

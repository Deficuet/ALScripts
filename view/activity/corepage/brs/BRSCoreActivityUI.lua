local var_0_0 = class("BRSCoreActivityUI", import("view.activity.CorePage.CoreActivityMainScene"))

function var_0_0.getUIName(arg_1_0)
	return "BRSCoreActivityUI"
end

function var_0_0.init(arg_2_0, ...)
	var_0_0.super.init(arg_2_0, ...)
	setText(arg_2_0._tf:Find("adapt/top/btn_home/text_tip/Text (Legacy)"), i18n("brs_main_tip"))
end

return var_0_0

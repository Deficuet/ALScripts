local var_0_0 = class("WinterFestival2025Scene", import("...PSS.Hei5.PSSHei5Scene"))

function var_0_0.getUIName(arg_1_0)
	return "WinterFestival2025UI"
end

function var_0_0.initTplVar(arg_2_0)
	arg_2_0.helpBtnTip = "battlepass_main_help_1211"
	arg_2_0.awardPageCls = WinterFestival2025AwardPage
	arg_2_0.taskPageCls = WinterFestival2025TaskPage
	arg_2_0.chargePageCls = WinterFestival2025CruiseChargePage
	arg_2_0.dayTextTip = "winter_battlepass_main_time_title"
	arg_2_0.titleTextTip = "winter_cruise_title_1211"
	arg_2_0.rewardTip = "winter_battlepass_rewards"
	arg_2_0.missionTip = "winter_battlepass_mission"

	local var_2_0 = arg_2_0._tf:Find("frame/phase/btn_pay/Text")

	setText(var_2_0, i18n("winter_cruise_btn_pay"))

	local var_2_1 = arg_2_0._tf:Find("frame/phase/AwardTipText")

	setText(var_2_1, i18n("winter_cruise_pay_reward"))
end

return var_0_0

local var_0_0 = class("ActivityBossAmatsukazeScene", import(".ActivityBossGoriziaScene"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityBossAmatsukazeUI"
end

function var_0_0.init(arg_2_0)
	var_0_0.super.init(arg_2_0)
	onButton(arg_2_0, arg_2_0.top:Find("TopPage/top/btn_back"), function()
		arg_2_0:emit(var_0_0.ON_BACK)
	end, SOUND_BACK)
	onButton(arg_2_0, arg_2_0.top:Find("TopPage/top/btn_home"), function()
		arg_2_0.event:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	setText(arg_2_0.top:Find("TopPage/top/deco/Text"), i18n("event_worldboss_0827_title"))
	setText(arg_2_0.top:Find("TopPage/top/deco/Text/Text_1"), i18n("event_worldboss_0827_title_en"))
	setText(arg_2_0.top:Find("ticket/Desc"), i18n("word_special_challenge_ticket"))
end

return var_0_0

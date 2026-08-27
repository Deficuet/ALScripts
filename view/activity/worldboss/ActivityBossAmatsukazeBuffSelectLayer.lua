local var_0_0 = class("ActivityBossAmatsukazeBuffSelectLayer", import(".ActivityBossBuffSelectLayerTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "ActivityBossAmatsukazeBuffSelectUI"
end

function var_0_0.init(arg_2_0)
	var_0_0.super.init(arg_2_0)
	setText(arg_2_0.top:Find("TopPage/top/deco/Text"), i18n("event_worldboss_0827_title"))
	setText(arg_2_0.top:Find("TopPage/top/deco/Text/Text_1"), i18n("event_worldboss_0827_title_en"))
end

function var_0_0.didEnter(arg_3_0)
	var_0_0.super.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.top:Find("TopPage/top/btn_back"), function()
		arg_3_0:closeView()
	end, SOUND_BACK)
	onButton(arg_3_0, arg_3_0.top:Find("TopPage/top/btn_home"), function()
		arg_3_0.event:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
end

return var_0_0

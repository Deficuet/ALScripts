local var_0_0 = class("AnniversaryIslandAwardLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AnniversaryIslandAwardUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.window = arg_2_0._tf:Find("Window")

	setText(arg_2_0.window:Find("Text"), i18n("expedition_award_tip"))

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.window:Find("Receive"), function()
		arg_3_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("BG"), function()
		arg_3_0:onBackPressed()
	end)

	arg_3_0.awards = _.select(arg_3_0.contextData.items or {}, function(arg_6_0)
		return arg_6_0.type ~= DROP_TYPE_ICON_FRAME and arg_6_0.type ~= DROP_TYPE_CHAT_FRAME and arg_6_0.type ~= DROP_TYPE_LIVINGAREA_COVER
	end)

	local var_3_0 = UIItemList

	var_3_0.StaticAlign(arg_3_0.window:Find("Materials"), arg_3_0.window:Find("Materials"):GetChild(0), #arg_3_0.awards, function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 ~= var_3_0.EventUpdate then
			return
		end

		local var_7_0 = arg_3_0.awards[arg_7_1 + 1]

		AnniversaryIslandComposite2023Scene.UpdateActivityDrop(arg_3_0, arg_7_2:Find("Icon"), var_7_0)
		onButton(arg_3_0, arg_7_2:Find("Icon"), function()
			arg_3_0:emit(var_0_0.ON_DROP, var_7_0)
		end)
		setText(arg_7_2:Find("Text"), var_7_0.count)
	end)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.willExit(arg_9_0)
	arg_9_0.loader:Clear()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._tf)
end

return var_0_0

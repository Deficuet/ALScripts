local var_0_0 = class("CrusingWindowLayer2", import("view.activity.CrusingWindowLayer"))

function var_0_0.getUIName(arg_1_0)
	return "CrusingWindowUI2"
end

function var_0_0.init(arg_2_0)
	setImageSprite(arg_2_0._tf:Find("panel"), arg_2_0.windowSprite, true)

	arg_2_0.rtBg = arg_2_0._tf:Find("bg")
	arg_2_0.btnGo = arg_2_0._tf:Find("panel/btn_go")

	setText(arg_2_0.btnGo:Find("Text"), i18n("cruise_tip_skin"))

	arg_2_0.itemContent = arg_2_0._tf:Find("panel/content")

	local var_2_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)
	local var_2_1 = pg.battlepass_event_pt[var_2_0.id].equip_skin or {}

	arg_2_0.itemList = UIItemList.New(arg_2_0.itemContent, arg_2_0.itemContent:GetChild(0))

	arg_2_0.itemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		arg_3_1 = arg_3_1 + 1

		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = Drop.Create(var_2_1[arg_3_1])

			updateDrop(arg_3_2:Find("IconTpl"), var_3_0)
			onButton(arg_2_0, arg_3_2, function()
				arg_2_0:emit(var_0_0.ON_DROP, var_3_0)
			end, SFX_PANEL)
		end
	end)
	arg_2_0.itemList:align(#var_2_1)
end

function var_0_0.didEnter(arg_5_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_5_0._tf)
	onButton(arg_5_0, arg_5_0.rtBg, function()
		arg_5_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0.btnGo, function()
		arg_5_0:emit(CrusingWindowMediator.GO_CRUSING)
	end, SFX_CONFIRM)
end

return var_0_0

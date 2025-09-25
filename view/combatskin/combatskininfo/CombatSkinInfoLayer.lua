local var_0_0 = class("CombatSkinInfoLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CombatSkinInfoUI"
end

function var_0_0.init(arg_2_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)

	arg_2_0.closeBtn = arg_2_0:findTF("display/top/btnBack")
	arg_2_0.confirm = arg_2_0:findTF("display/actions/confirm")
	arg_2_0.skinViewTF = arg_2_0:findTF("display")
	arg_2_0.toggleList = UIItemList.New(arg_2_0:findTF("display/info/display_panel/combat_skin/elementList"), arg_2_0:findTF("display/info/display_panel/combat_skin/elementList/main"))
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SOUND_BACK)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0.confirm, function()
		arg_3_0:emit(var_0_0.ON_CLOSE)
	end, SFX_PANEL)
	arg_3_0:InitPanel()
end

function var_0_0.InitPanel(arg_7_0)
	local var_7_0 = arg_7_0.contextData.skinID
	local var_7_1 = pg.item_data_battleui[var_7_0]
	local var_7_2 = arg_7_0:findTF("info/display_panel/name_container/name", arg_7_0.skinViewTF)
	local var_7_3 = arg_7_0:findTF("info/display_panel/desc/Text", arg_7_0.skinViewTF)

	setText(var_7_2, var_7_1.name)
	setText(var_7_3, var_7_1.desc)

	local var_7_4 = var_7_1.rare_display

	arg_7_0.toggleList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = var_7_4[arg_8_1 + 1]

			GetImageSpriteFromAtlasAsync("ui/combatskinrare", CombatSkinConst.TYPE_ICON_NAME[var_8_0], arg_8_2:Find("icon"), true)
			setScrollText(arg_8_2:Find("TextMask/Text"), i18n("battleui_display" .. var_8_0))
		end
	end)
	arg_7_0.toggleList:align(#var_7_4)

	local var_7_5 = arg_7_0:findTF("info/play_btn", arg_7_0.skinViewTF)

	onButton(arg_7_0, var_7_5, function()
		arg_7_0.combatPreview = CombatPreviewLayer.New(pg.UIMgr.GetInstance().OverlayMain)

		arg_7_0.combatPreview:ExecuteAction("Show", var_7_0, function()
			arg_7_0.combatPreview:Destroy()

			arg_7_0.combatPreview = nil
		end)
	end, SPX_PANEL)
	updateDrop(arg_7_0:findTF("info/equip", arg_7_0.skinViewTF), Drop.New({
		count = 1,
		type = DROP_TYPE_COMBAT_UI_STYLE,
		id = var_7_0
	}))
end

function var_0_0.willExit(arg_11_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf)
end

function var_0_0.onBackPressed(arg_12_0)
	if arg_12_0.combatPreview then
		arg_12_0.combatPreview:Destroy()

		arg_12_0.combatPreview = nil
	else
		var_0_0.super.onBackPressed(arg_12_0)
	end
end

return var_0_0

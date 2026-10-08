local var_0_0 = class("CrusingWindowLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CrusingWindowUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	GetSpriteFromAtlasAsync("crusingwindow/map_20" .. pg.battlepass_event_pt[var_2_0.id].map_name, "", function(arg_3_0)
		arg_2_0.windowSprite = arg_3_0

		arg_2_1()
	end)
end

function var_0_0.getResource(arg_4_0)
	local var_4_0 = var_0_0.super.getResource(arg_4_0)
	local var_4_1 = {
		"crusingwindow"
	}

	for iter_4_0, iter_4_1 in ipairs(var_4_1 or {}) do
		if not table.contains(var_4_0, iter_4_1) then
			table.insert(var_4_0, iter_4_1)
		end
	end

	return var_4_0
end

function var_0_0.init(arg_5_0)
	setImageSprite(arg_5_0._tf:Find("panel"), arg_5_0.windowSprite, true)

	arg_5_0.rtBg = arg_5_0._tf:Find("bg")
	arg_5_0.btnBack = arg_5_0._tf:Find("panel/btn_back")
	arg_5_0.btnGo = arg_5_0._tf:Find("panel/btn_go")
	arg_5_0.itemContent = arg_5_0._tf:Find("panel/content")

	local var_5_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)
	local var_5_1 = pg.battlepass_event_pt[var_5_0.id].equip_skin or {}

	arg_5_0.itemList = UIItemList.New(arg_5_0.itemContent, arg_5_0.itemContent:GetChild(0))

	arg_5_0.itemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		arg_6_1 = arg_6_1 + 1

		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = {}

			var_6_0.type, var_6_0.id, var_6_0.count = unpack(var_5_1[arg_6_1])

			updateDrop(arg_6_2, var_6_0)
			onButton(arg_5_0, arg_6_2, function()
				arg_5_0:emit(var_0_0.ON_DROP, var_6_0)
			end, SFX_PANEL)
		end
	end)
	arg_5_0.itemList:align(#var_5_1)
end

function var_0_0.didEnter(arg_8_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_8_0._tf)
	onButton(arg_8_0, arg_8_0.rtBg, function()
		arg_8_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.btnBack, function()
		arg_8_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0.btnGo, function()
		arg_8_0:emit(CrusingWindowMediator.GO_CRUSING)
	end, SFX_CONFIRM)
end

function var_0_0.willExit(arg_12_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_12_0._tf)
end

return var_0_0

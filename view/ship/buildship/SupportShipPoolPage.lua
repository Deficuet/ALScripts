local var_0_0 = class("SupportShipPoolPage", import("...base.BaseSubView"))

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = pg.gametip.honor_medal_support_tips_display.tip

	if var_1_1 and noEmptyStr(var_1_1.bg) then
		table.insert(var_1_0, var_1_1.bg)
	end

	local var_1_2 = arg_1_0.contextData and arg_1_0.contextData.falgShip or getProxy(BayProxy):getShipById(getProxy(PlayerProxy):getData().character)

	if var_1_2 then
		table.insertto(var_1_0, ResPathSupport.GetPaintingListByPaintingName(var_1_2:getPainting()))
	end

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_2_0)
	return "SupportShipPoolPageUI"
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.medalCount = arg_3_0._tf:Find("gallery/res_items/medal")
	arg_3_0.patingTF = arg_3_0._tf:Find("painting")
	arg_3_0.bg = arg_3_0._tf:Find("gallery/bg")
	arg_3_0.tipSTxt = arg_3_0.bg:Find("type_intro/mask/title"):GetComponent("ScrollText")
	arg_3_0.shopBtn = arg_3_0._tf:Find("gallery/shop_btn")
	arg_3_0.helpBtn = arg_3_0._tf:Find("gallery/help_btn")
	arg_3_0.startBtn = arg_3_0._tf:Find("gallery/start_btn")
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0.shopBtn, function()
		arg_4_0:emit(BuildShipMediator.ON_SUPPORT_SHOP)
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_6_0)
	arg_6_0:UpdateMedal()

	local var_6_0 = getProxy(BuildShipProxy):getSupportShipCost()
	local var_6_1 = pg.gametip.honor_medal_support_tips_display.tip

	setText(arg_6_0._tf:Find("gallery/prints/intro/text"), var_6_1.support_tip_consume)
	setImageSprite(arg_6_0.bg, GetSpriteFromAtlas(var_6_1.bg, ""))

	local var_6_2 = var_6_1.support_tip_ship

	arg_6_0.tipSTxt:SetText(var_6_2)

	local var_6_3 = arg_6_0._tf:Find("gallery/item_bg/medal")

	setText(var_6_3:Find("name"), Drop.New({
		type = DROP_TYPE_ITEM,
		id = ITEM_ID_SILVER_HOOK
	}):getName())
	setText(var_6_3:Find("count/Text"), var_6_0)
	arg_6_0:UpdateBuildPoolPaiting()
	onButton(arg_6_0, arg_6_0.helpBtn, function()
		arg_6_0.contextData.helpWindow:ExecuteAction("Show", var_6_1, "support")
	end, SFX_CANCEL)

	local var_6_4 = getProxy(BagProxy)

	onButton(arg_6_0, arg_6_0.startBtn, function()
		local var_8_0 = {
			buildType = "medal",
			itemVO = Item.New({
				id = ITEM_ID_SILVER_HOOK,
				count = var_6_4:getItemCountById(ITEM_ID_SILVER_HOOK)
			}),
			cost = var_6_0,
			max = MAX_BUILD_WORK_COUNT,
			onConfirm = function(arg_9_0)
				arg_6_0:emit(BuildShipMediator.ON_SUPPORT_EXCHANGE, arg_9_0)
			end
		}

		arg_6_0.contextData.msgbox:ExecuteAction("Show", var_8_0)
	end, SFX_UI_BUILDING_STARTBUILDING)
end

function var_0_0.UpdateMedal(arg_10_0)
	setText(arg_10_0.medalCount:Find("Text"), getProxy(BagProxy):getItemCountById(ITEM_ID_SILVER_HOOK))
end

function var_0_0.UpdateBuildPoolPaiting(arg_11_0)
	local var_11_0 = arg_11_0.contextData.falgShip:getPainting()

	if arg_11_0.painting ~= var_11_0 then
		pg.UIMgr.GetInstance():LoadingOn()
		setPaintingPrefabAsync(arg_11_0.patingTF, var_11_0, "build", function()
			arg_11_0.painting = var_11_0

			pg.UIMgr.GetInstance():LoadingOff()
		end)
	end
end

function var_0_0.ShowOrHide(arg_13_0, arg_13_1)
	if arg_13_1 then
		arg_13_0:Show()
	else
		arg_13_0:Hide()
	end
end

function var_0_0.OnDestroy(arg_14_0)
	return
end

return var_0_0

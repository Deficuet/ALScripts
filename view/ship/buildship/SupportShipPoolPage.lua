local var_0_0 = class("SupportShipPoolPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "SupportShipPoolPageUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.medalCount = arg_2_0._tf:Find("gallery/res_items/medal")
	arg_2_0.patingTF = arg_2_0:findTF("painting")
	arg_2_0.bg = arg_2_0:findTF("gallery/bg")
	arg_2_0.tipSTxt = arg_2_0.bg:Find("type_intro/mask/title"):GetComponent("ScrollText")
	arg_2_0.shopBtn = arg_2_0._tf:Find("gallery/shop_btn")
	arg_2_0.helpBtn = arg_2_0:findTF("gallery/help_btn")
	arg_2_0.startBtn = arg_2_0:findTF("gallery/start_btn")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.shopBtn, function()
		arg_3_0:emit(BuildShipMediator.ON_SUPPORT_SHOP)
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_5_0)
	arg_5_0:UpdateMedal()

	local var_5_0 = getProxy(BuildShipProxy):getSupportShipCost()
	local var_5_1 = pg.gametip.honor_medal_support_tips_display.tip

	setText(arg_5_0:findTF("gallery/prints/intro/text"), var_5_1.support_tip_consume)
	setImageSprite(arg_5_0.bg, GetSpriteFromAtlas(var_5_1.bg, ""))

	local var_5_2 = var_5_1.support_tip_ship

	arg_5_0.tipSTxt:SetText(var_5_2)

	local var_5_3 = arg_5_0:findTF("gallery/item_bg/medal")

	setText(var_5_3:Find("name"), Drop.New({
		type = DROP_TYPE_ITEM,
		id = ITEM_ID_SILVER_HOOK
	}):getName())
	setText(var_5_3:Find("count/Text"), var_5_0)
	arg_5_0:UpdateBuildPoolPaiting()
	onButton(arg_5_0, arg_5_0.helpBtn, function()
		arg_5_0.contextData.helpWindow:ExecuteAction("Show", var_5_1, "support")
	end, SFX_CANCEL)

	local var_5_4 = getProxy(BagProxy)

	onButton(arg_5_0, arg_5_0.startBtn, function()
		local var_7_0 = {
			buildType = "medal",
			itemVO = Item.New({
				id = ITEM_ID_SILVER_HOOK,
				count = var_5_4:getItemCountById(ITEM_ID_SILVER_HOOK)
			}),
			cost = var_5_0,
			max = MAX_BUILD_WORK_COUNT,
			onConfirm = function(arg_8_0)
				arg_5_0:emit(BuildShipMediator.ON_SUPPORT_EXCHANGE, arg_8_0)
			end
		}

		arg_5_0.contextData.msgbox:ExecuteAction("Show", var_7_0)
	end, SFX_UI_BUILDING_STARTBUILDING)
end

function var_0_0.UpdateMedal(arg_9_0)
	setText(arg_9_0.medalCount:Find("Text"), getProxy(BagProxy):getItemCountById(ITEM_ID_SILVER_HOOK))
end

function var_0_0.UpdateBuildPoolPaiting(arg_10_0)
	local var_10_0 = arg_10_0.contextData.falgShip:getPainting()

	if arg_10_0.painting ~= var_10_0 then
		pg.UIMgr.GetInstance():LoadingOn()
		setPaintingPrefabAsync(arg_10_0.patingTF, var_10_0, "build", function()
			arg_10_0.painting = var_10_0

			pg.UIMgr.GetInstance():LoadingOff()
		end)
	end
end

function var_0_0.ShowOrHide(arg_12_0, arg_12_1)
	if arg_12_1 then
		arg_12_0:Show()
	else
		arg_12_0:Hide()
	end
end

function var_0_0.OnDestroy(arg_13_0)
	return
end

return var_0_0

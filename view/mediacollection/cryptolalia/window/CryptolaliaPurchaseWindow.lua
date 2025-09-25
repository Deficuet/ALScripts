local var_0_0 = class("CryptolaliaPurchaseWindow", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "CryptolaliaPurchaseWindowui"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.icon = arg_2_0:findTF("window/cover/icon"):GetComponent(typeof(Image))
	arg_2_0.signature = arg_2_0:findTF("window/cover/signature"):GetComponent(typeof(Image))
	arg_2_0.name = arg_2_0:findTF("window/cover/name"):GetComponent(typeof(Text))
	arg_2_0.shipname = arg_2_0:findTF("window/cover/shipname"):GetComponent(typeof(Text))
	arg_2_0.gemToggle = arg_2_0:findTF("window/gem")
	arg_2_0.ticketToggle = arg_2_0:findTF("window/ticket")
	arg_2_0.gemCntTxt = arg_2_0.gemToggle:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.ticketCntTxt = arg_2_0.ticketToggle:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.exchangeBtn = arg_2_0:findTF("exchange")

	setText(arg_2_0.gemToggle:Find("title"), i18n("cryptolalia_use_gem_title"))
	setText(arg_2_0.ticketToggle:Find("title"), i18n("cryptolalia_use_ticket_title"))
	setText(arg_2_0.exchangeBtn:Find("Text"), i18n("cryptolalia_exchange"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)

	arg_3_0.costType = Cryptolalia.COST_TYPE_GEM

	onToggle(arg_3_0, arg_3_0.gemToggle, function(arg_5_0)
		if arg_5_0 then
			arg_3_0.costType = Cryptolalia.COST_TYPE_GEM
		end
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.ticketToggle, function(arg_6_0)
		if arg_6_0 then
			arg_3_0.costType = Cryptolalia.COST_TYPE_TICKET
		end
	end, SFX_PANEL)
end

function var_0_0.Show(arg_7_0, arg_7_1)
	var_0_0.super.Show(arg_7_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf)
	triggerToggle(arg_7_0.gemToggle, true)

	arg_7_0.name.text = arg_7_1:GetName()
	arg_7_0.shipname.text = arg_7_1:GetShipName()

	local var_7_0 = arg_7_1:GetShipGroupId()

	LoadSpriteAtlasAsync("CryptolaliaShip/" .. var_7_0, "cd", function(arg_8_0)
		if arg_7_0.exited then
			return
		end

		arg_7_0.icon.sprite = arg_8_0

		arg_7_0.icon:SetNativeSize()
	end)
	onButton(arg_7_0, arg_7_0.exchangeBtn, function()
		if not arg_7_0.costType then
			return
		end

		arg_7_0:emit(CryptolaliaMediator.UNLOCK, arg_7_1.id, arg_7_0.costType)
	end, SFX_PANEL)

	local var_7_1 = arg_7_1:GetCost(Cryptolalia.COST_TYPE_GEM)
	local var_7_2 = getProxy(PlayerProxy):getRawData()
	local var_7_3 = var_7_2:getResource(var_7_1.id)
	local var_7_4 = var_7_3 < var_7_1.count and COLOR_RED or COLOR_GREEN

	arg_7_0.gemCntTxt.text = setColorStr(var_7_3, var_7_4) .. setColorStr("/" .. var_7_1.count, "#AFAFAF")

	local var_7_5 = arg_7_1:GetCost(Cryptolalia.COST_TYPE_TICKET)
	local var_7_6 = var_7_2:getResource(var_7_5.id)
	local var_7_7 = var_7_6 < var_7_5.count and COLOR_RED or COLOR_GREEN

	arg_7_0.ticketCntTxt.text = setColorStr(var_7_6, var_7_7) .. setColorStr("/" .. var_7_5.count, "#AFAFAF")

	triggerToggle(arg_7_0.ticketToggle, true)
end

function var_0_0.Hide(arg_10_0)
	var_0_0.super.Hide(arg_10_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0._tf, arg_10_0._parentTf)
end

function var_0_0.OnDestroy(arg_11_0)
	arg_11_0.exited = true
end

return var_0_0

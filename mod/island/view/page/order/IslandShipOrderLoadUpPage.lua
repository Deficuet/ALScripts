local var_0_0 = class("IslandShipOrderLoadUpPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipOrderLoadUpUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.mainTr = arg_2_0._tf:Find("main")
	arg_2_0.cntTxt = arg_2_0._tf:Find("main/name/count"):GetComponent(typeof(Text))
	arg_2_0.submitBtn = arg_2_0._tf:Find("main/btn/btn_1")
	arg_2_0.noResBtn = arg_2_0._tf:Find("main/btn/btn_2")
	arg_2_0.awardCntTxt = arg_2_0._tf:Find("main/price/Text"):GetComponent(typeof(Text))
	arg_2_0.nameTxt = arg_2_0._tf:Find("main/name"):GetComponent(typeof(Text))

	setText(arg_2_0._tf:Find("main/title/Text"), i18n("island_order_ship_loadup_award"))
	setText(arg_2_0._tf:Find("main/btn/btn_2/Text"), i18n("island_order_ship_loadup_nores"))
	setText(arg_2_0._tf:Find("main/btn/btn_1/Text"), i18n("island_order_ship_loadup"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:emit(IslandShipOrderPage.EVENT_CLOSE_LOAD_UP)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.submitBtn, function()
		if not arg_3_0.slot or not arg_3_0.index then
			return
		end

		arg_3_0:emit(IslandMediator.SUBMIT_SHIP_ORDER_ITME, arg_3_0.slot.id, arg_3_0.index)
	end, SFX_PANEL)
end

function var_0_0.Show(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	var_0_0.super.Show(arg_6_0)

	arg_6_0.slot = arg_6_2
	arg_6_0.index = arg_6_3
	arg_6_0.mainTr.localPosition = arg_6_1

	local var_6_0 = arg_6_2:GetOrder():GetComsume(arg_6_3)
	local var_6_1 = Drop.New(var_6_0)
	local var_6_2 = var_6_1:getOwnedCount()
	local var_6_3 = var_6_1.count
	local var_6_4 = var_6_3 <= var_6_2
	local var_6_5 = var_6_4 and "#39beff" or "#f36c6e"

	arg_6_0.cntTxt.text = setColorStr(var_6_2 .. "/" .. var_6_3, var_6_5)
	arg_6_0.nameTxt.text = var_6_1:getName()
	arg_6_0.awardCntTxt.text = "X" .. arg_6_2:GetOrder():GetConsumeAwards(arg_6_3)[1].count

	setActive(arg_6_0.submitBtn, var_6_4)
	setActive(arg_6_0.noResBtn, not var_6_4)
end

function var_0_0.OnDestroy(arg_7_0)
	return
end

return var_0_0

local var_0_0 = class("IslandOrderDescPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandOrderDescUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.infoPanel = arg_2_0:findTF("info")
	arg_2_0.nameTxt = arg_2_0:findTF("info/name/Text"):GetComponent(typeof(Text))
	arg_2_0.consumeUIList = UIItemList.New(arg_2_0:findTF("info/subtitle_item/list"), arg_2_0:findTF("info/subtitle_item/list/tpl"))
	arg_2_0.awardUIList = UIItemList.New(arg_2_0:findTF("info/subtitle_reward/list"), arg_2_0:findTF("info/subtitle_reward/list/tpl"))
	arg_2_0.submitBtn = arg_2_0:findTF("info/btns/submit")
	arg_2_0.submitBtnMark = arg_2_0:findTF("info/btns/submit/mask")
	arg_2_0.replaceBtn = arg_2_0:findTF("info/btns/cancel")
	arg_2_0.speedUpBtn = arg_2_0:findTF("loading/submit")
	arg_2_0.loadingPanel = arg_2_0:findTF("loading")
	arg_2_0.loadingTimeTxt = arg_2_0.loadingPanel:Find("Text/time"):GetComponent(typeof(Text))

	setText(arg_2_0:findTF("info/btns/cancel/Text"), i18n("island_word_turndown"))
	setText(arg_2_0:findTF("info/btns/submit/Text"), i18n("island_word_sbumit"))
	setText(arg_2_0:findTF("loading/Text"), i18n("island_order_cd_tip"))
	setText(arg_2_0:findTF("loading/submit/Text"), i18n("island_word_speedup"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.replaceBtn, function()
		arg_3_0:emit(IslandMediator.ON_REPLACE_ORDER, arg_3_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.submitBtn, function()
		local var_5_0, var_5_1 = getProxy(IslandProxy):GetIsland():GetOrderAgency():CanSubmitOrder()

		if not var_5_0 then
			local var_5_2 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_5_3 = pg.TimeMgr.GetInstance():DescCDTime(var_5_1 - var_5_2)

			pg.TipsMgr.GetInstance():ShowTips(i18n("island_submit_order_cd_tip", var_5_3))

			return
		end

		arg_3_0:emit(IslandMediator.ON_SUBMIT_ORDER, arg_3_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.speedUpBtn, function()
		return
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_7_0.OnSubmitOrder)
	arg_7_0:AddListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_7_0.OnReplaceOrder)
	arg_7_0:AddListener(IslandOrderAgency.GEN_NEW_ORDER, arg_7_0.OnGenNewOrder)
	arg_7_0:AddListener(IslandOrderAgency.UDPATE_ORDER, arg_7_0.OnFlushOrder)
end

function var_0_0.RemoveListener(arg_8_0)
	arg_8_0:RemoveListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_8_0.OnSubmitOrder)
	arg_8_0:RemoveListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_8_0.OnReplaceOrder)
	arg_8_0:RemoveListener(IslandOrderAgency.GEN_NEW_ORDER, arg_8_0.OnGenNewOrder)
	arg_8_0:RemoveListener(IslandOrderAgency.UDPATE_ORDER, arg_8_0.OnFlushOrder)
end

function var_0_0.OnSubmitOrder(arg_9_0, arg_9_1)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_9_1.slotId)

	arg_9_0:Flush(var_9_0)
end

function var_0_0.OnReplaceOrder(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_10_1.slotId)

	arg_10_0:Flush(var_10_0)
end

function var_0_0.OnFlushOrder(arg_11_0, arg_11_1)
	arg_11_0:TryFlushOrderInfo(arg_11_1.slotId)
end

function var_0_0.OnGenNewOrder(arg_12_0, arg_12_1)
	arg_12_0:TryFlushOrderInfo(arg_12_1.slotId)
end

function var_0_0.TryFlushOrderInfo(arg_13_0, arg_13_1)
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_13_1)

	if not arg_13_0.slot then
		return
	end

	if arg_13_0.slot.id ~= var_13_0.id then
		return
	end

	arg_13_0:Flush(var_13_0)
end

function var_0_0.Show(arg_14_0, arg_14_1)
	var_0_0.super.Show(arg_14_0)
	arg_14_0:Flush(arg_14_1)
end

function var_0_0.Flush(arg_15_0, arg_15_1)
	arg_15_0.slot = arg_15_1

	if not arg_15_1 or arg_15_1:IsEmpty() then
		arg_15_0:Hide()

		return
	end

	local var_15_0 = arg_15_1:IsLoading()

	setActive(arg_15_0.infoPanel, not var_15_0)
	setActive(arg_15_0.loadingPanel, var_15_0)
	arg_15_0:RemoveSubmitCdTimer()
	arg_15_0:RemoveLoadingTimer()
	arg_15_0:RemoveDisappearTimer()

	if var_15_0 then
		arg_15_0:FlushLoadingPanel(arg_15_1)
	else
		arg_15_0:FlusInfoPanel(arg_15_1)
	end

	if arg_15_1:GetOrder():IsUrgency() then
		arg_15_0:AddDisappearTimer(arg_15_1)
	end
end

function var_0_0.AddDisappearTimer(arg_16_0, arg_16_1)
	arg_16_0:RemoveDisappearTimer()

	local var_16_0 = arg_16_1:GetDisappearTime()

	if var_16_0 <= pg.TimeMgr.GetInstance():GetServerTime() then
		arg_16_0:Hide()

		return
	end

	arg_16_0.disappearTimer = Timer.New(function()
		local var_17_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_16_0 - var_17_0 < 0 then
			arg_16_0:Hide()
		end
	end, 1, -1)

	arg_16_0.disappearTimer.func()
	arg_16_0.disappearTimer:Start()
end

function var_0_0.RemoveDisappearTimer(arg_18_0)
	if arg_18_0.disappearTimer then
		arg_18_0.disappearTimer:Stop()

		arg_18_0.disappearTimer = nil
	end
end

function var_0_0.FlushLoadingPanel(arg_19_0, arg_19_1)
	local function var_19_0()
		arg_19_0.loadingTimeTxt.text = ""

		arg_19_0:Flush(arg_19_1)
	end

	local var_19_1 = arg_19_1:GetCanSubmitTime()

	if var_19_1 <= pg.TimeMgr.GetInstance():GetServerTime() then
		var_19_0()

		return
	end

	arg_19_0.loadingTimer = Timer.New(function()
		local var_21_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_21_1 = var_19_1 - var_21_0

		arg_19_0.loadingTimeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_21_1)

		if var_21_1 < 0 then
			arg_19_0:RemoveLoadingTimer()
			var_19_0()
		end
	end, 1, -1)

	arg_19_0.loadingTimer:Start()
	arg_19_0.loadingTimer.func()
end

function var_0_0.RemoveLoadingTimer(arg_22_0)
	if arg_22_0.loadingTimer then
		arg_22_0.loadingTimer:Stop()

		arg_22_0.loadingTimer = nil
	end
end

function var_0_0.FlusInfoPanel(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1:GetOrder()

	arg_23_0:FlushAwards(var_23_0)
	arg_23_0:FlushConsume(var_23_0)
	setActive(arg_23_0.replaceBtn, not var_23_0:IsUrgency())

	arg_23_0.nameTxt.text = var_23_0:GetRoleName()

	local var_23_1, var_23_2 = getProxy(IslandProxy):GetIsland():GetOrderAgency():CanSubmitOrder()

	setActive(arg_23_0.submitBtnMark, not var_23_0:CanFinish())

	if var_23_1 then
		arg_23_0:SetMaskFillAmount(arg_23_0.submitBtnMark, 1)

		return
	end

	local var_23_3 = pg.island_set.order_complete_refresh_time.key_value_int

	arg_23_0.submitTimer = Timer.New(function()
		local var_24_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_24_1 = (var_23_2 - var_24_0) / var_23_3

		arg_23_0:SetMaskFillAmount(arg_23_0.submitBtnMark, 1 - var_24_1)

		if var_24_1 <= 0 then
			arg_23_0:RemoveSubmitCdTimer()
		end
	end, 1, -1)

	arg_23_0.submitTimer:Start()
	arg_23_0.submitTimer.func()
end

function var_0_0.SetMaskFillAmount(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_1:GetComponent(typeof(RectMask2D))
	local var_25_1 = arg_25_1.sizeDelta.x * arg_25_2

	var_25_0.padding = Vector4(var_25_1, 0, 0, 0)
end

function var_0_0.FlushAwards(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1:GetDisplayAwards()

	arg_26_0.awardUIList:make(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == UIItemList.EventUpdate then
			local var_27_0 = var_26_0[arg_27_1 + 1]

			updateCustomDrop(arg_27_2, var_27_0)
		end
	end)
	arg_26_0.awardUIList:align(#var_26_0)
end

function var_0_0.FlushConsume(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1:GetConsume()

	arg_28_0.consumeUIList:make(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == UIItemList.EventUpdate then
			local var_29_0 = var_28_0[arg_29_1 + 1]
			local var_29_1 = {
				count = 0,
				type = var_29_0.type,
				id = var_29_0.id
			}

			updateCustomDrop(arg_29_2:Find("tpl"), var_29_1)
			setText(arg_29_2:Find("Text"), var_29_1.cfg.name)

			local var_29_2 = Drop.New({
				type = var_29_1.type,
				id = var_29_1.id
			}):getOwnedCount()
			local var_29_3 = var_29_2 >= var_29_0.count

			if var_29_3 then
				setText(arg_29_2:Find("count"), var_29_2 .. "/" .. var_29_0.count)
			else
				setText(arg_29_2:Find("count"), setColorStr(var_29_2, COLOR_RED) .. "/" .. var_29_0.count)
			end

			setActive(arg_29_2:Find("finish"), var_29_3)
			setActive(arg_29_2:Find("line"), arg_29_1 + 1 ~= #var_28_0)
		end
	end)
	arg_28_0.consumeUIList:align(#var_28_0)
end

function var_0_0.RemoveSubmitCdTimer(arg_30_0)
	if arg_30_0.submitTimer then
		arg_30_0.submitTimer:Stop()

		arg_30_0.submitTimer = nil
	end
end

function var_0_0.OnDestroy(arg_31_0)
	arg_31_0:RemoveSubmitCdTimer()
	arg_31_0:RemoveLoadingTimer()
	arg_31_0:RemoveDisappearTimer()
end

return var_0_0

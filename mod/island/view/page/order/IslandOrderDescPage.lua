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
		arg_3_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.ORDER_CD, arg_3_0.slot.id)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_7_0.OnSubmitOrder)
	arg_7_0:AddListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_7_0.OnReplaceOrder)
	arg_7_0:AddListener(IslandOrderAgency.GEN_NEW_ORDER, arg_7_0.OnGenNewOrder)
	arg_7_0:AddListener(IslandOrderAgency.UDPATE_ORDER, arg_7_0.OnFlushOrder)
	arg_7_0:AddListener(GAME.ISLAND_USE_TICKET_DONE, arg_7_0.OnUseTicketDone)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_8_0.OnSubmitOrder)
	arg_8_0:RemoveListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_8_0.OnReplaceOrder)
	arg_8_0:RemoveListener(IslandOrderAgency.GEN_NEW_ORDER, arg_8_0.OnGenNewOrder)
	arg_8_0:RemoveListener(IslandOrderAgency.UDPATE_ORDER, arg_8_0.OnFlushOrder)
	arg_8_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_8_0.OnUseTicketDone)
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

function var_0_0.OnUseTicketDone(arg_12_0, arg_12_1)
	if arg_12_1.type == IslandUseTicketCommand.TYPES.ORDER_CD then
		arg_12_0:TryFlushOrderInfo(arg_12_1.id)
	end
end

function var_0_0.OnGenNewOrder(arg_13_0, arg_13_1)
	arg_13_0:TryFlushOrderInfo(arg_13_1.slotId)
end

function var_0_0.TryFlushOrderInfo(arg_14_0, arg_14_1)
	local var_14_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_14_1)

	if not arg_14_0.slot then
		return
	end

	if arg_14_0.slot.id ~= var_14_0.id then
		return
	end

	arg_14_0:Flush(var_14_0)
end

function var_0_0.Show(arg_15_0, arg_15_1)
	var_0_0.super.Show(arg_15_0)
	arg_15_0:Flush(arg_15_1)
end

function var_0_0.Flush(arg_16_0, arg_16_1)
	arg_16_0.slot = arg_16_1

	if not arg_16_1 or arg_16_1:IsEmpty() then
		arg_16_0:Hide()

		return
	end

	local var_16_0 = arg_16_1:IsLoading()

	setActive(arg_16_0.infoPanel, not var_16_0)
	setActive(arg_16_0.loadingPanel, var_16_0)
	arg_16_0:RemoveSubmitCdTimer()
	arg_16_0:RemoveLoadingTimer()
	arg_16_0:RemoveDisappearTimer()

	if var_16_0 then
		arg_16_0:FlushLoadingPanel(arg_16_1)
	else
		arg_16_0:FlusInfoPanel(arg_16_1)
	end

	if arg_16_1:GetOrder():IsUrgency() then
		arg_16_0:AddDisappearTimer(arg_16_1)
	end
end

function var_0_0.AddDisappearTimer(arg_17_0, arg_17_1)
	arg_17_0:RemoveDisappearTimer()

	local var_17_0 = arg_17_1:GetDisappearTime()

	if var_17_0 <= pg.TimeMgr.GetInstance():GetServerTime() then
		arg_17_0:Hide()

		return
	end

	arg_17_0.disappearTimer = Timer.New(function()
		local var_18_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_17_0 - var_18_0 < 0 then
			arg_17_0:Hide()
		end
	end, 1, -1)

	arg_17_0.disappearTimer.func()
	arg_17_0.disappearTimer:Start()
end

function var_0_0.RemoveDisappearTimer(arg_19_0)
	if arg_19_0.disappearTimer then
		arg_19_0.disappearTimer:Stop()

		arg_19_0.disappearTimer = nil
	end
end

function var_0_0.FlushLoadingPanel(arg_20_0, arg_20_1)
	local function var_20_0()
		arg_20_0.loadingTimeTxt.text = ""

		arg_20_0:Flush(arg_20_1)
	end

	local var_20_1 = arg_20_1:GetCanSubmitTime()

	if var_20_1 <= pg.TimeMgr.GetInstance():GetServerTime() then
		var_20_0()

		return
	end

	arg_20_0.loadingTimer = Timer.New(function()
		local var_22_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_22_1 = var_20_1 - var_22_0

		arg_20_0.loadingTimeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_22_1)

		if var_22_1 < 0 then
			arg_20_0:RemoveLoadingTimer()
			var_20_0()
		end
	end, 1, -1)

	arg_20_0.loadingTimer:Start()
	arg_20_0.loadingTimer.func()
end

function var_0_0.RemoveLoadingTimer(arg_23_0)
	if arg_23_0.loadingTimer then
		arg_23_0.loadingTimer:Stop()

		arg_23_0.loadingTimer = nil
	end
end

function var_0_0.FlusInfoPanel(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:GetOrder()

	arg_24_0:FlushAwards(var_24_0)
	arg_24_0:FlushConsume(var_24_0)
	setActive(arg_24_0.replaceBtn, not var_24_0:IsUrgency())

	arg_24_0.nameTxt.text = var_24_0:GetRoleName()

	local var_24_1, var_24_2 = getProxy(IslandProxy):GetIsland():GetOrderAgency():CanSubmitOrder()

	setActive(arg_24_0.submitBtnMark, not var_24_0:CanFinish())

	if var_24_1 then
		arg_24_0:SetMaskFillAmount(arg_24_0.submitBtnMark, 1)

		return
	end

	local var_24_3 = pg.island_set.order_complete_refresh_time.key_value_int

	arg_24_0.submitTimer = Timer.New(function()
		local var_25_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_25_1 = (var_24_2 - var_25_0) / var_24_3

		arg_24_0:SetMaskFillAmount(arg_24_0.submitBtnMark, 1 - var_25_1)

		if var_25_1 <= 0 then
			arg_24_0:RemoveSubmitCdTimer()
		end
	end, 1, -1)

	arg_24_0.submitTimer:Start()
	arg_24_0.submitTimer.func()
end

function var_0_0.SetMaskFillAmount(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_1:GetComponent(typeof(RectMask2D))
	local var_26_1 = arg_26_1.sizeDelta.x * arg_26_2

	var_26_0.padding = Vector4(var_26_1, 0, 0, 0)
end

function var_0_0.FlushAwards(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1:GetDisplayAwards()

	arg_27_0.awardUIList:make(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == UIItemList.EventUpdate then
			local var_28_0 = var_27_0[arg_28_1 + 1]

			updateCustomDrop(arg_28_2, var_28_0)
		end
	end)
	arg_27_0.awardUIList:align(#var_27_0)
end

function var_0_0.FlushConsume(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1:GetConsume()

	arg_29_0.consumeUIList:make(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == UIItemList.EventUpdate then
			local var_30_0 = var_29_0[arg_30_1 + 1]
			local var_30_1 = {
				count = 0,
				type = var_30_0.type,
				id = var_30_0.id
			}

			updateCustomDrop(arg_30_2:Find("tpl"), var_30_1)
			setText(arg_30_2:Find("Text"), var_30_1.cfg.name)

			local var_30_2 = Drop.New({
				type = var_30_1.type,
				id = var_30_1.id
			}):getOwnedCount()
			local var_30_3 = var_30_2 >= var_30_0.count

			if var_30_3 then
				setText(arg_30_2:Find("count"), var_30_2 .. "/" .. var_30_0.count)
			else
				setText(arg_30_2:Find("count"), setColorStr(var_30_2, COLOR_RED) .. "/" .. var_30_0.count)
			end

			setActive(arg_30_2:Find("finish"), var_30_3)
			setActive(arg_30_2:Find("line"), arg_30_1 + 1 ~= #var_29_0)
		end
	end)
	arg_29_0.consumeUIList:align(#var_29_0)
end

function var_0_0.RemoveSubmitCdTimer(arg_31_0)
	if arg_31_0.submitTimer then
		arg_31_0.submitTimer:Stop()

		arg_31_0.submitTimer = nil
	end
end

function var_0_0.OnDestroy(arg_32_0)
	arg_32_0:RemoveSubmitCdTimer()
	arg_32_0:RemoveLoadingTimer()
	arg_32_0:RemoveDisappearTimer()
end

return var_0_0

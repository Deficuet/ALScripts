local var_0_0 = class("IslandOrderPage", import("...base.IslandBasePage"))

var_0_0.ON_UPDADE = "IslandOrderPage:ON_UPDADE"

function var_0_0.getUIName(arg_1_0)
	return "IslandOrderUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("top/back")
	arg_2_0.favorBtn = arg_2_0._tf:Find("top/favor_bg")
	arg_2_0.levelTxt = arg_2_0._tf:Find("top/favor_bg/level"):GetComponent(typeof(Text))
	arg_2_0.expTxt = arg_2_0._tf:Find("top/favor_bg/Text"):GetComponent(typeof(Text))
	arg_2_0.charTr = arg_2_0._tf:Find("bottom/char")
	arg_2_0.chatTxt = arg_2_0.charTr:Find("dialogue/Text"):GetComponent(typeof(Text))
	arg_2_0.trendBtn = arg_2_0._tf:Find("trend_btn")
	arg_2_0.trendIco = arg_2_0.trendBtn:Find("difficulty"):GetComponent(typeof(Image))
	arg_2_0.trendTxt = arg_2_0.trendBtn:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.orderContainer = arg_2_0._tf:Find("map")
	arg_2_0.upgradePage = IslandOrderUpgradePage.New(arg_2_0._parentTf)
	arg_2_0.countTxt = arg_2_0._tf:Find("count_bg/Text"):GetComponent(typeof(Text))
	arg_2_0.orderTplPool = OrderTplPool.New(arg_2_0._tf:Find("root/orderTpl"), 3, 6)
	arg_2_0.orderTpls = {}
	arg_2_0.timers = {}
	arg_2_0.disappearTimers = {}

	setActive(arg_2_0.charTr, false)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_order_title"))
end

function var_0_0.OnHide(arg_3_0)
	if arg_3_0.upgradePage:GetLoaded() then
		arg_3_0.upgradePage:Destroy()
		arg_3_0.upgradePage:Reset()
	end
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("top/title/help"), function()
		arg_4_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_WHITOUT_BTN,
			content = i18n("island_helpbtn_order")
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.favorBtn, function()
		arg_4_0:OpenPage(IslandOrderLevelInfoPage)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.trendBtn, function()
		local var_8_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetTendency()

		arg_4_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_ORDER_TENDENCY,
			title = i18n("island_order_difficulty"),
			selected = var_8_0,
			onYes = function(arg_9_0)
				arg_4_0:emit(IslandMediator.SET_ORDER_TENDENCY, arg_9_0)
			end
		})
	end, SFX_PANEL)
	arg_4_0:UpdateFavorBtn()
end

function var_0_0.UpdateFavorBtn(arg_10_0)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	setActive(arg_10_0.favorBtn, var_10_0:ExpSystemIsOpen())
end

function var_0_0.AddListeners(arg_11_0)
	arg_11_0:AddListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_11_0.OnSubmitOrder)
	arg_11_0:AddListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_11_0.OnReplaceOrder)
	arg_11_0:AddListener(IslandOrderAgency.GEN_NEW_ORDER, arg_11_0.OnGenNewOrder)
	arg_11_0:AddListener(IslandOrderAgency.UDPATE_ORDER, arg_11_0.OnFlushOrder)
	arg_11_0:AddListener(GAME.ISLAND_SET_ORDER_TENDENCY_DONE, arg_11_0.OnOrderTendencyChanged)
	arg_11_0:AddListener(IslandScene.ON_CHECK_ORDER_EXP_AWARD, arg_11_0.OnCheckOrderExpAward)
	arg_11_0:AddListener(var_0_0.ON_UPDADE, arg_11_0.OnUpgrade)
	arg_11_0:AddListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_11_0.OnUpdateFinishCnt)
	arg_11_0:AddListener(GAME.ISLAND_USE_TICKET_DONE, arg_11_0.OnUseTicketDone)
	arg_11_0:AddListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_11_0.OnUnlockSystem)
end

function var_0_0.RemoveListeners(arg_12_0)
	arg_12_0:RemoveListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_12_0.OnSubmitOrder)
	arg_12_0:RemoveListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_12_0.OnReplaceOrder)
	arg_12_0:RemoveListener(GAME.ISLAND_SET_ORDER_TENDENCY_DONE, arg_12_0.OnOrderTendencyChanged)
	arg_12_0:RemoveListener(IslandOrderAgency.GEN_NEW_ORDER, arg_12_0.OnGenNewOrder)
	arg_12_0:RemoveListener(IslandOrderAgency.UDPATE_ORDER, arg_12_0.OnFlushOrder)
	arg_12_0:RemoveListener(var_0_0.ON_UPDADE, arg_12_0.OnUpgrade)
	arg_12_0:RemoveListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_12_0.OnUpdateFinishCnt)
	arg_12_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_12_0.OnUseTicketDone)
	arg_12_0:RemoveListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_12_0.OnUnlockSystem)
end

function var_0_0.OnUnlockSystem(arg_13_0)
	arg_13_0:UpdateFavorBtn()
	arg_13_0:CheckOrderExpAward()
end

function var_0_0.OnReset(arg_14_0)
	arg_14_0:Flush()
end

function var_0_0.OnUpgrade(arg_15_0, arg_15_1)
	arg_15_0.upgradePage:ExecuteAction("Show", arg_15_1.level, arg_15_1.callback)
end

function var_0_0.OnOrderTendencyChanged(arg_16_0)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_16_0:UpdateTrendBtn(var_16_0)
end

function var_0_0.OnSubmitOrder(arg_17_0, arg_17_1)
	local var_17_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_17_0:UpdateExpPanel(var_17_0)
	arg_17_0:UpdateOrderState(arg_17_1.slotId)
	arg_17_0:UpdateCount(var_17_0)

	for iter_17_0, iter_17_1 in pairs(arg_17_0.orderTpls or {}) do
		arg_17_0:UpdateOrderState(iter_17_0)
	end
end

function var_0_0.OnReplaceOrder(arg_18_0, arg_18_1)
	arg_18_0:UpdateOrderState(arg_18_1.slotId)
end

function var_0_0.OnGenNewOrder(arg_19_0, arg_19_1)
	arg_19_0:UpdateOrderState(arg_19_1.slotId)
end

function var_0_0.OnFlushOrder(arg_20_0, arg_20_1)
	arg_20_0:UpdateOrderState(arg_20_1.slotId)
end

function var_0_0.OnUseTicketDone(arg_21_0, arg_21_1)
	if arg_21_1.type == IslandUseTicketCommand.TYPES.ORDER_CD then
		arg_21_0:UpdateOrderState(arg_21_1.id)
	end
end

function var_0_0.OnCheckOrderExpAward(arg_22_0)
	arg_22_0:CheckOrderExpAward()
end

function var_0_0.OnUpdateFinishCnt(arg_23_0)
	local var_23_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_23_0:UpdateCount(var_23_0)
	arg_23_0:UpdateExpPanel(var_23_0)
end

function var_0_0.Show(arg_24_0)
	var_0_0.super.Show(arg_24_0)
	arg_24_0:Flush()
end

function var_0_0.Flush(arg_25_0)
	local var_25_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_25_0:UpdateExpPanel(var_25_0)
	arg_25_0:GenOrderList(var_25_0)
	arg_25_0:TriggerOrder(var_25_0)
	arg_25_0:UpdateTrendBtn(var_25_0)
	arg_25_0:UpdateCount(var_25_0)
	arg_25_0:CheckOrderExpAward()
end

function var_0_0.UpdateCount(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1:GetMaxFinishCount()
	local var_26_1 = arg_26_1:GetFinishCnt()

	arg_26_0.countTxt.text = i18n("island_order_leftCnt_tip") .. var_26_0 - var_26_1 .. "/" .. var_26_0
end

function var_0_0.UpdateTrendBtn(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1:GetTendency()

	arg_27_0.trendTxt.text = IslandOrderSlot.TENDENCY2CN(var_27_0)

	local var_27_1 = ({
		"icon_common",
		"icon_easy",
		"icon_hard"
	})[var_27_0 + 1]
	local var_27_2 = GetSpriteFromAtlas("ui/IslandOrderUI_atlas", var_27_1)

	arg_27_0.trendIco.sprite = var_27_2
end

function var_0_0.CheckOrderExpAward(arg_28_0)
	local var_28_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	if not var_28_0:ExpSystemIsOpen() then
		arg_28_0:CheckGuide()

		return
	end

	local var_28_1 = var_28_0:GetAllCanGetAwardList()
	local var_28_2 = {}

	for iter_28_0, iter_28_1 in ipairs(var_28_1) do
		table.insert(var_28_2, function(arg_29_0)
			arg_28_0:emit(IslandMediator.ON_GET_ORDER_EXP_AWARD, iter_28_1, arg_29_0)
		end)
	end

	seriesAsync(var_28_2, function()
		arg_28_0:CheckGuide()
	end)
end

function var_0_0.CheckGuide(arg_31_0)
	if getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(IslandGuideChecker.ORDER_TASK_ID) then
		onDelayTick(function()
			IslandGuideChecker.CheckGuide("ISLAND_GUIDE_7", IslandGuideChecker.FINISH_TYPE.ON_GUIDE)
		end, 0.2)
	end
end

function var_0_0.TriggerOrder(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1:GetCacheSelectedId()
	local var_33_1 = arg_33_1:GetSlots()
	local var_33_2 = var_33_1[var_33_0]

	if var_33_2 and not var_33_2:IsEmpty() then
		local var_33_3 = arg_33_0.orderTpls[var_33_2.id]

		if var_33_3 then
			triggerButton(var_33_3)
		end
	else
		local var_33_4

		for iter_33_0, iter_33_1 in pairs(var_33_1) do
			if not iter_33_1:IsEmpty() then
				var_33_4 = iter_33_1

				break
			end
		end

		if var_33_4 then
			local var_33_5 = arg_33_0.orderTpls[var_33_4.id]

			if var_33_5 then
				triggerButton(var_33_5)
			end
		end
	end
end

function var_0_0.GenOrderList(arg_34_0, arg_34_1)
	arg_34_0:ReturnOrderTplList()

	local var_34_0 = arg_34_1:GetSlots()

	for iter_34_0, iter_34_1 in pairs(var_34_0) do
		arg_34_0:NewOrderTpl(iter_34_1.id)
		arg_34_0:UpdateOrderState(iter_34_1.id)
	end
end

function var_0_0.NewOrderTpl(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0.orderTplPool:Dequeue()

	setParent(var_35_0, arg_35_0.orderContainer)

	arg_35_0.orderTpls[arg_35_1] = var_35_0

	return var_35_0
end

function var_0_0.ReturnOrderTplList(arg_36_0)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.orderTpls) do
		arg_36_0.orderTplPool:Enqueue(iter_36_1)
	end

	arg_36_0.orderTpls = {}
end

function var_0_0.UpdateOrderState(arg_37_0, arg_37_1)
	local var_37_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_37_1)
	local var_37_1 = arg_37_0.orderTpls[arg_37_1] or arg_37_0:NewOrderTpl(arg_37_1)

	arg_37_0:RemoveLoadingTimer(arg_37_1)
	arg_37_0:RemoveDisappearTimer(arg_37_1)
	arg_37_0:ShowDiaglog(var_37_0)

	if not var_37_0 or var_37_0:IsEmpty() then
		removeOnButton(var_37_1)
		setActive(var_37_1, false)

		return
	end

	var_37_1.transform.localPosition = var_37_0:GetPosition()

	setActive(var_37_1, true)
	onButton(arg_37_0, var_37_1, function()
		arg_37_0:ClickOrder(var_37_1, var_37_0)

		arg_37_0.selected = var_37_1
	end, SFX_PANEL)

	local var_37_2 = var_37_0:GetOrder()
	local var_37_3 = var_37_0:CanSubmit()

	setActive(var_37_1.transform:Find("bg_urgent"), var_37_2:IsUrgency())
	setActive(var_37_1.transform:Find("bg_act"), var_37_2:IsActivity())
	setActive(var_37_1.transform:Find("sel"), arg_37_0.selected and arg_37_0.selected == var_37_1)
	setActive(var_37_1.transform:Find("finish"), var_37_3)
	setActive(var_37_1.transform:Find("easy"), var_37_2:GetTendency() == IslandOrderSlot.TENDENCY_TYPE_EASY)
	setActive(var_37_1.transform:Find("hard"), var_37_2:GetTendency() == IslandOrderSlot.TENDENCY_TYPE_HARD)

	local var_37_4 = var_37_0:IsLoading()

	setActive(var_37_1.transform:Find("icon"), not var_37_4)
	setActive(var_37_1.transform:Find("loading"), var_37_4)
	setActive(var_37_1.transform:Find("bg/progress"), not var_37_4)

	local var_37_5 = var_37_2:GetRoleIcon()

	GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_37_5, "", var_37_1.transform:Find("icon"))

	if var_37_4 then
		arg_37_0:AddLoadingTimer(var_37_1, var_37_0)
	end

	if var_37_2:IsUrgency() then
		arg_37_0:AddDisappearTimer(var_37_1, var_37_0)
	end
end

function var_0_0.AddDisappearTimer(arg_39_0, arg_39_1, arg_39_2)
	arg_39_0:RemoveDisappearTimer(arg_39_2.id)

	local var_39_0 = arg_39_2:GetDisappearTime()

	if var_39_0 <= pg.TimeMgr.GetInstance():GetServerTime() then
		return
	end

	arg_39_0.disappearTimers[arg_39_2.id] = Timer.New(function()
		local var_40_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_40_1 = var_39_0 - var_40_0
		local var_40_2 = pg.TimeMgr.GetInstance():DescCDTime(var_40_1)

		setText(arg_39_1.transform:Find("bg_urgent/time_label/Text"), var_40_2)

		if var_40_1 < 0 then
			arg_39_0:UpdateOrderState(arg_39_2.id)
		end
	end, 1, -1)

	arg_39_0.disappearTimers[arg_39_2.id].func()
	arg_39_0.disappearTimers[arg_39_2.id]:Start()
end

function var_0_0.RemoveDisappearTimer(arg_41_0, arg_41_1)
	if arg_41_0.disappearTimers[arg_41_1] then
		arg_41_0.disappearTimers[arg_41_1]:Stop()

		arg_41_0.disappearTimers[arg_41_1] = nil
	end
end

function var_0_0.ClickOrder(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0:OpenPage(IslandOrderDescPage, arg_42_2)
	arg_42_0:ShowDiaglog(arg_42_2)
	getProxy(IslandProxy):GetIsland():GetOrderAgency():SetCacheSelectedId(arg_42_2.id)

	if arg_42_0.selected then
		setActive(arg_42_0.selected.transform:Find("sel"), false)
	end

	setActive(arg_42_1.transform:Find("sel"), true)
end

function var_0_0.ShowDiaglog(arg_43_0, arg_43_1)
	if not arg_43_1 or not arg_43_1:GetOrder() or arg_43_1:IsEmpty() or arg_43_1:IsLoading() then
		setActive(arg_43_0.charTr, false)

		return
	end

	local var_43_0 = arg_43_1:GetOrder()

	setActive(arg_43_0.charTr, true)

	local var_43_1 = var_43_0:GetRoleIcon()

	GetImageSpriteFromAtlasAsync("island/IslandShipIconHalf/" .. var_43_1, "", arg_43_0.charTr)

	arg_43_0.chatTxt.text = var_43_0:GetDesc()
end

function var_0_0.AddLoadingTimer(arg_44_0, arg_44_1, arg_44_2)
	local function var_44_0()
		arg_44_0:UpdateOrderState(arg_44_2.id)
	end

	local var_44_1 = arg_44_2:GetCanSubmitTime()
	local var_44_2 = arg_44_2:GetTotalTime()
	local var_44_3 = Timer.New(function()
		local var_46_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_46_1 = var_44_1 - var_46_0

		setText(arg_44_1.transform:Find("loading/time_label/Text"), pg.TimeMgr.GetInstance():DescCDTime(var_46_1))
		setFillAmount(arg_44_1.transform:Find("loading/progress"), 1 - var_46_1 / var_44_2)

		if var_46_1 <= 0 then
			var_44_0()
		end
	end, 1, -1)

	var_44_3:Start()
	var_44_3.func()

	arg_44_0.timers[arg_44_2.id] = var_44_3
end

function var_0_0.RemoveLoadingTimer(arg_47_0, arg_47_1)
	if arg_47_0.timers[arg_47_1] then
		arg_47_0.timers[arg_47_1]:Stop()

		arg_47_0.timers[arg_47_1] = nil
	end
end

function var_0_0.RemoveAllLoadingTimer(arg_48_0)
	for iter_48_0, iter_48_1 in pairs(arg_48_0.timers) do
		iter_48_1:Stop()
	end

	for iter_48_2, iter_48_3 in pairs(arg_48_0.disappearTimers) do
		iter_48_3:Stop()
	end

	arg_48_0.disappearTimers = {}
	arg_48_0.timers = {}
end

function var_0_0.UpdateExpPanel(arg_49_0, arg_49_1)
	arg_49_0.levelTxt.text = arg_49_1:GetLevel()

	if arg_49_1:IsMaxLevel() then
		arg_49_0.expTxt.text = "MAX"
	else
		local var_49_0 = arg_49_1:GetExp()
		local var_49_1 = math.max(1, arg_49_1:GetNextTargetExp())

		arg_49_0.expTxt.text = var_49_0 .. "/" .. var_49_1
	end
end

function var_0_0.OnDestroy(arg_50_0)
	if arg_50_0.upgradePage:GetLoaded() then
		arg_50_0.upgradePage:Destroy()

		arg_50_0.upgradePage = nil
	end

	if arg_50_0.orderTplPool then
		arg_50_0.orderTplPool:Dispose()

		arg_50_0.orderTplPool = nil
	end

	arg_50_0:RemoveAllLoadingTimer()
end

return var_0_0

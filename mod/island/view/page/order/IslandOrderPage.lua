local var_0_0 = class("IslandOrderPage", import("...base.IslandBasePage"))

var_0_0.ON_UPDADE = "IslandOrderPage:ON_UPDADE"

function var_0_0.getUIName(arg_1_0)
	return "IslandOrderUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("top/back")
	arg_2_0.favorBtn = arg_2_0:findTF("top/favor_bg")
	arg_2_0.levelTxt = arg_2_0:findTF("top/favor_bg/level"):GetComponent(typeof(Text))
	arg_2_0.expTxt = arg_2_0:findTF("top/favor_bg/Text"):GetComponent(typeof(Text))
	arg_2_0.charTr = arg_2_0:findTF("bottom/char")
	arg_2_0.chatTxt = arg_2_0.charTr:Find("dialogue/Text"):GetComponent(typeof(Text))
	arg_2_0.trendBtn = arg_2_0:findTF("trend_btn")
	arg_2_0.trendIco = arg_2_0.trendBtn:Find("difficulty"):GetComponent(typeof(Image))
	arg_2_0.trendTxt = arg_2_0.trendBtn:Find("Text"):GetComponent(typeof(Text))
	arg_2_0.orderContainer = arg_2_0:findTF("map")
	arg_2_0.upgradePage = IslandOrderUpgradePage.New(arg_2_0._parentTf)
	arg_2_0.countTxt = arg_2_0:findTF("count_bg/Text"):GetComponent(typeof(Text))
	arg_2_0.orderTplPool = OrderTplPool.New(arg_2_0:findTF("root/orderTpl"), 3, 6)
	arg_2_0.orderTpls = {}
	arg_2_0.timers = {}
	arg_2_0.disappearTimers = {}

	setActive(arg_2_0.charTr, false)
	setText(arg_2_0:findTF("top/title/Text"), i18n("island_order_title"))
end

function var_0_0.OnHide(arg_3_0)
	if arg_3_0.upgradePage:GetLoaded() then
		arg_3_0.upgradePage:Destroy()
		arg_3_0.upgradePage:Reset()
	end
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.favorBtn, function()
		arg_4_0:OpenPage(IslandOrderLevelInfoPage)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.trendBtn, function()
		local var_7_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetTendency()

		arg_4_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_ORDER_TENDENCY,
			title = i18n("island_order_difficulty"),
			selected = var_7_0,
			onYes = function(arg_8_0)
				arg_4_0:emit(IslandMediator.SET_ORDER_TENDENCY, arg_8_0)
			end
		})
	end, SFX_PANEL)
	arg_4_0:UpdateFavorBtn()
end

function var_0_0.UpdateFavorBtn(arg_9_0)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	setActive(arg_9_0.favorBtn, var_9_0:ExpSystemIsOpen())
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_10_0.OnSubmitOrder)
	arg_10_0:AddListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_10_0.OnReplaceOrder)
	arg_10_0:AddListener(IslandOrderAgency.GEN_NEW_ORDER, arg_10_0.OnGenNewOrder)
	arg_10_0:AddListener(IslandOrderAgency.UDPATE_ORDER, arg_10_0.OnFlushOrder)
	arg_10_0:AddListener(GAME.ISLAND_SET_ORDER_TENDENCY_DONE, arg_10_0.OnOrderTendencyChanged)
	arg_10_0:AddListener(IslandScene.ON_CHECK_ORDER_EXP_AWARD, arg_10_0.OnCheckOrderExpAward)
	arg_10_0:AddListener(var_0_0.ON_UPDADE, arg_10_0.OnUpgrade)
	arg_10_0:AddListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_10_0.OnUpdateFinishCnt)
	arg_10_0:AddListener(GAME.ISLAND_USE_TICKET_DONE, arg_10_0.OnUseTicketDone)
	arg_10_0:AddListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_10_0.OnUnlockSystem)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_11_0.OnSubmitOrder)
	arg_11_0:RemoveListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_11_0.OnReplaceOrder)
	arg_11_0:RemoveListener(GAME.ISLAND_SET_ORDER_TENDENCY_DONE, arg_11_0.OnOrderTendencyChanged)
	arg_11_0:RemoveListener(IslandOrderAgency.GEN_NEW_ORDER, arg_11_0.OnGenNewOrder)
	arg_11_0:RemoveListener(IslandOrderAgency.UDPATE_ORDER, arg_11_0.OnFlushOrder)
	arg_11_0:RemoveListener(var_0_0.ON_UPDADE, arg_11_0.OnUpgrade)
	arg_11_0:RemoveListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_11_0.OnUpdateFinishCnt)
	arg_11_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_11_0.OnUseTicketDone)
	arg_11_0:RemoveListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_11_0.OnUnlockSystem)
end

function var_0_0.OnUnlockSystem(arg_12_0)
	arg_12_0:UpdateFavorBtn()
	arg_12_0:CheckOrderExpAward()
end

function var_0_0.OnReset(arg_13_0)
	arg_13_0:Flush()
end

function var_0_0.OnUpgrade(arg_14_0, arg_14_1)
	arg_14_0.upgradePage:ExecuteAction("Show", arg_14_1.level, arg_14_1.callback)
end

function var_0_0.OnOrderTendencyChanged(arg_15_0)
	local var_15_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_15_0:UpdateTrendBtn(var_15_0)
end

function var_0_0.OnSubmitOrder(arg_16_0, arg_16_1)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_16_0:UpdateExpPanel(var_16_0)
	arg_16_0:UpdateOrderState(arg_16_1.slotId)
	arg_16_0:UpdateCount(var_16_0)

	for iter_16_0, iter_16_1 in pairs(arg_16_0.orderTpls or {}) do
		arg_16_0:UpdateOrderState(iter_16_0)
	end
end

function var_0_0.OnReplaceOrder(arg_17_0, arg_17_1)
	arg_17_0:UpdateOrderState(arg_17_1.slotId)
end

function var_0_0.OnGenNewOrder(arg_18_0, arg_18_1)
	arg_18_0:UpdateOrderState(arg_18_1.slotId)
end

function var_0_0.OnFlushOrder(arg_19_0, arg_19_1)
	arg_19_0:UpdateOrderState(arg_19_1.slotId)
end

function var_0_0.OnUseTicketDone(arg_20_0, arg_20_1)
	if arg_20_1.type == IslandUseTicketCommand.TYPES.ORDER_CD then
		arg_20_0:UpdateOrderState(arg_20_1.id)
	end
end

function var_0_0.OnCheckOrderExpAward(arg_21_0)
	arg_21_0:CheckOrderExpAward()
end

function var_0_0.OnUpdateFinishCnt(arg_22_0)
	local var_22_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_22_0:UpdateCount(var_22_0)
	arg_22_0:UpdateExpPanel(var_22_0)
end

function var_0_0.Show(arg_23_0)
	var_0_0.super.Show(arg_23_0)
	arg_23_0:Flush()
end

function var_0_0.Flush(arg_24_0)
	local var_24_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_24_0:UpdateExpPanel(var_24_0)
	arg_24_0:GenOrderList(var_24_0)
	arg_24_0:TriggerOrder(var_24_0)
	arg_24_0:UpdateTrendBtn(var_24_0)
	arg_24_0:UpdateCount(var_24_0)
	arg_24_0:CheckOrderExpAward()
end

function var_0_0.UpdateCount(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1:GetMaxFinishCount()
	local var_25_1 = arg_25_1:GetFinishCnt()

	arg_25_0.countTxt.text = i18n("island_order_leftCnt_tip") .. var_25_0 - var_25_1 .. "/" .. var_25_0
end

function var_0_0.UpdateTrendBtn(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1:GetTendency()

	arg_26_0.trendTxt.text = IslandOrderSlot.TENDENCY2CN(var_26_0)

	local var_26_1 = ({
		"icon_common",
		"icon_easy",
		"icon_hard"
	})[var_26_0 + 1]
	local var_26_2 = GetSpriteFromAtlas("ui/IslandOrderUI_atlas", var_26_1)

	arg_26_0.trendIco.sprite = var_26_2
end

function var_0_0.CheckOrderExpAward(arg_27_0)
	local var_27_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	if not var_27_0:ExpSystemIsOpen() then
		arg_27_0:CheckGuide()

		return
	end

	local var_27_1 = var_27_0:GetAllCanGetAwardList()
	local var_27_2 = {}

	for iter_27_0, iter_27_1 in ipairs(var_27_1) do
		table.insert(var_27_2, function(arg_28_0)
			arg_27_0:emit(IslandMediator.ON_GET_ORDER_EXP_AWARD, iter_27_1, arg_28_0)
		end)
	end

	seriesAsync(var_27_2, function()
		arg_27_0:CheckGuide()
	end)
end

function var_0_0.CheckGuide(arg_30_0)
	if getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(IslandGuideChecker.ORDER_TASK_ID) then
		onDelayTick(function()
			IslandGuideChecker.CheckGuide("ISLAND_GUIDE_7", IslandGuideChecker.FINISH_TYPE.ON_GUIDE)
		end, 0.2)
	end
end

function var_0_0.TriggerOrder(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1:GetCacheSelectedId()
	local var_32_1 = arg_32_1:GetSlots()
	local var_32_2 = var_32_1[var_32_0]

	if var_32_2 and not var_32_2:IsEmpty() then
		local var_32_3 = arg_32_0.orderTpls[var_32_2.id]

		if var_32_3 then
			triggerButton(var_32_3)
		end
	else
		local var_32_4

		for iter_32_0, iter_32_1 in pairs(var_32_1) do
			if not iter_32_1:IsEmpty() then
				var_32_4 = iter_32_1

				break
			end
		end

		if var_32_4 then
			local var_32_5 = arg_32_0.orderTpls[var_32_4.id]

			if var_32_5 then
				triggerButton(var_32_5)
			end
		end
	end
end

function var_0_0.GenOrderList(arg_33_0, arg_33_1)
	arg_33_0:ReturnOrderTplList()

	local var_33_0 = arg_33_1:GetSlots()

	for iter_33_0, iter_33_1 in pairs(var_33_0) do
		arg_33_0:NewOrderTpl(iter_33_1.id)
		arg_33_0:UpdateOrderState(iter_33_1.id)
	end
end

function var_0_0.NewOrderTpl(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0.orderTplPool:Dequeue()

	setParent(var_34_0, arg_34_0.orderContainer)

	arg_34_0.orderTpls[arg_34_1] = var_34_0

	return var_34_0
end

function var_0_0.ReturnOrderTplList(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.orderTpls) do
		arg_35_0.orderTplPool:Enqueue(iter_35_1)
	end

	arg_35_0.orderTpls = {}
end

function var_0_0.UpdateOrderState(arg_36_0, arg_36_1)
	local var_36_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_36_1)
	local var_36_1 = arg_36_0.orderTpls[arg_36_1] or arg_36_0:NewOrderTpl(arg_36_1)

	arg_36_0:RemoveLoadingTimer(arg_36_1)
	arg_36_0:RemoveDisappearTimer(arg_36_1)
	arg_36_0:ShowDiaglog(var_36_0)

	if not var_36_0 or var_36_0:IsEmpty() then
		removeOnButton(var_36_1)
		setActive(var_36_1, false)

		return
	end

	var_36_1.transform.localPosition = var_36_0:GetPosition()

	setActive(var_36_1, true)
	onButton(arg_36_0, var_36_1, function()
		arg_36_0:ClickOrder(var_36_1, var_36_0)

		arg_36_0.selected = var_36_1
	end, SFX_PANEL)

	local var_36_2 = var_36_0:GetOrder()
	local var_36_3 = var_36_0:CanSubmit()

	setActive(var_36_1.transform:Find("bg_urgent"), var_36_2:IsUrgency())
	setActive(var_36_1.transform:Find("bg_act"), var_36_2:IsActivity())
	setActive(var_36_1.transform:Find("sel"), arg_36_0.selected and arg_36_0.selected == var_36_1)
	setActive(var_36_1.transform:Find("finish"), var_36_3)
	setActive(var_36_1.transform:Find("easy"), var_36_2:GetTendency() == IslandOrderSlot.TENDENCY_TYPE_EASY)
	setActive(var_36_1.transform:Find("hard"), var_36_2:GetTendency() == IslandOrderSlot.TENDENCY_TYPE_HARD)

	local var_36_4 = var_36_0:IsLoading()

	setActive(var_36_1.transform:Find("icon"), not var_36_4)
	setActive(var_36_1.transform:Find("loading"), var_36_4)
	setActive(var_36_1.transform:Find("bg/progress"), not var_36_4)

	local var_36_5 = var_36_2:GetRoleIcon()

	GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_36_5, "", var_36_1.transform:Find("icon"))

	if var_36_4 then
		arg_36_0:AddLoadingTimer(var_36_1, var_36_0)
	end

	if var_36_2:IsUrgency() then
		arg_36_0:AddDisappearTimer(var_36_1, var_36_0)
	end
end

function var_0_0.AddDisappearTimer(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0:RemoveDisappearTimer(arg_38_2.id)

	local var_38_0 = arg_38_2:GetDisappearTime()

	if var_38_0 <= pg.TimeMgr.GetInstance():GetServerTime() then
		return
	end

	arg_38_0.disappearTimers[arg_38_2.id] = Timer.New(function()
		local var_39_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_39_1 = var_38_0 - var_39_0
		local var_39_2 = pg.TimeMgr.GetInstance():DescCDTime(var_39_1)

		setText(arg_38_1.transform:Find("bg_urgent/time_label/Text"), var_39_2)

		if var_39_1 < 0 then
			arg_38_0:UpdateOrderState(arg_38_2.id)
		end
	end, 1, -1)

	arg_38_0.disappearTimers[arg_38_2.id].func()
	arg_38_0.disappearTimers[arg_38_2.id]:Start()
end

function var_0_0.RemoveDisappearTimer(arg_40_0, arg_40_1)
	if arg_40_0.disappearTimers[arg_40_1] then
		arg_40_0.disappearTimers[arg_40_1]:Stop()

		arg_40_0.disappearTimers[arg_40_1] = nil
	end
end

function var_0_0.ClickOrder(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0:OpenPage(IslandOrderDescPage, arg_41_2)
	arg_41_0:ShowDiaglog(arg_41_2)
	getProxy(IslandProxy):GetIsland():GetOrderAgency():SetCacheSelectedId(arg_41_2.id)

	if arg_41_0.selected then
		setActive(arg_41_0.selected.transform:Find("sel"), false)
	end

	setActive(arg_41_1.transform:Find("sel"), true)
end

function var_0_0.ShowDiaglog(arg_42_0, arg_42_1)
	if not arg_42_1 or not arg_42_1:GetOrder() or arg_42_1:IsEmpty() or arg_42_1:IsLoading() then
		setActive(arg_42_0.charTr, false)

		return
	end

	local var_42_0 = arg_42_1:GetOrder()

	setActive(arg_42_0.charTr, true)

	local var_42_1 = var_42_0:GetRoleIcon()

	GetImageSpriteFromAtlasAsync("island/IslandShipIconHalf/" .. var_42_1, "", arg_42_0.charTr)

	arg_42_0.chatTxt.text = var_42_0:GetDesc()
end

function var_0_0.AddLoadingTimer(arg_43_0, arg_43_1, arg_43_2)
	local function var_43_0()
		arg_43_0:UpdateOrderState(arg_43_2.id)
	end

	local var_43_1 = arg_43_2:GetCanSubmitTime()
	local var_43_2 = arg_43_2:GetTotalTime()
	local var_43_3 = Timer.New(function()
		local var_45_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_45_1 = var_43_1 - var_45_0

		setText(arg_43_1.transform:Find("loading/time_label/Text"), pg.TimeMgr.GetInstance():DescCDTime(var_45_1))
		setFillAmount(arg_43_1.transform:Find("loading/progress"), 1 - var_45_1 / var_43_2)

		if var_45_1 <= 0 then
			var_43_0()
		end
	end, 1, -1)

	var_43_3:Start()
	var_43_3.func()

	arg_43_0.timers[arg_43_2.id] = var_43_3
end

function var_0_0.RemoveLoadingTimer(arg_46_0, arg_46_1)
	if arg_46_0.timers[arg_46_1] then
		arg_46_0.timers[arg_46_1]:Stop()

		arg_46_0.timers[arg_46_1] = nil
	end
end

function var_0_0.RemoveAllLoadingTimer(arg_47_0)
	for iter_47_0, iter_47_1 in pairs(arg_47_0.timers) do
		iter_47_1:Stop()
	end

	for iter_47_2, iter_47_3 in pairs(arg_47_0.disappearTimers) do
		iter_47_3:Stop()
	end

	arg_47_0.disappearTimers = {}
	arg_47_0.timers = {}
end

function var_0_0.UpdateExpPanel(arg_48_0, arg_48_1)
	arg_48_0.levelTxt.text = arg_48_1:GetLevel()

	if arg_48_1:IsMaxLevel() then
		arg_48_0.expTxt.text = "MAX"
	else
		local var_48_0 = arg_48_1:GetExp()
		local var_48_1 = math.max(1, arg_48_1:GetNextTargetExp())

		arg_48_0.expTxt.text = var_48_0 .. "/" .. var_48_1
	end
end

function var_0_0.OnDestroy(arg_49_0)
	if arg_49_0.upgradePage:GetLoaded() then
		arg_49_0.upgradePage:Destroy()

		arg_49_0.upgradePage = nil
	end

	if arg_49_0.orderTplPool then
		arg_49_0.orderTplPool:Dispose()

		arg_49_0.orderTplPool = nil
	end

	arg_49_0:RemoveAllLoadingTimer()
end

return var_0_0

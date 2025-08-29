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
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_9_0.OnSubmitOrder)
	arg_9_0:AddListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_9_0.OnReplaceOrder)
	arg_9_0:AddListener(IslandOrderAgency.GEN_NEW_ORDER, arg_9_0.OnGenNewOrder)
	arg_9_0:AddListener(IslandOrderAgency.UDPATE_ORDER, arg_9_0.OnFlushOrder)
	arg_9_0:AddListener(GAME.ISLAND_SET_ORDER_TENDENCY_DONE, arg_9_0.OnOrderTendencyChanged)
	arg_9_0:AddListener(IslandScene.ON_CHECK_ORDER_EXP_AWARD, arg_9_0.OnCheckOrderExpAward)
	arg_9_0:AddListener(var_0_0.ON_UPDADE, arg_9_0.OnUpgrade)
	arg_9_0:AddListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_9_0.OnUpdateFinishCnt)
end

function var_0_0.RemoveListener(arg_10_0)
	arg_10_0:RemoveListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_10_0.OnSubmitOrder)
	arg_10_0:RemoveListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_10_0.OnReplaceOrder)
	arg_10_0:RemoveListener(GAME.ISLAND_SET_ORDER_TENDENCY_DONE, arg_10_0.OnOrderTendencyChanged)
	arg_10_0:RemoveListener(IslandOrderAgency.GEN_NEW_ORDER, arg_10_0.OnGenNewOrder)
	arg_10_0:RemoveListener(IslandOrderAgency.UDPATE_ORDER, arg_10_0.OnFlushOrder)
	arg_10_0:RemoveListener(var_0_0.ON_UPDADE, arg_10_0.OnUpgrade)
	arg_10_0:RemoveListener(IslandOrderAgency.ORDER_FINISH_UPDATE, arg_10_0.OnUpdateFinishCnt)
end

function var_0_0.OnReset(arg_11_0)
	arg_11_0:Flush()
end

function var_0_0.OnUpgrade(arg_12_0, arg_12_1)
	arg_12_0.upgradePage:ExecuteAction("Show", arg_12_1.level, arg_12_1.callback)
end

function var_0_0.OnOrderTendencyChanged(arg_13_0)
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_13_0:UpdateTrendBtn(var_13_0)
end

function var_0_0.OnSubmitOrder(arg_14_0, arg_14_1)
	local var_14_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_14_0:UpdateExpPanel(var_14_0)
	arg_14_0:UpdateOrderState(arg_14_1.slotId)
	arg_14_0:UpdateCount(var_14_0)

	for iter_14_0, iter_14_1 in pairs(arg_14_0.orderTpls or {}) do
		arg_14_0:UpdateOrderState(iter_14_0)
	end
end

function var_0_0.OnReplaceOrder(arg_15_0, arg_15_1)
	arg_15_0:UpdateOrderState(arg_15_1.slotId)
end

function var_0_0.OnGenNewOrder(arg_16_0, arg_16_1)
	arg_16_0:UpdateOrderState(arg_16_1.slotId)
end

function var_0_0.OnFlushOrder(arg_17_0, arg_17_1)
	arg_17_0:UpdateOrderState(arg_17_1.slotId)
end

function var_0_0.OnCheckOrderExpAward(arg_18_0)
	arg_18_0:CheckOrderExpAward()
end

function var_0_0.OnUpdateFinishCnt(arg_19_0)
	local var_19_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_19_0:UpdateCount(var_19_0)
	arg_19_0:UpdateExpPanel(var_19_0)
end

function var_0_0.Show(arg_20_0)
	var_0_0.super.Show(arg_20_0)
	arg_20_0:Flush()
end

function var_0_0.Flush(arg_21_0)
	local var_21_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	arg_21_0:UpdateExpPanel(var_21_0)
	arg_21_0:GenOrderList(var_21_0)
	arg_21_0:TriggerOrder(var_21_0)
	arg_21_0:UpdateTrendBtn(var_21_0)
	arg_21_0:UpdateCount(var_21_0)
	arg_21_0:CheckOrderExpAward()
end

function var_0_0.UpdateCount(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1:GetMaxFinishCount()
	local var_22_1 = arg_22_1:GetFinishCnt()

	arg_22_0.countTxt.text = i18n("island_order_leftCnt_tip") .. var_22_0 - var_22_1 .. "/" .. var_22_0
end

function var_0_0.UpdateTrendBtn(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1:GetTendency()

	arg_23_0.trendTxt.text = IslandOrderSlot.TENDENCY2CN(var_23_0)

	local var_23_1 = ({
		"icon_common",
		"icon_easy",
		"icon_hard"
	})[var_23_0 + 1]
	local var_23_2 = GetSpriteFromAtlas("ui/IslandOrderUI_atlas", var_23_1)

	arg_23_0.trendIco.sprite = var_23_2
end

function var_0_0.CheckOrderExpAward(arg_24_0)
	local var_24_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetAllCanGetAwardList()
	local var_24_1 = {}

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		table.insert(var_24_1, function(arg_25_0)
			arg_24_0:emit(IslandMediator.ON_GET_ORDER_EXP_AWARD, iter_24_1, arg_25_0)
		end)
	end

	seriesAsync(var_24_1, function()
		if getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(IslandGuideChecker.ORDER_TASK_ID) then
			onDelayTick(function()
				IslandGuideChecker.CheckGuide("ISLAND_GUIDE_7", IslandGuideChecker.FINISH_TYPE.ON_GUIDE)
			end, 0.2)
		end
	end)
end

function var_0_0.TriggerOrder(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1:GetCacheSelectedId()
	local var_28_1 = arg_28_1:GetSlots()
	local var_28_2 = var_28_1[var_28_0]

	if var_28_2 and not var_28_2:IsEmpty() then
		local var_28_3 = arg_28_0.orderTpls[var_28_2.id]

		if var_28_3 then
			triggerButton(var_28_3)
		end
	else
		local var_28_4

		for iter_28_0, iter_28_1 in pairs(var_28_1) do
			if not iter_28_1:IsEmpty() then
				var_28_4 = iter_28_1

				break
			end
		end

		if var_28_4 then
			local var_28_5 = arg_28_0.orderTpls[var_28_4.id]

			if var_28_5 then
				triggerButton(var_28_5)
			end
		end
	end
end

function var_0_0.GenOrderList(arg_29_0, arg_29_1)
	arg_29_0:ReturnOrderTplList()

	local var_29_0 = arg_29_1:GetSlots()

	for iter_29_0, iter_29_1 in pairs(var_29_0) do
		arg_29_0:NewOrderTpl(iter_29_1.id)
		arg_29_0:UpdateOrderState(iter_29_1.id)
	end
end

function var_0_0.NewOrderTpl(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.orderTplPool:Dequeue()

	setParent(var_30_0, arg_30_0.orderContainer)

	arg_30_0.orderTpls[arg_30_1] = var_30_0

	return var_30_0
end

function var_0_0.ReturnOrderTplList(arg_31_0)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.orderTpls) do
		arg_31_0.orderTplPool:Enqueue(iter_31_1)
	end

	arg_31_0.orderTpls = {}
end

function var_0_0.UpdateOrderState(arg_32_0, arg_32_1)
	local var_32_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_32_1)
	local var_32_1 = arg_32_0.orderTpls[arg_32_1] or arg_32_0:NewOrderTpl(arg_32_1)

	arg_32_0:RemoveLoadingTimer(arg_32_1)
	arg_32_0:RemoveDisappearTimer(arg_32_1)
	arg_32_0:ShowDiaglog(var_32_0)

	if not var_32_0 or var_32_0:IsEmpty() then
		removeOnButton(var_32_1)
		setActive(var_32_1, false)

		return
	end

	var_32_1.transform.localPosition = var_32_0:GetPosition()

	setActive(var_32_1, true)
	onButton(arg_32_0, var_32_1, function()
		arg_32_0:ClickOrder(var_32_1, var_32_0)

		arg_32_0.selected = var_32_1
	end, SFX_PANEL)

	local var_32_2 = var_32_0:GetOrder()
	local var_32_3 = var_32_0:CanSubmit()

	setActive(var_32_1.transform:Find("bg_urgent"), var_32_2:IsUrgency())
	setActive(var_32_1.transform:Find("sel"), arg_32_0.selected and arg_32_0.selected == var_32_1)
	setActive(var_32_1.transform:Find("finish"), var_32_3)
	setActive(var_32_1.transform:Find("easy"), var_32_2:GetTendency() == IslandOrderSlot.TENDENCY_TYPE_EASY)
	setActive(var_32_1.transform:Find("hard"), var_32_2:GetTendency() == IslandOrderSlot.TENDENCY_TYPE_HARD)

	local var_32_4 = var_32_0:IsLoading()

	setActive(var_32_1.transform:Find("icon"), not var_32_4)
	setActive(var_32_1.transform:Find("loading"), var_32_4)
	setActive(var_32_1.transform:Find("bg/progress"), not var_32_4)

	local var_32_5 = var_32_2:GetRoleIcon()

	GetImageSpriteFromAtlasAsync("island/IslandShipIcon/" .. var_32_5, "", var_32_1.transform:Find("icon"))

	if var_32_4 then
		arg_32_0:AddLoadingTimer(var_32_1, var_32_0)
	end

	if var_32_2:IsUrgency() then
		arg_32_0:AddDisappearTimer(var_32_1, var_32_0)
	end
end

function var_0_0.AddDisappearTimer(arg_34_0, arg_34_1, arg_34_2)
	arg_34_0:RemoveDisappearTimer(arg_34_2.id)

	local var_34_0 = arg_34_2:GetDisappearTime()

	if var_34_0 <= pg.TimeMgr.GetInstance():GetServerTime() then
		return
	end

	arg_34_0.disappearTimers[arg_34_2.id] = Timer.New(function()
		local var_35_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_35_1 = var_34_0 - var_35_0
		local var_35_2 = pg.TimeMgr.GetInstance():DescCDTime(var_35_1)

		setText(arg_34_1.transform:Find("bg_urgent/time_label/Text"), var_35_2)

		if var_35_1 < 0 then
			arg_34_0:UpdateOrderState(arg_34_2.id)
		end
	end, 1, -1)

	arg_34_0.disappearTimers[arg_34_2.id].func()
	arg_34_0.disappearTimers[arg_34_2.id]:Start()
end

function var_0_0.RemoveDisappearTimer(arg_36_0, arg_36_1)
	if arg_36_0.disappearTimers[arg_36_1] then
		arg_36_0.disappearTimers[arg_36_1]:Stop()

		arg_36_0.disappearTimers[arg_36_1] = nil
	end
end

function var_0_0.ClickOrder(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0:OpenPage(IslandOrderDescPage, arg_37_2)
	arg_37_0:ShowDiaglog(arg_37_2)
	getProxy(IslandProxy):GetIsland():GetOrderAgency():SetCacheSelectedId(arg_37_2.id)

	if arg_37_0.selected then
		setActive(arg_37_0.selected.transform:Find("sel"), false)
	end

	setActive(arg_37_1.transform:Find("sel"), true)
end

function var_0_0.ShowDiaglog(arg_38_0, arg_38_1)
	if not arg_38_1 or not arg_38_1:GetOrder() or arg_38_1:IsEmpty() or arg_38_1:IsLoading() then
		setActive(arg_38_0.charTr, false)

		return
	end

	local var_38_0 = arg_38_1:GetOrder()

	setActive(arg_38_0.charTr, true)

	local var_38_1 = var_38_0:GetRoleIcon()

	GetImageSpriteFromAtlasAsync("island/IslandShipIconHalf/" .. var_38_1, "", arg_38_0.charTr)

	arg_38_0.chatTxt.text = var_38_0:GetDesc()
end

function var_0_0.AddLoadingTimer(arg_39_0, arg_39_1, arg_39_2)
	local function var_39_0()
		arg_39_0:UpdateOrderState(arg_39_2.id)
	end

	local var_39_1 = arg_39_2:GetCanSubmitTime()
	local var_39_2 = arg_39_2:GetTotalTime()
	local var_39_3 = Timer.New(function()
		local var_41_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_41_1 = var_39_1 - var_41_0

		setText(arg_39_1.transform:Find("loading/time_label/Text"), pg.TimeMgr.GetInstance():DescCDTime(var_41_1))
		setFillAmount(arg_39_1.transform:Find("loading/progress"), 1 - var_41_1 / var_39_2)

		if var_41_1 <= 0 then
			var_39_0()
		end
	end, 1, -1)

	var_39_3:Start()
	var_39_3.func()

	arg_39_0.timers[arg_39_2.id] = var_39_3
end

function var_0_0.RemoveLoadingTimer(arg_42_0, arg_42_1)
	if arg_42_0.timers[arg_42_1] then
		arg_42_0.timers[arg_42_1]:Stop()

		arg_42_0.timers[arg_42_1] = nil
	end
end

function var_0_0.RemoveAllLoadingTimer(arg_43_0)
	for iter_43_0, iter_43_1 in pairs(arg_43_0.timers) do
		iter_43_1:Stop()
	end

	for iter_43_2, iter_43_3 in pairs(arg_43_0.disappearTimers) do
		iter_43_3:Stop()
	end

	arg_43_0.disappearTimers = {}
	arg_43_0.timers = {}
end

function var_0_0.UpdateExpPanel(arg_44_0, arg_44_1)
	arg_44_0.levelTxt.text = arg_44_1:GetLevel()

	if arg_44_1:IsMaxLevel() then
		arg_44_0.expTxt.text = "MAX"
	else
		local var_44_0 = arg_44_1:GetExp()
		local var_44_1 = math.max(1, arg_44_1:GetNextTargetExp())

		arg_44_0.expTxt.text = var_44_0 .. "/" .. var_44_1
	end
end

function var_0_0.OnDestroy(arg_45_0)
	if arg_45_0.upgradePage:GetLoaded() then
		arg_45_0.upgradePage:Destroy()

		arg_45_0.upgradePage = nil
	end

	if arg_45_0.orderTplPool then
		arg_45_0.orderTplPool:Dispose()

		arg_45_0.orderTplPool = nil
	end

	arg_45_0:RemoveAllLoadingTimer()
end

return var_0_0

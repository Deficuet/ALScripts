local var_0_0 = class("IslandShipOrderPage", import("...base.IslandBasePage"))

var_0_0.MODE_REQUEST_VIEW = 0
var_0_0.MODE_AWARD_VIEW = 1
var_0_0.EVENT_CLOSE_LOAD_UP = "IslandShipOrderPage:EVENT_CLOSE_LOAD_UP"

function var_0_0.getUIName(arg_1_0)
	return "IslandShipOrderUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0._tf:Find("back")
	arg_2_0.uiSlots = UIItemList.New(arg_2_0._tf:Find("frame/list"), arg_2_0._tf:Find("frame/list/tpl"))
	arg_2_0.onekeySlots = UIItemList.New(arg_2_0._tf:Find("list_1"), arg_2_0._tf:Find("list_1/onekey"))
	arg_2_0.switchBtn = arg_2_0._tf:Find("frame/switch")
	arg_2_0.cards = {}
	arg_2_0.loadUpPage = IslandShipOrderLoadUpPage.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0.canvasGroup = GetOrAddComponent(arg_2_0._tf, typeof(CanvasGroup))
	arg_2_0.uilistAniamtion = arg_2_0._tf:Find("frame/list"):GetComponent(typeof(Animation))

	setText(arg_2_0._tf:Find("frame/switch/on/Text"), i18n("island_order_ship_page_req"))
	setText(arg_2_0._tf:Find("frame/switch/off/Text"), i18n("island_order_ship_page_award"))
	setText(arg_2_0._tf:Find("list_1/onekey/btn/Text"), i18n("island_order_ship_page_onekey_loadup"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("frame/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_ship_order.tip
		})
	end, SFX_PANEL)
	arg_3_0:bind(var_0_0.EVENT_CLOSE_LOAD_UP, function()
		arg_3_0:ClearSelected()
	end)
	triggerToggle(arg_3_0.switchBtn, false)
	onToggle(arg_3_0, arg_3_0.switchBtn, function(arg_7_0)
		arg_3_0:SwitchMode(arg_7_0)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_8_0.OnOrderUpdate)
	arg_8_0:AddListener(GAME.ISLAND_USE_TICKET_DONE, arg_8_0.OnUseTicketDone)
	arg_8_0:AddListener(GAME.ISLAND_REFRESH_SHIP_ORDER_DONE, arg_8_0.OnRefreshOrder)
	arg_8_0:AddListener(IslandShipOrderCard.EVENT_CD_END, arg_8_0.OnOrderReloadingEnd)
end

function var_0_0.RemoveListeners(arg_9_0)
	arg_9_0:RemoveListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_9_0.OnOrderUpdate)
	arg_9_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_9_0.OnUseTicketDone)
	arg_9_0:RemoveListener(GAME.ISLAND_REFRESH_SHIP_ORDER_DONE, arg_9_0.OnRefreshOrder)
	arg_9_0:RemoveListener(IslandShipOrderCard.EVENT_CD_END, arg_9_0.OnOrderReloadingEnd)
end

function var_0_0.OnOrderReloadingEnd(arg_10_0)
	arg_10_0:UpdateOnekeyBtns()
end

function var_0_0.OnRefreshOrder(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.id
	local var_11_1

	for iter_11_0, iter_11_1 in pairs(arg_11_0.cards) do
		if iter_11_1.slot.id == var_11_0 then
			var_11_1 = iter_11_1

			break
		end
	end

	if not var_11_1 then
		return
	end

	var_11_1:Flush(var_11_1.slot, arg_11_0.mode)
	arg_11_0:UpdateOnekeyBtns()
end

function var_0_0.OnOrderUpdate(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.id
	local var_12_1

	for iter_12_0, iter_12_1 in pairs(arg_12_0.cards) do
		if iter_12_1.slot.id == var_12_0 then
			var_12_1 = iter_12_1

			break
		end
	end

	if not var_12_1 then
		return
	end

	arg_12_0:ClearSelected()

	arg_12_0.canvasGroup.blocksRaycasts = false

	seriesAsync({
		function(arg_13_0)
			var_12_1:PlayAniamtion(arg_12_1.op, arg_12_1.isLoadUpAll, arg_13_0)
		end
	}, function()
		arg_12_0.canvasGroup.blocksRaycasts = true

		var_12_1:Flush(var_12_1.slot, arg_12_0.mode)
		arg_12_0:RegisterCardEvent(var_12_1)

		for iter_14_0, iter_14_1 in pairs(arg_12_0.cards) do
			iter_14_1:UpdateRequest(iter_14_1.slot)
		end

		arg_12_0:UpdateOnekeyBtns()
	end)
end

function var_0_0.OnUseTicketDone(arg_15_0, arg_15_1)
	if arg_15_1.type == IslandUseTicketCommand.TYPES.SHIP_ORDER or arg_15_1.type == IslandUseTicketCommand.TYPES.SHIP_ORDER_RELOAD then
		local var_15_0 = arg_15_1.id
		local var_15_1

		for iter_15_0, iter_15_1 in pairs(arg_15_0.cards) do
			if iter_15_1.slot.id == var_15_0 then
				var_15_1 = iter_15_1

				break
			end
		end

		if not var_15_1 then
			return
		end

		var_15_1:Flush(var_15_1.slot, arg_15_0.mode)
		arg_15_0:UpdateOnekeyBtns()
	end
end

function var_0_0.OnShow(arg_16_0)
	arg_16_0.mode = var_0_0.MODE_REQUEST_VIEW
	arg_16_0.canvasGroup.blocksRaycasts = true

	arg_16_0:FlushSlots()
	arg_16_0:UnlockFirstSlot()
end

function var_0_0.UnlockFirstSlot(arg_17_0)
	local var_17_0 = arg_17_0.displays[1]

	if var_17_0 and var_17_0:IsLock() and var_17_0:GetUnlockGold().count <= 0 then
		for iter_17_0, iter_17_1 in pairs(arg_17_0.cards) do
			if iter_17_1.slot.id == var_17_0.id then
				target = iter_17_1

				break
			end
		end

		if target then
			triggerButton(target.lockTr)
		end
	end
end

function var_0_0.SwitchMode(arg_18_0, arg_18_1)
	arg_18_0.mode = arg_18_1 and var_0_0.MODE_AWARD_VIEW or var_0_0.MODE_REQUEST_VIEW

	for iter_18_0, iter_18_1 in pairs(arg_18_0.cards) do
		iter_18_1:SwitchMode(iter_18_1.slot, arg_18_0.mode)
	end

	arg_18_0:ClearSelected()
	arg_18_0.uilistAniamtion:Stop()
	arg_18_0.uilistAniamtion:Play("anim_island_shiporder_list")
end

function var_0_0.GetDisplays(arg_19_0, ...)
	local var_19_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetShipSlotList()
	local var_19_1 = {}

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		table.insert(var_19_1, iter_19_1)
	end

	return var_19_1
end

function var_0_0.FlushSlots(arg_20_0)
	arg_20_0.displays = arg_20_0:GetDisplays()

	table.sort(arg_20_0.displays, function(arg_21_0, arg_21_1)
		return arg_21_0:GetUnlockLevel() < arg_21_1:GetUnlockLevel()
	end)
	arg_20_0.uiSlots:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			arg_20_0:UpdateSlot(arg_20_0.displays[arg_22_1 + 1], arg_22_2)
		end
	end)
	arg_20_0.uiSlots:align(#arg_20_0.displays)
	arg_20_0:UpdateOnekeyBtns()
end

function var_0_0.UpdateOnekeyBtns(arg_23_0)
	arg_23_0.onekeySlots:make(function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == UIItemList.EventUpdate then
			local var_24_0 = arg_24_2:Find("btn")
			local var_24_1 = arg_23_0.displays[arg_24_1 + 1]

			setActive(var_24_0, var_24_1:IsWaiting() and not var_24_1:IsReloading())

			local var_24_2 = var_24_1:IsWaiting() and not var_24_1:GetOrder():AnyCanLoadUp()

			setGray(var_24_0, var_24_2, true)

			if not var_24_2 then
				onButton(arg_23_0, var_24_0, function()
					if var_24_1:IsReloading() then
						return
					end

					arg_23_0:emit(IslandMediator.SUBMIT_SHIP_ORDER_ITME_ONEKEY, var_24_1.id)
				end, SFX_PANEL)
			else
				removeOnButton(var_24_0)
			end
		end
	end)
	arg_23_0.onekeySlots:align(#arg_23_0.displays)
end

function var_0_0.UpdateSlot(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.cards[arg_26_2] or IslandShipOrderCard.New(arg_26_2, arg_26_0)

	var_26_0:Flush(arg_26_1, arg_26_0.mode)
	onButton(arg_26_0, var_26_0.getBtn, function()
		arg_26_0:emit(IslandMediator.GET_SHIP_ORDER_AWARD, var_26_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_26_0, var_26_0.lockTr, function()
		arg_26_0:emit(IslandMediator.UNLOKC_SHIP_ORDER, var_26_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_26_0, var_26_0.loadingRequest, function()
		arg_26_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.SHIP_ORDER, var_26_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_26_0, var_26_0.refreshBtn, function()
		if not arg_26_1:CanRefresh() then
			arg_26_0:ShowMsgBox({
				hideNo = true,
				content = i18n("island_shiporder_refresh_tip1")
			})
		else
			arg_26_0:ShowMsgBox({
				content = i18n("island_shiporder_refresh_tip2"),
				onYes = function()
					arg_26_0:emit(IslandMediator.REFRESH_SHIP_ORDER, var_26_0.slot.id)
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_26_0, var_26_0.reloadingTr, function()
		arg_26_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.SHIP_ORDER_RELOAD, var_26_0.slot.id)
	end, SFX_PANEL)
	onNextTick(function()
		arg_26_0:RegisterCardEvent(var_26_0)
	end)

	arg_26_0.cards[arg_26_2] = var_26_0
end

function var_0_0.CheckSelected(arg_34_0, arg_34_1)
	if arg_34_0.loadUpItem == arg_34_1 then
		arg_34_0:ClearSelected()

		return false
	end

	return true
end

function var_0_0.RegisterCardEvent(arg_35_0, arg_35_1)
	arg_35_1.uiRequestList:each(function(arg_36_0, arg_36_1)
		onButton(arg_35_0, arg_36_1, function()
			if not arg_35_1.slot:IsWaiting() then
				return
			end

			if arg_35_1.slot:GetOrder():ItemIsSubmited(arg_36_0 + 1) then
				return
			end

			if not arg_35_0:CheckSelected(arg_36_1) then
				return
			end

			arg_35_0:ClearSelected()
			setActive(arg_36_1:Find("loaded_1"), true)
			arg_35_0:LoadUpItem(arg_35_1, arg_36_0 + 1, arg_36_1)
		end, SFX_PANEL)
	end)
end

function var_0_0.ClearSelected(arg_38_0)
	if arg_38_0.loadUpItem then
		setActive(arg_38_0.loadUpItem:Find("loaded_1"), false)
	end

	arg_38_0.loadUpItem = nil

	if arg_38_0.loadUpPage and arg_38_0.loadUpPage:GetLoaded() and arg_38_0.loadUpPage:isShowing() then
		arg_38_0.loadUpPage:Hide()
	end
end

function var_0_0.LoadUpItem(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = arg_39_0._tf:InverseTransformPoint(arg_39_3:Find("loaded_1").position)

	arg_39_0.loadUpPage:ExecuteAction("Show", Vector3(var_39_0.x, var_39_0.y, 0), arg_39_1.slot, arg_39_2)

	arg_39_0.loadUpItem = arg_39_3
end

function var_0_0.OnHide(arg_40_0)
	arg_40_0:ClearSelected()

	if arg_40_0.loadUpPage then
		arg_40_0.loadUpPage:Destroy()
		arg_40_0.loadUpPage:Reset()
	end
end

function var_0_0.OnDestroy(arg_41_0)
	for iter_41_0, iter_41_1 in pairs(arg_41_0.cards) do
		iter_41_1:Dispose()
	end

	arg_41_0.cards = {}

	if arg_41_0.loadUpPage then
		arg_41_0.loadUpPage:Destroy()

		arg_41_0.loadUpPage = nil
	end
end

return var_0_0

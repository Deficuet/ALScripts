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
end

function var_0_0.RemoveListeners(arg_9_0)
	arg_9_0:RemoveListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_9_0.OnOrderUpdate)
	arg_9_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_9_0.OnUseTicketDone)
	arg_9_0:RemoveListener(GAME.ISLAND_REFRESH_SHIP_ORDER_DONE, arg_9_0.OnRefreshOrder)
end

function var_0_0.OnRefreshOrder(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.id
	local var_10_1

	for iter_10_0, iter_10_1 in pairs(arg_10_0.cards) do
		if iter_10_1.slot.id == var_10_0 then
			var_10_1 = iter_10_1

			break
		end
	end

	if not var_10_1 then
		return
	end

	var_10_1:Flush(var_10_1.slot, arg_10_0.mode)
end

function var_0_0.OnOrderUpdate(arg_11_0, arg_11_1)
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

	arg_11_0:ClearSelected()

	arg_11_0.canvasGroup.blocksRaycasts = false

	seriesAsync({
		function(arg_12_0)
			var_11_1:PlayAniamtion(arg_11_1.op, arg_11_1.isLoadUpAll, arg_12_0)
		end
	}, function()
		arg_11_0.canvasGroup.blocksRaycasts = true

		var_11_1:Flush(var_11_1.slot, arg_11_0.mode)
		arg_11_0:RegisterCardEvent(var_11_1)

		for iter_13_0, iter_13_1 in pairs(arg_11_0.cards) do
			iter_13_1:UpdateRequest(iter_13_1.slot)
		end

		arg_11_0:UpdateOnekeyBtns()
	end)
end

function var_0_0.OnUseTicketDone(arg_14_0, arg_14_1)
	if arg_14_1.type == IslandUseTicketCommand.TYPES.SHIP_ORDER or arg_14_1.type == IslandUseTicketCommand.TYPES.SHIP_ORDER_RELOAD then
		local var_14_0 = arg_14_1.id
		local var_14_1

		for iter_14_0, iter_14_1 in pairs(arg_14_0.cards) do
			if iter_14_1.slot.id == var_14_0 then
				var_14_1 = iter_14_1

				break
			end
		end

		if not var_14_1 then
			return
		end

		var_14_1:Flush(var_14_1.slot, arg_14_0.mode)
	end
end

function var_0_0.OnShow(arg_15_0)
	arg_15_0.mode = var_0_0.MODE_REQUEST_VIEW
	arg_15_0.canvasGroup.blocksRaycasts = true

	arg_15_0:FlushSlots()
	arg_15_0:UnlockFirstSlot()
end

function var_0_0.UnlockFirstSlot(arg_16_0)
	local var_16_0 = arg_16_0.displays[1]

	if var_16_0 and var_16_0:IsLock() and var_16_0:GetUnlockGold().count <= 0 then
		for iter_16_0, iter_16_1 in pairs(arg_16_0.cards) do
			if iter_16_1.slot.id == var_16_0.id then
				target = iter_16_1

				break
			end
		end

		if target then
			triggerButton(target.lockTr)
		end
	end
end

function var_0_0.SwitchMode(arg_17_0, arg_17_1)
	arg_17_0.mode = arg_17_1 and var_0_0.MODE_AWARD_VIEW or var_0_0.MODE_REQUEST_VIEW

	for iter_17_0, iter_17_1 in pairs(arg_17_0.cards) do
		iter_17_1:SwitchMode(iter_17_1.slot, arg_17_0.mode)
	end

	arg_17_0:ClearSelected()
	arg_17_0.uilistAniamtion:Stop()
	arg_17_0.uilistAniamtion:Play("anim_island_shiporder_list")
end

function var_0_0.GetDisplays(arg_18_0, ...)
	local var_18_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetShipSlotList()
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in pairs(var_18_0) do
		table.insert(var_18_1, iter_18_1)
	end

	return var_18_1
end

function var_0_0.FlushSlots(arg_19_0)
	arg_19_0.displays = arg_19_0:GetDisplays()

	table.sort(arg_19_0.displays, function(arg_20_0, arg_20_1)
		return arg_20_0:GetUnlockLevel() < arg_20_1:GetUnlockLevel()
	end)
	arg_19_0.uiSlots:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			arg_19_0:UpdateSlot(arg_19_0.displays[arg_21_1 + 1], arg_21_2)
		end
	end)
	arg_19_0.uiSlots:align(#arg_19_0.displays)
	arg_19_0:UpdateOnekeyBtns()
end

function var_0_0.UpdateOnekeyBtns(arg_22_0)
	arg_22_0.onekeySlots:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = arg_23_2:Find("btn")
			local var_23_1 = arg_22_0.displays[arg_23_1 + 1]

			setActive(var_23_0, var_23_1:IsWaiting())

			local var_23_2 = var_23_1:IsWaiting() and not var_23_1:GetOrder():AnyCanLoadUp()

			setGray(var_23_0, var_23_2, true)

			if not var_23_2 then
				onButton(arg_22_0, var_23_0, function()
					arg_22_0:emit(IslandMediator.SUBMIT_SHIP_ORDER_ITME_ONEKEY, var_23_1.id)
				end, SFX_PANEL)
			else
				removeOnButton(var_23_0)
			end
		end
	end)
	arg_22_0.onekeySlots:align(#arg_22_0.displays)
end

function var_0_0.UpdateSlot(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.cards[arg_25_2] or IslandShipOrderCard.New(arg_25_2, arg_25_0)

	var_25_0:Flush(arg_25_1, arg_25_0.mode)
	onButton(arg_25_0, var_25_0.getBtn, function()
		arg_25_0:emit(IslandMediator.GET_SHIP_ORDER_AWARD, var_25_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_25_0, var_25_0.lockTr, function()
		arg_25_0:emit(IslandMediator.UNLOKC_SHIP_ORDER, var_25_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_25_0, var_25_0.loadingRequest, function()
		arg_25_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.SHIP_ORDER, var_25_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_25_0, var_25_0.refreshBtn, function()
		if not arg_25_1:CanRefresh() then
			arg_25_0:ShowMsgBox({
				hideNo = true,
				content = i18n("island_shiporder_refresh_tip1")
			})
		else
			arg_25_0:ShowMsgBox({
				content = i18n("island_shiporder_refresh_tip2"),
				onYes = function()
					arg_25_0:emit(IslandMediator.REFRESH_SHIP_ORDER, var_25_0.slot.id)
				end
			})
		end
	end, SFX_PANEL)
	onButton(arg_25_0, var_25_0.reloadingTr, function()
		arg_25_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.SHIP_ORDER_RELOAD, var_25_0.slot.id)
	end, SFX_PANEL)
	onNextTick(function()
		arg_25_0:RegisterCardEvent(var_25_0)
	end)

	arg_25_0.cards[arg_25_2] = var_25_0
end

function var_0_0.CheckSelected(arg_33_0, arg_33_1)
	if arg_33_0.loadUpItem == arg_33_1 then
		arg_33_0:ClearSelected()

		return false
	end

	return true
end

function var_0_0.RegisterCardEvent(arg_34_0, arg_34_1)
	arg_34_1.uiRequestList:each(function(arg_35_0, arg_35_1)
		onButton(arg_34_0, arg_35_1, function()
			if not arg_34_1.slot:IsWaiting() then
				return
			end

			if arg_34_1.slot:GetOrder():ItemIsSubmited(arg_35_0 + 1) then
				return
			end

			if not arg_34_0:CheckSelected(arg_35_1) then
				return
			end

			arg_34_0:ClearSelected()
			setActive(arg_35_1:Find("loaded_1"), true)
			arg_34_0:LoadUpItem(arg_34_1, arg_35_0 + 1, arg_35_1)
		end, SFX_PANEL)
	end)
end

function var_0_0.ClearSelected(arg_37_0)
	if arg_37_0.loadUpItem then
		setActive(arg_37_0.loadUpItem:Find("loaded_1"), false)
	end

	arg_37_0.loadUpItem = nil

	if arg_37_0.loadUpPage and arg_37_0.loadUpPage:GetLoaded() and arg_37_0.loadUpPage:isShowing() then
		arg_37_0.loadUpPage:Hide()
	end
end

function var_0_0.LoadUpItem(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	local var_38_0 = arg_38_0._tf:InverseTransformPoint(arg_38_3:Find("loaded_1").position)

	arg_38_0.loadUpPage:ExecuteAction("Show", Vector3(var_38_0.x, var_38_0.y, 0), arg_38_1.slot, arg_38_2)

	arg_38_0.loadUpItem = arg_38_3
end

function var_0_0.OnHide(arg_39_0)
	arg_39_0:ClearSelected()

	if arg_39_0.loadUpPage then
		arg_39_0.loadUpPage:Destroy()
		arg_39_0.loadUpPage:Reset()
	end
end

function var_0_0.OnDestroy(arg_40_0)
	for iter_40_0, iter_40_1 in pairs(arg_40_0.cards) do
		iter_40_1:Dispose()
	end

	arg_40_0.cards = {}

	if arg_40_0.loadUpPage then
		arg_40_0.loadUpPage:Destroy()

		arg_40_0.loadUpPage = nil
	end
end

return var_0_0

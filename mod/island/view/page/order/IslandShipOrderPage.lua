local var_0_0 = class("IslandShipOrderPage", import("...base.IslandBasePage"))

var_0_0.MODE_REQUEST_VIEW = 0
var_0_0.MODE_AWARD_VIEW = 1
var_0_0.EVENT_CLOSE_LOAD_UP = "IslandShipOrderPage:EVENT_CLOSE_LOAD_UP"

function var_0_0.getUIName(arg_1_0)
	return "IslandShipOrderUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("back")
	arg_2_0.uiSlots = UIItemList.New(arg_2_0:findTF("frame/list"), arg_2_0:findTF("frame/list/tpl"))
	arg_2_0.onekeySlots = UIItemList.New(arg_2_0:findTF("list_1"), arg_2_0:findTF("list_1/onekey"))
	arg_2_0.switchBtn = arg_2_0:findTF("frame/switch")
	arg_2_0.cards = {}
	arg_2_0.loadUpPage = IslandShipOrderLoadUpPage.New(arg_2_0._tf, arg_2_0.event)
	arg_2_0.canvasGroup = GetOrAddComponent(arg_2_0._tf, typeof(CanvasGroup))
	arg_2_0.uilistAniamtion = arg_2_0._tf:Find("frame/list"):GetComponent(typeof(Animation))

	setText(arg_2_0:findTF("frame/switch/on/Text"), i18n("island_order_ship_page_req"))
	setText(arg_2_0:findTF("frame/switch/off/Text"), i18n("island_order_ship_page_award"))
	setText(arg_2_0:findTF("list_1/onekey/btn/Text"), i18n("island_order_ship_page_onekey_loadup"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0:findTF("frame/help"), function()
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
end

function var_0_0.RemoveListeners(arg_9_0)
	arg_9_0:RemoveListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_9_0.OnOrderUpdate)
	arg_9_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_9_0.OnUseTicketDone)
end

function var_0_0.OnOrderUpdate(arg_10_0, arg_10_1)
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

	arg_10_0:ClearSelected()

	arg_10_0.canvasGroup.blocksRaycasts = false

	seriesAsync({
		function(arg_11_0)
			var_10_1:PlayAniamtion(arg_10_1.op, arg_10_1.isLoadUpAll, arg_11_0)
		end
	}, function()
		arg_10_0.canvasGroup.blocksRaycasts = true

		var_10_1:Flush(var_10_1.slot, arg_10_0.mode)
		arg_10_0:RegisterCardEvent(var_10_1)

		for iter_12_0, iter_12_1 in pairs(arg_10_0.cards) do
			iter_12_1:UpdateRequest(iter_12_1.slot)
		end

		arg_10_0:UpdateOnekeyBtns()
	end)
end

function var_0_0.OnUseTicketDone(arg_13_0, arg_13_1)
	if arg_13_1.type == IslandUseTicketCommand.TYPES.SHIP_ORDER then
		local var_13_0 = arg_13_1.id
		local var_13_1

		for iter_13_0, iter_13_1 in pairs(arg_13_0.cards) do
			if iter_13_1.slot.id == var_13_0 then
				var_13_1 = iter_13_1

				break
			end
		end

		if not var_13_1 then
			return
		end

		var_13_1:Flush(var_13_1.slot, arg_13_0.mode)
	end
end

function var_0_0.OnShow(arg_14_0)
	arg_14_0.mode = var_0_0.MODE_REQUEST_VIEW
	arg_14_0.canvasGroup.blocksRaycasts = true

	arg_14_0:FlushSlots()
	arg_14_0:UnlockFirstSlot()
end

function var_0_0.UnlockFirstSlot(arg_15_0)
	local var_15_0 = arg_15_0.displays[1]

	if var_15_0 and var_15_0:IsLock() and var_15_0:GetUnlockGold().count <= 0 then
		for iter_15_0, iter_15_1 in pairs(arg_15_0.cards) do
			if iter_15_1.slot.id == var_15_0.id then
				target = iter_15_1

				break
			end
		end

		if target then
			triggerButton(target.lockTr)
		end
	end
end

function var_0_0.SwitchMode(arg_16_0, arg_16_1)
	arg_16_0.mode = arg_16_1 and var_0_0.MODE_AWARD_VIEW or var_0_0.MODE_REQUEST_VIEW

	for iter_16_0, iter_16_1 in pairs(arg_16_0.cards) do
		iter_16_1:SwitchMode(iter_16_1.slot, arg_16_0.mode)
	end

	arg_16_0:ClearSelected()
	arg_16_0.uilistAniamtion:Stop()
	arg_16_0.uilistAniamtion:Play("anim_island_shiporder_list")
end

function var_0_0.GetDisplays(arg_17_0, ...)
	local var_17_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetShipSlotList()
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in pairs(var_17_0) do
		table.insert(var_17_1, iter_17_1)
	end

	return var_17_1
end

function var_0_0.FlushSlots(arg_18_0)
	arg_18_0.displays = arg_18_0:GetDisplays()

	table.sort(arg_18_0.displays, function(arg_19_0, arg_19_1)
		return arg_19_0:GetUnlockLevel() < arg_19_1:GetUnlockLevel()
	end)
	arg_18_0.uiSlots:make(function(arg_20_0, arg_20_1, arg_20_2)
		if arg_20_0 == UIItemList.EventUpdate then
			arg_18_0:UpdateSlot(arg_18_0.displays[arg_20_1 + 1], arg_20_2)
		end
	end)
	arg_18_0.uiSlots:align(#arg_18_0.displays)
	arg_18_0:UpdateOnekeyBtns()
end

function var_0_0.UpdateOnekeyBtns(arg_21_0)
	arg_21_0.onekeySlots:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = arg_22_2:Find("btn")
			local var_22_1 = arg_21_0.displays[arg_22_1 + 1]

			setActive(var_22_0, var_22_1:IsWaiting())

			local var_22_2 = var_22_1:IsWaiting() and not var_22_1:GetOrder():AnyCanLoadUp()

			setGray(var_22_0, var_22_2, true)

			if not var_22_2 then
				onButton(arg_21_0, var_22_0, function()
					arg_21_0:emit(IslandMediator.SUBMIT_SHIP_ORDER_ITME_ONEKEY, var_22_1.id)
				end, SFX_PANEL)
			else
				removeOnButton(var_22_0)
			end
		end
	end)
	arg_21_0.onekeySlots:align(#arg_21_0.displays)
end

function var_0_0.UpdateSlot(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.cards[arg_24_2] or IslandShipOrderCard.New(arg_24_2)

	var_24_0:Flush(arg_24_1, arg_24_0.mode)
	onButton(arg_24_0, var_24_0.getBtn, function()
		arg_24_0:emit(IslandMediator.GET_SHIP_ORDER_AWARD, var_24_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_24_0, var_24_0.lockTr, function()
		arg_24_0:emit(IslandMediator.UNLOKC_SHIP_ORDER, var_24_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_24_0, var_24_0.loadingRequest, function()
		arg_24_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.SHIP_ORDER, var_24_0.slot.id)
	end, SFX_PANEL)
	onNextTick(function()
		arg_24_0:RegisterCardEvent(var_24_0)
	end)

	arg_24_0.cards[arg_24_2] = var_24_0
end

function var_0_0.CheckSelected(arg_29_0, arg_29_1)
	if arg_29_0.loadUpItem == arg_29_1 then
		arg_29_0:ClearSelected()

		return false
	end

	return true
end

function var_0_0.RegisterCardEvent(arg_30_0, arg_30_1)
	arg_30_1.uiRequestList:each(function(arg_31_0, arg_31_1)
		onButton(arg_30_0, arg_31_1, function()
			if not arg_30_1.slot:IsWaiting() then
				return
			end

			if arg_30_1.slot:GetOrder():ItemIsSubmited(arg_31_0 + 1) then
				return
			end

			if not arg_30_0:CheckSelected(arg_31_1) then
				return
			end

			arg_30_0:ClearSelected()
			setActive(arg_31_1:Find("loaded_1"), true)
			arg_30_0:LoadUpItem(arg_30_1, arg_31_0 + 1, arg_31_1)
		end, SFX_PANEL)
	end)
end

function var_0_0.ClearSelected(arg_33_0)
	if arg_33_0.loadUpItem then
		setActive(arg_33_0.loadUpItem:Find("loaded_1"), false)
	end

	arg_33_0.loadUpItem = nil

	if arg_33_0.loadUpPage and arg_33_0.loadUpPage:GetLoaded() and arg_33_0.loadUpPage:isShowing() then
		arg_33_0.loadUpPage:Hide()
	end
end

function var_0_0.LoadUpItem(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local var_34_0 = arg_34_0._tf:InverseTransformPoint(arg_34_3:Find("loaded_1").position)

	arg_34_0.loadUpPage:ExecuteAction("Show", Vector3(var_34_0.x, var_34_0.y, 0), arg_34_1.slot, arg_34_2)

	arg_34_0.loadUpItem = arg_34_3
end

function var_0_0.OnHide(arg_35_0)
	arg_35_0:ClearSelected()

	if arg_35_0.loadUpPage then
		arg_35_0.loadUpPage:Destroy()
		arg_35_0.loadUpPage:Reset()
	end
end

function var_0_0.OnDestroy(arg_36_0)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.cards) do
		iter_36_1:Dispose()
	end

	arg_36_0.cards = {}

	if arg_36_0.loadUpPage then
		arg_36_0.loadUpPage:Destroy()

		arg_36_0.loadUpPage = nil
	end
end

return var_0_0

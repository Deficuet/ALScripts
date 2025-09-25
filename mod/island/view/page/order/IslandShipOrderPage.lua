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
	arg_3_0:bind(var_0_0.EVENT_CLOSE_LOAD_UP, function()
		arg_3_0:ClearSelected()
	end)
	triggerToggle(arg_3_0.switchBtn, false)
	onToggle(arg_3_0, arg_3_0.switchBtn, function(arg_6_0)
		arg_3_0:SwitchMode(arg_6_0)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_7_0.OnOrderUpdate)
	arg_7_0:AddListener(GAME.ISLAND_USE_TICKET_DONE, arg_7_0.OnUseTicketDone)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_8_0.OnOrderUpdate)
	arg_8_0:RemoveListener(GAME.ISLAND_USE_TICKET_DONE, arg_8_0.OnUseTicketDone)
end

function var_0_0.OnOrderUpdate(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.id
	local var_9_1

	for iter_9_0, iter_9_1 in pairs(arg_9_0.cards) do
		if iter_9_1.slot.id == var_9_0 then
			var_9_1 = iter_9_1

			break
		end
	end

	if not var_9_1 then
		return
	end

	arg_9_0:ClearSelected()

	arg_9_0.canvasGroup.blocksRaycasts = false

	seriesAsync({
		function(arg_10_0)
			var_9_1:PlayAniamtion(arg_9_1.op, arg_9_1.isLoadUpAll, arg_10_0)
		end
	}, function()
		arg_9_0.canvasGroup.blocksRaycasts = true

		var_9_1:Flush(var_9_1.slot, arg_9_0.mode)
		arg_9_0:RegisterCardEvent(var_9_1)

		for iter_11_0, iter_11_1 in pairs(arg_9_0.cards) do
			iter_11_1:UpdateRequest(iter_11_1.slot)
		end

		arg_9_0:UpdateOnekeyBtns()
	end)
end

function var_0_0.OnUseTicketDone(arg_12_0, arg_12_1)
	if arg_12_1.type == IslandUseTicketCommand.TYPES.SHIP_ORDER then
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

		var_12_1:Flush(var_12_1.slot, arg_12_0.mode)
	end
end

function var_0_0.OnShow(arg_13_0)
	arg_13_0.mode = var_0_0.MODE_REQUEST_VIEW
	arg_13_0.canvasGroup.blocksRaycasts = true

	arg_13_0:FlushSlots()
	arg_13_0:UnlockFirstSlot()
end

function var_0_0.UnlockFirstSlot(arg_14_0)
	local var_14_0 = arg_14_0.displays[1]

	if var_14_0 and var_14_0:IsLock() and var_14_0:GetUnlockGold().count <= 0 then
		for iter_14_0, iter_14_1 in pairs(arg_14_0.cards) do
			if iter_14_1.slot.id == var_14_0.id then
				target = iter_14_1

				break
			end
		end

		if target then
			triggerButton(target.lockTr)
		end
	end
end

function var_0_0.SwitchMode(arg_15_0, arg_15_1)
	arg_15_0.mode = arg_15_1 and var_0_0.MODE_AWARD_VIEW or var_0_0.MODE_REQUEST_VIEW

	for iter_15_0, iter_15_1 in pairs(arg_15_0.cards) do
		iter_15_1:SwitchMode(iter_15_1.slot, arg_15_0.mode)
	end

	arg_15_0:ClearSelected()
	arg_15_0.uilistAniamtion:Stop()
	arg_15_0.uilistAniamtion:Play("anim_island_shiporder_list")
end

function var_0_0.GetDisplays(arg_16_0, ...)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetShipSlotList()
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in pairs(var_16_0) do
		table.insert(var_16_1, iter_16_1)
	end

	return var_16_1
end

function var_0_0.FlushSlots(arg_17_0)
	arg_17_0.displays = arg_17_0:GetDisplays()

	table.sort(arg_17_0.displays, function(arg_18_0, arg_18_1)
		return arg_18_0:GetUnlockLevel() < arg_18_1:GetUnlockLevel()
	end)
	arg_17_0.uiSlots:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			arg_17_0:UpdateSlot(arg_17_0.displays[arg_19_1 + 1], arg_19_2)
		end
	end)
	arg_17_0.uiSlots:align(#arg_17_0.displays)
	arg_17_0:UpdateOnekeyBtns()
end

function var_0_0.UpdateOnekeyBtns(arg_20_0)
	arg_20_0.onekeySlots:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = arg_21_2:Find("btn")
			local var_21_1 = arg_20_0.displays[arg_21_1 + 1]

			setActive(var_21_0, var_21_1:IsWaiting())

			local var_21_2 = var_21_1:IsWaiting() and not var_21_1:GetOrder():AnyCanLoadUp()

			setGray(var_21_0, var_21_2, true)

			if not var_21_2 then
				onButton(arg_20_0, var_21_0, function()
					arg_20_0:emit(IslandMediator.SUBMIT_SHIP_ORDER_ITME_ONEKEY, var_21_1.id)
				end, SFX_PANEL)
			else
				removeOnButton(var_21_0)
			end
		end
	end)
	arg_20_0.onekeySlots:align(#arg_20_0.displays)
end

function var_0_0.UpdateSlot(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.cards[arg_23_2] or IslandShipOrderCard.New(arg_23_2)

	var_23_0:Flush(arg_23_1, arg_23_0.mode)
	onButton(arg_23_0, var_23_0.getBtn, function()
		arg_23_0:emit(IslandMediator.GET_SHIP_ORDER_AWARD, var_23_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_23_0, var_23_0.lockTr, function()
		arg_23_0:emit(IslandMediator.UNLOKC_SHIP_ORDER, var_23_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_23_0, var_23_0.loadingRequest, function()
		arg_23_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.SHIP_ORDER, var_23_0.slot.id)
	end, SFX_PANEL)
	onNextTick(function()
		arg_23_0:RegisterCardEvent(var_23_0)
	end)

	arg_23_0.cards[arg_23_2] = var_23_0
end

function var_0_0.CheckSelected(arg_28_0, arg_28_1)
	if arg_28_0.loadUpItem == arg_28_1 then
		arg_28_0:ClearSelected()

		return false
	end

	return true
end

function var_0_0.RegisterCardEvent(arg_29_0, arg_29_1)
	arg_29_1.uiRequestList:each(function(arg_30_0, arg_30_1)
		onButton(arg_29_0, arg_30_1, function()
			if not arg_29_1.slot:IsWaiting() then
				return
			end

			if arg_29_1.slot:GetOrder():ItemIsSubmited(arg_30_0 + 1) then
				return
			end

			if not arg_29_0:CheckSelected(arg_30_1) then
				return
			end

			arg_29_0:ClearSelected()
			setActive(arg_30_1:Find("loaded_1"), true)
			arg_29_0:LoadUpItem(arg_29_1, arg_30_0 + 1, arg_30_1)
		end, SFX_PANEL)
	end)
end

function var_0_0.ClearSelected(arg_32_0)
	if arg_32_0.loadUpItem then
		setActive(arg_32_0.loadUpItem:Find("loaded_1"), false)
	end

	arg_32_0.loadUpItem = nil

	if arg_32_0.loadUpPage and arg_32_0.loadUpPage:GetLoaded() and arg_32_0.loadUpPage:isShowing() then
		arg_32_0.loadUpPage:Hide()
	end
end

function var_0_0.LoadUpItem(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	local var_33_0 = arg_33_0._tf:InverseTransformPoint(arg_33_3:Find("loaded_1").position)

	arg_33_0.loadUpPage:ExecuteAction("Show", Vector3(var_33_0.x, var_33_0.y, 0), arg_33_1.slot, arg_33_2)

	arg_33_0.loadUpItem = arg_33_3
end

function var_0_0.OnHide(arg_34_0)
	arg_34_0:ClearSelected()

	if arg_34_0.loadUpPage then
		arg_34_0.loadUpPage:Destroy()
		arg_34_0.loadUpPage:Reset()
	end
end

function var_0_0.OnDestroy(arg_35_0)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.cards) do
		iter_35_1:Dispose()
	end

	arg_35_0.cards = {}

	if arg_35_0.loadUpPage then
		arg_35_0.loadUpPage:Destroy()

		arg_35_0.loadUpPage = nil
	end
end

return var_0_0

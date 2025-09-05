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
	arg_2_0.animator = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.aniDft = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
	arg_2_0.canvasGroup = GetOrAddComponent(arg_2_0._tf, typeof(CanvasGroup))
	arg_2_0.uilistAniamtion = arg_2_0._tf:Find("frame/list"):GetComponent(typeof(Animation))

	setText(arg_2_0:findTF("frame/switch/on/Text"), i18n("island_order_ship_page_req"))
	setText(arg_2_0:findTF("frame/switch/off/Text"), i18n("island_order_ship_page_award"))
	setText(arg_2_0:findTF("list_1/onekey/btn/Text"), i18n("island_order_ship_page_onekey_loadup"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:PlayExitAnimation(function()
			arg_3_0:Hide()
		end)
	end, SFX_PANEL)
	arg_3_0:bind(var_0_0.EVENT_CLOSE_LOAD_UP, function()
		arg_3_0:ClearSelected()
	end)
	triggerToggle(arg_3_0.switchBtn, false)
	onToggle(arg_3_0, arg_3_0.switchBtn, function(arg_7_0)
		arg_3_0:SwitchMode(arg_7_0)
	end, SFX_PANEL)
end

function var_0_0.PlayExitAnimation(arg_8_0, arg_8_1)
	arg_8_0.canvasGroup.blocksRaycasts = false

	arg_8_0.aniDft:SetEndEvent(function()
		arg_8_0.canvasGroup.blocksRaycasts = true

		if arg_8_1 then
			arg_8_1()
		end
	end)
	arg_8_0.animator:Play("anim_island_shiporder_out")
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_10_0.OnOrderUpdate)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_11_0.OnOrderUpdate)
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
	local var_25_0 = arg_25_0.cards[arg_25_2] or IslandShipOrderCard.New(arg_25_2)

	var_25_0:Flush(arg_25_1, arg_25_0.mode)
	onButton(arg_25_0, var_25_0.getBtn, function()
		arg_25_0:emit(IslandMediator.GET_SHIP_ORDER_AWARD, var_25_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_25_0, var_25_0.lockTr, function()
		arg_25_0:emit(IslandMediator.UNLOKC_SHIP_ORDER, var_25_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_25_0, var_25_0.loadingRequest, function()
		return
	end, SFX_PANEL)
	onNextTick(function()
		arg_25_0:RegisterCardEvent(var_25_0)
	end)

	arg_25_0.cards[arg_25_2] = var_25_0
end

function var_0_0.CheckSelected(arg_30_0, arg_30_1)
	if arg_30_0.loadUpItem == arg_30_1 then
		arg_30_0:ClearSelected()

		return false
	end

	return true
end

function var_0_0.RegisterCardEvent(arg_31_0, arg_31_1)
	arg_31_1.uiRequestList:each(function(arg_32_0, arg_32_1)
		onButton(arg_31_0, arg_32_1, function()
			if not arg_31_1.slot:IsWaiting() then
				return
			end

			if arg_31_1.slot:GetOrder():ItemIsSubmited(arg_32_0 + 1) then
				return
			end

			if not arg_31_0:CheckSelected(arg_32_1) then
				return
			end

			arg_31_0:ClearSelected()
			setActive(arg_32_1:Find("loaded_1"), true)
			arg_31_0:LoadUpItem(arg_31_1, arg_32_0 + 1, arg_32_1)
		end, SFX_PANEL)
	end)
end

function var_0_0.ClearSelected(arg_34_0)
	if arg_34_0.loadUpItem then
		setActive(arg_34_0.loadUpItem:Find("loaded_1"), false)
	end

	arg_34_0.loadUpItem = nil

	if arg_34_0.loadUpPage and arg_34_0.loadUpPage:GetLoaded() and arg_34_0.loadUpPage:isShowing() then
		arg_34_0.loadUpPage:Hide()
	end
end

function var_0_0.LoadUpItem(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = arg_35_0._tf:InverseTransformPoint(arg_35_3:Find("loaded_1").position)

	arg_35_0.loadUpPage:ExecuteAction("Show", Vector3(var_35_0.x, var_35_0.y, 0), arg_35_1.slot, arg_35_2)

	arg_35_0.loadUpItem = arg_35_3
end

function var_0_0.OnHide(arg_36_0)
	arg_36_0:ClearSelected()

	if arg_36_0.loadUpPage then
		arg_36_0.loadUpPage:Destroy()
		arg_36_0.loadUpPage:Reset()
	end
end

function var_0_0.OnDestroy(arg_37_0)
	for iter_37_0, iter_37_1 in pairs(arg_37_0.cards) do
		iter_37_1:Dispose()
	end

	arg_37_0.cards = {}

	if arg_37_0.loadUpPage then
		arg_37_0.loadUpPage:Destroy()

		arg_37_0.loadUpPage = nil
	end
end

return var_0_0

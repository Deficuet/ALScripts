local var_0_0 = class("IslandShipStatusPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipStatusUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.scrollRect = arg_2_0._tf:Find("adapt/attr_panel/srcollrect"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	arg_2_0.giveBtn = arg_2_0._tf:Find("adapt/attr_panel/send_panel/give_btn")
	arg_2_0.emptyTr = arg_2_0._tf:Find("adapt/attr_panel/send_panel/empty")
	arg_2_0.giftEffectList = UIItemList.New(arg_2_0._tf:Find("adapt/attr_panel/send_panel/scrollrect/list"), arg_2_0._tf:Find("adapt/attr_panel/send_panel/scrollrect/list/tpl"))
	arg_2_0.statusPanel = IslandShipStatusPanel.New(arg_2_0._tf:Find("adapt/attr_panel/status"), arg_2_0._tf:Find("adapt/attr_panel/status_empty"))

	setText(arg_2_0.emptyTr:Find("Text"), i18n("island_select_ship_gift"))

	arg_2_0.powerTr = arg_2_0._tf:Find("adapt/attr_panel/power")

	setText(arg_2_0.powerTr:Find("Text"), i18n("island_gift_tip_title"))
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0.cards = {}

	onButton(arg_5_0, arg_5_0.giveBtn, function()
		if not arg_5_0.selectedId then
			return
		end

		local var_6_0 = {}

		if arg_5_0.addPower + arg_5_0.curPower > arg_5_0.maxPower then
			table.insert(var_6_0, function(arg_7_0)
				arg_5_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_gift_tip"),
					onYes = arg_7_0
				})
			end)
		end

		local var_6_1 = arg_5_0:CollectGiftBuffs(arg_5_0.selectedId)

		for iter_6_0, iter_6_1 in ipairs(var_6_1) do
			table.insert(var_6_0, function(arg_8_0)
				IslandAddShipStatusHelper.CheckAddStatus(arg_5_0, arg_5_0.ship, iter_6_1, arg_8_0)
			end)
		end

		seriesAsync(var_6_0, function()
			arg_5_0:emit(IslandMediator.ON_GIVE_GIFT, arg_5_0.selectedId, 1, arg_5_0.shipId)
		end)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(GAME.ISLAND_GIVE_GIFT_DONE, arg_10_0.OnUseItem)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(GAME.ISLAND_GIVE_GIFT_DONE, arg_11_0.OnUseItem)
end

function var_0_0.OnUseItem(arg_12_0)
	arg_12_0.selectedId = nil

	arg_12_0:FlushStatus(arg_12_0.ship)
	arg_12_0:FlushGifts()
	arg_12_0:FlushPower()
end

function var_0_0.OnShow(arg_13_0, arg_13_1)
	arg_13_0.selectedId = nil

	local var_13_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_13_1)

	if var_13_0 == nil then
		return
	end

	arg_13_0.ship = var_13_0
	arg_13_0.shipId = arg_13_0.ship.id

	arg_13_0:FlushStatus(var_13_0)
	arg_13_0:FlushGifts()
	arg_13_0:FlushPower()
	arg_13_0:UpdateSelected(arg_13_0.selectedId)
end

function var_0_0.FlushStatus(arg_14_0, arg_14_1)
	arg_14_0.statusPanel:Flush(arg_14_1)

	local var_14_0 = arg_14_1:GetDisplayStatus()

	onButton(arg_14_0, arg_14_0.statusPanel.viewBtn, function()
		arg_14_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_SHIP_OWN_STATUS,
			title = i18n("island_word_ship_buff_desc"),
			statusList = var_14_0
		})
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_16_0, arg_16_1)
	local var_16_0 = IslandGiftCard.New(arg_16_1)

	onButton(arg_16_0, var_16_0.go, function()
		if var_16_0.item:GetCount() <= 0 then
			arg_16_0:ShowMsgBox({
				title = i18n("island_word_ship_buff_desc"),
				type = IslandMsgBox.TYPE_COMMON_ITEM,
				itemId = var_16_0.item.id
			})

			return
		end

		arg_16_0.selectedId = nil

		for iter_17_0, iter_17_1 in pairs(arg_16_0.cards) do
			iter_17_1:UpdateSelected(arg_16_0.selectedId)
		end

		arg_16_0:UpdateSelected(var_16_0.itemId)
		var_16_0:UpdateSelected(arg_16_0.selectedId)
	end, SFX_PANEL)

	arg_16_0.cards[arg_16_1] = var_16_0
end

function var_0_0.OnUpdateItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.cards[arg_18_2]

	if not var_18_0 then
		arg_18_0:OnInitItem(arg_18_2)

		var_18_0 = arg_18_0.cards[arg_18_2]
	end

	var_18_0:Update(arg_18_0.shipId, arg_18_0.displays[arg_18_1 + 1], arg_18_0.selectedId)
end

function var_0_0.FlushGifts(arg_19_0)
	local var_19_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetGifts()

	arg_19_0.displays = {}

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		table.insert(arg_19_0.displays, iter_19_1)
	end

	table.sort(arg_19_0.displays, function(arg_20_0, arg_20_1)
		return arg_20_0.id < arg_20_1.id
	end)
	arg_19_0.scrollRect:SetTotalCount(#arg_19_0.displays)
end

function var_0_0.UpdateSelected(arg_21_0, arg_21_1)
	arg_21_0.selectedId = arg_21_1

	setActive(arg_21_0.emptyTr, arg_21_0.selectedId == nil)
	setActive(arg_21_0.giftEffectList.container, arg_21_0.selectedId)

	if arg_21_0.selectedId then
		local var_21_0 = arg_21_0:CollectGiftEffect(arg_21_1)

		arg_21_0.giftEffectList:make(function(arg_22_0, arg_22_1, arg_22_2)
			if arg_22_0 == UIItemList.EventUpdate then
				setText(arg_22_2, var_21_0[arg_22_1 + 1])
			end
		end)
		arg_21_0.giftEffectList:align(#var_21_0)
	end

	arg_21_0:FlushPower()
end

function var_0_0.CollectGiftBuffs(arg_23_0, arg_23_1)
	local var_23_0 = {}
	local var_23_1 = IslandItem.StaticGetUsageArg(arg_23_1)
	local var_23_2 = arg_23_0.ship:IsFavoriteGift(arg_23_1) and IslandConst.GIFT_INDEX_FAVORITE or IslandConst.GIFT_INDEX_COMMON

	for iter_23_0, iter_23_1 in ipairs(var_23_1) do
		if var_23_2 == iter_23_0 then
			local var_23_3 = iter_23_1[2]

			for iter_23_2, iter_23_3 in ipairs(var_23_3) do
				table.insert(var_23_0, iter_23_3)
			end
		end
	end

	return var_23_0
end

function var_0_0.CollectGiftEffect(arg_24_0, arg_24_1)
	local var_24_0 = {}
	local var_24_1 = IslandItem.StaticGetUsageArg(arg_24_1)
	local var_24_2 = IslandConst.GIFT_INDEX_COMMON
	local var_24_3 = IslandConst.GIFT_INDEX_FAVORITE
	local var_24_4 = arg_24_0.ship:IsFavoriteGift(arg_24_1) and var_24_1[var_24_3] or var_24_1[var_24_2]

	if var_24_4[var_24_2] > 0 then
		table.insert(var_24_0, i18n("island_word_ship_enengy_recover") .. var_24_4[var_24_2])
	end

	for iter_24_0, iter_24_1 in ipairs(var_24_4[2]) do
		local var_24_5 = pg.island_buff_template[iter_24_1]

		table.insert(var_24_0, var_24_5.buff_desc)
	end

	return var_24_0
end

function var_0_0.GetGiftAddPower(arg_25_0, arg_25_1)
	if not arg_25_1 then
		return 0
	end

	local var_25_0 = IslandItem.StaticGetUsageArg(arg_25_1)
	local var_25_1 = IslandConst.GIFT_INDEX_COMMON
	local var_25_2 = IslandConst.GIFT_INDEX_FAVORITE
	local var_25_3 = arg_25_0.ship:IsFavoriteGift(arg_25_1) and var_25_0[var_25_2] or var_25_0[var_25_1]

	if var_25_3[var_25_1] > 0 then
		return var_25_3[var_25_1]
	end

	return 0
end

function var_0_0.FlushPower(arg_26_0)
	arg_26_0.maxPower = arg_26_0.ship:GetMaxEnergy()
	arg_26_0.curPower = arg_26_0.ship:GetCurrentEnergy()
	arg_26_0.addPower = arg_26_0:GetGiftAddPower(arg_26_0.selectedId)

	local var_26_0 = math.min(arg_26_0.addPower, arg_26_0.maxPower - arg_26_0.curPower)
	local var_26_1 = var_26_0 > 0 and "+" .. var_26_0 or ""

	setText(arg_26_0.powerTr:Find("value"), arg_26_0.curPower .. setColorStr(var_26_1, "#4FD775") .. "/" .. arg_26_0.maxPower)
	setSlider(arg_26_0.powerTr:Find("progress"), 0, 1, arg_26_0.curPower / arg_26_0.maxPower)
	setSlider(arg_26_0.powerTr:Find("progress/add"), 0, 1, arg_26_0.addPower > 0 and (arg_26_0.curPower + arg_26_0.addPower) / arg_26_0.maxPower or 0)
end

function var_0_0.OnDestroy(arg_27_0)
	ClearLScrollrect(arg_27_0.scrollRect)
	arg_27_0.statusPanel:Dispose()

	arg_27_0.statusPanel = nil

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.cards or {}) do
		iter_27_1:Dispose()
	end

	arg_27_0.cards = nil
end

return var_0_0

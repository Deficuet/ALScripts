local var_0_0 = class("IslandShipStatusPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipStatusUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.scrollRect = arg_2_0:findTF("adapt/attr_panel/srcollrect"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	arg_2_0.giveBtn = arg_2_0:findTF("adapt/attr_panel/send_panel/give_btn")
	arg_2_0.emptyTr = arg_2_0:findTF("adapt/attr_panel/send_panel/empty")
	arg_2_0.giftEffectList = UIItemList.New(arg_2_0:findTF("adapt/attr_panel/send_panel/scrollrect/list"), arg_2_0:findTF("adapt/attr_panel/send_panel/scrollrect/list/tpl"))
	arg_2_0.statusPanel = IslandShipStatusPanel.New(arg_2_0:findTF("adapt/attr_panel/status"), arg_2_0:findTF("adapt/attr_panel/status_empty"))

	setText(arg_2_0.emptyTr:Find("Text"), i18n("island_select_ship_gift"))
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0.cards = {}

	onButton(arg_5_0, arg_5_0.giveBtn, function()
		if not arg_5_0.selectedId then
			return
		end

		local var_6_0 = {}
		local var_6_1 = arg_5_0:CollectGiftBuffs(arg_5_0.selectedId)

		for iter_6_0, iter_6_1 in ipairs(var_6_1) do
			table.insert(var_6_0, function(arg_7_0)
				IslandAddShipStatusHelper.CheckAddStatus(arg_5_0, arg_5_0.ship, iter_6_1, arg_7_0)
			end)
		end

		seriesAsync(var_6_0, function()
			print("??????????????")
			arg_5_0:emit(IslandMediator.ON_GIVE_GIFT, arg_5_0.selectedId, 1, arg_5_0.shipId)
		end)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(GAME.ISLAND_GIVE_GIFT_DONE, arg_9_0.OnUseItem)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(GAME.ISLAND_GIVE_GIFT_DONE, arg_10_0.OnUseItem)
end

function var_0_0.OnUseItem(arg_11_0)
	arg_11_0.selectedId = nil

	arg_11_0:FlushStatus(arg_11_0.ship)
	arg_11_0:FlushGifts()
end

function var_0_0.OnShow(arg_12_0, arg_12_1)
	arg_12_0.selectedId = nil

	local var_12_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_12_1)

	if var_12_0 == nil then
		return
	end

	arg_12_0.ship = var_12_0
	arg_12_0.shipId = arg_12_0.ship.id

	arg_12_0:FlushStatus(var_12_0)
	arg_12_0:FlushGifts()
	arg_12_0:UpdateSelected(arg_12_0.selectedId)
end

function var_0_0.FlushStatus(arg_13_0, arg_13_1)
	arg_13_0.statusPanel:Flush(arg_13_1)

	local var_13_0 = arg_13_1:GetDisplayStatus()

	onButton(arg_13_0, arg_13_0.statusPanel.viewBtn, function()
		arg_13_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_SHIP_OWN_STATUS,
			title = i18n("island_word_ship_buff_desc"),
			statusList = var_13_0
		})
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_15_0, arg_15_1)
	local var_15_0 = IslandGiftCard.New(arg_15_1)

	onButton(arg_15_0, var_15_0.go, function()
		if var_15_0.item:GetCount() <= 0 then
			arg_15_0:ShowMsgBox({
				title = i18n("island_word_ship_buff_desc"),
				type = IslandMsgBox.TYPE_COMMON_ITEM,
				itemId = var_15_0.item.id
			})

			return
		end

		arg_15_0.selectedId = nil

		for iter_16_0, iter_16_1 in pairs(arg_15_0.cards) do
			iter_16_1:UpdateSelected(arg_15_0.selectedId)
		end

		arg_15_0:UpdateSelected(var_15_0.itemId)
		var_15_0:UpdateSelected(arg_15_0.selectedId)
	end, SFX_PANEL)

	arg_15_0.cards[arg_15_1] = var_15_0
end

function var_0_0.OnUpdateItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.cards[arg_17_2]

	if not var_17_0 then
		arg_17_0:OnInitItem(arg_17_2)

		var_17_0 = arg_17_0.cards[arg_17_2]
	end

	var_17_0:Update(arg_17_0.shipId, arg_17_0.displays[arg_17_1 + 1], arg_17_0.selectedId)
end

function var_0_0.FlushGifts(arg_18_0)
	local var_18_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetGifts()

	arg_18_0.displays = {}

	for iter_18_0, iter_18_1 in pairs(var_18_0) do
		table.insert(arg_18_0.displays, iter_18_1)
	end

	table.sort(arg_18_0.displays, function(arg_19_0, arg_19_1)
		return arg_19_0.id < arg_19_1.id
	end)
	arg_18_0.scrollRect:SetTotalCount(#arg_18_0.displays)
end

function var_0_0.UpdateSelected(arg_20_0, arg_20_1)
	arg_20_0.selectedId = arg_20_1

	setActive(arg_20_0.emptyTr, arg_20_0.selectedId == nil)
	setActive(arg_20_0.giftEffectList.container, arg_20_0.selectedId)

	if arg_20_0.selectedId then
		local var_20_0 = arg_20_0:CollectGiftEffect(arg_20_1)

		arg_20_0.giftEffectList:make(function(arg_21_0, arg_21_1, arg_21_2)
			if arg_21_0 == UIItemList.EventUpdate then
				setText(arg_21_2, var_20_0[arg_21_1 + 1])
			end
		end)
		arg_20_0.giftEffectList:align(#var_20_0)
	end
end

function var_0_0.CollectGiftBuffs(arg_22_0, arg_22_1)
	local var_22_0 = {}
	local var_22_1 = IslandItem.StaticGetUsageArg(arg_22_1)
	local var_22_2 = arg_22_0.ship:IsFavoriteGift(arg_22_1) and IslandConst.GIFT_INDEX_FAVORITE or IslandConst.GIFT_INDEX_COMMON

	for iter_22_0, iter_22_1 in ipairs(var_22_1) do
		if var_22_2 == iter_22_0 then
			local var_22_3 = iter_22_1[2]

			for iter_22_2, iter_22_3 in ipairs(var_22_3) do
				table.insert(var_22_0, iter_22_3)
			end
		end
	end

	return var_22_0
end

function var_0_0.CollectGiftEffect(arg_23_0, arg_23_1)
	local var_23_0 = {}
	local var_23_1 = IslandItem.StaticGetUsageArg(arg_23_1)
	local var_23_2 = IslandConst.GIFT_INDEX_COMMON
	local var_23_3 = IslandConst.GIFT_INDEX_FAVORITE
	local var_23_4 = arg_23_0.ship:IsFavoriteGift(arg_23_1) and var_23_1[var_23_3] or var_23_1[var_23_2]

	if var_23_4[var_23_2] > 0 then
		table.insert(var_23_0, i18n("island_word_ship_enengy_recover") .. var_23_4[var_23_2])
	end

	for iter_23_0, iter_23_1 in ipairs(var_23_4[2]) do
		local var_23_5 = pg.island_buff_template[iter_23_1]

		table.insert(var_23_0, var_23_5.buff_desc)
	end

	return var_23_0
end

function var_0_0.OnDestroy(arg_24_0)
	ClearLScrollrect(arg_24_0.scrollRect)
	arg_24_0.statusPanel:Dispose()

	arg_24_0.statusPanel = nil

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.cards or {}) do
		iter_24_1:Dispose()
	end

	arg_24_0.cards = nil
end

return var_0_0

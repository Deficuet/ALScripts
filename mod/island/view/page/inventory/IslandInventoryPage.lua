local var_0_0 = class("IslandInventoryPage", import("...base.IslandBasePage"))
local var_0_1 = 101
local var_0_2 = 102
local var_0_3 = 103

var_0_0.INVENTORY_TYPE_OVERFLOW = 100
var_0_0.INVENTORY_TYPE_COMMON = 101
var_0_0.MODE_VIEW = 0
var_0_0.MODE_EDIT = 1

function var_0_0.getUIName(arg_1_0)
	return "IslandInventoryUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("window/close_btn")
	arg_2_0.filterBtn = arg_2_0:findTF("window/sort_panel/index")
	arg_2_0.orderBtn = arg_2_0:findTF("window/sort_panel/sort")
	arg_2_0.orderTxt = arg_2_0:findTF("window/sort_panel/sort/Text"):GetComponent(typeof(Text))
	arg_2_0.orderArr = arg_2_0:findTF("window/sort_panel/sort/arr")
	arg_2_0.toggles = {
		[var_0_0.INVENTORY_TYPE_OVERFLOW] = arg_2_0:findTF("window/toggles/0"),
		[IslandItem.TYPE_MATERIAL] = arg_2_0:findTF("window/toggles/1"),
		[IslandItem.TYPE_PROP] = arg_2_0:findTF("window/toggles/2"),
		[IslandItem.TYPE_SPECIAL_PROP] = arg_2_0:findTF("window/toggles/3")
	}
	arg_2_0.indexDatas = {
		[var_0_0.INVENTORY_TYPE_OVERFLOW] = IslandInventoryIndexData.New(var_0_1),
		[IslandItem.TYPE_MATERIAL] = IslandInventoryIndexData.New(var_0_1),
		[IslandItem.TYPE_PROP] = IslandInventoryIndexData.New(var_0_2),
		[IslandItem.TYPE_SPECIAL_PROP] = IslandInventoryIndexData.New(var_0_3)
	}
	arg_2_0.capacityTxt = arg_2_0:findTF("window/upgrade/Text"):GetComponent(typeof(Text))
	arg_2_0.upgradeBtn = arg_2_0:findTF("window/upgrade")
	arg_2_0.upgradeProg = arg_2_0:findTF("window/upgrade/bar")
	arg_2_0.batchSellBtn = arg_2_0:findTF("window/batch_sell")
	arg_2_0.sellPanel = arg_2_0:findTF("window/sell_panel")
	arg_2_0.sortPaenl = arg_2_0:findTF("window/sort_panel")
	arg_2_0.sellBtn = arg_2_0:findTF("window/sell_panel/batch_sell_1")
	arg_2_0.sellCancelBtn = arg_2_0:findTF("window/sell_panel/cancel")
	arg_2_0.sellPriceTxt = arg_2_0:findTF("window/sell_panel/price/Text"):GetComponent(typeof(Text))

	LoadImageSpriteAsync("island/" .. getIslandSeasonPtInfo().icon, arg_2_0:findTF("window/sell_panel/price/Text/icon"))

	arg_2_0.oneKeyPanel = arg_2_0:findTF("window/one_key_panel")
	arg_2_0.onekeyBtn = arg_2_0:findTF("window/one_key_panel/fetch_btn")
	arg_2_0.scrollRect = arg_2_0:findTF("window/item_scrollview"):GetComponent("LScrollRect")

	setText(arg_2_0:findTF("window/title/Text"), i18n("island_bag_title"))
	setText(arg_2_0:findTF("window/batch_sell/Text"), i18n("island_batch_covert"))
	setText(arg_2_0:findTF("window/sell_panel/price/label"), i18n("island_total_price"))
	setText(arg_2_0:findTF("window/sell_panel/cancel/Text"), i18n("word_cancel"))
	setText(arg_2_0:findTF("window/sell_panel/batch_sell_1/Text"), i18n("island_batch_covert"))
	setText(arg_2_0:findTF("window/one_key_panel/fetch_btn/Text"), i18n("mail_get_oneclick"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.upgradeBtn, function()
		arg_3_0:OpenPage(IslandInventoryUpgradePage)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.batchSellBtn, function()
		arg_3_0.mode = var_0_0.MODE_EDIT

		arg_3_0:SetTotalCount()
		arg_3_0:UpdateStyle()

		arg_3_0.sellPriceTxt.text = "x 0"
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sellCancelBtn, function()
		arg_3_0.mode = var_0_0.MODE_VIEW

		arg_3_0:SetTotalCount()
		arg_3_0:UpdateStyle()

		for iter_8_0, iter_8_1 in ipairs(arg_3_0.values) do
			arg_3_0.values[iter_8_0] = 0
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sellBtn, function()
		local var_9_0 = arg_3_0:GetSellItems()

		if #var_9_0 <= 0 then
			return
		end

		arg_3_0:ShowMsgBox({
			content = i18n("island_season_window_transformtip"),
			onYes = function()
				if arg_3_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW then
					arg_3_0:emit(IslandMediator.ON_CONVERT_SEASON_PT_4_OVERFLOW, var_9_0)
				else
					arg_3_0:emit(IslandMediator.ON_CONVERT_SEASON_PT, var_9_0)
				end
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.onekeyBtn, function()
		if arg_3_0.tagType ~= var_0_0.INVENTORY_TYPE_OVERFLOW then
			return
		end

		arg_3_0:emit(IslandMediator.ONE_KEY)
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_12_0)
	arg_12_0:SetUp()
end

function var_0_0.GetSellItems(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.values) do
		local var_13_1 = arg_13_0.displays[iter_13_0]

		var_13_0[var_13_1.id] = (var_13_0[var_13_1.id] or 0) + iter_13_1
	end

	local var_13_2 = {}

	for iter_13_2, iter_13_3 in pairs(var_13_0) do
		if iter_13_3 > 0 then
			table.insert(var_13_2, {
				id = iter_13_2,
				num = iter_13_3
			})
		end
	end

	return var_13_2
end

function var_0_0.UpdateStyle(arg_14_0)
	setActive(arg_14_0.sellPanel, arg_14_0.mode == var_0_0.MODE_EDIT)
	setActive(arg_14_0.sortPaenl, arg_14_0.mode == var_0_0.MODE_VIEW and arg_14_0.tagType ~= var_0_0.INVENTORY_TYPE_OVERFLOW)
	setActive(arg_14_0.oneKeyPanel, arg_14_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW and arg_14_0.mode ~= var_0_0.MODE_EDIT)
	setActive(arg_14_0.batchSellBtn, arg_14_0.mode == var_0_0.MODE_VIEW)
end

function var_0_0.AddListeners(arg_15_0)
	arg_15_0:AddListener(IslandScene.ON_INVENTORY_FILTER, arg_15_0.OnInventoryFilter)
	arg_15_0:AddListener(GAME.ISLAND_UPGRADE_INVENTORY_DONE, arg_15_0.OnUpgrade)
	arg_15_0:AddListener(GAME.ISLAND_CONVERT_SEASON_PT_DONE, arg_15_0.OnSell)
	arg_15_0:AddListener(GAME.ISLAND_GET_OVERFLOW_ITEM_DOME, arg_15_0.OnSell)
	arg_15_0:AddListener(GAME.ISLAND_INVITE_SHIP_DONE, arg_15_0.OnUseInvitation)
end

function var_0_0.RemoveListeners(arg_16_0)
	arg_16_0:RemoveListener(IslandScene.ON_INVENTORY_FILTER, arg_16_0.OnInventoryFilter)
	arg_16_0:RemoveListener(GAME.ISLAND_UPGRADE_INVENTORY_DONE, arg_16_0.OnUpgrade)
	arg_16_0:RemoveListener(GAME.ISLAND_CONVERT_SEASON_PT_DONE, arg_16_0.OnSell)
	arg_16_0:RemoveListener(GAME.ISLAND_GET_OVERFLOW_ITEM_DOME, arg_16_0.OnSell)
	arg_16_0:RemoveListener(GAME.ISLAND_INVITE_SHIP_DONE, arg_16_0.OnUseInvitation)
end

function var_0_0.OnUseInvitation(arg_17_0)
	arg_17_0:SetTotalCount()
end

function var_0_0.GetIndexData(arg_18_0, arg_18_1)
	assert(arg_18_0.indexDatas[arg_18_1])

	return arg_18_0.indexDatas[arg_18_1]
end

function var_0_0.UpdateIndexData(arg_19_0, arg_19_1, arg_19_2)
	assert(arg_19_0.indexDatas[arg_19_1])
	arg_19_0.indexDatas[arg_19_1]:SetData(arg_19_2)
end

function var_0_0.OnInventoryFilter(arg_20_0, arg_20_1)
	arg_20_0:UpdateIndexData(arg_20_0.tagType, arg_20_1)
	arg_20_0:FlushSortBtn()
	arg_20_0:SetTotalCount()
end

function var_0_0.OnUpgrade(arg_21_0)
	arg_21_0:SetTotalCount()
	arg_21_0:FlushCapacity()
	arg_21_0:ClosePage(IslandInventoryUpgradePage)
end

function var_0_0.OnSell(arg_22_0)
	arg_22_0.mode = var_0_0.MODE_VIEW

	arg_22_0:SetTotalCount()
	arg_22_0:UpdateStyle()
	arg_22_0:FlushCapacity()

	arg_22_0.sellPriceTxt.text = "x 0"
end

function var_0_0.SetUp(arg_23_0)
	arg_23_0.tagType = IslandItem.TYPE_MATERIAL
	arg_23_0.mode = var_0_0.MODE_VIEW
	arg_23_0.asc = true
	arg_23_0.cards = {}

	arg_23_0:FlushTags()
	arg_23_0:FlushFilterBtn()
	arg_23_0:FlushSortBtn()
	arg_23_0:FlushList()
	arg_23_0:FlushCapacity()
	arg_23_0:UpdateStyle()
end

function var_0_0.FlushCapacity(arg_24_0)
	if arg_24_0.tagType == IslandItem.TYPE_MATERIAL then
		setActive(arg_24_0.upgradeBtn, true)
		setActive(arg_24_0.batchSellBtn, true)

		local var_24_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
		local var_24_1 = var_24_0:GetLength()
		local var_24_2 = var_24_0:GetCapacity()

		setButtonEnabled(arg_24_0.upgradeBtn, not var_24_0:IsMaxLevel())

		local var_24_3 = var_24_1 / var_24_2
		local var_24_4 = math.min(var_24_3, 1)

		arg_24_0:managedTween(LeanTween.value, nil, go(arg_24_0.upgradeBtn), 0, var_24_3, var_24_4):setOnUpdate(System.Action_float(function(arg_25_0)
			arg_24_0.capacityTxt.text = calcFloor(var_24_2 * arg_25_0) .. "/" .. var_24_2

			setFillAmount(arg_24_0.upgradeProg, arg_25_0)
		end)):setOnComplete(System.Action(function()
			arg_24_0.capacityTxt.text = var_24_1 .. "/" .. var_24_2

			setFillAmount(arg_24_0.upgradeProg, var_24_3)
		end))

		local var_24_5 = var_24_3 > 0.85 and Color.New(0.9529411764705882, 0.4235294117647059, 0.43137254901960786, 1) or Color.New(0.2235294117647059, 0.7450980392156863, 1, 1)

		arg_24_0.upgradeProg:GetComponent(typeof(Image)).color = var_24_5
	elseif arg_24_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW then
		setActive(arg_24_0.upgradeBtn, false)
		setActive(arg_24_0.batchSellBtn, true)
	else
		setActive(arg_24_0.upgradeBtn, false)
		setActive(arg_24_0.batchSellBtn, false)
	end
end

function var_0_0.FlushTags(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.toggles) do
		onToggle(arg_27_0, iter_27_1, function(arg_28_0)
			if arg_28_0 then
				arg_27_0:CheckEditMode(iter_27_0)

				arg_27_0.tagType = iter_27_0

				arg_27_0:FlushCapacity()
				arg_27_0:FlushSortBtn()
				arg_27_0:SetTotalCount()
				arg_27_0:UpdateStyle()
			end
		end, SFX_PANEL)

		if iter_27_0 == var_0_0.INVENTORY_TYPE_OVERFLOW then
			setText(iter_27_1:Find("Text"), i18n("island_word_temp"))
		else
			setText(iter_27_1:Find("Text"), IslandItemKind.Type2TagName(iter_27_0))
		end
	end

	arg_27_0:ActiveDefaultTag()
end

function var_0_0.ActiveDefaultTag(arg_29_0)
	local var_29_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():ExistAnyOverFlowItem()

	setActive(arg_29_0.toggles[var_0_0.INVENTORY_TYPE_OVERFLOW], var_29_0)

	if var_29_0 then
		triggerToggle(arg_29_0.toggles[var_0_0.INVENTORY_TYPE_OVERFLOW], true)
	else
		triggerToggle(arg_29_0.toggles[IslandItem.TYPE_MATERIAL], true)
	end
end

function var_0_0.CheckEditMode(arg_30_0, arg_30_1)
	if arg_30_0.tagType ~= arg_30_1 and arg_30_0.mode == var_0_0.MODE_EDIT then
		triggerButton(arg_30_0.sellCancelBtn)
	end
end

function var_0_0.FlushFilterBtn(arg_31_0)
	onButton(arg_31_0, arg_31_0.filterBtn, function()
		local var_32_0 = arg_31_0:GetIndexData(arg_31_0.tagType)

		arg_31_0:OpenPage(IslandInventoryIndexPage, var_32_0)
	end, SFX_PANEL)
end

function var_0_0.FlushSortBtn(arg_33_0)
	local function var_33_0()
		local var_34_0 = arg_33_0:GetIndexData(arg_33_0.tagType)

		arg_33_0.orderTxt.text = var_34_0:GetSortText()
		arg_33_0.orderArr.localScale = arg_33_0.asc and Vector2(1, -1, 1) or Vector2(1, 1, 1)
	end

	onButton(arg_33_0, arg_33_0.orderBtn, function()
		arg_33_0.asc = not arg_33_0.asc

		var_33_0()
		arg_33_0:SetTotalCount()
	end, SFX_PANEL)
	var_33_0()
end

function var_0_0.FlushList(arg_36_0)
	function arg_36_0.scrollRect.onInitItem(arg_37_0)
		arg_36_0:OnInitItem(arg_37_0)
	end

	function arg_36_0.scrollRect.onUpdateItem(arg_38_0, arg_38_1)
		arg_36_0:OnUpdateItem(arg_38_0, arg_38_1)
	end

	arg_36_0:SetTotalCount()
end

function var_0_0.SetTotalCount(arg_39_0)
	arg_39_0.displays = arg_39_0:Filter()
	arg_39_0.values = {}

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.displays) do
		table.insert(arg_39_0.values, 0)
	end

	local var_39_0 = arg_39_0:GetIndexData(arg_39_0.tagType)

	table.sort(arg_39_0.displays, function(arg_40_0, arg_40_1)
		return var_39_0:Sort(arg_40_0, arg_40_1, arg_39_0.asc)
	end)
	arg_39_0.scrollRect:SetTotalCount(#arg_39_0.displays, -1)
end

function var_0_0.OnInitItem(arg_41_0, arg_41_1)
	local var_41_0 = IslandItemCard.New(arg_41_1)

	onButton(arg_41_0, var_41_0._go, function()
		if arg_41_0.mode == var_0_0.MODE_VIEW then
			if arg_41_0.tagType ~= var_0_0.INVENTORY_TYPE_OVERFLOW then
				arg_41_0:OnClickItem(var_41_0)
			end
		elseif arg_41_0.mode == var_0_0.MODE_EDIT then
			arg_41_0:OnClickItemForSell(var_41_0)
		end
	end, SFX_PANEL)
	onButton(arg_41_0, var_41_0.calcPanel, function()
		if arg_41_0.mode == var_0_0.MODE_EDIT then
			arg_41_0:UpdateSellPrice(var_41_0, -1)
		end
	end, SFX_PANEL)
	onInputEndEdit(arg_41_0, var_41_0.valueInput, function(arg_44_0)
		local var_44_0 = table.indexof(arg_41_0.displays, var_41_0.item)

		if not var_44_0 then
			return
		end

		local var_44_1 = 0

		if not arg_44_0 or arg_44_0 == "" or not tonumber(arg_44_0) then
			local var_44_2 = 1
		end

		local var_44_3 = tonumber(arg_44_0) - arg_41_0.values[var_44_0]

		arg_41_0:UpdateSellPrice(var_41_0, var_44_3)
	end)

	arg_41_0.cards[arg_41_1] = var_41_0
end

function var_0_0.OnClickItem(arg_45_0, arg_45_1)
	if isa(arg_45_1.item, IslandInvitation) then
		local var_45_0 = arg_45_1.item:GetShipName()

		arg_45_0:ShowMsgBox({
			content = i18n("island_open_ship_tip"),
			onYes = function()
				arg_45_0:Hide()
				arg_45_0:emit(IslandBaseMediator.SWITCH_MAP, IslandConst.LABORATORY_MAP_ID, IslandConst.LETTEROFINVITATION_SP)
			end
		})
	else
		arg_45_0:ShowMsgBox({
			title = i18n("island_word_desc"),
			type = IslandMsgBox.TYPE_COMMON_ITEM,
			itemId = arg_45_1.item.id
		})
	end
end

function var_0_0.OnClickItemForSell(arg_47_0, arg_47_1)
	arg_47_0:UpdateSellPrice(arg_47_1, 1)
end

function var_0_0.UpdateSellPrice(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = table.indexof(arg_48_0.displays, arg_48_1.item)

	if not var_48_0 then
		return
	end

	local var_48_1 = arg_48_0.values[var_48_0] + arg_48_2

	arg_48_0.values[var_48_0] = math.max(0, math.min(var_48_1, arg_48_1.item:GetCount()))

	arg_48_1:UpdateValue(arg_48_0.values[var_48_0])

	local var_48_2 = 0

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.values) do
		var_48_2 = arg_48_0.displays[iter_48_0]:GetConvertPt() * iter_48_1 + var_48_2
	end

	arg_48_0.sellPriceTxt.text = "x " .. var_48_2
end

function var_0_0.OnUpdateItem(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = arg_49_0.cards[arg_49_2]

	if not var_49_0 then
		arg_49_0:OnInitItem(arg_49_2)

		var_49_0 = arg_49_0.cards[arg_49_2]
	end

	if arg_49_0.displays[arg_49_1 + 1] then
		var_49_0:Update(arg_49_0.displays[arg_49_1 + 1], arg_49_0.mode, arg_49_0.values[arg_49_1 + 1], arg_49_0.tagType)
	end
end

function var_0_0.Filter(arg_50_0)
	local var_50_0 = {}

	if arg_50_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW then
		arg_50_0:CollectOverFlowInventoryItems(var_50_0)
	else
		arg_50_0:CollectCommonInventoryItems(var_50_0)
	end

	if arg_50_0.mode == var_0_0.MODE_EDIT then
		var_50_0 = underscore.select(var_50_0, function(arg_51_0)
			return arg_51_0:CanConvert()
		end)
	end

	return var_50_0
end

function var_0_0.CollectOverFlowInventoryItems(arg_52_0, arg_52_1)
	local var_52_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOverflowItemList()

	for iter_52_0, iter_52_1 in pairs(var_52_0) do
		table.insert(arg_52_1, iter_52_1)
	end
end

function var_0_0.CollectCommonInventoryItems(arg_53_0, arg_53_1)
	local var_53_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetGroupedItemList()

	for iter_53_0, iter_53_1 in ipairs(var_53_0) do
		if arg_53_0.tagType == IslandItem.TYPE_MATERIAL and iter_53_1:IsMaterial() and arg_53_0.indexDatas[IslandItem.TYPE_MATERIAL]:Match(iter_53_1) then
			table.insert(arg_53_1, iter_53_1)
		elseif arg_53_0.tagType == IslandItem.TYPE_PROP and iter_53_1:IsProp() and arg_53_0.indexDatas[IslandItem.TYPE_PROP]:Match(iter_53_1) then
			table.insert(arg_53_1, iter_53_1)
		elseif arg_53_0.tagType == IslandItem.TYPE_SPECIAL_PROP and iter_53_1:IsSpecialProp() and arg_53_0.indexDatas[IslandItem.TYPE_SPECIAL_PROP]:Match(iter_53_1) then
			table.insert(arg_53_1, iter_53_1)
		end
	end

	if arg_53_0.tagType == IslandItem.TYPE_SPECIAL_PROP then
		local var_53_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetInviteList()

		for iter_53_2, iter_53_3 in ipairs(var_53_1) do
			local var_53_2 = IslandInvitation.New(iter_53_3)

			if arg_53_0.indexDatas[IslandItem.TYPE_SPECIAL_PROP]:Match(var_53_2) then
				table.insert(arg_53_1, var_53_2)
			end
		end
	end
end

function var_0_0.OnDestroy(arg_54_0)
	for iter_54_0, iter_54_1 in pairs(arg_54_0.cards) do
		iter_54_1:Dispose()
	end

	arg_54_0.cards = {}
end

return var_0_0

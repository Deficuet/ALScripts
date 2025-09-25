local var_0_0 = class("IslandRestaurantPage", import("...base.IslandBasePage"))

var_0_0.MAX_ASSISTANT_CNT = 2
var_0_0.MAX_SHELF_CNT = 5

local var_0_1 = Vector3(-210, 50)
local var_0_2 = pg.island_item_data_template
local var_0_3 = pg.island_set
local var_0_4 = pg.island_buff_template

function var_0_0.getUIName(arg_1_0)
	return "IslandRestaurantUI"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_manage_title"))

	arg_2_0.rankTF = arg_2_0._tf:Find("rank")
	arg_2_0.rankIcon = arg_2_0.rankTF:Find("icon")
	arg_2_0.rankSlider = arg_2_0.rankTF:Find("exp")
	arg_2_0.rankText = arg_2_0.rankTF:Find("exp/progress")
	arg_2_0.eventContainer = arg_2_0._tf:Find("content/event_container")
	arg_2_0.eventTitleTF = arg_2_0.eventContainer:Find("event/title")
	arg_2_0.eventDescTF = arg_2_0.eventContainer:Find("event/desc/Text")

	setText(arg_2_0.eventContainer:Find("event/desc/effect"), i18n("island_manage_produce_tip"))

	arg_2_0.windowContainer = arg_2_0._tf:Find("content/window_container")

	local var_2_0 = arg_2_0.windowContainer:Find("window")

	arg_2_0.nameTF = var_2_0:Find("name/Text")
	arg_2_0.nameEnTF = var_2_0:Find("name_en/Text")

	local var_2_1 = var_2_0:Find("left/content")

	arg_2_0.shipUIList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))

	setText(var_2_1:Find("tpl/empty/Image/Text"), i18n("island_manage_sel_worker"))
	setText(var_2_1:Find("tpl/lock/Image/Text"), i18n("island_manage_upgrade_worker_level"))
	setText(var_2_1:Find("tpl/ship/skill/invalid/Text"), i18n("island_manage_skill_cant_use"))

	arg_2_0.commoditiesTF = var_2_0:Find("right/commodities")
	arg_2_0.commoditiesEmptyTF = var_2_0:Find("right/commodities_empty")

	setText(arg_2_0.commoditiesEmptyTF, i18n("island_manage_stock_out"))

	arg_2_0.scrollRect = arg_2_0.commoditiesTF:GetComponent("LScrollRect")
	arg_2_0.detailPanel = var_2_0:Find("right/detail")
	arg_2_0.detailNameTF = arg_2_0.detailPanel:Find("dot/name")
	arg_2_0.detailPriceTF = arg_2_0.detailPanel:Find("price/value")
	arg_2_0.detailDescTF = arg_2_0.detailPanel:Find("desc")
	arg_2_0.detailEffectTF = arg_2_0.detailPanel:Find("effect/Text")
	arg_2_0.shelfsTF = var_2_0:Find("right/shelfs")

	setText(arg_2_0.shelfsTF:Find("infos/tip"), i18n("island_manage_item_select"))

	arg_2_0.extraCapacityTF = arg_2_0.shelfsTF:Find("infos/capacity")

	setText(arg_2_0.extraCapacityTF:Find("name"), i18n("island_manage_capacity"))

	arg_2_0.extraCapacityEffectTF = arg_2_0.extraCapacityTF:Find("effect")
	arg_2_0.shelfUIList = UIItemList.New(arg_2_0.shelfsTF:Find("content"), arg_2_0.shelfsTF:Find("content/tpl"))

	local var_2_2 = var_2_0:Find("estimate")

	setText(var_2_2:Find("Text"), i18n("island_manage_predict_saleroom"))
	setText(var_2_2:Find("count/Text"), i18n("island_manage_cnt"))
	setText(var_2_2:Find("sales/Text"), i18n("island_manage_saleroom") .. ":")

	arg_2_0.estimateCntTF = var_2_2:Find("count/value")
	arg_2_0.estimateSalesTF = var_2_2:Find("sales/value")
	arg_2_0.buffInfoBtn = var_2_2:Find("info")
	arg_2_0.buffInfoPanel = var_2_2:Find("info_panel")

	setText(arg_2_0.buffInfoPanel:Find("Text"), i18n("island_manage_addition"))

	arg_2_0.buffInfoUIList = UIItemList.New(arg_2_0.buffInfoPanel:Find("effects"), arg_2_0.buffInfoPanel:Find("effects/tpl"))
	arg_2_0.buffInfoEmptyTF = arg_2_0.buffInfoPanel:Find("empty")

	setText(arg_2_0.buffInfoEmptyTF:Find("Text"), i18n("island_manage_no_addition"))

	arg_2_0.btnsTF = var_2_0:Find("btns")
	arg_2_0.openBtn = arg_2_0.btnsTF:Find("prepare/open"), setText(arg_2_0.btnsTF:Find("prepare/auto/Text"), i18n("island_manage_auto_work"))

	setText(arg_2_0.btnsTF:Find("prepare/open/Text"), i18n("island_manage_start_work"))
	setText(arg_2_0.btnsTF:Find("opening/Text"), i18n("island_manage_working"))
	setText(arg_2_0.btnsTF:Find("close/Text"), i18n("island_manage_result"))
	setText(arg_2_0.btnsTF:Find("end/Text"), i18n("island_manage_end_daily_work"))

	arg_2_0.ticketBtn = arg_2_0.btnsTF:Find("opening/ticket")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.rankTF, function()
		arg_3_0:OpenPage(IslandRestaurantRankPage, arg_3_0.restId)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.btnsTF:Find("prepare/auto"), function()
		if not arg_3_0.isOperable then
			return
		end

		arg_3_0:OnAutoSelect()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.openBtn, function()
		local var_7_0 = {}

		for iter_7_0, iter_7_1 in ipairs(arg_3_0.assistantsData) do
			var_7_0[iter_7_1.id] = arg_3_0.selectedShipIds[iter_7_0]
		end

		arg_3_0:emit(IslandMediator.OPEN_RESTAURANT, {
			restId = arg_3_0.restId,
			ships = var_7_0,
			commodities = arg_3_0.selectedDic
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.btnsTF:Find("close"), function()
		arg_3_0:emit(IslandMediator.CLOSE_RESTAURANT, arg_3_0.restId, arg_3_0.isPost)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.buffInfoBtn, function()
		if isActive(arg_3_0.buffInfoPanel) then
			setActive(arg_3_0.buffInfoPanel, false)
		else
			setActive(arg_3_0.buffInfoPanel, true)
			arg_3_0.buffInfoUIList:align(#arg_3_0.buffInfos)
			setActive(arg_3_0.buffInfoEmptyTF, #arg_3_0.buffInfos == 0)
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.ticketBtn, function()
		arg_3_0:OpenPage(IslandTicketUsePage, IslandUseTicketCommand.TYPES.MANAGE, arg_3_0.restId)
	end, SFX_PANEL)
	arg_3_0.shipUIList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateShipItem(arg_11_1, arg_11_2)
		end
	end)

	function arg_3_0.scrollRect.onInitItem(arg_12_0)
		arg_3_0:OnInitItem(arg_12_0)
	end

	function arg_3_0.scrollRect.onUpdateItem(arg_13_0, arg_13_1)
		arg_3_0:OnUpdateItem(arg_13_0, arg_13_1)
	end

	arg_3_0.shelfUIList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateShelfItem(arg_14_1, arg_14_2)
		end
	end)
	arg_3_0.buffInfoUIList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_3_0.buffInfos[arg_15_1 + 1]

			setText(arg_15_2:Find("bg/name"), var_15_0.name)
			setText(arg_15_2:Find("bg/effect"), var_15_0.effect)
		end
	end)

	arg_3_0.priceFactor = var_0_3.island_manage_price_coefficient.key_value_int / 100
	arg_3_0.argA = var_0_3.island_manage_sale_coefficient_a.key_value_int / 100
	arg_3_0.argB = var_0_3.island_manage_sale_coefficient_b.key_value_int / 100
	arg_3_0.argC = var_0_3.island_manage_sale_coefficient_b.key_value_int / 100
	arg_3_0.saleConst = var_0_3.island_manage_sale_constant.key_value_int / 100
	arg_3_0.maxAttrEffect = pg.island_chara_att[1].manage_effect / 10000
end

function var_0_0.AddListeners(arg_16_0)
	arg_16_0:AddListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_16_0.Flush)
	arg_16_0:AddListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_16_0.Flush)
	arg_16_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_16_0.Flush)
end

function var_0_0.RemoveListeners(arg_17_0)
	arg_17_0:RemoveListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_17_0.Flush)
	arg_17_0:RemoveListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_17_0.Flush)
	arg_17_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_17_0.Flush)
end

function var_0_0.OnInitItem(arg_18_0, arg_18_1)
	local var_18_0 = IslandFoodCard.New(arg_18_1)

	onButton(arg_18_0, var_18_0._go, function()
		if isActive(arg_18_0.detailPanel) then
			setActive(arg_18_0.detailPanel, false)
		end

		if not arg_18_0.isOperable then
			return
		end

		arg_18_0:AddOnShelf(var_18_0)
	end, SFX_PANEL)

	arg_18_0.cards[arg_18_1] = var_18_0
end

function var_0_0.AddOnShelf(arg_20_0, arg_20_1)
	if #arg_20_0.shelfInfos >= arg_20_0.shelfCnt then
		return
	end

	local var_20_0 = math.min(arg_20_1.item:GetCount(), arg_20_0.baseCapacity + arg_20_0.extraCapacity)

	arg_20_0.selectedDic[arg_20_1.item.id] = var_20_0

	arg_20_1:UpdateSelectedCnt(var_20_0)
	arg_20_0:FlushShelfs()
	arg_20_0:FlushEstimate()
end

function var_0_0.ShowDetailPanel(arg_21_0, arg_21_1, arg_21_2)
	setAnchoredPosition(arg_21_0.detailPanel, arg_21_2 + var_0_1)
	setActive(arg_21_0.detailPanel, true)
	setText(arg_21_0.detailNameTF, arg_21_1:GetName())

	local var_21_0 = math.floor(arg_21_1:getConfig("order_price") * arg_21_0.priceFactor)

	setText(arg_21_0.detailPriceTF, var_21_0)
	setText(arg_21_0.detailDescTF, arg_21_1:GetDesc())

	local var_21_1 = IslandShipAttr.GetAtrrName(arg_21_1:getConfig("sub_attribute")[1])
	local var_21_2 = i18n("island_manage_attr_effect") .. IslandShipAttr.ATTRS_CH[1] .. "、" .. IslandShipAttr.ToChinese(var_21_1)

	setText(arg_21_0.detailEffectTF, var_21_2)
end

function var_0_0.OnUpdateItem(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.cards[arg_22_2]

	if not var_22_0 then
		arg_22_0:OnInitItem(arg_22_2)

		var_22_0 = arg_22_0.cards[arg_22_2]
	end

	local var_22_1 = arg_22_0.displays[arg_22_1 + 1]

	if var_22_1 then
		local var_22_2 = arg_22_0:GetAttrsFactorsRatio(var_22_1.id)
		local var_22_3 = arg_22_0.selectedDic and arg_22_0.selectedDic[var_22_1.id] and arg_22_0.selectedDic[var_22_1.id] or 0

		var_22_0:Update(var_22_1, arg_22_0.isOperable and var_22_3 or 0, arg_22_0.eventEffects[var_22_1.id], var_22_2)
	end

	local var_22_4 = arg_22_0.detailPanel.parent:InverseTransformPoint(var_22_0._tf.position)

	GetOrAddComponent(var_22_0._go, typeof(UILongPressTrigger)).onLongPressed:AddListener(function()
		arg_22_0:ShowDetailPanel(var_22_0.item, var_22_4)
	end)
end

function var_0_0.UpdateCardWithItemId(arg_24_0, arg_24_1)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.cards) do
		if iter_24_1.item.id == arg_24_1 then
			iter_24_1:UpdateSelectedCnt(arg_24_0.selectedDic[arg_24_1] or 0)
		end
	end
end

function var_0_0.OnShow(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0:BlurPanel()
	setActive(arg_25_0.buffInfoPanel, false)

	arg_25_0.restId = arg_25_1
	arg_25_0.isPost = arg_25_2
	arg_25_0.cards = {}

	arg_25_0:Flush()
end

function var_0_0.OnEnable(arg_26_0)
	arg_26_0:Flush()
end

function var_0_0.Flush(arg_27_0)
	arg_27_0:FlushData()
	arg_27_0:FlushName()
	arg_27_0:FlushRank()
	arg_27_0:FlushEvent()

	arg_27_0.selectedShipIds = nil

	arg_27_0:FlushAssistants()

	arg_27_0.selectedDic = nil

	arg_27_0:FlushCards()
	arg_27_0:FlushShelfs()
	arg_27_0:FlushEstimate()
	arg_27_0:FlushBtns()
end

function var_0_0.FlushData(arg_28_0)
	arg_28_0.rest = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurant(arg_28_0.restId)
	arg_28_0.shelfCnt = arg_28_0.rest:GetShelfCnt()
	arg_28_0.assistantsData = arg_28_0.rest:GetAssistants()
	arg_28_0.baseCapacity = arg_28_0.rest:GetBaseShelfCapacity()
	arg_28_0.extraCapacity = 0
	arg_28_0.isOperable = arg_28_0.rest:GetStatus() == IslandRestaurant.STATUS.PREPARE
end

function var_0_0.FlushName(arg_29_0)
	setText(arg_29_0.nameTF, arg_29_0.rest:getConfig("name"))
	setText(arg_29_0.nameEnTF, arg_29_0.rest:getConfig("name_en"))
end

function var_0_0.FlushRank(arg_30_0)
	LoadImageSpriteAsync("island/islandrestaurant/" .. arg_30_0.rest:GetRankIcon(), arg_30_0.rankIcon)

	local var_30_0 = arg_30_0.rest:GetSales()
	local var_30_1 = arg_30_0.rest:GetCanUpgradeExp()

	setText(arg_30_0.rankText, var_30_0 .. "/" .. var_30_1)
	setSlider(arg_30_0.rankSlider, 0, 1, var_30_1 == 0 and 0 or var_30_0 / var_30_1)
end

function var_0_0.FlushEvent(arg_31_0)
	arg_31_0.eventId, arg_31_0.eventEffects, arg_31_0.eventInfluence = arg_31_0.rest:GetEventInfo()

	setActive(arg_31_0.eventContainer, arg_31_0.eventId ~= 0)

	if arg_31_0.eventId ~= 0 then
		local var_31_0 = pg.island_manage_event[arg_31_0.eventId]

		setText(arg_31_0.eventTitleTF, var_31_0.name)
		setText(arg_31_0.eventDescTF, var_31_0.desc)
	end
end

function var_0_0.FlushAssistants(arg_32_0)
	if not arg_32_0.selectedShipIds then
		local var_32_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

		arg_32_0.selectedShipIds = {}

		for iter_32_0, iter_32_1 in ipairs(arg_32_0.assistantsData) do
			local var_32_1 = iter_32_1.shipId

			if var_32_1 ~= 0 then
				table.insert(arg_32_0.selectedShipIds, var_32_1)
			end
		end
	end

	arg_32_0.selectedShips = {}

	local var_32_2 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	for iter_32_2, iter_32_3 in ipairs(arg_32_0.selectedShipIds) do
		table.insert(arg_32_0.selectedShips, var_32_2:GetShipById(iter_32_3))
	end

	arg_32_0.shipUIList:align(var_0_0.MAX_ASSISTANT_CNT)

	arg_32_0.extraPricePer = 0
	arg_32_0.extraCapacity = 0
	arg_32_0.buffInfos = {}

	local var_32_3 = IslandBuffHelper.GetManangeSellPriceBuffs(arg_32_0.selectedShips, arg_32_0.restId)

	for iter_32_4, iter_32_5 in ipairs(var_32_3) do
		local var_32_4 = iter_32_5:GetBuffEffect()[2]

		table.insert(arg_32_0.buffInfos, {
			name = i18n("island_manage_saleroom"),
			effect = "+" .. var_32_4 .. "%"
		})

		arg_32_0.extraPricePer = arg_32_0.extraPricePer + var_32_4 / 100
	end

	local var_32_5 = IslandBuffHelper.GetManangeSellNumBuffs(arg_32_0.selectedShips, arg_32_0.restId)

	for iter_32_6, iter_32_7 in ipairs(var_32_5) do
		local var_32_6 = iter_32_7:GetBuffEffect()[2]

		table.insert(arg_32_0.buffInfos, {
			name = i18n("island_manage_capacity"),
			effect = "+" .. var_32_6
		})

		arg_32_0.extraCapacity = arg_32_0.extraCapacity + var_32_6
	end

	setActive(arg_32_0.extraCapacityTF, arg_32_0.extraCapacity > 0)
	setText(arg_32_0.extraCapacityEffectTF, "+" .. arg_32_0.extraCapacity)

	local var_32_7 = arg_32_0.shelfInfos and #arg_32_0.shelfInfos > 0 and arg_32_0.selectedShipIds and #arg_32_0.selectedShipIds > 0

	setGray(arg_32_0.openBtn, not var_32_7, true)
	setButtonEnabled(arg_32_0.openBtn, var_32_7)
end

function var_0_0.GetEffectiveManangeSkill(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1:GetSkill()

	return var_33_0:IsEffectiveInRest(arg_33_0.restId) and var_33_0 or nil
end

function var_0_0.GetEffectiveManangeUnlockSkill(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetEffectiveManangeSkill(arg_34_1)

	return var_34_0 and var_34_0:IsUnlock() and var_34_0 or nil
end

function var_0_0.UpdateShipItem(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_1 + 1

	arg_35_2.name = var_35_0

	local var_35_1 = var_35_0 <= #arg_35_0.assistantsData

	setActive(arg_35_2:Find("lock"), not var_35_1)

	local var_35_2 = arg_35_0.selectedShips[var_35_0]

	setActive(arg_35_2:Find("empty"), var_35_1 and not var_35_2)
	setActive(arg_35_2:Find("ship"), var_35_1 and var_35_2)
	onButton(arg_35_0, arg_35_2, function()
		if not var_35_1 or not arg_35_0.isOperable then
			return
		end

		arg_35_0:OpenPage(IslandShipSelectPage, {
			showBenefits = true,
			selectNum = #arg_35_0.assistantsData,
			selectedIds = Clone(arg_35_0.selectedShipIds),
			confirmFunc = function(arg_37_0)
				arg_35_0:OnSelectedShipsDone(arg_37_0)
			end,
			emptyInfoTitle = arg_35_0.rest:getConfig("name")
		})
	end, SFX_PANEL)

	if var_35_2 then
		local var_35_3 = arg_35_2:Find("ship")

		setText(var_35_3:Find("name"), var_35_2:GetName())

		local var_35_4 = arg_35_0:GetEffectiveManangeSkill(var_35_2)

		setActive(var_35_3:Find("skill"), var_35_4 and var_35_4:IsUnlock())
		setActive(var_35_3:Find("skill_lock"), var_35_4 and not var_35_4:IsUnlock())

		local var_35_5 = IslandShip.StaticGetPrefab(var_35_2.id)

		GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_35_5, "", var_35_3:Find("icon"))

		local var_35_6 = var_35_3:Find("skill")

		if var_35_4 then
			if var_35_4:IsUnlock() then
				setActive(var_35_6:Find("effects"), true)
				setActive(var_35_6:Find("invalid"), false)
				LoadImageSpriteAsync("island/islandskillicon/" .. var_35_4:GetIcon(), var_35_6:Find("skill_icon"))
				setText(var_35_6:Find("skill_name"), var_35_4:GetName())

				local var_35_7 = IslandBuffHelper.GetAllShipManangeBuffs(var_35_2, arg_35_0.restId)

				UIItemList.StaticAlign(var_35_6:Find("effects"), var_35_6:Find("effects/tpl"), #var_35_7, function(arg_38_0, arg_38_1, arg_38_2)
					if arg_38_0 == UIItemList.EventUpdate then
						local var_38_0 = var_35_7[arg_38_1 + 1]
						local var_38_1 = var_38_0:GetBuffType()
						local var_38_2 = ""
						local var_38_3 = ""

						if var_38_1 == IslandBuffType.SHIP_MANAGE_SELL_PRICE then
							var_38_2 = i18n("island_manage_saleroom")
							var_38_3 = "+" .. var_38_0:GetBuffEffect()[2] .. "%"
						elseif var_38_1 == IslandBuffType.SHIP_MANAGE_SELL_NUM then
							var_38_2 = i18n("island_manage_capacity")
							var_38_3 = "+" .. var_38_0:GetBuffEffect()[2]
						end

						setText(arg_38_2:Find("name"), var_38_2)
						setText(arg_38_2:Find("effect"), var_38_3)
					end
				end)
			else
				setText(var_35_3:Find("skill_lock/Image/Text"), i18n("island_need_star_1", var_35_2:GetSkillUnlockLevel()))
			end
		else
			local var_35_8 = var_35_2:GetSkill()

			setActive(var_35_3:Find("skill"), true)
			LoadImageSpriteAsync("island/islandskillicon/" .. var_35_8:GetIcon(), var_35_6:Find("skill_icon"))
			setText(var_35_6:Find("skill_name"), var_35_8:GetName())
			setActive(var_35_6:Find("effects"), false)
			setActive(var_35_6:Find("invalid"), true)
		end
	end
end

function var_0_0.FlushCards(arg_39_0)
	arg_39_0.displays = {}

	local var_39_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.rest:getConfig("item_id")) do
		local var_39_1 = var_39_0:GetItemById(iter_39_1[1])

		if var_39_1 then
			table.insert(arg_39_0.displays, var_39_1)
		end
	end

	setActive(arg_39_0.commoditiesEmptyTF, #arg_39_0.displays <= 0)
	setActive(arg_39_0.commoditiesTF, #arg_39_0.displays > 0)
	arg_39_0:CaclAttrsFactors()

	if #arg_39_0.displays > 0 then
		arg_39_0:SortDisplays()
	end
end

function var_0_0.SortDisplays(arg_40_0)
	table.sort(arg_40_0.displays, CompareFuncs({
		function(arg_41_0)
			return -arg_40_0.subAttrFactorsDic[arg_41_0.id]
		end,
		function(arg_42_0)
			return -arg_42_0:getConfig("order_price") * arg_40_0.priceFactor
		end,
		function(arg_43_0)
			return arg_43_0.id
		end
	}))

	if arg_40_0:isShowing() then
		arg_40_0.scrollRect:SetTotalCount(#arg_40_0.displays, -1)
	end
end

function var_0_0.CaclAttrsFactors(arg_44_0)
	arg_44_0.subAttrFactorsDic = {}
	arg_44_0.mainAttrFactorsDic = {}

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.displays) do
		local var_44_0 = iter_44_1:getConfig("sub_attribute")[1]

		arg_44_0.subAttrFactorsDic[iter_44_1.id] = var_44_0 and var_0_0.CaclShipAttrFactors(arg_44_0.selectedShips, var_44_0) or 0
		arg_44_0.mainAttrFactorsDic[iter_44_1.id] = var_0_0.CaclShipAttrFactors(arg_44_0.selectedShips, IslandShipAttr.MANAGE_KEY)
	end
end

function var_0_0.GetSubAttrFactors(arg_45_0, arg_45_1)
	if arg_45_0.subAttrFactorsDic[arg_45_1] then
		return arg_45_0.subAttrFactorsDic[arg_45_1]
	end

	local var_45_0 = var_0_2[arg_45_1].sub_attribute[1]

	arg_45_0.subAttrFactorsDic[arg_45_1] = var_45_0 and var_0_0.CaclShipAttrFactors(arg_45_0.selectedShips, var_45_0) or 0

	return arg_45_0.subAttrFactorsDic[arg_45_1]
end

function var_0_0.GetMainAttrFactors(arg_46_0, arg_46_1)
	if arg_46_0.mainAttrFactorsDic[arg_46_1] then
		return arg_46_0.mainAttrFactorsDic[arg_46_1]
	end

	arg_46_0.mainAttrFactorsDic[arg_46_1] = var_0_0.CaclShipAttrFactors(arg_46_0.selectedShips, IslandShipAttr.MANAGE_KEY)

	return arg_46_0.mainAttrFactorsDic[arg_46_1]
end

function var_0_0.GetAttrsFactorsRatio(arg_47_0, arg_47_1)
	local var_47_0 = var_0_2[arg_47_1].sub_attribute[2] / 100
	local var_47_1 = arg_47_0:GetMainAttrFactors(arg_47_1) + arg_47_0:GetSubAttrFactors(arg_47_1) * var_47_0
	local var_47_2 = #arg_47_0.assistantsData * (arg_47_0.maxAttrEffect + arg_47_0.maxAttrEffect * var_47_0)

	return var_47_2 == 0 and 0 or var_47_1 / var_47_2
end

function var_0_0.FlushShelfs(arg_48_0)
	if not arg_48_0.selectedDic then
		arg_48_0.selectedDic = {}

		for iter_48_0, iter_48_1 in ipairs(arg_48_0.rest:GetCommondities()) do
			arg_48_0.selectedDic[iter_48_1.id] = iter_48_1.num
		end
	end

	arg_48_0.shelfInfos = {}

	for iter_48_2, iter_48_3 in pairs(arg_48_0.selectedDic) do
		table.insert(arg_48_0.shelfInfos, {
			id = iter_48_2,
			num = iter_48_3
		})
	end

	arg_48_0.shelfUIList:align(var_0_0.MAX_SHELF_CNT)

	local var_48_0 = arg_48_0.shelfInfos and #arg_48_0.shelfInfos > 0 and arg_48_0.selectedShipIds and #arg_48_0.selectedShipIds > 0

	setGray(arg_48_0.openBtn, not var_48_0, true)
	setButtonEnabled(arg_48_0.openBtn, var_48_0)
end

function var_0_0.UpdateShelfItem(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = arg_49_1 + 1

	arg_49_2.name = var_49_0

	local var_49_1 = var_49_0 <= arg_49_0.shelfCnt

	setActive(arg_49_2:Find("lock"), not var_49_1)

	local var_49_2 = arg_49_0.shelfInfos[var_49_0]

	setActive(arg_49_2:Find("empty"), var_49_1 and not var_49_2)
	setActive(arg_49_2:Find("commodity"), var_49_1 and var_49_2)

	if var_49_2 then
		local var_49_3 = arg_49_2:Find("commodity")

		LoadImageSpriteAsync("island/" .. var_0_2[var_49_2.id].icon, var_49_3:Find("bg/icon"))

		local var_49_4 = arg_49_0.baseCapacity + arg_49_0.extraCapacity

		setText(var_49_3:Find("count/Text"), var_49_2.num .. "/" .. (arg_49_0.extraCapacity > 0 and setColorStr(var_49_4, "#7BF59DFF") or var_49_4))
		setActive(var_49_3:Find("event"), arg_49_0.eventEffects[var_49_2.id])

		local var_49_5 = arg_49_0:GetAttrsFactorsRatio(var_49_2.id)

		setFillAmount(var_49_3:Find("bg/silder/bar"), var_49_5)
		setActive(var_49_3:Find("reduce"), arg_49_0.isOperable)
		onButton(arg_49_0, var_49_3:Find("reduce"), function()
			if not arg_49_0.isOperable then
				return
			end

			arg_49_0:ReduceShelfCnt(var_49_2.id, 1)
			arg_49_0:FlushEstimate()
		end, SFX_PANEL)
	end
end

function var_0_0.ReduceShelfCnt(arg_51_0, arg_51_1, arg_51_2)
	arg_51_0.selectedDic[arg_51_1] = arg_51_0.selectedDic[arg_51_1] - arg_51_2

	if arg_51_0.selectedDic[arg_51_1] <= 0 then
		arg_51_0.selectedDic[arg_51_1] = nil
	end

	arg_51_0:UpdateCardWithItemId(arg_51_1)
	arg_51_0:FlushShelfs()
end

function var_0_0.FlushEstimate(arg_52_0)
	local var_52_0, var_52_1 = arg_52_0.rest:GetRandomSaleCntBound()
	local var_52_2 = 0
	local var_52_3 = 0
	local var_52_4 = 0
	local var_52_5 = 0

	for iter_52_0, iter_52_1 in pairs(arg_52_0.selectedDic) do
		local var_52_6 = arg_52_0:CaclBaseSaleCnt(iter_52_0)
		local var_52_7 = math.max(0, math.min(iter_52_1, var_52_6 + var_52_0))
		local var_52_8 = math.max(0, math.min(iter_52_1, var_52_6 + var_52_1))

		var_52_4 = var_52_4 + arg_52_0:CaclGroupPrice(iter_52_0, var_52_7)
		var_52_5 = var_52_5 + arg_52_0:CaclGroupPrice(iter_52_0, var_52_8)
		var_52_2 = var_52_2 + var_52_7
		var_52_3 = var_52_3 + var_52_8
	end

	setText(arg_52_0.estimateCntTF, var_52_2 .. "-" .. var_52_3)
	setText(arg_52_0.estimateSalesTF, var_52_4 .. "-" .. var_52_5)
end

function var_0_0.CaclBaseSaleCnt(arg_53_0, arg_53_1)
	local var_53_0 = var_0_2[arg_53_1].manage_influence / 100 + (arg_53_0.eventEffects[arg_53_1] and arg_53_0.eventInfluence or 0)
	local var_53_1 = arg_53_0.argA + arg_53_0:GetMainAttrFactors(arg_53_1)
	local var_53_2 = var_0_2[arg_53_1].sub_attribute[2] / 100
	local var_53_3 = arg_53_0.argB + arg_53_0:GetSubAttrFactors(arg_53_1) * var_53_2
	local var_53_4 = arg_53_0.argC + arg_53_0.rest:GetRankFactor()

	return math.floor(var_53_0 * var_53_1 * var_53_3 * var_53_4 / arg_53_0.saleConst)
end

function var_0_0.CaclGroupPrice(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = var_0_2[arg_54_1].order_price * arg_54_0.priceFactor
	local var_54_1 = arg_54_0.eventEffects[arg_54_1] or 0

	return math.floor(var_54_0 * arg_54_2 * (1 + var_54_1 + arg_54_0.extraPricePer))
end

function var_0_0.OnSelectedShipsDone(arg_55_0, arg_55_1)
	arg_55_0.selectedShipIds = arg_55_1

	arg_55_0:FlushAssistants()
	arg_55_0:FlushCards()
	arg_55_0:FlushShelfs()
	arg_55_0:FlushEstimate()
end

function var_0_0.OnAutoSelect(arg_56_0)
	arg_56_0.selectedShipIds = arg_56_0:GetAutoShipIds()

	arg_56_0:FlushAssistants()
	arg_56_0:FlushCards()

	arg_56_0.selectedDic = {}

	for iter_56_0 = 1, arg_56_0.shelfCnt do
		local var_56_0 = arg_56_0.displays[iter_56_0]

		if var_56_0 then
			arg_56_0.selectedDic[var_56_0.id] = math.min(var_56_0:GetCount(), arg_56_0.baseCapacity + arg_56_0.extraCapacity)
		end
	end

	arg_56_0.scrollRect:SetTotalCount(#arg_56_0.displays, -1)
	arg_56_0:FlushShelfs()
	arg_56_0:FlushEstimate()
end

function var_0_0.GetAutoShipIds(arg_57_0)
	local var_57_0 = underscore.select(getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShips(), function(arg_58_0)
		return arg_58_0:GetState() == IslandShip.STATE_NORMAL
	end)

	table.sort(var_57_0, CompareFuncs({
		function(arg_59_0)
			return arg_57_0:GetEffectiveManangeUnlockSkill(arg_59_0) and 0 or 1
		end,
		function(arg_60_0)
			local var_60_0 = IslandBuffHelper.GetShipBuffsByType({
				arg_60_0
			}, IslandBuffType.SHIP_MANAGE_SELL_PRICE)

			return -underscore.reduce(var_60_0, 0, function(arg_61_0, arg_61_1)
				return arg_61_0 + arg_61_1:GetBuffEffect()[2]
			end)
		end,
		function(arg_62_0)
			local var_62_0 = IslandBuffHelper.GetShipBuffsByType({
				arg_62_0
			}, IslandBuffType.SHIP_MANAGE_SELL_NUM)

			return -underscore.reduce(var_62_0, 0, function(arg_63_0, arg_63_1)
				return arg_63_0 + arg_63_1:GetBuffEffect()[2]
			end)
		end,
		function(arg_64_0)
			return arg_64_0.id
		end
	}))

	local var_57_1 = {}

	for iter_57_0 = 1, #arg_57_0.assistantsData do
		if var_57_0[iter_57_0] then
			table.insert(var_57_1, var_57_0[iter_57_0].id)
		end
	end

	if #var_57_1 == 0 and #arg_57_0.assistantsData > 0 then
		table.insert(var_57_1, IslandCharacterAgency.NPC_CONFIG_ID)
	end

	return var_57_1
end

function var_0_0.FlushBtns(arg_65_0)
	local var_65_0 = arg_65_0.rest:GetStatus()

	eachChild(arg_65_0.btnsTF, function(arg_66_0)
		setActive(arg_66_0, arg_66_0.name == var_65_0)
	end)

	if var_65_0 == IslandRestaurant.STATUS.OPENING then
		if not arg_65_0.timer then
			arg_65_0:StartTimer()
			arg_65_0:UpdateTime()
		end
	else
		arg_65_0:StopTimer()
	end
end

function var_0_0.UpdateTime(arg_67_0)
	local var_67_0 = pg.TimeMgr.GetInstance()
	local var_67_1 = arg_67_0.rest:GetEndTime() - var_67_0:GetServerTime()

	setText(arg_67_0.btnsTF:Find("opening/time"), var_67_0:DescCDTime(var_67_1))

	if var_67_1 <= 0 then
		arg_67_0:FlushBtns()
	end
end

function var_0_0.StartTimer(arg_68_0)
	arg_68_0.timer = Timer.New(function()
		arg_68_0:UpdateTime()
	end, 1, -1)

	arg_68_0.timer:Start()
end

function var_0_0.StopTimer(arg_70_0)
	if arg_70_0.timer ~= nil then
		arg_70_0.timer:Stop()

		arg_70_0.timer = nil
	end
end

function var_0_0.OnHide(arg_71_0)
	arg_71_0:StopTimer()
	arg_71_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_72_0)
	arg_72_0:OnHide()
end

function var_0_0.OnDestroy(arg_73_0)
	arg_73_0:OnHide()
end

function var_0_0.CaclShipAttrFactors(arg_74_0, arg_74_1)
	local var_74_0 = 0

	for iter_74_0, iter_74_1 in ipairs(arg_74_0) do
		local var_74_1 = iter_74_1:GetAttrGrade(IslandShipAttr.GetAtrrName(arg_74_1))

		var_74_0 = var_74_0 + pg.island_chara_att[var_74_1].manage_effect / 10000
	end

	return var_74_0
end

return var_0_0

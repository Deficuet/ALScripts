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
	setText(arg_2_0.buffInfoPanel:Find("tips"), i18n("island_manage_buff_tip"))

	arg_2_0.btnsTF = var_2_0:Find("btns")
	arg_2_0.openBtn = arg_2_0.btnsTF:Find("prepare/open"), setText(arg_2_0.btnsTF:Find("prepare/auto/Text"), i18n("island_manage_auto_work"))

	setText(arg_2_0.btnsTF:Find("prepare/open/Text"), i18n("island_manage_start_work"))
	setText(arg_2_0.btnsTF:Find("opening/Text"), i18n("island_manage_working"))
	setText(arg_2_0.btnsTF:Find("close/Text"), i18n("island_manage_result"))
	setText(arg_2_0.btnsTF:Find("end/Text"), i18n("island_manage_end_daily_work"))

	arg_2_0.ticketBtn = arg_2_0.btnsTF:Find("opening/ticket")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/title/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.island_help_manage.tip
		})
	end, SFX_PANEL)
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
		local var_8_0 = {}

		for iter_8_0, iter_8_1 in ipairs(arg_3_0.assistantsData) do
			var_8_0[iter_8_1.id] = arg_3_0.selectedShipIds[iter_8_0]
		end

		arg_3_0:emit(IslandMediator.OPEN_RESTAURANT, {
			restId = arg_3_0.restId,
			ships = var_8_0,
			commodities = arg_3_0.selectedDic,
			estimateData = {
				trade_id = arg_3_0.restId,
				sell_num_min = arg_3_0.totalMinCnt,
				sell_num_max = arg_3_0.totalMaxCnt,
				sell_money_min = arg_3_0.totalMinSales,
				sell_money_max = arg_3_0.totalMaxSales
			}
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
	arg_3_0.shipUIList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateShipItem(arg_12_1, arg_12_2)
		end
	end)

	function arg_3_0.scrollRect.onInitItem(arg_13_0)
		arg_3_0:OnInitItem(arg_13_0)
	end

	function arg_3_0.scrollRect.onUpdateItem(arg_14_0, arg_14_1)
		arg_3_0:OnUpdateItem(arg_14_0, arg_14_1)
	end

	arg_3_0.shelfUIList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateShelfItem(arg_15_1, arg_15_2)
		end
	end)
	arg_3_0.buffInfoUIList:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			local var_16_0 = arg_3_0.buffInfos[arg_16_1 + 1]

			setText(arg_16_2:Find("bg/name"), var_16_0.name)
			setText(arg_16_2:Find("bg/effect"), var_16_0.effect)
		end
	end)

	arg_3_0.priceFactor = var_0_3.island_manage_price_coefficient.key_value_int / 100
	arg_3_0.argA = var_0_3.island_manage_sale_coefficient_a.key_value_int / 100
	arg_3_0.argB = var_0_3.island_manage_sale_coefficient_b.key_value_int / 100
	arg_3_0.argC = var_0_3.island_manage_sale_coefficient_c.key_value_int / 100
	arg_3_0.saleConst = var_0_3.island_manage_sale_constant.key_value_int / 100
	arg_3_0.maxAttrEffect = pg.island_chara_att[1].manage_effect / 10000
	arg_3_0.minSaleCnt = var_0_3.island_manage_sale_limit.key_value_int
end

function var_0_0.AddListeners(arg_17_0)
	arg_17_0:AddListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_17_0.Flush)
	arg_17_0:AddListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_17_0.Flush)
	arg_17_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_17_0.Flush)
end

function var_0_0.RemoveListeners(arg_18_0)
	arg_18_0:RemoveListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_18_0.Flush)
	arg_18_0:RemoveListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_18_0.Flush)
	arg_18_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_18_0.Flush)
end

function var_0_0.OnInitItem(arg_19_0, arg_19_1)
	local var_19_0 = IslandFoodCard.New(arg_19_1)

	onButton(arg_19_0, var_19_0._go, function()
		if isActive(arg_19_0.detailPanel) then
			setActive(arg_19_0.detailPanel, false)
		end

		if not arg_19_0.isOperable then
			return
		end

		arg_19_0:AddOnShelf(var_19_0)
	end, SFX_PANEL)

	arg_19_0.cards[arg_19_1] = var_19_0
end

function var_0_0.AddOnShelf(arg_21_0, arg_21_1)
	if #arg_21_0.shelfInfos >= arg_21_0.shelfCnt then
		return
	end

	local var_21_0 = math.min(arg_21_1.item:GetCount(), arg_21_0.baseCapacity + arg_21_0.extraCapacity)

	arg_21_0.selectedDic[arg_21_1.item.id] = var_21_0

	arg_21_1:UpdateSelectedCnt(var_21_0)
	arg_21_0:FlushShelfs()
	arg_21_0:FlushEstimate()
end

function var_0_0.ShowDetailPanel(arg_22_0, arg_22_1, arg_22_2)
	setAnchoredPosition(arg_22_0.detailPanel, arg_22_2 + var_0_1)
	setActive(arg_22_0.detailPanel, true)
	setText(arg_22_0.detailNameTF, arg_22_1:GetName())

	local var_22_0 = math.floor(arg_22_1:getConfig("order_price") * arg_22_0.priceFactor)

	setText(arg_22_0.detailPriceTF, var_22_0)
	setText(arg_22_0.detailDescTF, arg_22_1:GetDesc())

	local var_22_1 = IslandShipAttr.GetAtrrName(arg_22_1:getConfig("sub_attribute")[1])
	local var_22_2 = i18n("island_manage_attr_effect") .. IslandShipAttr.ATTRS_CH[1] .. "、" .. IslandShipAttr.ToChinese(var_22_1)

	setText(arg_22_0.detailEffectTF, var_22_2)
end

function var_0_0.OnUpdateItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.cards[arg_23_2]

	if not var_23_0 then
		arg_23_0:OnInitItem(arg_23_2)

		var_23_0 = arg_23_0.cards[arg_23_2]
	end

	local var_23_1 = arg_23_0.displays[arg_23_1 + 1]

	if var_23_1 then
		local var_23_2 = arg_23_0:GetAttrsFactorsRatio(var_23_1.id)
		local var_23_3 = arg_23_0.selectedDic and arg_23_0.selectedDic[var_23_1.id] and arg_23_0.selectedDic[var_23_1.id] or 0

		var_23_0:Update(var_23_1, arg_23_0.isOperable and var_23_3 or 0, arg_23_0.eventEffects[var_23_1.id], var_23_2)
	end

	local var_23_4 = arg_23_0.detailPanel.parent:InverseTransformPoint(var_23_0._tf.position)

	GetOrAddComponent(var_23_0._go, typeof(UILongPressTrigger)).onLongPressed:AddListener(function()
		arg_23_0:ShowDetailPanel(var_23_0.item, var_23_4)
	end)
end

function var_0_0.UpdateCardWithItemId(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.cards) do
		if iter_25_1.item.id == arg_25_1 then
			iter_25_1:UpdateSelectedCnt(arg_25_0.selectedDic[arg_25_1] or 0)
		end
	end
end

function var_0_0.OnShow(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0:BlurPanel()
	setActive(arg_26_0.buffInfoPanel, false)

	arg_26_0.restId = arg_26_1
	arg_26_0.isPost = arg_26_2
	arg_26_0.cards = {}

	arg_26_0:Flush()
end

function var_0_0.OnEnable(arg_27_0)
	arg_27_0:Flush()
end

function var_0_0.Flush(arg_28_0)
	arg_28_0:FlushData()
	arg_28_0:FlushName()
	arg_28_0:FlushRank()
	arg_28_0:FlushEvent()

	arg_28_0.selectedShipIds = nil

	arg_28_0:FlushAssistants()

	arg_28_0.selectedDic = nil

	arg_28_0:FlushCards()
	arg_28_0:FlushShelfs()
	arg_28_0:FlushEstimate()
	arg_28_0:FlushBtns()
end

function var_0_0.FlushData(arg_29_0)
	arg_29_0.rest = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurant(arg_29_0.restId)
	arg_29_0.shelfCnt = arg_29_0.rest:GetShelfCnt()
	arg_29_0.assistantsData = arg_29_0.rest:GetAssistants()
	arg_29_0.baseCapacity = arg_29_0.rest:GetBaseShelfCapacity()
	arg_29_0.extraCapacity = 0
	arg_29_0.isOperable = arg_29_0.rest:GetStatus() == IslandRestaurant.STATUS.PREPARE
end

function var_0_0.FlushName(arg_30_0)
	setText(arg_30_0.nameTF, arg_30_0.rest:getConfig("name"))
	setText(arg_30_0.nameEnTF, arg_30_0.rest:getConfig("name_en"))
end

function var_0_0.FlushRank(arg_31_0)
	LoadImageSpriteAsync("island/islandrestaurant/" .. arg_31_0.rest:GetRankIcon(), arg_31_0.rankIcon)

	local var_31_0 = arg_31_0.rest:GetSales()
	local var_31_1 = arg_31_0.rest:GetCanUpgradeExp()

	setText(arg_31_0.rankText, var_31_0 .. "/" .. var_31_1)
	setSlider(arg_31_0.rankSlider, 0, 1, var_31_1 == 0 and 0 or var_31_0 / var_31_1)
end

function var_0_0.FlushEvent(arg_32_0)
	arg_32_0.eventId, arg_32_0.eventEffects, arg_32_0.eventInfluence = arg_32_0.rest:GetEventInfo()

	setActive(arg_32_0.eventContainer, arg_32_0.eventId ~= 0)

	if arg_32_0.eventId ~= 0 then
		local var_32_0 = pg.island_manage_event[arg_32_0.eventId]

		setText(arg_32_0.eventTitleTF, var_32_0.name)
		setText(arg_32_0.eventDescTF, var_32_0.desc)
	end
end

function var_0_0.FlushAssistants(arg_33_0)
	if not arg_33_0.selectedShipIds then
		local var_33_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

		arg_33_0.selectedShipIds = {}

		for iter_33_0, iter_33_1 in ipairs(arg_33_0.assistantsData) do
			local var_33_1 = iter_33_1.shipId

			if var_33_1 ~= 0 then
				table.insert(arg_33_0.selectedShipIds, var_33_1)
			end
		end
	end

	arg_33_0.selectedShips = {}

	local var_33_2 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	for iter_33_2, iter_33_3 in ipairs(arg_33_0.selectedShipIds) do
		table.insert(arg_33_0.selectedShips, var_33_2:GetShipById(iter_33_3))
	end

	arg_33_0.shipUIList:align(var_0_0.MAX_ASSISTANT_CNT)

	arg_33_0.extraPricePer = 0
	arg_33_0.extraCapacity = 0
	arg_33_0.buffInfos = {}

	local var_33_3 = IslandBuffHelper.GetManageSellPriceBuffs(arg_33_0.selectedShips, arg_33_0.restId)

	for iter_33_4, iter_33_5 in ipairs(var_33_3) do
		local var_33_4 = iter_33_5:GetBuffEffect()[2]

		table.insert(arg_33_0.buffInfos, {
			name = i18n("island_manage_saleroom"),
			effect = "+" .. var_33_4 .. "%"
		})

		arg_33_0.extraPricePer = arg_33_0.extraPricePer + var_33_4 / 100
	end

	local var_33_5 = IslandBuffHelper.GetManageSellNumBuffs(arg_33_0.selectedShips, arg_33_0.restId)

	for iter_33_6, iter_33_7 in ipairs(var_33_5) do
		local var_33_6 = iter_33_7:GetBuffEffect()[2]

		table.insert(arg_33_0.buffInfos, {
			name = i18n("island_manage_capacity"),
			effect = "+" .. var_33_6
		})

		arg_33_0.extraCapacity = arg_33_0.extraCapacity + var_33_6
	end

	if arg_33_0.statusCheckTimer then
		arg_33_0.statusCheckTimer:Stop()
	end

	if arg_33_0.isOperable then
		arg_33_0.shipStatus = IslandBuffHelper.GetManageStatus(arg_33_0.selectedShips, arg_33_0.restId)

		if #arg_33_0.shipStatus > 0 then
			arg_33_0.statusCheckTimer = Timer.New(function()
				if underscore.reduce(arg_33_0.shipStatus, 0, function(arg_35_0, arg_35_1)
					return arg_35_0 + (arg_35_1:IsExpiration() and 1 or 0)
				end) > 0 then
					arg_33_0:OnStatusExpired()
				end
			end, 1, -1)

			arg_33_0.statusCheckTimer:Start()
		end
	end

	setActive(arg_33_0.extraCapacityTF, arg_33_0.isOperable and arg_33_0.extraCapacity > 0)
	setText(arg_33_0.extraCapacityEffectTF, "+" .. arg_33_0.extraCapacity)
	arg_33_0.buffInfoUIList:align(#arg_33_0.buffInfos)
	setActive(arg_33_0.buffInfoEmptyTF, #arg_33_0.buffInfos == 0)

	local var_33_7 = arg_33_0.shelfInfos and #arg_33_0.shelfInfos > 0 and arg_33_0.selectedShipIds and #arg_33_0.selectedShipIds > 0

	setGray(arg_33_0.openBtn, not var_33_7, true)
	setButtonEnabled(arg_33_0.openBtn, var_33_7)
end

function var_0_0.GetEffectiveManangeSkill(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1:GetSkill()

	return var_36_0:IsEffectiveInRest(arg_36_0.restId) and var_36_0 or nil
end

function var_0_0.GetEffectiveManangeUnlockSkill(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:GetEffectiveManangeSkill(arg_37_1)

	return var_37_0 and var_37_0:IsUnlock() and var_37_0 or nil
end

function var_0_0.UpdateShipItem(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_1 + 1

	arg_38_2.name = var_38_0

	local var_38_1 = var_38_0 <= #arg_38_0.assistantsData

	setActive(arg_38_2:Find("lock"), not var_38_1)

	local var_38_2 = arg_38_0.selectedShips[var_38_0]

	setActive(arg_38_2:Find("empty"), var_38_1 and not var_38_2)
	setActive(arg_38_2:Find("ship"), var_38_1 and var_38_2)
	onButton(arg_38_0, arg_38_2, function()
		if not var_38_1 or not arg_38_0.isOperable then
			return
		end

		arg_38_0:OpenPage(IslandShipSelectPage, {
			showBenefits = true,
			selectNum = #arg_38_0.assistantsData,
			selectedIds = Clone(arg_38_0.selectedShipIds),
			attrType = IslandShipAttr.MANAGE_KEY,
			confirmFunc = function(arg_40_0)
				arg_38_0:OnSelectedShipsDone(arg_40_0)
			end,
			emptyInfoTitle = arg_38_0.rest:getConfig("name")
		})
	end, SFX_PANEL)

	if var_38_2 then
		local var_38_3 = arg_38_2:Find("ship")

		setText(var_38_3:Find("name"), var_38_2:GetName())

		local var_38_4 = arg_38_0:GetEffectiveManangeSkill(var_38_2)

		setActive(var_38_3:Find("skill"), var_38_4 and var_38_4:IsUnlock())
		setActive(var_38_3:Find("skill_lock"), var_38_4 and not var_38_4:IsUnlock())

		local var_38_5 = IslandShip.StaticGetPrefab(var_38_2.id)

		GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_38_5, "", var_38_3:Find("icon"))

		local var_38_6 = var_38_3:Find("skill")

		if var_38_4 then
			if var_38_4:IsUnlock() then
				setActive(var_38_6:Find("effects"), true)
				setActive(var_38_6:Find("invalid"), false)
				LoadImageSpriteAsync("island/islandskillicon/" .. var_38_4:GetIcon(), var_38_6:Find("skill_icon"))
				setText(var_38_6:Find("skill_name"), var_38_4:GetName())

				local var_38_7 = IslandBuffHelper.GetAllShipManageBuffs(var_38_2, arg_38_0.restId)

				UIItemList.StaticAlign(var_38_6:Find("effects"), var_38_6:Find("effects/tpl"), #var_38_7, function(arg_41_0, arg_41_1, arg_41_2)
					if arg_41_0 == UIItemList.EventUpdate then
						local var_41_0 = var_38_7[arg_41_1 + 1]
						local var_41_1 = var_41_0:GetBuffType()
						local var_41_2 = ""
						local var_41_3 = ""

						if var_41_1 == IslandBuffType.SHIP_MANAGE_SELL_PRICE then
							var_41_2 = i18n("island_manage_saleroom")
							var_41_3 = "+" .. var_41_0:GetBuffEffect()[2] .. "%"
						elseif var_41_1 == IslandBuffType.SHIP_MANAGE_SELL_NUM then
							var_41_2 = i18n("island_manage_capacity")
							var_41_3 = "+" .. var_41_0:GetBuffEffect()[2]
						end

						setText(arg_41_2:Find("name"), var_41_2)
						setText(arg_41_2:Find("effect"), var_41_3)
					end
				end)
			else
				setText(var_38_3:Find("skill_lock/Image/Text"), i18n("island_need_star_1", var_38_2:GetSkillUnlockLevel()))
			end
		else
			local var_38_8 = var_38_2:GetSkill()

			setActive(var_38_3:Find("skill"), true)
			LoadImageSpriteAsync("island/islandskillicon/" .. var_38_8:GetIcon(), var_38_6:Find("skill_icon"))
			setText(var_38_6:Find("skill_name"), var_38_8:GetName())
			setActive(var_38_6:Find("effects"), false)
			setActive(var_38_6:Find("invalid"), true)
		end
	end
end

function var_0_0.FlushCards(arg_42_0)
	arg_42_0.displays = {}

	local var_42_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.rest:getConfig("item_id")) do
		local var_42_1 = var_42_0:GetItemById(iter_42_1[1])

		if var_42_1 then
			table.insert(arg_42_0.displays, var_42_1)
		end
	end

	setActive(arg_42_0.commoditiesEmptyTF, #arg_42_0.displays <= 0)
	setActive(arg_42_0.commoditiesTF, #arg_42_0.displays > 0)
	arg_42_0:CaclAttrsFactors()

	if #arg_42_0.displays > 0 then
		arg_42_0:SortDisplays()
	end
end

function var_0_0.SortDisplays(arg_43_0)
	table.sort(arg_43_0.displays, CompareFuncs({
		function(arg_44_0)
			return -arg_43_0.subAttrFactorsDic[arg_44_0.id]
		end,
		function(arg_45_0)
			return -arg_45_0:getConfig("order_price") * arg_43_0.priceFactor
		end,
		function(arg_46_0)
			return arg_46_0.id
		end
	}))

	if arg_43_0:isShowing() then
		arg_43_0.scrollRect:SetTotalCount(#arg_43_0.displays, -1)
	end
end

function var_0_0.CaclAttrsFactors(arg_47_0)
	arg_47_0.subAttrFactorsDic = {}
	arg_47_0.mainAttrFactorsDic = {}

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.displays) do
		local var_47_0 = iter_47_1:getConfig("sub_attribute")[1]

		arg_47_0.subAttrFactorsDic[iter_47_1.id] = var_47_0 and var_0_0.CaclShipAttrFactors(arg_47_0.selectedShips, var_47_0) or 0
		arg_47_0.mainAttrFactorsDic[iter_47_1.id] = var_0_0.CaclShipAttrFactors(arg_47_0.selectedShips, IslandShipAttr.MANAGE_KEY)
	end
end

function var_0_0.GetSubAttrFactors(arg_48_0, arg_48_1)
	if arg_48_0.subAttrFactorsDic[arg_48_1] then
		return arg_48_0.subAttrFactorsDic[arg_48_1]
	end

	local var_48_0 = var_0_2[arg_48_1].sub_attribute[1]

	arg_48_0.subAttrFactorsDic[arg_48_1] = var_48_0 and var_0_0.CaclShipAttrFactors(arg_48_0.selectedShips, var_48_0) or 0

	return arg_48_0.subAttrFactorsDic[arg_48_1]
end

function var_0_0.GetMainAttrFactors(arg_49_0, arg_49_1)
	if arg_49_0.mainAttrFactorsDic[arg_49_1] then
		return arg_49_0.mainAttrFactorsDic[arg_49_1]
	end

	arg_49_0.mainAttrFactorsDic[arg_49_1] = var_0_0.CaclShipAttrFactors(arg_49_0.selectedShips, IslandShipAttr.MANAGE_KEY)

	return arg_49_0.mainAttrFactorsDic[arg_49_1]
end

function var_0_0.GetAttrsFactorsRatio(arg_50_0, arg_50_1)
	local var_50_0 = var_0_2[arg_50_1].sub_attribute[2] / 100
	local var_50_1 = arg_50_0:GetMainAttrFactors(arg_50_1) + arg_50_0:GetSubAttrFactors(arg_50_1) * var_50_0
	local var_50_2 = #arg_50_0.assistantsData * (arg_50_0.maxAttrEffect + arg_50_0.maxAttrEffect * var_50_0)

	return var_50_2 == 0 and 0 or var_50_1 / var_50_2
end

function var_0_0.FlushShelfs(arg_51_0)
	if not arg_51_0.selectedDic then
		arg_51_0.selectedDic = {}

		for iter_51_0, iter_51_1 in ipairs(arg_51_0.rest:GetCommondities()) do
			arg_51_0.selectedDic[iter_51_1.id] = iter_51_1.num
		end
	end

	arg_51_0.shelfInfos = {}

	for iter_51_2, iter_51_3 in pairs(arg_51_0.selectedDic) do
		table.insert(arg_51_0.shelfInfos, {
			id = iter_51_2,
			num = iter_51_3
		})
	end

	arg_51_0.shelfUIList:align(var_0_0.MAX_SHELF_CNT)

	local var_51_0 = arg_51_0.shelfInfos and #arg_51_0.shelfInfos > 0 and arg_51_0.selectedShipIds and #arg_51_0.selectedShipIds > 0

	setGray(arg_51_0.openBtn, not var_51_0, true)
	setButtonEnabled(arg_51_0.openBtn, var_51_0)
end

function var_0_0.UpdateShelfItem(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_1 + 1

	arg_52_2.name = var_52_0

	local var_52_1 = var_52_0 <= arg_52_0.shelfCnt

	setActive(arg_52_2:Find("lock"), not var_52_1)

	local var_52_2 = arg_52_0.shelfInfos[var_52_0]

	setActive(arg_52_2:Find("empty"), var_52_1 and not var_52_2)
	setActive(arg_52_2:Find("commodity"), var_52_1 and var_52_2)

	if var_52_2 then
		local var_52_3 = arg_52_2:Find("commodity")

		LoadImageSpriteAsync("island/" .. var_0_2[var_52_2.id].icon, var_52_3:Find("bg/icon"))

		local var_52_4 = arg_52_0.baseCapacity + arg_52_0.extraCapacity

		if arg_52_0.isOperable then
			setText(var_52_3:Find("count/Text"), var_52_2.num .. "/" .. (arg_52_0.extraCapacity > 0 and setColorStr(var_52_4, "#7BF59DFF") or var_52_4))
		else
			setText(var_52_3:Find("count/Text"), var_52_2.num)
		end

		setActive(var_52_3:Find("event"), arg_52_0.eventEffects[var_52_2.id])

		local var_52_5 = arg_52_0:GetAttrsFactorsRatio(var_52_2.id)

		setFillAmount(var_52_3:Find("bg/silder/bar"), var_52_5)
		setActive(var_52_3:Find("reduce"), arg_52_0.isOperable)
		onButton(arg_52_0, var_52_3:Find("reduce"), function()
			if not arg_52_0.isOperable then
				return
			end

			arg_52_0:ReduceShelfCnt(var_52_2.id, 1)
			arg_52_0:FlushEstimate()
		end, SFX_PANEL)

		if var_52_4 < var_52_2.num then
			arg_52_0:ReduceShelfCnt(var_52_2.id, var_52_2.num - var_52_4)
			arg_52_0:FlushEstimate()
		end
	end
end

function var_0_0.ReduceShelfCnt(arg_54_0, arg_54_1, arg_54_2)
	arg_54_0.selectedDic[arg_54_1] = arg_54_0.selectedDic[arg_54_1] - arg_54_2

	if arg_54_0.selectedDic[arg_54_1] <= 0 then
		arg_54_0.selectedDic[arg_54_1] = nil
	end

	arg_54_0:UpdateCardWithItemId(arg_54_1)
	arg_54_0:FlushShelfs()
end

function var_0_0.FlushEstimate(arg_55_0)
	local var_55_0 = arg_55_0.rest:GetStatus()

	if var_55_0 == IslandRestaurant.STATUS.OPENING or var_55_0 == IslandRestaurant.STATUS.CLOSE then
		local var_55_1 = arg_55_0.rest:GetEstimateData()

		setText(arg_55_0.estimateCntTF, var_55_1.cntMin .. "-" .. var_55_1.cntMax)
		setText(arg_55_0.estimateSalesTF, var_55_1.salesMin .. "-" .. var_55_1.salesMax)
	else
		local var_55_2, var_55_3 = arg_55_0.rest:GetRandomSaleCntBound()

		arg_55_0.totalMinCnt, arg_55_0.totalMaxCnt, arg_55_0.totalMinSales, arg_55_0.totalMaxSales = 0, 0, 0, 0

		for iter_55_0, iter_55_1 in pairs(arg_55_0.selectedDic) do
			local var_55_4 = arg_55_0:CaclBaseSaleCnt(iter_55_0)
			local var_55_5 = math.min(iter_55_1, math.max(arg_55_0.minSaleCnt, var_55_4 + var_55_2))
			local var_55_6 = math.min(iter_55_1, math.max(arg_55_0.minSaleCnt, var_55_4 + var_55_3))

			arg_55_0.totalMinSales = arg_55_0.totalMinSales + arg_55_0:CaclGroupPrice(iter_55_0, var_55_5)
			arg_55_0.totalMaxSales = arg_55_0.totalMaxSales + arg_55_0:CaclGroupPrice(iter_55_0, var_55_6)
			arg_55_0.totalMinCnt = arg_55_0.totalMinCnt + var_55_5
			arg_55_0.totalMaxCnt = arg_55_0.totalMaxCnt + var_55_6
		end

		setText(arg_55_0.estimateCntTF, arg_55_0.totalMinCnt .. "-" .. arg_55_0.totalMaxCnt)
		setText(arg_55_0.estimateSalesTF, arg_55_0.totalMinSales .. "-" .. arg_55_0.totalMaxSales)
	end
end

function var_0_0.CaclBaseSaleCnt(arg_56_0, arg_56_1)
	local var_56_0 = var_0_2[arg_56_1].manage_influence / 100 + (arg_56_0.eventEffects[arg_56_1] and arg_56_0.eventInfluence or 0)
	local var_56_1 = arg_56_0.argA + arg_56_0:GetMainAttrFactors(arg_56_1)
	local var_56_2 = var_0_2[arg_56_1].sub_attribute[2] / 100
	local var_56_3 = arg_56_0.argB + arg_56_0:GetSubAttrFactors(arg_56_1) * var_56_2
	local var_56_4 = arg_56_0.argC + arg_56_0.rest:GetRankFactor()

	return math.floor(var_56_0 * var_56_1 * var_56_3 * var_56_4 / arg_56_0.saleConst)
end

function var_0_0.CaclGroupPrice(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = var_0_2[arg_57_1].order_price * arg_57_0.priceFactor
	local var_57_1 = arg_57_0.eventEffects[arg_57_1] or 0

	return math.floor(var_57_0 * arg_57_2 * (1 + var_57_1 + arg_57_0.extraPricePer))
end

function var_0_0.OnStatusExpired(arg_58_0)
	arg_58_0:FlushAssistants()
	arg_58_0:FlushCards()
	arg_58_0:FlushShelfs()
	arg_58_0:FlushEstimate()
end

function var_0_0.OnSelectedShipsDone(arg_59_0, arg_59_1)
	arg_59_0.selectedShipIds = arg_59_1

	arg_59_0:FlushAssistants()
	arg_59_0:FlushCards()
	arg_59_0:FlushShelfs()
	arg_59_0:FlushEstimate()
end

function var_0_0.OnAutoSelect(arg_60_0)
	arg_60_0.selectedShipIds = arg_60_0:GetAutoShipIds()

	arg_60_0:FlushAssistants()
	arg_60_0:FlushCards()

	arg_60_0.selectedDic = {}

	for iter_60_0 = 1, arg_60_0.shelfCnt do
		local var_60_0 = arg_60_0.displays[iter_60_0]

		if var_60_0 then
			arg_60_0.selectedDic[var_60_0.id] = math.min(var_60_0:GetCount(), arg_60_0.baseCapacity + arg_60_0.extraCapacity)
		end
	end

	arg_60_0.scrollRect:SetTotalCount(#arg_60_0.displays, -1)
	arg_60_0:FlushShelfs()
	arg_60_0:FlushEstimate()
end

function var_0_0.GetAutoShipIds(arg_61_0)
	local var_61_0 = underscore.select(getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShips(), function(arg_62_0)
		return arg_62_0:GetState() == IslandShip.STATE_NORMAL
	end)

	table.sort(var_61_0, CompareFuncs({
		function(arg_63_0)
			return arg_61_0:GetEffectiveManangeUnlockSkill(arg_63_0) and 0 or 1
		end,
		function(arg_64_0)
			local var_64_0 = IslandBuffHelper.GetShipBuffsByType({
				arg_64_0
			}, IslandBuffType.SHIP_MANAGE_SELL_PRICE)

			return -underscore.reduce(var_64_0, 0, function(arg_65_0, arg_65_1)
				return arg_65_0 + arg_65_1:GetBuffEffect()[2]
			end)
		end,
		function(arg_66_0)
			local var_66_0 = IslandBuffHelper.GetShipBuffsByType({
				arg_66_0
			}, IslandBuffType.SHIP_MANAGE_SELL_NUM)

			return -underscore.reduce(var_66_0, 0, function(arg_67_0, arg_67_1)
				return arg_67_0 + arg_67_1:GetBuffEffect()[2]
			end)
		end,
		function(arg_68_0)
			return arg_68_0.id
		end
	}))

	local var_61_1 = {}

	for iter_61_0 = 1, #arg_61_0.assistantsData do
		if var_61_0[iter_61_0] then
			table.insert(var_61_1, var_61_0[iter_61_0].id)
		end
	end

	if #var_61_1 == 0 and #arg_61_0.assistantsData > 0 then
		table.insert(var_61_1, IslandCharacterAgency.NPC_CONFIG_ID)
	end

	return var_61_1
end

function var_0_0.FlushBtns(arg_69_0)
	local var_69_0 = arg_69_0.rest:GetStatus()

	eachChild(arg_69_0.btnsTF, function(arg_70_0)
		setActive(arg_70_0, arg_70_0.name == var_69_0)
	end)

	if var_69_0 == IslandRestaurant.STATUS.OPENING then
		if not arg_69_0.timer then
			arg_69_0:StartTimer()
			arg_69_0:UpdateTime()
		end
	else
		arg_69_0:StopTimer()
	end

	setActive(arg_69_0.buffInfoBtn, arg_69_0.isOperable)
end

function var_0_0.UpdateTime(arg_71_0)
	local var_71_0 = pg.TimeMgr.GetInstance()
	local var_71_1 = arg_71_0.rest:GetEndTime() - var_71_0:GetServerTime()

	setText(arg_71_0.btnsTF:Find("opening/time"), var_71_0:DescCDTime(var_71_1))

	if var_71_1 <= 0 then
		arg_71_0:FlushBtns()
	end
end

function var_0_0.StartTimer(arg_72_0)
	arg_72_0.timer = Timer.New(function()
		arg_72_0:UpdateTime()
	end, 1, -1)

	arg_72_0.timer:Start()
end

function var_0_0.StopTimer(arg_74_0)
	if arg_74_0.timer ~= nil then
		arg_74_0.timer:Stop()

		arg_74_0.timer = nil
	end
end

function var_0_0.OnHide(arg_75_0)
	arg_75_0:StopTimer()

	if arg_75_0.statusCheckTimer then
		arg_75_0.statusCheckTimer:Stop()

		arg_75_0.statusCheckTimer = nil
	end

	arg_75_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_76_0)
	arg_76_0:OnHide()
end

function var_0_0.OnDestroy(arg_77_0)
	ClearLScrollrect(arg_77_0.scrollRect)
	arg_77_0:OnHide()
end

function var_0_0.CaclShipAttrFactors(arg_78_0, arg_78_1)
	local var_78_0 = 0

	for iter_78_0, iter_78_1 in ipairs(arg_78_0) do
		local var_78_1 = iter_78_1:GetAttrGrade(IslandShipAttr.GetAtrrName(arg_78_1))

		var_78_0 = var_78_0 + pg.island_chara_att[var_78_1].manage_effect / 10000
	end

	return var_78_0
end

return var_0_0

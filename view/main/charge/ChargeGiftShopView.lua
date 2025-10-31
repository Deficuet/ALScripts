local var_0_0 = class("ChargeGiftShopView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ChargeGiftShopUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:Show()
end

function var_0_0.OnDestroy(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(arg_3_0.chargeCardTable or {}) do
		iter_3_1:destoryTimer()
	end

	arg_3_0:removeUpdateTimer()
end

function var_0_0.initData(arg_4_0)
	arg_4_0.giftGoodsVOList = {}
	arg_4_0.giftGoodsVOListForShow = {}
	arg_4_0.packageSortList = {
		0
	}
	arg_4_0.prevBtn = nil
	arg_4_0.selectedPackageType = nil
	arg_4_0.updateTime = nil
	arg_4_0.updateTimer = nil
	arg_4_0.player = getProxy(PlayerProxy):getData()

	arg_4_0:updateData()
end

function var_0_0.initUI(arg_5_0)
	arg_5_0.emptyGo = arg_5_0._tf:Find("emptyText")

	setText(arg_5_0.emptyGo, i18n("shop_pack_empty"))

	arg_5_0.lScrollRect = GetComponent(arg_5_0._tf:Find("lScrollRect"), "LScrollRect")
	arg_5_0.chargeCardTable = {}

	arg_5_0:initScrollRect()
	arg_5_0:initToggleList()
	arg_5_0:updateToggleList()
	arg_5_0:updateScrollRect()
	triggerButton(arg_5_0._tf:Find("toggleGroup"):GetChild(0))
end

function var_0_0.GetViewSkinWrap(arg_6_0)
	return ChargeScene.TYPE_GIFT
end

function var_0_0.initScrollRect(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0.chargeCardTable = {}

	local function var_7_0(arg_8_0)
		local var_8_0 = ChargeCard.New(arg_8_0)

		onButton(arg_7_0, var_8_0.tr, function()
			if var_8_0.goods:isChargeType() then
				switch(var_8_0.goods:getShowType(), {
					[Goods.SHOW_TYPE_TECH] = function()
						arg_7_0:emit(NewShopMainMediator.OPEN_TEC_SHIP_GIFT_SELL_LAYER, var_8_0.goods, arg_7_0.chargedList)
					end,
					[Goods.SHOW_TYPE_BATTLE_UI] = function()
						arg_7_0:emit(NewShopMainMediator.OPEN_BATTLE_UI_SELL_LAYER, var_8_0.goods, arg_7_0.chargedList)
					end
				}, function()
					arg_7_0:confirm(var_8_0.goods)
				end)
			else
				arg_7_0:confirm(var_8_0.goods)
			end
		end, SFX_PANEL)
		onButton(arg_7_0, var_8_0.viewBtn, function()
			if not var_8_0.goods:isChargeType() then
				return
			end

			local var_13_0 = var_8_0.goods:GetSkinProbability()
			local var_13_1 = getProxy(ShipSkinProxy):GetProbabilitySkins(var_13_0)

			if #var_13_0 <= 0 or #var_13_0 ~= #var_13_1 then
				local var_13_2 = var_8_0.goods:GetSkinProbabilityItem()

				arg_7_0:emit(BaseUI.ON_DROP, var_13_2)
			else
				arg_7_0:emit(NewShopMainMediator.VIEW_SKIN_PROBABILITY, var_8_0.goods.id, arg_7_0:GetViewSkinWrap())
			end
		end, SFX_PANEL)

		arg_7_0.chargeCardTable[arg_8_0] = var_8_0
	end

	local function var_7_1(arg_14_0, arg_14_1)
		local var_14_0 = arg_7_0.chargeCardTable[arg_14_1]

		if not var_14_0 then
			var_7_0(arg_14_1)

			var_14_0 = arg_7_0.chargeCardTable[arg_14_1]
		end

		local var_14_1 = arg_7_0.filterList[arg_14_0 + 1]

		if var_14_1 then
			var_14_0:update(var_14_1, arg_7_0.player, arg_7_0.firstChargeIds)
		end
	end

	arg_7_0.lScrollRect.onInitItem = var_7_0
	arg_7_0.lScrollRect.onUpdateItem = var_7_1
end

function var_0_0.updateToggleList(arg_15_0)
	arg_15_0.uiToggleList:align(#arg_15_0.packageSortList)
end

function var_0_0.updateScrollRect(arg_16_0)
	arg_16_0.filterList = arg_16_0:getFilterList()
	arg_16_0.lScrollRect.enabled = true

	arg_16_0.lScrollRect:SetTotalCount(#arg_16_0.filterList, arg_16_0.lScrollRect.value)
	setActive(arg_16_0.emptyGo, #arg_16_0.filterList <= 0)
end

function var_0_0.confirm(arg_17_0, arg_17_1)
	if not arg_17_1 then
		return
	end

	arg_17_1 = Clone(arg_17_1)

	if arg_17_1:isChargeType() then
		local var_17_0 = not table.contains(arg_17_0.firstChargeIds, arg_17_1.id) and arg_17_1:firstPayDouble()
		local var_17_1 = var_17_0 and 4 or arg_17_1:getConfig("tag")

		if arg_17_1:isMonthCard() or arg_17_1:isGiftBox() or arg_17_1:isItemBox() or arg_17_1:isPassItem() then
			local var_17_2 = arg_17_1:GetExtraServiceItem()
			local var_17_3 = arg_17_1:GetExtraDrop()
			local var_17_4 = arg_17_1:GetBonusItem()
			local var_17_5
			local var_17_6

			if arg_17_1:isPassItem() then
				var_17_5 = i18n("battlepass_pay_tip")
			elseif arg_17_1:isMonthCard() then
				var_17_5 = i18n("charge_title_getitem_month")
				var_17_6 = i18n("charge_title_getitem_soon")
			else
				var_17_5 = i18n("charge_title_getitem")
			end

			local var_17_7 = {
				isChargeType = true,
				commodity = arg_17_1,
				infoTip = arg_17_1:GetInfoTip(),
				icon = "chargeicon/" .. arg_17_1:getConfig("picture"),
				name = arg_17_1:getConfig("name_display"),
				tipExtra = var_17_5,
				extraItems = var_17_2,
				price = arg_17_1:getConfig("money"),
				isLocalPrice = arg_17_1:IsLocalPrice(),
				tagType = var_17_1,
				isMonthCard = arg_17_1:isMonthCard(),
				tipBonus = var_17_6,
				bonusItem = var_17_4,
				extraDrop = var_17_3,
				descExtra = arg_17_1:getConfig("descrip_extra"),
				limitArgs = arg_17_1:getConfig("limit_args"),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_17_0:emit(NewShopMainMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_17_0:emit(NewShopMainMediator.CHARGE, arg_17_1.id)
					end
				end
			}

			arg_17_0:emit(NewShopMainMediator.OPEN_CHARGE_ITEM_PANEL, var_17_7)
		elseif arg_17_1:isGem() then
			local var_17_8 = arg_17_1:getConfig("money")
			local var_17_9 = arg_17_1:getConfig("gem")

			if var_17_0 then
				var_17_9 = var_17_9 + arg_17_1:getConfig("gem")
			else
				var_17_9 = var_17_9 + arg_17_1:getConfig("extra_gem")
			end

			local var_17_10 = {
				isChargeType = true,
				commodity = arg_17_1,
				icon = "chargeicon/" .. arg_17_1:getConfig("picture"),
				name = arg_17_1:getConfig("name_display"),
				price = arg_17_1:getConfig("money"),
				isLocalPrice = arg_17_1:IsLocalPrice(),
				tagType = var_17_1,
				normalTip = i18n("charge_start_tip", var_17_8, var_17_9),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_17_0:emit(NewShopMainMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_17_0:emit(NewShopMainMediator.CHARGE, arg_17_1.id)
					end
				end
			}

			arg_17_0:emit(NewShopMainMediator.OPEN_CHARGE_ITEM_BOX, var_17_10)
		end
	else
		local var_17_11 = {}
		local var_17_12 = arg_17_1:getConfig("effect_args")
		local var_17_13 = Item.getConfigData(var_17_12[1])
		local var_17_14 = var_17_13.display_icon

		if type(var_17_14) == "table" then
			for iter_17_0, iter_17_1 in ipairs(var_17_14) do
				table.insert(var_17_11, Drop.New({
					type = iter_17_1[1],
					id = iter_17_1[2],
					count = iter_17_1[3]
				}))
			end
		end

		local var_17_15 = {
			isMonthCard = false,
			isChargeType = false,
			isLocalPrice = false,
			commodity = arg_17_1,
			icon = var_17_13.icon,
			name = var_17_13.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = var_17_11,
			price = arg_17_1:getConfig("resource_num"),
			tagType = arg_17_1:getConfig("tag"),
			onYes = function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", arg_17_1:getConfig("resource_num"), var_17_13.name),
					onYes = function()
						arg_17_0:emit(NewShopMainMediator.BUY_ITEM, arg_17_1.id, 1)
					end
				})
			end
		}

		arg_17_0:emit(NewShopMainMediator.OPEN_CHARGE_ITEM_PANEL, var_17_15)
	end
end

function var_0_0.initToggleList(arg_22_0)
	arg_22_0.uiToggleList = UIItemList.New(arg_22_0._tf:Find("toggleGroup"), arg_22_0._tf:Find("toggleGroup/Toggle"))

	arg_22_0.uiToggleList:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventInit then
			local var_23_0 = arg_22_0.packageSortList[arg_23_1 + 1]

			setText(arg_23_2:Find("selected/Label"), i18n(string.format("shop_package_sort_%s", var_23_0)))
			setText(arg_23_2:Find("selected/enText"), i18n(string.format("shop_package_sort_en_%s", var_23_0)))
			setText(arg_23_2:Find("unselected/Label"), i18n(string.format("shop_package_sort_%s", var_23_0)))
			setActive(arg_23_2:Find("unselected"), true)
			setActive(arg_23_2:Find("selected"), false)
		elseif arg_23_0 == UIItemList.EventUpdate then
			onButton(arg_22_0, arg_23_2, function()
				local var_24_0 = arg_22_0.packageSortList[arg_23_1 + 1]

				if arg_22_0.selectedPackageType == var_24_0 then
					return
				end

				setActive(arg_23_2:Find("unselected"), false)
				setActive(arg_23_2:Find("selected"), true)

				if arg_22_0.prevBtn then
					setActive(arg_22_0.prevBtn:Find("unselected"), true)
					setActive(arg_22_0.prevBtn:Find("selected"), false)
				end

				arg_22_0.prevBtn = arg_23_2
				arg_22_0.selectedPackageType = var_24_0

				arg_22_0:updateScrollRect()
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.updateGiftGoodsVOList(arg_25_0)
	arg_25_0.giftGoodsVOList = {}
	arg_25_0.packageSortList = {
		0
	}

	local var_25_0 = RefluxShopView.getAllRefluxPackID()
	local var_25_1 = pg.pay_data_display

	for iter_25_0, iter_25_1 in pairs(var_25_1.all) do
		if not table.contains(var_25_0, iter_25_1) then
			local var_25_2 = var_25_1[iter_25_1]
			local var_25_3 = var_25_2.extra_service

			if not (var_25_2.akashi_pick == 1) and (var_25_3 == Goods.ITEM_BOX or var_25_3 == Goods.PASS_ITEM) then
				local var_25_4 = Goods.Create({
					shop_id = iter_25_1
				}, Goods.TYPE_CHARGE)

				if arg_25_0:filterLimitTypeGoods(var_25_4) then
					local var_25_5 = var_25_2.package_sort_id

					if not table.contains(arg_25_0.packageSortList, var_25_5) then
						table.insert(arg_25_0.packageSortList, var_25_5)
					end

					table.insert(arg_25_0.giftGoodsVOList, var_25_4)
				end
			end
		end
	end

	for iter_25_2, iter_25_3 in pairs(pg.shop_template.get_id_list_by_genre.gift_package) do
		local var_25_6 = pg.shop_template[iter_25_3]

		if not (var_25_6.akashi_pick == 1) and not table.contains(var_25_0, iter_25_3) then
			local var_25_7 = Goods.Create({
				shop_id = iter_25_3
			}, Goods.TYPE_GIFT_PACKAGE)
			local var_25_8 = var_25_6.package_sort_id

			if not table.contains(arg_25_0.packageSortList, var_25_8) then
				table.insert(arg_25_0.packageSortList, var_25_8)
			end

			table.insert(arg_25_0.giftGoodsVOList, var_25_7)
		end
	end

	table.sort(arg_25_0.packageSortList, function(arg_26_0, arg_26_1)
		return arg_26_0 < arg_26_1
	end)
end

function var_0_0.sortGiftGoodsVOList(arg_27_0)
	arg_27_0.giftGoodsVOListForShow = {}

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.giftGoodsVOList) do
		if iter_27_1:isChargeType() then
			local var_27_0 = ChargeConst.getBuyCount(arg_27_0.chargedList, iter_27_1.id)

			iter_27_1:updateBuyCount(var_27_0)

			if iter_27_1:canPurchase() and iter_27_1:inTime() then
				table.insert(arg_27_0.giftGoodsVOListForShow, iter_27_1)
			end
		elseif not iter_27_1:isLevelLimit(arg_27_0.player.level, true) then
			local var_27_1 = ChargeConst.getBuyCount(arg_27_0.normalList, iter_27_1.id)

			iter_27_1:updateBuyCount(var_27_1)

			local var_27_2 = iter_27_1:getConfig("group") or 0
			local var_27_3 = false

			if var_27_2 > 0 then
				local var_27_4 = iter_27_1:getConfig("group_limit")
				local var_27_5 = ChargeConst.getGroupLimit(arg_27_0.normalGroupList, var_27_2)

				iter_27_1:updateGroupCount(var_27_5)

				var_27_3 = var_27_4 > 0 and var_27_4 <= var_27_5
			end

			local var_27_6, var_27_7 = pg.TimeMgr.GetInstance():inTime(iter_27_1:getConfig("time"))

			if var_27_7 then
				arg_27_0:addUpdateTimer(var_27_7)
			end

			if var_27_6 and iter_27_1:canPurchase() and not var_27_3 then
				table.insert(arg_27_0.giftGoodsVOListForShow, iter_27_1)
			end
		end
	end

	local function var_27_8(arg_28_0)
		local var_28_0 = arg_28_0:getConfig("time")
		local var_28_1 = 0

		if type(var_28_0) == "string" then
			var_28_1 = var_28_1 + 999999999999
		elseif type(var_28_0) == "table" then
			var_28_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_28_0[2]) - pg.TimeMgr.GetInstance():GetServerTime()
			var_28_1 = var_28_1 > 0 and var_28_1 or 999999999999
		else
			var_28_1 = var_28_1 + 999999999999
		end

		return var_28_1
	end

	local var_27_9 = {}
	local var_27_10 = getProxy(ActivityProxy)

	for iter_27_2, iter_27_3 in ipairs(var_27_10:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_GIFT_UP)) do
		if var_27_10:IsActivityNotEnd(iter_27_3.id) then
			underscore(iter_27_3:getConfig("config_client").gifts):chain():flatten():map(function(arg_29_0)
				var_27_9[arg_29_0] = true
			end)
		end
	end

	table.sort(arg_27_0.giftGoodsVOListForShow, CompareFuncs({
		function(arg_30_0)
			return var_27_9[arg_30_0.id] and 0 or 1
		end,
		function(arg_31_0)
			return (arg_31_0:getConfig("type_order") - 1) % 1000
		end,
		function(arg_32_0)
			return var_27_8(arg_32_0)
		end,
		function(arg_33_0)
			return -arg_33_0:getConfig("tag")
		end,
		function(arg_34_0)
			return arg_34_0:getConfig("order") or 999
		end,
		function(arg_35_0)
			return arg_35_0.id
		end
	}))
end

function var_0_0.getFilterList(arg_36_0)
	if arg_36_0.selectedPackageType == nil or arg_36_0.selectedPackageType == 0 then
		return arg_36_0.giftGoodsVOListForShow
	end

	return arg_36_0:getFilterListByType(arg_36_0.selectedPackageType)
end

function var_0_0.getFilterListByType(arg_37_0, arg_37_1)
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.giftGoodsVOListForShow) do
		if iter_37_1:getConfig("package_sort_id") == arg_37_1 then
			table.insert(var_37_0, iter_37_1)
		end
	end

	return var_37_0
end

function var_0_0.updateGoodsData(arg_38_0)
	arg_38_0.firstChargeIds = arg_38_0.contextData.firstChargeIds
	arg_38_0.chargedList = arg_38_0.contextData.chargedList
	arg_38_0.normalList = arg_38_0.contextData.normalList
	arg_38_0.normalGroupList = arg_38_0.contextData.normalGroupList
end

function var_0_0.setGoodData(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	arg_39_0.firstChargeIds = arg_39_1
	arg_39_0.chargedList = arg_39_2
	arg_39_0.normalList = arg_39_3
	arg_39_0.normalGroupList = arg_39_4
end

function var_0_0.updateData(arg_40_0)
	arg_40_0.player = getProxy(PlayerProxy):getData()

	arg_40_0:updateGiftGoodsVOList()
	arg_40_0:sortGiftGoodsVOList()
end

function var_0_0.addUpdateTimer(arg_41_0, arg_41_1)
	local var_41_0 = pg.TimeMgr.GetInstance()
	local var_41_1 = var_41_0:Table2ServerTime(arg_41_1)

	if arg_41_0.updateTime and var_41_1 > var_41_0:Table2ServerTime(arg_41_0.updateTime) then
		return
	end

	arg_41_0.updateTime = arg_41_1

	arg_41_0:removeUpdateTimer()

	arg_41_0.updateTimer = Timer.New(function()
		if var_41_0:GetServerTime() > var_41_1 then
			arg_41_0:removeUpdateTimer()
			arg_41_0:reUpdateAll()
		end
	end, 1, -1)

	arg_41_0.updateTimer:Start()
	arg_41_0.updateTimer.func()
end

function var_0_0.removeUpdateTimer(arg_43_0)
	if arg_43_0.updateTimer then
		arg_43_0.updateTimer:Stop()

		arg_43_0.updateTimer = nil
	end
end

function var_0_0.IsSupplyShop(arg_44_0)
	return false
end

function var_0_0.reUpdateAll(arg_45_0)
	arg_45_0:updateData()
	arg_45_0:updateToggleList()
	arg_45_0:updateScrollRect()

	if not table.contains(arg_45_0.packageSortList, arg_45_0.selectedPackageType) then
		triggerButton(arg_45_0._tf:Find("toggleGroup"):GetChild(0))
	end
end

function var_0_0.ShowPanel(arg_46_0, arg_46_1)
	setActive(arg_46_0._go, arg_46_1)
end

function var_0_0.filterLimitTypeGoods(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_1:getConfig("limit_type")

	return switch(var_47_0, {
		[3] = function()
			if arg_47_1:getConfig("limit_arg") ~= 0 or arg_47_1:isLevelLimit(arg_47_0.player.level, true) then
				return false
			end

			local var_48_0
			local var_48_1
			local var_48_2

			for iter_48_0, iter_48_1 in ipairs(arg_47_1:getSameLimitGroupTecGoods()) do
				if iter_48_1:getConfig("limit_arg") == 1 then
					var_48_1 = iter_48_1
				elseif iter_48_1:getConfig("limit_arg") == 2 then
					var_48_0 = iter_48_1
				elseif iter_48_1:getConfig("limit_arg") == 3 then
					var_48_2 = iter_48_1
				end
			end

			local var_48_3 = ChargeConst.getBuyCount(arg_47_0.chargedList, var_48_0.id)
			local var_48_4 = ChargeConst.getBuyCount(arg_47_0.chargedList, var_48_1.id)
			local var_48_5 = ChargeConst.getBuyCount(arg_47_0.chargedList, var_48_2.id)

			if var_48_4 > 0 then
				return false
			elseif var_48_3 > 0 and var_48_5 > 0 then
				return false
			else
				return true
			end
		end,
		[5] = function()
			if arg_47_1:getConfig("limit_arg") ~= 0 or arg_47_1:isLevelLimit(arg_47_0.player.level, true) then
				return false
			end

			for iter_49_0, iter_49_1 in ipairs(arg_47_1:getSameLimitGroupTecGoods()) do
				if iter_49_1:getConfig("limit_arg") ~= 0 and ChargeConst.getBuyCount(arg_47_0.chargedList, iter_49_1.id) > 0 then
					return false
				end
			end

			return true
		end
	}, function()
		return true
	end)
end

return var_0_0

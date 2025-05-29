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
	arg_4_0.updateTime = nil
	arg_4_0.updateTimer = nil
	arg_4_0.player = getProxy(PlayerProxy):getData()

	arg_4_0:updateData()
end

function var_0_0.initUI(arg_5_0)
	arg_5_0.lScrollRect = GetComponent(arg_5_0._tf, "LScrollRect")
	arg_5_0.chargeCardTable = {}

	arg_5_0:initScrollRect()
	arg_5_0:updateScrollRect()
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
						arg_7_0:emit(ChargeMediator.OPEN_TEC_SHIP_GIFT_SELL_LAYER, var_8_0.goods, arg_7_0.chargedList)
					end,
					[Goods.SHOW_TYPE_BATTLE_UI] = function()
						arg_7_0:emit(ChargeMediator.OPEN_BATTLE_UI_SELL_LAYER, var_8_0.goods, arg_7_0.chargedList)
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
				arg_7_0:emit(ChargeMediator.VIEW_SKIN_PROBABILITY, var_8_0.goods.id, arg_7_0:GetViewSkinWrap())
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

		local var_14_1 = arg_7_0.giftGoodsVOListForShow[arg_14_0 + 1]

		if var_14_1 then
			var_14_0:update(var_14_1, arg_7_0.player, arg_7_0.firstChargeIds)
		end
	end

	arg_7_0.lScrollRect.onInitItem = var_7_0
	arg_7_0.lScrollRect.onUpdateItem = var_7_1
end

function var_0_0.updateScrollRect(arg_15_0)
	arg_15_0.lScrollRect:SetTotalCount(#arg_15_0.giftGoodsVOListForShow, arg_15_0.lScrollRect.value)
end

function var_0_0.confirm(arg_16_0, arg_16_1)
	if not arg_16_1 then
		return
	end

	arg_16_1 = Clone(arg_16_1)

	if arg_16_1:isChargeType() then
		local var_16_0 = not table.contains(arg_16_0.firstChargeIds, arg_16_1.id) and arg_16_1:firstPayDouble()
		local var_16_1 = var_16_0 and 4 or arg_16_1:getConfig("tag")

		if arg_16_1:isMonthCard() or arg_16_1:isGiftBox() or arg_16_1:isItemBox() or arg_16_1:isPassItem() then
			local var_16_2 = arg_16_1:GetExtraServiceItem()
			local var_16_3 = arg_16_1:GetExtraDrop()
			local var_16_4 = arg_16_1:GetBonusItem()
			local var_16_5
			local var_16_6

			if arg_16_1:isPassItem() then
				var_16_5 = i18n("battlepass_pay_tip")
			elseif arg_16_1:isMonthCard() then
				var_16_5 = i18n("charge_title_getitem_month")
				var_16_6 = i18n("charge_title_getitem_soon")
			else
				var_16_5 = i18n("charge_title_getitem")
			end

			local var_16_7 = {
				isChargeType = true,
				infoTip = arg_16_1:GetInfoTip(),
				icon = "chargeicon/" .. arg_16_1:getConfig("picture"),
				name = arg_16_1:getConfig("name_display"),
				tipExtra = var_16_5,
				extraItems = var_16_2,
				price = arg_16_1:getConfig("money"),
				isLocalPrice = arg_16_1:IsLocalPrice(),
				tagType = var_16_1,
				isMonthCard = arg_16_1:isMonthCard(),
				tipBonus = var_16_6,
				bonusItem = var_16_4,
				extraDrop = var_16_3,
				descExtra = arg_16_1:getConfig("descrip_extra"),
				limitArgs = arg_16_1:getConfig("limit_args"),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_16_0:emit(ChargeMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_16_0:emit(ChargeMediator.CHARGE, arg_16_1.id)
					end
				end
			}

			arg_16_0:emit(ChargeMediator.OPEN_CHARGE_ITEM_PANEL, var_16_7)
		elseif arg_16_1:isGem() then
			local var_16_8 = arg_16_1:getConfig("money")
			local var_16_9 = arg_16_1:getConfig("gem")

			if var_16_0 then
				var_16_9 = var_16_9 + arg_16_1:getConfig("gem")
			else
				var_16_9 = var_16_9 + arg_16_1:getConfig("extra_gem")
			end

			local var_16_10 = {
				isChargeType = true,
				icon = "chargeicon/" .. arg_16_1:getConfig("picture"),
				name = arg_16_1:getConfig("name_display"),
				price = arg_16_1:getConfig("money"),
				isLocalPrice = arg_16_1:IsLocalPrice(),
				tagType = var_16_1,
				normalTip = i18n("charge_start_tip", var_16_8, var_16_9),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_16_0:emit(ChargeMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_16_0:emit(ChargeMediator.CHARGE, arg_16_1.id)
					end
				end
			}

			arg_16_0:emit(ChargeMediator.OPEN_CHARGE_ITEM_BOX, var_16_10)
		end
	else
		local var_16_11 = {}
		local var_16_12 = arg_16_1:getConfig("effect_args")
		local var_16_13 = Item.getConfigData(var_16_12[1])
		local var_16_14 = var_16_13.display_icon

		if type(var_16_14) == "table" then
			for iter_16_0, iter_16_1 in ipairs(var_16_14) do
				table.insert(var_16_11, Drop.New({
					type = iter_16_1[1],
					id = iter_16_1[2],
					count = iter_16_1[3]
				}))
			end
		end

		local var_16_15 = {
			isMonthCard = false,
			isChargeType = false,
			isLocalPrice = false,
			icon = var_16_13.icon,
			name = var_16_13.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = var_16_11,
			price = arg_16_1:getConfig("resource_num"),
			tagType = arg_16_1:getConfig("tag"),
			onYes = function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", arg_16_1:getConfig("resource_num"), var_16_13.name),
					onYes = function()
						arg_16_0:emit(ChargeMediator.BUY_ITEM, arg_16_1.id, 1)
					end
				})
			end
		}

		arg_16_0:emit(ChargeMediator.OPEN_CHARGE_ITEM_PANEL, var_16_15)
	end
end

function var_0_0.updateGiftGoodsVOList(arg_21_0)
	arg_21_0.giftGoodsVOList = {}

	local var_21_0 = RefluxShopView.getAllRefluxPackID()
	local var_21_1 = pg.pay_data_display

	for iter_21_0, iter_21_1 in pairs(var_21_1.all) do
		if not table.contains(var_21_0, iter_21_1) then
			local var_21_2 = var_21_1[iter_21_1]
			local var_21_3 = var_21_2.extra_service

			if not (var_21_3 == Goods.ITEM_BOX and var_21_2.akashi_pick == 1) and (var_21_3 == Goods.ITEM_BOX or var_21_3 == Goods.PASS_ITEM) then
				local var_21_4 = Goods.Create({
					shop_id = iter_21_1
				}, Goods.TYPE_CHARGE)

				if arg_21_0:filterLimitTypeGoods(var_21_4) then
					table.insert(arg_21_0.giftGoodsVOList, var_21_4)
				end
			end
		end
	end

	for iter_21_2, iter_21_3 in pairs(pg.shop_template.get_id_list_by_genre.gift_package) do
		if not (pg.shop_template[iter_21_3].akashi_pick == 1) and not table.contains(var_21_0, iter_21_3) then
			local var_21_5 = Goods.Create({
				shop_id = iter_21_3
			}, Goods.TYPE_GIFT_PACKAGE)

			table.insert(arg_21_0.giftGoodsVOList, var_21_5)
		end
	end
end

function var_0_0.sortGiftGoodsVOList(arg_22_0)
	arg_22_0.giftGoodsVOListForShow = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.giftGoodsVOList) do
		if iter_22_1:isChargeType() then
			local var_22_0 = ChargeConst.getBuyCount(arg_22_0.chargedList, iter_22_1.id)

			iter_22_1:updateBuyCount(var_22_0)

			if iter_22_1:canPurchase() and iter_22_1:inTime() then
				table.insert(arg_22_0.giftGoodsVOListForShow, iter_22_1)
			end
		elseif not iter_22_1:isLevelLimit(arg_22_0.player.level, true) then
			local var_22_1 = ChargeConst.getBuyCount(arg_22_0.normalList, iter_22_1.id)

			iter_22_1:updateBuyCount(var_22_1)

			local var_22_2 = iter_22_1:getConfig("group") or 0
			local var_22_3 = false

			if var_22_2 > 0 then
				local var_22_4 = iter_22_1:getConfig("group_limit")
				local var_22_5 = ChargeConst.getGroupLimit(arg_22_0.normalGroupList, var_22_2)

				iter_22_1:updateGroupCount(var_22_5)

				var_22_3 = var_22_4 > 0 and var_22_4 <= var_22_5
			end

			local var_22_6, var_22_7 = pg.TimeMgr.GetInstance():inTime(iter_22_1:getConfig("time"))

			if var_22_7 then
				arg_22_0:addUpdateTimer(var_22_7)
			end

			if var_22_6 and iter_22_1:canPurchase() and not var_22_3 then
				table.insert(arg_22_0.giftGoodsVOListForShow, iter_22_1)
			end
		end
	end

	local function var_22_8(arg_23_0)
		local var_23_0 = arg_23_0:getConfig("time")
		local var_23_1 = 0

		if type(var_23_0) == "string" then
			var_23_1 = var_23_1 + 999999999999
		elseif type(var_23_0) == "table" then
			var_23_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_23_0[2]) - pg.TimeMgr.GetInstance():GetServerTime()
			var_23_1 = var_23_1 > 0 and var_23_1 or 999999999999
		else
			var_23_1 = var_23_1 + 999999999999
		end

		return var_23_1
	end

	local var_22_9 = {}
	local var_22_10 = getProxy(ActivityProxy)

	for iter_22_2, iter_22_3 in ipairs(var_22_10:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_GIFT_UP)) do
		if var_22_10:IsActivityNotEnd(iter_22_3.id) then
			underscore(iter_22_3:getConfig("config_client").gifts):chain():flatten():map(function(arg_24_0)
				var_22_9[arg_24_0] = true
			end)
		end
	end

	table.sort(arg_22_0.giftGoodsVOListForShow, CompareFuncs({
		function(arg_25_0)
			return var_22_9[arg_25_0.id] and 0 or 1
		end,
		function(arg_26_0)
			return (arg_26_0:getConfig("type_order") - 1) % 1000
		end,
		function(arg_27_0)
			return var_22_8(arg_27_0)
		end,
		function(arg_28_0)
			return -arg_28_0:getConfig("tag")
		end,
		function(arg_29_0)
			return arg_29_0:getConfig("order") or 999
		end,
		function(arg_30_0)
			return arg_30_0.id
		end
	}))
end

function var_0_0.updateGoodsData(arg_31_0)
	arg_31_0.firstChargeIds = arg_31_0.contextData.firstChargeIds
	arg_31_0.chargedList = arg_31_0.contextData.chargedList
	arg_31_0.normalList = arg_31_0.contextData.normalList
	arg_31_0.normalGroupList = arg_31_0.contextData.normalGroupList
end

function var_0_0.setGoodData(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4)
	arg_32_0.firstChargeIds = arg_32_1
	arg_32_0.chargedList = arg_32_2
	arg_32_0.normalList = arg_32_3
	arg_32_0.normalGroupList = arg_32_4
end

function var_0_0.updateData(arg_33_0)
	arg_33_0.player = getProxy(PlayerProxy):getData()

	arg_33_0:updateGiftGoodsVOList()
	arg_33_0:sortGiftGoodsVOList()
end

function var_0_0.addUpdateTimer(arg_34_0, arg_34_1)
	local var_34_0 = pg.TimeMgr.GetInstance()
	local var_34_1 = var_34_0:Table2ServerTime(arg_34_1)

	if arg_34_0.updateTime and var_34_1 > var_34_0:Table2ServerTime(arg_34_0.updateTime) then
		return
	end

	arg_34_0.updateTime = arg_34_1

	arg_34_0:removeUpdateTimer()

	arg_34_0.updateTimer = Timer.New(function()
		if var_34_0:GetServerTime() > var_34_1 then
			arg_34_0:removeUpdateTimer()
			arg_34_0:reUpdateAll()
		end
	end, 1, -1)

	arg_34_0.updateTimer:Start()
	arg_34_0.updateTimer.func()
end

function var_0_0.removeUpdateTimer(arg_36_0)
	if arg_36_0.updateTimer then
		arg_36_0.updateTimer:Stop()

		arg_36_0.updateTimer = nil
	end
end

function var_0_0.reUpdateAll(arg_37_0)
	arg_37_0:updateData()
	arg_37_0:updateScrollRect()
end

function var_0_0.filterLimitTypeGoods(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_1:getConfig("limit_type")

	return switch(var_38_0, {
		[3] = function()
			if arg_38_1:getConfig("limit_arg") ~= 0 or arg_38_1:isLevelLimit(arg_38_0.player.level, true) then
				return false
			end

			local var_39_0
			local var_39_1
			local var_39_2

			for iter_39_0, iter_39_1 in ipairs(arg_38_1:getSameLimitGroupTecGoods()) do
				if iter_39_1:getConfig("limit_arg") == 1 then
					var_39_1 = iter_39_1
				elseif iter_39_1:getConfig("limit_arg") == 2 then
					var_39_0 = iter_39_1
				elseif iter_39_1:getConfig("limit_arg") == 3 then
					var_39_2 = iter_39_1
				end
			end

			local var_39_3 = ChargeConst.getBuyCount(arg_38_0.chargedList, var_39_0.id)
			local var_39_4 = ChargeConst.getBuyCount(arg_38_0.chargedList, var_39_1.id)
			local var_39_5 = ChargeConst.getBuyCount(arg_38_0.chargedList, var_39_2.id)

			if var_39_4 > 0 then
				return false
			elseif var_39_3 > 0 and var_39_5 > 0 then
				return false
			else
				return true
			end
		end,
		[5] = function()
			if arg_38_1:getConfig("limit_arg") ~= 0 or arg_38_1:isLevelLimit(arg_38_0.player.level, true) then
				return false
			end

			for iter_40_0, iter_40_1 in ipairs(arg_38_1:getSameLimitGroupTecGoods()) do
				if iter_40_1:getConfig("limit_arg") ~= 0 and ChargeConst.getBuyCount(arg_38_0.chargedList, iter_40_1.id) > 0 then
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

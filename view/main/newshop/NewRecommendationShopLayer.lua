local var_0_0 = class("NewRecommendationShopLayer", import("...base.BaseUI"))
local var_0_1 = pg.shop_banner_template

function var_0_0.getUIName(arg_1_0)
	return "NewRecommendationShopUI"
end

function var_0_0.getGroupName(arg_2_0)
	return "NewShopMainScene"
end

function var_0_0.getResource(arg_3_0, arg_3_1)
	local var_3_0 = {
		"ui/NewRecommendationShopUI"
	}
	local var_3_1 = pg.TimeMgr.GetInstance()
	local var_3_2 = getProxy(ShopsProxy):getChargedList()
	local var_3_3 = getProxy(ShopsProxy):GetNormalList()
	local var_3_4 = getProxy(ShopsProxy):GetNormalGroupList()
	local var_3_5 = getProxy(PlayerProxy):getRawData()
	local var_3_6 = {
		{},
		{},
		{}
	}

	for iter_3_0, iter_3_1 in ipairs(var_0_1.all) do
		local var_3_7 = var_0_1[iter_3_1]

		if var_3_1:inTime(var_3_7.time) and var_3_7.relation_param ~= "" then
			local var_3_8 = var_3_7.relation_param[1]
			local var_3_9 = var_3_7.relation_param[2]
			local var_3_10

			if var_3_8 == 1 then
				var_3_10 = Goods.Create({
					id = var_3_9
				}, Goods.TYPE_CHARGE)

				var_3_10:updateBuyCount(ChargeConst.getBuyCount(var_3_2, var_3_9))
			elseif var_3_8 == 2 then
				var_3_10 = Goods.Create({
					id = var_3_9
				}, Goods.TYPE_GIFT_PACKAGE)

				var_3_10:updateBuyCount(ChargeConst.getBuyCount(var_3_3, var_3_9))
				var_3_10:updateGroupCount(ChargeConst.getGroupLimit(var_3_4, var_3_10:getConfig("group") or 0))
			elseif var_3_8 == 3 then
				var_3_10 = Goods.Create({
					id = var_3_9
				}, Goods.TYPE_SKIN)

				var_3_10:updateBuyCount(ChargeConst.getBuyCount(var_3_3, var_3_9))
				var_3_10:updateGroupCount(ChargeConst.getGroupLimit(var_3_4, var_3_10:getConfig("group") or 0))
			end

			var_3_6[var_3_8][var_3_9] = var_3_10
		end
	end

	local var_3_11 = {}
	local var_3_12 = {}
	local var_3_13 = pg.gameset.shop_banner_capacity.key_value
	local var_3_14 = Clone(var_0_1.get_id_list_by_name)

	var_3_14.banner_big = underscore.filter(var_3_14.banner_big, function(arg_4_0)
		return ShopsProxy.SpecialBannerBlockCheck(var_0_1[arg_4_0], var_3_5)
	end)

	for iter_3_2, iter_3_3 in pairs(var_3_14) do
		table.sort(iter_3_3, CompareFuncs({
			function(arg_5_0)
				return -var_0_1[arg_5_0].order
			end,
			function(arg_6_0)
				return arg_6_0
			end
		}))

		for iter_3_4 = #iter_3_3, 1, -1 do
			local var_3_15 = var_0_1[iter_3_3[iter_3_4]]

			if not var_3_1:inTime(var_3_15.time) then
				table.remove(iter_3_3, iter_3_4)
			elseif var_3_15.relation_param ~= "" then
				local var_3_16 = var_3_15.relation_param[1]
				local var_3_17 = var_3_15.relation_param[2]
				local var_3_18 = var_3_6[var_3_16][var_3_17]

				if var_3_16 == 1 then
					if not var_3_18 or not var_3_18:inTime() or not var_3_18:canPurchase() then
						table.remove(iter_3_3, iter_3_4)
					end
				elseif (var_3_16 == 2 or var_3_16 == 3) and (not var_3_18 or not var_3_18:inTime() or not var_3_18:canPurchase() or var_3_18:IsGroupLimit()) then
					table.remove(iter_3_3, iter_3_4)
				end
			end
		end

		if #iter_3_3 > 1 then
			table.remove(iter_3_3, #iter_3_3)
		end

		if var_3_13 < #iter_3_3 then
			for iter_3_5 = #iter_3_3, var_3_13 + 1, -1 do
				table.remove(iter_3_3, iter_3_5)
			end
		end

		for iter_3_6, iter_3_7 in ipairs(iter_3_3) do
			local var_3_19 = var_0_1[iter_3_7]

			if noEmptyStr(var_3_19.pic) then
				table.insert(var_3_11, var_3_19.pic)
			end

			if var_3_19.relation_param ~= "" then
				local var_3_20 = var_3_19.relation_param[1]
				local var_3_21 = var_3_19.relation_param[2]
				local var_3_22 = var_3_6[var_3_20][var_3_21]

				if var_3_20 == 1 and var_3_22 then
					local var_3_23 = var_3_22:getConfig("picture")

					if noEmptyStr(var_3_23) then
						table.insert(var_3_12, ResPathSupport.CombinePath("chargeicon", var_3_23))
					end
				end
			end
		end
	end

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_3_0, arg_3_1), var_3_0, var_3_11, var_3_12))
end

function var_0_0.init(arg_7_0)
	arg_7_0.resources = arg_7_0._tf:Find("adapt/top/resources")
	arg_7_0.banners = {}
	arg_7_0.banners.banner_big = BannerScrollRectDorm3dShop.New(arg_7_0._tf:Find("panel/banner_big/banner/mask/content"), arg_7_0._tf:Find("panel/banner_big/banner/dots"))
	arg_7_0.banners.banner_middle = BannerScrollRectDorm3dShop.New(arg_7_0._tf:Find("panel/banner_middle/banner/mask/content"), arg_7_0._tf:Find("panel/banner_middle/banner/dots"))
	arg_7_0.banners.banner_small1 = BannerScrollRectDorm3dShop.New(arg_7_0._tf:Find("panel/banner_small1/banner/mask/content"), arg_7_0._tf:Find("panel/banner_small1/banner/dots"))
	arg_7_0.banners.banner_small2 = BannerScrollRectDorm3dShop.New(arg_7_0._tf:Find("panel/banner_small2/banner/mask/content"), arg_7_0._tf:Find("panel/banner_small2/banner/dots"))
	arg_7_0.banners.banner_small3 = BannerScrollRectDorm3dShop.New(arg_7_0._tf:Find("panel/banner_small3/banner/mask/content"), arg_7_0._tf:Find("panel/banner_small3/banner/dots"))

	setText(arg_7_0._tf:Find("panel/banner_big/banner/mask/content/item/time/remainTime"), i18n("shop_new_during_time"))
	setText(arg_7_0._tf:Find("panel/banner_small2/banner/mask/content/item/monthCard/day"), i18n("shop_new_daily"))
	setText(arg_7_0._tf:Find("panel/banner_middle/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_7_0._tf:Find("panel/banner_small1/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_7_0._tf:Find("panel/banner_small2/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_7_0._tf:Find("panel/banner_small2/banner/mask/content/item/monthCard/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_7_0._tf:Find("panel/banner_small3/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:InitData()
	arg_8_0:ShowResUI()
	arg_8_0:SetPanel()
	arg_8_0:OverlayPanel(arg_8_0._tf)
end

function var_0_0.InitData(arg_9_0)
	arg_9_0.shopsProxy = getProxy(ShopsProxy)

	local var_9_0 = arg_9_0.shopsProxy:getChargedList()
	local var_9_1 = arg_9_0.shopsProxy:GetNormalList()
	local var_9_2 = arg_9_0.shopsProxy:GetNormalGroupList()

	arg_9_0.commodities = {
		{},
		{},
		{}
	}

	for iter_9_0, iter_9_1 in ipairs(var_0_1.all) do
		local var_9_3 = var_0_1[iter_9_1]

		if pg.TimeMgr.GetInstance():inTime(var_9_3.time) and var_9_3.relation_param ~= "" then
			local var_9_4 = var_9_3.relation_param[1]
			local var_9_5 = var_9_3.relation_param[2]
			local var_9_6

			if var_9_4 == 1 then
				var_9_6 = Goods.Create({
					id = var_9_5
				}, Goods.TYPE_CHARGE)

				local var_9_7 = ChargeConst.getBuyCount(var_9_0, var_9_5)

				var_9_6:updateBuyCount(var_9_7)
			elseif var_9_4 == 2 then
				var_9_6 = Goods.Create({
					id = var_9_5
				}, Goods.TYPE_GIFT_PACKAGE)

				local var_9_8 = ChargeConst.getBuyCount(var_9_1, var_9_5)

				var_9_6:updateBuyCount(var_9_8)

				local var_9_9 = ChargeConst.getGroupLimit(var_9_2, var_9_6:getConfig("group") or 0)

				var_9_6:updateGroupCount(var_9_9)
			elseif var_9_4 == 3 then
				var_9_6 = Goods.Create({
					id = var_9_5
				}, Goods.TYPE_SKIN)

				local var_9_10 = ChargeConst.getBuyCount(var_9_1, var_9_5)

				var_9_6:updateBuyCount(var_9_10)

				local var_9_11 = ChargeConst.getGroupLimit(var_9_2, var_9_6:getConfig("group") or 0)

				var_9_6:updateGroupCount(var_9_11)
			end

			arg_9_0.commodities[var_9_4][var_9_5] = var_9_6
		end
	end

	local var_9_12 = pg.gameset.shop_banner_capacity.key_value

	arg_9_0.bnIds = Clone(var_0_1.get_id_list_by_name)

	local var_9_13 = getProxy(PlayerProxy):getRawData()

	arg_9_0.bnIds.banner_big = underscore.filter(arg_9_0.bnIds.banner_big, function(arg_10_0)
		return ShopsProxy.SpecialBannerBlockCheck(var_0_1[arg_10_0], var_9_13)
	end)

	for iter_9_2, iter_9_3 in pairs(arg_9_0.bnIds) do
		table.sort(iter_9_3, CompareFuncs({
			function(arg_11_0)
				return -var_0_1[arg_11_0].order
			end,
			function(arg_12_0)
				return arg_12_0
			end
		}))

		for iter_9_4 = #iter_9_3, 1, -1 do
			local var_9_14 = var_0_1[iter_9_3[iter_9_4]]

			if not pg.TimeMgr.GetInstance():inTime(var_9_14.time) then
				table.remove(iter_9_3, iter_9_4)
			elseif var_9_14.relation_param ~= "" then
				local var_9_15 = var_9_14.relation_param[1]
				local var_9_16 = var_9_14.relation_param[2]
				local var_9_17 = arg_9_0.commodities[var_9_15][var_9_16]

				if var_9_15 == 1 then
					if not var_9_17:inTime() or not var_9_17:canPurchase() then
						table.remove(iter_9_3, iter_9_4)
					end
				elseif (var_9_15 == 2 or var_9_15 == 3) and (not var_9_17:inTime() or not var_9_17:canPurchase() or var_9_17:IsGroupLimit()) then
					table.remove(iter_9_3, iter_9_4)
				end
			end
		end

		if #iter_9_3 > 1 then
			table.remove(iter_9_3, #iter_9_3)
		end

		if var_9_12 < #iter_9_3 then
			for iter_9_5 = #iter_9_3, var_9_12 + 1, -1 do
				table.remove(iter_9_3, iter_9_5)
			end
		end
	end
end

function var_0_0.ShowResUI(arg_13_0)
	local var_13_0 = getProxy(PlayerProxy):getRawData()

	arg_13_0.goldMax = arg_13_0.resources:Find("gold/max"):GetComponent(typeof(Text))
	arg_13_0.goldValue = arg_13_0.resources:Find("gold/Text"):GetComponent(typeof(Text))
	arg_13_0.oilMax = arg_13_0.resources:Find("oil/max"):GetComponent(typeof(Text))
	arg_13_0.oilValue = arg_13_0.resources:Find("oil/Text"):GetComponent(typeof(Text))
	arg_13_0.gemValue = arg_13_0.resources:Find("gem/Text"):GetComponent(typeof(Text))

	PlayerResUI.StaticFlush(var_13_0, arg_13_0.goldMax, arg_13_0.goldValue, arg_13_0.oilMax, arg_13_0.oilValue, arg_13_0.gemValue)
	onButton(arg_13_0, arg_13_0.resources:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.resources:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.SetPanel(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.banners) do
		for iter_17_2, iter_17_3 in ipairs(arg_17_0.bnIds[iter_17_0]) do
			local var_17_0 = var_0_1[iter_17_3]
			local var_17_1 = iter_17_1:AddChild()

			GetImageSpriteFromAtlasAsync(var_17_0.pic, "", var_17_1:Find("picture"))
			setActive(var_17_1:Find("detail"), var_17_0.relation_param ~= "")
			setActive(var_17_1:Find("time"), var_17_0.time_lable == 1)

			if iter_17_0 == "banner_small2" then
				setActive(var_17_1:Find("monthCard"), false)
				setActive(var_17_1:Find("monthCardhave"), false)
			end

			if var_17_0.relation_param ~= "" then
				local var_17_2 = var_17_0.relation_param[1]
				local var_17_3 = var_17_0.relation_param[2]
				local var_17_4 = arg_17_0.commodities[var_17_2][var_17_3]

				if iter_17_0 == "banner_small2" and var_17_2 == 1 and var_17_4:isMonthCard() then
					setActive(var_17_1:Find("detail"), false)
					setActive(var_17_1:Find("monthCard"), true)
					setText(var_17_1:Find("monthCard/name"), var_17_4:getConfig("name_display"))
					GetImageSpriteFromAtlasAsync("chargeicon/" .. var_17_4:getConfig("picture"), "", var_17_1:Find("monthCard/icon"))
					setText(var_17_1:Find("monthCard/get"), i18n("shop_new_get_now", var_17_4:GetGemCnt()))

					local var_17_5 = var_17_4:GetDropList()

					while #var_17_5 > 3 do
						table.remove(var_17_5, #var_17_5)
					end

					local var_17_6 = UIItemList.New(var_17_1:Find("monthCard/items"), var_17_1:Find("monthCard/items/item"))

					var_17_6:make(function(arg_18_0, arg_18_1, arg_18_2)
						if arg_18_0 == UIItemList.EventUpdate then
							local var_18_0 = var_17_5[arg_18_1 + 1]

							updateDrop(arg_18_2:Find("mask/item"), var_18_0)
						end
					end)
					var_17_6:align(#var_17_5)

					local var_17_7 = var_17_2 == 1 and var_17_4:getShowType() ~= ""
					local var_17_8 = var_17_4:isFree()

					setText(var_17_1:Find("monthCard/consume/icon_rmb"), GetMoneySymbol())
					setActive(var_17_1:Find("monthCard/consume/icon_rmb"), var_17_2 == 1 and not var_17_7)

					if PLATFORM_CODE == PLATFORM_CHT and var_17_4:IsLocalPrice() then
						setActive(var_17_1:Find("monthCard/consume/icon_rmb"), false)
					end

					setActive(var_17_1:Find("monthCard/consume/icon_gem"), var_17_2 ~= 1 and not var_17_8)
					setActive(var_17_1:Find("monthCard/consume/Text"), not var_17_8 and not var_17_7)

					if var_17_2 == 1 then
						setText(var_17_1:Find("monthCard/consume/Text"), var_17_4:getConfig("money"))
					elseif var_17_2 == 2 then
						setText(var_17_1:Find("monthCard/consume/Text"), var_17_4:GetPrice())
					end

					setActive(var_17_1:Find("monthCard/consume/FreeText"), var_17_8)
					setText(var_17_1:Find("monthCard/consume/FreeText"), i18n("shop_free_tag"))

					local var_17_9 = getProxy(PlayerProxy):getRawData():getCardById(VipCard.MONTH)
					local var_17_10 = var_17_9 and var_17_9:GetLeftDay() > (var_17_4:getConfig("limit_arg") or 0)

					setActive(var_17_1:Find("monthCardhave"), var_17_10)

					if var_17_10 then
						setText(var_17_1:Find("monthCardhave/Text"), i18n("shop_new_remaining_time", var_17_9:GetLeftDay()))
					end
				else
					if var_17_2 == 1 then
						setText(var_17_1:Find("detail/name"), var_17_4:getConfig("name_display"))
						GetImageSpriteFromAtlasAsync("chargeicon/" .. var_17_4:getConfig("picture"), "", var_17_1:Find("detail/icon"))
					elseif var_17_2 == 2 then
						setText(var_17_1:Find("detail/name"), var_17_4:GetName())
						GetImageSpriteFromAtlasAsync(var_17_4:getDropInfo():getIcon(), "", var_17_1:Find("detail/icon"))
					end

					local var_17_11 = var_17_4:GetDropList()

					while #var_17_11 > 3 do
						table.remove(var_17_11, #var_17_11)
					end

					local var_17_12 = UIItemList.New(var_17_1:Find("detail/items"), var_17_1:Find("detail/items/item"))

					var_17_12:make(function(arg_19_0, arg_19_1, arg_19_2)
						if arg_19_0 == UIItemList.EventUpdate then
							local var_19_0 = var_17_11[arg_19_1 + 1]

							updateDrop(arg_19_2:Find("mask/item"), var_19_0)
						end
					end)
					var_17_12:align(#var_17_11)

					local var_17_13 = var_17_2 == 1 and var_17_4:getShowType() ~= ""
					local var_17_14 = var_17_4:isFree()

					setText(var_17_1:Find("detail/consume/icon_rmb"), GetMoneySymbol())
					setActive(var_17_1:Find("detail/consume/icon_rmb"), var_17_2 == 1 and not var_17_13)

					if PLATFORM_CODE == PLATFORM_CHT and var_17_4:IsLocalPrice() then
						setActive(var_17_1:Find("detail/consume/icon_rmb"), false)
					end

					setActive(var_17_1:Find("detail/consume/icon_gem"), var_17_2 ~= 1 and not var_17_14)
					setActive(var_17_1:Find("detail/consume/Text"), not var_17_14 and not var_17_13)

					if var_17_2 == 1 then
						setText(var_17_1:Find("detail/consume/Text"), var_17_4:getConfig("money"))
					elseif var_17_2 == 2 then
						setText(var_17_1:Find("detail/consume/Text"), var_17_4:GetPrice())
					end

					setActive(var_17_1:Find("detail/consume/FreeText"), var_17_14)
					setText(var_17_1:Find("detail/consume/FreeText"), i18n("shop_free_tag"))
				end
			end

			if var_17_0.time_lable == 1 then
				local var_17_15 = var_17_0.time[2]
				local var_17_16 = pg.TimeMgr.GetInstance():Table2ServerTime({
					year = var_17_15[1][1],
					month = var_17_15[1][2],
					day = var_17_15[1][3],
					hour = var_17_15[2][1],
					min = var_17_15[2][2],
					sec = var_17_15[2][3]
				})

				arg_17_0:StartTimer(function()
					local var_20_0 = pg.TimeMgr.GetInstance():GetServerTime()
					local var_20_1 = var_17_16 - var_20_0
					local var_20_2 = math.floor(var_20_1 / 86400)
					local var_20_3 = math.floor(var_20_1 % 86400 / 3600)
					local var_20_4 = math.floor(var_20_1 % 86400 % 3600 / 60)

					if iter_17_0 == "banner_big" then
						setText(var_17_1:Find("time/text"), i18n("shop_countdown", var_20_2, var_20_3, var_20_4))
					elseif var_20_2 > 0 then
						setText(var_17_1:Find("time/text"), i18n("shop_new_during_day", var_20_2))
					elseif var_20_3 > 0 then
						setText(var_17_1:Find("time/text"), i18n("shop_new_during_hour", var_20_3))
					else
						setText(var_17_1:Find("time/text"), i18n("shop_new_during_minite", var_20_4))
					end
				end)
			end

			onButton(arg_17_0, var_17_1, function()
				arg_17_0:emit(NewRecommendationShopMediator.GO_SHOP, var_17_0.param[1], var_17_0.param[2])
			end, SFX_PANEL)
		end

		iter_17_1:SetUp()
		setActive(arg_17_0._tf:Find("panel/" .. iter_17_0 .. "/banner/dots"), #arg_17_0.bnIds[iter_17_0] > 1)
	end
end

function var_0_0.StartTimer(arg_22_0, arg_22_1)
	if not arg_22_0.timers then
		arg_22_0.timers = {}
	end

	arg_22_1()

	local var_22_0 = Timer.New(function()
		arg_22_1()
	end, 1, -1)

	var_22_0:Start()
	table.insert(arg_22_0.timers, var_22_0)
end

function var_0_0.RemoveAllTimer(arg_24_0)
	if arg_24_0.timers then
		for iter_24_0, iter_24_1 in ipairs(arg_24_0.timers) do
			iter_24_1:Stop()

			iter_24_1 = nil
		end

		arg_24_0.timers = nil
	end
end

function var_0_0.willExit(arg_25_0)
	arg_25_0:RemoveAllTimer()

	for iter_25_0, iter_25_1 in pairs(arg_25_0.banners) do
		iter_25_1:Dispose()
	end

	arg_25_0.banners = nil

	arg_25_0:UnOverlayPanel(arg_25_0._tf)
end

function var_0_0.onBackPressed(arg_26_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

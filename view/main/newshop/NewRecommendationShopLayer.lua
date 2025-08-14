local var_0_0 = class("NewRecommendationShopLayer", import("...base.BaseUI"))
local var_0_1 = pg.shop_banner_template

function var_0_0.getUIName(arg_1_0)
	return "NewRecommendationShopUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.resources = arg_2_0._tf:Find("top/resources")
	arg_2_0.banners = {}
	arg_2_0.banners.banner_big = BannerScrollRectDorm3dShop.New(arg_2_0._tf:Find("panel/banner_big/banner/mask/content"), arg_2_0._tf:Find("panel/banner_big/banner/dots"))
	arg_2_0.banners.banner_middle = BannerScrollRectDorm3dShop.New(arg_2_0._tf:Find("panel/banner_middle/banner/mask/content"), arg_2_0._tf:Find("panel/banner_middle/banner/dots"))
	arg_2_0.banners.banner_small1 = BannerScrollRectDorm3dShop.New(arg_2_0._tf:Find("panel/banner_small1/banner/mask/content"), arg_2_0._tf:Find("panel/banner_small1/banner/dots"))
	arg_2_0.banners.banner_small2 = BannerScrollRectDorm3dShop.New(arg_2_0._tf:Find("panel/banner_small2/banner/mask/content"), arg_2_0._tf:Find("panel/banner_small2/banner/dots"))
	arg_2_0.banners.banner_small3 = BannerScrollRectDorm3dShop.New(arg_2_0._tf:Find("panel/banner_small3/banner/mask/content"), arg_2_0._tf:Find("panel/banner_small3/banner/dots"))

	setText(arg_2_0._tf:Find("panel/banner_big/banner/mask/content/item/time/remainTime"), i18n("shop_new_during_time"))
	setText(arg_2_0._tf:Find("panel/banner_small2/banner/mask/content/item/monthCard/day"), i18n("shop_new_daily"))
	setText(arg_2_0._tf:Find("panel/banner_middle/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_2_0._tf:Find("panel/banner_small1/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_2_0._tf:Find("panel/banner_small2/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_2_0._tf:Find("panel/banner_small2/banner/mask/content/item/monthCard/buy/Text"), i18n("shop_new_purchase"))
	setText(arg_2_0._tf:Find("panel/banner_small3/banner/mask/content/item/detail/buy/Text"), i18n("shop_new_purchase"))
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:InitData()
	arg_3_0:ShowResUI()
	arg_3_0:SetPanel()
	pg.UIMgr.GetInstance():OverlayPanel(arg_3_0._tf, {
		groupName = "shop"
	})
end

function var_0_0.InitData(arg_4_0)
	arg_4_0.shopsProxy = getProxy(ShopsProxy)

	local var_4_0 = arg_4_0.shopsProxy:getChargedList()
	local var_4_1 = arg_4_0.shopsProxy:GetNormalList()
	local var_4_2 = arg_4_0.shopsProxy:GetNormalGroupList()

	arg_4_0.commodities = {
		{},
		{},
		{}
	}

	for iter_4_0, iter_4_1 in ipairs(var_0_1.all) do
		local var_4_3 = var_0_1[iter_4_1]

		if pg.TimeMgr.GetInstance():inTime(var_4_3.time) and var_4_3.relation_param ~= "" then
			local var_4_4 = var_4_3.relation_param[1]
			local var_4_5 = var_4_3.relation_param[2]
			local var_4_6

			if var_4_4 == 1 then
				var_4_6 = Goods.Create({
					id = var_4_5
				}, Goods.TYPE_CHARGE)

				local var_4_7 = ChargeConst.getBuyCount(var_4_0, var_4_5)

				var_4_6:updateBuyCount(var_4_7)
			elseif var_4_4 == 2 then
				var_4_6 = Goods.Create({
					id = var_4_5
				}, Goods.TYPE_GIFT_PACKAGE)

				local var_4_8 = ChargeConst.getBuyCount(var_4_1, var_4_5)

				var_4_6:updateBuyCount(var_4_8)

				local var_4_9 = ChargeConst.getGroupLimit(var_4_2, var_4_6:getConfig("group") or 0)

				var_4_6:updateGroupCount(var_4_9)
			elseif var_4_4 == 3 then
				var_4_6 = Goods.Create({
					id = var_4_5
				}, Goods.TYPE_SKIN)

				local var_4_10 = ChargeConst.getBuyCount(var_4_1, var_4_5)

				var_4_6:updateBuyCount(var_4_10)

				local var_4_11 = ChargeConst.getGroupLimit(var_4_2, var_4_6:getConfig("group") or 0)

				var_4_6:updateGroupCount(var_4_11)
			end

			arg_4_0.commodities[var_4_4][var_4_5] = var_4_6
		end
	end

	local var_4_12 = pg.gameset.shop_banner_capacity.key_value

	arg_4_0.bnIds = Clone(var_0_1.get_id_list_by_name)

	for iter_4_2, iter_4_3 in pairs(arg_4_0.bnIds) do
		table.sort(iter_4_3, CompareFuncs({
			function(arg_5_0)
				return -var_0_1[arg_5_0].order
			end,
			function(arg_6_0)
				return arg_6_0
			end
		}))

		for iter_4_4 = #iter_4_3, 1, -1 do
			local var_4_13 = var_0_1[iter_4_3[iter_4_4]]

			if not pg.TimeMgr.GetInstance():inTime(var_4_13.time) then
				table.remove(iter_4_3, iter_4_4)
			elseif var_4_13.relation_param ~= "" then
				local var_4_14 = var_4_13.relation_param[1]
				local var_4_15 = var_4_13.relation_param[2]
				local var_4_16 = arg_4_0.commodities[var_4_14][var_4_15]

				if var_4_14 == 1 then
					if not var_4_16:inTime() or not var_4_16:canPurchase() then
						table.remove(iter_4_3, iter_4_4)
					end
				elseif (var_4_14 == 2 or var_4_14 == 3) and (not var_4_16:inTime() or not var_4_16:canPurchase() or var_4_16:IsGroupLimit()) then
					table.remove(iter_4_3, iter_4_4)
				end
			end
		end

		if #iter_4_3 > 1 then
			table.remove(iter_4_3, #iter_4_3)
		end

		if var_4_12 < #iter_4_3 then
			for iter_4_5 = #iter_4_3, var_4_12 + 1, -1 do
				table.remove(iter_4_3, iter_4_5)
			end
		end
	end
end

function var_0_0.ShowResUI(arg_7_0)
	local var_7_0 = getProxy(PlayerProxy):getRawData()

	arg_7_0.goldMax = arg_7_0.resources:Find("gold/max"):GetComponent(typeof(Text))
	arg_7_0.goldValue = arg_7_0.resources:Find("gold/Text"):GetComponent(typeof(Text))
	arg_7_0.oilMax = arg_7_0.resources:Find("oil/max"):GetComponent(typeof(Text))
	arg_7_0.oilValue = arg_7_0.resources:Find("oil/Text"):GetComponent(typeof(Text))
	arg_7_0.gemValue = arg_7_0.resources:Find("gem/Text"):GetComponent(typeof(Text))

	PlayerResUI.StaticFlush(var_7_0, arg_7_0.goldMax, arg_7_0.goldValue, arg_7_0.oilMax, arg_7_0.oilValue, arg_7_0.gemValue)
	onButton(arg_7_0, arg_7_0.resources:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.resources:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.SetPanel(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.banners) do
		for iter_11_2, iter_11_3 in ipairs(arg_11_0.bnIds[iter_11_0]) do
			local var_11_0 = var_0_1[iter_11_3]
			local var_11_1 = iter_11_1:AddChild()

			GetImageSpriteFromAtlasAsync(var_11_0.pic, "", var_11_1:Find("picture"))
			setActive(var_11_1:Find("detail"), var_11_0.relation_param ~= "")
			setActive(var_11_1:Find("time"), var_11_0.time_lable == 1)

			if iter_11_0 == "banner_small2" then
				setActive(var_11_1:Find("monthCard"), false)
				setActive(var_11_1:Find("monthCardhave"), false)
			end

			if var_11_0.relation_param ~= "" then
				local var_11_2 = var_11_0.relation_param[1]
				local var_11_3 = var_11_0.relation_param[2]
				local var_11_4 = arg_11_0.commodities[var_11_2][var_11_3]

				if iter_11_0 == "banner_small2" and var_11_2 == 1 and var_11_4:isMonthCard() then
					setActive(var_11_1:Find("detail"), false)
					setActive(var_11_1:Find("monthCard"), true)
					setText(var_11_1:Find("monthCard/name"), var_11_4:getConfig("name_display"))
					GetImageSpriteFromAtlasAsync("chargeicon/" .. var_11_4:getConfig("picture"), "", var_11_1:Find("monthCard/icon"))
					setText(var_11_1:Find("monthCard/get"), i18n("shop_new_get_now", var_11_4:GetGemCnt()))

					local var_11_5 = var_11_4:GetDropList()

					while #var_11_5 > 3 do
						table.remove(var_11_5, #var_11_5)
					end

					local var_11_6 = UIItemList.New(var_11_1:Find("monthCard/items"), var_11_1:Find("monthCard/items/item"))

					var_11_6:make(function(arg_12_0, arg_12_1, arg_12_2)
						if arg_12_0 == UIItemList.EventUpdate then
							local var_12_0 = var_11_5[arg_12_1 + 1]

							updateDrop(arg_12_2:Find("mask/item"), var_12_0)
						end
					end)
					var_11_6:align(#var_11_5)

					local var_11_7 = var_11_2 == 1 and var_11_4:getShowType() ~= ""
					local var_11_8 = var_11_4:isFree()

					setText(var_11_1:Find("monthCard/consume/icon_rmb"), GetMoneySymbol())
					setActive(var_11_1:Find("monthCard/consume/icon_rmb"), var_11_2 == 1 and not var_11_7)

					if PLATFORM_CODE == PLATFORM_CHT and var_11_4:IsLocalPrice() then
						setActive(var_11_1:Find("monthCard/consume/icon_rmb"), false)
					end

					setActive(var_11_1:Find("monthCard/consume/icon_gem"), var_11_2 ~= 1 and not var_11_8)
					setActive(var_11_1:Find("monthCard/consume/Text"), not var_11_8 and not var_11_7)

					if var_11_2 == 1 then
						setText(var_11_1:Find("monthCard/consume/Text"), var_11_4:getConfig("money"))
					elseif var_11_2 == 2 then
						setText(var_11_1:Find("monthCard/consume/Text"), var_11_4:GetPrice())
					end

					setActive(var_11_1:Find("monthCard/consume/FreeText"), var_11_8)
					setText(var_11_1:Find("monthCard/consume/FreeText"), i18n("shop_free_tag"))

					local var_11_9 = getProxy(PlayerProxy):getRawData():getCardById(VipCard.MONTH)
					local var_11_10 = var_11_9 and var_11_9:GetLeftDay() > (var_11_4:getConfig("limit_arg") or 0)

					setActive(var_11_1:Find("monthCardhave"), var_11_10)

					if var_11_10 then
						setText(var_11_1:Find("monthCardhave/Text"), i18n("shop_new_remaining_time", var_11_9:GetLeftDay()))
					end
				else
					if var_11_2 == 1 then
						setText(var_11_1:Find("detail/name"), var_11_4:getConfig("name_display"))
						GetImageSpriteFromAtlasAsync("chargeicon/" .. var_11_4:getConfig("picture"), "", var_11_1:Find("detail/icon"))
					elseif var_11_2 == 2 then
						setText(var_11_1:Find("detail/name"), var_11_4:GetName())
						GetImageSpriteFromAtlasAsync(var_11_4:getDropInfo():getIcon(), "", var_11_1:Find("detail/icon"))
					end

					local var_11_11 = var_11_4:GetDropList()

					while #var_11_11 > 3 do
						table.remove(var_11_11, #var_11_11)
					end

					local var_11_12 = UIItemList.New(var_11_1:Find("detail/items"), var_11_1:Find("detail/items/item"))

					var_11_12:make(function(arg_13_0, arg_13_1, arg_13_2)
						if arg_13_0 == UIItemList.EventUpdate then
							local var_13_0 = var_11_11[arg_13_1 + 1]

							updateDrop(arg_13_2:Find("mask/item"), var_13_0)
						end
					end)
					var_11_12:align(#var_11_11)

					local var_11_13 = var_11_2 == 1 and var_11_4:getShowType() ~= ""
					local var_11_14 = var_11_4:isFree()

					setText(var_11_1:Find("detail/consume/icon_rmb"), GetMoneySymbol())
					setActive(var_11_1:Find("detail/consume/icon_rmb"), var_11_2 == 1 and not var_11_13)

					if PLATFORM_CODE == PLATFORM_CHT and var_11_4:IsLocalPrice() then
						setActive(var_11_1:Find("detail/consume/icon_rmb"), false)
					end

					setActive(var_11_1:Find("detail/consume/icon_gem"), var_11_2 ~= 1 and not var_11_14)
					setActive(var_11_1:Find("detail/consume/Text"), not var_11_14 and not var_11_13)

					if var_11_2 == 1 then
						setText(var_11_1:Find("detail/consume/Text"), var_11_4:getConfig("money"))
					elseif var_11_2 == 2 then
						setText(var_11_1:Find("detail/consume/Text"), var_11_4:GetPrice())
					end

					setActive(var_11_1:Find("detail/consume/FreeText"), var_11_14)
					setText(var_11_1:Find("detail/consume/FreeText"), i18n("shop_free_tag"))
				end
			end

			if var_11_0.time_lable == 1 then
				local var_11_15 = var_11_0.time[2]
				local var_11_16 = pg.TimeMgr.GetInstance():Table2ServerTime({
					year = var_11_15[1][1],
					month = var_11_15[1][2],
					day = var_11_15[1][3],
					hour = var_11_15[2][1],
					min = var_11_15[2][2],
					sec = var_11_15[2][3]
				})

				arg_11_0:StartTimer(function()
					local var_14_0 = pg.TimeMgr.GetInstance():GetServerTime()
					local var_14_1 = var_11_16 - var_14_0
					local var_14_2 = math.floor(var_14_1 / 86400)
					local var_14_3 = math.floor(var_14_1 % 86400 / 3600)
					local var_14_4 = math.floor(var_14_1 % 86400 % 3600 / 60)

					if iter_11_0 == "banner_big" then
						setText(var_11_1:Find("time/text"), i18n("shop_countdown", var_14_2, var_14_3, var_14_4))
					elseif var_14_2 > 0 then
						setText(var_11_1:Find("time/text"), i18n("shop_new_during_day", var_14_2))
					elseif var_14_3 > 0 then
						setText(var_11_1:Find("time/text"), i18n("shop_new_during_hour", var_14_3))
					else
						setText(var_11_1:Find("time/text"), i18n("shop_new_during_minite", var_14_4))
					end
				end)
			end

			onButton(arg_11_0, var_11_1, function()
				arg_11_0:emit(NewRecommendationShopMediator.GO_SHOP, var_11_0.param[1], var_11_0.param[2])
			end, SFX_PANEL)
		end

		iter_11_1:SetUp()
		setActive(arg_11_0._tf:Find("panel/" .. iter_11_0 .. "/banner/dots"), #arg_11_0.bnIds[iter_11_0] > 1)
	end
end

function var_0_0.StartTimer(arg_16_0, arg_16_1)
	if not arg_16_0.timers then
		arg_16_0.timers = {}
	end

	local var_16_0 = Timer.New(function()
		arg_16_1()
	end, 1, -1)

	var_16_0:Start()
	table.insert(arg_16_0.timers, var_16_0)
end

function var_0_0.RemoveAllTimer(arg_18_0)
	if arg_18_0.timers then
		for iter_18_0, iter_18_1 in ipairs(arg_18_0.timers) do
			iter_18_1:Stop()

			iter_18_1 = nil
		end

		arg_18_0.timers = nil
	end
end

function var_0_0.willExit(arg_19_0)
	arg_19_0:RemoveAllTimer()

	for iter_19_0, iter_19_1 in pairs(arg_19_0.banners) do
		iter_19_1:Dispose()
	end

	arg_19_0.banners = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_19_0._tf)
end

function var_0_0.onBackPressed(arg_20_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

local var_0_0 = class("Dorm3dShopUI", import("view.base.BaseUI"))
local var_0_1 = pg.dorm3d_set
local var_0_2 = pg.dorm3d_shop_template
local var_0_3 = setmetatable({}, {
	__index = function(arg_1_0, arg_1_1)
		arg_1_0[arg_1_1] = ShopConst.GetShopConfig(arg_1_1)

		return arg_1_0[arg_1_1]
	end
})
local var_0_4 = pg.dorm3d_rooms
local var_0_5 = pg.dorm3d_gift
local var_0_6 = pg.dorm3d_furniture_template

function var_0_0.getUIName(arg_2_0)
	return "Dorm3dShopUI"
end

function var_0_0.init(arg_3_0)
	arg_3_0.closeBtn = arg_3_0.rtAdapt:Find("closeBtn")
	arg_3_0.res = arg_3_0.rtAdapt:Find("resourceBg/res")
	arg_3_0.recommendationTg = arg_3_0.rtAdapt:Find("left/recommendation")
	arg_3_0.charaList = UIItemList.New(arg_3_0.rtAdapt:Find("left/charaScroll/mask/list"), arg_3_0.rtAdapt:Find("left/charaScroll/mask/list/tpl"))
	arg_3_0.recommendationPage = arg_3_0.rtAdapt:Find("pages/recommendationPage")
	arg_3_0.charaPage = arg_3_0.rtAdapt:Find("pages/charaPage")
	arg_3_0.mask = arg_3_0._tf:Find("mask")

	setText(arg_3_0.rtAdapt:Find("title/Text"), i18n("dorm3d_shop_title"))
	setText(arg_3_0.recommendationPage:Find("bannerCard/mask/content/item/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_3_0.recommendationPage:Find("giftCard/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_3_0.recommendationPage:Find("card1/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_3_0.recommendationPage:Find("card2/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_3_0.recommendationPage:Find("card3/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_3_0.charaPage:Find("scroll/Viewport/Content/card/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_3_0.charaPage:Find("switch/all/Text"), i18n("dorm3d_shop_all"))
	setText(arg_3_0.charaPage:Find("switch/gift/Text"), i18n("dorm3d_shop_gift1"))
	setText(arg_3_0.charaPage:Find("switch/furniture/Text"), i18n("dorm3d_shop_furniture"))
	setText(arg_3_0.charaPage:Find("switch/others/Text"), i18n("dorm3d_shop_others"))
	setText(arg_3_0.charaPage:Find("switch/all/selected/Text"), i18n("dorm3d_shop_all"))
	setText(arg_3_0.charaPage:Find("switch/gift/selected/Text"), i18n("dorm3d_shop_gift1"))
	setText(arg_3_0.charaPage:Find("switch/furniture/selected/Text"), i18n("dorm3d_shop_furniture"))
	setText(arg_3_0.charaPage:Find("switch/others/selected/Text"), i18n("dorm3d_shop_others"))
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:InitData()
	onButton(arg_4_0, arg_4_0.closeBtn, function()
		arg_4_0:closeView()
	end, SFX_PANEL)
	arg_4_0:ShowResUI()
	arg_4_0:SetPageBtns()
	triggerToggle(arg_4_0.recommendationTg, true)
end

function var_0_0.InitData(arg_6_0)
	arg_6_0.bannerCount = var_0_1.drom3d_shop_product_panel_num.key_value_int
	arg_6_0.allCommodityCfgs = {}

	for iter_6_0, iter_6_1 in ipairs(var_0_2.all) do
		table.insert(arg_6_0.allCommodityCfgs, var_0_2[iter_6_1])
	end

	table.sort(arg_6_0.allCommodityCfgs, function(arg_7_0, arg_7_1)
		if tonumber(arg_7_0.order) ~= tonumber(arg_7_1.order) then
			return tonumber(arg_7_0.order) < tonumber(arg_7_1.order)
		end

		return arg_7_0.id > arg_7_1.id
	end)

	arg_6_0.roomCfgs = {}

	_.each(var_0_4.all, function(arg_8_0)
		if var_0_4[arg_8_0].type == 2 then
			table.insert(arg_6_0.roomCfgs, var_0_4[arg_8_0])
		end
	end)
	table.sort(arg_6_0.roomCfgs, function(arg_9_0, arg_9_1)
		return arg_9_0.id < arg_9_1.id
	end)

	arg_6_0.selectedId = 0
end

function var_0_0.SetPageBtns(arg_10_0)
	SetParent(arg_10_0.recommendationTg, arg_10_0.rtAdapt:Find("left"), false)
	arg_10_0.charaList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = arg_10_0.roomCfgs[arg_11_1 + 1]
			local var_11_1 = string.format("dorm3dselect/room_icon_%s", string.lower(var_11_0.assets_prefix))

			GetImageSpriteFromAtlasAsync(var_11_1, "", arg_11_2:Find("mask/icon"), false)

			local var_11_2 = arg_10_0:GetCommoditiesCfgByChara(var_11_0.character[1])

			setActive(arg_11_2:Find("tip"), var_0_0.ShouldShowSumTip(var_11_2))
			onToggle(arg_10_0, arg_11_2, function(arg_12_0)
				if arg_12_0 then
					arg_10_0.selectedId = var_11_0.id

					arg_10_0:SetPageBtns()
					arg_10_0:RefreshPage()
				end
			end)
		end
	end)
	arg_10_0.charaList:align(#arg_10_0.roomCfgs)

	arg_10_0.showingCommoditiesIndex = {}

	local var_10_0 = {}

	table.insertto(var_10_0, arg_10_0:GetCommoditiesCfgByPanel(1, arg_10_0.bannerCount))
	table.insertto(var_10_0, arg_10_0:GetCommoditiesCfgByPanel(2, 1))
	table.insertto(var_10_0, arg_10_0:GetCommoditiesCfgByPanel(3, 1))
	table.insertto(var_10_0, arg_10_0:GetCommoditiesCfgByPanel(4, 1))
	table.insertto(var_10_0, arg_10_0:GetCommoditiesCfgByPanel(5, 1))
	setActive(arg_10_0.recommendationTg:Find("icon/tip"), var_0_0.ShouldShowSumTip(var_10_0))
	onToggle(arg_10_0, arg_10_0.recommendationTg, function(arg_13_0)
		if arg_13_0 then
			arg_10_0.selectedId = 0

			arg_10_0:SetPageBtns()
			arg_10_0:RefreshPage()
		end
	end)
	SetParent(arg_10_0.recommendationTg, arg_10_0.rtAdapt:Find("left/charaScroll/mask/list"), false)
	arg_10_0.recommendationTg:SetSiblingIndex(0)
end

function var_0_0.GetCommoditiesCfgByPanel(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = {}
	local var_14_1 = 0

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.allCommodityCfgs) do
		if not table.contains(arg_14_0.showingCommoditiesIndex, iter_14_0) and table.contains(iter_14_1.panel, arg_14_1) then
			if not (arg_14_0:IsCommodityOutOfDate(iter_14_1) or arg_14_0:IsCommoditySoldOut(iter_14_1)) then
				var_14_1 = var_14_1 + 1

				table.insert(var_14_0, iter_14_1)
				table.insert(arg_14_0.showingCommoditiesIndex, iter_14_0)
			end

			if var_14_1 == arg_14_2 then
				break
			end
		end
	end

	if var_14_1 < arg_14_2 then
		for iter_14_2, iter_14_3 in ipairs(arg_14_0.allCommodityCfgs) do
			if not table.contains(arg_14_0.showingCommoditiesIndex, iter_14_2) and table.contains(iter_14_3.panel, arg_14_1) then
				if not arg_14_0:IsCommodityOutOfDate(iter_14_3) then
					var_14_1 = var_14_1 + 1

					table.insert(var_14_0, iter_14_3)
					table.insert(arg_14_0.showingCommoditiesIndex, iter_14_2)
				end

				if var_14_1 == arg_14_2 then
					break
				end
			end
		end
	end

	return var_14_0
end

function var_0_0.GetCommoditiesCfgByChara(arg_15_0, arg_15_1)
	local var_15_0 = {}
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.allCommodityCfgs) do
		local var_15_2 = {}

		if iter_15_1.realroom_id ~= 0 then
			table.insertto(var_15_2, var_0_4[iter_15_1.realroom_id].character)
			table.insertto(var_15_2, var_0_4[iter_15_1.realroom_id].character_pay)
		end

		if (iter_15_1.room_id == arg_15_1 or iter_15_1.room_id == 0) and (iter_15_1.realroom_id == 0 or iter_15_1.realroom_id ~= 0 and table.contains(var_15_2, arg_15_1)) then
			local var_15_3 = arg_15_0:IsCommodityOutOfDate(iter_15_1)
			local var_15_4 = arg_15_0:IsCommoditySoldOut(iter_15_1)

			if not var_15_3 then
				if not var_15_4 then
					table.insert(var_15_0, iter_15_1)
				else
					table.insert(var_15_1, iter_15_1)
				end
			end
		end
	end

	if #var_15_1 > 0 then
		table.insertto(var_15_0, var_15_1)
	end

	return var_15_0
end

function var_0_0.IsCommodityOutOfDate(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.shop_id

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		local var_16_1 = var_0_3[iter_16_1]

		if not pg.TimeMgr.GetInstance():inTime(var_16_1.time) then
			return true
		end
	end

	return false
end

function var_0_0.IsCommoditySoldOut(arg_17_0, arg_17_1)
	if arg_17_1.type == 1 then
		if getProxy(ApartmentProxy):GetFurnitureShopCount(arg_17_1.item_id) > 0 then
			return true
		end
	elseif arg_17_1.type == 2 then
		return not Dorm3dGift.New({
			configId = arg_17_1.item_id
		}):CheckBuyLimit()
	elseif arg_17_1.type == 3 then
		local var_17_0 = getProxy(ApartmentProxy):getRoom(arg_17_1.item_id)

		return var_17_0 and var_17_0.unlockCharacter[arg_17_1.room_id]
	end

	return false
end

function var_0_0.ShowResUI(arg_18_0)
	local var_18_0 = getProxy(PlayerProxy):getRawData()

	arg_18_0.goldMax = arg_18_0.res:Find("gold/max"):GetComponent(typeof(Text))
	arg_18_0.goldValue = arg_18_0.res:Find("gold/Text"):GetComponent(typeof(Text))
	arg_18_0.oilMax = arg_18_0.res:Find("oil/max"):GetComponent(typeof(Text))
	arg_18_0.oilValue = arg_18_0.res:Find("oil/Text"):GetComponent(typeof(Text))
	arg_18_0.gemValue = arg_18_0.res:Find("gem/Text"):GetComponent(typeof(Text))

	PlayerResUI.StaticFlush(var_18_0, arg_18_0.goldMax, arg_18_0.goldValue, arg_18_0.oilMax, arg_18_0.oilValue, arg_18_0.gemValue)
	onButton(arg_18_0, arg_18_0.res:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.res:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.res:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.RefreshPage(arg_22_0)
	arg_22_0.showingCommoditiesIndex = {}

	setActive(arg_22_0.recommendationPage, arg_22_0.selectedId == 0)
	setActive(arg_22_0.charaPage, arg_22_0.selectedId ~= 0)

	if arg_22_0.selectedId == 0 then
		arg_22_0:SetBannnerCard()
		arg_22_0:SetGiftCard()
		arg_22_0:SetNormalCard()
	else
		arg_22_0:SetCharaCard()
	end
end

function var_0_0.SetBannnerCard(arg_23_0)
	local var_23_0 = arg_23_0.recommendationPage:Find("bannerCard")
	local var_23_1 = arg_23_0:GetCommoditiesCfgByPanel(1, arg_23_0.bannerCount)

	if not arg_23_0.scrollSnap then
		arg_23_0.scrollSnap = BannerScrollRectDorm3dShop.New(var_23_0:Find("mask/content"), var_23_0:Find("dots"))
	end

	for iter_23_0, iter_23_1 in ipairs(var_23_1) do
		local var_23_2 = arg_23_0.scrollSnap:GetItemChild(iter_23_0) or arg_23_0.scrollSnap:AddChild()
		local var_23_3 = arg_23_0:IsCommoditySoldOut(iter_23_1)
		local var_23_4 = false
		local var_23_5 = false
		local var_23_6 = {}
		local var_23_7 = 0
		local var_23_8 = ""
		local var_23_9 = ""
		local var_23_10 = var_0_3[iter_23_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

		if iter_23_1.type == 1 then
			local var_23_11 = var_0_6[iter_23_1.item_id]

			var_23_5 = var_23_11.is_special == 1
			var_23_4 = not var_23_5 and var_23_11.is_exclusive == 1
			var_23_8 = Drop.New({
				count = 0,
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_23_11.id
			}):getIcon()
			var_23_9 = var_23_10 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(iter_23_1.item_id) .. "/1"
			var_23_6 = var_23_11.unlock_tips or {}
			var_23_7 = iter_23_1.shop_id[1]
		elseif iter_23_1.type == 2 then
			local var_23_12 = var_0_5[iter_23_1.item_id]

			var_23_4 = iter_23_1.room_id ~= 0

			local var_23_13 = Dorm3dGift.New({
				configId = iter_23_1.item_id
			})

			var_23_8 = Drop.New({
				type = DROP_TYPE_DORM3D_GIFT,
				id = iter_23_1.item_id,
				count = getProxy(ApartmentProxy):getGiftCount(iter_23_1.item_id)
			}):getIcon()

			local var_23_14 = 0

			for iter_23_2 = 1, #iter_23_1.shop_id do
				local var_23_15 = iter_23_1.shop_id[iter_23_2]
				local var_23_16 = var_0_3[var_23_15]
				local var_23_17 = var_23_16.limit_args[1]

				if not var_23_17 and var_23_16.group_type == 0 then
					var_23_14 = 0
				elseif var_23_17 and (var_23_17[1] == "dailycount" or var_23_17[1] == "count") then
					var_23_14 = var_23_17[3]
				elseif var_23_16.group_type == 2 then
					var_23_14 = var_23_16.group_limit
				end
			end

			var_23_9 = var_23_10 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(iter_23_1.item_id) .. "/" .. var_23_14

			setText(var_23_2:Find("favor/number"), "+" .. pg.dorm3d_favor_trigger[var_0_5[iter_23_1.item_id].favor_trigger_id].num)

			var_23_2:Find("favor"):GetComponent(typeof(CanvasGroup)).alpha = var_23_3 and 0.5 or 1
			var_23_6 = var_23_12.unlock_tips or {}
			var_23_7 = var_23_13:GetShopID()
		elseif iter_23_1.type == 3 then
			var_23_4 = true

			local var_23_18 = var_0_4[iter_23_1.item_id].invite_icon

			for iter_23_3, iter_23_4 in ipairs(var_23_18) do
				if iter_23_4[1] == iter_23_1.room_id then
					var_23_8 = iter_23_4[2]
				end
			end

			local var_23_19 = var_23_3 and 1 or 0

			var_23_9 = var_23_10 .. " " .. var_23_19 .. "/1"
			var_23_7 = iter_23_1.shop_id[1]
		end

		setActive(var_23_2:Find("bg/normal"), not var_23_4 and not var_23_5)
		setActive(var_23_2:Find("bg/zhuanshu"), var_23_4)
		setActive(var_23_2:Find("bg/tedian"), var_23_5)
		setActive(var_23_2:Find("normal"), not var_23_4 and not var_23_5)
		setActive(var_23_2:Find("zhuanshu"), var_23_4)
		setActive(var_23_2:Find("tedian"), var_23_5)
		setActive(var_23_2:Find("favor"), iter_23_1.type == 2)
		LoadImageSpriteAsync("dorm3dbanner/" .. iter_23_1.banners[1] .. "_shopCard1", var_23_2:Find("bannerMask/banner"), true)
		setText(var_23_2:Find("name"), iter_23_1.name)

		local var_23_20 = var_0_3[iter_23_1.shop_id[1]].time

		setActive(var_23_2:Find("timeLimit"), var_23_20 ~= "always")

		if var_23_20 ~= "always" then
			local var_23_21 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_23_20[2])

			setText(var_23_2:Find("timeLimit/Text"), arg_23_0:GetTimeRemain(var_23_21))
		end

		local var_23_22 = UIItemList.New(var_23_2:Find("bubbles/content"), var_23_2:Find("bubbles/content/tpl"))

		arg_23_0:SetBubbles(var_23_22, var_23_6)
		setActive(var_23_2:Find("consume"), not var_23_3)
		setActive(var_23_2:Find("soldOut"), var_23_3)

		local var_23_23 = CommonCommodity.New({
			id = var_23_7
		}, Goods.TYPE_SHOPSTREET)
		local var_23_24, var_23_25, var_23_26 = var_23_23:GetPrice()
		local var_23_27 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_23_23:GetResType(),
			count = var_23_24
		})

		setText(var_23_2:Find("consume/Text"), "<icon name=" .. var_23_23:GetResIcon() .. " w=0.81 h=0.81/>" .. var_23_24)
		GetImageSpriteFromAtlasAsync(var_23_8, "", var_23_2:Find("normal/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_23_8, "", var_23_2:Find("zhuanshu/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_23_8, "", var_23_2:Find("tedian/Dorm3dIconTpl/icon"))
		setText(var_23_2:Find("normal/countLimit"), var_23_9)
		setText(var_23_2:Find("zhuanshu/countLimit"), var_23_9)
		setText(var_23_2:Find("tedian/countLimit"), var_23_9)

		var_23_2:Find("normal/Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_23_3 and 0.5 or 1
		var_23_2:Find("zhuanshu/Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_23_3 and 0.5 or 1
		var_23_2:Find("tedian/Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_23_3 and 0.5 or 1

		if not var_23_3 then
			onButton(arg_23_0, var_23_2, function()
				arg_23_0:ClickCommodity(iter_23_1, var_23_2:Find("tip"))
			end, SFX_PANEL)
		else
			onButton(arg_23_0, var_23_2, function()
				var_0_0.UpdateCommodtyTip(iter_23_1)
				setActive(var_23_2:Find("tip"), false)
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
			end, SFX_PANEL)
		end

		local var_23_28 = var_0_0.ShouldShowCommodtyTip(iter_23_1)

		setActive(var_23_2:Find("new"), var_23_28)
		setActive(var_23_2:Find("tip"), var_23_28)
	end

	arg_23_0.scrollSnap:SetUp()
end

function var_0_0.SetGiftCard(arg_26_0)
	local var_26_0 = arg_26_0.recommendationPage:Find("giftCard")
	local var_26_1 = arg_26_0:GetCommoditiesCfgByPanel(2, 1)[1]
	local var_26_2 = 0
	local var_26_3 = arg_26_0:IsCommoditySoldOut(var_26_1)
	local var_26_4 = ""
	local var_26_5 = false
	local var_26_6 = false
	local var_26_7 = var_0_3[var_26_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

	if var_26_1.type == 1 then
		local var_26_8 = var_0_6[var_26_1.item_id]

		var_26_6 = var_26_8.is_special == 1
		var_26_5 = not var_26_6 and var_26_8.is_exclusive == 1

		local var_26_9 = Drop.New({
			count = 0,
			type = DROP_TYPE_DORM3D_FURNITURE,
			id = var_26_8.id
		})

		updateCustomDrop(var_26_0:Find("Dorm3dIconTpl"), var_26_9)

		var_26_2 = var_26_1.shop_id[1]
		var_26_4 = var_26_7 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_26_1.item_id) .. "/1"
	elseif var_26_1.type == 2 then
		local var_26_10 = var_0_5[var_26_1.item_id]

		var_26_5 = var_26_1.room_id ~= 0

		local var_26_11 = Dorm3dGift.New({
			configId = var_26_1.item_id
		})
		local var_26_12 = Drop.New({
			type = DROP_TYPE_DORM3D_GIFT,
			id = var_26_1.item_id,
			count = getProxy(ApartmentProxy):getGiftCount(var_26_1.item_id)
		})

		setText(var_26_0:Find("favor/number"), "+" .. pg.dorm3d_favor_trigger[var_0_5[var_26_1.item_id].favor_trigger_id].num)
		updateCustomDrop(var_26_0:Find("Dorm3dIconTpl"), var_26_12)

		var_26_2 = var_26_11:GetShopID()

		local var_26_13 = 0

		for iter_26_0 = 1, #var_26_1.shop_id do
			local var_26_14 = var_26_1.shop_id[iter_26_0]
			local var_26_15 = var_0_3[var_26_14]
			local var_26_16 = var_26_15.limit_args[1]

			if not var_26_16 and var_26_15.group_type == 0 then
				var_26_13 = 0
			elseif var_26_16 and (var_26_16[1] == "dailycount" or var_26_16[1] == "count") then
				var_26_13 = var_26_16[3]
			elseif var_26_15.group_type == 2 then
				var_26_13 = var_26_15.group_limit
			end
		end

		var_26_4 = var_26_7 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_26_1.item_id) .. "/" .. var_26_13
	elseif var_26_1.type == 3 then
		var_26_5 = true

		local var_26_17 = var_0_4[var_26_1.item_id].invite_icon
		local var_26_18 = ""

		for iter_26_1, iter_26_2 in ipairs(var_26_17) do
			if iter_26_2[1] == var_26_1.room_id then
				var_26_18 = iter_26_2[2]
			end
		end

		GetImageSpriteFromAtlasAsync(var_26_18, "", var_26_0:Find("Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_26_1.rarity), var_26_0:Find("Dorm3dIconTpl"))

		local var_26_19 = var_26_3 and 1 or 0

		var_26_4 = var_26_7 .. " " .. var_26_19 .. "/1"
		var_26_2 = var_26_1.shop_id[1]
	end

	var_26_0:Find("Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_26_3 and 0.5 or 1
	var_26_0:Find("favor"):GetComponent(typeof(CanvasGroup)).alpha = var_26_3 and 0.5 or 1

	setActive(var_26_0:Find("bg/normal"), not var_26_5 and not var_26_6)
	setActive(var_26_0:Find("bg/zhuanshu"), var_26_5)
	setActive(var_26_0:Find("bg/tedian"), var_26_6)
	setActive(var_26_0:Find("normal"), not var_26_5 and not var_26_6)
	setActive(var_26_0:Find("zhuanshu"), var_26_5)
	setActive(var_26_0:Find("tedian"), var_26_6)
	setText(var_26_0:Find("normal/countLimit"), var_26_4)
	setText(var_26_0:Find("zhuanshu/countLimit"), var_26_4)
	setText(var_26_0:Find("tedian/countLimit"), var_26_4)
	LoadImageSpriteAsync("dorm3dbanner/" .. var_26_1.banners[1] .. "_shopCard2", var_26_0:Find("mask/item"), true)
	setScrollText(var_26_0:Find("name/text"), var_26_1.name)
	setActive(var_26_0:Find("favor"), var_26_1.type == 2)
	setActive(var_26_0:Find("consume"), not var_26_3)
	setActive(var_26_0:Find("soldOut"), var_26_3)

	local var_26_20 = var_0_3[var_26_1.shop_id[1]].time

	setActive(var_26_0:Find("timeLimit"), var_26_20 ~= "always")

	if var_26_20 ~= "always" then
		local var_26_21 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_26_20[2])

		setText(var_26_0:Find("timeLimit/Text"), arg_26_0:GetTimeRemain(var_26_21))
	end

	local var_26_22 = CommonCommodity.New({
		id = var_26_2
	}, Goods.TYPE_SHOPSTREET)
	local var_26_23, var_26_24, var_26_25 = var_26_22:GetPrice()
	local var_26_26 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_26_22:GetResType(),
		count = var_26_23
	})

	setText(var_26_0:Find("consume/Text"), "<icon name=" .. var_26_22:GetResIcon() .. " w=0.81 h=0.81/>" .. var_26_23)

	if not var_26_3 then
		onButton(arg_26_0, var_26_0, function()
			arg_26_0:ClickCommodity(var_26_1, var_26_0:Find("tip"))
		end, SFX_PANEL)
	else
		onButton(arg_26_0, var_26_0, function()
			var_0_0.UpdateCommodtyTip(var_26_1)
			setActive(var_26_0:Find("tip"), false)
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
		end, SFX_PANEL)
	end

	local var_26_27 = var_0_0.ShouldShowCommodtyTip(var_26_1)

	setActive(var_26_0:Find("new"), var_26_27)
	setActive(var_26_0:Find("tip"), var_26_27)
end

function var_0_0.SetNormalCard(arg_29_0)
	for iter_29_0 = 1, 3 do
		local var_29_0 = arg_29_0.recommendationPage:Find("card" .. iter_29_0)
		local var_29_1 = arg_29_0:GetCommoditiesCfgByPanel(iter_29_0 + 2, 1)[1]
		local var_29_2 = false
		local var_29_3 = false
		local var_29_4 = arg_29_0:IsCommoditySoldOut(var_29_1)
		local var_29_5 = {}
		local var_29_6 = 0
		local var_29_7 = ""
		local var_29_8 = var_0_3[var_29_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

		if var_29_1.type == 1 then
			local var_29_9 = var_0_6[var_29_1.item_id]

			var_29_2 = var_29_9.is_special == 1
			var_29_3 = not var_29_2 and var_29_9.is_exclusive == 1
			var_29_7 = Drop.New({
				count = 0,
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_29_9.id
			}):getIcon()

			setText(var_29_0:Find("countLimit/Text"), var_29_8 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_29_1.item_id) .. "/1")

			var_29_5 = var_29_9.unlock_tips or {}
			var_29_6 = var_29_1.shop_id[1]
		elseif var_29_1.type == 2 then
			local var_29_10 = var_0_5[var_29_1.item_id]

			var_29_3 = var_29_1.room_id ~= 0

			local var_29_11 = Dorm3dGift.New({
				configId = var_29_1.item_id
			})

			var_29_7 = Drop.New({
				type = DROP_TYPE_DORM3D_GIFT,
				id = var_29_1.item_id,
				count = getProxy(ApartmentProxy):getGiftCount(var_29_1.item_id)
			}):getIcon()

			local var_29_12 = 0

			for iter_29_1 = 1, #var_29_1.shop_id do
				local var_29_13 = var_29_1.shop_id[iter_29_1]
				local var_29_14 = var_0_3[var_29_13]
				local var_29_15 = var_29_14.limit_args[1]

				if not var_29_15 and var_29_14.group_type == 0 then
					var_29_12 = 0
				elseif var_29_15 and (var_29_15[1] == "dailycount" or var_29_15[1] == "count") then
					var_29_12 = var_29_15[3]
				elseif var_29_14.group_type == 2 then
					var_29_12 = var_29_14.group_limit
				end
			end

			setText(var_29_0:Find("countLimit/Text"), var_29_8 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_29_1.item_id) .. "/" .. var_29_12)

			local var_29_16 = pg.dorm3d_favor_trigger[var_0_5[var_29_1.item_id].favor_trigger_id].num

			setText(var_29_0:Find("normal/favor/number"), "+" .. var_29_16)
			setText(var_29_0:Find("zhuanshu/favor/number"), "+" .. var_29_16)
			setText(var_29_0:Find("tedian/favor/number"), "+" .. var_29_16)

			var_29_5 = var_29_10.unlock_tips or {}
			var_29_6 = var_29_11:GetShopID()
		elseif var_29_1.type == 3 then
			var_29_3 = true

			local var_29_17 = var_0_4[var_29_1.item_id].invite_icon

			for iter_29_2, iter_29_3 in ipairs(var_29_17) do
				if iter_29_3[1] == var_29_1.room_id then
					var_29_7 = iter_29_3[2]
				end
			end

			local var_29_18 = var_29_4 and 1 or 0

			setText(var_29_0:Find("countLimit/Text"), var_29_8 .. " " .. var_29_18 .. "/1")

			var_29_6 = var_29_1.shop_id[1]
		end

		setActive(var_29_0:Find("bg/normal"), not var_29_3 and not var_29_2)
		setActive(var_29_0:Find("bg/zhuanshu"), var_29_3)
		setActive(var_29_0:Find("bg/tedian"), var_29_2)
		setActive(var_29_0:Find("normal"), not var_29_3 and not var_29_2)
		setActive(var_29_0:Find("zhuanshu"), var_29_3)
		setActive(var_29_0:Find("tedian"), var_29_2)
		setActive(var_29_0:Find("normal/favor"), var_29_1.type == 2)
		setActive(var_29_0:Find("zhuanshu/favor"), var_29_1.type == 2)
		setActive(var_29_0:Find("tedian/favor"), var_29_1.type == 2)
		setText(var_29_0:Find("name"), var_29_1.name)

		local var_29_19 = UIItemList.New(var_29_0:Find("bubbles/content"), var_29_0:Find("bubbles/content/tpl"))

		arg_29_0:SetBubbles(var_29_19, var_29_5)
		setActive(var_29_0:Find("consume"), not var_29_4)
		setActive(var_29_0:Find("soldOut"), var_29_4)

		local var_29_20 = CommonCommodity.New({
			id = var_29_6
		}, Goods.TYPE_SHOPSTREET)
		local var_29_21, var_29_22, var_29_23 = var_29_20:GetPrice()
		local var_29_24 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_29_20:GetResType(),
			count = var_29_21
		})

		setText(var_29_0:Find("consume/Text"), "<icon name=" .. var_29_20:GetResIcon() .. " w=0.81 h=0.81/>" .. var_29_21)
		GetImageSpriteFromAtlasAsync(var_29_7, "", var_29_0:Find("normal/mask/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_29_7, "", var_29_0:Find("zhuanshu/mask/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_29_7, "", var_29_0:Find("tedian/mask/Dorm3dIconTpl/icon"))

		if not var_29_4 then
			onButton(arg_29_0, var_29_0, function()
				arg_29_0:ClickCommodity(var_29_1, var_29_0:Find("tip"))
			end, SFX_PANEL)
		else
			onButton(arg_29_0, var_29_0, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
				var_0_0.UpdateCommodtyTip(var_29_1)
				setActive(var_29_0:Find("tip"), false)
			end, SFX_PANEL)
		end

		local var_29_25 = var_0_0.ShouldShowCommodtyTip(var_29_1)

		setActive(var_29_0:Find("new"), var_29_25)
		setActive(var_29_0:Find("tip"), var_29_25)
	end
end

function var_0_0.SetCharaCard(arg_32_0)
	local var_32_0 = arg_32_0:GetCommoditiesCfgByChara(var_0_4[arg_32_0.selectedId].character[1])
	local var_32_1 = UIItemList.New(arg_32_0.charaPage:Find("scroll/Viewport/Content"), arg_32_0.charaPage:Find("scroll/Viewport/Content/card"))
	local var_32_2 = {}

	var_32_1:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventInit then
			local var_33_0 = var_32_0[arg_33_1 + 1]

			table.insert(var_32_2, {
				var_33_0.type,
				arg_33_2
			})

			local var_33_1 = arg_32_0:IsCommoditySoldOut(var_33_0)
			local var_33_2 = false
			local var_33_3 = false
			local var_33_4 = ""
			local var_33_5 = {}
			local var_33_6 = 0
			local var_33_7 = var_0_3[var_33_0.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

			if var_33_0.type == 1 then
				local var_33_8 = var_0_6[var_33_0.item_id]

				var_33_3 = var_33_8.is_special == 1
				var_33_2 = not var_33_3 and var_33_8.is_exclusive == 1
				var_33_4 = Drop.New({
					count = 0,
					type = DROP_TYPE_DORM3D_FURNITURE,
					id = var_33_8.id
				}):getIcon()

				setText(arg_33_2:Find("descScroll/Viewport/Content/desc"), var_33_8.desc)
				setText(arg_33_2:Find("countLimit"), var_33_7 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_33_0.item_id) .. "/1")

				var_33_5 = var_33_8.unlock_tips or {}
				var_33_6 = var_33_0.shop_id[1]
			elseif var_33_0.type == 2 then
				local var_33_9 = var_0_5[var_33_0.item_id]

				var_33_2 = var_33_0.room_id ~= 0

				local var_33_10 = Dorm3dGift.New({
					configId = var_33_0.item_id
				})

				var_33_4 = Drop.New({
					type = DROP_TYPE_DORM3D_GIFT,
					id = var_33_0.item_id,
					count = getProxy(ApartmentProxy):getGiftCount(var_33_0.item_id)
				}):getIcon()

				setText(arg_33_2:Find("descScroll/Viewport/Content/desc"), var_33_9.display)

				local var_33_11 = 0

				for iter_33_0 = 1, #var_33_0.shop_id do
					local var_33_12 = var_33_0.shop_id[iter_33_0]
					local var_33_13 = var_0_3[var_33_12]
					local var_33_14 = var_33_13.limit_args[1]

					if not var_33_14 and var_33_13.group_type == 0 then
						var_33_11 = 0
					elseif var_33_14 and (var_33_14[1] == "dailycount" or var_33_14[1] == "count") then
						var_33_11 = var_33_14[3]
					elseif var_33_13.group_type == 2 then
						var_33_11 = var_33_13.group_limit
					end
				end

				setText(arg_33_2:Find("countLimit"), var_33_7 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_33_0.item_id) .. "/" .. var_33_11)
				setText(arg_33_2:Find("favor/number"), "+" .. pg.dorm3d_favor_trigger[var_0_5[var_33_0.item_id].favor_trigger_id].num)

				var_33_5 = var_33_9.unlock_tips or {}
				var_33_6 = var_33_10:GetShopID()
			elseif var_33_0.type == 3 then
				var_33_2 = true

				local var_33_15 = var_0_4[var_33_0.item_id]
				local var_33_16 = var_33_15.invite_icon

				for iter_33_1, iter_33_2 in ipairs(var_33_16) do
					if iter_33_2[1] == var_33_0.room_id then
						var_33_4 = iter_33_2[2]
					end
				end

				setText(arg_33_2:Find("descScroll/Viewport/Content/desc"), var_33_15.room_des)

				local var_33_17 = var_33_1 and 1 or 0

				setText(arg_33_2:Find("countLimit"), var_33_7 .. " " .. var_33_17 .. "/1")

				var_33_6 = var_33_0.shop_id[1]
			end

			setActive(arg_33_2:Find("bg/normal"), not var_33_1)
			setActive(arg_33_2:Find("bg/soldOut"), var_33_1)
			setActive(arg_33_2:Find("normal"), not var_33_2 and not var_33_3)
			setActive(arg_33_2:Find("zhuanshu"), var_33_2)
			setActive(arg_33_2:Find("tedian"), var_33_3)
			GetImageSpriteFromAtlasAsync(var_33_4, "", arg_33_2:Find("mask/Dorm3dIconTpl/icon"))
			setActive(arg_33_2:Find("favor"), var_33_0.type == 2)
			setScrollText(arg_33_2:Find("name/text"), var_33_0.name)

			local var_33_18 = UIItemList.New(arg_33_2:Find("bubbles/content"), arg_33_2:Find("bubbles/content/tpl"))

			arg_32_0:SetBubbles(var_33_18, var_33_5)

			local var_33_19 = CommonCommodity.New({
				id = var_33_6
			}, Goods.TYPE_SHOPSTREET)
			local var_33_20, var_33_21, var_33_22 = var_33_19:GetPrice()
			local var_33_23 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_33_19:GetResType(),
				count = var_33_20
			})

			setText(arg_33_2:Find("consume/Text"), "<icon name=" .. var_33_19:GetResIcon() .. " w=0.81 h=0.81/>" .. var_33_20)
			setActive(arg_33_2:Find("consume"), not var_33_1)
			setActive(arg_33_2:Find("soldOut"), var_33_1)

			local var_33_24 = var_0_3[var_33_0.shop_id[1]].time

			setActive(arg_33_2:Find("timeLimit"), var_33_24 ~= "always")

			if var_33_24 ~= "always" then
				local var_33_25 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_33_24[2])

				setText(arg_33_2:Find("timeLimit/Text"), arg_32_0:GetTimeRemain(var_33_25))
			end

			if not var_33_1 then
				onButton(arg_32_0, arg_33_2, function()
					arg_32_0:ClickCommodity(var_33_0, arg_33_2:Find("tip"))
				end, SFX_PANEL)
			else
				onButton(arg_32_0, arg_33_2, function()
					var_0_0.UpdateCommodtyTip(var_33_0)
					setActive(arg_33_2:Find("tip"), false)
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
				end, SFX_PANEL)
			end

			local var_33_26 = var_0_0.ShouldShowCommodtyTip(var_33_0)

			setActive(arg_33_2:Find("new"), var_33_26)
			setActive(arg_33_2:Find("tip"), var_33_26)
		end
	end)
	var_32_1:align(#var_32_0)

	arg_32_0.filterIndex = 1

	for iter_32_0 = 1, 4 do
		local var_32_3 = arg_32_0.charaPage:Find("switch"):GetChild(iter_32_0 - 1)

		onToggle(arg_32_0, var_32_3, function(arg_36_0)
			if arg_36_0 then
				arg_32_0.filterIndex = iter_32_0

				if iter_32_0 == 1 then
					for iter_36_0, iter_36_1 in ipairs(var_32_2) do
						setActive(iter_36_1[2], true)
					end
				elseif iter_32_0 == 2 then
					for iter_36_2, iter_36_3 in ipairs(var_32_2) do
						setActive(iter_36_3[2], iter_36_3[1] == 2)
					end
				elseif iter_32_0 == 3 then
					for iter_36_4, iter_36_5 in ipairs(var_32_2) do
						setActive(iter_36_5[2], iter_36_5[1] == 1)
					end
				else
					for iter_36_6, iter_36_7 in ipairs(var_32_2) do
						setActive(iter_36_7[2], iter_36_7[1] == 3)
					end
				end

				for iter_36_8 = 1, 4 do
					local var_36_0 = arg_32_0.charaPage:Find("switch"):GetChild(iter_36_8 - 1)

					setActive(var_36_0:Find("selected"), iter_36_8 == iter_32_0)
				end
			end
		end)

		if iter_32_0 == 1 then
			triggerToggle(var_32_3, true)
		end
	end
end

function var_0_0.ClickCommodity(arg_37_0, arg_37_1, arg_37_2)
	arg_37_0.showCount = 1

	if arg_37_1.room_id ~= 0 then
		local var_37_0 = 0

		for iter_37_0, iter_37_1 in pairs(var_0_4) do
			if iter_37_1.type == 2 and iter_37_1.character[1] == arg_37_1.room_id then
				var_37_0 = iter_37_1.id
			end
		end

		if not getProxy(ApartmentProxy):getRoom(var_37_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))

			return
		end
	end

	if arg_37_1.realroom_id ~= 0 and not getProxy(ApartmentProxy):getRoom(arg_37_1.realroom_id) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_publicroom_unlock") .. "：" .. pg.dorm3d_rooms[arg_37_1.realroom_id].room)

		return
	end

	var_0_0.UpdateCommodtyTip(arg_37_1)

	if arg_37_2 then
		setActive(arg_37_2, false)
	end

	if arg_37_1.type == 1 then
		local var_37_1 = Dorm3dFurniture.New({
			configId = arg_37_1.item_id
		})
		local var_37_2 = CommonCommodity.New({
			id = arg_37_1.shop_id[1]
		}, Goods.TYPE_SHOPSTREET)
		local var_37_3, var_37_4, var_37_5 = var_37_2:GetPrice()
		local var_37_6 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_37_2:GetResType(),
			count = var_37_3
		})

		arg_37_0:emit(Dorm3dShopMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
			content = {
				icon = "<icon name=" .. var_37_2:GetResIcon() .. " w=1.1 h=1.1/>",
				off = var_37_4,
				cost = var_37_6.count,
				old = var_37_5,
				name = arg_37_1.name
			},
			tip = i18n("dorm3d_shop_gift_tip"),
			drop = var_37_1,
			endTime = var_37_1:GetEndTime(),
			onYes = function()
				if not var_37_1:InShopTime() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_purchase_outtime"))

					return
				end

				arg_37_0:emit(GAME.SHOPPING, {
					silentTip = true,
					count = 1,
					shopId = arg_37_1.shop_id[1]
				})
			end
		})
	elseif arg_37_1.type == 2 then
		local var_37_7 = 0

		for iter_37_2 = 1, #arg_37_1.shop_id do
			local var_37_8 = arg_37_1.shop_id[iter_37_2]
			local var_37_9 = var_0_3[var_37_8]
			local var_37_10 = var_37_9.limit_args[1]

			if not var_37_10 and var_37_9.group_type == 0 then
				var_37_7 = 0
			elseif var_37_10 and (var_37_10[1] == "dailycount" or var_37_10[1] == "count") then
				var_37_7 = var_37_10[3]
			elseif var_37_9.group_type == 2 then
				var_37_7 = var_37_9.group_limit
			end
		end

		if var_37_7 > 1 then
			local var_37_11 = 0

			if arg_37_0.selectedId ~= 0 then
				var_37_11 = var_0_4[arg_37_0.selectedId].character[1]
			end

			arg_37_0:emit(Dorm3dShopMediator.OPEN_DETAIL, arg_37_1, var_37_11, function(arg_39_0)
				arg_37_0.showCount = arg_39_0
			end)
		else
			local var_37_12 = Dorm3dGift.New({
				configId = arg_37_1.item_id
			})
			local var_37_13 = CommonCommodity.New({
				id = var_37_12:GetShopID()
			}, Goods.TYPE_SHOPSTREET)
			local var_37_14, var_37_15, var_37_16 = var_37_13:GetPrice()
			local var_37_17 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_37_13:GetResType(),
				count = var_37_14
			})
			local var_37_18
			local var_37_19 = 0

			_.each(var_37_12:getConfig("shop_id"), function(arg_40_0)
				local var_40_0 = var_0_3[arg_40_0]

				if var_40_0.group_type == 2 then
					var_37_19 = math.max(var_40_0.group_limit, var_37_19)
				end
			end)

			if var_37_19 > 0 then
				var_37_18 = {
					getProxy(ApartmentProxy):GetGiftShopCount(var_37_12:GetConfigID()),
					var_37_19
				}
			end

			arg_37_0:emit(Dorm3dShopMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
				content = {
					icon = "<icon name=" .. var_37_13:GetResIcon() .. " w=1.1 h=1.1/>",
					off = var_37_15,
					cost = var_37_17.count,
					old = var_37_16,
					name = arg_37_1.name,
					weekLimit = var_37_18
				},
				tip = i18n("dorm3d_shop_gift_tip"),
				drop = var_37_12,
				groupId = arg_37_1.room_id,
				onYes = function()
					arg_37_0:emit(GAME.SHOPPING, {
						silentTip = true,
						count = 1,
						shopId = var_37_12:GetShopID()
					})
				end
			})
		end
	elseif arg_37_1.type == 3 then
		local var_37_20
		local var_37_21 = getProxy(ApartmentProxy):getRoom(arg_37_1.item_id)

		if not var_37_21 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))

			return
		end

		if not var_37_21.unlockCharacter[arg_37_1.room_id] then
			var_37_20 = "lock"
		elseif not getProxy(ApartmentProxy):getApartment(arg_37_1.room_id) then
			var_37_20 = "room"
		elseif Apartment.New({
			ship_group = arg_37_1.room_id
		}):needDownload() then
			var_37_20 = "download"
		end

		if var_37_20 == "lock" then
			arg_37_0:emit(Dorm3dShopMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_37_1.item_id, arg_37_1.room_id)
		elseif var_37_20 == "room" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))
		elseif var_37_20 == "download" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_beach_tip"))
		end
	end
end

function var_0_0.SetBubbles(arg_42_0, arg_42_1, arg_42_2)
	arg_42_1:make(function(arg_43_0, arg_43_1, arg_43_2)
		if arg_43_0 == UIItemList.EventInit then
			local var_43_0 = arg_43_1 + 1
			local var_43_1 = arg_42_2[var_43_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_43_1, arg_43_2:Find("icon/icon"), true)
			setText(arg_43_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_43_1))
			setActive(arg_43_2:Find("bubble"), false)
			onToggle(arg_42_0, arg_43_2, function(arg_44_0)
				setActive(arg_43_2:Find("icon/select"), arg_44_0)
				setActive(arg_43_2:Find("icon/unselect"), not arg_44_0)
				setActive(arg_43_2:Find("bubble"), arg_44_0)
				setActive(arg_42_0.mask, arg_44_0)
				onButton(arg_42_0, arg_42_0.mask, function()
					triggerToggle(arg_43_2, false)
				end, SFX_PANEL)
			end)
		end
	end)
	arg_42_1:align(#arg_42_2)
end

function var_0_0.GetTimeRemain(arg_46_0, arg_46_1)
	local var_46_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_46_1 = math.max(arg_46_1 - var_46_0, 0)
	local var_46_2 = math.floor(var_46_1 / 86400)

	if var_46_2 > 0 then
		return var_46_2 .. i18n("word_date")
	else
		local var_46_3 = math.floor(var_46_1 / 3600)

		if var_46_3 > 0 then
			return var_46_3 .. i18n("word_hour")
		else
			local var_46_4 = math.floor(var_46_1 / 60)

			if var_46_4 > 0 then
				return var_46_4 .. i18n("word_minute")
			else
				return var_46_1 .. i18n("word_second")
			end
		end
	end
end

function var_0_0.ShouldShowCommodtyTip(arg_47_0)
	if arg_47_0.room_id ~= 0 then
		local var_47_0 = 0

		for iter_47_0, iter_47_1 in ipairs(var_0_4.all) do
			local var_47_1 = var_0_4[iter_47_1]

			if var_47_1.type == 2 and var_47_1.character[1] == arg_47_0.room_id then
				var_47_0 = iter_47_1
			end
		end

		if not getProxy(ApartmentProxy):getRoom(var_47_0) then
			return false
		end
	end

	if arg_47_0.realroom_id ~= 0 and not getProxy(ApartmentProxy):getRoom(arg_47_0.realroom_id) then
		return false
	end

	if arg_47_0.type == 1 then
		return Dorm3dFurniture.NeedViewTipByFurnitureId(arg_47_0.item_id)
	elseif arg_47_0.type == 2 then
		local var_47_2 = getProxy(PlayerProxy):getRawData().id
		local var_47_3 = Dorm3dGift.NeedViewTipByGiftId(arg_47_0.item_id)
		local var_47_4 = var_0_3[arg_47_0.shop_id[1]].group ~= 0 and PlayerPrefs.GetInt(var_47_2 .. "_dorm3dGiftWeekViewed_" .. arg_47_0.item_id, 0) == 0

		return var_47_3 or var_47_4
	end

	return false
end

function var_0_0.ShouldShowSumTip(arg_48_0)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0) do
		if var_0_0.ShouldShowCommodtyTip(iter_48_1) then
			return true
		end
	end

	return false
end

function var_0_0.ShouldShowAllTip()
	local var_49_0 = {}

	for iter_49_0, iter_49_1 in ipairs(var_0_2.all) do
		local var_49_1 = var_0_2[iter_49_1]
		local var_49_2 = false
		local var_49_3 = var_49_1.shop_id

		for iter_49_2, iter_49_3 in ipairs(var_49_3) do
			local var_49_4 = var_0_3[iter_49_3]

			if not pg.TimeMgr.GetInstance():inTime(var_49_4.time) then
				var_49_2 = true

				break
			end
		end

		if not var_49_2 then
			table.insert(var_49_0, var_49_1)
		end
	end

	return var_0_0.ShouldShowSumTip(var_49_0)
end

function var_0_0.UpdateCommodtyTip(arg_50_0)
	if arg_50_0.type == 1 then
		Dorm3dFurniture.SetViewedFlag(arg_50_0.item_id)
	elseif arg_50_0.type == 2 then
		Dorm3dGift.SetViewedFlag(arg_50_0.item_id)

		if var_0_3[arg_50_0.shop_id[1]].group ~= 0 then
			local var_50_0 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt(var_50_0 .. "_dorm3dGiftWeekViewed_" .. arg_50_0.item_id, 1)
		end
	end
end

function var_0_0.UpdateSumTip(arg_51_0)
	for iter_51_0, iter_51_1 in ipairs(arg_51_0) do
		var_0_0.UpdateCommodtyTip(iter_51_1)
	end
end

function var_0_0.willExit(arg_52_0)
	arg_52_0.scrollSnap:Dispose()

	arg_52_0.scrollSnap = nil
end

function var_0_0.onBackPressed(arg_53_0)
	arg_53_0:closeView()
end

return var_0_0

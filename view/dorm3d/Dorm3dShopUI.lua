local var_0_0 = class("Dorm3dShopUI", import("view.base.BaseUI"))
local var_0_1 = pg.dorm3d_set
local var_0_2 = pg.dorm3d_shop_template
local var_0_3 = pg.shop_template
local var_0_4 = pg.dorm3d_rooms
local var_0_5 = pg.dorm3d_gift
local var_0_6 = pg.dorm3d_furniture_template

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dShopUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("closeBtn")
	arg_2_0.res = arg_2_0:findTF("resourceBg/res")
	arg_2_0.recommendationTg = arg_2_0:findTF("left/recommendation")
	arg_2_0.charaList = UIItemList.New(arg_2_0:findTF("left/charaScroll/mask/list"), arg_2_0:findTF("left/charaScroll/mask/list/tpl"))
	arg_2_0.recommendationPage = arg_2_0:findTF("pages/recommendationPage")
	arg_2_0.charaPage = arg_2_0:findTF("pages/charaPage")
	arg_2_0.mask = arg_2_0:findTF("mask")

	setText(arg_2_0:findTF("title/Text"), i18n("dorm3d_shop_title"))
	setText(arg_2_0:findTF("bannerCard/mask/content/item/soldOut", arg_2_0.recommendationPage), i18n("dorm3d_shop_sold_out"))
	setText(arg_2_0:findTF("giftCard/soldOut", arg_2_0.recommendationPage), i18n("dorm3d_shop_sold_out"))
	setText(arg_2_0:findTF("card1/soldOut", arg_2_0.recommendationPage), i18n("dorm3d_shop_sold_out"))
	setText(arg_2_0:findTF("card2/soldOut", arg_2_0.recommendationPage), i18n("dorm3d_shop_sold_out"))
	setText(arg_2_0:findTF("card3/soldOut", arg_2_0.recommendationPage), i18n("dorm3d_shop_sold_out"))
	setText(arg_2_0:findTF("scroll/Viewport/Content/card/soldOut", arg_2_0.charaPage), i18n("dorm3d_shop_sold_out"))
	setText(arg_2_0:findTF("switch/all/Text", arg_2_0.charaPage), i18n("dorm3d_shop_all"))
	setText(arg_2_0:findTF("switch/gift/Text", arg_2_0.charaPage), i18n("dorm3d_shop_gift1"))
	setText(arg_2_0:findTF("switch/furniture/Text", arg_2_0.charaPage), i18n("dorm3d_shop_furniture"))
	setText(arg_2_0:findTF("switch/others/Text", arg_2_0.charaPage), i18n("dorm3d_shop_others"))
	setText(arg_2_0:findTF("switch/all/selected/Text", arg_2_0.charaPage), i18n("dorm3d_shop_all"))
	setText(arg_2_0:findTF("switch/gift/selected/Text", arg_2_0.charaPage), i18n("dorm3d_shop_gift1"))
	setText(arg_2_0:findTF("switch/furniture/selected/Text", arg_2_0.charaPage), i18n("dorm3d_shop_furniture"))
	setText(arg_2_0:findTF("switch/others/selected/Text", arg_2_0.charaPage), i18n("dorm3d_shop_others"))
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:InitData()
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:closeView()
	end, SFX_PANEL)
	arg_3_0:ShowResUI()
	arg_3_0:SetPageBtns()
	triggerToggle(arg_3_0.recommendationTg, true)
end

function var_0_0.InitData(arg_5_0)
	arg_5_0.bannerCount = var_0_1.drom3d_shop_product_panel_num.key_value_int
	arg_5_0.allCommodityCfgs = {}

	for iter_5_0, iter_5_1 in ipairs(var_0_2.all) do
		table.insert(arg_5_0.allCommodityCfgs, var_0_2[iter_5_1])
	end

	table.sort(arg_5_0.allCommodityCfgs, function(arg_6_0, arg_6_1)
		if tonumber(arg_6_0.order) ~= tonumber(arg_6_1.order) then
			return tonumber(arg_6_0.order) < tonumber(arg_6_1.order)
		end

		return arg_6_0.id > arg_6_1.id
	end)

	arg_5_0.roomCfgs = {}

	_.each(var_0_4.all, function(arg_7_0)
		if var_0_4[arg_7_0].type == 2 then
			table.insert(arg_5_0.roomCfgs, var_0_4[arg_7_0])
		end
	end)
	table.sort(arg_5_0.roomCfgs, function(arg_8_0, arg_8_1)
		return arg_8_0.id < arg_8_1.id
	end)

	arg_5_0.selectedId = 0
end

function var_0_0.SetPageBtns(arg_9_0)
	SetParent(arg_9_0.recommendationTg, arg_9_0:findTF("left"), false)
	arg_9_0.charaList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_9_0.roomCfgs[arg_10_1 + 1]
			local var_10_1 = string.format("dorm3dselect/room_icon_%s", string.lower(var_10_0.assets_prefix))

			GetImageSpriteFromAtlasAsync(var_10_1, "", arg_10_2:Find("mask/icon"), false)

			local var_10_2 = arg_9_0:GetCommoditiesCfgByChara(var_10_0.character[1])

			setActive(arg_10_2:Find("tip"), var_0_0.ShouldShowSumTip(var_10_2))
			onToggle(arg_9_0, arg_10_2, function(arg_11_0)
				if arg_11_0 then
					arg_9_0.selectedId = var_10_0.id

					arg_9_0:SetPageBtns()
					arg_9_0:RefreshPage()
					var_0_0.UpdateSumTip(var_10_2)
				end
			end)
		end
	end)
	arg_9_0.charaList:align(#arg_9_0.roomCfgs)

	arg_9_0.showingCommoditiesIndex = {}

	local var_9_0 = {}

	table.insertto(var_9_0, arg_9_0:GetCommoditiesCfgByPanel(1, arg_9_0.bannerCount))
	table.insertto(var_9_0, arg_9_0:GetCommoditiesCfgByPanel(2, 1))
	table.insertto(var_9_0, arg_9_0:GetCommoditiesCfgByPanel(3, 1))
	table.insertto(var_9_0, arg_9_0:GetCommoditiesCfgByPanel(4, 1))
	table.insertto(var_9_0, arg_9_0:GetCommoditiesCfgByPanel(5, 1))
	setActive(arg_9_0:findTF("icon/tip", arg_9_0.recommendationTg), var_0_0.ShouldShowSumTip(var_9_0))
	onToggle(arg_9_0, arg_9_0.recommendationTg, function(arg_12_0)
		if arg_12_0 then
			arg_9_0.selectedId = 0

			arg_9_0:SetPageBtns()
			arg_9_0:RefreshPage()
			var_0_0.UpdateSumTip(var_9_0)
		end
	end)
	SetParent(arg_9_0.recommendationTg, arg_9_0:findTF("left/charaScroll/mask/list"), false)
	arg_9_0.recommendationTg:SetSiblingIndex(0)
end

function var_0_0.GetCommoditiesCfgByPanel(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {}
	local var_13_1 = 0

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.allCommodityCfgs) do
		if not table.contains(arg_13_0.showingCommoditiesIndex, iter_13_0) and table.contains(iter_13_1.panel, arg_13_1) then
			if not (arg_13_0:IsCommodityOutOfDate(iter_13_1) or arg_13_0:IsCommoditySoldOut(iter_13_1)) then
				var_13_1 = var_13_1 + 1

				table.insert(var_13_0, iter_13_1)
				table.insert(arg_13_0.showingCommoditiesIndex, iter_13_0)
			end

			if var_13_1 == arg_13_2 then
				break
			end
		end
	end

	if var_13_1 < arg_13_2 then
		for iter_13_2, iter_13_3 in ipairs(arg_13_0.allCommodityCfgs) do
			if not table.contains(arg_13_0.showingCommoditiesIndex, iter_13_2) and table.contains(iter_13_3.panel, arg_13_1) then
				if not arg_13_0:IsCommodityOutOfDate(iter_13_3) then
					var_13_1 = var_13_1 + 1

					table.insert(var_13_0, iter_13_3)
					table.insert(arg_13_0.showingCommoditiesIndex, iter_13_2)
				end

				if var_13_1 == arg_13_2 then
					break
				end
			end
		end
	end

	return var_13_0
end

function var_0_0.GetCommoditiesCfgByChara(arg_14_0, arg_14_1)
	local var_14_0 = {}
	local var_14_1 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.allCommodityCfgs) do
		if iter_14_1.room_id == arg_14_1 or iter_14_1.room_id == 0 then
			local var_14_2 = arg_14_0:IsCommodityOutOfDate(iter_14_1)
			local var_14_3 = arg_14_0:IsCommoditySoldOut(iter_14_1)

			if not var_14_2 then
				if not var_14_3 then
					table.insert(var_14_0, iter_14_1)
				else
					table.insert(var_14_1, iter_14_1)
				end
			end
		end
	end

	if #var_14_1 > 0 then
		table.insertto(var_14_0, var_14_1)
	end

	return var_14_0
end

function var_0_0.IsCommodityOutOfDate(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.shop_id

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_1 = var_0_3[iter_15_1]

		if not pg.TimeMgr.GetInstance():inTime(var_15_1.time) then
			return true
		end
	end

	return false
end

function var_0_0.IsCommoditySoldOut(arg_16_0, arg_16_1)
	if arg_16_1.type == 1 then
		if getProxy(ApartmentProxy):GetFurnitureShopCount(arg_16_1.item_id) > 0 then
			return true
		end
	elseif arg_16_1.type == 2 then
		return not Dorm3dGift.New({
			configId = arg_16_1.item_id
		}):CheckBuyLimit()
	elseif arg_16_1.type == 3 then
		local var_16_0 = getProxy(ApartmentProxy):getRoom(arg_16_1.item_id)

		return var_16_0 and var_16_0.unlockCharacter[arg_16_1.room_id]
	end

	return false
end

function var_0_0.ShowResUI(arg_17_0)
	local var_17_0 = getProxy(PlayerProxy):getRawData()

	arg_17_0.goldMax = arg_17_0:findTF("gold/max", arg_17_0.res):GetComponent(typeof(Text))
	arg_17_0.goldValue = arg_17_0:findTF("gold/Text", arg_17_0.res):GetComponent(typeof(Text))
	arg_17_0.oilMax = arg_17_0:findTF("oil/max", arg_17_0.res):GetComponent(typeof(Text))
	arg_17_0.oilValue = arg_17_0:findTF("oil/Text", arg_17_0.res):GetComponent(typeof(Text))
	arg_17_0.gemValue = arg_17_0:findTF("gem/Text", arg_17_0.res):GetComponent(typeof(Text))

	PlayerResUI.StaticFlush(var_17_0, arg_17_0.goldMax, arg_17_0.goldValue, arg_17_0.oilMax, arg_17_0.oilValue, arg_17_0.gemValue)
	onButton(arg_17_0, arg_17_0:findTF("gold", arg_17_0.res), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0:findTF("oil", arg_17_0.res), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0:findTF("gem", arg_17_0.res), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.RefreshPage(arg_21_0)
	arg_21_0.showingCommoditiesIndex = {}

	setActive(arg_21_0.recommendationPage, arg_21_0.selectedId == 0)
	setActive(arg_21_0.charaPage, arg_21_0.selectedId ~= 0)

	if arg_21_0.selectedId == 0 then
		arg_21_0:SetBannnerCard()
		arg_21_0:SetGiftCard()
		arg_21_0:SetNormalCard()
	else
		arg_21_0:SetCharaCard()
	end
end

function var_0_0.SetBannnerCard(arg_22_0)
	local var_22_0 = arg_22_0:findTF("bannerCard", arg_22_0.recommendationPage)
	local var_22_1 = arg_22_0:GetCommoditiesCfgByPanel(1, arg_22_0.bannerCount)

	if not arg_22_0.scrollSnap then
		arg_22_0.scrollSnap = BannerScrollRectDorm3dShop.New(arg_22_0:findTF("mask/content", var_22_0), arg_22_0:findTF("dots", var_22_0))
	end

	for iter_22_0, iter_22_1 in ipairs(var_22_1) do
		local var_22_2 = arg_22_0.scrollSnap:GetItemChild(iter_22_0) or arg_22_0.scrollSnap:AddChild()
		local var_22_3 = arg_22_0:IsCommoditySoldOut(iter_22_1)
		local var_22_4 = false
		local var_22_5 = false
		local var_22_6 = {}
		local var_22_7 = 0
		local var_22_8 = ""
		local var_22_9 = ""
		local var_22_10 = var_0_3[iter_22_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

		if iter_22_1.type == 1 then
			local var_22_11 = var_0_6[iter_22_1.item_id]

			var_22_5 = var_22_11.is_special == 1
			var_22_4 = not var_22_5 and var_22_11.is_exclusive == 1
			var_22_8 = Drop.New({
				count = 0,
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_22_11.id
			}):getIcon()
			var_22_9 = var_22_10 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(iter_22_1.item_id) .. "/1"
			var_22_6 = var_22_11.unlock_tips or {}
			var_22_7 = iter_22_1.shop_id[1]
		elseif iter_22_1.type == 2 then
			local var_22_12 = var_0_5[iter_22_1.item_id]

			var_22_4 = iter_22_1.room_id ~= 0

			local var_22_13 = Dorm3dGift.New({
				configId = iter_22_1.item_id
			})

			var_22_8 = Drop.New({
				type = DROP_TYPE_DORM3D_GIFT,
				id = iter_22_1.item_id,
				count = getProxy(ApartmentProxy):getGiftCount(iter_22_1.item_id)
			}):getIcon()

			local var_22_14 = 0

			for iter_22_2 = 1, #iter_22_1.shop_id do
				local var_22_15 = iter_22_1.shop_id[iter_22_2]
				local var_22_16 = var_0_3[var_22_15]
				local var_22_17 = var_22_16.limit_args[1]

				if not var_22_17 and var_22_16.group_type == 0 then
					var_22_14 = 0
				elseif var_22_17 and (var_22_17[1] == "dailycount" or var_22_17[1] == "count") then
					var_22_14 = var_22_17[3]
				elseif var_22_16.group_type == 2 then
					var_22_14 = var_22_16.group_limit
				end
			end

			var_22_9 = var_22_10 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(iter_22_1.item_id) .. "/" .. var_22_14

			setText(arg_22_0:findTF("favor/number", var_22_2), "+" .. pg.dorm3d_favor_trigger[var_0_5[iter_22_1.item_id].favor_trigger_id].num)

			arg_22_0:findTF("favor", var_22_2):GetComponent(typeof(CanvasGroup)).alpha = var_22_3 and 0.5 or 1
			var_22_6 = var_22_12.unlock_tips or {}
			var_22_7 = var_22_13:GetShopID()
		elseif iter_22_1.type == 3 then
			var_22_4 = true

			local var_22_18 = var_0_4[iter_22_1.item_id].invite_icon

			for iter_22_3, iter_22_4 in ipairs(var_22_18) do
				if iter_22_4[1] == iter_22_1.room_id then
					var_22_8 = iter_22_4[2]
				end
			end

			local var_22_19 = var_22_3 and 1 or 0

			var_22_9 = var_22_10 .. " " .. var_22_19 .. "/1"
			var_22_7 = iter_22_1.shop_id[1]
		end

		setActive(arg_22_0:findTF("bg/normal", var_22_2), not var_22_4 and not var_22_5)
		setActive(arg_22_0:findTF("bg/zhuanshu", var_22_2), var_22_4)
		setActive(arg_22_0:findTF("bg/tedian", var_22_2), var_22_5)
		setActive(arg_22_0:findTF("normal", var_22_2), not var_22_4 and not var_22_5)
		setActive(arg_22_0:findTF("zhuanshu", var_22_2), var_22_4)
		setActive(arg_22_0:findTF("tedian", var_22_2), var_22_5)
		setActive(arg_22_0:findTF("favor", var_22_2), iter_22_1.type == 2)
		LoadImageSpriteAsync("dorm3dbanner/" .. iter_22_1.banners[1] .. "_shopCard1", arg_22_0:findTF("bannerMask/banner", var_22_2), true)
		setText(arg_22_0:findTF("name", var_22_2), iter_22_1.name)

		local var_22_20 = var_0_3[iter_22_1.shop_id[1]].time

		setActive(arg_22_0:findTF("timeLimit", var_22_2), var_22_20 ~= "always")

		if var_22_20 ~= "always" then
			local var_22_21 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_22_20[2])

			setText(arg_22_0:findTF("timeLimit/Text", var_22_2), arg_22_0:GetTimeRemain(var_22_21))
		end

		local var_22_22 = UIItemList.New(arg_22_0:findTF("bubbles/content", var_22_2), arg_22_0:findTF("bubbles/content/tpl", var_22_2))

		arg_22_0:SetBubbles(var_22_22, var_22_6)
		setActive(arg_22_0:findTF("consume", var_22_2), not var_22_3)
		setActive(arg_22_0:findTF("soldOut", var_22_2), var_22_3)

		local var_22_23 = CommonCommodity.New({
			id = var_22_7
		}, Goods.TYPE_SHOPSTREET)
		local var_22_24, var_22_25, var_22_26 = var_22_23:GetPrice()
		local var_22_27 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_22_23:GetResType(),
			count = var_22_24
		})

		setText(arg_22_0:findTF("consume/Text", var_22_2), "<icon name=" .. var_22_23:GetResIcon() .. " w=0.81 h=0.81/>" .. var_22_24)
		GetImageSpriteFromAtlasAsync(var_22_8, "", arg_22_0:findTF("normal/Dorm3dIconTpl/icon", var_22_2))
		GetImageSpriteFromAtlasAsync(var_22_8, "", arg_22_0:findTF("zhuanshu/Dorm3dIconTpl/icon", var_22_2))
		GetImageSpriteFromAtlasAsync(var_22_8, "", arg_22_0:findTF("tedian/Dorm3dIconTpl/icon", var_22_2))
		setText(arg_22_0:findTF("normal/countLimit", var_22_2), var_22_9)
		setText(arg_22_0:findTF("zhuanshu/countLimit", var_22_2), var_22_9)
		setText(arg_22_0:findTF("tedian/countLimit", var_22_2), var_22_9)

		arg_22_0:findTF("normal/Dorm3dIconTpl", var_22_2):GetComponent(typeof(CanvasGroup)).alpha = var_22_3 and 0.5 or 1
		arg_22_0:findTF("zhuanshu/Dorm3dIconTpl", var_22_2):GetComponent(typeof(CanvasGroup)).alpha = var_22_3 and 0.5 or 1
		arg_22_0:findTF("tedian/Dorm3dIconTpl", var_22_2):GetComponent(typeof(CanvasGroup)).alpha = var_22_3 and 0.5 or 1

		if not var_22_3 then
			onButton(arg_22_0, var_22_2, function()
				arg_22_0:ClickCommodity(iter_22_1)
			end, SFX_PANEL)
		else
			onButton(arg_22_0, var_22_2, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
			end, SFX_PANEL)
		end

		setActive(arg_22_0:findTF("new", var_22_2), var_0_0.ShouldShowCommodtyTip(iter_22_1))
	end

	arg_22_0.scrollSnap:SetUp()
end

function var_0_0.SetGiftCard(arg_25_0)
	local var_25_0 = arg_25_0:findTF("giftCard", arg_25_0.recommendationPage)
	local var_25_1 = arg_25_0:GetCommoditiesCfgByPanel(2, 1)[1]
	local var_25_2 = 0
	local var_25_3 = arg_25_0:IsCommoditySoldOut(var_25_1)
	local var_25_4 = ""
	local var_25_5 = false
	local var_25_6 = false
	local var_25_7 = var_0_3[var_25_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

	if var_25_1.type == 1 then
		local var_25_8 = var_0_6[var_25_1.item_id]

		var_25_6 = var_25_8.is_special == 1
		var_25_5 = not var_25_6 and var_25_8.is_exclusive == 1

		local var_25_9 = Drop.New({
			count = 0,
			type = DROP_TYPE_DORM3D_FURNITURE,
			id = var_25_8.id
		})

		updateCustomDrop(arg_25_0:findTF("Dorm3dIconTpl", var_25_0), var_25_9)

		var_25_2 = var_25_1.shop_id[1]
		var_25_4 = var_25_7 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_25_1.item_id) .. "/1"
	elseif var_25_1.type == 2 then
		local var_25_10 = var_0_5[var_25_1.item_id]

		var_25_5 = var_25_1.room_id ~= 0

		local var_25_11 = Dorm3dGift.New({
			configId = var_25_1.item_id
		})
		local var_25_12 = Drop.New({
			type = DROP_TYPE_DORM3D_GIFT,
			id = var_25_1.item_id,
			count = getProxy(ApartmentProxy):getGiftCount(var_25_1.item_id)
		})

		setText(arg_25_0:findTF("favor/number", var_25_0), "+" .. pg.dorm3d_favor_trigger[var_0_5[var_25_1.item_id].favor_trigger_id].num)
		updateCustomDrop(arg_25_0:findTF("Dorm3dIconTpl", var_25_0), var_25_12)

		var_25_2 = var_25_11:GetShopID()

		local var_25_13 = 0

		for iter_25_0 = 1, #var_25_1.shop_id do
			local var_25_14 = var_25_1.shop_id[iter_25_0]
			local var_25_15 = var_0_3[var_25_14]
			local var_25_16 = var_25_15.limit_args[1]

			if not var_25_16 and var_25_15.group_type == 0 then
				var_25_13 = 0
			elseif var_25_16 and (var_25_16[1] == "dailycount" or var_25_16[1] == "count") then
				var_25_13 = var_25_16[3]
			elseif var_25_15.group_type == 2 then
				var_25_13 = var_25_15.group_limit
			end
		end

		var_25_4 = var_25_7 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_25_1.item_id) .. "/" .. var_25_13
	elseif var_25_1.type == 3 then
		var_25_5 = true

		local var_25_17 = var_0_4[var_25_1.item_id].invite_icon
		local var_25_18 = ""

		for iter_25_1, iter_25_2 in ipairs(var_25_17) do
			if iter_25_2[1] == var_25_1.room_id then
				var_25_18 = iter_25_2[2]
			end
		end

		GetImageSpriteFromAtlasAsync(var_25_18, "", arg_25_0:findTF("Dorm3dIconTpl/icon", var_25_0))
		GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_25_1.rarity), arg_25_0:findTF("Dorm3dIconTpl", var_25_0))

		local var_25_19 = var_25_3 and 1 or 0

		var_25_4 = var_25_7 .. " " .. var_25_19 .. "/1"
		var_25_2 = var_25_1.shop_id[1]
	end

	arg_25_0:findTF("Dorm3dIconTpl", var_25_0):GetComponent(typeof(CanvasGroup)).alpha = var_25_3 and 0.5 or 1
	arg_25_0:findTF("favor", var_25_0):GetComponent(typeof(CanvasGroup)).alpha = var_25_3 and 0.5 or 1

	setActive(arg_25_0:findTF("bg/normal", var_25_0), not var_25_5 and not var_25_6)
	setActive(arg_25_0:findTF("bg/zhuanshu", var_25_0), var_25_5)
	setActive(arg_25_0:findTF("bg/tedian", var_25_0), var_25_6)
	setActive(arg_25_0:findTF("normal", var_25_0), not var_25_5 and not var_25_6)
	setActive(arg_25_0:findTF("zhuanshu", var_25_0), var_25_5)
	setActive(arg_25_0:findTF("tedian", var_25_0), var_25_6)
	setText(arg_25_0:findTF("normal/countLimit", var_25_0), var_25_4)
	setText(arg_25_0:findTF("zhuanshu/countLimit", var_25_0), var_25_4)
	setText(arg_25_0:findTF("tedian/countLimit", var_25_0), var_25_4)
	LoadImageSpriteAsync("dorm3dbanner/" .. var_25_1.banners[1] .. "_shopCard2", arg_25_0:findTF("mask/item", var_25_0), true)
	setText(arg_25_0:findTF("name", var_25_0), var_25_1.name)
	setActive(arg_25_0:findTF("favor", var_25_0), var_25_1.type == 2)
	setActive(arg_25_0:findTF("consume", var_25_0), not var_25_3)
	setActive(arg_25_0:findTF("soldOut", var_25_0), var_25_3)

	local var_25_20 = var_0_3[var_25_1.shop_id[1]].time

	setActive(arg_25_0:findTF("timeLimit", var_25_0), var_25_20 ~= "always")

	if var_25_20 ~= "always" then
		local var_25_21 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_25_20[2])

		setText(arg_25_0:findTF("timeLimit/Text", var_25_0), arg_25_0:GetTimeRemain(var_25_21))
	end

	local var_25_22 = CommonCommodity.New({
		id = var_25_2
	}, Goods.TYPE_SHOPSTREET)
	local var_25_23, var_25_24, var_25_25 = var_25_22:GetPrice()
	local var_25_26 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_25_22:GetResType(),
		count = var_25_23
	})

	setText(arg_25_0:findTF("consume/Text", var_25_0), "<icon name=" .. var_25_22:GetResIcon() .. " w=0.81 h=0.81/>" .. var_25_23)

	if not var_25_3 then
		onButton(arg_25_0, var_25_0, function()
			arg_25_0:ClickCommodity(var_25_1)
		end, SFX_PANEL)
	else
		onButton(arg_25_0, var_25_0, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
		end, SFX_PANEL)
	end

	setActive(arg_25_0:findTF("new", var_25_0), var_0_0.ShouldShowCommodtyTip(var_25_1))
end

function var_0_0.SetNormalCard(arg_28_0)
	for iter_28_0 = 1, 3 do
		local var_28_0 = arg_28_0:findTF("card" .. iter_28_0, arg_28_0.recommendationPage)
		local var_28_1 = arg_28_0:GetCommoditiesCfgByPanel(iter_28_0 + 2, 1)[1]
		local var_28_2 = false
		local var_28_3 = false
		local var_28_4 = arg_28_0:IsCommoditySoldOut(var_28_1)
		local var_28_5 = {}
		local var_28_6 = 0
		local var_28_7 = ""
		local var_28_8 = var_0_3[var_28_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

		if var_28_1.type == 1 then
			local var_28_9 = var_0_6[var_28_1.item_id]

			var_28_2 = var_28_9.is_special == 1
			var_28_3 = not var_28_2 and var_28_9.is_exclusive == 1
			var_28_7 = Drop.New({
				count = 0,
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_28_9.id
			}):getIcon()

			setText(arg_28_0:findTF("countLimit/Text", var_28_0), var_28_8 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_28_1.item_id) .. "/1")

			var_28_5 = var_28_9.unlock_tips or {}
			var_28_6 = var_28_1.shop_id[1]
		elseif var_28_1.type == 2 then
			local var_28_10 = var_0_5[var_28_1.item_id]

			var_28_3 = var_28_1.room_id ~= 0

			local var_28_11 = Dorm3dGift.New({
				configId = var_28_1.item_id
			})

			var_28_7 = Drop.New({
				type = DROP_TYPE_DORM3D_GIFT,
				id = var_28_1.item_id,
				count = getProxy(ApartmentProxy):getGiftCount(var_28_1.item_id)
			}):getIcon()

			local var_28_12 = 0

			for iter_28_1 = 1, #var_28_1.shop_id do
				local var_28_13 = var_28_1.shop_id[iter_28_1]
				local var_28_14 = var_0_3[var_28_13]
				local var_28_15 = var_28_14.limit_args[1]

				if not var_28_15 and var_28_14.group_type == 0 then
					var_28_12 = 0
				elseif var_28_15 and (var_28_15[1] == "dailycount" or var_28_15[1] == "count") then
					var_28_12 = var_28_15[3]
				elseif var_28_14.group_type == 2 then
					var_28_12 = var_28_14.group_limit
				end
			end

			setText(arg_28_0:findTF("countLimit/Text", var_28_0), var_28_8 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_28_1.item_id) .. "/" .. var_28_12)

			local var_28_16 = pg.dorm3d_favor_trigger[var_0_5[var_28_1.item_id].favor_trigger_id].num

			setText(arg_28_0:findTF("normal/favor/number", var_28_0), "+" .. var_28_16)
			setText(arg_28_0:findTF("zhuanshu/favor/number", var_28_0), "+" .. var_28_16)
			setText(arg_28_0:findTF("tedian/favor/number", var_28_0), "+" .. var_28_16)

			var_28_5 = var_28_10.unlock_tips or {}
			var_28_6 = var_28_11:GetShopID()
		elseif var_28_1.type == 3 then
			var_28_3 = true

			local var_28_17 = var_0_4[var_28_1.item_id].invite_icon

			for iter_28_2, iter_28_3 in ipairs(var_28_17) do
				if iter_28_3[1] == var_28_1.room_id then
					var_28_7 = iter_28_3[2]
				end
			end

			local var_28_18 = var_28_4 and 1 or 0

			setText(arg_28_0:findTF("countLimit/Text", var_28_0), var_28_8 .. " " .. var_28_18 .. "/1")

			var_28_6 = var_28_1.shop_id[1]
		end

		setActive(arg_28_0:findTF("bg/normal", var_28_0), not var_28_3 and not var_28_2)
		setActive(arg_28_0:findTF("bg/zhuanshu", var_28_0), var_28_3)
		setActive(arg_28_0:findTF("bg/tedian", var_28_0), var_28_2)
		setActive(arg_28_0:findTF("normal", var_28_0), not var_28_3 and not var_28_2)
		setActive(arg_28_0:findTF("zhuanshu", var_28_0), var_28_3)
		setActive(arg_28_0:findTF("tedian", var_28_0), var_28_2)
		setActive(arg_28_0:findTF("normal/favor", var_28_0), var_28_1.type == 2)
		setActive(arg_28_0:findTF("zhuanshu/favor", var_28_0), var_28_1.type == 2)
		setActive(arg_28_0:findTF("tedian/favor", var_28_0), var_28_1.type == 2)
		setText(arg_28_0:findTF("name", var_28_0), var_28_1.name)

		local var_28_19 = UIItemList.New(arg_28_0:findTF("bubbles/content", var_28_0), arg_28_0:findTF("bubbles/content/tpl", var_28_0))

		arg_28_0:SetBubbles(var_28_19, var_28_5)
		setActive(arg_28_0:findTF("consume", var_28_0), not var_28_4)
		setActive(arg_28_0:findTF("soldOut", var_28_0), var_28_4)

		local var_28_20 = CommonCommodity.New({
			id = var_28_6
		}, Goods.TYPE_SHOPSTREET)
		local var_28_21, var_28_22, var_28_23 = var_28_20:GetPrice()
		local var_28_24 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_28_20:GetResType(),
			count = var_28_21
		})

		setText(arg_28_0:findTF("consume/Text", var_28_0), "<icon name=" .. var_28_20:GetResIcon() .. " w=0.81 h=0.81/>" .. var_28_21)
		GetImageSpriteFromAtlasAsync(var_28_7, "", arg_28_0:findTF("normal/mask/Dorm3dIconTpl/icon", var_28_0))
		GetImageSpriteFromAtlasAsync(var_28_7, "", arg_28_0:findTF("zhuanshu/mask/Dorm3dIconTpl/icon", var_28_0))
		GetImageSpriteFromAtlasAsync(var_28_7, "", arg_28_0:findTF("tedian/mask/Dorm3dIconTpl/icon", var_28_0))

		if not var_28_4 then
			onButton(arg_28_0, var_28_0, function()
				arg_28_0:ClickCommodity(var_28_1)
			end, SFX_PANEL)
		else
			onButton(arg_28_0, var_28_0, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
			end, SFX_PANEL)
		end

		setActive(arg_28_0:findTF("new", var_28_0), var_0_0.ShouldShowCommodtyTip(var_28_1))
	end
end

function var_0_0.SetCharaCard(arg_31_0)
	local var_31_0 = arg_31_0:GetCommoditiesCfgByChara(var_0_4[arg_31_0.selectedId].character[1])
	local var_31_1 = UIItemList.New(arg_31_0:findTF("scroll/Viewport/Content", arg_31_0.charaPage), arg_31_0:findTF("scroll/Viewport/Content/card", arg_31_0.charaPage))
	local var_31_2 = {}

	var_31_1:make(function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_0 == UIItemList.EventInit then
			local var_32_0 = var_31_0[arg_32_1 + 1]

			table.insert(var_31_2, {
				var_32_0.type,
				arg_32_2
			})

			local var_32_1 = arg_31_0:IsCommoditySoldOut(var_32_0)
			local var_32_2 = false
			local var_32_3 = false
			local var_32_4 = ""
			local var_32_5 = {}
			local var_32_6 = 0
			local var_32_7 = var_0_3[var_32_0.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

			if var_32_0.type == 1 then
				local var_32_8 = var_0_6[var_32_0.item_id]

				var_32_3 = var_32_8.is_special == 1
				var_32_2 = not var_32_3 and var_32_8.is_exclusive == 1
				var_32_4 = Drop.New({
					count = 0,
					type = DROP_TYPE_DORM3D_FURNITURE,
					id = var_32_8.id
				}):getIcon()

				setText(arg_32_2:Find("descScroll/Viewport/Content/desc"), var_32_8.desc)
				setText(arg_32_2:Find("countLimit"), var_32_7 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_32_0.item_id) .. "/1")

				var_32_5 = var_32_8.unlock_tips or {}
				var_32_6 = var_32_0.shop_id[1]
			elseif var_32_0.type == 2 then
				local var_32_9 = var_0_5[var_32_0.item_id]

				var_32_2 = var_32_0.room_id ~= 0

				local var_32_10 = Dorm3dGift.New({
					configId = var_32_0.item_id
				})

				var_32_4 = Drop.New({
					type = DROP_TYPE_DORM3D_GIFT,
					id = var_32_0.item_id,
					count = getProxy(ApartmentProxy):getGiftCount(var_32_0.item_id)
				}):getIcon()

				setText(arg_32_2:Find("descScroll/Viewport/Content/desc"), var_32_9.display)

				local var_32_11 = 0

				for iter_32_0 = 1, #var_32_0.shop_id do
					local var_32_12 = var_32_0.shop_id[iter_32_0]
					local var_32_13 = var_0_3[var_32_12]
					local var_32_14 = var_32_13.limit_args[1]

					if not var_32_14 and var_32_13.group_type == 0 then
						var_32_11 = 0
					elseif var_32_14 and (var_32_14[1] == "dailycount" or var_32_14[1] == "count") then
						var_32_11 = var_32_14[3]
					elseif var_32_13.group_type == 2 then
						var_32_11 = var_32_13.group_limit
					end
				end

				setText(arg_32_2:Find("countLimit"), var_32_7 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_32_0.item_id) .. "/" .. var_32_11)
				setText(arg_32_2:Find("favor/number"), "+" .. pg.dorm3d_favor_trigger[var_0_5[var_32_0.item_id].favor_trigger_id].num)

				var_32_5 = var_32_9.unlock_tips or {}
				var_32_6 = var_32_10:GetShopID()
			elseif var_32_0.type == 3 then
				var_32_2 = true

				local var_32_15 = var_0_4[var_32_0.item_id]
				local var_32_16 = var_32_15.invite_icon

				for iter_32_1, iter_32_2 in ipairs(var_32_16) do
					if iter_32_2[1] == var_32_0.room_id then
						var_32_4 = iter_32_2[2]
					end
				end

				setText(arg_32_2:Find("descScroll/Viewport/Content/desc"), var_32_15.room_des)

				local var_32_17 = var_32_1 and 1 or 0

				setText(arg_32_2:Find("countLimit"), var_32_7 .. " " .. var_32_17 .. "/1")

				var_32_6 = var_32_0.shop_id[1]
			end

			setActive(arg_32_2:Find("bg/normal"), not var_32_1)
			setActive(arg_32_2:Find("bg/soldOut"), var_32_1)
			setActive(arg_32_2:Find("normal"), not var_32_2 and not var_32_3)
			setActive(arg_32_2:Find("zhuanshu"), var_32_2)
			setActive(arg_32_2:Find("tedian"), var_32_3)
			GetImageSpriteFromAtlasAsync(var_32_4, "", arg_32_2:Find("mask/Dorm3dIconTpl/icon"))
			setActive(arg_32_2:Find("favor"), var_32_0.type == 2)
			setText(arg_32_2:Find("name"), var_32_0.name)

			local var_32_18 = UIItemList.New(arg_32_2:Find("bubbles/content"), arg_32_2:Find("bubbles/content/tpl"))

			arg_31_0:SetBubbles(var_32_18, var_32_5)

			local var_32_19 = CommonCommodity.New({
				id = var_32_6
			}, Goods.TYPE_SHOPSTREET)
			local var_32_20, var_32_21, var_32_22 = var_32_19:GetPrice()
			local var_32_23 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_32_19:GetResType(),
				count = var_32_20
			})

			setText(arg_32_2:Find("consume/Text"), "<icon name=" .. var_32_19:GetResIcon() .. " w=0.81 h=0.81/>" .. var_32_20)
			setActive(arg_32_2:Find("consume"), not var_32_1)
			setActive(arg_32_2:Find("soldOut"), var_32_1)

			local var_32_24 = var_0_3[var_32_0.shop_id[1]].time

			setActive(arg_32_2:Find("timeLimit"), var_32_24 ~= "always")

			if var_32_24 ~= "always" then
				local var_32_25 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_32_24[2])

				setText(arg_32_2:Find("timeLimit/Text"), arg_31_0:GetTimeRemain(var_32_25))
			end

			if not var_32_1 then
				onButton(arg_31_0, arg_32_2, function()
					arg_31_0:ClickCommodity(var_32_0)
				end, SFX_PANEL)
			else
				onButton(arg_31_0, arg_32_2, function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
				end, SFX_PANEL)
			end

			setActive(arg_32_2:Find("new"), var_0_0.ShouldShowCommodtyTip(var_32_0))
		end
	end)
	var_31_1:align(#var_31_0)

	arg_31_0.filterIndex = 1

	for iter_31_0 = 1, 4 do
		local var_31_3 = arg_31_0:findTF("switch", arg_31_0.charaPage):GetChild(iter_31_0 - 1)

		onToggle(arg_31_0, var_31_3, function(arg_35_0)
			if arg_35_0 then
				arg_31_0.filterIndex = iter_31_0

				if iter_31_0 == 1 then
					for iter_35_0, iter_35_1 in ipairs(var_31_2) do
						setActive(iter_35_1[2], true)
					end
				elseif iter_31_0 == 2 then
					for iter_35_2, iter_35_3 in ipairs(var_31_2) do
						setActive(iter_35_3[2], iter_35_3[1] == 2)
					end
				elseif iter_31_0 == 3 then
					for iter_35_4, iter_35_5 in ipairs(var_31_2) do
						setActive(iter_35_5[2], iter_35_5[1] == 1)
					end
				else
					for iter_35_6, iter_35_7 in ipairs(var_31_2) do
						setActive(iter_35_7[2], iter_35_7[1] == 3)
					end
				end

				for iter_35_8 = 1, 4 do
					local var_35_0 = arg_31_0:findTF("switch", arg_31_0.charaPage):GetChild(iter_35_8 - 1)

					setActive(arg_31_0:findTF("selected", var_35_0), iter_35_8 == iter_31_0)
				end
			end
		end)

		if iter_31_0 == 1 then
			triggerToggle(var_31_3, true)
		end
	end
end

function var_0_0.ClickCommodity(arg_36_0, arg_36_1)
	arg_36_0.showCount = 1

	if arg_36_1.room_id ~= 0 then
		local var_36_0 = 0

		for iter_36_0, iter_36_1 in pairs(var_0_4) do
			if iter_36_1.type == 2 and iter_36_1.character[1] == arg_36_1.room_id then
				var_36_0 = iter_36_1.id
			end
		end

		if not getProxy(ApartmentProxy):getRoom(var_36_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))

			return
		end
	end

	if arg_36_1.type == 1 then
		local var_36_1 = Dorm3dFurniture.New({
			configId = arg_36_1.item_id
		})
		local var_36_2 = CommonCommodity.New({
			id = arg_36_1.shop_id[1]
		}, Goods.TYPE_SHOPSTREET)
		local var_36_3, var_36_4, var_36_5 = var_36_2:GetPrice()
		local var_36_6 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_36_2:GetResType(),
			count = var_36_3
		})

		arg_36_0:emit(Dorm3dShopMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
			content = {
				icon = "<icon name=" .. var_36_2:GetResIcon() .. " w=1.1 h=1.1/>",
				off = var_36_4,
				cost = var_36_6.count,
				old = var_36_5,
				name = arg_36_1.name
			},
			tip = i18n("dorm3d_shop_gift_tip"),
			drop = var_36_1,
			endTime = var_36_1:GetEndTime(),
			onYes = function()
				if not var_36_1:InShopTime() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_purchase_outtime"))

					return
				end

				arg_36_0:emit(GAME.SHOPPING, {
					silentTip = true,
					count = 1,
					shopId = arg_36_1.shop_id[1]
				})
			end
		})
	elseif arg_36_1.type == 2 then
		local var_36_7 = 0

		for iter_36_2 = 1, #arg_36_1.shop_id do
			local var_36_8 = arg_36_1.shop_id[iter_36_2]
			local var_36_9 = var_0_3[var_36_8]
			local var_36_10 = var_36_9.limit_args[1]

			if not var_36_10 and var_36_9.group_type == 0 then
				var_36_7 = 0
			elseif var_36_10 and (var_36_10[1] == "dailycount" or var_36_10[1] == "count") then
				var_36_7 = var_36_10[3]
			elseif var_36_9.group_type == 2 then
				var_36_7 = var_36_9.group_limit
			end
		end

		if var_36_7 > 1 then
			local var_36_11 = 0

			if arg_36_0.selectedId ~= 0 then
				var_36_11 = var_0_4[arg_36_0.selectedId].character[1]
			end

			arg_36_0:emit(Dorm3dShopMediator.OPEN_DETAIL, arg_36_1, var_36_11, function(arg_38_0)
				arg_36_0.showCount = arg_38_0
			end)
		else
			local var_36_12 = Dorm3dGift.New({
				configId = arg_36_1.item_id
			})
			local var_36_13 = CommonCommodity.New({
				id = var_36_12:GetShopID()
			}, Goods.TYPE_SHOPSTREET)
			local var_36_14, var_36_15, var_36_16 = var_36_13:GetPrice()
			local var_36_17 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_36_13:GetResType(),
				count = var_36_14
			})
			local var_36_18
			local var_36_19 = 0

			_.each(var_36_12:getConfig("shop_id"), function(arg_39_0)
				local var_39_0 = var_0_3[arg_39_0]

				if var_39_0.group_type == 2 then
					var_36_19 = math.max(var_39_0.group_limit, var_36_19)
				end
			end)

			if var_36_19 > 0 then
				var_36_18 = {
					getProxy(ApartmentProxy):GetGiftShopCount(var_36_12:GetConfigID()),
					var_36_19
				}
			end

			arg_36_0:emit(Dorm3dShopMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
				content = {
					icon = "<icon name=" .. var_36_13:GetResIcon() .. " w=1.1 h=1.1/>",
					off = var_36_15,
					cost = var_36_17.count,
					old = var_36_16,
					name = arg_36_1.name,
					weekLimit = var_36_18
				},
				tip = i18n("dorm3d_shop_gift_tip"),
				drop = var_36_12,
				groupId = arg_36_1.room_id,
				onYes = function()
					arg_36_0:emit(GAME.SHOPPING, {
						silentTip = true,
						count = 1,
						shopId = var_36_12:GetShopID()
					})
				end
			})
		end
	elseif arg_36_1.type == 3 then
		local var_36_20
		local var_36_21 = getProxy(ApartmentProxy):getRoom(arg_36_1.item_id)

		if not var_36_21 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))

			return
		end

		if not var_36_21.unlockCharacter[arg_36_1.room_id] then
			var_36_20 = "lock"
		elseif not getProxy(ApartmentProxy):getApartment(arg_36_1.room_id) then
			var_36_20 = "room"
		elseif Apartment.New({
			ship_group = arg_36_1.room_id
		}):needDownload() then
			var_36_20 = "download"
		end

		if var_36_20 == "lock" then
			arg_36_0:emit(Dorm3dShopMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_36_1.item_id, arg_36_1.room_id)
		elseif var_36_20 == "room" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))
		elseif var_36_20 == "download" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_beach_tip"))
		end
	end
end

function var_0_0.SetBubbles(arg_41_0, arg_41_1, arg_41_2)
	arg_41_1:make(function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_0 == UIItemList.EventInit then
			local var_42_0 = arg_42_1 + 1
			local var_42_1 = arg_41_2[var_42_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_42_1, arg_42_2:Find("icon/icon"), true)
			setText(arg_42_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_42_1))
			setActive(arg_42_2:Find("bubble"), false)
			onToggle(arg_41_0, arg_42_2, function(arg_43_0)
				setActive(arg_42_2:Find("icon/select"), arg_43_0)
				setActive(arg_42_2:Find("icon/unselect"), not arg_43_0)
				setActive(arg_42_2:Find("bubble"), arg_43_0)
				setActive(arg_41_0.mask, arg_43_0)
				onButton(arg_41_0, arg_41_0.mask, function()
					triggerToggle(arg_42_2, false)
				end, SFX_PANEL)
			end)
		end
	end)
	arg_41_1:align(#arg_41_2)
end

function var_0_0.GetTimeRemain(arg_45_0, arg_45_1)
	local var_45_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_45_1 = math.max(arg_45_1 - var_45_0, 0)
	local var_45_2 = math.floor(var_45_1 / 86400)

	if var_45_2 > 0 then
		return var_45_2 .. i18n("word_date")
	else
		local var_45_3 = math.floor(var_45_1 / 3600)

		if var_45_3 > 0 then
			return var_45_3 .. i18n("word_hour")
		else
			local var_45_4 = math.floor(var_45_1 / 60)

			if var_45_4 > 0 then
				return var_45_4 .. i18n("word_minute")
			else
				return var_45_1 .. i18n("word_second")
			end
		end
	end
end

function var_0_0.ShouldShowCommodtyTip(arg_46_0)
	if arg_46_0.type == 1 then
		return Dorm3dFurniture.GetViewedFlag(arg_46_0.item_id) == 0
	elseif arg_46_0.type == 2 then
		local var_46_0 = getProxy(PlayerProxy):getRawData().id
		local var_46_1 = Dorm3dGift.GetViewedFlag(arg_46_0.item_id) == 0
		local var_46_2 = var_0_3[arg_46_0.shop_id[1]].group ~= 0 and PlayerPrefs.GetInt(var_46_0 .. "_dorm3dGiftWeekViewed_" .. arg_46_0.item_id, 0) == 0

		return var_46_1 or var_46_2
	end

	return false
end

function var_0_0.ShouldShowSumTip(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0) do
		if var_0_0.ShouldShowCommodtyTip(iter_47_1) then
			return true
		end
	end

	return false
end

function var_0_0.ShouldShowAllTip()
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in ipairs(var_0_2.all) do
		local var_48_1 = var_0_2[iter_48_1]
		local var_48_2 = false
		local var_48_3 = var_48_1.shop_id

		for iter_48_2, iter_48_3 in ipairs(var_48_3) do
			local var_48_4 = var_0_3[iter_48_3]

			if not pg.TimeMgr.GetInstance():inTime(var_48_4.time) then
				var_48_2 = true

				break
			end
		end

		if not var_48_2 then
			table.insert(var_48_0, var_48_1)
		end
	end

	return var_0_0.ShouldShowSumTip(var_48_0)
end

function var_0_0.UpdateCommodtyTip(arg_49_0)
	if arg_49_0.type == 1 then
		Dorm3dFurniture.SetViewedFlag(arg_49_0.item_id)
	elseif arg_49_0.type == 2 then
		Dorm3dGift.SetViewedFlag(arg_49_0.item_id)

		if var_0_3[arg_49_0.shop_id[1]].group ~= 0 then
			local var_49_0 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt(var_49_0 .. "_dorm3dGiftWeekViewed_" .. arg_49_0.item_id, 1)
		end
	end
end

function var_0_0.UpdateSumTip(arg_50_0)
	for iter_50_0, iter_50_1 in ipairs(arg_50_0) do
		var_0_0.UpdateCommodtyTip(iter_50_1)
	end
end

function var_0_0.willExit(arg_51_0)
	arg_51_0.scrollSnap:Dispose()

	arg_51_0.scrollSnap = nil
end

function var_0_0.onBackPressed(arg_52_0)
	arg_52_0:closeView()
end

return var_0_0

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

function var_0_0.getResource(arg_3_0)
	local var_3_0 = {
		"weaponframes",
		"ui/shoptip_atlas"
	}

	local function var_3_1(arg_4_0)
		if noEmptyStr(arg_4_0) and not table.contains(var_3_0, arg_4_0) then
			table.insert(var_3_0, arg_4_0)
		end
	end

	local function var_3_2(arg_5_0, arg_5_1)
		if arg_5_1 then
			local var_5_0 = Drop.New({
				count = 0,
				type = arg_5_0,
				id = arg_5_1
			})

			var_3_1(var_5_0:getIcon())
		end
	end

	for iter_3_0, iter_3_1 in ipairs(var_0_4.all or {}) do
		local var_3_3 = var_0_4[iter_3_1]

		if var_3_3 and var_3_3.type == 2 and noEmptyStr(var_3_3.assets_prefix) then
			var_3_1("dorm3dselect/room_icon_" .. string.lower(var_3_3.assets_prefix))
		end
	end

	for iter_3_2, iter_3_3 in ipairs(var_0_2.all or {}) do
		local var_3_4 = var_0_2[iter_3_3]

		if var_3_4 then
			local var_3_5 = var_3_4.banners and var_3_4.banners[1]

			if noEmptyStr(var_3_5) then
				var_3_1("dorm3dbanner/" .. var_3_5 .. "_shopCard1")
				var_3_1("dorm3dbanner/" .. var_3_5 .. "_shopCard2")
			end

			if var_3_4.type == 1 then
				var_3_2(DROP_TYPE_DORM3D_FURNITURE, var_3_4.item_id)

				local var_3_6 = var_0_6[var_3_4.item_id]

				if var_3_6 and #(var_3_6.unlock_tips or {}) > 0 then
					var_3_1("ui/shoptip_atlas")
				end
			elseif var_3_4.type == 2 then
				var_3_2(DROP_TYPE_DORM3D_GIFT, var_3_4.item_id)

				local var_3_7 = var_0_5[var_3_4.item_id]

				if var_3_7 and #(var_3_7.unlock_tips or {}) > 0 then
					var_3_1("ui/shoptip_atlas")
				end
			elseif var_3_4.type == 3 then
				local var_3_8 = var_0_4[var_3_4.item_id]

				for iter_3_4, iter_3_5 in ipairs(var_3_8 and var_3_8.invite_icon or {}) do
					var_3_1(iter_3_5[2])
				end
			end
		end
	end

	return table.insertto(var_3_0, var_0_0.super.getResource(arg_3_0))
end

function var_0_0.init(arg_6_0)
	arg_6_0.closeBtn = arg_6_0.rtAdapt:Find("closeBtn")
	arg_6_0.res = arg_6_0.rtAdapt:Find("resourceBg/res")
	arg_6_0.recommendationTg = arg_6_0.rtAdapt:Find("left/recommendation")
	arg_6_0.charaList = UIItemList.New(arg_6_0.rtAdapt:Find("left/charaScroll/mask/list"), arg_6_0.rtAdapt:Find("left/charaScroll/mask/list/tpl"))
	arg_6_0.recommendationPage = arg_6_0.rtAdapt:Find("pages/recommendationPage")
	arg_6_0.charaPage = arg_6_0.rtAdapt:Find("pages/charaPage")
	arg_6_0.mask = arg_6_0._tf:Find("mask")

	setText(arg_6_0.rtAdapt:Find("title/Text"), i18n("dorm3d_shop_title"))
	setText(arg_6_0.recommendationPage:Find("bannerCard/mask/content/item/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_6_0.recommendationPage:Find("giftCard/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_6_0.recommendationPage:Find("card1/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_6_0.recommendationPage:Find("card2/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_6_0.recommendationPage:Find("card3/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_6_0.charaPage:Find("scroll/Viewport/Content/card/soldOut"), i18n("dorm3d_shop_sold_out"))
	setText(arg_6_0.charaPage:Find("switch/all/Text"), i18n("dorm3d_shop_all"))
	setText(arg_6_0.charaPage:Find("switch/gift/Text"), i18n("dorm3d_shop_gift1"))
	setText(arg_6_0.charaPage:Find("switch/furniture/Text"), i18n("dorm3d_shop_furniture"))
	setText(arg_6_0.charaPage:Find("switch/others/Text"), i18n("dorm3d_shop_others"))
	setText(arg_6_0.charaPage:Find("switch/all/selected/Text"), i18n("dorm3d_shop_all"))
	setText(arg_6_0.charaPage:Find("switch/gift/selected/Text"), i18n("dorm3d_shop_gift1"))
	setText(arg_6_0.charaPage:Find("switch/furniture/selected/Text"), i18n("dorm3d_shop_furniture"))
	setText(arg_6_0.charaPage:Find("switch/others/selected/Text"), i18n("dorm3d_shop_others"))
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:InitData()
	onButton(arg_7_0, arg_7_0.closeBtn, function()
		arg_7_0:closeView()
	end, SFX_PANEL)
	arg_7_0:ShowResUI()
	arg_7_0:SetPageBtns()
	triggerToggle(arg_7_0.recommendationTg, true)
end

function var_0_0.InitData(arg_9_0)
	arg_9_0.bannerCount = var_0_1.drom3d_shop_product_panel_num.key_value_int
	arg_9_0.allCommodityCfgs = {}

	for iter_9_0, iter_9_1 in ipairs(var_0_2.all) do
		table.insert(arg_9_0.allCommodityCfgs, var_0_2[iter_9_1])
	end

	table.sort(arg_9_0.allCommodityCfgs, function(arg_10_0, arg_10_1)
		if tonumber(arg_10_0.order) ~= tonumber(arg_10_1.order) then
			return tonumber(arg_10_0.order) < tonumber(arg_10_1.order)
		end

		return arg_10_0.id > arg_10_1.id
	end)

	arg_9_0.roomCfgs = {}

	_.each(var_0_4.all, function(arg_11_0)
		if var_0_4[arg_11_0].type == 2 then
			table.insert(arg_9_0.roomCfgs, var_0_4[arg_11_0])
		end
	end)
	table.sort(arg_9_0.roomCfgs, function(arg_12_0, arg_12_1)
		return arg_12_0.id < arg_12_1.id
	end)

	arg_9_0.selectedId = 0
end

function var_0_0.SetPageBtns(arg_13_0)
	SetParent(arg_13_0.recommendationTg, arg_13_0.rtAdapt:Find("left"), false)
	arg_13_0.charaList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_13_0.roomCfgs[arg_14_1 + 1]
			local var_14_1 = string.format("dorm3dselect/room_icon_%s", string.lower(var_14_0.assets_prefix))

			GetImageSpriteFromAtlasAsync(var_14_1, "", arg_14_2:Find("mask/icon"), false)

			local var_14_2 = arg_13_0:GetCommoditiesCfgByChara(var_14_0.character[1])

			setActive(arg_14_2:Find("tip"), var_0_0.ShouldShowSumTip(var_14_2))
			onToggle(arg_13_0, arg_14_2, function(arg_15_0)
				if arg_15_0 then
					arg_13_0.selectedId = var_14_0.id

					arg_13_0:SetPageBtns()
					arg_13_0:RefreshPage()
				end
			end)
		end
	end)
	arg_13_0.charaList:align(#arg_13_0.roomCfgs)

	arg_13_0.showingCommoditiesIndex = {}

	local var_13_0 = {}

	table.insertto(var_13_0, arg_13_0:GetCommoditiesCfgByPanel(1, arg_13_0.bannerCount))
	table.insertto(var_13_0, arg_13_0:GetCommoditiesCfgByPanel(2, 1))
	table.insertto(var_13_0, arg_13_0:GetCommoditiesCfgByPanel(3, 1))
	table.insertto(var_13_0, arg_13_0:GetCommoditiesCfgByPanel(4, 1))
	table.insertto(var_13_0, arg_13_0:GetCommoditiesCfgByPanel(5, 1))
	setActive(arg_13_0.recommendationTg:Find("icon/tip"), var_0_0.ShouldShowSumTip(var_13_0))
	onToggle(arg_13_0, arg_13_0.recommendationTg, function(arg_16_0)
		if arg_16_0 then
			arg_13_0.selectedId = 0

			arg_13_0:SetPageBtns()
			arg_13_0:RefreshPage()
		end
	end)
	SetParent(arg_13_0.recommendationTg, arg_13_0.rtAdapt:Find("left/charaScroll/mask/list"), false)
	arg_13_0.recommendationTg:SetSiblingIndex(0)
end

function var_0_0.GetCommoditiesCfgByPanel(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}
	local var_17_1 = 0

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.allCommodityCfgs) do
		if not table.contains(arg_17_0.showingCommoditiesIndex, iter_17_0) and table.contains(iter_17_1.panel, arg_17_1) then
			if not (arg_17_0:IsCommodityOutOfDate(iter_17_1) or arg_17_0:IsCommoditySoldOut(iter_17_1)) then
				var_17_1 = var_17_1 + 1

				table.insert(var_17_0, iter_17_1)
				table.insert(arg_17_0.showingCommoditiesIndex, iter_17_0)
			end

			if var_17_1 == arg_17_2 then
				break
			end
		end
	end

	if var_17_1 < arg_17_2 then
		for iter_17_2, iter_17_3 in ipairs(arg_17_0.allCommodityCfgs) do
			if not table.contains(arg_17_0.showingCommoditiesIndex, iter_17_2) and table.contains(iter_17_3.panel, arg_17_1) then
				if not arg_17_0:IsCommodityOutOfDate(iter_17_3) then
					var_17_1 = var_17_1 + 1

					table.insert(var_17_0, iter_17_3)
					table.insert(arg_17_0.showingCommoditiesIndex, iter_17_2)
				end

				if var_17_1 == arg_17_2 then
					break
				end
			end
		end
	end

	return var_17_0
end

function var_0_0.GetCommoditiesCfgByChara(arg_18_0, arg_18_1)
	local var_18_0 = {}
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.allCommodityCfgs) do
		local var_18_2 = {}

		if iter_18_1.realroom_id ~= 0 then
			table.insertto(var_18_2, var_0_4[iter_18_1.realroom_id].character)
			table.insertto(var_18_2, var_0_4[iter_18_1.realroom_id].character_pay)
		end

		if (iter_18_1.room_id == arg_18_1 or iter_18_1.room_id == 0) and (iter_18_1.realroom_id == 0 or iter_18_1.realroom_id ~= 0 and table.contains(var_18_2, arg_18_1)) then
			local var_18_3 = arg_18_0:IsCommodityOutOfDate(iter_18_1)
			local var_18_4 = arg_18_0:IsCommoditySoldOut(iter_18_1)

			if not var_18_3 then
				if not var_18_4 then
					table.insert(var_18_0, iter_18_1)
				else
					table.insert(var_18_1, iter_18_1)
				end
			end
		end
	end

	if #var_18_1 > 0 then
		table.insertto(var_18_0, var_18_1)
	end

	return var_18_0
end

function var_0_0.IsCommodityOutOfDate(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1.shop_id

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		local var_19_1 = var_0_3[iter_19_1]

		if not pg.TimeMgr.GetInstance():inTime(var_19_1.time) then
			return true
		end
	end

	return false
end

function var_0_0.IsCommoditySoldOut(arg_20_0, arg_20_1)
	if arg_20_1.type == 1 then
		if getProxy(ApartmentProxy):GetFurnitureShopCount(arg_20_1.item_id) > 0 then
			return true
		end
	elseif arg_20_1.type == 2 then
		return not Dorm3dGift.New({
			configId = arg_20_1.item_id
		}):CheckBuyLimit()
	elseif arg_20_1.type == 3 then
		local var_20_0 = getProxy(ApartmentProxy):getRoom(arg_20_1.item_id)

		return var_20_0 and var_20_0.unlockCharacter[arg_20_1.room_id]
	end

	return false
end

function var_0_0.ShowResUI(arg_21_0)
	local var_21_0 = getProxy(PlayerProxy):getRawData()

	arg_21_0.goldMax = arg_21_0.res:Find("gold/max"):GetComponent(typeof(Text))
	arg_21_0.goldValue = arg_21_0.res:Find("gold/Text"):GetComponent(typeof(Text))
	arg_21_0.oilMax = arg_21_0.res:Find("oil/max"):GetComponent(typeof(Text))
	arg_21_0.oilValue = arg_21_0.res:Find("oil/Text"):GetComponent(typeof(Text))
	arg_21_0.gemValue = arg_21_0.res:Find("gem/Text"):GetComponent(typeof(Text))

	PlayerResUI.StaticFlush(var_21_0, arg_21_0.goldMax, arg_21_0.goldValue, arg_21_0.oilMax, arg_21_0.oilValue, arg_21_0.gemValue)
	onButton(arg_21_0, arg_21_0.res:Find("gold"), function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.res:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.res:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.RefreshPage(arg_25_0)
	arg_25_0.showingCommoditiesIndex = {}

	setActive(arg_25_0.recommendationPage, arg_25_0.selectedId == 0)
	setActive(arg_25_0.charaPage, arg_25_0.selectedId ~= 0)

	if arg_25_0.selectedId == 0 then
		arg_25_0:SetBannnerCard()
		arg_25_0:SetGiftCard()
		arg_25_0:SetNormalCard()
	else
		arg_25_0:SetCharaCard()
	end
end

function var_0_0.SetBannnerCard(arg_26_0)
	local var_26_0 = arg_26_0.recommendationPage:Find("bannerCard")
	local var_26_1 = arg_26_0:GetCommoditiesCfgByPanel(1, arg_26_0.bannerCount)

	if not arg_26_0.scrollSnap then
		arg_26_0.scrollSnap = BannerScrollRectDorm3dShop.New(var_26_0:Find("mask/content"), var_26_0:Find("dots"))
	end

	for iter_26_0, iter_26_1 in ipairs(var_26_1) do
		local var_26_2 = arg_26_0.scrollSnap:GetItemChild(iter_26_0) or arg_26_0.scrollSnap:AddChild()
		local var_26_3 = arg_26_0:IsCommoditySoldOut(iter_26_1)
		local var_26_4 = false
		local var_26_5 = false
		local var_26_6 = {}
		local var_26_7 = 0
		local var_26_8 = ""
		local var_26_9 = ""
		local var_26_10 = var_0_3[iter_26_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

		if iter_26_1.type == 1 then
			local var_26_11 = var_0_6[iter_26_1.item_id]

			var_26_5 = var_26_11.is_special == 1
			var_26_4 = not var_26_5 and var_26_11.is_exclusive == 1
			var_26_8 = Drop.New({
				count = 0,
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_26_11.id
			}):getIcon()
			var_26_9 = var_26_10 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(iter_26_1.item_id) .. "/1"
			var_26_6 = var_26_11.unlock_tips or {}
			var_26_7 = iter_26_1.shop_id[1]
		elseif iter_26_1.type == 2 then
			local var_26_12 = var_0_5[iter_26_1.item_id]

			var_26_4 = iter_26_1.room_id ~= 0

			local var_26_13 = Dorm3dGift.New({
				configId = iter_26_1.item_id
			})

			var_26_8 = Drop.New({
				type = DROP_TYPE_DORM3D_GIFT,
				id = iter_26_1.item_id,
				count = getProxy(ApartmentProxy):getGiftCount(iter_26_1.item_id)
			}):getIcon()

			local var_26_14 = 0

			for iter_26_2 = 1, #iter_26_1.shop_id do
				local var_26_15 = iter_26_1.shop_id[iter_26_2]
				local var_26_16 = var_0_3[var_26_15]
				local var_26_17 = var_26_16.limit_args[1]

				if not var_26_17 and var_26_16.group_type == 0 then
					var_26_14 = 0
				elseif var_26_17 and (var_26_17[1] == "dailycount" or var_26_17[1] == "count") then
					var_26_14 = var_26_17[3]
				elseif var_26_16.group_type == 2 then
					var_26_14 = var_26_16.group_limit
				end
			end

			var_26_9 = var_26_10 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(iter_26_1.item_id) .. "/" .. var_26_14

			setText(var_26_2:Find("favor/number"), "+" .. pg.dorm3d_favor_trigger[var_0_5[iter_26_1.item_id].favor_trigger_id].num)

			var_26_2:Find("favor"):GetComponent(typeof(CanvasGroup)).alpha = var_26_3 and 0.5 or 1
			var_26_6 = var_26_12.unlock_tips or {}
			var_26_7 = var_26_13:GetShopID()
		elseif iter_26_1.type == 3 then
			var_26_4 = true

			local var_26_18 = var_0_4[iter_26_1.item_id].invite_icon

			for iter_26_3, iter_26_4 in ipairs(var_26_18) do
				if iter_26_4[1] == iter_26_1.room_id then
					var_26_8 = iter_26_4[2]
				end
			end

			local var_26_19 = var_26_3 and 1 or 0

			var_26_9 = var_26_10 .. " " .. var_26_19 .. "/1"
			var_26_7 = iter_26_1.shop_id[1]
		end

		setActive(var_26_2:Find("bg/normal"), not var_26_4 and not var_26_5)
		setActive(var_26_2:Find("bg/zhuanshu"), var_26_4)
		setActive(var_26_2:Find("bg/tedian"), var_26_5)
		setActive(var_26_2:Find("normal"), not var_26_4 and not var_26_5)
		setActive(var_26_2:Find("zhuanshu"), var_26_4)
		setActive(var_26_2:Find("tedian"), var_26_5)
		setActive(var_26_2:Find("favor"), iter_26_1.type == 2)
		LoadImageSpriteAsync("dorm3dbanner/" .. iter_26_1.banners[1] .. "_shopCard1", var_26_2:Find("bannerMask/banner"), true)
		setText(var_26_2:Find("name"), iter_26_1.name)

		local var_26_20 = var_0_3[iter_26_1.shop_id[1]].time

		setActive(var_26_2:Find("timeLimit"), var_26_20 ~= "always")

		if var_26_20 ~= "always" then
			local var_26_21 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_26_20[2])

			setText(var_26_2:Find("timeLimit/Text"), arg_26_0:GetTimeRemain(var_26_21))
		end

		local var_26_22 = UIItemList.New(var_26_2:Find("bubbles/content"), var_26_2:Find("bubbles/content/tpl"))

		arg_26_0:SetBubbles(var_26_22, var_26_6)
		setActive(var_26_2:Find("consume"), not var_26_3)
		setActive(var_26_2:Find("soldOut"), var_26_3)

		local var_26_23 = CommonCommodity.New({
			id = var_26_7
		}, Goods.TYPE_SHOPSTREET)
		local var_26_24, var_26_25, var_26_26 = var_26_23:GetPrice()
		local var_26_27 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_26_23:GetResType(),
			count = var_26_24
		})

		setText(var_26_2:Find("consume/Text"), "<icon name=" .. var_26_23:GetResIcon() .. " w=0.81 h=0.81/>" .. var_26_24)
		GetImageSpriteFromAtlasAsync(var_26_8, "", var_26_2:Find("normal/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_26_8, "", var_26_2:Find("zhuanshu/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_26_8, "", var_26_2:Find("tedian/Dorm3dIconTpl/icon"))
		setText(var_26_2:Find("normal/countLimit"), var_26_9)
		setText(var_26_2:Find("zhuanshu/countLimit"), var_26_9)
		setText(var_26_2:Find("tedian/countLimit"), var_26_9)

		var_26_2:Find("normal/Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_26_3 and 0.5 or 1
		var_26_2:Find("zhuanshu/Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_26_3 and 0.5 or 1
		var_26_2:Find("tedian/Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_26_3 and 0.5 or 1

		if not var_26_3 then
			onButton(arg_26_0, var_26_2, function()
				arg_26_0:ClickCommodity(iter_26_1, var_26_2:Find("tip"))
			end, SFX_PANEL)
		else
			onButton(arg_26_0, var_26_2, function()
				var_0_0.UpdateCommodtyTip(iter_26_1)
				setActive(var_26_2:Find("tip"), false)
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
			end, SFX_PANEL)
		end

		local var_26_28 = var_0_0.ShouldShowCommodtyTip(iter_26_1)

		setActive(var_26_2:Find("new"), var_26_28)
		setActive(var_26_2:Find("tip"), var_26_28)
	end

	arg_26_0.scrollSnap:SetUp()
end

function var_0_0.SetGiftCard(arg_29_0)
	local var_29_0 = arg_29_0.recommendationPage:Find("giftCard")
	local var_29_1 = arg_29_0:GetCommoditiesCfgByPanel(2, 1)[1]
	local var_29_2 = 0
	local var_29_3 = arg_29_0:IsCommoditySoldOut(var_29_1)
	local var_29_4 = ""
	local var_29_5 = false
	local var_29_6 = false
	local var_29_7 = var_0_3[var_29_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

	if var_29_1.type == 1 then
		local var_29_8 = var_0_6[var_29_1.item_id]

		var_29_6 = var_29_8.is_special == 1
		var_29_5 = not var_29_6 and var_29_8.is_exclusive == 1

		local var_29_9 = Drop.New({
			count = 0,
			type = DROP_TYPE_DORM3D_FURNITURE,
			id = var_29_8.id
		})

		updateCustomDrop(var_29_0:Find("Dorm3dIconTpl"), var_29_9)

		var_29_2 = var_29_1.shop_id[1]
		var_29_4 = var_29_7 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_29_1.item_id) .. "/1"
	elseif var_29_1.type == 2 then
		local var_29_10 = var_0_5[var_29_1.item_id]

		var_29_5 = var_29_1.room_id ~= 0

		local var_29_11 = Dorm3dGift.New({
			configId = var_29_1.item_id
		})
		local var_29_12 = Drop.New({
			type = DROP_TYPE_DORM3D_GIFT,
			id = var_29_1.item_id,
			count = getProxy(ApartmentProxy):getGiftCount(var_29_1.item_id)
		})

		setText(var_29_0:Find("favor/number"), "+" .. pg.dorm3d_favor_trigger[var_0_5[var_29_1.item_id].favor_trigger_id].num)
		updateCustomDrop(var_29_0:Find("Dorm3dIconTpl"), var_29_12)

		var_29_2 = var_29_11:GetShopID()

		local var_29_13 = 0

		for iter_29_0 = 1, #var_29_1.shop_id do
			local var_29_14 = var_29_1.shop_id[iter_29_0]
			local var_29_15 = var_0_3[var_29_14]
			local var_29_16 = var_29_15.limit_args[1]

			if not var_29_16 and var_29_15.group_type == 0 then
				var_29_13 = 0
			elseif var_29_16 and (var_29_16[1] == "dailycount" or var_29_16[1] == "count") then
				var_29_13 = var_29_16[3]
			elseif var_29_15.group_type == 2 then
				var_29_13 = var_29_15.group_limit
			end
		end

		var_29_4 = var_29_7 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_29_1.item_id) .. "/" .. var_29_13
	elseif var_29_1.type == 3 then
		var_29_5 = true

		local var_29_17 = var_0_4[var_29_1.item_id].invite_icon
		local var_29_18 = ""

		for iter_29_1, iter_29_2 in ipairs(var_29_17) do
			if iter_29_2[1] == var_29_1.room_id then
				var_29_18 = iter_29_2[2]
			end
		end

		GetImageSpriteFromAtlasAsync(var_29_18, "", var_29_0:Find("Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_29_1.rarity), var_29_0:Find("Dorm3dIconTpl"))

		local var_29_19 = var_29_3 and 1 or 0

		var_29_4 = var_29_7 .. " " .. var_29_19 .. "/1"
		var_29_2 = var_29_1.shop_id[1]
	end

	var_29_0:Find("Dorm3dIconTpl"):GetComponent(typeof(CanvasGroup)).alpha = var_29_3 and 0.5 or 1
	var_29_0:Find("favor"):GetComponent(typeof(CanvasGroup)).alpha = var_29_3 and 0.5 or 1

	setActive(var_29_0:Find("bg/normal"), not var_29_5 and not var_29_6)
	setActive(var_29_0:Find("bg/zhuanshu"), var_29_5)
	setActive(var_29_0:Find("bg/tedian"), var_29_6)
	setActive(var_29_0:Find("normal"), not var_29_5 and not var_29_6)
	setActive(var_29_0:Find("zhuanshu"), var_29_5)
	setActive(var_29_0:Find("tedian"), var_29_6)
	setText(var_29_0:Find("normal/countLimit"), var_29_4)
	setText(var_29_0:Find("zhuanshu/countLimit"), var_29_4)
	setText(var_29_0:Find("tedian/countLimit"), var_29_4)
	LoadImageSpriteAsync("dorm3dbanner/" .. var_29_1.banners[1] .. "_shopCard2", var_29_0:Find("mask/item"), true)
	setScrollText(var_29_0:Find("name/text"), var_29_1.name)
	setActive(var_29_0:Find("favor"), var_29_1.type == 2)
	setActive(var_29_0:Find("consume"), not var_29_3)
	setActive(var_29_0:Find("soldOut"), var_29_3)

	local var_29_20 = var_0_3[var_29_1.shop_id[1]].time

	setActive(var_29_0:Find("timeLimit"), var_29_20 ~= "always")

	if var_29_20 ~= "always" then
		local var_29_21 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_29_20[2])

		setText(var_29_0:Find("timeLimit/Text"), arg_29_0:GetTimeRemain(var_29_21))
	end

	local var_29_22 = CommonCommodity.New({
		id = var_29_2
	}, Goods.TYPE_SHOPSTREET)
	local var_29_23, var_29_24, var_29_25 = var_29_22:GetPrice()
	local var_29_26 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_29_22:GetResType(),
		count = var_29_23
	})

	setText(var_29_0:Find("consume/Text"), "<icon name=" .. var_29_22:GetResIcon() .. " w=0.81 h=0.81/>" .. var_29_23)

	if not var_29_3 then
		onButton(arg_29_0, var_29_0, function()
			arg_29_0:ClickCommodity(var_29_1, var_29_0:Find("tip"))
		end, SFX_PANEL)
	else
		onButton(arg_29_0, var_29_0, function()
			var_0_0.UpdateCommodtyTip(var_29_1)
			setActive(var_29_0:Find("tip"), false)
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
		end, SFX_PANEL)
	end

	local var_29_27 = var_0_0.ShouldShowCommodtyTip(var_29_1)

	setActive(var_29_0:Find("new"), var_29_27)
	setActive(var_29_0:Find("tip"), var_29_27)
end

function var_0_0.SetNormalCard(arg_32_0)
	for iter_32_0 = 1, 3 do
		local var_32_0 = arg_32_0.recommendationPage:Find("card" .. iter_32_0)
		local var_32_1 = arg_32_0:GetCommoditiesCfgByPanel(iter_32_0 + 2, 1)[1]
		local var_32_2 = false
		local var_32_3 = false
		local var_32_4 = arg_32_0:IsCommoditySoldOut(var_32_1)
		local var_32_5 = {}
		local var_32_6 = 0
		local var_32_7 = ""
		local var_32_8 = var_0_3[var_32_1.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

		if var_32_1.type == 1 then
			local var_32_9 = var_0_6[var_32_1.item_id]

			var_32_2 = var_32_9.is_special == 1
			var_32_3 = not var_32_2 and var_32_9.is_exclusive == 1
			var_32_7 = Drop.New({
				count = 0,
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_32_9.id
			}):getIcon()

			setText(var_32_0:Find("countLimit/Text"), var_32_8 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_32_1.item_id) .. "/1")

			var_32_5 = var_32_9.unlock_tips or {}
			var_32_6 = var_32_1.shop_id[1]
		elseif var_32_1.type == 2 then
			local var_32_10 = var_0_5[var_32_1.item_id]

			var_32_3 = var_32_1.room_id ~= 0

			local var_32_11 = Dorm3dGift.New({
				configId = var_32_1.item_id
			})

			var_32_7 = Drop.New({
				type = DROP_TYPE_DORM3D_GIFT,
				id = var_32_1.item_id,
				count = getProxy(ApartmentProxy):getGiftCount(var_32_1.item_id)
			}):getIcon()

			local var_32_12 = 0

			for iter_32_1 = 1, #var_32_1.shop_id do
				local var_32_13 = var_32_1.shop_id[iter_32_1]
				local var_32_14 = var_0_3[var_32_13]
				local var_32_15 = var_32_14.limit_args[1]

				if not var_32_15 and var_32_14.group_type == 0 then
					var_32_12 = 0
				elseif var_32_15 and (var_32_15[1] == "dailycount" or var_32_15[1] == "count") then
					var_32_12 = var_32_15[3]
				elseif var_32_14.group_type == 2 then
					var_32_12 = var_32_14.group_limit
				end
			end

			setText(var_32_0:Find("countLimit/Text"), var_32_8 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_32_1.item_id) .. "/" .. var_32_12)

			local var_32_16 = pg.dorm3d_favor_trigger[var_0_5[var_32_1.item_id].favor_trigger_id].num

			setText(var_32_0:Find("normal/favor/number"), "+" .. var_32_16)
			setText(var_32_0:Find("zhuanshu/favor/number"), "+" .. var_32_16)
			setText(var_32_0:Find("tedian/favor/number"), "+" .. var_32_16)

			var_32_5 = var_32_10.unlock_tips or {}
			var_32_6 = var_32_11:GetShopID()
		elseif var_32_1.type == 3 then
			var_32_3 = true

			local var_32_17 = var_0_4[var_32_1.item_id].invite_icon

			for iter_32_2, iter_32_3 in ipairs(var_32_17) do
				if iter_32_3[1] == var_32_1.room_id then
					var_32_7 = iter_32_3[2]
				end
			end

			local var_32_18 = var_32_4 and 1 or 0

			setText(var_32_0:Find("countLimit/Text"), var_32_8 .. " " .. var_32_18 .. "/1")

			var_32_6 = var_32_1.shop_id[1]
		end

		setActive(var_32_0:Find("bg/normal"), not var_32_3 and not var_32_2)
		setActive(var_32_0:Find("bg/zhuanshu"), var_32_3)
		setActive(var_32_0:Find("bg/tedian"), var_32_2)
		setActive(var_32_0:Find("normal"), not var_32_3 and not var_32_2)
		setActive(var_32_0:Find("zhuanshu"), var_32_3)
		setActive(var_32_0:Find("tedian"), var_32_2)
		setActive(var_32_0:Find("normal/favor"), var_32_1.type == 2)
		setActive(var_32_0:Find("zhuanshu/favor"), var_32_1.type == 2)
		setActive(var_32_0:Find("tedian/favor"), var_32_1.type == 2)
		setText(var_32_0:Find("name"), var_32_1.name)

		local var_32_19 = UIItemList.New(var_32_0:Find("bubbles/content"), var_32_0:Find("bubbles/content/tpl"))

		arg_32_0:SetBubbles(var_32_19, var_32_5)
		setActive(var_32_0:Find("consume"), not var_32_4)
		setActive(var_32_0:Find("soldOut"), var_32_4)

		local var_32_20 = CommonCommodity.New({
			id = var_32_6
		}, Goods.TYPE_SHOPSTREET)
		local var_32_21, var_32_22, var_32_23 = var_32_20:GetPrice()
		local var_32_24 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_32_20:GetResType(),
			count = var_32_21
		})

		setText(var_32_0:Find("consume/Text"), "<icon name=" .. var_32_20:GetResIcon() .. " w=0.81 h=0.81/>" .. var_32_21)
		GetImageSpriteFromAtlasAsync(var_32_7, "", var_32_0:Find("normal/mask/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_32_7, "", var_32_0:Find("zhuanshu/mask/Dorm3dIconTpl/icon"))
		GetImageSpriteFromAtlasAsync(var_32_7, "", var_32_0:Find("tedian/mask/Dorm3dIconTpl/icon"))

		if not var_32_4 then
			onButton(arg_32_0, var_32_0, function()
				arg_32_0:ClickCommodity(var_32_1, var_32_0:Find("tip"))
			end, SFX_PANEL)
		else
			onButton(arg_32_0, var_32_0, function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
				var_0_0.UpdateCommodtyTip(var_32_1)
				setActive(var_32_0:Find("tip"), false)
			end, SFX_PANEL)
		end

		local var_32_25 = var_0_0.ShouldShowCommodtyTip(var_32_1)

		setActive(var_32_0:Find("new"), var_32_25)
		setActive(var_32_0:Find("tip"), var_32_25)
	end
end

function var_0_0.SetCharaCard(arg_35_0)
	local var_35_0 = arg_35_0:GetCommoditiesCfgByChara(var_0_4[arg_35_0.selectedId].character[1])
	local var_35_1 = UIItemList.New(arg_35_0.charaPage:Find("scroll/Viewport/Content"), arg_35_0.charaPage:Find("scroll/Viewport/Content/card"))
	local var_35_2 = {}

	var_35_1:make(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == UIItemList.EventInit then
			local var_36_0 = var_35_0[arg_36_1 + 1]

			table.insert(var_35_2, {
				var_36_0.type,
				arg_36_2
			})

			local var_36_1 = arg_35_0:IsCommoditySoldOut(var_36_0)
			local var_36_2 = false
			local var_36_3 = false
			local var_36_4 = ""
			local var_36_5 = {}
			local var_36_6 = 0
			local var_36_7 = var_0_3[var_36_0.shop_id[1]].group_type == 2 and i18n("dorm3d_shop_limit1") or i18n("dorm3d_shop_limit")

			if var_36_0.type == 1 then
				local var_36_8 = var_0_6[var_36_0.item_id]

				var_36_3 = var_36_8.is_special == 1
				var_36_2 = not var_36_3 and var_36_8.is_exclusive == 1
				var_36_4 = Drop.New({
					count = 0,
					type = DROP_TYPE_DORM3D_FURNITURE,
					id = var_36_8.id
				}):getIcon()

				setText(arg_36_2:Find("descScroll/Viewport/Content/desc"), var_36_8.desc)
				setText(arg_36_2:Find("countLimit"), var_36_7 .. " " .. getProxy(ApartmentProxy):GetFurnitureShopCount(var_36_0.item_id) .. "/1")

				var_36_5 = var_36_8.unlock_tips or {}
				var_36_6 = var_36_0.shop_id[1]
			elseif var_36_0.type == 2 then
				local var_36_9 = var_0_5[var_36_0.item_id]

				var_36_2 = var_36_0.room_id ~= 0

				local var_36_10 = Dorm3dGift.New({
					configId = var_36_0.item_id
				})

				var_36_4 = Drop.New({
					type = DROP_TYPE_DORM3D_GIFT,
					id = var_36_0.item_id,
					count = getProxy(ApartmentProxy):getGiftCount(var_36_0.item_id)
				}):getIcon()

				setText(arg_36_2:Find("descScroll/Viewport/Content/desc"), var_36_9.display)

				local var_36_11 = 0

				for iter_36_0 = 1, #var_36_0.shop_id do
					local var_36_12 = var_36_0.shop_id[iter_36_0]
					local var_36_13 = var_0_3[var_36_12]
					local var_36_14 = var_36_13.limit_args[1]

					if not var_36_14 and var_36_13.group_type == 0 then
						var_36_11 = 0
					elseif var_36_14 and (var_36_14[1] == "dailycount" or var_36_14[1] == "count") then
						var_36_11 = var_36_14[3]
					elseif var_36_13.group_type == 2 then
						var_36_11 = var_36_13.group_limit
					end
				end

				setText(arg_36_2:Find("countLimit"), var_36_7 .. " " .. getProxy(ApartmentProxy):GetGiftShopCount(var_36_0.item_id) .. "/" .. var_36_11)
				setText(arg_36_2:Find("favor/number"), "+" .. pg.dorm3d_favor_trigger[var_0_5[var_36_0.item_id].favor_trigger_id].num)

				var_36_5 = var_36_9.unlock_tips or {}
				var_36_6 = var_36_10:GetShopID()
			elseif var_36_0.type == 3 then
				var_36_2 = true

				local var_36_15 = var_0_4[var_36_0.item_id]
				local var_36_16 = var_36_15.invite_icon

				for iter_36_1, iter_36_2 in ipairs(var_36_16) do
					if iter_36_2[1] == var_36_0.room_id then
						var_36_4 = iter_36_2[2]
					end
				end

				setText(arg_36_2:Find("descScroll/Viewport/Content/desc"), var_36_15.room_des)

				local var_36_17 = var_36_1 and 1 or 0

				setText(arg_36_2:Find("countLimit"), var_36_7 .. " " .. var_36_17 .. "/1")

				var_36_6 = var_36_0.shop_id[1]
			end

			setActive(arg_36_2:Find("bg/normal"), not var_36_1)
			setActive(arg_36_2:Find("bg/soldOut"), var_36_1)
			setActive(arg_36_2:Find("normal"), not var_36_2 and not var_36_3)
			setActive(arg_36_2:Find("zhuanshu"), var_36_2)
			setActive(arg_36_2:Find("tedian"), var_36_3)
			GetImageSpriteFromAtlasAsync(var_36_4, "", arg_36_2:Find("mask/Dorm3dIconTpl/icon"))
			setActive(arg_36_2:Find("favor"), var_36_0.type == 2)
			setScrollText(arg_36_2:Find("name/text"), var_36_0.name)

			local var_36_18 = UIItemList.New(arg_36_2:Find("bubbles/content"), arg_36_2:Find("bubbles/content/tpl"))

			arg_35_0:SetBubbles(var_36_18, var_36_5)

			local var_36_19 = CommonCommodity.New({
				id = var_36_6
			}, Goods.TYPE_SHOPSTREET)
			local var_36_20, var_36_21, var_36_22 = var_36_19:GetPrice()
			local var_36_23 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_36_19:GetResType(),
				count = var_36_20
			})

			setText(arg_36_2:Find("consume/Text"), "<icon name=" .. var_36_19:GetResIcon() .. " w=0.81 h=0.81/>" .. var_36_20)
			setActive(arg_36_2:Find("consume"), not var_36_1)
			setActive(arg_36_2:Find("soldOut"), var_36_1)

			local var_36_24 = var_0_3[var_36_0.shop_id[1]].time

			setActive(arg_36_2:Find("timeLimit"), var_36_24 ~= "always")

			if var_36_24 ~= "always" then
				local var_36_25 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_36_24[2])

				setText(arg_36_2:Find("timeLimit/Text"), arg_35_0:GetTimeRemain(var_36_25))
			end

			if not var_36_1 then
				onButton(arg_35_0, arg_36_2, function()
					arg_35_0:ClickCommodity(var_36_0, arg_36_2:Find("tip"))
				end, SFX_PANEL)
			else
				onButton(arg_35_0, arg_36_2, function()
					var_0_0.UpdateCommodtyTip(var_36_0)
					setActive(arg_36_2:Find("tip"), false)
					pg.TipsMgr.GetInstance():ShowTips(i18n("word_sell_out"))
				end, SFX_PANEL)
			end

			local var_36_26 = var_0_0.ShouldShowCommodtyTip(var_36_0)

			setActive(arg_36_2:Find("new"), var_36_26)
			setActive(arg_36_2:Find("tip"), var_36_26)
		end
	end)
	var_35_1:align(#var_35_0)

	arg_35_0.filterIndex = 1

	for iter_35_0 = 1, 4 do
		local var_35_3 = arg_35_0.charaPage:Find("switch"):GetChild(iter_35_0 - 1)

		onToggle(arg_35_0, var_35_3, function(arg_39_0)
			if arg_39_0 then
				arg_35_0.filterIndex = iter_35_0

				if iter_35_0 == 1 then
					for iter_39_0, iter_39_1 in ipairs(var_35_2) do
						setActive(iter_39_1[2], true)
					end
				elseif iter_35_0 == 2 then
					for iter_39_2, iter_39_3 in ipairs(var_35_2) do
						setActive(iter_39_3[2], iter_39_3[1] == 2)
					end
				elseif iter_35_0 == 3 then
					for iter_39_4, iter_39_5 in ipairs(var_35_2) do
						setActive(iter_39_5[2], iter_39_5[1] == 1)
					end
				else
					for iter_39_6, iter_39_7 in ipairs(var_35_2) do
						setActive(iter_39_7[2], iter_39_7[1] == 3)
					end
				end

				for iter_39_8 = 1, 4 do
					local var_39_0 = arg_35_0.charaPage:Find("switch"):GetChild(iter_39_8 - 1)

					setActive(var_39_0:Find("selected"), iter_39_8 == iter_35_0)
				end
			end
		end)

		if iter_35_0 == 1 then
			triggerToggle(var_35_3, true)
		end
	end
end

function var_0_0.ClickCommodity(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0.showCount = 1

	if arg_40_1.room_id ~= 0 then
		local var_40_0 = 0

		for iter_40_0, iter_40_1 in pairs(var_0_4) do
			if iter_40_1.type == 2 and iter_40_1.character[1] == arg_40_1.room_id then
				var_40_0 = iter_40_1.id
			end
		end

		if not getProxy(ApartmentProxy):getRoom(var_40_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))

			return
		end
	end

	if arg_40_1.realroom_id ~= 0 and not getProxy(ApartmentProxy):getRoom(arg_40_1.realroom_id) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_publicroom_unlock") .. "：" .. pg.dorm3d_rooms[arg_40_1.realroom_id].room)

		return
	end

	var_0_0.UpdateCommodtyTip(arg_40_1)

	if arg_40_2 then
		setActive(arg_40_2, false)
	end

	if arg_40_1.type == 1 then
		local var_40_1 = Dorm3dFurniture.New({
			configId = arg_40_1.item_id
		})
		local var_40_2 = CommonCommodity.New({
			id = arg_40_1.shop_id[1]
		}, Goods.TYPE_SHOPSTREET)
		local var_40_3, var_40_4, var_40_5 = var_40_2:GetPrice()
		local var_40_6 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_40_2:GetResType(),
			count = var_40_3
		})

		arg_40_0:emit(Dorm3dShopMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
			content = {
				icon = "<icon name=" .. var_40_2:GetResIcon() .. " w=1.1 h=1.1/>",
				off = var_40_4,
				cost = var_40_6.count,
				old = var_40_5,
				name = arg_40_1.name
			},
			tip = i18n("dorm3d_shop_gift_tip"),
			drop = var_40_1,
			endTime = var_40_1:GetEndTime(),
			onYes = function()
				if not var_40_1:InShopTime() then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_purchase_outtime"))

					return
				end

				arg_40_0:emit(GAME.SHOPPING, {
					silentTip = true,
					count = 1,
					shopId = arg_40_1.shop_id[1]
				})
			end
		})
	elseif arg_40_1.type == 2 then
		local var_40_7 = 0

		for iter_40_2 = 1, #arg_40_1.shop_id do
			local var_40_8 = arg_40_1.shop_id[iter_40_2]
			local var_40_9 = var_0_3[var_40_8]
			local var_40_10 = var_40_9.limit_args[1]

			if not var_40_10 and var_40_9.group_type == 0 then
				var_40_7 = 0
			elseif var_40_10 and (var_40_10[1] == "dailycount" or var_40_10[1] == "count") then
				var_40_7 = var_40_10[3]
			elseif var_40_9.group_type == 2 then
				var_40_7 = var_40_9.group_limit
			end
		end

		if var_40_7 > 1 then
			local var_40_11 = 0

			if arg_40_0.selectedId ~= 0 then
				var_40_11 = var_0_4[arg_40_0.selectedId].character[1]
			end

			arg_40_0:emit(Dorm3dShopMediator.OPEN_DETAIL, arg_40_1, var_40_11, function(arg_42_0)
				arg_40_0.showCount = arg_42_0
			end)
		else
			local var_40_12 = Dorm3dGift.New({
				configId = arg_40_1.item_id
			})
			local var_40_13 = CommonCommodity.New({
				id = var_40_12:GetShopID()
			}, Goods.TYPE_SHOPSTREET)
			local var_40_14, var_40_15, var_40_16 = var_40_13:GetPrice()
			local var_40_17 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_40_13:GetResType(),
				count = var_40_14
			})
			local var_40_18
			local var_40_19 = 0

			_.each(var_40_12:getConfig("shop_id"), function(arg_43_0)
				local var_43_0 = var_0_3[arg_43_0]

				if var_43_0.group_type == 2 then
					var_40_19 = math.max(var_43_0.group_limit, var_40_19)
				end
			end)

			if var_40_19 > 0 then
				var_40_18 = {
					getProxy(ApartmentProxy):GetGiftShopCount(var_40_12:GetConfigID()),
					var_40_19
				}
			end

			arg_40_0:emit(Dorm3dShopMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
				content = {
					icon = "<icon name=" .. var_40_13:GetResIcon() .. " w=1.1 h=1.1/>",
					off = var_40_15,
					cost = var_40_17.count,
					old = var_40_16,
					name = arg_40_1.name,
					weekLimit = var_40_18
				},
				tip = i18n("dorm3d_shop_gift_tip"),
				drop = var_40_12,
				groupId = arg_40_1.room_id,
				onYes = function()
					arg_40_0:emit(GAME.SHOPPING, {
						silentTip = true,
						count = 1,
						shopId = var_40_12:GetShopID()
					})
				end
			})
		end
	elseif arg_40_1.type == 3 then
		local var_40_20
		local var_40_21 = getProxy(ApartmentProxy):getRoom(arg_40_1.item_id)

		if not var_40_21 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))

			return
		end

		if not var_40_21.unlockCharacter[arg_40_1.room_id] then
			var_40_20 = "lock"
		elseif not getProxy(ApartmentProxy):getApartment(arg_40_1.room_id) then
			var_40_20 = "room"
		elseif Apartment.New({
			ship_group = arg_40_1.room_id
		}):needDownload() then
			var_40_20 = "download"
		end

		if var_40_20 == "lock" then
			arg_40_0:emit(Dorm3dShopMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_40_1.item_id, arg_40_1.room_id)
		elseif var_40_20 == "room" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))
		elseif var_40_20 == "download" then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_beach_tip"))
		end
	end
end

function var_0_0.SetBubbles(arg_45_0, arg_45_1, arg_45_2)
	arg_45_1:make(function(arg_46_0, arg_46_1, arg_46_2)
		if arg_46_0 == UIItemList.EventInit then
			local var_46_0 = arg_46_1 + 1
			local var_46_1 = arg_45_2[var_46_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_46_1, arg_46_2:Find("icon/icon"), true)
			setText(arg_46_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_46_1))
			setActive(arg_46_2:Find("bubble"), false)
			onToggle(arg_45_0, arg_46_2, function(arg_47_0)
				setActive(arg_46_2:Find("icon/select"), arg_47_0)
				setActive(arg_46_2:Find("icon/unselect"), not arg_47_0)
				setActive(arg_46_2:Find("bubble"), arg_47_0)
				setActive(arg_45_0.mask, arg_47_0)
				onButton(arg_45_0, arg_45_0.mask, function()
					triggerToggle(arg_46_2, false)
				end, SFX_PANEL)
			end)
		end
	end)
	arg_45_1:align(#arg_45_2)
end

function var_0_0.GetTimeRemain(arg_49_0, arg_49_1)
	local var_49_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_49_1 = math.max(arg_49_1 - var_49_0, 0)
	local var_49_2 = math.floor(var_49_1 / 86400)

	if var_49_2 > 0 then
		return var_49_2 .. i18n("word_date")
	else
		local var_49_3 = math.floor(var_49_1 / 3600)

		if var_49_3 > 0 then
			return var_49_3 .. i18n("word_hour")
		else
			local var_49_4 = math.floor(var_49_1 / 60)

			if var_49_4 > 0 then
				return var_49_4 .. i18n("word_minute")
			else
				return var_49_1 .. i18n("word_second")
			end
		end
	end
end

function var_0_0.ShouldShowCommodtyTip(arg_50_0)
	if arg_50_0.room_id ~= 0 then
		local var_50_0 = 0

		for iter_50_0, iter_50_1 in ipairs(var_0_4.all) do
			local var_50_1 = var_0_4[iter_50_1]

			if var_50_1.type == 2 and var_50_1.character[1] == arg_50_0.room_id then
				var_50_0 = iter_50_1
			end
		end

		if not getProxy(ApartmentProxy):getRoom(var_50_0) then
			return false
		end
	end

	if arg_50_0.realroom_id ~= 0 and not getProxy(ApartmentProxy):getRoom(arg_50_0.realroom_id) then
		return false
	end

	if arg_50_0.type == 1 then
		return Dorm3dFurniture.NeedViewTipByFurnitureId(arg_50_0.item_id)
	elseif arg_50_0.type == 2 then
		local var_50_2 = getProxy(PlayerProxy):getRawData().id
		local var_50_3 = Dorm3dGift.NeedViewTipByGiftId(arg_50_0.item_id)
		local var_50_4 = var_0_3[arg_50_0.shop_id[1]].group ~= 0 and PlayerPrefs.GetInt(var_50_2 .. "_dorm3dGiftWeekViewed_" .. arg_50_0.item_id, 0) == 0

		return var_50_3 or var_50_4
	end

	return false
end

function var_0_0.ShouldShowSumTip(arg_51_0)
	for iter_51_0, iter_51_1 in ipairs(arg_51_0) do
		if var_0_0.ShouldShowCommodtyTip(iter_51_1) then
			return true
		end
	end

	return false
end

function var_0_0.ShouldShowAllTip()
	local var_52_0 = {}

	for iter_52_0, iter_52_1 in ipairs(var_0_2.all) do
		local var_52_1 = var_0_2[iter_52_1]
		local var_52_2 = false
		local var_52_3 = var_52_1.shop_id

		for iter_52_2, iter_52_3 in ipairs(var_52_3) do
			local var_52_4 = var_0_3[iter_52_3]

			if not pg.TimeMgr.GetInstance():inTime(var_52_4.time) then
				var_52_2 = true

				break
			end
		end

		if not var_52_2 then
			table.insert(var_52_0, var_52_1)
		end
	end

	return var_0_0.ShouldShowSumTip(var_52_0)
end

function var_0_0.UpdateCommodtyTip(arg_53_0)
	if arg_53_0.type == 1 then
		Dorm3dFurniture.SetViewedFlag(arg_53_0.item_id)
	elseif arg_53_0.type == 2 then
		Dorm3dGift.SetViewedFlag(arg_53_0.item_id)

		if var_0_3[arg_53_0.shop_id[1]].group ~= 0 then
			local var_53_0 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt(var_53_0 .. "_dorm3dGiftWeekViewed_" .. arg_53_0.item_id, 1)
		end
	end
end

function var_0_0.UpdateSumTip(arg_54_0)
	for iter_54_0, iter_54_1 in ipairs(arg_54_0) do
		var_0_0.UpdateCommodtyTip(iter_54_1)
	end
end

function var_0_0.willExit(arg_55_0)
	arg_55_0.scrollSnap:Dispose()

	arg_55_0.scrollSnap = nil
end

function var_0_0.onBackPressed(arg_56_0)
	arg_56_0:closeView()
end

return var_0_0

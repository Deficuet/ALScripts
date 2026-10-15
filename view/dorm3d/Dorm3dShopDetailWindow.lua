local var_0_0 = class("Dorm3dShopDetailWindow", import("view.base.BaseUI"))

var_0_0.SELECTED_WIDTH = 52
var_0_0.UNSELECTED_WIDTH = 12
var_0_0.LOOP_DURATION = 5

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dShopDetailWindow"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"weaponframes",
		"ui/shoptip_atlas"
	}
	local var_2_1 = (arg_2_0.contextData or {}).shopCfg

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	local function var_2_3(arg_4_0)
		for iter_4_0, iter_4_1 in ipairs(arg_4_0 or {}) do
			var_2_2("dorm3dbanner/" .. iter_4_1)
		end
	end

	if var_2_1 then
		var_2_3(var_2_1.banners)

		local var_2_4 = pg.dorm3d_gift[var_2_1.item_id]

		if var_2_4 then
			for iter_2_0, iter_2_1 in ipairs(var_2_4.unlock_banners or {}) do
				var_2_3(iter_2_1[2])
			end
		end

		local var_2_5 = Drop.New({
			count = 0,
			type = DROP_TYPE_DORM3D_GIFT,
			id = var_2_1.item_id
		})

		var_2_2(var_2_5:getIcon())
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.init(arg_5_0)
	arg_5_0.previewTf = arg_5_0._tf:Find("Window/Preview")
	arg_5_0.bubbleContent = arg_5_0._tf:Find("Window/Bubbles/content")
	arg_5_0.bubbleTpl = arg_5_0._tf:Find("Window/Bubbles/tpl")
	arg_5_0.bubbleList = UIItemList.New(arg_5_0.bubbleContent, arg_5_0.bubbleTpl)
	arg_5_0.scrollSnap = BannerScrollRect4Dorm.New(arg_5_0._tf:Find("Window/banner/mask/content"), arg_5_0._tf:Find("Window/banner/dots"))

	setActive(arg_5_0.bubbleTpl, false)

	arg_5_0.minusBtn = arg_5_0._tf:Find("Window/countList/minusBtn")
	arg_5_0.addBtn = arg_5_0._tf:Find("Window/countList/addBtn")
	arg_5_0.maxBtn = arg_5_0._tf:Find("Window/countList/maxBtn")
	arg_5_0.countText = arg_5_0._tf:Find("Window/countList/count/Text")
	arg_5_0.shopCfg = arg_5_0.contextData.shopCfg
	arg_5_0.unlockTips = pg.dorm3d_gift[arg_5_0.shopCfg.item_id].unlock_tips or {}

	local var_5_0 = arg_5_0.shopCfg.room_id

	arg_5_0.unlockBanners = arg_5_0.shopCfg.banners

	if arg_5_0.contextData.groupId ~= 0 then
		var_5_0 = arg_5_0.contextData.groupId

		local var_5_1 = pg.dorm3d_gift[arg_5_0.shopCfg.item_id].unlock_banners or {}
		local var_5_2 = table.Find(var_5_1, function(arg_6_0, arg_6_1)
			if arg_6_1[1] == var_5_0 then
				return true
			end
		end)

		arg_5_0.unlockBanners = var_5_2 and var_5_2[2]
	end

	arg_5_0.isExclusive = pg.dorm3d_gift[arg_5_0.shopCfg.item_id].ship_group_id ~= 0
	arg_5_0.isSpecial = false
	arg_5_0.addFavor = pg.dorm3d_favor_trigger[pg.dorm3d_gift[arg_5_0.shopCfg.item_id].favor_trigger_id].num

	setActive(arg_5_0._tf:Find("Window/Title/gift"), true)

	arg_5_0.curCount = 1
	arg_5_0.buyCount = getProxy(ApartmentProxy):GetGiftShopCount(arg_5_0.shopCfg.item_id)
end

function var_0_0.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0._tf:Find("Window/Cancel"), function()
		arg_7_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0._tf:Find("Mask"), function()
		arg_7_0:closeView()
	end)
	arg_7_0:InitUIList()
	arg_7_0:InitDropIcon()
	arg_7_0:InitBanner()

	local var_7_0 = Dorm3dGift.New({
		configId = arg_7_0.shopCfg.item_id
	})
	local var_7_1 = CommonCommodity.New({
		id = var_7_0:GetShopID()
	}, Goods.TYPE_SHOPSTREET)
	local var_7_2, var_7_3, var_7_4 = var_7_1:GetPrice()
	local var_7_5 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_7_1:GetResType(),
		count = var_7_2
	})
	local var_7_6 = i18n("dorm3d_shop_buy_tips", "<icon name=" .. var_7_1:GetResIcon() .. " w=1.1 h=1.1/>", "x" .. var_7_5.count, "x" .. var_7_5.count, arg_7_0.shopCfg.name)
	local var_7_7
	local var_7_8 = 0

	_.each(var_7_0:getConfig("shop_id"), function(arg_10_0)
		local var_10_0 = ShopConst.GetShopConfig(arg_10_0)

		if var_10_0.group_type == 2 then
			var_7_8 = math.max(var_10_0.group_limit, var_7_8)
		end
	end)

	if var_7_8 > 0 then
		var_7_7 = {
			arg_7_0.buyCount,
			var_7_8
		}
	end

	if var_7_7 then
		var_7_6 = var_7_6 .. i18n("dorm3d_purchase_weekly_limit", var_7_7[1], var_7_7[2])
	end

	setText(arg_7_0._tf:Find("Window/Content"), var_7_6)
	setText(arg_7_0._tf:Find("Window/Confirm/Text"), i18n("msgbox_text_confirm"))
	setText(arg_7_0._tf:Find("Window/Cancel/Text"), i18n("msgbox_text_cancel"))
	pg.UIMgr.GetInstance():OverlayPanel(arg_7_0._tf)

	local var_7_9 = var_7_0:GetShopID()

	arg_7_0.itemList = {
		var_7_9
	}
	arg_7_0.sumPrice = arg_7_0:GetGoodPrice(var_7_9)

	setText(arg_7_0.countText, arg_7_0.curCount)

	local var_7_10 = 1

	if var_7_7 then
		var_7_10 = var_7_7[2] - var_7_7[1]
	end

	local function var_7_11(arg_11_0)
		arg_11_0 = math.max(arg_11_0, 1)
		arg_11_0 = math.min(arg_11_0, var_7_10)
		arg_7_0.curCount = arg_11_0

		setText(arg_7_0.countText, arg_11_0)

		local var_11_0 = arg_7_0:GetShopId(arg_7_0.buyCount + arg_7_0.curCount - 1)
		local var_11_1 = arg_7_0:GetGoodPrice(var_11_0)

		arg_7_0.sumPrice = 0

		for iter_11_0 = arg_7_0.buyCount, arg_7_0.buyCount + arg_7_0.curCount - 1 do
			arg_7_0.sumPrice = arg_7_0.sumPrice + arg_7_0:GetGoodPrice(arg_7_0:GetShopId(iter_11_0))
		end

		local var_11_2 = i18n("dorm3d_shop_buy_tips", "<icon name=" .. var_7_1:GetResIcon() .. " w=1.1 h=1.1/>", "x" .. var_11_1, "x" .. arg_7_0.sumPrice, arg_7_0.shopCfg.name)

		if var_7_7 then
			var_11_2 = var_11_2 .. i18n("dorm3d_purchase_weekly_limit", var_7_7[1], var_7_7[2])
		end

		setText(arg_7_0._tf:Find("Window/Content"), var_11_2)
		arg_7_0.contextData.changeCount(arg_11_0)
	end

	onButton(arg_7_0, arg_7_0.minusBtn, function()
		if arg_7_0.curCount - 1 > 0 then
			table.remove(arg_7_0.itemList, #arg_7_0.itemList)
		end

		var_7_11(arg_7_0.curCount - 1)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.addBtn, function()
		if arg_7_0.buyCount + arg_7_0.curCount + 1 <= var_7_8 then
			table.insert(arg_7_0.itemList, arg_7_0:GetShopId(arg_7_0.buyCount + arg_7_0.curCount))
		end

		var_7_11(arg_7_0.curCount + 1)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.maxBtn, function()
		arg_7_0.itemList = {}

		for iter_14_0 = arg_7_0.buyCount, var_7_8 - 1 do
			table.insert(arg_7_0.itemList, arg_7_0:GetShopId(iter_14_0))
		end

		var_7_11(var_7_10)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("Window/Confirm"), function()
		local var_15_0 = getProxy(PlayerProxy):getData()
		local var_15_1 = ShopConst.GetShopConfig(arg_7_0.itemList[1])

		if var_15_0[id2res(var_15_1.resource_type)] < arg_7_0.sumPrice then
			local var_15_2 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_15_1.resource_type
			}):getName()

			if var_15_1.resource_type == 1 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
					{
						59001,
						arg_7_0.sumPrice - var_15_0[id2res(var_15_1.resource_type)],
						arg_7_0.sumPrice
					}
				})
			elseif var_15_1.resource_type == 4 or var_15_1.resource_type == 14 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			elseif not ItemTipPanel.ShowItemTip(DROP_TYPE_RESOURCE, var_15_1.resource_type) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", var_15_2))
			end

			arg_7_0:closeView()

			return
		end

		for iter_15_0, iter_15_1 in ipairs(arg_7_0.itemList) do
			arg_7_0:emit(Dorm3dShopDetailMediator.SHOPPING, {
				silentTip = true,
				count = 1,
				shopId = iter_15_1
			})
		end

		arg_7_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.InitBanner(arg_16_0)
	for iter_16_0 = 1, #arg_16_0.unlockBanners do
		local var_16_0 = arg_16_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("dorm3dbanner/" .. arg_16_0.unlockBanners[iter_16_0], var_16_0)
	end

	arg_16_0.scrollSnap:SetUp()
end

function var_0_0.InitUIList(arg_17_0)
	arg_17_0.bubbleList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventInit then
			local var_18_0 = arg_18_1 + 1
			local var_18_1 = arg_17_0.unlockTips[var_18_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_18_1, arg_18_2:Find("icon/icon"), true)
			setText(arg_18_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_18_1))
			setActive(arg_18_2:Find("bubble"), false)
			onToggle(arg_17_0, arg_18_2, function(arg_19_0)
				setActive(arg_18_2:Find("icon/select"), arg_19_0)
				setActive(arg_18_2:Find("icon/unselect"), not arg_19_0)
				setActive(arg_18_2:Find("bubble"), arg_19_0)
			end)
		end
	end)
	arg_17_0.bubbleList:align(#arg_17_0.unlockTips)
end

function var_0_0.InitDropIcon(arg_20_0)
	local var_20_0 = Drop.New({
		type = DROP_TYPE_DORM3D_GIFT,
		id = arg_20_0.shopCfg.item_id,
		count = getProxy(ApartmentProxy):getGiftCount(arg_20_0.shopCfg.item_id)
	})

	LoadImageSpriteAtlasAsync(var_20_0:getIcon(), "", arg_20_0._tf:Find("Window/Item/Dorm3dIconTpl/icon"), true)
	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(arg_20_0.shopCfg.rarity), arg_20_0._tf:Find("Window/Item/Dorm3dIconTpl"))
	setActive(arg_20_0._tf:Find("Window/Item/sp"), arg_20_0.isExclusive or arg_20_0.isSpecial)

	if arg_20_0.isSpecial then
		setText(arg_20_0._tf:Find("Window/Item/sp/Text"), i18n("dorm3d_purchase_label_special"))
	elseif arg_20_0.isExclusive then
		setText(arg_20_0._tf:Find("Window/Item/sp/Text"), i18n("dorm3d_purchase_confirm_tip"))
	end

	if arg_20_0.addFavor then
		setActive(arg_20_0._tf:Find("Window/Item/gift"), true)
		setText(arg_20_0._tf:Find("Window/Item/gift/Text"), "+" .. arg_20_0.addFavor)
	end
end

function var_0_0.GetShopId(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.shopCfg.shop_id

	for iter_21_0 = 1, #var_21_0 - 1 do
		local var_21_1 = var_21_0[iter_21_0]
		local var_21_2 = ShopConst.GetShopConfig(var_21_1)
		local var_21_3 = var_21_2.limit_args[1]

		if not var_21_3 and var_21_2.group_type == 0 then
			return var_21_1
		elseif var_21_3 and (var_21_3[1] == "dailycount" or var_21_3[1] == "count") then
			if arg_21_1 < var_21_3[3] then
				return var_21_1
			end
		elseif var_21_2.group_type == 2 then
			if arg_21_1 < var_21_2.group_limit then
				return var_21_1
			end
		else
			return var_21_1
		end
	end

	return var_21_0[#var_21_0] or 0
end

function var_0_0.GetGoodPrice(arg_22_0, arg_22_1)
	return (CommonCommodity.New({
		id = arg_22_1
	}, Goods.TYPE_SHOPSTREET):GetPrice())
end

function var_0_0.willExit(arg_23_0)
	if arg_23_0.timerRefreshTime then
		arg_23_0.timerRefreshTime:Stop()

		arg_23_0.timerRefreshTime = nil
	end

	arg_23_0.scrollSnap:Dispose()

	arg_23_0.scrollSnap = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_23_0._tf)
end

return var_0_0

local var_0_0 = class("Dorm3dShopDetailWindow", import("view.base.BaseUI"))

var_0_0.SELECTED_WIDTH = 52
var_0_0.UNSELECTED_WIDTH = 12
var_0_0.LOOP_DURATION = 5

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dShopDetailWindow"
end

function var_0_0.init(arg_2_0)
	arg_2_0.previewTf = arg_2_0._tf:Find("Window/Preview")
	arg_2_0.bubbleContent = arg_2_0._tf:Find("Window/Bubbles/content")
	arg_2_0.bubbleTpl = arg_2_0._tf:Find("Window/Bubbles/tpl")
	arg_2_0.bubbleList = UIItemList.New(arg_2_0.bubbleContent, arg_2_0.bubbleTpl)
	arg_2_0.scrollSnap = BannerScrollRect4Dorm.New(arg_2_0._tf:Find("Window/banner/mask/content"), arg_2_0._tf:Find("Window/banner/dots"))

	setActive(arg_2_0.bubbleTpl, false)

	arg_2_0.minusBtn = arg_2_0:findTF("Window/countList/minusBtn")
	arg_2_0.addBtn = arg_2_0:findTF("Window/countList/addBtn")
	arg_2_0.maxBtn = arg_2_0:findTF("Window/countList/maxBtn")
	arg_2_0.countText = arg_2_0:findTF("Window/countList/count/Text")
	arg_2_0.shopCfg = arg_2_0.contextData.shopCfg
	arg_2_0.unlockTips = pg.dorm3d_gift[arg_2_0.shopCfg.item_id].unlock_tips or {}

	local var_2_0 = arg_2_0.shopCfg.room_id

	arg_2_0.unlockBanners = arg_2_0.shopCfg.banners

	if arg_2_0.contextData.groupId ~= 0 then
		var_2_0 = arg_2_0.contextData.groupId

		local var_2_1 = pg.dorm3d_gift[arg_2_0.shopCfg.item_id].unlock_banners or {}
		local var_2_2 = table.Find(var_2_1, function(arg_3_0, arg_3_1)
			if arg_3_1[1] == var_2_0 then
				return true
			end
		end)

		arg_2_0.unlockBanners = var_2_2 and var_2_2[2]
	end

	arg_2_0.isExclusive = pg.dorm3d_gift[arg_2_0.shopCfg.item_id].ship_group_id ~= 0
	arg_2_0.isSpecial = false
	arg_2_0.addFavor = pg.dorm3d_favor_trigger[pg.dorm3d_gift[arg_2_0.shopCfg.item_id].favor_trigger_id].num

	setActive(arg_2_0._tf:Find("Window/Title/gift"), true)

	arg_2_0.curCount = 1
	arg_2_0.buyCount = getProxy(ApartmentProxy):GetGiftShopCount(arg_2_0.shopCfg.item_id)
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("Window/Cancel"), function()
		arg_4_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0._tf:Find("Mask"), function()
		arg_4_0:closeView()
	end)
	arg_4_0:InitUIList()
	arg_4_0:InitDropIcon()
	arg_4_0:InitBanner()

	local var_4_0 = Dorm3dGift.New({
		configId = arg_4_0.shopCfg.item_id
	})
	local var_4_1 = CommonCommodity.New({
		id = var_4_0:GetShopID()
	}, Goods.TYPE_SHOPSTREET)
	local var_4_2, var_4_3, var_4_4 = var_4_1:GetPrice()
	local var_4_5 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = var_4_1:GetResType(),
		count = var_4_2
	})
	local var_4_6 = i18n("dorm3d_shop_buy_tips", "<icon name=" .. var_4_1:GetResIcon() .. " w=1.1 h=1.1/>", "x" .. var_4_5.count, "x" .. var_4_5.count, arg_4_0.shopCfg.name)
	local var_4_7
	local var_4_8 = 0

	_.each(var_4_0:getConfig("shop_id"), function(arg_7_0)
		local var_7_0 = pg.shop_template[arg_7_0]

		if var_7_0.group_type == 2 then
			var_4_8 = math.max(var_7_0.group_limit, var_4_8)
		end
	end)

	if var_4_8 > 0 then
		var_4_7 = {
			arg_4_0.buyCount,
			var_4_8
		}
	end

	if var_4_7 then
		var_4_6 = var_4_6 .. i18n("dorm3d_purchase_weekly_limit", var_4_7[1], var_4_7[2])
	end

	setText(arg_4_0._tf:Find("Window/Content"), var_4_6)
	setText(arg_4_0._tf:Find("Window/Confirm/Text"), i18n("msgbox_text_confirm"))
	setText(arg_4_0._tf:Find("Window/Cancel/Text"), i18n("msgbox_text_cancel"))
	pg.UIMgr.GetInstance():OverlayPanel(arg_4_0._tf)

	local var_4_9 = var_4_0:GetShopID()

	arg_4_0.itemList = {
		var_4_9
	}
	arg_4_0.sumPrice = arg_4_0:GetGoodPrice(var_4_9)

	setText(arg_4_0.countText, arg_4_0.curCount)

	local var_4_10 = 1

	if var_4_7 then
		var_4_10 = var_4_7[2] - var_4_7[1]
	end

	local function var_4_11(arg_8_0)
		arg_8_0 = math.max(arg_8_0, 1)
		arg_8_0 = math.min(arg_8_0, var_4_10)
		arg_4_0.curCount = arg_8_0

		setText(arg_4_0.countText, arg_8_0)

		local var_8_0 = arg_4_0:GetShopId(arg_4_0.buyCount + arg_4_0.curCount - 1)
		local var_8_1 = arg_4_0:GetGoodPrice(var_8_0)

		arg_4_0.sumPrice = 0

		for iter_8_0 = arg_4_0.buyCount, arg_4_0.buyCount + arg_4_0.curCount - 1 do
			arg_4_0.sumPrice = arg_4_0.sumPrice + arg_4_0:GetGoodPrice(arg_4_0:GetShopId(iter_8_0))
		end

		local var_8_2 = i18n("dorm3d_shop_buy_tips", "<icon name=" .. var_4_1:GetResIcon() .. " w=1.1 h=1.1/>", "x" .. var_8_1, "x" .. arg_4_0.sumPrice, arg_4_0.shopCfg.name)

		if var_4_7 then
			var_8_2 = var_8_2 .. i18n("dorm3d_purchase_weekly_limit", var_4_7[1], var_4_7[2])
		end

		setText(arg_4_0._tf:Find("Window/Content"), var_8_2)
		arg_4_0.contextData.changeCount(arg_8_0)
	end

	onButton(arg_4_0, arg_4_0.minusBtn, function()
		if arg_4_0.curCount - 1 > 0 then
			table.remove(arg_4_0.itemList, #arg_4_0.itemList)
		end

		var_4_11(arg_4_0.curCount - 1)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.addBtn, function()
		if arg_4_0.buyCount + arg_4_0.curCount + 1 <= var_4_8 then
			table.insert(arg_4_0.itemList, arg_4_0:GetShopId(arg_4_0.buyCount + arg_4_0.curCount))
		end

		var_4_11(arg_4_0.curCount + 1)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.maxBtn, function()
		arg_4_0.itemList = {}

		for iter_11_0 = arg_4_0.buyCount, var_4_8 - 1 do
			table.insert(arg_4_0.itemList, arg_4_0:GetShopId(iter_11_0))
		end

		var_4_11(var_4_10)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("Window/Confirm"), function()
		local var_12_0 = getProxy(PlayerProxy):getData()
		local var_12_1 = pg.shop_template[arg_4_0.itemList[1]]

		if var_12_0[id2res(var_12_1.resource_type)] < arg_4_0.sumPrice then
			local var_12_2 = Drop.New({
				type = DROP_TYPE_RESOURCE,
				id = var_12_1.resource_type
			}):getName()

			if var_12_1.resource_type == 1 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
					{
						59001,
						arg_4_0.sumPrice - var_12_0[id2res(var_12_1.resource_type)],
						arg_4_0.sumPrice
					}
				})
			elseif var_12_1.resource_type == 4 or var_12_1.resource_type == 14 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			elseif not ItemTipPanel.ShowItemTip(DROP_TYPE_RESOURCE, var_12_1.resource_type) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", var_12_2))
			end

			arg_4_0:closeView()

			return
		end

		for iter_12_0, iter_12_1 in ipairs(arg_4_0.itemList) do
			arg_4_0:emit(Dorm3dShopDetailMediator.SHOPPING, {
				silentTip = true,
				count = 1,
				shopId = iter_12_1
			})
		end

		arg_4_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.InitBanner(arg_13_0)
	for iter_13_0 = 1, #arg_13_0.unlockBanners do
		local var_13_0 = arg_13_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("dorm3dbanner/" .. arg_13_0.unlockBanners[iter_13_0], var_13_0)
	end

	arg_13_0.scrollSnap:SetUp()
end

function var_0_0.InitUIList(arg_14_0)
	arg_14_0.bubbleList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventInit then
			local var_15_0 = arg_15_1 + 1
			local var_15_1 = arg_14_0.unlockTips[var_15_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_15_1, arg_15_2:Find("icon/icon"), true)
			setText(arg_15_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_15_1))
			setActive(arg_15_2:Find("bubble"), false)
			onToggle(arg_14_0, arg_15_2, function(arg_16_0)
				setActive(arg_15_2:Find("icon/select"), arg_16_0)
				setActive(arg_15_2:Find("icon/unselect"), not arg_16_0)
				setActive(arg_15_2:Find("bubble"), arg_16_0)
			end)
		end
	end)
	arg_14_0.bubbleList:align(#arg_14_0.unlockTips)
end

function var_0_0.InitDropIcon(arg_17_0)
	local var_17_0 = Drop.New({
		type = DROP_TYPE_DORM3D_GIFT,
		id = arg_17_0.shopCfg.item_id,
		count = getProxy(ApartmentProxy):getGiftCount(arg_17_0.shopCfg.item_id)
	})

	LoadImageSpriteAtlasAsync(var_17_0:getIcon(), "", arg_17_0._tf:Find("Window/Item/Dorm3dIconTpl/icon"), true)
	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(arg_17_0.shopCfg.rarity), arg_17_0._tf:Find("Window/Item/Dorm3dIconTpl"))
	setActive(arg_17_0._tf:Find("Window/Item/sp"), arg_17_0.isExclusive or arg_17_0.isSpecial)

	if arg_17_0.isSpecial then
		setText(arg_17_0._tf:Find("Window/Item/sp/Text"), i18n("dorm3d_purchase_label_special"))
	elseif arg_17_0.isExclusive then
		setText(arg_17_0._tf:Find("Window/Item/sp/Text"), i18n("dorm3d_purchase_confirm_tip"))
	end

	if arg_17_0.addFavor then
		setActive(arg_17_0._tf:Find("Window/Item/gift"), true)
		setText(arg_17_0._tf:Find("Window/Item/gift/Text"), "+" .. arg_17_0.addFavor)
	end
end

function var_0_0.GetShopId(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.shopCfg.shop_id

	for iter_18_0 = 1, #var_18_0 - 1 do
		local var_18_1 = var_18_0[iter_18_0]
		local var_18_2 = pg.shop_template[var_18_1]
		local var_18_3 = var_18_2.limit_args[1]

		if not var_18_3 and var_18_2.group_type == 0 then
			return var_18_1
		elseif var_18_3 and (var_18_3[1] == "dailycount" or var_18_3[1] == "count") then
			if arg_18_1 < var_18_3[3] then
				return var_18_1
			end
		elseif var_18_2.group_type == 2 then
			if arg_18_1 < var_18_2.group_limit then
				return var_18_1
			end
		else
			return var_18_1
		end
	end

	return var_18_0[#var_18_0] or 0
end

function var_0_0.GetGoodPrice(arg_19_0, arg_19_1)
	return (CommonCommodity.New({
		id = arg_19_1
	}, Goods.TYPE_SHOPSTREET):GetPrice())
end

function var_0_0.willExit(arg_20_0)
	if arg_20_0.timerRefreshTime then
		arg_20_0.timerRefreshTime:Stop()

		arg_20_0.timerRefreshTime = nil
	end

	arg_20_0.scrollSnap:Dispose()

	arg_20_0.scrollSnap = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_20_0._tf)
end

return var_0_0

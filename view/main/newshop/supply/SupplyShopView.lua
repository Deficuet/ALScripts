local var_0_0 = class("SupplyShopView", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)

	arg_1_0.supplyShopType = arg_1_4
end

function var_0_0.getUIName(arg_2_0)
	return "ShopSupplyShopUI"
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0:initData()
	arg_3_0:initUI()

	arg_3_0.prevBtn = nil
	arg_3_0.pages = {
		[ShopConst.TYPE_ACTIVITY] = ActivityShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_SHOP_STREET] = StreetShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_MILITARY_SHOP] = MilitaryShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_GUILD] = GuildShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_SHAM_SHOP] = ShamShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_FRAGMENT] = FragmentShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_META] = MetaShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_MEDAL] = MedalShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_QUOTA] = QuotaShopPage.New(arg_3_0, arg_3_0._go),
		[ShopConst.TYPE_MINI_GAME] = MiniGameShopPage.New(arg_3_0, arg_3_0._go)
	}
	arg_3_0.shopResItemList = {}
	arg_3_0.shopResParent = arg_3_0:findTF("bg/resList")
	arg_3_0.shopResItem = arg_3_0:findTF("bg/resList/res")

	arg_3_0:blurView()
end

function var_0_0.OnDestroy(arg_4_0)
	arg_4_0:unBlurView()

	arg_4_0.prevBtn = nil

	if arg_4_0.page then
		arg_4_0.page:StopBGM()

		arg_4_0.page = nil
	end

	arg_4_0:DestroyResItemList()

	for iter_4_0, iter_4_1 in pairs(arg_4_0.pages) do
		iter_4_1:OnDestroy()
	end

	arg_4_0.pages = nil
end

function var_0_0.initUI(arg_5_0)
	arg_5_0.lScrollRect = GetComponent(arg_5_0:findTF("scroll"), "LScrollRect")
	arg_5_0.scrollContent = arg_5_0:findTF("scroll/content")
	arg_5_0.scrollRectTF = GetComponent(arg_5_0.scrollContent, typeof(RectTransform))
	arg_5_0.layoutGroup = GetComponent(arg_5_0.scrollContent, typeof(GridLayoutGroup))
	arg_5_0.scrollRectSpecial = arg_5_0:findTF("scrollRectSpecial")

	setActive(arg_5_0.scrollRectSpecial, false)

	local var_5_0 = GetComponent(arg_5_0:findTF("viewport/view/group/items", arg_5_0.scrollRectSpecial), typeof(GridLayoutGroup))
	local var_5_1 = arg_5_0.scrollRectTF.rect.width
	local var_5_2 = arg_5_0.layoutGroup.cellSize.x
	local var_5_3 = math.floor(var_5_1 / var_5_2)
	local var_5_4 = var_5_1 % var_5_2 / var_5_3

	if var_5_4 < 12 then
		local var_5_5 = var_5_3 - 1

		var_5_4 = (var_5_1 - var_5_2 * var_5_5) / var_5_5
	end

	arg_5_0.layoutGroup.spacing = Vector2(var_5_4, var_5_4)
	arg_5_0.layoutGroup.padding.left = var_5_4 / 2
	var_5_0.spacing = Vector2(var_5_4, var_5_4)
	var_5_0.padding.left = var_5_4 / 2
end

function var_0_0.initData(arg_6_0)
	arg_6_0.player = getProxy(PlayerProxy):getData()
end

function var_0_0.SetAllShopData(arg_7_0, arg_7_1)
	arg_7_0.allShopList = arg_7_1
	arg_7_0.packageSortList = {}

	local var_7_0 = 0

	for iter_7_0, iter_7_1 in ipairs(ShopConst.SUPPLY_SHOP_LIST[arg_7_0.supplyShopType]) do
		for iter_7_2, iter_7_3 in ipairs(arg_7_0.allShopList[iter_7_1] or {}) do
			var_7_0 = var_7_0 + 1

			table.insert(arg_7_0.packageSortList, {
				type = iter_7_1,
				index = var_7_0,
				shopData = iter_7_3
			})
		end
	end

	arg_7_0.selectedPackageType = nil

	arg_7_0:updateData()
	arg_7_0:initToggleList()
	arg_7_0:updateToggleList()

	local var_7_1 = arg_7_0:GetDefaultShopIndex()

	triggerButton(arg_7_0:findTF("toggleGroup"):GetChild(arg_7_0.packageSortList[var_7_1].index - 1))
	arg_7_0:UpdateShop()
end

function var_0_0.GetDefaultShopIndex(arg_8_0)
	if arg_8_0.supplyShopType == ShopConst.CATEGORY_ACTIVITY then
		local var_8_0 = arg_8_0.contextData.actId

		for iter_8_0, iter_8_1 in ipairs(arg_8_0.packageSortList) do
			if iter_8_1.shopData.activityId == var_8_0 then
				return iter_8_1.index
			end
		end
	else
		for iter_8_2, iter_8_3 in pairs(arg_8_0.packageSortList) do
			if iter_8_3.type == arg_8_0.contextData.shopID then
				local var_8_1 = arg_8_0.packageSortList[arg_8_0.supplyShopType].index
				local var_8_2 = arg_8_0.packageSortList[arg_8_0.supplyShopType].type
				local var_8_3 = arg_8_0.allShopList[var_8_2][1]
				local var_8_4, var_8_5 = arg_8_0.pages[iter_8_3.type]:CanOpen(var_8_3, arg_8_0.player)

				if var_8_4 then
					return iter_8_3.index
				end
			end
		end
	end

	for iter_8_4, iter_8_5 in pairs(arg_8_0.packageSortList) do
		local var_8_6 = arg_8_0.allShopList[iter_8_5.type][1]
		local var_8_7, var_8_8 = arg_8_0.pages[iter_8_5.type]:CanOpen(var_8_6, arg_8_0.player)

		if var_8_7 then
			return iter_8_5.index
		end
	end

	return 1
end

function var_0_0.updateToggleList(arg_9_0)
	arg_9_0.uiToggleList:align(#arg_9_0.packageSortList)
end

function var_0_0.initToggleList(arg_10_0)
	local var_10_0 = arg_10_0:findTF("toggleGroup")
	local var_10_1 = arg_10_0:findTF("toggleGroup/Toggle")

	arg_10_0.uiToggleList = UIItemList.New(var_10_0, var_10_1)

	arg_10_0.uiToggleList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventInit then
			local var_11_0 = arg_10_0.packageSortList[arg_11_1 + 1].type

			setText(arg_10_0:findTF("selected/Label", arg_11_2), i18n(ShopConst.TYPE2NAME[var_11_0]))
			setText(arg_10_0:findTF("selected/enText", arg_11_2), i18n(ShopConst.TYPE2NAME[var_11_0] .. "en"))
			setText(arg_10_0:findTF("unselected/Label", arg_11_2), i18n(ShopConst.TYPE2NAME[var_11_0]))

			local var_11_1 = arg_10_0.packageSortList[arg_11_1 + 1].index
			local var_11_2 = arg_10_0.allShopList[var_11_0][1]
			local var_11_3, var_11_4 = arg_10_0.pages[var_11_0]:CanOpen(var_11_2, arg_10_0.player)

			if var_11_3 == false then
				setActive(arg_10_0:findTF("unselected/Label/lock", arg_11_2), true)
			else
				setActive(arg_10_0:findTF("unselected/Label/lock", arg_11_2), false)
			end

			setActive(arg_11_2:Find("unselected"), true)
			setActive(arg_11_2:Find("selected"), false)
		elseif arg_11_0 == UIItemList.EventUpdate then
			onButton(arg_10_0, arg_11_2, function()
				local var_12_0 = arg_10_0.packageSortList[arg_11_1 + 1].index

				if arg_10_0.selectedPackageType == var_12_0 then
					return
				end

				local var_12_1 = arg_10_0.packageSortList[arg_11_1 + 1].type
				local var_12_2 = arg_10_0.allShopList[var_12_1][1]
				local var_12_3, var_12_4 = arg_10_0.pages[var_12_1]:CanOpen(var_12_2, arg_10_0.player)

				if var_12_3 == false then
					pg.TipsMgr.GetInstance():ShowTips(var_12_4)

					return
				end

				setActive(arg_11_2:Find("unselected"), false)
				setActive(arg_11_2:Find("selected"), true)

				if arg_10_0.prevBtn then
					setActive(arg_10_0.prevBtn:Find("unselected"), true)
					setActive(arg_10_0.prevBtn:Find("selected"), false)
				end

				arg_10_0.prevBtn = arg_11_2
				arg_10_0.selectedPackageType = var_12_0
				arg_10_0.contextData.shopID = var_12_1

				arg_10_0:UpdateShop()
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.updateGoodsData(arg_13_0)
	arg_13_0.firstChargeIds = arg_13_0.contextData.firstChargeIds
	arg_13_0.chargedList = arg_13_0.contextData.chargedList
	arg_13_0.normalList = arg_13_0.contextData.normalList
	arg_13_0.normalGroupList = arg_13_0.contextData.normalGroupList
end

function var_0_0.setGoodData(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	arg_14_0.firstChargeIds = arg_14_1
	arg_14_0.chargedList = arg_14_2
	arg_14_0.normalList = arg_14_3
	arg_14_0.normalGroupList = arg_14_4
end

function var_0_0.updateData(arg_15_0)
	arg_15_0.player = getProxy(PlayerProxy):getData()
end

function var_0_0.RefreshResItemList(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in ipairs(arg_16_1) do
		arg_16_0.shopResItemList[iter_16_0] = arg_16_0.shopResItemList[iter_16_0] or ShopResItem.New(go(arg_16_0.shopResItem), arg_16_0.shopResParent)

		arg_16_0.shopResItemList[iter_16_0]:SetData(iter_16_1.type, iter_16_1.resID, iter_16_1.cnt)
	end

	for iter_16_2 = #arg_16_1 + 1, #arg_16_0.shopResItemList do
		arg_16_0.shopResItemList[iter_16_2]:Show(false)
	end
end

function var_0_0.DestroyResItemList(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.shopResItemList or {}) do
		iter_17_1:Dispose()
	end

	arg_17_0.shopResItemList = nil
end

function var_0_0.IsSupplyShop(arg_18_0)
	return true
end

function var_0_0.SetPlayer(arg_19_0, arg_19_1)
	arg_19_0.page:SetPlayer(arg_19_1)
end

function var_0_0.reUpdateAll(arg_20_0)
	arg_20_0:updateData()
end

function var_0_0.OnUpdateItems(arg_21_0, arg_21_1)
	arg_21_0.items = arg_21_1

	if arg_21_0.packageSortList then
		local var_21_0 = arg_21_0.packageSortList[arg_21_0.selectedPackageType]

		arg_21_0.pages[var_21_0.type]:SetItems(arg_21_1)
	end
end

function var_0_0.OnUpdateShop(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.pages[arg_22_1]

	if arg_22_0.page == var_22_0 then
		arg_22_0.page:UpdateShop(arg_22_2)
	end

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.packageSortList) do
		if iter_22_1.shopData:IsSameKind(arg_22_2) then
			iter_22_1.shopData = arg_22_2

			break
		end
	end
end

function var_0_0.OnUpdateCommodity(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = arg_23_0.pages[arg_23_1]

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.packageSortList) do
		if iter_23_1.shopData:IsSameKind(arg_23_2) then
			iter_23_1.shopData = arg_23_2

			if arg_23_0.page == var_23_0 then
				arg_23_0.page:UpdateCommodity(arg_23_2, arg_23_3)
			end

			break
		end
	end
end

function var_0_0.OnFragmentSellUpdate(arg_24_0)
	if arg_24_0.page == arg_24_0.pages[ShopConst.TYPE_FRAGMENT] then
		arg_24_0.page:OnFragmentSellUpdate()
	end
end

function var_0_0.UpdateShop(arg_25_0)
	local var_25_0 = arg_25_0.packageSortList[arg_25_0.selectedPackageType]
	local var_25_1 = var_25_0.shopData
	local var_25_2 = arg_25_0.pages[var_25_0.type]
	local var_25_3, var_25_4 = var_25_2:CanOpen(var_25_1, arg_25_0.player)

	if var_25_3 then
		if arg_25_0.page then
			arg_25_0.page:Hide()
		end

		var_25_2:SetUp(var_25_1, arg_25_0.player, arg_25_0.items)

		arg_25_0.page = var_25_2
	else
		pg.TipsMgr.GetInstance():ShowTips(var_25_4)
	end
end

function var_0_0.ShowPanel(arg_26_0, arg_26_1)
	if arg_26_0._go then
		setActive(arg_26_0._go, arg_26_1)
	end
end

function var_0_0.blurView(arg_27_0)
	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_OVERLAY_FOREVER, arg_27_0._tf, {
		pbList = {
			arg_27_0:findTF("bg")
		}
	})
end

function var_0_0.unBlurView(arg_28_0)
	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_28_0._tf, arg_28_0._parentTf)
end

return var_0_0

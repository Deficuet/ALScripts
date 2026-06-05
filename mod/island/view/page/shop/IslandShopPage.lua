local var_0_0 = class("IslandShopPage", import("..ship.IslandBaseShipDisplayPage"))
local var_0_1 = pg.island_item_data_template

var_0_0.CharaSetModel = {
	current = 1,
	default = 2
}

function var_0_0.getUIName(arg_1_0)
	return "IslandShopUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.bg = arg_2_0._tf:Find("bg")
	arg_2_0.bgColor = arg_2_0.bg:Find("color")
	arg_2_0.closeBtn = arg_2_0._tf:Find("adapt/top/closeBtn")
	arg_2_0.helpBtn = arg_2_0._tf:Find("adapt/top/helpBtn")
	arg_2_0.title = arg_2_0._tf:Find("adapt/top/title")
	arg_2_0.resourceList = UIItemList.New(arg_2_0._tf:Find("adapt/top/resources"), arg_2_0._tf:Find("adapt/top/resources/resourceTpl"))
	arg_2_0.shop1List = UIItemList.New(arg_2_0._tf:Find("adapt/shop1List"), arg_2_0._tf:Find("adapt/shop1List/shop1Tpl"))
	arg_2_0.shop3 = arg_2_0._tf:Find("adapt/shop3List")
	arg_2_0.shop3List = UIItemList.New(arg_2_0._tf:Find("adapt/shop3List"), arg_2_0._tf:Find("adapt/shop3List/shop3Tpl"))
	arg_2_0.shop32 = arg_2_0._tf:Find("adapt/shop3List2")
	arg_2_0.shop3List2 = UIItemList.New(arg_2_0._tf:Find("adapt/shop3List2"), arg_2_0._tf:Find("adapt/shop3List2/shop3Tpl"))
	arg_2_0.recommendationPage5 = arg_2_0._tf:Find("adapt/shopPage/recommendation5")
	arg_2_0.recommendationPage1 = arg_2_0._tf:Find("adapt/shopPage/recommendation1")
	arg_2_0.shop2DPage = arg_2_0._tf:Find("adapt/shopPage/shop2D")
	arg_2_0.shop3DPage = arg_2_0._tf:Find("adapt/shopPage/shop3D")
	arg_2_0.shopFurniturePage = arg_2_0._tf:Find("adapt/shopPage/shopFurniture")
	arg_2_0.shopSkinPage = arg_2_0._tf:Find("adapt/shopPage/shopSkin")
	arg_2_0.morphBtn = arg_2_0.shopSkinPage:Find("morphBtn")
	arg_2_0.morphBlocker = arg_2_0._tf:Find("morph_blocker")

	setActive(arg_2_0.morphBlocker, false)

	arg_2_0.changeCharaPanel = arg_2_0.shopSkinPage:Find("changeCharaPanel/panel")
	arg_2_0.subPageContainer = arg_2_0._tf:Find("adapt/subPageContainer")
	arg_2_0.drawAwardPage = IslandShopDrawAwardPage.New(arg_2_0.subPageContainer, arg_2_0)

	setText(arg_2_0.shopSkinPage:Find("changeCharaPanel/panel/title"), i18n("island_3Dshop_chara_choose"))
	setText(arg_2_0.shopSkinPage:Find("changeCharaPanel/panel/setTxt"), i18n("island_3Dshop_chara_set"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.helpBtn, function()
		arg_3_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_COMMON,
			content = i18n("island_draw_help"),
			alignment = TextAnchor.MiddleLeft
		})
	end, SFX_PANEL)
	arg_3_0:InitData()
end

function var_0_0.InitData(arg_6_0)
	arg_6_0.shopAgency = getProxy(IslandProxy):GetIsland():GetShopAgency()
	arg_6_0.inventoryAgency = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	arg_6_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	arg_6_0.player = getProxy(PlayerProxy):getRawData()
	arg_6_0.ships = arg_6_0.characterAgency:GetShips()
	arg_6_0.defaultShipId = PlayerPrefs.GetInt("island_dressShop_defaultShipId_" .. arg_6_0.player.id, 10703)
	arg_6_0.islandShipDressHelper = IslandShipDressHelperNew.New()
end

function var_0_0.DoUpdateShops(arg_7_0)
	local var_7_0 = arg_7_0.shopAgency:GetNewOrOverdueShopIds()

	if #var_7_0 > 0 then
		for iter_7_0, iter_7_1 in ipairs(var_7_0) do
			arg_7_0:emit(IslandMediator.GET_SHOP_DATA, iter_7_1, true)
		end
	end

	arg_7_0.showingShop = nil
	arg_7_0.selectShipId = arg_7_0.defaultShipId
end

function var_0_0.DoUpdateShowingShop(arg_8_0)
	if arg_8_0.showingShop:IsInTime() then
		arg_8_0:emit(IslandMediator.GET_SHOP_DATA, arg_8_0.showingShop.id, false)
	else
		arg_8_0:SetShopPage()
	end

	if isActive(arg_8_0.shop3) or isActive(arg_8_0.shop32) then
		local var_8_0 = arg_8_0.showingShop:GetShowType()

		setActive(arg_8_0.shop3, var_8_0 == IslandConst.SHOP_TYPE_RECOMMENDATION_5 or var_8_0 == IslandConst.SHOP_TYPE_RECOMMENDATION_1 or var_8_0 == IslandConst.SHOP_TYPE_2D)
		setActive(arg_8_0.shop32, var_8_0 == IslandConst.SHOP_TYPE_3D or var_8_0 == IslandConst.SHOP_TYPE_FURNITURE or var_8_0 == IslandConst.SHOP_TYPE_SKIN)
	end
end

function var_0_0.UpdateData(arg_9_0)
	arg_9_0.firstShopConfigs = arg_9_0.shopAgency:GetFirstShopConfigs(arg_9_0.showTypes, arg_9_0.firstShopIds)

	if not arg_9_0.showingShop or not arg_9_0.shopAgency:IsShowShop(arg_9_0.showingShop.id) then
		arg_9_0.showingShop = arg_9_0.shopAgency:GetInitShowingShop(arg_9_0.showTypes, arg_9_0.firstShopIds)
	end
end

function var_0_0.SetShopPageVisible(arg_10_0, arg_10_1)
	setActive(arg_10_0._tf:Find("adapt/shopPage"), arg_10_1)

	if not IsNil(arg_10_0.roleContainer) then
		setActive(arg_10_0.roleContainer, arg_10_1)
	end
end

function var_0_0.GetShopConfigIds(arg_11_0, arg_11_1)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		table.insert(var_11_0, iter_11_1.id)
	end

	return var_11_0
end

function var_0_0.GetRecommendationTargetShop(arg_12_0, arg_12_1)
	if not arg_12_1 then
		return nil
	end

	if arg_12_1.shop_type ~= 0 then
		return arg_12_0.shopAgency:GetShopById(arg_12_1.id)
	end

	if arg_12_1.tag_type == 1 then
		local var_12_0 = arg_12_0.shopAgency:GetSecondShopConfigs(arg_12_0.showTypes, arg_12_1.id)

		for iter_12_0, iter_12_1 in ipairs(var_12_0) do
			local var_12_1 = arg_12_0:GetRecommendationTargetShop(iter_12_1)

			if var_12_1 then
				return var_12_1
			end
		end
	elseif arg_12_1.tag_type == 2 then
		local var_12_2 = arg_12_0.shopAgency:GetThirdShopConfigs(arg_12_0.showTypes, arg_12_1.id)

		for iter_12_2, iter_12_3 in ipairs(var_12_2) do
			local var_12_3 = arg_12_0:GetRecommendationTargetShop(iter_12_3)

			if var_12_3 then
				return var_12_3
			end
		end
	end

	return nil
end

function var_0_0.JumpToRecommendationShop(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:GetRecommendationTargetShop(pg.island_shop_template[arg_13_1])

	if not var_13_0 then
		return
	end

	arg_13_0.showingShop = var_13_0

	if arg_13_0.showingShop:IsInTime() then
		arg_13_0:emit(IslandMediator.GET_SHOP_DATA, arg_13_0.showingShop.id, true)
	else
		arg_13_0:UpdateData()
		arg_13_0:SetShopList()
	end
end

function var_0_0.SetThirdShopTpl(arg_14_0, arg_14_1, arg_14_2)
	setActive(arg_14_1:Find("selected"), arg_14_0.showingShop.id == arg_14_2.id)
	setText(arg_14_1:Find("name"), arg_14_2.tag_icon[1])
	setText(arg_14_1:Find("selected/name"), arg_14_2.tag_icon[1])
	setActive(arg_14_1:Find("icon"), arg_14_2.tag_icon[3])

	if arg_14_2.tag_icon[3] then
		LoadImageSpriteAsync(arg_14_2.tag_icon[3], arg_14_1:Find("icon"), false)
	end

	local var_14_0 = arg_14_0.shopAgency:GetShopById(arg_14_2.id):IsInTime()

	setActive(arg_14_1:Find("lock"), not var_14_0)
	setActive(arg_14_1:Find("selected/lock"), not var_14_0)
end

function var_0_0.SelectThirdShop(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4, arg_15_5, arg_15_6, arg_15_7)
	if arg_15_0.currentShop1TgIndex == arg_15_4 and arg_15_0.currentShop2TgIndex == arg_15_5 and arg_15_0.currentShop3TgIndex == arg_15_6 then
		return
	end

	for iter_15_0 = 0, arg_15_2.childCount - 1 do
		setActive(arg_15_2:GetChild(iter_15_0):Find("selected"), false)
	end

	setActive(arg_15_1:Find("selected"), true)

	if arg_15_7 then
		arg_15_1:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop3List_Selected")
	end

	arg_15_0.showingShop = arg_15_0.shopAgency:GetShopById(arg_15_3.id)

	arg_15_0:DoUpdateShowingShop()

	arg_15_0.currentShop3TgIndex = arg_15_6
end

function var_0_0.BindThirdShopList(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4, arg_16_5, arg_16_6)
	local var_16_0 = arg_16_0:GetShopConfigIds(arg_16_3)

	arg_16_1:make(function(arg_17_0, arg_17_1, arg_17_2)
		if arg_17_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_17_0 = arg_17_1 + 1
		local var_17_1 = arg_16_3[var_17_0]

		arg_16_0:SetThirdShopTpl(arg_17_2, var_17_1)
		onToggle(arg_16_0, arg_17_2, function(arg_18_0)
			if arg_18_0 then
				arg_16_0:SelectThirdShop(arg_17_2, arg_16_2, var_17_1, arg_16_4, arg_16_5, var_17_0, arg_16_6)
			end
		end, SFX_PANEL)

		if arg_16_0.showingShop.id == var_17_1.id then
			triggerToggle(arg_17_2, true)
		end

		if arg_17_1 == 0 and not table.contains(var_16_0, arg_16_0.showingShop.id) then
			triggerToggle(arg_17_2, true)
		end
	end, SFX_PANEL)
	arg_16_1:align(#arg_16_3)
end

function var_0_0.BindThirdShopLists(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0:BindThirdShopList(arg_19_0.shop3List, arg_19_0.shop3, arg_19_1, arg_19_2, arg_19_3, true)
	arg_19_0:BindThirdShopList(arg_19_0.shop3List2, arg_19_0.shop32, arg_19_1, arg_19_2, arg_19_3, false)
end

function var_0_0.SetSecondShopTpl(arg_20_0, arg_20_1, arg_20_2)
	setActive(arg_20_1:Find("selected"), arg_20_0.showingShop.id == arg_20_2.id or arg_20_0.showingShop:GetSecondShopId() == arg_20_2.id)
	setText(arg_20_1:Find("name"), arg_20_2.tag_icon[1])
	setText(arg_20_1:Find("selected/name"), arg_20_2.tag_icon[1])
end

function var_0_0.SelectSecondShop(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	if arg_21_0.currentShop1TgIndex == arg_21_3 and arg_21_0.currentShop2TgIndex == arg_21_4 then
		return
	end

	arg_21_1:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop2List_Selected")
	setActive(arg_21_0.shop3, arg_21_2.shop_type == 0)
	setActive(arg_21_0.shop32, arg_21_2.shop_type == 0)

	if arg_21_2.shop_type == 0 then
		local var_21_0 = arg_21_0.shopAgency:GetThirdShopConfigs(arg_21_0.showTypes, arg_21_2.id)

		arg_21_0:BindThirdShopLists(var_21_0, arg_21_3, arg_21_4)
	else
		arg_21_0.showingShop = arg_21_0.shopAgency:GetShopById(arg_21_2.id)

		arg_21_0:DoUpdateShowingShop()
	end

	arg_21_0.currentShop2TgIndex = arg_21_4
end

function var_0_0.BindSecondShopList(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = arg_22_0.shopAgency:GetSecondShopConfigs(arg_22_0.showTypes, arg_22_2.id)
	local var_22_1 = arg_22_0:GetShopConfigIds(var_22_0)
	local var_22_2 = UIItemList.New(arg_22_1:Find("shop2List"), arg_22_1:Find("shop2List/shop2Tpl"))

	var_22_2:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_23_0 = arg_23_1 + 1
		local var_23_1 = var_22_0[var_23_0]

		arg_22_0:SetSecondShopTpl(arg_23_2, var_23_1)
		onToggle(arg_22_0, arg_23_2, function(arg_24_0)
			if arg_24_0 then
				arg_22_0:SelectSecondShop(arg_23_2, var_23_1, arg_22_3, var_23_0)
			end
		end, SFX_PANEL)

		if arg_22_0.showingShop.id == var_23_1.id or arg_22_0.showingShop:GetSecondShopId() == var_23_1.id then
			triggerToggle(arg_23_2, true)
		end

		if arg_23_1 == 0 and not table.contains(var_22_1, arg_22_0.showingShop.id) and not table.contains(var_22_1, arg_22_0.showingShop:GetSecondShopId()) then
			triggerToggle(arg_23_2, true)
		end
	end)
	var_22_2:align(#var_22_0)
end

function var_0_0.SelectFirstShop(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	if arg_25_0.currentShop1TgIndex == arg_25_3 then
		return
	end

	arg_25_0:SetShopPageVisible(true)
	setActive(arg_25_0.shop3, false)
	setActive(arg_25_0.shop32, false)
	arg_25_1:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop1List_Selected")
	setActive(arg_25_1:Find("shop2List"), arg_25_2.shop_type == 0)

	if arg_25_2.shop_type == 0 then
		arg_25_0:BindSecondShopList(arg_25_1, arg_25_2, arg_25_3)
	else
		arg_25_0.showingShop = arg_25_0.shopAgency:GetShopById(arg_25_2.id)

		arg_25_0:DoUpdateShowingShop()
	end

	arg_25_0.currentShop1TgIndex = arg_25_3
end

function var_0_0.BindFirstShopTab(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	setActive(arg_26_1:Find("shop2List"), false)
	GetImageSpriteFromAtlasAsync("island/islandshopicon", arg_26_2.tag_icon[3], arg_26_1:Find("shop1Tg/selected/icon"), false)
	setText(arg_26_1:Find("shop1Tg/name"), arg_26_2.tag_icon[1])
	setText(arg_26_1:Find("shop1Tg/name/en"), arg_26_2.tag_icon[2])
	onToggle(arg_26_0, arg_26_1:Find("shop1Tg"), function(arg_27_0)
		if arg_27_0 then
			arg_26_0:SelectFirstShop(arg_26_1, arg_26_2, arg_26_3)
		else
			setActive(arg_26_1:Find("shop2List"), false)
		end
	end, SFX_PANEL)

	if arg_26_0.showingShop.id == arg_26_2.id or arg_26_0.showingShop:GetFirstShopId() == arg_26_2.id then
		triggerToggle(arg_26_1:Find("shop1Tg"), true)
	end
end

function var_0_0.BindDrawAwardTab(arg_28_0, arg_28_1, arg_28_2)
	setActive(arg_28_1:Find("shop2List"), false)
	setText(arg_28_1:Find("shop1Tg/name"), i18n("island_draw_tab"))
	setText(arg_28_1:Find("shop1Tg/name/en"), i18n("island_draw_tab_en"))
	setActive(arg_28_1:Find("shop1Tg/selected/icon"), false)
	onToggle(arg_28_0, arg_28_1:Find("shop1Tg"), function(arg_29_0)
		if arg_29_0 then
			if arg_28_0.currentShop1TgIndex == arg_28_2 then
				return
			end

			arg_28_0.currentShop1TgIndex = arg_28_2

			arg_28_1:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop1List_Selected")
			setText(arg_28_0.title:Find("Text"), i18n("island_draw_tab"))
			arg_28_0:SetResources()
			arg_28_0:SetShopPageVisible(false)
			setActive(arg_28_0.shop3, false)
			setActive(arg_28_0.shop32, false)
			arg_28_0.drawAwardPage:ActionInvoke("UpdateActivity", arg_28_0.drawAwardActivity)
			arg_28_0.drawAwardPage:ExecuteAction("Show")
		else
			arg_28_0.drawAwardPage:ExecuteAction("Hide")
		end
	end, SFX_PANEL)
end

function var_0_0.SetShopList(arg_30_0)
	arg_30_0.currentShop1TgIndex = nil
	arg_30_0.currentShop2TgIndex = nil
	arg_30_0.currentShop3TgIndex = nil

	arg_30_0.shop1List:make(function(arg_31_0, arg_31_1, arg_31_2)
		arg_31_1 = arg_31_1 + 1

		if arg_31_0 == UIItemList.EventUpdate then
			local var_31_0 = arg_30_0.firstShopConfigs[arg_31_1]

			if var_31_0 then
				arg_30_0:BindFirstShopTab(arg_31_2, var_31_0, arg_31_1)
			else
				arg_30_0:BindDrawAwardTab(arg_31_2, arg_31_1)
			end
		end
	end)
	arg_30_0.shop1List:align(#arg_30_0.firstShopConfigs + (arg_30_0.showDrawAward and arg_30_0.drawAwardActivity and 1 or 0))
end

function var_0_0.SetShopPage(arg_32_0)
	local var_32_0 = arg_32_0.showingShop:GetShowType()

	setText(arg_32_0.title:Find("Text"), arg_32_0.showingShop:GetShopIcon()[1])
	setText(arg_32_0.title:Find("Text/en"), arg_32_0.showingShop:GetShopIcon()[2])
	arg_32_0:SetResources()
	setActive(arg_32_0.recommendationPage1, var_32_0 == IslandConst.SHOP_TYPE_RECOMMENDATION_1)
	setActive(arg_32_0.recommendationPage5, var_32_0 == IslandConst.SHOP_TYPE_RECOMMENDATION_5)
	setActive(arg_32_0.shop2DPage, var_32_0 == IslandConst.SHOP_TYPE_2D)
	setActive(arg_32_0.shop3DPage, var_32_0 == IslandConst.SHOP_TYPE_3D)
	setActive(arg_32_0.shopFurniturePage, var_32_0 == IslandConst.SHOP_TYPE_FURNITURE)
	setActive(arg_32_0.shopSkinPage, var_32_0 == IslandConst.SHOP_TYPE_SKIN)
	switch(var_32_0, {
		[IslandConst.SHOP_TYPE_RECOMMENDATION_1] = function()
			arg_32_0:ShowRecommendation1()
		end,
		[IslandConst.SHOP_TYPE_RECOMMENDATION_5] = function()
			arg_32_0:ShowRecommendation5()
		end,
		[IslandConst.SHOP_TYPE_2D] = function()
			arg_32_0:ShowShop2D()
		end,
		[IslandConst.SHOP_TYPE_3D] = function()
			arg_32_0:ShowShop3D()
		end,
		[IslandConst.SHOP_TYPE_FURNITURE] = function()
			arg_32_0:ShowShopFurniture()
		end,
		[IslandConst.SHOP_TYPE_SKIN] = function()
			arg_32_0:ShowShopSkin()
		end
	})
end

function var_0_0.SetResources(arg_39_0)
	arg_39_0.player = getProxy(PlayerProxy):getRawData()

	local var_39_0 = not arg_39_0.firstShopConfigs[arg_39_0.currentShop1TgIndex]

	setActive(arg_39_0.helpBtn, var_39_0)

	if var_39_0 then
		local var_39_1 = {}

		table.insert(var_39_1, Drop.New({
			type = DROP_TYPE_VITEM,
			id = arg_39_0.drawAwardActivity:GetDrawConfig("cost_free")
		}))
		table.insert(var_39_1, Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = PlayerConst.ResDiamond
		}))
		arg_39_0.resourceList:make(function(arg_40_0, arg_40_1, arg_40_2)
			arg_40_1 = arg_40_1 + 1

			if arg_40_0 == UIItemList.EventUpdate then
				local var_40_0 = var_39_1[arg_40_1]
				local var_40_1

				eachChild(arg_40_2, function(arg_41_0, arg_41_1)
					setActive(arg_41_0, arg_41_0.name == "islandItem")

					if arg_41_0.name == "islandItem" then
						var_40_1 = arg_41_0
					end
				end)
				GetImageSpriteFromAtlasAsync(var_40_0:getIcon(), "", var_40_1:Find("icon"))
				setText(var_40_1:Find("Text"), var_40_0:getOwnedCount())
				setActive(var_40_1:Find("add"), false)
				setActive(var_40_1:Find("add"), false)
				setActive(var_40_1:Find("descBtn"), false)
				setActive(var_40_1:Find("resourceDesc"), false)
			end
		end)
		arg_39_0.resourceList:align(#var_39_1)

		return
	end

	local var_39_2 = arg_39_0.showingShop:GetTopResources()

	arg_39_0.resourceList:make(function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_0 == UIItemList.EventUpdate then
			local var_42_0 = var_39_2[arg_42_1 + 1]
			local var_42_1 = var_42_0[1]
			local var_42_2 = var_42_0[2]
			local var_42_3 = var_42_0[3]

			setActive(arg_42_2:Find("gold"), false)
			setActive(arg_42_2:Find("oil"), false)
			setActive(arg_42_2:Find("gem"), false)
			setActive(arg_42_2:Find("islandItem"), false)

			if var_42_2 == DROP_TYPE_RESOURCE then
				if var_42_3 == 1 then
					setActive(arg_42_2:Find("gold"), true)

					local var_42_4 = arg_39_0.player:getLevelMaxGold()

					setText(arg_42_2:Find("gold/max"), "MAX: " .. var_42_4)
					setText(arg_42_2:Find("gold/Text"), arg_39_0.player.gold)
				elseif var_42_3 == 4 or var_42_3 == 14 then
					setActive(arg_42_2:Find("gem"), true)
					setText(arg_42_2:Find("gem/Text"), arg_39_0.player:getTotalGem())
				end
			elseif var_42_2 == DROP_TYPE_ISLAND_ITEM then
				setActive(arg_42_2:Find("islandItem"), true)

				local var_42_5 = arg_39_0.inventoryAgency:GetOwnCount(var_42_3)

				setText(arg_42_2:Find("islandItem/Text"), var_42_5)
				GetImageSpriteFromAtlasAsync(Drop.New({
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_42_3
				}):getIcon(), "", arg_42_2:Find("islandItem/icon"))
				setActive(arg_42_2:Find("islandItem/descBtn"), var_42_1 == 1)
				setActive(arg_42_2:Find("islandItem/resourceDesc"), false)

				if var_42_1 == 1 then
					local var_42_6 = pg.island_item_data_template[var_42_3].have_max

					setText(arg_42_2:Find("islandItem/Text"), var_42_5 .. "/" .. var_42_6)
					onButton(arg_39_0, arg_42_2:Find("islandItem"), function()
						setActive(arg_42_2:Find("islandItem/resourceDesc"), not isActive(arg_42_2:Find("islandItem/resourceDesc")))
						setText(arg_42_2:Find("islandItem/resourceDesc"), i18n("island_3Dshop_res_have") .. var_42_6)
					end, SFX_PANEL)
				end
			end
		end
	end)
	arg_39_0.resourceList:align(#var_39_2)
end

function var_0_0.SetCloseAndRefresh(arg_44_0, arg_44_1)
	local var_44_0 = 0

	if arg_44_0.showingShop:IsNormalShop() then
		local var_44_1 = arg_44_0.showingShop:GetExistTime()

		if type(var_44_1) == "table" then
			local var_44_2 = var_44_1[2]

			var_44_0 = pg.TimeMgr.GetInstance():Table2ServerTime({
				year = var_44_2[1][1],
				month = var_44_2[1][2],
				day = var_44_2[1][3],
				hour = var_44_2[2][1],
				min = var_44_2[2][2],
				sec = var_44_2[2][3]
			})
		end
	elseif arg_44_0.showingShop:IsTemporaryShop() then
		var_44_0 = arg_44_0.showingShop.existTime
	end

	local var_44_3 = arg_44_0.showingShop.refreshTime
	local var_44_4 = arg_44_0.showingShop:GetPlayerRefreshResource()

	setActive(arg_44_1:Find("remainAndRefresh/remainTimer"), var_44_0 ~= 0)
	setActive(arg_44_1:Find("remainAndRefresh/refresh"), var_44_3 ~= 0)
	setActive(arg_44_1:Find("remainAndRefresh/refresh/refreshBtn"), var_44_4)
	setActive(arg_44_1:Find("remainAndRefresh"), isActive(arg_44_1:Find("remainAndRefresh/remainTimer")) or isActive(arg_44_1:Find("remainAndRefresh/refresh")))

	local var_44_5 = pg.TimeMgr.GetInstance():GetTimeToNextTime()

	if arg_44_0.timer then
		arg_44_0.timer:Stop()

		arg_44_0.timer = nil
	end

	arg_44_0.timer = Timer.New(function()
		local var_45_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_44_0 ~= 0 then
			local var_45_1 = pg.TimeMgr.GetInstance():DescCDTime(var_44_0 - var_45_0)

			setText(arg_44_1:Find("remainAndRefresh/remainTimer"), i18n("island_3Dshop_time_close", var_45_1))
		elseif normalShopExistTime and type(normalShopExistTime) == "table" then
			-- block empty
		end

		if var_44_3 ~= 0 then
			local var_45_2 = pg.TimeMgr.GetInstance():DescCDTime(var_44_3 - var_45_0)

			setText(arg_44_1:Find("remainAndRefresh/refresh/refreshTimer"), i18n("island_3Dshop_time_refresh", var_45_2))

			if var_45_0 > var_44_3 then
				arg_44_0:DoUpdateShowingShop()
			end
		end

		if var_44_3 == 0 and var_44_4 and var_45_0 > var_44_5 then
			arg_44_0:DoUpdateShowingShop()
		end
	end, 1, -1)

	arg_44_0.timer:Start()

	if var_44_4 then
		onButton(arg_44_0, arg_44_1:Find("remainAndRefresh/refresh/refreshBtn/button"), function()
			local var_46_0 = arg_44_0.showingShop.refreshCount

			if var_46_0 < arg_44_0.showingShop:GetMaxRefreshCount() then
				local var_46_1 = arg_44_0.showingShop:GetFirstRefreshFree()
				local var_46_2 = var_44_4[3]

				if var_46_1 and var_46_0 == 0 then
					var_44_4[3] = 0
					var_46_2 = 0
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					noText = "text_cancel",
					hideNo = false,
					yesText = "text_confirm",
					content = i18n("refresh_shopStreet_question", i18n("word_" .. id2res(var_44_4[2]) .. "_icon"), var_46_2, var_46_0),
					onYes = function()
						arg_44_0:emit(IslandMediator.REFRESH_SHOP_BY_PLAYER, arg_44_0.showingShop.id, var_44_4)
					end
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_3Dshop_refresh_limit"))
			end
		end, SFX_PANEL)
	end
end

function var_0_0.IsCommodityInShoppingCart(arg_48_0, arg_48_1)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.shoppingCartCommodities) do
		if iter_48_1.id == arg_48_1.id then
			return true
		end
	end

	return false
end

function var_0_0.IsCommodityDisabled(arg_49_0, arg_49_1)
	return isActive(arg_49_1:Find("sellOut")) or isActive(arg_49_1:Find("hold")) or isActive(arg_49_1:Find("notInTime"))
end

function var_0_0.OpenShoppingCart(arg_50_0)
	arg_50_0.myIslandShoppingCartLayer = arg_50_0:OpenPage(IslandShoppingCartLayer, arg_50_0.shoppingCartCommodities)
end

function var_0_0.RefreshShopSkinCartButtons(arg_51_0)
	setActive(arg_51_0.shopSkinPage:Find("cancelBtn"), #arg_51_0.shoppingCartCommodities > 0)
	setActive(arg_51_0.shopSkinPage:Find("shoppingCartBtn"), #arg_51_0.shoppingCartCommodities > 0)
	setActive(arg_51_0.shopSkinPage:Find("shoppingCartBtn/count"), arg_51_0.showingShop:GetCommanderOrCharaType() == 1)
end

function var_0_0.ResetShopSkinCartPreview(arg_52_0)
	local var_52_0 = arg_52_0.shoppingCartCommodities and arg_52_0.shoppingCartCommodities[1]

	arg_52_0.shoppingCartCommodities = {}
	arg_52_0.showingCommodity = nil

	if var_52_0 and arg_52_0:IsCommanderDressCommodity(var_52_0) then
		arg_52_0:ResetCommanderDressPreview(true)
	else
		arg_52_0:ResetCommanderDressPreview(false)
		arg_52_0.islandShipDressHelper:ResetDressUp()
	end
end

function var_0_0.BindShopSkinCartButtons(arg_53_0, arg_53_1)
	if #arg_53_0.shoppingCartCommodities <= 0 then
		return
	end

	onButton(arg_53_0, arg_53_0.shopSkinPage:Find("cancelBtn"), function()
		if arg_53_1 then
			arg_53_1()
		else
			arg_53_0:ResetShopSkinCartPreview()
		end

		setActive(arg_53_0.shopSkinPage:Find("cancelBtn"), false)
		setActive(arg_53_0.shopSkinPage:Find("shoppingCartBtn"), false)
		setText(arg_53_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
		arg_53_0:SetCommodityList()
	end, SFX_PANEL)
	onButton(arg_53_0, arg_53_0.shopSkinPage:Find("shoppingCartBtn"), function()
		arg_53_0:OpenShoppingCart()
	end, SFX_PANEL)
end

function var_0_0.IsDressCommodityExclusive(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0.characterAgency:GetShipById(arg_56_0.showingShipId)
	local var_56_1 = var_56_0:GetCurrentSkinId()
	local var_56_2 = pg.island_dress_template[arg_56_1:GetItems()[1][2]]

	if var_56_1 ~= 0 then
		local var_56_3 = var_56_2.exclusive_skin

		if var_56_3 ~= "" then
			for iter_56_0, iter_56_1 in ipairs(var_56_3) do
				if iter_56_1 == var_56_1 then
					return true, var_56_2
				end
			end
		end
	else
		local var_56_4 = var_56_2.exclusive_default_skin

		if var_56_4 ~= "" then
			for iter_56_2, iter_56_3 in ipairs(var_56_4) do
				if iter_56_3 == var_56_0.id then
					return true, var_56_2
				end
			end
		end
	end

	return false, var_56_2
end

function var_0_0.IsCommanderDressCommodity(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_1:GetItems()

	if #var_57_0 == 0 or var_57_0[1][1] ~= DROP_TYPE_ISLAND_DRESS then
		return false
	end

	local var_57_1 = pg.island_dress_template[var_57_0[1][2]]

	return var_57_1 and var_57_1.belongto == 1
end

function var_0_0.CacheCommanderDressPreviewData(arg_58_0)
	if arg_58_0.commanderDressPreviewData then
		return
	end

	local var_58_0 = getProxy(IslandProxy):GetIsland():GetDressUpAgency()

	arg_58_0.commanderDressPreviewData = {}

	for iter_58_0, iter_58_1 in pairs(IslandShipDressHelperNew.CommanderCustom) do
		local var_58_1 = var_58_0:GetDressByType(iter_58_1) or 0

		arg_58_0.commanderDressPreviewData[iter_58_1] = {
			id = var_58_1,
			colorId = var_58_0:GetCurrentColorByDressId(var_58_1)
		}
	end
end

function var_0_0.RestoreCommanderDressPreview(arg_59_0)
	if not arg_59_0.commanderDressPreviewData then
		return
	end

	local var_59_0 = arg_59_0.commanderDressPreviewData

	for iter_59_0, iter_59_1 in ipairs(IslandShipDressHelperNew.CommanderCustom) do
		local var_59_1 = var_59_0[iter_59_1]

		if var_59_1 then
			arg_59_0.islandShipDressHelper:ChangeDressByType(iter_59_1, var_59_1)
		end
	end

	arg_59_0.commanderDressPreviewData = nil
end

function var_0_0.ResetCommanderDressPreview(arg_60_0, arg_60_1, arg_60_2)
	if arg_60_1 then
		arg_60_0:RestoreCommanderDressPreview()
	else
		arg_60_0.commanderDressPreviewData = nil

		if arg_60_2 then
			arg_60_0.islandShipDressHelper:InvalidateRole()
		end
	end

	arg_60_0:SetMorphBlock(false)
	setActive(arg_60_0.morphBtn, false)
end

function var_0_0.ChangeDressByCommodityItems(arg_61_0, arg_61_1)
	for iter_61_0, iter_61_1 in ipairs(arg_61_1:GetItems()) do
		local var_61_0

		if iter_61_1[1] == DROP_TYPE_ISLAND_DRESS then
			local var_61_1 = pg.island_dress_template[iter_61_1[2]]

			if var_61_1 then
				var_61_0 = var_61_1.type
			end
		end

		arg_61_0.islandShipDressHelper:ChangeDressByType(var_61_0, {
			colorId = 0,
			id = iter_61_1[2]
		})
	end
end

function var_0_0.ToggleDressSuitCommodity(arg_62_0, arg_62_1)
	arg_62_0:ResetCommanderDressPreview(false)

	arg_62_0.showingCommodity = nil

	if #arg_62_0.shoppingCartCommodities == 1 and arg_62_0.shoppingCartCommodities[1].id == arg_62_1.id then
		arg_62_0.shoppingCartCommodities = {}

		arg_62_0.islandShipDressHelper:ResetDressUp()
	else
		arg_62_0.shoppingCartCommodities = {
			arg_62_1
		}

		arg_62_0:ChangeDressByCommodityItems(arg_62_1)
	end

	setText(arg_62_0.shopSkinPage:Find("shoppingCartBtn/count"), (#arg_62_0.shoppingCartCommodities > 0 and #arg_62_1:GetDisplayItems() or 0) .. "/3")
end

function var_0_0.ChangeCommanderDressByCommodity(arg_63_0, arg_63_1)
	arg_63_0:CacheCommanderDressPreviewData()

	for iter_63_0, iter_63_1 in ipairs(arg_63_1:GetDisplayItems()) do
		if iter_63_1[1] == DROP_TYPE_ISLAND_DRESS then
			local var_63_0 = pg.island_dress_template[iter_63_1[2]]

			if var_63_0 then
				local var_63_1 = iter_63_1[2]

				if var_63_0.type == IslandShipDressHelperNew.DressType.Body then
					local var_63_2 = getProxy(IslandProxy):GetIsland():GetDressUpAgency():GetTwinCurId(var_63_1)

					if var_63_2 and var_63_2 ~= 0 then
						var_63_1 = var_63_2
					end
				end

				arg_63_0.islandShipDressHelper:ChangeDressByType(var_63_0.type, {
					colorId = 0,
					id = var_63_1
				})
				arg_63_0:CheckCommanderHatState(var_63_0.type, var_63_1)
				arg_63_0:CheckCommanderMorphBtn(var_63_0.type, var_63_1)
			end
		end
	end
end

function var_0_0.CheckCommanderHatState(arg_64_0, arg_64_1, arg_64_2)
	if arg_64_1 ~= IslandShipDressHelperNew.DressType.Body then
		return
	end

	local var_64_0 = (pg.island_dress_template.get_id_list_by_related_dress[arg_64_2] or {})[1]

	if not var_64_0 or var_64_0 == 0 then
		arg_64_0.islandShipDressHelper:ChangeDressByType(IslandShipDressHelperNew.DressType.Hat, {
			id = 0,
			colorId = 0
		})
	elseif var_64_0 and var_64_0 ~= 0 then
		arg_64_0.islandShipDressHelper:ChangeDressByType(IslandShipDressHelperNew.DressType.Hat, {
			colorId = 0,
			id = var_64_0
		})
	end
end

function var_0_0.CheckCommanderMorphBtn(arg_65_0, arg_65_1, arg_65_2)
	if arg_65_1 ~= IslandShipDressHelperNew.DressType.Body then
		return
	end

	local var_65_0 = arg_65_2
	local var_65_1 = 0
	local var_65_2 = pg.island_dress_template[var_65_0].cloth_related

	if var_65_2 and var_65_2 ~= 0 then
		var_65_1 = var_65_2
	end

	if var_65_1 == 0 then
		setActive(arg_65_0.morphBtn, false)

		return
	end

	setActive(arg_65_0.morphBtn, true)
	onButton(arg_65_0, arg_65_0.morphBtn, function()
		arg_65_0:DoMorphSwitch(var_65_0, var_65_1)
	end)
end

function var_0_0.DoMorphSwitch(arg_67_0, arg_67_1, arg_67_2)
	if arg_67_0.morphing then
		return
	end

	arg_67_0:SetMorphBlock(true)

	if not arg_67_0.islandShipDressHelper then
		arg_67_0:DoSwitch(arg_67_2, function()
			arg_67_0:SetMorphBlock(false)
		end)

		return
	end

	arg_67_0.islandShipDressHelper:DoMorphSwitch(arg_67_1, arg_67_2, function()
		arg_67_0:DoSwitch(arg_67_2, function()
			arg_67_0:SetMorphBlock(false)
		end)
	end)
end

function var_0_0.DoSwitch(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = IslandShipDressHelperNew.DressType.Body

	arg_71_0.islandShipDressHelper:ChangeDressByType(var_71_0, {
		colorId = 0,
		id = arg_71_1
	}, arg_71_2)
	arg_71_0:CheckCommanderHatState(IslandShipDressHelperNew.DressType.Body, arg_71_1)
	arg_71_0:CheckCommanderMorphBtn(var_71_0, arg_71_1)
end

function var_0_0.SetMorphBlock(arg_72_0, arg_72_1)
	arg_72_0.morphing = arg_72_1

	setActive(arg_72_0.morphBlocker, arg_72_1)
end

function var_0_0.ToggleCommanderDressCommodity(arg_73_0, arg_73_1)
	if #arg_73_0.shoppingCartCommodities == 1 and arg_73_0.shoppingCartCommodities[1].id == arg_73_1.id then
		arg_73_0.shoppingCartCommodities = {}

		arg_73_0:ResetCommanderDressPreview(true)
	else
		arg_73_0.shoppingCartCommodities = {
			arg_73_1
		}

		arg_73_0:ChangeCommanderDressByCommodity(arg_73_1)
	end

	setText(arg_73_0.shopSkinPage:Find("shoppingCartBtn/count"), (#arg_73_0.shoppingCartCommodities > 0 and #arg_73_1:GetDisplayItems() or 0) .. "/3")
end

function var_0_0.RemoveSameDressTypeCommodity(arg_74_0, arg_74_1)
	local var_74_0 = 0

	for iter_74_0, iter_74_1 in ipairs(arg_74_0.shoppingCartCommodities) do
		if iter_74_1:GetDressType() == arg_74_1:GetDressType() then
			var_74_0 = iter_74_1.id

			table.remove(arg_74_0.shoppingCartCommodities, iter_74_0)

			break
		end
	end

	return var_74_0
end

function var_0_0.ToggleSingleDressCommodity(arg_75_0, arg_75_1)
	local var_75_0, var_75_1 = arg_75_0:IsDressCommodityExclusive(arg_75_1)

	if var_75_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_mutually_exclusive1", var_75_1.name))

		return false
	end

	arg_75_0:ResetCommanderDressPreview(false)

	arg_75_0.showingCommodity = nil

	if #arg_75_0.shoppingCartCommodities > 0 and #arg_75_0.shoppingCartCommodities[1]:GetItems() > 1 then
		arg_75_0.shoppingCartCommodities = {}

		arg_75_0.islandShipDressHelper:ResetDressUp()
	end

	local var_75_2 = arg_75_0:RemoveSameDressTypeCommodity(arg_75_1)

	if arg_75_1.id == var_75_2 then
		arg_75_0.islandShipDressHelper:ChangeDressByType(arg_75_1:GetDressType(), {
			id = 0,
			colorId = 0
		})
	else
		table.insert(arg_75_0.shoppingCartCommodities, arg_75_1)
		arg_75_0.islandShipDressHelper:ChangeDressByType(arg_75_1:GetDressType(), {
			colorId = 0,
			id = arg_75_1:GetItems()[1][2]
		})
	end

	setText(arg_75_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_75_0.shoppingCartCommodities .. "/3")

	return true
end

function var_0_0.HandleDressCommodity(arg_76_0, arg_76_1)
	if arg_76_0:IsCommanderDressCommodity(arg_76_1) then
		arg_76_0:ToggleCommanderDressCommodity(arg_76_1)
	elseif #arg_76_1:GetItems() > 1 then
		arg_76_0:ToggleDressSuitCommodity(arg_76_1)
	elseif not arg_76_0:ToggleSingleDressCommodity(arg_76_1) then
		return
	end

	arg_76_0:RefreshShopSkinCartButtons()
	arg_76_0:BindShopSkinCartButtons()
	arg_76_0:SetCommodityList()
end

function var_0_0.HandleFurnitureCommodity(arg_77_0, arg_77_1)
	arg_77_0:ResetCommanderDressPreview(false, true)

	if arg_77_0.showingCommodity ~= arg_77_1 then
		arg_77_0.showingCommodity = arg_77_1
		arg_77_0.shoppingCartCommodities = {
			arg_77_1
		}

		arg_77_0:LoadFurniture(arg_77_1:GetModel(), arg_77_1:GetModelParam())
		setActive(arg_77_0.shopFurniturePage:Find("scenePreviewBtn"), false)
		setActive(arg_77_0.shopFurniturePage:Find("shoppingCartBtn"), true)

		if #arg_77_1:GetItems() == 1 then
			onButton(arg_77_0, arg_77_0.shopFurniturePage:Find("scenePreviewBtn"), function()
				setActive(arg_77_0._tf, false)
				arg_77_0:ClearCharacterScene()
				arg_77_0:emit(IslandMediator.PREVIEW_FURNITURE, arg_77_1:GetItems()[1][2])
			end, SFX_PANEL)
		end

		onButton(arg_77_0, arg_77_0.shopFurniturePage:Find("shoppingCartBtn"), function()
			arg_77_0:OpenShoppingCart()
		end, SFX_PANEL)
	else
		arg_77_0.showingCommodity = nil
		arg_77_0.shoppingCartCommodities = {}

		arg_77_0:UnloadCharacter()
		setActive(arg_77_0.shopFurniturePage:Find("scenePreviewBtn"), false)
		setActive(arg_77_0.shopFurniturePage:Find("shoppingCartBtn"), false)
	end

	arg_77_0:SetCommodityList()
end

function var_0_0.HandleSkinCommodity(arg_80_0, arg_80_1)
	arg_80_0:ResetCommanderDressPreview(false, true)

	if arg_80_0.showingCommodity ~= arg_80_1 then
		arg_80_0.showingCommodity = arg_80_1
		arg_80_0.shoppingCartCommodities = {
			arg_80_1
		}

		local var_80_0 = pg.island_skin_template[arg_80_1:GetItems()[1][2]].model
		local var_80_1 = pg.island_unit_character[var_80_0]

		arg_80_0:LoadCharacter(var_80_1, false)
	else
		arg_80_0.showingCommodity = nil
		arg_80_0.shoppingCartCommodities = {}

		arg_80_0:UnloadCharacter()
	end

	setActive(arg_80_0.shopSkinPage:Find("cancelBtn"), false)
	setActive(arg_80_0.shopSkinPage:Find("shoppingCartBtn"), #arg_80_0.shoppingCartCommodities > 0)
	setActive(arg_80_0.shopSkinPage:Find("shoppingCartBtn/count"), false)
	setText(arg_80_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_80_0.shoppingCartCommodities .. "/3")
	arg_80_0:BindShopSkinCartButtons(function()
		arg_80_0.shoppingCartCommodities = {}

		local var_81_0 = arg_80_0.characterAgency:GetShipById(arg_80_0.showingShipId):GetModel()

		arg_80_0:LoadCharacter(var_81_0, false)
	end)
	arg_80_0:SetCommodityList()
end

function var_0_0.SetCommodity(arg_82_0, arg_82_1, arg_82_2)
	var_0_0.StaticUpdateCommodityTpl(arg_82_1, arg_82_2)
	setActive(arg_82_1:Find("notInTime"), not arg_82_0.showingShop:IsInTime())
	setActive(arg_82_1:Find("select"), arg_82_0:IsCommodityInShoppingCart(arg_82_2))

	if arg_82_0:IsCommodityDisabled(arg_82_1) then
		removeOnButton(arg_82_1)
	else
		onButton(arg_82_0, arg_82_1, function()
			switch(arg_82_2:GetCommodityShowType(), {
				[IslandConst.COMMODITY_SHOW_ITEM] = function()
					arg_82_0.myIslandShopItemLayer = arg_82_0:OpenPage(IslandShopItemLayer, arg_82_0.showingShop.id, arg_82_2)
				end,
				[IslandConst.COMMODITY_SHOW_DRESS] = function()
					arg_82_0:HandleDressCommodity(arg_82_2)
				end,
				[IslandConst.COMMODITY_SHOW_FURNITURE] = function()
					arg_82_0:HandleFurnitureCommodity(arg_82_2)
				end,
				[IslandConst.COMMODITY_SHOW_SKIN] = function()
					arg_82_0:HandleSkinCommodity(arg_82_2)
				end,
				[IslandConst.COMMODITY_SHOW_INVITE] = function()
					local var_88_0 = arg_82_2:GetItems()[1][2]

					arg_82_0.myIslandShopItemLayer = arg_82_0:OpenPage(IslandShopItemLayer, arg_82_0.showingShop.id, arg_82_2, var_88_0)
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.SetCommodityList(arg_89_0)
	local var_89_0 = arg_89_0.showingShop:GetShowType()
	local var_89_1 = switch(var_89_0, {
		[IslandConst.SHOP_TYPE_2D] = function()
			return UIItemList.New(arg_89_0.shop2DPage:Find("shopView/Viewport/Content"), arg_89_0.shop2DPage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end,
		[IslandConst.SHOP_TYPE_3D] = function()
			return UIItemList.New(arg_89_0.shop3DPage:Find("shopView/Viewport/Content"), arg_89_0.shop3DPage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end,
		[IslandConst.SHOP_TYPE_FURNITURE] = function()
			return UIItemList.New(arg_89_0.shopFurniturePage:Find("shopView/Viewport/Content"), arg_89_0.shopFurniturePage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end,
		[IslandConst.SHOP_TYPE_SKIN] = function()
			return UIItemList.New(arg_89_0.shopSkinPage:Find("shopView/Viewport/Content"), arg_89_0.shopSkinPage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end
	})
	local var_89_2 = arg_89_0.showingShop:GetCommodities()

	var_0_0.SortShopCommodities(var_89_2)
	var_89_1:make(function(arg_94_0, arg_94_1, arg_94_2)
		if arg_94_0 == UIItemList.EventUpdate then
			local var_94_0 = var_89_2[arg_94_1 + 1]

			arg_89_0:SetCommodity(arg_94_2, var_94_0)
		end
	end, SFX_PANEL)
	var_89_1:align(#var_89_2)
end

function var_0_0.ShowRecommendation5(arg_95_0)
	arg_95_0:ClearCharacterScene()
	arg_95_0:OverlayPanel(arg_95_0._tf, {
		pbList = {
			arg_95_0.bg
		}
	})
	setActive(arg_95_0.bgColor, true)

	arg_95_0.shoppingCartCommodities = {}
	arg_95_0.showingCommodity = nil

	arg_95_0:ResetCommanderDressPreview(false)

	local var_95_0 = arg_95_0.showingShop:GetBanners()
	local var_95_1 = arg_95_0.recommendationPage5:Find("banners")

	for iter_95_0 = 1, #var_95_0 do
		local var_95_2 = var_95_0[iter_95_0]
		local var_95_3 = var_95_1:Find("banner" .. var_95_2.id)

		if var_95_3 then
			GetImageSpriteFromAtlasAsync("activitybanner/" .. var_95_2.pic, "", var_95_3)
			onButton(arg_95_0, var_95_3, function()
				arg_95_0:JumpToRecommendationShop(var_95_2.param)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.ShowRecommendation1(arg_97_0)
	arg_97_0:ClearCharacterScene()
	arg_97_0:OverlayPanel(arg_97_0._tf, {
		pbList = {
			arg_97_0.bg
		}
	})
	setActive(arg_97_0.bgColor, true)

	arg_97_0.shoppingCartCommodities = {}
	arg_97_0.showingCommodity = nil

	arg_97_0:ResetCommanderDressPreview(false)

	local var_97_0 = arg_97_0.showingShop:GetBanners()
	local var_97_1 = arg_97_0.recommendationPage1:Find("banners")

	for iter_97_0 = 1, #var_97_0 do
		local var_97_2 = var_97_0[iter_97_0]
		local var_97_3 = var_97_1:Find("banner" .. var_97_2.id)

		if var_97_3 then
			GetImageSpriteFromAtlasAsync("activitybanner/" .. var_97_2.pic, "", var_97_3)
			onButton(arg_97_0, var_97_3, function()
				arg_97_0:JumpToRecommendationShop(var_97_2.param)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.ShowShop2D(arg_99_0)
	arg_99_0:ClearCharacterScene()
	arg_99_0:OverlayPanel(arg_99_0._tf, {
		pbList = {
			arg_99_0.bg
		}
	})
	setActive(arg_99_0.bgColor, true)

	arg_99_0.shoppingCartCommodities = {}
	arg_99_0.showingCommodity = nil

	arg_99_0:ResetCommanderDressPreview(false)

	local var_99_0 = arg_99_0.showingShop:IsInTime()

	setActive(arg_99_0.shop2DPage:Find("lock"), not var_99_0)

	if var_99_0 then
		arg_99_0:SetCloseAndRefresh(arg_99_0.shop2DPage)
	else
		setActive(arg_99_0.shop2DPage:Find("remainAndRefresh"), false)

		if arg_99_0.timer then
			arg_99_0.timer:Stop()

			arg_99_0.timer = nil
		end

		arg_99_0.timer = Timer.New(function()
			local var_100_0 = arg_99_0.showingShop:GetExistTime()[1]
			local var_100_1 = pg.TimeMgr.GetInstance():Table2ServerTime({
				year = var_100_0[1][1],
				month = var_100_0[1][2],
				day = var_100_0[1][3],
				hour = var_100_0[2][1],
				min = var_100_0[2][2],
				sec = var_100_0[2][3]
			})
			local var_100_2 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_100_3 = pg.TimeMgr.GetInstance():DescCDTime(var_100_1 - var_100_2)

			setText(arg_99_0.shop2DPage:Find("lock/openTimer"), i18n("island_3Dshop_time_unlock", var_100_3))
		end, 1, -1)

		arg_99_0.timer:Start()
	end

	arg_99_0:SetCommodityList()
end

function var_0_0.ShowShop3D(arg_101_0)
	arg_101_0:ClearCharacterScene()
	arg_101_0:OverlayPanel(arg_101_0._tf, {
		pbList = {
			arg_101_0.shop3DPage:Find("bg")
		}
	})
	setActive(arg_101_0.bgColor, false)

	arg_101_0.shoppingCartCommodities = {}
	arg_101_0.showingCommodity = nil

	arg_101_0:ResetCommanderDressPreview(false)
	arg_101_0:SetCloseAndRefresh(arg_101_0.shop3DPage)
	arg_101_0:SetCommodityList()
end

function var_0_0.ShowShopFurniture(arg_102_0)
	if not arg_102_0.isLoadCharacterScene then
		arg_102_0:PrepareCharacterScene()
	end

	arg_102_0:OverlayPanel(arg_102_0._tf, {
		pbList = {
			arg_102_0.shopFurniturePage:Find("bg")
		}
	})
	setActive(arg_102_0.bgColor, false)
	arg_102_0:UnloadCharacter()

	arg_102_0.shoppingCartCommodities = {}
	arg_102_0.showingCommodity = nil

	arg_102_0:ResetCommanderDressPreview(false)
	arg_102_0:SetCloseAndRefresh(arg_102_0.shopFurniturePage)
	arg_102_0:SetCommodityList()
	setActive(arg_102_0.shopFurniturePage:Find("scenePreviewBtn"), false)
	setActive(arg_102_0.shopFurniturePage:Find("shoppingCartBtn"), false)
end

function var_0_0.ShowShopSkin(arg_103_0)
	if not arg_103_0.isLoadCharacterScene then
		arg_103_0:PrepareCharacterScene()
	end

	arg_103_0:OverlayPanel(arg_103_0._tf, {
		pbList = {
			arg_103_0.shopSkinPage:Find("bg"),
			arg_103_0.changeCharaPanel
		}
	})
	setActive(arg_103_0.bgColor, false)

	if not arg_103_0.shoppingCartCommodities then
		arg_103_0.shoppingCartCommodities = {}
	end

	if #arg_103_0.shoppingCartCommodities > 0 then
		local var_103_0 = arg_103_0.shoppingCartCommodities[1]:GetCommodityShowType()

		if var_103_0 == IslandConst.COMMODITY_SHOW_FURNITURE or var_103_0 == IslandConst.COMMODITY_SHOW_SKIN then
			arg_103_0.shoppingCartCommodities = {}
			arg_103_0.showingCommodity = nil

			arg_103_0:ResetCommanderDressPreview(false, true)
		end
	end

	local var_103_1 = arg_103_0.showingShop:GetCommanderOrCharaType()

	if var_103_1 == 0 and (arg_103_0.showingShipId ~= 0 or #arg_103_0.shoppingCartCommodities == 0) then
		arg_103_0.showingShipId = 0

		local var_103_2 = pg.island_unit_character[0]

		arg_103_0:LoadCharacter({
			model = var_103_2.model,
			animator = var_103_2.animator
		}, true)

		arg_103_0.shoppingCartCommodities = {}
		arg_103_0.showingCommodity = nil

		arg_103_0:ResetCommanderDressPreview(false)
	elseif var_103_1 == 1 and (arg_103_0.showingShipId ~= arg_103_0.selectShipId or #arg_103_0.shoppingCartCommodities == 0) then
		arg_103_0:ResetCommanderDressPreview(false, true)

		arg_103_0.showingShipId = arg_103_0.selectShipId

		local var_103_3 = arg_103_0.characterAgency:GetShipById(arg_103_0.showingShipId):GetModel()

		arg_103_0:LoadCharacter(var_103_3, false)

		arg_103_0.shoppingCartCommodities = {}
		arg_103_0.showingCommodity = nil

		arg_103_0:ResetCommanderDressPreview(false)
	elseif var_103_1 == 2 then
		arg_103_0:ResetCommanderDressPreview(false, true)

		arg_103_0.showingShipId = arg_103_0.selectShipId

		arg_103_0:UnloadCharacter()

		arg_103_0.shoppingCartCommodities = {}
		arg_103_0.showingCommodity = nil

		arg_103_0:ResetCommanderDressPreview(false)
	end

	arg_103_0:SetCloseAndRefresh(arg_103_0.shopSkinPage)
	arg_103_0:SetCommodityList()
	setActive(arg_103_0.shopSkinPage:Find("cancelBtn"), #arg_103_0.shoppingCartCommodities > 0)
	setActive(arg_103_0.shopSkinPage:Find("changeCharaBtn"), var_103_1 == 1)
	setActive(arg_103_0.shopSkinPage:Find("shoppingCartBtn"), #arg_103_0.shoppingCartCommodities > 0)
	setActive(arg_103_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_103_0.shoppingCartCommodities > 0 and var_103_1 == 1)
	setText(arg_103_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_103_0.shoppingCartCommodities .. "/3")
	setActive(arg_103_0.shopSkinPage:Find("changeCharaPanel"), false)
	arg_103_0:SetChangeCharaPanel()
	onButton(arg_103_0, arg_103_0.shopSkinPage:Find("changeCharaBtn"), function()
		setActive(arg_103_0.shopSkinPage:Find("changeCharaPanel"), true)
	end, SFX_PANEL)
end

function var_0_0.SetChangeCharaPanel(arg_105_0)
	onButton(arg_105_0, arg_105_0.shopSkinPage:Find("changeCharaPanel/bg"), function()
		setActive(arg_105_0.shopSkinPage:Find("changeCharaPanel"), false)
	end, SFX_PANEL)
	onButton(arg_105_0, arg_105_0.changeCharaPanel:Find("closeBtn"), function()
		setActive(arg_105_0.shopSkinPage:Find("changeCharaPanel"), false)
	end, SFX_PANEL)

	local var_105_0 = UIItemList.New(arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content"), arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content/IslandShipTpl"))

	var_105_0:make(function(arg_108_0, arg_108_1, arg_108_2)
		if arg_108_0 == UIItemList.EventUpdate then
			local var_108_0 = arg_105_0.ships[arg_108_1 + 1]
			local var_108_1 = IslandShip.StaticGetPrefab(var_108_0.id)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_108_1, "", arg_108_2:Find("mask/icon"))
			setText(arg_108_2:Find("Text"), "Lv." .. var_108_0:GetLevel())
			setActive(arg_108_2:Find("add"), false)
			setActive(arg_108_2:Find("select"), var_108_0.id == arg_105_0.selectShipId)
			onButton(arg_105_0, arg_108_2, function()
				if arg_105_0.charaSetModel == var_0_0.CharaSetModel.current then
					arg_105_0:ResetCommanderDressPreview(false, true)

					arg_105_0.selectShipId = var_108_0.id
					arg_105_0.showingShipId = var_108_0.id

					arg_105_0:LoadCharacter(var_108_0:GetModel(), false)

					arg_105_0.shoppingCartCommodities = {}
					arg_105_0.showingCommodity = nil

					setActive(arg_105_0.shopSkinPage:Find("cancelBtn"), false)
					setActive(arg_105_0.shopSkinPage:Find("shoppingCartBtn"), false)
					setText(arg_105_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
					arg_105_0:SetCommodityList()
				elseif arg_105_0.charaSetModel == var_0_0.CharaSetModel.default then
					arg_105_0.defaultShipId = var_108_0.id

					PlayerPrefs.SetInt("island_dressShop_defaultShipId_" .. arg_105_0.player.id, var_108_0.id)
				end

				for iter_109_0 = 0, arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
					setActive(arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_109_0):Find("select"), iter_109_0 == arg_108_1)
				end
			end, SFX_PANEL)
		end
	end)
	var_105_0:align(#arg_105_0.ships)

	arg_105_0.charaSetModel = var_0_0.CharaSetModel.current

	onButton(arg_105_0, arg_105_0.changeCharaPanel:Find("defaultSet"), function()
		if arg_105_0.charaSetModel == var_0_0.CharaSetModel.current then
			arg_105_0.charaSetModel = var_0_0.CharaSetModel.default

			for iter_110_0 = 0, arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
				setActive(arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_110_0):Find("select"), arg_105_0.ships[iter_110_0 + 1].id == arg_105_0.defaultShipId)
			end
		elseif arg_105_0.charaSetModel == var_0_0.CharaSetModel.default then
			arg_105_0.charaSetModel = var_0_0.CharaSetModel.current

			for iter_110_1 = 0, arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
				setActive(arg_105_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_110_1):Find("select"), arg_105_0.ships[iter_110_1 + 1].id == arg_105_0.selectShipId)
			end
		end

		setActive(arg_105_0.changeCharaPanel:Find("defaultSet/off"), arg_105_0.charaSetModel == var_0_0.CharaSetModel.current)
		setActive(arg_105_0.changeCharaPanel:Find("defaultSet/on"), arg_105_0.charaSetModel == var_0_0.CharaSetModel.default)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_111_0)
	arg_111_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_111_0.UpdateView)
	arg_111_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_111_0.OnSwitchMapByPoint)
	arg_111_0:AddListener(ActivityProxy.ACTIVITY_UPDATED, arg_111_0.UpdateActivity)
	arg_111_0:AddListener(GAME.ACTIVITY_DRAW_AWARD_OPERATION_DONE, arg_111_0.DrawOperation)
end

function var_0_0.RemoveListeners(arg_112_0)
	arg_112_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_112_0.UpdateView)
	arg_112_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_112_0.OnSwitchMapByPoint)
	arg_112_0:RemoveListener(ActivityProxy.ACTIVITY_UPDATED, arg_112_0.UpdateActivity)
	arg_112_0:RemoveListener(GAME.ACTIVITY_DRAW_AWARD_OPERATION_DONE, arg_112_0.DrawOperation)
end

function var_0_0.UpdateView(arg_113_0, arg_113_1)
	if arg_113_1.operation == IslandConst.SHOP_GET_DATA then
		if arg_113_1.refreshAll then
			arg_113_0:UpdateData()
			arg_113_0:SetShopList()
		else
			arg_113_0:SetShopPage()
		end
	elseif arg_113_1.operation == IslandConst.SHOP_BUY_COMMODITY then
		arg_113_0.shoppingCartCommodities = {}

		arg_113_0:SetShopPage()

		if arg_113_0.myIslandShoppingCartLayer then
			arg_113_0.myIslandShoppingCartLayer:Hide()
		end

		arg_113_0:OpenPage(IslandShopBuySuccessLayer, arg_113_1.awards, function()
			if arg_113_0.showingShop:GetShowType() == IslandConst.SHOP_TYPE_SKIN then
				arg_113_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_3Dshop_clothes_jump"),
					onYes = function()
						arg_113_0:ClearCharacterScene(function()
							arg_113_0:Hide()

							local var_116_0 = arg_113_0.showingShop:GetCommanderOrCharaType()

							if var_116_0 == 0 then
								arg_113_0:OpenScenePage(IslandShipIslandCommanderMainPage)
							elseif var_116_0 == 1 or var_116_0 == 2 then
								arg_113_0:OpenScenePage(IslandShipMainPage, 3)
							end
						end)
					end
				})
			end
		end)

		if arg_113_0.myIslandShopItemLayer then
			arg_113_0.myIslandShopItemLayer:Refresh()
		end
	elseif arg_113_1.operation == IslandConst.REFRESH_SHOP_BY_PLAYER then
		arg_113_0:SetShopPage()
	end
end

function var_0_0.OnSwitchMapByPoint(arg_117_0)
	setActive(arg_117_0._tf, true)
	arg_117_0:PrepareCharacterScene()
end

function var_0_0.UpdateActivity(arg_118_0, arg_118_1)
	if arg_118_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_ISLAND_DRAW_AWARD then
		arg_118_0.drawAwardActivity = arg_118_1

		arg_118_0.drawAwardPage:ActionInvoke("UpdateActivity", arg_118_0.drawAwardActivity)
		arg_118_0:SetResources()
	end
end

function var_0_0.DrawOperation(arg_119_0, arg_119_1)
	arg_119_0.drawAwardPage:ActionInvoke("DrawOperation", arg_119_1)
end

function var_0_0.Preload(arg_120_0, arg_120_1)
	arg_120_1()
end

function var_0_0.GetSmoothRotateObject(arg_121_0)
	return arg_121_0._tf:Find("adapt/model")
end

function var_0_0.LoadFurniture(arg_122_0, arg_122_1, arg_122_2)
	arg_122_0:UnloadCharacter()

	if arg_122_0.isLoadingModel then
		return
	end

	arg_122_0.isLoadingModel = true

	local var_122_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_122_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_123_0)
		arg_122_0.role = Object.Instantiate(arg_123_0)

		local var_123_0 = arg_122_0.role.name
		local var_123_1 = GameObject.New(var_123_0)

		setParent(arg_122_0.role, var_123_1.transform, false)

		arg_122_0.role = var_123_1
		arg_122_0.isLoadingModel = false

		pg.ViewUtils.SetLayer(arg_122_0.role.transform, Layer.Character3D)
		setParent(arg_122_0.role, arg_122_0.roleContainer)

		arg_122_0.role.transform.localPosition = Vector3(arg_122_2[1][1], arg_122_2[1][2], 0)
		arg_122_0.role.transform.localEulerAngles = Vector3(0, arg_122_2[2], 0)
		arg_122_0.role.transform.localScale = Vector3(arg_122_2[3], arg_122_2[3], arg_122_2[3])

		local var_123_2 = arg_122_0:GetSmoothRotateObject()
		local var_123_3 = GetOrAddComponent(var_123_2, typeof(SmoothRotateObject))

		var_123_3:SetUp(arg_122_0.role.transform)

		var_123_3.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int
	end), true, true)

	table.insert(arg_122_0.loadingIdList or {}, var_122_0)
end

function var_0_0.LoadCharacter(arg_124_0, arg_124_1, arg_124_2)
	arg_124_0:UnloadCharacter()

	if arg_124_0.isLoadingModel then
		return
	end

	arg_124_0.isLoadingModel = true

	arg_124_0.islandShipDressHelper:SetShipId(arg_124_0.showingShipId)

	arg_124_0.isCommander = arg_124_2
	arg_124_0.modelData = arg_124_1

	local function var_124_0(arg_125_0)
		arg_124_0.role = arg_125_0
		arg_124_0.isLoadingModel = false

		pg.ViewUtils.SetLayer(arg_124_0.role.transform, Layer.Character3D)
		setParent(arg_124_0.role, arg_124_0.roleContainer)

		local var_125_0 = 2.7
		local var_125_1 = arg_124_0._tf.rect.width / arg_124_0._tf.rect.height

		if var_125_1 < 1.7777777777777777 then
			var_125_0 = 2.7 - 0.5 * (1.7777777777777777 - var_125_1) / 0.4444444444444444
		end

		arg_124_0.role.transform.localPosition = Vector3(var_125_0, 0, 0)
		arg_124_0.role.transform.localEulerAngles = Vector3(0, -155, 0)

		local var_125_2 = arg_124_0:GetSmoothRotateObject()
		local var_125_3 = GetOrAddComponent(var_125_2, typeof(SmoothRotateObject))

		var_125_3:SetUp(arg_124_0.role.transform)

		var_125_3.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int

		arg_124_0.displayUnit:OnAttach(arg_125_0, arg_124_0.toolContainer)

		local var_125_4 = arg_124_0.modelData and arg_124_0.modelData.personal_ani

		if var_125_4 and var_125_4 ~= "" then
			local var_125_5 = GetOrAddComponent(arg_124_0.role.transform:GetChild(0), typeof(Animator))

			for iter_125_0 = 1, var_125_5.layerCount do
				var_125_5:CrossFadeInFixedTime(var_125_4, 0, iter_125_0 - 1)
			end
		end

		arg_124_0.islandShipDressHelper:OnRoleLoaded(arg_124_0.role.transform, arg_124_0.modelData)
	end

	if arg_124_0.isCommander then
		arg_124_0:GetPoolMgr():GetCommanderModel(arg_124_1, function(arg_126_0)
			var_124_0(arg_126_0)
		end)
	else
		arg_124_0:GetPoolMgr():GetCharacter(arg_124_1.model, arg_124_1.animator, function(arg_127_0)
			var_124_0(arg_127_0)
		end)
	end
end

function var_0_0.UnloadCharacter(arg_128_0)
	arg_128_0.islandShipDressHelper:InvalidateRole()
	arg_128_0.islandShipDressHelper:Destroy()

	if arg_128_0.role then
		arg_128_0.displayUnit:OnDetach()
		pg.ViewUtils.SetLayer(arg_128_0.role.transform, Layer.Default)

		if arg_128_0.isCommander then
			arg_128_0:GetPoolMgr():ReturnCommanderModel(arg_128_0.role)
		elseif arg_128_0.modelData then
			arg_128_0:GetPoolMgr():ReturnCharacter(arg_128_0.modelData.model, arg_128_0.modelData.animator, arg_128_0.role)

			arg_128_0.modelData = nil
		end

		arg_128_0.role = nil
	end

	arg_128_0.modelData = nil
end

function var_0_0.OnShow(arg_129_0, arg_129_1, arg_129_2, arg_129_3)
	arg_129_0:OverlayPanel(arg_129_0._tf)

	arg_129_0.showTypes = arg_129_1
	arg_129_0.firstShopIds = arg_129_2
	arg_129_0.showDrawAward = arg_129_3 == 1
	arg_129_0.drawAwardActivity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND_DRAW_AWARD)

	arg_129_0:DoUpdateShops()
	arg_129_0:UpdateData()
	arg_129_0:SetShopList()
end

function var_0_0.OnHide(arg_130_0)
	arg_130_0:UnOverlayPanel(arg_130_0._tf)

	if arg_130_0.timer then
		arg_130_0.timer:Stop()

		arg_130_0.timer = nil
	end

	arg_130_0:ResetCommanderDressPreview(false)

	arg_130_0.shoppingCartCommodities = {}
	arg_130_0.showingCommodity = nil

	arg_130_0.islandShipDressHelper:Destroy()
	arg_130_0:UnloadCharacter()
	arg_130_0.drawAwardPage:Destroy()
	arg_130_0.drawAwardPage:Reset()

	for iter_130_0, iter_130_1 in ipairs(arg_130_0.loadingIdList or {}) do
		IslandAssetLoadDispatcher.Instance:Cancel(iter_130_1)
	end

	arg_130_0.loadingIdList = {}
end

function var_0_0.OnDisable(arg_131_0)
	arg_131_0:OnHide()
	var_0_0.super.OnDisable(arg_131_0)
end

function var_0_0.OnDestroy(arg_132_0)
	arg_132_0:OnHide()
	var_0_0.super.OnDestroy(arg_132_0)
end

function var_0_0.CanEsc(arg_133_0)
	if arg_133_0.morphing then
		return false
	end

	return true
end

function var_0_0.StaticUpdateCommodityTpl(arg_134_0, arg_134_1)
	local var_134_0 = arg_134_1:GetMaxNum() - arg_134_1.purchasedNum

	setText(arg_134_0:Find("name"), arg_134_1:GetName())

	if #arg_134_1:GetItems() == 1 and arg_134_1:GetItems()[1][1] ~= DROP_TYPE_ISLAND_FURNITURE and arg_134_1:GetItems()[1][1] ~= DROP_TYPE_ISLAND_DRESS and arg_134_1:GetItems()[1][1] ~= DROP_TYPE_ISLAND_SKIN then
		local var_134_1 = arg_134_1:GetItems()[1]
		local var_134_2 = {
			type = var_134_1[1],
			id = var_134_1[2],
			count = var_134_1[3]
		}

		updateCustomDrop(arg_134_0:Find("IslandItemTpl"), var_134_2, {
			style = "island"
		})
	else
		GetImageSpriteFromAtlasAsync(arg_134_1:GetIcon(), "", arg_134_0:Find("IslandItemTpl/icon_bg/icon"))
	end

	setActive(arg_134_0:Find("IslandItemTpl/icon_bg/count_bg"), arg_134_1:IsShowPurchaseLimit())
	setText(arg_134_0:Find("IslandItemTpl/icon_bg/count_bg/count"), var_134_0 .. "/" .. arg_134_1:GetMaxNum())

	local var_134_3 = arg_134_1:GetResourceConsume()

	GetImageSpriteFromAtlasAsync(Drop.New({
		type = var_134_3[1],
		id = var_134_3[2]
	}):getIcon(), "", arg_134_0:Find("cost/icon"))
	setText(arg_134_0:Find("cost/num"), math.ceil((100 - arg_134_1:GetDiscount()) / 100 * var_134_3[3]))

	local var_134_4 = arg_134_1:GetTag()

	setActive(arg_134_0:Find("tags/timeLimit"), var_134_4 == IslandCommodity.TAG.TIME)
	setActive(arg_134_0:Find("tags/new"), var_134_4 == IslandCommodity.TAG.NEW)
	setActive(arg_134_0:Find("tags/hot"), var_134_4 == IslandCommodity.TAG.HOT)
	setActive(arg_134_0:Find("discount"), arg_134_1:GetDiscount() ~= 0)
	setText(arg_134_0:Find("discount/Text"), "-" .. arg_134_1:GetDiscount() .. "%")

	local var_134_5 = arg_134_1:GetItems()[1][1]
	local var_134_6 = arg_134_1:GetItems()[1][2]
	local var_134_7 = Drop.New({
		count = 1,
		type = var_134_5,
		id = var_134_6
	}):getOwnedCount()

	setActive(arg_134_0:Find("have"), arg_134_1:IsShowHave())
	setText(arg_134_0:Find("have"), i18n("island_3Dshop_have") .. var_134_7)

	local var_134_8 = underscore.all(arg_134_1:GetItems(), function(arg_135_0)
		return Drop.New({
			count = 1,
			type = arg_135_0[1],
			id = arg_135_0[2]
		}):getOwnedCount() > 0
	end)

	setActive(arg_134_0:Find("hold"), arg_134_1:IsShowHold() and (arg_134_1:IsCharacterInviteItemHold() or var_134_8))
	setActive(arg_134_0:Find("sellOut"), arg_134_1:GetMaxNum() ~= 0 and var_134_0 == 0 and not isActive(arg_134_0:Find("hold")))
	setActive(arg_134_0:Find("cost"), not isActive(arg_134_0:Find("sellOut")) and not isActive(arg_134_0:Find("hold")))
	setActive(arg_134_0:Find("select"), false)
	setText(arg_134_0:Find("sellOut/Text"), i18n("common_sale_out"))
	setText(arg_134_0:Find("hold/Text"), i18n("common_already owned"))
end

function var_0_0.SortShopCommodities(arg_136_0)
	table.sort(arg_136_0, CompareFuncs({
		function(arg_137_0)
			local var_137_0 = arg_137_0:GetMaxNum() - arg_137_0.purchasedNum

			if arg_137_0:GetMaxNum() ~= 0 and var_137_0 == 0 then
				return 3
			end

			if arg_137_0:IsShowHold() then
				if arg_137_0:IsCharacterInviteItemHold() then
					return 2
				else
					return underscore.all(arg_137_0:GetItems(), function(arg_138_0)
						return Drop.New({
							count = 1,
							type = arg_138_0[1],
							id = arg_138_0[2]
						}):getOwnedCount() > 0
					end) and 2 or 1
				end
			else
				return 1
			end
		end,
		function(arg_139_0)
			return arg_139_0:GetCfgSortIdx()
		end,
		function(arg_140_0)
			return arg_140_0.id
		end
	}))
end

return var_0_0

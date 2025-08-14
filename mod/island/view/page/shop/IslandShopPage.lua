local var_0_0 = class("IslandShopPage", import("...base.IslandBasePage"))
local var_0_1 = pg.island_item_data_template

function var_0_0.getUIName(arg_1_0)
	return "IslandShopUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.bg = arg_2_0:findTF("bg")
	arg_2_0.bg2 = arg_2_0:findTF("bg2")
	arg_2_0.closeBtn = arg_2_0:findTF("top/closeBtn")
	arg_2_0.title = arg_2_0:findTF("top/title")
	arg_2_0.resourceList = UIItemList.New(arg_2_0:findTF("top/resources"), arg_2_0:findTF("top/resources/resourceTpl"))
	arg_2_0.shop1List = UIItemList.New(arg_2_0:findTF("shop1List"), arg_2_0:findTF("shop1List/shop1Tpl"))
	arg_2_0.shop3 = arg_2_0:findTF("shop3List")
	arg_2_0.shop3List = UIItemList.New(arg_2_0:findTF("shop3List"), arg_2_0:findTF("shop3List/shop3Tpl"))
	arg_2_0.recommendationPage = arg_2_0:findTF("shopPage/recommendation")
	arg_2_0.shop2DPage = arg_2_0:findTF("shopPage/shop2D")
	arg_2_0.shop3DPage = arg_2_0:findTF("shopPage/shop3D")
	arg_2_0.shopFurniturePage = arg_2_0:findTF("shopPage/shopFurniture")
	arg_2_0.shopSkinPage = arg_2_0:findTF("shopPage/shopSkin")
	arg_2_0.subPageContainer = arg_2_0:findTF("subPageContainer")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0:InitData()
end

function var_0_0.InitData(arg_5_0)
	arg_5_0.shopAgency = getProxy(IslandProxy):GetIsland():GetShopAgency()
	arg_5_0.inventoryAgency = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	arg_5_0.player = getProxy(PlayerProxy):getRawData()
end

function var_0_0.DoUpdateShops(arg_6_0)
	local var_6_0 = arg_6_0.shopAgency:GetNewOrOverdueShopIds()

	if #var_6_0 > 0 then
		for iter_6_0, iter_6_1 in ipairs(var_6_0) do
			arg_6_0:emit(IslandMediator.GET_SHOP_DATA, iter_6_1, true)
		end
	end
end

function var_0_0.DoUpdateShowingShop(arg_7_0)
	arg_7_0:emit(IslandMediator.GET_SHOP_DATA, arg_7_0.showingShop.id, false)
end

function var_0_0.UpdateData(arg_8_0)
	arg_8_0.firstShopConfigs = arg_8_0.shopAgency:GetFirstShopConfigs(arg_8_0.showTypes)

	if not arg_8_0.showingShop or not arg_8_0.shopAgency:IsShowShop(arg_8_0.showingShop.id) then
		arg_8_0.showingShop = arg_8_0.shopAgency:GetInitShowingShop(arg_8_0.showTypes)
	end
end

function var_0_0.SetShopList(arg_9_0)
	arg_9_0.shop1List:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_9_0.firstShopConfigs[arg_10_1 + 1]

			setActive(arg_10_2:Find("shop2List"), false)
			LoadImageSpriteAsync("herohrzicon/" .. var_10_0.tag_icon, arg_10_2:Find("shop1Tg/name"), false)
			onToggle(arg_9_0, arg_10_2:Find("shop1Tg"), function(arg_11_0)
				setActive(arg_9_0.shop3, false)

				if arg_11_0 then
					setActive(arg_10_2:Find("shop2List"), var_10_0.shop_type == 0)

					if var_10_0.shop_type == 0 then
						local var_11_0 = arg_9_0.shopAgency:GetSecondShopConfigs(arg_9_0.showTypes, var_10_0.id)
						local var_11_1 = UIItemList.New(arg_10_2:Find("shop2List"), arg_10_2:Find("shop2List/shop2Tpl"))

						var_11_1:make(function(arg_12_0, arg_12_1, arg_12_2)
							if arg_12_0 == UIItemList.EventUpdate then
								local var_12_0 = var_11_0[arg_12_1 + 1]

								LoadImageSpriteAsync("herohrzicon/" .. var_12_0.tag_icon, arg_12_2:Find("name"), false)
								onToggle(arg_9_0, arg_12_2, function(arg_13_0)
									if arg_13_0 then
										setActive(arg_9_0.shop3, var_12_0.shop_type == 0)

										if var_12_0.shop_type == 0 then
											local var_13_0 = arg_9_0.shopAgency:GetThirdShopConfigs(arg_9_0.showTypes, var_12_0.id)

											arg_9_0.shop3List:make(function(arg_14_0, arg_14_1, arg_14_2)
												if arg_14_0 == UIItemList.EventUpdate then
													local var_14_0 = var_13_0[arg_14_1 + 1]

													LoadImageSpriteAsync("herohrzicon/" .. var_14_0.tag_icon, arg_14_2:Find("name"), false)
													onToggle(arg_9_0, arg_14_2, function(arg_15_0)
														if arg_15_0 then
															arg_9_0.showingShop = arg_9_0.shopAgency:GetShopById(var_14_0.id)

															arg_9_0:DoUpdateShowingShop()
														end
													end, SFX_PANEL)

													if arg_9_0.showingShop.id == var_14_0.id then
														triggerToggle(arg_14_2, true)
													end
												end
											end, SFX_PANEL)
											arg_9_0.shop3List:align(#var_13_0)
										else
											arg_9_0.showingShop = arg_9_0.shopAgency:GetShopById(var_12_0.id)

											arg_9_0:DoUpdateShowingShop()
										end
									end
								end, SFX_PANEL)

								if arg_9_0.showingShop.id == var_12_0.id or arg_9_0.showingShop:GetSecondShopId() == var_12_0.id then
									triggerToggle(arg_12_2, true)
								end
							end
						end)
						var_11_1:align(#var_11_0)
					else
						arg_9_0.showingShop = arg_9_0.shopAgency:GetShopById(var_10_0.id)

						arg_9_0:DoUpdateShowingShop()
					end
				else
					setActive(arg_10_2:Find("shop2List"), false)
				end
			end, SFX_PANEL)

			if arg_9_0.showingShop.id == var_10_0.id or arg_9_0.showingShop:GetFirstShopId() == var_10_0.id then
				triggerToggle(arg_10_2:Find("shop1Tg"), true)
			end
		end
	end)
	arg_9_0.shop1List:align(#arg_9_0.firstShopConfigs)
end

function var_0_0.SetShopPage(arg_16_0)
	local var_16_0 = arg_16_0.showingShop:GetShowType()

	setActive(arg_16_0.bg, var_16_0 ~= IslandConst.SHOP_TYPE_3D)
	setActive(arg_16_0.bg2, var_16_0 == IslandConst.SHOP_TYPE_3D)
	LoadImageSpriteAsync("herohrzicon/" .. arg_16_0.showingShop:GetShopIcon(), arg_16_0.title, false)
	arg_16_0:SetResources()
	setActive(arg_16_0.recommendationPage, var_16_0 == IslandConst.SHOP_TYPE_RECOMMENDATION)
	setActive(arg_16_0.shop2DPage, var_16_0 == IslandConst.SHOP_TYPE_2D)
	setActive(arg_16_0.shop3DPage, var_16_0 == IslandConst.SHOP_TYPE_3D)
	setActive(arg_16_0.shopFurniturePage, var_16_0 == IslandConst.SHOP_TYPE_FURNITURE)
	setActive(arg_16_0.shopSkinPage, var_16_0 == IslandConst.SHOP_TYPE_SKIN)
	switch(var_16_0, {
		[IslandConst.SHOP_TYPE_RECOMMENDATION] = function()
			arg_16_0:ShowRecommendation()
		end,
		[IslandConst.SHOP_TYPE_2D] = function()
			arg_16_0:ShowShop2D()
		end,
		[IslandConst.SHOP_TYPE_3D] = function()
			arg_16_0:ShowShop3D()
		end,
		[IslandConst.SHOP_TYPE_FURNITURE] = function()
			arg_16_0:ShowShopFurniture()
		end,
		[IslandConst.SHOP_TYPE_SKIN] = function()
			arg_16_0:ShowShopSkin()
		end
	})
end

function var_0_0.SetResources(arg_22_0)
	local var_22_0 = arg_22_0.showingShop:GetTopResources()

	arg_22_0.resourceList:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = var_22_0[arg_23_1 + 1]
			local var_23_1 = var_23_0[1]
			local var_23_2 = var_23_0[2]

			if var_23_1 == DROP_TYPE_RESOURCE then
				if var_23_2 == 1 then
					setText(arg_23_2:Find("count"), arg_22_0.player.gold)

					if not pg.goldExchangeMgr then
						pg.goldExchangeMgr = GoldExchangeView.New()
					end
				elseif var_23_2 == 4 or var_23_2 == 14 then
					setText(arg_23_2:Find("count"), arg_22_0.player:getTotalGem())

					local function var_23_3()
						if not pg.m02:hasMediator(NewShopMainMediator.__cname) then
							pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
								wrap = ChargeScene.TYPE_DIAMOND
							})
						else
							pg.m02:sendNotification(var_0_0.GO_MALL)
						end
					end

					if PLATFORM_CODE == PLATFORM_JP then
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							fontSize = 23,
							yesText = "text_buy",
							content = i18n("word_diamond_tip", arg_22_0.player:getFreeGem(), arg_22_0.player:getChargeGem(), arg_22_0.player:getTotalGem()),
							onYes = var_23_3,
							alignment = TextAnchor.UpperLeft,
							weight = LayerWeightConst.TOP_LAYER
						})
					else
						var_23_3()
					end
				end
			elseif var_23_1 == DROP_TYPE_ISLAND_ITEM then
				setText(arg_23_2:Find("count"), arg_22_0.inventoryAgency:GetOwnCount(var_23_2))

				local var_23_4 = var_0_1[var_23_2].jump_page
			end
		end
	end)
	arg_22_0.resourceList:align(#var_22_0)
end

function var_0_0.SetCloseAndRefresh(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.showingShop:GetExistTime()
	local var_25_1 = arg_25_0.showingShop.existTime
	local var_25_2 = arg_25_0.showingShop.refreshTime
	local var_25_3 = arg_25_0.showingShop:GetPlayerRefreshResource()

	setActive(arg_25_0:findTF("remainTimer", arg_25_1), var_25_1 ~= 0 or var_25_0 and type(var_25_0) == "table")
	setActive(arg_25_0:findTF("refreshTimer", arg_25_1), var_25_2 ~= 0)
	setActive(arg_25_0:findTF("refreshBtn", arg_25_1), var_25_3)

	local var_25_4 = pg.TimeMgr.GetInstance():GetTimeToNextTime()

	if arg_25_0.timer then
		arg_25_0.timer:Stop()

		arg_25_0.timer = nil
	end

	arg_25_0.timer = Timer.New(function()
		local var_26_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_25_1 ~= 0 then
			local var_26_1 = pg.TimeMgr.GetInstance():DescCDTime(var_25_1 - var_26_0)

			setText(arg_25_0:findTF("remainTimer/Text", arg_25_1), "商店剩余" .. var_26_1 .. "关闭")
		elseif var_25_0 and type(var_25_0) == "table" then
			-- block empty
		end

		if var_25_2 ~= 0 then
			local var_26_2 = pg.TimeMgr.GetInstance():DescCDTime(var_25_2 - var_26_0)

			setText(arg_25_0:findTF("refreshTimer/Text", arg_25_1), var_26_2)

			if var_26_0 > var_25_2 then
				arg_25_0:DoUpdateShowingShop()
			end
		end

		if var_25_2 == 0 and var_25_3 and var_26_0 > var_25_4 then
			arg_25_0:DoUpdateShowingShop()
		end
	end, 1, -1)

	arg_25_0.timer:Start()

	if var_25_3 then
		onButton(arg_25_0, arg_25_0:findTF("refreshBtn", arg_25_1), function()
			local var_27_0 = arg_25_0.showingShop.refreshCount

			if var_27_0 < arg_25_0.showingShop:GetMaxRefreshCount() then
				local var_27_1 = arg_25_0.showingShop:GetFirstRefreshFree()
				local var_27_2 = var_25_3[3]

				if var_27_1 and var_27_0 == 0 then
					var_25_3[3] = 0
					var_27_2 = 0
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					noText = "text_cancel",
					hideNo = false,
					yesText = "text_confirm",
					content = i18n("refresh_shopStreet_question", i18n("word_" .. id2res(var_25_3[2]) .. "_icon"), var_27_2, var_27_0),
					onYes = function()
						arg_25_0:emit(IslandMediator.REFRESH_SHOP_BY_PLAYER, arg_25_0.showingShop.id, var_25_3)
					end
				})
			else
				pg.TipsMgr.GetInstance():ShowTips("刷新次数到上限啦哥们")
			end
		end, SFX_PANEL)
	end
end

function var_0_0.SetCommodity(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_2:GetMaxNum() - arg_29_2.purchasedNum

	setText(arg_29_1:Find("name"), arg_29_2:GetName())
	GetImageSpriteFromAtlasAsync("herohrzicon/" .. arg_29_2:GetIcon(), "", arg_29_1:Find("icon"))

	local var_29_1 = arg_29_2:GetResourceConsume()

	GetImageSpriteFromAtlasAsync(Drop.New({
		type = var_29_1[1],
		id = var_29_1[2]
	}):getIcon(), "", arg_29_1:Find("cost/icon"))
	setText(arg_29_1:Find("cost/num"), math.ceil((100 - arg_29_2:GetDiscount()) / 100 * var_29_1[3]))
	setActive(arg_29_1:Find("remain"), arg_29_2:IsShowPurchaseLimit())
	setText(arg_29_1:Find("remain"), var_29_0 .. "/" .. arg_29_2:GetMaxNum())
	setActive(arg_29_1:Find("sellOut"), arg_29_2:GetMaxNum() ~= 0 and var_29_0 == 0)
	setActive(arg_29_1:Find("timeLimit"), arg_29_2:IsTimeLimitCommodity())
	setActive(arg_29_1:Find("discount"), arg_29_2:GetDiscount() ~= 0)
	setText(arg_29_1:Find("discount/Text"), arg_29_2:GetDiscount() .. "%OFF")
	onButton(arg_29_0, arg_29_1, function()
		switch(arg_29_2:GetCommodityShowType(), {
			[IslandConst.COMMODITY_SHOW_ITEM_FULL] = function()
				IslandShopItemLayer.New(arg_29_0.subPageContainer, arg_29_0.event, arg_29_0.contextData, IslandConst.COMMODITY_SHOW_ITEM_FULL):ExecuteAction("Open", arg_29_0.showingShop.id, arg_29_2)
			end,
			[IslandConst.COMMODITY_SHOW_ITEM_HALF] = function()
				IslandShopItemLayer.New(arg_29_0.subPageContainer, arg_29_0.event, arg_29_0.contextData, IslandConst.COMMODITY_SHOW_ITEM_HALF):ExecuteAction("Open", arg_29_0.showingShop.id, arg_29_2)
			end,
			[IslandConst.COMMODITY_SHOW_SKIN] = function()
				return
			end,
			[IslandConst.COMMODITY_SHOW_FURNITURE] = function()
				return
			end,
			[IslandConst.COMMODITY_SHOW_SKIN_PACK] = function()
				return
			end,
			[IslandConst.COMMODITY_SHOW_FURNITURE_PACK] = function()
				return
			end
		})
	end, SFX_PANEL)
end

function var_0_0.SetCommodityList(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.showingShop:GetCommodities()

	arg_37_1:make(function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 == UIItemList.EventUpdate then
			local var_38_0 = var_37_0[arg_38_1 + 1]

			arg_37_0:SetCommodity(arg_38_2, var_38_0)
		end
	end, SFX_PANEL)
	arg_37_1:align(#var_37_0)
end

function var_0_0.ShowRecommendation(arg_39_0)
	local var_39_0 = arg_39_0.showingShop:GetBanners()
	local var_39_1 = arg_39_0:findTF("banners", arg_39_0.recommendationPage)

	for iter_39_0 = 1, #var_39_0 do
		local var_39_2 = var_39_0[iter_39_0]
		local var_39_3 = var_39_1:GetChild(iter_39_0 - 1)

		GetImageSpriteFromAtlasAsync("activitybanner/" .. var_39_2.pic, "", var_39_3)
		onButton(arg_39_0, var_39_3, function()
			local var_40_0 = arg_39_0.shopAgency:GetShopById(var_39_2.param)

			if var_40_0 then
				arg_39_0.showingShop = var_40_0

				arg_39_0:emit(IslandMediator.GET_SHOP_DATA, arg_39_0.showingShop.id, true)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.ShowShop2D(arg_41_0)
	arg_41_0:SetCloseAndRefresh(arg_41_0.shop2DPage)

	local var_41_0 = UIItemList.New(arg_41_0:findTF("shopView/Viewport/Content", arg_41_0.shop2DPage), arg_41_0:findTF("shopView/Viewport/Content/commodityTpl", arg_41_0.shop2DPage))

	arg_41_0:SetCommodityList(var_41_0)
end

function var_0_0.ShowShop3D(arg_42_0)
	arg_42_0:SetCloseAndRefresh(arg_42_0.shop3DPage)

	local var_42_0 = UIItemList.New(arg_42_0:findTF("shopView/Viewport/Content", arg_42_0.shop3DPage), arg_42_0:findTF("shopView/Viewport/Content/commodityTpl", arg_42_0.shop3DPage))

	arg_42_0:SetCommodityList(var_42_0)
end

function var_0_0.ShowShopFurniture(arg_43_0)
	arg_43_0:SetCloseAndRefresh(arg_43_0.shopFurniturePage)

	local var_43_0 = UIItemList.New(arg_43_0:findTF("shopView/Viewport/Content", arg_43_0.shopFurniturePage), arg_43_0:findTF("shopView/Viewport/Content/commodityTpl", arg_43_0.shopFurniturePage))

	arg_43_0:SetCommodityList(var_43_0)
end

function var_0_0.ShowShopSkin(arg_44_0)
	arg_44_0:SetCloseAndRefresh(arg_44_0.shopSkinPage)

	local var_44_0 = UIItemList.New(arg_44_0:findTF("shopView/Viewport/Content", arg_44_0.shopSkinPage), arg_44_0:findTF("shopView/Viewport/Content/commodityTpl", arg_44_0.shopSkinPage))

	arg_44_0:SetCommodityList(var_44_0)
end

function var_0_0.AddListeners(arg_45_0)
	arg_45_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_45_0.UpdateView)
end

function var_0_0.RemoveListener(arg_46_0)
	arg_46_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_46_0.UpdateView)
end

function var_0_0.UpdateView(arg_47_0, arg_47_1)
	if arg_47_1.operation == IslandConst.SHOP_GET_DATA then
		if arg_47_1.refreshAll then
			arg_47_0:UpdateData()
			arg_47_0:SetShopList()
		else
			arg_47_0:SetShopPage()
		end
	elseif arg_47_1.operation == IslandConst.SHOP_BUY_COMMODITY or arg_47_1.operation == IslandConst.REFRESH_SHOP_BY_PLAYER then
		arg_47_0:SetShopPage()
	end
end

function var_0_0.OnShow(arg_48_0, arg_48_1)
	arg_48_0.showTypes = arg_48_1

	arg_48_0:DoUpdateShops()
	arg_48_0:UpdateData()
	arg_48_0:SetShopList()
	pg.UIMgr.GetInstance():BlurPanel(arg_48_0._tf)
end

function var_0_0.OnHide(arg_49_0)
	if arg_49_0.timer then
		arg_49_0.timer:Stop()

		arg_49_0.timer = nil
	end

	if pg.goldExchangeMgr then
		pg.goldExchangeMgr:exit()

		pg.goldExchangeMgr = nil
	end

	pg.UIMgr.GetInstance():UnblurPanel(arg_49_0._tf)
end

return var_0_0

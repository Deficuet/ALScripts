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
	arg_2_0.closeBtn = arg_2_0:findTF("top/closeBtn")
	arg_2_0.title = arg_2_0:findTF("top/title")
	arg_2_0.resourceList = UIItemList.New(arg_2_0:findTF("top/resources"), arg_2_0:findTF("top/resources/resourceTpl"))
	arg_2_0.shop1List = UIItemList.New(arg_2_0:findTF("shop1List"), arg_2_0:findTF("shop1List/shop1Tpl"))
	arg_2_0.shop3 = arg_2_0:findTF("shop3List")
	arg_2_0.shop3List = UIItemList.New(arg_2_0:findTF("shop3List"), arg_2_0:findTF("shop3List/shop3Tpl"))
	arg_2_0.shop32 = arg_2_0:findTF("shop3List2")
	arg_2_0.shop3List2 = UIItemList.New(arg_2_0:findTF("shop3List2"), arg_2_0:findTF("shop3List2/shop3Tpl"))
	arg_2_0.recommendationPage = arg_2_0:findTF("shopPage/recommendation")
	arg_2_0.shop2DPage = arg_2_0:findTF("shopPage/shop2D")
	arg_2_0.shop3DPage = arg_2_0:findTF("shopPage/shop3D")
	arg_2_0.shopFurniturePage = arg_2_0:findTF("shopPage/shopFurniture")
	arg_2_0.shopSkinPage = arg_2_0:findTF("shopPage/shopSkin")
	arg_2_0.changeCharaPanel = arg_2_0.shopSkinPage:Find("changeCharaPanel/panel")
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
	arg_5_0.characterAgency = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	arg_5_0.player = getProxy(PlayerProxy):getRawData()
	arg_5_0.ships = arg_5_0.characterAgency:GetShips()
	arg_5_0.defaultShipId = PlayerPrefs.GetInt("island_dressShop_defaultShipId_" .. arg_5_0.player.id, 10703)
	arg_5_0.islandShipDressHelper = IslandShipDressHelper.New()
end

function var_0_0.DoUpdateShops(arg_6_0)
	local var_6_0 = arg_6_0.shopAgency:GetNewOrOverdueShopIds()

	if #var_6_0 > 0 then
		for iter_6_0, iter_6_1 in ipairs(var_6_0) do
			arg_6_0:emit(IslandMediator.GET_SHOP_DATA, iter_6_1, true)
		end
	end

	arg_6_0.showingShop = nil
	arg_6_0.selectShipId = arg_6_0.defaultShipId
end

function var_0_0.DoUpdateShowingShop(arg_7_0)
	if arg_7_0.showingShop:IsInTime() then
		arg_7_0:emit(IslandMediator.GET_SHOP_DATA, arg_7_0.showingShop.id, false)
	else
		arg_7_0:SetShopPage()
	end

	if isActive(arg_7_0.shop3) or isActive(arg_7_0.shop32) then
		local var_7_0 = arg_7_0.showingShop:GetShowType()

		setActive(arg_7_0.shop3, var_7_0 == IslandConst.SHOP_TYPE_RECOMMENDATION or var_7_0 == IslandConst.SHOP_TYPE_2D)
		setActive(arg_7_0.shop32, var_7_0 == IslandConst.SHOP_TYPE_3D or var_7_0 == IslandConst.SHOP_TYPE_FURNITURE or var_7_0 == IslandConst.SHOP_TYPE_SKIN)
	end
end

function var_0_0.UpdateData(arg_8_0)
	arg_8_0.firstShopConfigs = arg_8_0.shopAgency:GetFirstShopConfigs(arg_8_0.showTypes, arg_8_0.firstShopIds)

	if not arg_8_0.showingShop or not arg_8_0.shopAgency:IsShowShop(arg_8_0.showingShop.id) then
		arg_8_0.showingShop = arg_8_0.shopAgency:GetInitShowingShop(arg_8_0.showTypes, arg_8_0.firstShopIds)
	end
end

function var_0_0.SetShopList(arg_9_0)
	arg_9_0.shop1List:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_9_0.firstShopConfigs[arg_10_1 + 1]

			setActive(arg_10_2:Find("shop2List"), false)
			setActive(arg_10_2:Find("shop1Tg/selected"), arg_9_0.showingShop.id == var_10_0.id or arg_9_0.showingShop:GetFirstShopId() == var_10_0.id)
			LoadImageSpriteAsync(var_10_0.tag_icon[3], arg_10_2:Find("shop1Tg/selected/icon"), false)
			setText(arg_10_2:Find("shop1Tg/name"), var_10_0.tag_icon[1])
			setText(arg_10_2:Find("shop1Tg/name/en"), var_10_0.tag_icon[2])
			onToggle(arg_9_0, arg_10_2:Find("shop1Tg"), function(arg_11_0)
				setActive(arg_9_0.shop3, false)
				setActive(arg_9_0.shop32, false)

				if arg_11_0 then
					for iter_11_0 = 0, arg_9_0:findTF("shop1List").childCount - 1 do
						setActive(arg_9_0:findTF("shop1List"):GetChild(iter_11_0):Find("shop1Tg/selected"), false)
					end

					setActive(arg_10_2:Find("shop1Tg/selected"), true)
					arg_10_2:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop1List_Selected")
					setActive(arg_10_2:Find("shop2List"), var_10_0.shop_type == 0)

					if var_10_0.shop_type == 0 then
						local var_11_0 = arg_9_0.shopAgency:GetSecondShopConfigs(arg_9_0.showTypes, var_10_0.id)
						local var_11_1 = UIItemList.New(arg_10_2:Find("shop2List"), arg_10_2:Find("shop2List/shop2Tpl"))

						var_11_1:make(function(arg_12_0, arg_12_1, arg_12_2)
							if arg_12_0 == UIItemList.EventUpdate then
								local var_12_0 = var_11_0[arg_12_1 + 1]

								setActive(arg_12_2:Find("selected"), arg_9_0.showingShop.id == var_12_0.id or arg_9_0.showingShop:GetSecondShopId() == var_12_0.id)
								setText(arg_12_2:Find("name"), var_12_0.tag_icon[1])
								setText(arg_12_2:Find("selected/name"), var_12_0.tag_icon[1])
								onToggle(arg_9_0, arg_12_2, function(arg_13_0)
									if arg_13_0 then
										for iter_13_0 = 0, arg_10_2:Find("shop2List").childCount - 1 do
											setActive(arg_10_2:Find("shop2List"):GetChild(iter_13_0):Find("selected"), false)
										end

										setActive(arg_12_2:Find("selected"), true)
										arg_12_2:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop2List_Selected")
										setActive(arg_9_0.shop3, var_12_0.shop_type == 0)
										setActive(arg_9_0.shop32, var_12_0.shop_type == 0)

										if var_12_0.shop_type == 0 then
											local var_13_0 = arg_9_0.shopAgency:GetThirdShopConfigs(arg_9_0.showTypes, var_12_0.id)

											arg_9_0.shop3List:make(function(arg_14_0, arg_14_1, arg_14_2)
												if arg_14_0 == UIItemList.EventUpdate then
													local var_14_0 = var_13_0[arg_14_1 + 1]

													setActive(arg_14_2:Find("selected"), arg_9_0.showingShop.id == var_14_0.id)
													setText(arg_14_2:Find("name"), var_14_0.tag_icon[1])
													setText(arg_14_2:Find("selected/name"), var_14_0.tag_icon[1])
													setActive(arg_14_2:Find("icon"), var_14_0.tag_icon[3])

													if var_14_0.tag_icon[3] then
														LoadImageSpriteAsync(var_14_0.tag_icon[3], arg_14_2:Find("icon"), false)
													end

													local var_14_1 = arg_9_0.shopAgency:GetShopById(var_14_0.id):IsInTime()

													setActive(arg_14_2:Find("lock"), not var_14_1)
													setActive(arg_14_2:Find("selected/lock"), not var_14_1)
													onToggle(arg_9_0, arg_14_2, function(arg_15_0)
														if arg_15_0 then
															for iter_15_0 = 0, arg_9_0.shop3.childCount - 1 do
																setActive(arg_9_0.shop3:GetChild(iter_15_0):Find("selected"), false)
															end

															setActive(arg_14_2:Find("selected"), true)
															arg_14_2:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop3List_Selected")

															arg_9_0.showingShop = arg_9_0.shopAgency:GetShopById(var_14_0.id)

															arg_9_0:DoUpdateShowingShop()
														end
													end, SFX_PANEL)

													if arg_9_0.showingShop.id == var_14_0.id then
														triggerToggle(arg_14_2, true)
													end

													if arg_14_1 == 0 then
														local var_14_2 = {}

														for iter_14_0, iter_14_1 in ipairs(var_13_0) do
															table.insert(var_14_2, iter_14_1.id)
														end

														if not table.contains(var_14_2, arg_9_0.showingShop.id) then
															triggerToggle(arg_14_2, true)
														end
													end
												end
											end, SFX_PANEL)
											arg_9_0.shop3List:align(#var_13_0)
											arg_9_0.shop3List2:make(function(arg_16_0, arg_16_1, arg_16_2)
												if arg_16_0 == UIItemList.EventUpdate then
													local var_16_0 = var_13_0[arg_16_1 + 1]

													setActive(arg_16_2:Find("selected"), arg_9_0.showingShop.id == var_16_0.id)
													setText(arg_16_2:Find("name"), var_16_0.tag_icon[1])
													setText(arg_16_2:Find("selected/name"), var_16_0.tag_icon[1])
													setActive(arg_16_2:Find("icon"), var_16_0.tag_icon[3])

													if var_16_0.tag_icon[3] then
														LoadImageSpriteAsync(var_16_0.tag_icon[3], arg_16_2:Find("icon"), false)
													end

													local var_16_1 = arg_9_0.shopAgency:GetShopById(var_16_0.id):IsInTime()

													setActive(arg_16_2:Find("lock"), not var_16_1)
													setActive(arg_16_2:Find("selected/lock"), not var_16_1)
													onToggle(arg_9_0, arg_16_2, function(arg_17_0)
														if arg_17_0 then
															for iter_17_0 = 0, arg_9_0.shop32.childCount - 1 do
																setActive(arg_9_0.shop32:GetChild(iter_17_0):Find("selected"), false)
															end

															setActive(arg_16_2:Find("selected"), true)

															arg_9_0.showingShop = arg_9_0.shopAgency:GetShopById(var_16_0.id)

															arg_9_0:DoUpdateShowingShop()
														end
													end, SFX_PANEL)

													if arg_9_0.showingShop.id == var_16_0.id then
														triggerToggle(arg_16_2, true)
													end

													if arg_16_1 == 0 then
														local var_16_2 = {}

														for iter_16_0, iter_16_1 in ipairs(var_13_0) do
															table.insert(var_16_2, iter_16_1.id)
														end

														if not table.contains(var_16_2, arg_9_0.showingShop.id) then
															triggerToggle(arg_16_2, true)
														end
													end
												end
											end, SFX_PANEL)
											arg_9_0.shop3List2:align(#var_13_0)
										else
											arg_9_0.showingShop = arg_9_0.shopAgency:GetShopById(var_12_0.id)

											arg_9_0:DoUpdateShowingShop()
										end
									end
								end, SFX_PANEL)

								if arg_9_0.showingShop.id == var_12_0.id or arg_9_0.showingShop:GetSecondShopId() == var_12_0.id then
									triggerToggle(arg_12_2, true)
								end

								if arg_12_1 == 0 then
									local var_12_1 = {}

									for iter_12_0, iter_12_1 in ipairs(var_11_0) do
										table.insert(var_12_1, iter_12_1.id)
									end

									if arg_9_0.showingShop:GetTagType() == 2 and not table.contains(var_12_1, arg_9_0.showingShop.id) or arg_9_0.showingShop:GetTagType() == 3 and not table.contains(var_12_1, arg_9_0.showingShop:GetSecondShopId()) then
										triggerToggle(arg_12_2, true)
									end
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

function var_0_0.SetShopPage(arg_18_0)
	local var_18_0 = arg_18_0.showingShop:GetShowType()

	setText(arg_18_0:findTF("Text", arg_18_0.title), arg_18_0.showingShop:GetShopIcon()[1])
	setText(arg_18_0:findTF("Text/en", arg_18_0.title), arg_18_0.showingShop:GetShopIcon()[2])
	arg_18_0:SetResources()
	setActive(arg_18_0.recommendationPage, var_18_0 == IslandConst.SHOP_TYPE_RECOMMENDATION)
	setActive(arg_18_0.shop2DPage, var_18_0 == IslandConst.SHOP_TYPE_2D)
	setActive(arg_18_0.shop3DPage, var_18_0 == IslandConst.SHOP_TYPE_3D)
	setActive(arg_18_0.shopFurniturePage, var_18_0 == IslandConst.SHOP_TYPE_FURNITURE)
	setActive(arg_18_0.shopSkinPage, var_18_0 == IslandConst.SHOP_TYPE_SKIN)
	switch(var_18_0, {
		[IslandConst.SHOP_TYPE_RECOMMENDATION] = function()
			arg_18_0:ShowRecommendation()
		end,
		[IslandConst.SHOP_TYPE_2D] = function()
			arg_18_0:ShowShop2D()
		end,
		[IslandConst.SHOP_TYPE_3D] = function()
			arg_18_0:ShowShop3D()
		end,
		[IslandConst.SHOP_TYPE_FURNITURE] = function()
			arg_18_0:ShowShopFurniture()
		end,
		[IslandConst.SHOP_TYPE_SKIN] = function()
			arg_18_0:ShowShopSkin()
		end
	})
end

function var_0_0.SetResources(arg_24_0)
	arg_24_0.player = getProxy(PlayerProxy):getRawData()

	local var_24_0 = arg_24_0.showingShop:GetTopResources()

	arg_24_0.resourceList:make(function(arg_25_0, arg_25_1, arg_25_2)
		if arg_25_0 == UIItemList.EventUpdate then
			local var_25_0 = var_24_0[arg_25_1 + 1]
			local var_25_1 = var_25_0[1]
			local var_25_2 = var_25_0[2]

			setActive(arg_25_2:Find("gold"), false)
			setActive(arg_25_2:Find("oil"), false)
			setActive(arg_25_2:Find("gem"), false)
			setActive(arg_25_2:Find("islandItem"), false)

			if var_25_1 == DROP_TYPE_RESOURCE then
				if var_25_2 == 1 then
					setActive(arg_25_2:Find("gold"), true)

					local var_25_3 = arg_24_0.player:getLevelMaxGold()

					setText(arg_25_2:Find("gold/max"), "MAX: " .. var_25_3)
					setText(arg_25_2:Find("gold/Text"), arg_24_0.player.gold)
				elseif var_25_2 == 4 or var_25_2 == 14 then
					setActive(arg_25_2:Find("gem"), true)
					setText(arg_25_2:Find("gem/Text"), arg_24_0.player:getTotalGem())
				end
			elseif var_25_1 == DROP_TYPE_ISLAND_ITEM then
				setActive(arg_25_2:Find("islandItem"), true)
				setText(arg_25_2:Find("islandItem/Text"), arg_24_0.inventoryAgency:GetOwnCount(var_25_2))
				GetImageSpriteFromAtlasAsync(Drop.New({
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_25_2
				}):getIcon(), "", arg_25_2:Find("islandItem/icon"))
			end
		end
	end)
	arg_24_0.resourceList:align(#var_24_0)
end

function var_0_0.SetCloseAndRefresh(arg_26_0, arg_26_1)
	local var_26_0 = 0

	if arg_26_0.showingShop:IsNormalShop() then
		local var_26_1 = arg_26_0.showingShop:GetExistTime()

		if type(var_26_1) == "table" then
			local var_26_2 = var_26_1[2]

			var_26_0 = pg.TimeMgr.GetInstance():Table2ServerTime({
				year = var_26_2[1][1],
				month = var_26_2[1][2],
				day = var_26_2[1][3],
				hour = var_26_2[2][1],
				min = var_26_2[2][2],
				sec = var_26_2[2][3]
			})
		end
	elseif arg_26_0.showingShop:IsTemporaryShop() then
		var_26_0 = arg_26_0.showingShop.existTime
	end

	local var_26_3 = arg_26_0.showingShop.refreshTime
	local var_26_4 = arg_26_0.showingShop:GetPlayerRefreshResource()

	setActive(arg_26_0:findTF("remainAndRefresh/remainTimer", arg_26_1), var_26_0 ~= 0)
	setActive(arg_26_0:findTF("remainAndRefresh/refresh", arg_26_1), var_26_3 ~= 0)
	setActive(arg_26_0:findTF("remainAndRefresh/refresh/refreshBtn", arg_26_1), var_26_4)
	setActive(arg_26_0:findTF("remainAndRefresh", arg_26_1), isActive(arg_26_0:findTF("remainAndRefresh/remainTimer", arg_26_1)) or isActive(arg_26_0:findTF("remainAndRefresh/refresh", arg_26_1)))

	local var_26_5 = pg.TimeMgr.GetInstance():GetTimeToNextTime()

	if arg_26_0.timer then
		arg_26_0.timer:Stop()

		arg_26_0.timer = nil
	end

	arg_26_0.timer = Timer.New(function()
		local var_27_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_26_0 ~= 0 then
			local var_27_1 = pg.TimeMgr.GetInstance():DescCDTime(var_26_0 - var_27_0)

			setText(arg_26_0:findTF("remainAndRefresh/remainTimer", arg_26_1), "商店剩余" .. var_27_1 .. "关闭")
		elseif normalShopExistTime and type(normalShopExistTime) == "table" then
			-- block empty
		end

		if var_26_3 ~= 0 then
			local var_27_2 = pg.TimeMgr.GetInstance():DescCDTime(var_26_3 - var_27_0)

			setText(arg_26_0:findTF("remainAndRefresh/refresh/refreshTimer", arg_26_1), var_27_2 .. "后刷新")

			if var_27_0 > var_26_3 then
				arg_26_0:DoUpdateShowingShop()
			end
		end

		if var_26_3 == 0 and var_26_4 and var_27_0 > var_26_5 then
			arg_26_0:DoUpdateShowingShop()
		end
	end, 1, -1)

	arg_26_0.timer:Start()

	if var_26_4 then
		onButton(arg_26_0, arg_26_0:findTF("remainAndRefresh/refresh/refreshBtn/button", arg_26_1), function()
			local var_28_0 = arg_26_0.showingShop.refreshCount

			if var_28_0 < arg_26_0.showingShop:GetMaxRefreshCount() then
				local var_28_1 = arg_26_0.showingShop:GetFirstRefreshFree()
				local var_28_2 = var_26_4[3]

				if var_28_1 and var_28_0 == 0 then
					var_26_4[3] = 0
					var_28_2 = 0
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					noText = "text_cancel",
					hideNo = false,
					yesText = "text_confirm",
					content = i18n("refresh_shopStreet_question", i18n("word_" .. id2res(var_26_4[2]) .. "_icon"), var_28_2, var_28_0),
					onYes = function()
						arg_26_0:emit(IslandMediator.REFRESH_SHOP_BY_PLAYER, arg_26_0.showingShop.id, var_26_4)
					end
				})
			else
				pg.TipsMgr.GetInstance():ShowTips("刷新次数到上限啦哥们")
			end
		end, SFX_PANEL)
	end
end

function var_0_0.SetCommodity(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_2:GetMaxNum() - arg_30_2.purchasedNum

	setText(arg_30_1:Find("name"), arg_30_2:GetName())

	if #arg_30_2:GetItems() == 1 and arg_30_2:GetItems()[1][1] ~= DROP_TYPE_ISLAND_FURNITURE and arg_30_2:GetItems()[1][1] ~= DROP_TYPE_ISLAND_DRESS and arg_30_2:GetItems()[1][1] ~= DROP_TYPE_ISLAND_SKIN then
		local var_30_1 = arg_30_2:GetItems()[1]
		local var_30_2 = {
			type = var_30_1[1],
			id = var_30_1[2],
			count = var_30_1[3]
		}

		updateCustomDrop(arg_30_1:Find("IslandItemTpl"), var_30_2)
	else
		GetImageSpriteFromAtlasAsync(arg_30_2:GetIcon(), "", arg_30_1:Find("IslandItemTpl/icon_bg/icon"))
	end

	setActive(arg_30_1:Find("IslandItemTpl/icon_bg/count_bg"), arg_30_2:IsShowPurchaseLimit())
	setText(arg_30_1:Find("IslandItemTpl/icon_bg/count_bg/count"), var_30_0 .. "/" .. arg_30_2:GetMaxNum())

	local var_30_3 = arg_30_2:GetResourceConsume()

	GetImageSpriteFromAtlasAsync(Drop.New({
		type = var_30_3[1],
		id = var_30_3[2]
	}):getIcon(), "", arg_30_1:Find("cost/icon"))
	setText(arg_30_1:Find("cost/num"), math.ceil((100 - arg_30_2:GetDiscount()) / 100 * var_30_3[3]))
	setActive(arg_30_1:Find("sellOut"), arg_30_2:GetMaxNum() ~= 0 and var_30_0 == 0)
	setActive(arg_30_1:Find("timeLimit"), arg_30_2:IsTimeLimitCommodity())
	setActive(arg_30_1:Find("discount"), arg_30_2:GetDiscount() ~= 0)
	setText(arg_30_1:Find("discount/Text"), "-" .. arg_30_2:GetDiscount() .. "%")

	local var_30_4 = false

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.shoppingCartCommodities) do
		if iter_30_1.id == arg_30_2.id then
			var_30_4 = true

			break
		end
	end

	setActive(arg_30_1:Find("select"), var_30_4)

	local var_30_5 = arg_30_2:GetItems()[1][1]
	local var_30_6 = arg_30_2:GetItems()[1][2]
	local var_30_7 = 0

	if var_30_5 == DROP_TYPE_ISLAND_ITEM then
		var_30_7 = arg_30_0.inventoryAgency:GetOwnCount(var_30_6)
	elseif var_30_5 == DROP_TYPE_ISLAND_FURNITURE then
		local var_30_8 = getProxy(IslandProxy):GetIsland():GetAgoraAgency():GetFurnitures()

		for iter_30_2, iter_30_3 in ipairs(var_30_8) do
			if iter_30_3.id == var_30_6 then
				var_30_7 = iter_30_3.count

				break
			end
		end
	elseif var_30_5 == DROP_TYPE_ISLAND_DRESS then
		if pg.island_dress_template[var_30_6].belongto == 1 then
			var_30_7 = getProxy(IslandProxy):GetIsland():GetDressUpAgency():CheckOwnDress(var_30_6) and 1 or 0
		elseif pg.island_dress_template[var_30_6].belongto == 2 then
			var_30_7 = arg_30_0.characterAgency:GetOwnDressCountByDressId(var_30_6)
		end
	elseif var_30_5 == DROP_TYPE_ISLAND_SKIN then
		var_30_7 = arg_30_0.characterAgency:CheckSkinIsOwned(var_30_6) and 1 or 0
	end

	setActive(arg_30_1:Find("have"), arg_30_2:IsShowHave())
	setText(arg_30_1:Find("have"), "持有：" .. var_30_7)
	setActive(arg_30_1:Find("hold"), arg_30_2:IsShowHold() and (var_30_7 > 0 or arg_30_2:IsCharacterInviteItemHold()))
	setActive(arg_30_1:Find("cost"), not isActive(arg_30_1:Find("sellOut")) and not isActive(arg_30_1:Find("hold")))
	setActive(arg_30_1:Find("notInTime"), not arg_30_0.showingShop:IsInTime())

	if isActive(arg_30_1:Find("sellOut")) or isActive(arg_30_1:Find("hold")) or isActive(arg_30_1:Find("notInTime")) then
		removeOnButton(arg_30_1)
	else
		onButton(arg_30_0, arg_30_1, function()
			switch(arg_30_2:GetCommodityShowType(), {
				[IslandConst.COMMODITY_SHOW_ITEM] = function()
					arg_30_0.myIslandShopItemLayer = arg_30_0:OpenPage(IslandShopItemLayer, arg_30_0.showingShop.id, arg_30_2)
				end,
				[IslandConst.COMMODITY_SHOW_DRESS] = function()
					if #arg_30_2:GetItems() > 1 then
						arg_30_0.shoppingCartCommodities = {
							arg_30_2
						}

						arg_30_0.islandShipDressHelper:ResetDressUp()
					else
						if #arg_30_0.shoppingCartCommodities > 0 and #arg_30_0.shoppingCartCommodities[1]:GetItems() > 1 then
							arg_30_0.shoppingCartCommodities = {}
						end

						local var_33_0 = 0

						for iter_33_0, iter_33_1 in ipairs(arg_30_0.shoppingCartCommodities) do
							if iter_33_1:GetDressType() == arg_30_2:GetDressType() then
								var_33_0 = iter_33_1.id

								table.remove(arg_30_0.shoppingCartCommodities, iter_33_0)

								break
							end
						end

						if arg_30_2.id == var_33_0 then
							arg_30_0.islandShipDressHelper:ChangeDressByType(arg_30_2:GetDressType(), 0)
						else
							table.insert(arg_30_0.shoppingCartCommodities, arg_30_2)
							arg_30_0.islandShipDressHelper:ChangeDressByType(arg_30_2:GetDressType(), arg_30_2:GetItems()[1][2])
						end
					end

					setActive(arg_30_0.shopSkinPage:Find("cancelBtn"), #arg_30_0.shoppingCartCommodities > 0)
					setActive(arg_30_0.shopSkinPage:Find("shoppingCartBtn"), #arg_30_0.shoppingCartCommodities > 0)
					setActive(arg_30_0.shopSkinPage:Find("shoppingCartBtn/count"), true)
					setText(arg_30_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_30_0.shoppingCartCommodities .. "/3")

					if #arg_30_0.shoppingCartCommodities > 0 then
						onButton(arg_30_0, arg_30_0.shopSkinPage:Find("cancelBtn"), function()
							arg_30_0.shoppingCartCommodities = {}

							arg_30_0.islandShipDressHelper:ResetDressUp()
							setActive(arg_30_0.shopSkinPage:Find("cancelBtn"), false)
							setActive(arg_30_0.shopSkinPage:Find("shoppingCartBtn"), false)
							setText(arg_30_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
							arg_30_0:SetCommodityList()
						end, SFX_PANEL)
						onButton(arg_30_0, arg_30_0.shopSkinPage:Find("shoppingCartBtn"), function()
							arg_30_0.myIslandShoppingCartLayer = arg_30_0:OpenPage(IslandShoppingCartLayer, arg_30_0.shoppingCartCommodities)
						end, SFX_PANEL)
					end

					arg_30_0:SetCommodityList()
				end,
				[IslandConst.COMMODITY_SHOW_FURNITURE] = function()
					if arg_30_0.showingCommodity ~= arg_30_2 then
						arg_30_0.showingCommodity = arg_30_2
						arg_30_0.shoppingCartCommodities = {
							arg_30_2
						}

						arg_30_0:LoadFurniture(arg_30_2:GetModel(), arg_30_2:GetModelParam())
						setActive(arg_30_0.shopFurniturePage:Find("scenePreviewBtn"), false)
						setActive(arg_30_0.shopFurniturePage:Find("shoppingCartBtn"), true)

						if #arg_30_2:GetItems() == 1 then
							onButton(arg_30_0, arg_30_0.shopFurniturePage:Find("scenePreviewBtn"), function()
								setActive(arg_30_0._tf, false)
								arg_30_0:ClearCharacterScene()
								arg_30_0:emit(IslandMediator.PREVIEW_FURNITURE, arg_30_2:GetItems()[1][2])
							end, SFX_PANEL)
						end

						onButton(arg_30_0, arg_30_0.shopFurniturePage:Find("shoppingCartBtn"), function()
							arg_30_0.myIslandShoppingCartLayer = arg_30_0:OpenPage(IslandShoppingCartLayer, arg_30_0.shoppingCartCommodities)
						end, SFX_PANEL)
					else
						arg_30_0.showingCommodity = nil
						arg_30_0.shoppingCartCommodities = {}

						arg_30_0:UnloadCharacter()
						setActive(arg_30_0.shopFurniturePage:Find("scenePreviewBtn"), false)
						setActive(arg_30_0.shopFurniturePage:Find("shoppingCartBtn"), false)
					end

					arg_30_0:SetCommodityList()
				end,
				[IslandConst.COMMODITY_SHOW_SKIN] = function()
					if arg_30_0.showingCommodity ~= arg_30_2 then
						arg_30_0.showingCommodity = arg_30_2
						arg_30_0.shoppingCartCommodities = {
							arg_30_2
						}

						local var_39_0 = pg.island_skin_template[arg_30_2:GetItems()[1][2]].model
						local var_39_1 = pg.island_unit_character[var_39_0]

						arg_30_0:LoadCharacter(var_39_1)
					else
						arg_30_0.showingCommodity = nil
						arg_30_0.shoppingCartCommodities = {}

						local var_39_2 = arg_30_0.characterAgency:GetShipById(arg_30_0.showingShipId):GetModel()

						arg_30_0:LoadCharacter(var_39_2)
					end

					setActive(arg_30_0.shopSkinPage:Find("cancelBtn"), #arg_30_0.shoppingCartCommodities > 0)
					setActive(arg_30_0.shopSkinPage:Find("shoppingCartBtn"), #arg_30_0.shoppingCartCommodities > 0)
					setActive(arg_30_0.shopSkinPage:Find("shoppingCartBtn/count"), false)
					setText(arg_30_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_30_0.shoppingCartCommodities .. "/3")

					if #arg_30_0.shoppingCartCommodities > 0 then
						onButton(arg_30_0, arg_30_0.shopSkinPage:Find("cancelBtn"), function()
							arg_30_0.shoppingCartCommodities = {}

							local var_40_0 = arg_30_0.characterAgency:GetShipById(arg_30_0.showingShipId):GetModel()

							arg_30_0:LoadCharacter(var_40_0)
							setActive(arg_30_0.shopSkinPage:Find("cancelBtn"), false)
							setActive(arg_30_0.shopSkinPage:Find("shoppingCartBtn"), false)
							setText(arg_30_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
							arg_30_0:SetCommodityList()
						end, SFX_PANEL)
						onButton(arg_30_0, arg_30_0.shopSkinPage:Find("shoppingCartBtn"), function()
							arg_30_0.myIslandShoppingCartLayer = arg_30_0:OpenPage(IslandShoppingCartLayer, arg_30_0.shoppingCartCommodities)
						end, SFX_PANEL)
					end

					arg_30_0:SetCommodityList()
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.SetCommodityList(arg_42_0)
	local var_42_0 = arg_42_0.showingShop:GetShowType()
	local var_42_1 = switch(var_42_0, {
		[IslandConst.SHOP_TYPE_2D] = function()
			return UIItemList.New(arg_42_0:findTF("shopView/Viewport/Content", arg_42_0.shop2DPage), arg_42_0:findTF("shopView/Viewport/Content/IslandCommodityTpl", arg_42_0.shop2DPage))
		end,
		[IslandConst.SHOP_TYPE_3D] = function()
			return UIItemList.New(arg_42_0:findTF("shopView/Viewport/Content", arg_42_0.shop3DPage), arg_42_0:findTF("shopView/Viewport/Content/IslandCommodityTpl", arg_42_0.shop3DPage))
		end,
		[IslandConst.SHOP_TYPE_FURNITURE] = function()
			return UIItemList.New(arg_42_0:findTF("shopView/Viewport/Content", arg_42_0.shopFurniturePage), arg_42_0:findTF("shopView/Viewport/Content/IslandCommodityTpl", arg_42_0.shopFurniturePage))
		end,
		[IslandConst.SHOP_TYPE_SKIN] = function()
			return UIItemList.New(arg_42_0:findTF("shopView/Viewport/Content", arg_42_0.shopSkinPage), arg_42_0:findTF("shopView/Viewport/Content/IslandCommodityTpl", arg_42_0.shopSkinPage))
		end
	})
	local var_42_2 = arg_42_0.showingShop:GetCommodities()

	var_42_1:make(function(arg_47_0, arg_47_1, arg_47_2)
		if arg_47_0 == UIItemList.EventUpdate then
			local var_47_0 = var_42_2[arg_47_1 + 1]

			arg_42_0:SetCommodity(arg_47_2, var_47_0)
		end
	end, SFX_PANEL)
	var_42_1:align(#var_42_2)
end

function var_0_0.ShowRecommendation(arg_48_0)
	arg_48_0:ClearCharacterScene()
	pg.UIMgr.GetInstance():ShutdownPartialBlur({
		arg_48_0.bg,
		arg_48_0.shop3DPage:Find("bg"),
		arg_48_0.shopFurniturePage:Find("bg"),
		arg_48_0.shopSkinPage:Find("bg"),
		arg_48_0.changeCharaPanel
	})
	pg.UIMgr.GetInstance():PartialBlurTfs({
		arg_48_0.bg
	})
	setActive(arg_48_0.bgColor, true)

	arg_48_0.shoppingCartCommodities = {}

	local var_48_0 = arg_48_0.showingShop:GetBanners()
	local var_48_1 = arg_48_0:findTF("banners", arg_48_0.recommendationPage)

	for iter_48_0 = 1, #var_48_0 do
		local var_48_2 = var_48_0[iter_48_0]
		local var_48_3 = var_48_1:GetChild(iter_48_0 - 1)

		GetImageSpriteFromAtlasAsync("activitybanner/" .. var_48_2.pic, "", var_48_3)
		onButton(arg_48_0, var_48_3, function()
			local var_49_0 = arg_48_0.shopAgency:GetShopById(var_48_2.param)

			if var_49_0 then
				arg_48_0.showingShop = var_49_0

				if arg_48_0.showingShop:IsInTime() then
					arg_48_0:emit(IslandMediator.GET_SHOP_DATA, arg_48_0.showingShop.id, true)
				else
					arg_48_0:UpdateData()
					arg_48_0:SetShopList()
				end
			end
		end, SFX_PANEL)
	end
end

function var_0_0.ShowShop2D(arg_50_0)
	arg_50_0:ClearCharacterScene()
	pg.UIMgr.GetInstance():ShutdownPartialBlur({
		arg_50_0.bg,
		arg_50_0.shop3DPage:Find("bg"),
		arg_50_0.shopFurniturePage:Find("bg"),
		arg_50_0.shopSkinPage:Find("bg"),
		arg_50_0.changeCharaPanel
	})
	pg.UIMgr.GetInstance():PartialBlurTfs({
		arg_50_0.bg
	})
	setActive(arg_50_0.bgColor, true)

	arg_50_0.shoppingCartCommodities = {}

	local var_50_0 = arg_50_0.showingShop:IsInTime()

	setActive(arg_50_0:findTF("lock", arg_50_0.shop2DPage), not var_50_0)

	if var_50_0 then
		arg_50_0:SetCloseAndRefresh(arg_50_0.shop2DPage)
	else
		setActive(arg_50_0:findTF("remainAndRefresh", arg_50_0.shop2DPage), false)

		if arg_50_0.timer then
			arg_50_0.timer:Stop()

			arg_50_0.timer = nil
		end

		arg_50_0.timer = Timer.New(function()
			local var_51_0 = arg_50_0.showingShop:GetExistTime()[1]
			local var_51_1 = pg.TimeMgr.GetInstance():Table2ServerTime({
				year = var_51_0[1][1],
				month = var_51_0[1][2],
				day = var_51_0[1][3],
				hour = var_51_0[2][1],
				min = var_51_0[2][2],
				sec = var_51_0[2][3]
			})
			local var_51_2 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_51_3 = pg.TimeMgr.GetInstance():DescCDTime(var_51_1 - var_51_2)

			setText(arg_50_0.shop2DPage:Find("lock/openTimer"), "剩余" .. var_51_3 .. "解锁")
		end, 1, -1)

		arg_50_0.timer:Start()
	end

	arg_50_0:SetCommodityList()
end

function var_0_0.ShowShop3D(arg_52_0)
	arg_52_0:ClearCharacterScene()
	pg.UIMgr.GetInstance():ShutdownPartialBlur({
		arg_52_0.bg,
		arg_52_0.shop3DPage:Find("bg"),
		arg_52_0.shopFurniturePage:Find("bg"),
		arg_52_0.shopSkinPage:Find("bg"),
		arg_52_0.changeCharaPanel
	})
	pg.UIMgr.GetInstance():PartialBlurTfs({
		arg_52_0.shop3DPage:Find("bg")
	})
	setActive(arg_52_0.bgColor, false)

	arg_52_0.shoppingCartCommodities = {}

	arg_52_0:SetCloseAndRefresh(arg_52_0.shop3DPage)
	arg_52_0:SetCommodityList()
end

function var_0_0.ShowShopFurniture(arg_53_0)
	if not arg_53_0.isLoadCharacterScene then
		arg_53_0:PrepareCharacterScene()
	end

	pg.UIMgr.GetInstance():ShutdownPartialBlur({
		arg_53_0.bg,
		arg_53_0.shop3DPage:Find("bg"),
		arg_53_0.shopFurniturePage:Find("bg"),
		arg_53_0.shopSkinPage:Find("bg"),
		arg_53_0.changeCharaPanel
	})
	pg.UIMgr.GetInstance():PartialBlurTfs({
		arg_53_0.shopFurniturePage:Find("bg")
	})
	setActive(arg_53_0.bgColor, false)
	arg_53_0:UnloadCharacter()

	arg_53_0.shoppingCartCommodities = {}

	arg_53_0:SetCloseAndRefresh(arg_53_0.shopFurniturePage)
	arg_53_0:SetCommodityList()
	setActive(arg_53_0.shopFurniturePage:Find("scenePreviewBtn"), false)
	setActive(arg_53_0.shopFurniturePage:Find("shoppingCartBtn"), false)
end

function var_0_0.ShowShopSkin(arg_54_0)
	if not arg_54_0.isLoadCharacterScene then
		arg_54_0:PrepareCharacterScene()
	end

	pg.UIMgr.GetInstance():ShutdownPartialBlur({
		arg_54_0.bg,
		arg_54_0.shop3DPage:Find("bg"),
		arg_54_0.shopFurniturePage:Find("bg"),
		arg_54_0.shopSkinPage:Find("bg"),
		arg_54_0.changeCharaPanel
	})
	pg.UIMgr.GetInstance():PartialBlurTfs({
		arg_54_0.shopSkinPage:Find("bg"),
		arg_54_0.changeCharaPanel
	})
	setActive(arg_54_0.bgColor, false)

	if not arg_54_0.shoppingCartCommodities then
		arg_54_0.shoppingCartCommodities = {}
	end

	if #arg_54_0.shoppingCartCommodities > 0 then
		local var_54_0 = arg_54_0.shoppingCartCommodities[1]:GetCommodityShowType()

		if var_54_0 == IslandConst.COMMODITY_SHOW_FURNITURE or var_54_0 == IslandConst.COMMODITY_SHOW_SKIN then
			arg_54_0.shoppingCartCommodities = {}
		end
	end

	local var_54_1 = arg_54_0.showingShop:GetCommanderOrCharaType()

	if var_54_1 == 0 and (arg_54_0.showingShipId ~= 0 or #arg_54_0.shoppingCartCommodities == 0) then
		arg_54_0.showingShipId = 0

		local var_54_2 = getProxy(IslandProxy):GetIsland():GetDressUpAgency():GetCurCommderId()
		local var_54_3 = pg.island_dress_commander[var_54_2].model
		local var_54_4 = pg.island_unit_character[var_54_3]

		arg_54_0:LoadCharacter(var_54_4)

		arg_54_0.shoppingCartCommodities = {}
	elseif var_54_1 == 1 and (arg_54_0.showingShipId ~= arg_54_0.selectShipId or #arg_54_0.shoppingCartCommodities == 0) then
		arg_54_0.showingShipId = arg_54_0.selectShipId

		local var_54_5 = arg_54_0.characterAgency:GetShipById(arg_54_0.showingShipId):GetModel()

		arg_54_0:LoadCharacter(var_54_5)

		arg_54_0.shoppingCartCommodities = {}
	end

	arg_54_0:SetCloseAndRefresh(arg_54_0.shopSkinPage)
	arg_54_0:SetCommodityList()
	setActive(arg_54_0.shopSkinPage:Find("cancelBtn"), #arg_54_0.shoppingCartCommodities > 0)
	setActive(arg_54_0.shopSkinPage:Find("changeCharaBtn"), var_54_1 == 1)
	setActive(arg_54_0.shopSkinPage:Find("shoppingCartBtn"), #arg_54_0.shoppingCartCommodities > 0)
	setActive(arg_54_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_54_0.shoppingCartCommodities > 0 and arg_54_0.shoppingCartCommodities[1]:GetItems()[1][1] ~= DROP_TYPE_ISLAND_SKIN)
	setText(arg_54_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_54_0.shoppingCartCommodities .. "/3")
	setActive(arg_54_0.shopSkinPage:Find("changeCharaPanel"), false)
	arg_54_0:SetChangeCharaPanel()
	onButton(arg_54_0, arg_54_0.shopSkinPage:Find("changeCharaBtn"), function()
		setActive(arg_54_0.shopSkinPage:Find("changeCharaPanel"), true)
	end, SFX_PANEL)
end

function var_0_0.SetChangeCharaPanel(arg_56_0)
	onButton(arg_56_0, arg_56_0.shopSkinPage:Find("changeCharaPanel/bg"), function()
		setActive(arg_56_0.shopSkinPage:Find("changeCharaPanel"), false)
	end, SFX_PANEL)
	onButton(arg_56_0, arg_56_0.changeCharaPanel:Find("closeBtn"), function()
		setActive(arg_56_0.shopSkinPage:Find("changeCharaPanel"), false)
	end, SFX_PANEL)

	local var_56_0 = UIItemList.New(arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content"), arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content/IslandShipTpl"))

	var_56_0:make(function(arg_59_0, arg_59_1, arg_59_2)
		if arg_59_0 == UIItemList.EventUpdate then
			local var_59_0 = arg_56_0.ships[arg_59_1 + 1]
			local var_59_1 = IslandShip.StaticGetPrefab(var_59_0.id)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_59_1, "", arg_59_2:Find("mask/icon"))
			setText(arg_59_2:Find("Text"), "Lv." .. var_59_0:GetLevel())
			setActive(arg_59_2:Find("add"), false)
			setActive(arg_59_2:Find("select"), var_59_0.id == arg_56_0.selectShipId)
			onButton(arg_56_0, arg_59_2, function()
				if arg_56_0.charaSetModel == var_0_0.CharaSetModel.current then
					arg_56_0.selectShipId = var_59_0.id
					arg_56_0.showingShipId = var_59_0.id

					arg_56_0:LoadCharacter(var_59_0:GetModel())

					arg_56_0.shoppingCartCommodities = {}

					setActive(arg_56_0.shopSkinPage:Find("cancelBtn"), false)
					setActive(arg_56_0.shopSkinPage:Find("shoppingCartBtn"), false)
					setText(arg_56_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
					arg_56_0:SetCommodityList()
				elseif arg_56_0.charaSetModel == var_0_0.CharaSetModel.default then
					arg_56_0.defaultShipId = var_59_0.id

					PlayerPrefs.SetInt("island_dressShop_defaultShipId_" .. arg_56_0.player.id, var_59_0.id)
				end

				for iter_60_0 = 0, arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
					setActive(arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_60_0):Find("select"), iter_60_0 == arg_59_1)
				end
			end, SFX_PANEL)
		end
	end)
	var_56_0:align(#arg_56_0.ships)

	arg_56_0.charaSetModel = var_0_0.CharaSetModel.current

	onButton(arg_56_0, arg_56_0.changeCharaPanel:Find("defaultSet"), function()
		if arg_56_0.charaSetModel == var_0_0.CharaSetModel.current then
			arg_56_0.charaSetModel = var_0_0.CharaSetModel.default

			for iter_61_0 = 0, arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
				setActive(arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_61_0):Find("select"), arg_56_0.ships[iter_61_0 + 1].id == arg_56_0.defaultShipId)
			end
		elseif arg_56_0.charaSetModel == var_0_0.CharaSetModel.default then
			arg_56_0.charaSetModel = var_0_0.CharaSetModel.current

			for iter_61_1 = 0, arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
				setActive(arg_56_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_61_1):Find("select"), arg_56_0.ships[iter_61_1 + 1].id == arg_56_0.selectShipId)
			end
		end

		setActive(arg_56_0.changeCharaPanel:Find("defaultSet/off"), arg_56_0.charaSetModel == var_0_0.CharaSetModel.current)
		setActive(arg_56_0.changeCharaPanel:Find("defaultSet/on"), arg_56_0.charaSetModel == var_0_0.CharaSetModel.default)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_62_0)
	arg_62_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_62_0.UpdateView)
	arg_62_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_62_0.OnSwitchMapByPoint)
end

function var_0_0.RemoveListeners(arg_63_0)
	arg_63_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_63_0.UpdateView)
	arg_63_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_63_0.OnSwitchMapByPoint)
end

function var_0_0.UpdateView(arg_64_0, arg_64_1)
	if arg_64_1.operation == IslandConst.SHOP_GET_DATA then
		if arg_64_1.refreshAll then
			arg_64_0:UpdateData()
			arg_64_0:SetShopList()
		else
			arg_64_0:SetShopPage()
		end
	elseif arg_64_1.operation == IslandConst.SHOP_BUY_COMMODITY then
		arg_64_0.shoppingCartCommodities = {}

		arg_64_0:SetShopPage()

		if arg_64_0.myIslandShoppingCartLayer then
			arg_64_0.myIslandShoppingCartLayer:Hide()
		end

		arg_64_0:OpenPage(IslandShopBuySuccessLayer, arg_64_1.awards, arg_64_1.ptAward, function()
			if arg_64_0.showingShop:GetShowType() == IslandConst.SHOP_TYPE_SKIN then
				arg_64_0:ShowMsgBox({
					content = "是否跳转装扮界面",
					type = IslandMsgBox.TYPE_COMMON,
					onYes = function()
						if arg_64_0.showingShop:GetCommanderOrCharaType() == 0 then
							arg_64_0:OpenScenePage(IslandShipIslandCommanderMainPage)
						elseif arg_64_0.showingShop:GetCommanderOrCharaType() == 1 then
							arg_64_0:OpenScenePage(IslandShipMainPage, 3)
						end

						arg_64_0:Hide()
					end
				})
			end
		end)

		if arg_64_0.myIslandShopItemLayer then
			arg_64_0.myIslandShopItemLayer:Refresh()
		end
	elseif arg_64_1.operation == IslandConst.REFRESH_SHOP_BY_PLAYER then
		arg_64_0:SetShopPage()
	end
end

function var_0_0.OnSwitchMapByPoint(arg_67_0)
	setActive(arg_67_0._tf, true)
	arg_67_0:PrepareCharacterScene()
end

function var_0_0.Preload(arg_68_0, arg_68_1)
	arg_68_1()
end

function var_0_0.GetSmoothRotateObject(arg_69_0)
	return GetOrAddComponent(arg_69_0._tf:Find("model"), typeof(SmoothRotateObject))
end

function var_0_0.LoadFurniture(arg_70_0, arg_70_1, arg_70_2)
	arg_70_0:UnloadCharacter()

	if arg_70_0.isLoadingModel then
		return
	end

	arg_70_0.isLoadingModel = true

	ResourceMgr.Inst:getAssetAsync(arg_70_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_71_0)
		arg_70_0.role = Object.Instantiate(arg_71_0)

		local var_71_0 = arg_70_0.role.name
		local var_71_1 = GameObject.New(var_71_0)

		setParent(arg_70_0.role, var_71_1.transform, false)

		arg_70_0.role = var_71_1
		arg_70_0.isLoadingModel = false

		pg.ViewUtils.SetLayer(arg_70_0.role.transform, Layer.Character3D)
		setParent(arg_70_0.role, arg_70_0.roleContainer)

		arg_70_0.role.transform.localPosition = Vector3(arg_70_2[1][1], arg_70_2[1][2], 0)
		arg_70_0.role.transform.localEulerAngles = Vector3(0, arg_70_2[2], 0)
		arg_70_0.role.transform.localScale = Vector3(arg_70_2[3], arg_70_2[3], arg_70_2[3])

		local var_71_2 = arg_70_0:GetSmoothRotateObject()

		var_71_2:SetUp(arg_70_0.role.transform)

		var_71_2.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int
	end), true, true)
end

function var_0_0.LoadCharacter(arg_72_0, arg_72_1)
	arg_72_0:UnloadCharacter()

	if arg_72_0.isLoadingModel then
		return
	end

	arg_72_0.isLoadingModel = true

	arg_72_0.islandShipDressHelper:Reset()
	arg_72_0.islandShipDressHelper:SetShipId(arg_72_0.showingShipId)
	ResourceMgr.Inst:getAssetAsync(arg_72_1.model, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_73_0)
		arg_72_0.role = Object.Instantiate(arg_73_0)

		local var_73_0 = arg_72_0.role.name
		local var_73_1 = GameObject.New(var_73_0)

		setParent(arg_72_0.role, var_73_1.transform, false)

		arg_72_0.role = var_73_1
		arg_72_0.isLoadingModel = false

		pg.ViewUtils.SetLayer(arg_72_0.role.transform, Layer.Character3D)
		setParent(arg_72_0.role, arg_72_0.roleContainer)

		arg_72_0.role.transform.localPosition = Vector3(2.7, 0, 0)
		arg_72_0.role.transform.localEulerAngles = Vector3(0, -155, 0)

		local var_73_2 = LoadAny(arg_72_1.animator, nil, typeof(RuntimeAnimatorController))

		GetOrAddComponent(arg_72_0.role.transform:GetChild(0), typeof(Animator)).runtimeAnimatorController = var_73_2

		local var_73_3 = arg_72_0:GetSmoothRotateObject()

		var_73_3:SetUp(arg_72_0.role.transform)

		var_73_3.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int

		arg_72_0.islandShipDressHelper:OnRoleLoaded(arg_72_0.role.transform)
	end), true, true)
end

function var_0_0.OnShow(arg_74_0, arg_74_1, arg_74_2)
	pg.UIMgr.GetInstance():OverlayPanel(arg_74_0._tf, {
		groupName = "IslandShop"
	})

	arg_74_0.showTypes = arg_74_1
	arg_74_0.firstShopIds = arg_74_2

	arg_74_0:DoUpdateShops()
	arg_74_0:UpdateData()
	arg_74_0:SetShopList()
end

function var_0_0.OnHide(arg_75_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_75_0._tf)

	if arg_75_0.timer then
		arg_75_0.timer:Stop()

		arg_75_0.timer = nil
	end

	arg_75_0.shoppingCartCommodities = {}

	arg_75_0.islandShipDressHelper:Destory()
	arg_75_0:UnloadCharacter()
end

return var_0_0

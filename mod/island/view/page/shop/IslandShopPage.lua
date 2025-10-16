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
	arg_2_0.recommendationPage = arg_2_0._tf:Find("adapt/shopPage/recommendation")
	arg_2_0.shop2DPage = arg_2_0._tf:Find("adapt/shopPage/shop2D")
	arg_2_0.shop3DPage = arg_2_0._tf:Find("adapt/shopPage/shop3D")
	arg_2_0.shopFurniturePage = arg_2_0._tf:Find("adapt/shopPage/shopFurniture")
	arg_2_0.shopSkinPage = arg_2_0._tf:Find("adapt/shopPage/shopSkin")
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

		setActive(arg_8_0.shop3, var_8_0 == IslandConst.SHOP_TYPE_RECOMMENDATION or var_8_0 == IslandConst.SHOP_TYPE_2D)
		setActive(arg_8_0.shop32, var_8_0 == IslandConst.SHOP_TYPE_3D or var_8_0 == IslandConst.SHOP_TYPE_FURNITURE or var_8_0 == IslandConst.SHOP_TYPE_SKIN)
	end
end

function var_0_0.UpdateData(arg_9_0)
	arg_9_0.firstShopConfigs = arg_9_0.shopAgency:GetFirstShopConfigs(arg_9_0.showTypes, arg_9_0.firstShopIds)

	if not arg_9_0.showingShop or not arg_9_0.shopAgency:IsShowShop(arg_9_0.showingShop.id) then
		arg_9_0.showingShop = arg_9_0.shopAgency:GetInitShowingShop(arg_9_0.showTypes, arg_9_0.firstShopIds)
	end
end

function var_0_0.SetShopList(arg_10_0)
	arg_10_0.currentShop1TgIndex = nil
	arg_10_0.currentShop2TgIndex = nil
	arg_10_0.currentShop3TgIndex = nil

	arg_10_0.shop1List:make(function(arg_11_0, arg_11_1, arg_11_2)
		arg_11_1 = arg_11_1 + 1

		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = arg_10_0.firstShopConfigs[arg_11_1]

			if var_11_0 then
				setActive(arg_11_2:Find("shop2List"), false)
				LoadImageSpriteAsync(var_11_0.tag_icon[3], arg_11_2:Find("shop1Tg/selected/icon"), false)
				setText(arg_11_2:Find("shop1Tg/name"), var_11_0.tag_icon[1])
				setText(arg_11_2:Find("shop1Tg/name/en"), var_11_0.tag_icon[2])
				onToggle(arg_10_0, arg_11_2:Find("shop1Tg"), function(arg_12_0)
					if arg_12_0 then
						if arg_10_0.currentShop1TgIndex == arg_11_1 then
							return
						end

						setActive(arg_10_0._tf:Find("adapt/shopPage"), true)

						if not IsNil(arg_10_0.roleContainer) then
							setActive(arg_10_0.roleContainer, true)
						end

						setActive(arg_10_0.shop3, false)
						setActive(arg_10_0.shop32, false)
						arg_11_2:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop1List_Selected")
						setActive(arg_11_2:Find("shop2List"), var_11_0.shop_type == 0)

						if var_11_0.shop_type == 0 then
							local var_12_0 = arg_10_0.shopAgency:GetSecondShopConfigs(arg_10_0.showTypes, var_11_0.id)
							local var_12_1 = UIItemList.New(arg_11_2:Find("shop2List"), arg_11_2:Find("shop2List/shop2Tpl"))

							var_12_1:make(function(arg_13_0, arg_13_1, arg_13_2)
								if arg_13_0 == UIItemList.EventUpdate then
									local var_13_0 = var_12_0[arg_13_1 + 1]

									setActive(arg_13_2:Find("selected"), arg_10_0.showingShop.id == var_13_0.id or arg_10_0.showingShop:GetSecondShopId() == var_13_0.id)
									setText(arg_13_2:Find("name"), var_13_0.tag_icon[1])
									setText(arg_13_2:Find("selected/name"), var_13_0.tag_icon[1])
									onToggle(arg_10_0, arg_13_2, function(arg_14_0)
										if arg_14_0 then
											if arg_10_0.currentShop1TgIndex == arg_11_1 and arg_10_0.currentShop2TgIndex == arg_13_1 + 1 then
												return
											end

											arg_13_2:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop2List_Selected")
											setActive(arg_10_0.shop3, var_13_0.shop_type == 0)
											setActive(arg_10_0.shop32, var_13_0.shop_type == 0)

											if var_13_0.shop_type == 0 then
												local var_14_0 = arg_10_0.shopAgency:GetThirdShopConfigs(arg_10_0.showTypes, var_13_0.id)

												arg_10_0.shop3List:make(function(arg_15_0, arg_15_1, arg_15_2)
													if arg_15_0 == UIItemList.EventUpdate then
														local var_15_0 = var_14_0[arg_15_1 + 1]

														setActive(arg_15_2:Find("selected"), arg_10_0.showingShop.id == var_15_0.id)
														setText(arg_15_2:Find("name"), var_15_0.tag_icon[1])
														setText(arg_15_2:Find("selected/name"), var_15_0.tag_icon[1])
														setActive(arg_15_2:Find("icon"), var_15_0.tag_icon[3])

														if var_15_0.tag_icon[3] then
															LoadImageSpriteAsync(var_15_0.tag_icon[3], arg_15_2:Find("icon"), false)
														end

														local var_15_1 = arg_10_0.shopAgency:GetShopById(var_15_0.id):IsInTime()

														setActive(arg_15_2:Find("lock"), not var_15_1)
														setActive(arg_15_2:Find("selected/lock"), not var_15_1)
														onToggle(arg_10_0, arg_15_2, function(arg_16_0)
															if arg_16_0 then
																if arg_10_0.currentShop1TgIndex == arg_11_1 and arg_10_0.currentShop2TgIndex == arg_13_1 + 1 and arg_10_0.currentShop3TgIndex == arg_15_1 + 1 then
																	return
																end

																for iter_16_0 = 0, arg_10_0.shop3.childCount - 1 do
																	setActive(arg_10_0.shop3:GetChild(iter_16_0):Find("selected"), false)
																end

																setActive(arg_15_2:Find("selected"), true)
																arg_15_2:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop3List_Selected")

																arg_10_0.showingShop = arg_10_0.shopAgency:GetShopById(var_15_0.id)

																arg_10_0:DoUpdateShowingShop()

																arg_10_0.currentShop3TgIndex = arg_15_1 + 1
															end
														end, SFX_PANEL)

														if arg_10_0.showingShop.id == var_15_0.id then
															triggerToggle(arg_15_2, true)
														end

														if arg_15_1 == 0 then
															local var_15_2 = {}

															for iter_15_0, iter_15_1 in ipairs(var_14_0) do
																table.insert(var_15_2, iter_15_1.id)
															end

															if not table.contains(var_15_2, arg_10_0.showingShop.id) then
																triggerToggle(arg_15_2, true)
															end
														end
													end
												end, SFX_PANEL)
												arg_10_0.shop3List:align(#var_14_0)
												arg_10_0.shop3List2:make(function(arg_17_0, arg_17_1, arg_17_2)
													if arg_17_0 == UIItemList.EventUpdate then
														local var_17_0 = var_14_0[arg_17_1 + 1]

														setActive(arg_17_2:Find("selected"), arg_10_0.showingShop.id == var_17_0.id)
														setText(arg_17_2:Find("name"), var_17_0.tag_icon[1])
														setText(arg_17_2:Find("selected/name"), var_17_0.tag_icon[1])
														setActive(arg_17_2:Find("icon"), var_17_0.tag_icon[3])

														if var_17_0.tag_icon[3] then
															LoadImageSpriteAsync(var_17_0.tag_icon[3], arg_17_2:Find("icon"), false)
														end

														local var_17_1 = arg_10_0.shopAgency:GetShopById(var_17_0.id):IsInTime()

														setActive(arg_17_2:Find("lock"), not var_17_1)
														setActive(arg_17_2:Find("selected/lock"), not var_17_1)
														onToggle(arg_10_0, arg_17_2, function(arg_18_0)
															if arg_18_0 then
																if arg_10_0.currentShop1TgIndex == arg_11_1 and arg_10_0.currentShop2TgIndex == arg_13_1 + 1 and arg_10_0.currentShop3TgIndex == arg_17_1 + 1 then
																	return
																end

																for iter_18_0 = 0, arg_10_0.shop32.childCount - 1 do
																	setActive(arg_10_0.shop32:GetChild(iter_18_0):Find("selected"), false)
																end

																setActive(arg_17_2:Find("selected"), true)

																arg_10_0.showingShop = arg_10_0.shopAgency:GetShopById(var_17_0.id)

																arg_10_0:DoUpdateShowingShop()

																arg_10_0.currentShop3TgIndex = arg_17_1 + 1
															end
														end, SFX_PANEL)

														if arg_10_0.showingShop.id == var_17_0.id then
															triggerToggle(arg_17_2, true)
														end

														if arg_17_1 == 0 then
															local var_17_2 = {}

															for iter_17_0, iter_17_1 in ipairs(var_14_0) do
																table.insert(var_17_2, iter_17_1.id)
															end

															if not table.contains(var_17_2, arg_10_0.showingShop.id) then
																triggerToggle(arg_17_2, true)
															end
														end
													end
												end, SFX_PANEL)
												arg_10_0.shop3List2:align(#var_14_0)
											else
												arg_10_0.showingShop = arg_10_0.shopAgency:GetShopById(var_13_0.id)

												arg_10_0:DoUpdateShowingShop()
											end

											arg_10_0.currentShop2TgIndex = arg_13_1 + 1
										end
									end, SFX_PANEL)

									if arg_10_0.showingShop.id == var_13_0.id or arg_10_0.showingShop:GetSecondShopId() == var_13_0.id then
										triggerToggle(arg_13_2, true)
									end

									if arg_13_1 == 0 then
										local var_13_1 = {}

										for iter_13_0, iter_13_1 in ipairs(var_12_0) do
											table.insert(var_13_1, iter_13_1.id)
										end

										if not table.contains(var_13_1, arg_10_0.showingShop.id) and not table.contains(var_13_1, arg_10_0.showingShop:GetSecondShopId()) then
											triggerToggle(arg_13_2, true)
										end
									end
								end
							end)
							var_12_1:align(#var_12_0)
						else
							arg_10_0.showingShop = arg_10_0.shopAgency:GetShopById(var_11_0.id)

							arg_10_0:DoUpdateShowingShop()
						end

						arg_10_0.currentShop1TgIndex = arg_11_1
					else
						setActive(arg_11_2:Find("shop2List"), false)
					end
				end, SFX_PANEL)

				if arg_10_0.showingShop.id == var_11_0.id or arg_10_0.showingShop:GetFirstShopId() == var_11_0.id then
					triggerToggle(arg_11_2:Find("shop1Tg"), true)
				end
			else
				setActive(arg_11_2:Find("shop2List"), false)
				setText(arg_11_2:Find("shop1Tg/name"), i18n("island_draw_tab"))
				setText(arg_11_2:Find("shop1Tg/name/en"), i18n("island_draw_tab_en"))
				setActive(arg_11_2:Find("shop1Tg/selected/icon"), false)
				onToggle(arg_10_0, arg_11_2:Find("shop1Tg"), function(arg_19_0)
					if arg_19_0 then
						if arg_10_0.currentShop1TgIndex == arg_11_1 then
							return
						end

						arg_10_0.currentShop1TgIndex = arg_11_1

						arg_11_2:GetComponent(typeof(Animation)):Play("anim_IslandShopUI_Shop1List_Selected")
						setText(arg_10_0.title:Find("Text"), i18n("island_draw_tab"))
						arg_10_0:SetResources()
						setActive(arg_10_0._tf:Find("adapt/shopPage"), false)

						if not IsNil(arg_10_0.roleContainer) then
							setActive(arg_10_0.roleContainer, false)
						end

						setActive(arg_10_0.shop3, false)
						setActive(arg_10_0.shop32, false)
						arg_10_0.drawAwardPage:ActionInvoke("UpdateActivity", arg_10_0.drawAwardActivity)
						arg_10_0.drawAwardPage:ExecuteAction("Show")
					else
						arg_10_0.drawAwardPage:ExecuteAction("Hide")
					end
				end, SFX_PANEL)
			end
		end
	end)
	arg_10_0.shop1List:align(#arg_10_0.firstShopConfigs + (arg_10_0.showDrawAward and arg_10_0.drawAwardActivity and 1 or 0))
end

function var_0_0.SetShopPage(arg_20_0)
	local var_20_0 = arg_20_0.showingShop:GetShowType()

	setText(arg_20_0.title:Find("Text"), arg_20_0.showingShop:GetShopIcon()[1])
	setText(arg_20_0.title:Find("Text/en"), arg_20_0.showingShop:GetShopIcon()[2])
	arg_20_0:SetResources()
	setActive(arg_20_0.recommendationPage, var_20_0 == IslandConst.SHOP_TYPE_RECOMMENDATION)
	setActive(arg_20_0.shop2DPage, var_20_0 == IslandConst.SHOP_TYPE_2D)
	setActive(arg_20_0.shop3DPage, var_20_0 == IslandConst.SHOP_TYPE_3D)
	setActive(arg_20_0.shopFurniturePage, var_20_0 == IslandConst.SHOP_TYPE_FURNITURE)
	setActive(arg_20_0.shopSkinPage, var_20_0 == IslandConst.SHOP_TYPE_SKIN)
	switch(var_20_0, {
		[IslandConst.SHOP_TYPE_RECOMMENDATION] = function()
			arg_20_0:ShowRecommendation()
		end,
		[IslandConst.SHOP_TYPE_2D] = function()
			arg_20_0:ShowShop2D()
		end,
		[IslandConst.SHOP_TYPE_3D] = function()
			arg_20_0:ShowShop3D()
		end,
		[IslandConst.SHOP_TYPE_FURNITURE] = function()
			arg_20_0:ShowShopFurniture()
		end,
		[IslandConst.SHOP_TYPE_SKIN] = function()
			arg_20_0:ShowShopSkin()
		end
	})
end

function var_0_0.SetResources(arg_26_0)
	arg_26_0.player = getProxy(PlayerProxy):getRawData()

	local var_26_0 = not arg_26_0.firstShopConfigs[arg_26_0.currentShop1TgIndex]

	setActive(arg_26_0.helpBtn, var_26_0)

	if var_26_0 then
		local var_26_1 = {}

		table.insert(var_26_1, Drop.New({
			type = DROP_TYPE_VITEM,
			id = arg_26_0.drawAwardActivity:GetDrawConfig("cost_free")
		}))
		table.insert(var_26_1, Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = PlayerConst.ResDiamond
		}))
		arg_26_0.resourceList:make(function(arg_27_0, arg_27_1, arg_27_2)
			arg_27_1 = arg_27_1 + 1

			if arg_27_0 == UIItemList.EventUpdate then
				local var_27_0 = var_26_1[arg_27_1]
				local var_27_1

				eachChild(arg_27_2, function(arg_28_0, arg_28_1)
					setActive(arg_28_0, arg_28_0.name == "islandItem")

					if arg_28_0.name == "islandItem" then
						var_27_1 = arg_28_0
					end
				end)
				GetImageSpriteFromAtlasAsync(var_27_0:getIcon(), "", var_27_1:Find("icon"))
				setText(var_27_1:Find("Text"), var_27_0:getOwnedCount())
				setActive(var_27_1:Find("add"), false)
				setActive(var_27_1:Find("add"), false)
				setActive(var_27_1:Find("descBtn"), false)
				setActive(var_27_1:Find("resourceDesc"), false)
			end
		end)
		arg_26_0.resourceList:align(#var_26_1)

		return
	end

	local var_26_2 = arg_26_0.showingShop:GetTopResources()

	arg_26_0.resourceList:make(function(arg_29_0, arg_29_1, arg_29_2)
		if arg_29_0 == UIItemList.EventUpdate then
			local var_29_0 = var_26_2[arg_29_1 + 1]
			local var_29_1 = var_29_0[1]
			local var_29_2 = var_29_0[2]
			local var_29_3 = var_29_0[3]

			setActive(arg_29_2:Find("gold"), false)
			setActive(arg_29_2:Find("oil"), false)
			setActive(arg_29_2:Find("gem"), false)
			setActive(arg_29_2:Find("islandItem"), false)

			if var_29_2 == DROP_TYPE_RESOURCE then
				if var_29_3 == 1 then
					setActive(arg_29_2:Find("gold"), true)

					local var_29_4 = arg_26_0.player:getLevelMaxGold()

					setText(arg_29_2:Find("gold/max"), "MAX: " .. var_29_4)
					setText(arg_29_2:Find("gold/Text"), arg_26_0.player.gold)
				elseif var_29_3 == 4 or var_29_3 == 14 then
					setActive(arg_29_2:Find("gem"), true)
					setText(arg_29_2:Find("gem/Text"), arg_26_0.player:getTotalGem())
				end
			elseif var_29_2 == DROP_TYPE_ISLAND_ITEM then
				setActive(arg_29_2:Find("islandItem"), true)

				local var_29_5 = arg_26_0.inventoryAgency:GetOwnCount(var_29_3)

				setText(arg_29_2:Find("islandItem/Text"), var_29_5)
				GetImageSpriteFromAtlasAsync(Drop.New({
					type = DROP_TYPE_ISLAND_ITEM,
					id = var_29_3
				}):getIcon(), "", arg_29_2:Find("islandItem/icon"))
				setActive(arg_29_2:Find("islandItem/descBtn"), var_29_1 == 1)
				setActive(arg_29_2:Find("islandItem/resourceDesc"), false)

				if var_29_1 == 1 then
					local var_29_6 = pg.island_item_data_template[var_29_3].have_max

					setText(arg_29_2:Find("islandItem/Text"), var_29_5 .. "/" .. var_29_6)
					onButton(arg_26_0, arg_29_2:Find("islandItem"), function()
						setActive(arg_29_2:Find("islandItem/resourceDesc"), not isActive(arg_29_2:Find("islandItem/resourceDesc")))
						setText(arg_29_2:Find("islandItem/resourceDesc"), i18n("island_3Dshop_res_have") .. var_29_6)
					end, SFX_PANEL)
				end
			end
		end
	end)
	arg_26_0.resourceList:align(#var_26_2)
end

function var_0_0.SetCloseAndRefresh(arg_31_0, arg_31_1)
	local var_31_0 = 0

	if arg_31_0.showingShop:IsNormalShop() then
		local var_31_1 = arg_31_0.showingShop:GetExistTime()

		if type(var_31_1) == "table" then
			local var_31_2 = var_31_1[2]

			var_31_0 = pg.TimeMgr.GetInstance():Table2ServerTime({
				year = var_31_2[1][1],
				month = var_31_2[1][2],
				day = var_31_2[1][3],
				hour = var_31_2[2][1],
				min = var_31_2[2][2],
				sec = var_31_2[2][3]
			})
		end
	elseif arg_31_0.showingShop:IsTemporaryShop() then
		var_31_0 = arg_31_0.showingShop.existTime
	end

	local var_31_3 = arg_31_0.showingShop.refreshTime
	local var_31_4 = arg_31_0.showingShop:GetPlayerRefreshResource()

	setActive(arg_31_1:Find("remainAndRefresh/remainTimer"), var_31_0 ~= 0)
	setActive(arg_31_1:Find("remainAndRefresh/refresh"), var_31_3 ~= 0)
	setActive(arg_31_1:Find("remainAndRefresh/refresh/refreshBtn"), var_31_4)
	setActive(arg_31_1:Find("remainAndRefresh"), isActive(arg_31_1:Find("remainAndRefresh/remainTimer")) or isActive(arg_31_1:Find("remainAndRefresh/refresh")))

	local var_31_5 = pg.TimeMgr.GetInstance():GetTimeToNextTime()

	if arg_31_0.timer then
		arg_31_0.timer:Stop()

		arg_31_0.timer = nil
	end

	arg_31_0.timer = Timer.New(function()
		local var_32_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_31_0 ~= 0 then
			local var_32_1 = pg.TimeMgr.GetInstance():DescCDTime(var_31_0 - var_32_0)

			setText(arg_31_1:Find("remainAndRefresh/remainTimer"), i18n("island_3Dshop_time_close", var_32_1))
		elseif normalShopExistTime and type(normalShopExistTime) == "table" then
			-- block empty
		end

		if var_31_3 ~= 0 then
			local var_32_2 = pg.TimeMgr.GetInstance():DescCDTime(var_31_3 - var_32_0)

			setText(arg_31_1:Find("remainAndRefresh/refresh/refreshTimer"), i18n("island_3Dshop_time_refresh", var_32_2))

			if var_32_0 > var_31_3 then
				arg_31_0:DoUpdateShowingShop()
			end
		end

		if var_31_3 == 0 and var_31_4 and var_32_0 > var_31_5 then
			arg_31_0:DoUpdateShowingShop()
		end
	end, 1, -1)

	arg_31_0.timer:Start()

	if var_31_4 then
		onButton(arg_31_0, arg_31_1:Find("remainAndRefresh/refresh/refreshBtn/button"), function()
			local var_33_0 = arg_31_0.showingShop.refreshCount

			if var_33_0 < arg_31_0.showingShop:GetMaxRefreshCount() then
				local var_33_1 = arg_31_0.showingShop:GetFirstRefreshFree()
				local var_33_2 = var_31_4[3]

				if var_33_1 and var_33_0 == 0 then
					var_31_4[3] = 0
					var_33_2 = 0
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					noText = "text_cancel",
					hideNo = false,
					yesText = "text_confirm",
					content = i18n("refresh_shopStreet_question", i18n("word_" .. id2res(var_31_4[2]) .. "_icon"), var_33_2, var_33_0),
					onYes = function()
						arg_31_0:emit(IslandMediator.REFRESH_SHOP_BY_PLAYER, arg_31_0.showingShop.id, var_31_4)
					end
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_3Dshop_refresh_limit"))
			end
		end, SFX_PANEL)
	end
end

function var_0_0.SetCommodity(arg_35_0, arg_35_1, arg_35_2)
	var_0_0.StaticUpdateCommodityTpl(arg_35_1, arg_35_2)
	setActive(arg_35_1:Find("notInTime"), not arg_35_0.showingShop:IsInTime())
	setText(arg_35_1:Find("sellOut/Text"), i18n("common_sale_out"))
	setText(arg_35_1:Find("hold/Text"), i18n("common_already owned"))

	local var_35_0 = false

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.shoppingCartCommodities) do
		if iter_35_1.id == arg_35_2.id then
			var_35_0 = true

			break
		end
	end

	setActive(arg_35_1:Find("select"), var_35_0)

	if isActive(arg_35_1:Find("sellOut")) or isActive(arg_35_1:Find("hold")) or isActive(arg_35_1:Find("notInTime")) then
		removeOnButton(arg_35_1)
	else
		onButton(arg_35_0, arg_35_1, function()
			switch(arg_35_2:GetCommodityShowType(), {
				[IslandConst.COMMODITY_SHOW_ITEM] = function()
					arg_35_0.myIslandShopItemLayer = arg_35_0:OpenPage(IslandShopItemLayer, arg_35_0.showingShop.id, arg_35_2)
				end,
				[IslandConst.COMMODITY_SHOW_DRESS] = function()
					if #arg_35_2:GetItems() > 1 then
						if #arg_35_0.shoppingCartCommodities == 1 and arg_35_0.shoppingCartCommodities[1].id == arg_35_2.id then
							arg_35_0.shoppingCartCommodities = {}

							arg_35_0.islandShipDressHelper:ResetDressUp()
						else
							arg_35_0.shoppingCartCommodities = {
								arg_35_2
							}

							for iter_38_0, iter_38_1 in ipairs(arg_35_2:GetItems()) do
								local var_38_0

								if iter_38_1[1] == DROP_TYPE_ISLAND_DRESS then
									local var_38_1 = pg.island_dress_template[iter_38_1[2]]

									if var_38_1 then
										var_38_0 = var_38_1.type
									end
								end

								arg_35_0.islandShipDressHelper:ChangeDressByType(var_38_0, {
									colorId = 0,
									id = iter_38_1[2]
								})
							end
						end

						setText(arg_35_0.shopSkinPage:Find("shoppingCartBtn/count"), (#arg_35_0.shoppingCartCommodities > 0 and #arg_35_2:GetItems() or 0) .. "/3")
					else
						local var_38_2 = arg_35_0.characterAgency:GetShipById(arg_35_0.showingShipId)
						local var_38_3 = var_38_2:GetCurrentSkinId()
						local var_38_4 = false
						local var_38_5 = false
						local var_38_6 = pg.island_dress_template[arg_35_2:GetItems()[1][2]]

						if var_38_3 ~= 0 then
							local var_38_7 = var_38_6.exclusive_skin

							if var_38_7 ~= "" then
								for iter_38_2, iter_38_3 in ipairs(var_38_7) do
									if iter_38_3 == var_38_3 then
										var_38_5 = true
									end
								end
							end
						else
							local var_38_8 = var_38_6.exclusive_default_skin

							if var_38_8 ~= "" then
								for iter_38_4, iter_38_5 in ipairs(var_38_8) do
									if iter_38_5 == var_38_2.id then
										var_38_4 = true
									end
								end
							end
						end

						if var_38_4 or var_38_5 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("island_dress_mutually_exclusive1", var_38_6.name))

							return
						end

						if #arg_35_0.shoppingCartCommodities > 0 and #arg_35_0.shoppingCartCommodities[1]:GetItems() > 1 then
							arg_35_0.shoppingCartCommodities = {}

							arg_35_0.islandShipDressHelper:ResetDressUp()
						end

						local var_38_9 = 0

						for iter_38_6, iter_38_7 in ipairs(arg_35_0.shoppingCartCommodities) do
							if iter_38_7:GetDressType() == arg_35_2:GetDressType() then
								var_38_9 = iter_38_7.id

								table.remove(arg_35_0.shoppingCartCommodities, iter_38_6)

								break
							end
						end

						if arg_35_2.id == var_38_9 then
							arg_35_0.islandShipDressHelper:ChangeDressByType(arg_35_2:GetDressType(), {
								id = 0,
								colorId = 0
							})
						else
							table.insert(arg_35_0.shoppingCartCommodities, arg_35_2)
							arg_35_0.islandShipDressHelper:ChangeDressByType(arg_35_2:GetDressType(), {
								colorId = 0,
								id = arg_35_2:GetItems()[1][2]
							})
						end

						setText(arg_35_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_35_0.shoppingCartCommodities .. "/3")
					end

					setActive(arg_35_0.shopSkinPage:Find("cancelBtn"), #arg_35_0.shoppingCartCommodities > 0)
					setActive(arg_35_0.shopSkinPage:Find("shoppingCartBtn"), #arg_35_0.shoppingCartCommodities > 0)
					setActive(arg_35_0.shopSkinPage:Find("shoppingCartBtn/count"), true)

					if #arg_35_0.shoppingCartCommodities > 0 then
						onButton(arg_35_0, arg_35_0.shopSkinPage:Find("cancelBtn"), function()
							arg_35_0.shoppingCartCommodities = {}

							arg_35_0.islandShipDressHelper:ResetDressUp()
							setActive(arg_35_0.shopSkinPage:Find("cancelBtn"), false)
							setActive(arg_35_0.shopSkinPage:Find("shoppingCartBtn"), false)
							setText(arg_35_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
							arg_35_0:SetCommodityList()
						end, SFX_PANEL)
						onButton(arg_35_0, arg_35_0.shopSkinPage:Find("shoppingCartBtn"), function()
							arg_35_0.myIslandShoppingCartLayer = arg_35_0:OpenPage(IslandShoppingCartLayer, arg_35_0.shoppingCartCommodities)
						end, SFX_PANEL)
					end

					arg_35_0:SetCommodityList()
				end,
				[IslandConst.COMMODITY_SHOW_FURNITURE] = function()
					if arg_35_0.showingCommodity ~= arg_35_2 then
						arg_35_0.showingCommodity = arg_35_2
						arg_35_0.shoppingCartCommodities = {
							arg_35_2
						}

						arg_35_0:LoadFurniture(arg_35_2:GetModel(), arg_35_2:GetModelParam())
						setActive(arg_35_0.shopFurniturePage:Find("scenePreviewBtn"), false)
						setActive(arg_35_0.shopFurniturePage:Find("shoppingCartBtn"), true)

						if #arg_35_2:GetItems() == 1 then
							onButton(arg_35_0, arg_35_0.shopFurniturePage:Find("scenePreviewBtn"), function()
								setActive(arg_35_0._tf, false)
								arg_35_0:ClearCharacterScene()
								arg_35_0:emit(IslandMediator.PREVIEW_FURNITURE, arg_35_2:GetItems()[1][2])
							end, SFX_PANEL)
						end

						onButton(arg_35_0, arg_35_0.shopFurniturePage:Find("shoppingCartBtn"), function()
							arg_35_0.myIslandShoppingCartLayer = arg_35_0:OpenPage(IslandShoppingCartLayer, arg_35_0.shoppingCartCommodities)
						end, SFX_PANEL)
					else
						arg_35_0.showingCommodity = nil
						arg_35_0.shoppingCartCommodities = {}

						arg_35_0:UnloadCharacter()
						setActive(arg_35_0.shopFurniturePage:Find("scenePreviewBtn"), false)
						setActive(arg_35_0.shopFurniturePage:Find("shoppingCartBtn"), false)
					end

					arg_35_0:SetCommodityList()
				end,
				[IslandConst.COMMODITY_SHOW_SKIN] = function()
					if arg_35_0.showingCommodity ~= arg_35_2 then
						arg_35_0.showingCommodity = arg_35_2
						arg_35_0.shoppingCartCommodities = {
							arg_35_2
						}

						local var_44_0 = pg.island_skin_template[arg_35_2:GetItems()[1][2]].model
						local var_44_1 = pg.island_unit_character[var_44_0]

						arg_35_0:LoadCharacter(var_44_1, false)
					else
						arg_35_0.showingCommodity = nil
						arg_35_0.shoppingCartCommodities = {}

						arg_35_0:UnloadCharacter()
					end

					setActive(arg_35_0.shopSkinPage:Find("cancelBtn"), false)
					setActive(arg_35_0.shopSkinPage:Find("shoppingCartBtn"), #arg_35_0.shoppingCartCommodities > 0)
					setActive(arg_35_0.shopSkinPage:Find("shoppingCartBtn/count"), false)
					setText(arg_35_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_35_0.shoppingCartCommodities .. "/3")

					if #arg_35_0.shoppingCartCommodities > 0 then
						onButton(arg_35_0, arg_35_0.shopSkinPage:Find("cancelBtn"), function()
							arg_35_0.shoppingCartCommodities = {}

							local var_45_0 = arg_35_0.characterAgency:GetShipById(arg_35_0.showingShipId):GetModel()

							arg_35_0:LoadCharacter(var_45_0, false)
							setActive(arg_35_0.shopSkinPage:Find("cancelBtn"), false)
							setActive(arg_35_0.shopSkinPage:Find("shoppingCartBtn"), false)
							setText(arg_35_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
							arg_35_0:SetCommodityList()
						end, SFX_PANEL)
						onButton(arg_35_0, arg_35_0.shopSkinPage:Find("shoppingCartBtn"), function()
							arg_35_0.myIslandShoppingCartLayer = arg_35_0:OpenPage(IslandShoppingCartLayer, arg_35_0.shoppingCartCommodities)
						end, SFX_PANEL)
					end

					arg_35_0:SetCommodityList()
				end,
				[IslandConst.COMMODITY_SHOW_INVITE] = function()
					local var_47_0 = arg_35_2:GetItems()[1][2]

					arg_35_0.myIslandShopItemLayer = arg_35_0:OpenPage(IslandShopItemLayer, arg_35_0.showingShop.id, arg_35_2, var_47_0)
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.SetCommodityList(arg_48_0)
	local var_48_0 = arg_48_0.showingShop:GetShowType()
	local var_48_1 = switch(var_48_0, {
		[IslandConst.SHOP_TYPE_2D] = function()
			return UIItemList.New(arg_48_0.shop2DPage:Find("shopView/Viewport/Content"), arg_48_0.shop2DPage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end,
		[IslandConst.SHOP_TYPE_3D] = function()
			return UIItemList.New(arg_48_0.shop3DPage:Find("shopView/Viewport/Content"), arg_48_0.shop3DPage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end,
		[IslandConst.SHOP_TYPE_FURNITURE] = function()
			return UIItemList.New(arg_48_0.shopFurniturePage:Find("shopView/Viewport/Content"), arg_48_0.shopFurniturePage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end,
		[IslandConst.SHOP_TYPE_SKIN] = function()
			return UIItemList.New(arg_48_0.shopSkinPage:Find("shopView/Viewport/Content"), arg_48_0.shopSkinPage:Find("shopView/Viewport/Content/IslandCommodityTpl"))
		end
	})
	local var_48_2 = arg_48_0.showingShop:GetCommodities()

	var_0_0.SortShopCommodities(var_48_2)
	var_48_1:make(function(arg_53_0, arg_53_1, arg_53_2)
		if arg_53_0 == UIItemList.EventUpdate then
			local var_53_0 = var_48_2[arg_53_1 + 1]

			arg_48_0:SetCommodity(arg_53_2, var_53_0)
		end
	end, SFX_PANEL)
	var_48_1:align(#var_48_2)
end

function var_0_0.ShowRecommendation(arg_54_0)
	arg_54_0:ClearCharacterScene()
	arg_54_0:OverlayPanel(arg_54_0._tf, {
		pbList = {
			arg_54_0.bg
		}
	})
	setActive(arg_54_0.bgColor, true)

	arg_54_0.shoppingCartCommodities = {}

	local var_54_0 = arg_54_0.showingShop:GetBanners()
	local var_54_1 = arg_54_0.recommendationPage:Find("banners")

	for iter_54_0 = 1, #var_54_0 do
		local var_54_2 = var_54_0[iter_54_0]
		local var_54_3 = var_54_1:GetChild(iter_54_0 - 1)

		GetImageSpriteFromAtlasAsync("activitybanner/" .. var_54_2.pic, "", var_54_3)
		onButton(arg_54_0, var_54_3, function()
			local var_55_0 = arg_54_0.shopAgency:GetShopById(var_54_2.param)

			if var_55_0 then
				arg_54_0.showingShop = var_55_0

				if arg_54_0.showingShop:IsInTime() then
					arg_54_0:emit(IslandMediator.GET_SHOP_DATA, arg_54_0.showingShop.id, true)
				else
					arg_54_0:UpdateData()
					arg_54_0:SetShopList()
				end
			end
		end, SFX_PANEL)
	end
end

function var_0_0.ShowShop2D(arg_56_0)
	arg_56_0:ClearCharacterScene()
	arg_56_0:OverlayPanel(arg_56_0._tf, {
		pbList = {
			arg_56_0.bg
		}
	})
	setActive(arg_56_0.bgColor, true)

	arg_56_0.shoppingCartCommodities = {}

	local var_56_0 = arg_56_0.showingShop:IsInTime()

	setActive(arg_56_0.shop2DPage:Find("lock"), not var_56_0)

	if var_56_0 then
		arg_56_0:SetCloseAndRefresh(arg_56_0.shop2DPage)
	else
		setActive(arg_56_0.shop2DPage:Find("remainAndRefresh"), false)

		if arg_56_0.timer then
			arg_56_0.timer:Stop()

			arg_56_0.timer = nil
		end

		arg_56_0.timer = Timer.New(function()
			local var_57_0 = arg_56_0.showingShop:GetExistTime()[1]
			local var_57_1 = pg.TimeMgr.GetInstance():Table2ServerTime({
				year = var_57_0[1][1],
				month = var_57_0[1][2],
				day = var_57_0[1][3],
				hour = var_57_0[2][1],
				min = var_57_0[2][2],
				sec = var_57_0[2][3]
			})
			local var_57_2 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_57_3 = pg.TimeMgr.GetInstance():DescCDTime(var_57_1 - var_57_2)

			setText(arg_56_0.shop2DPage:Find("lock/openTimer"), i18n("island_3Dshop_time_unlock", var_57_3))
		end, 1, -1)

		arg_56_0.timer:Start()
	end

	arg_56_0:SetCommodityList()
end

function var_0_0.ShowShop3D(arg_58_0)
	arg_58_0:ClearCharacterScene()
	arg_58_0:OverlayPanel(arg_58_0._tf, {
		pbList = {
			arg_58_0.shop3DPage:Find("bg")
		}
	})
	setActive(arg_58_0.bgColor, false)

	arg_58_0.shoppingCartCommodities = {}

	arg_58_0:SetCloseAndRefresh(arg_58_0.shop3DPage)
	arg_58_0:SetCommodityList()
end

function var_0_0.ShowShopFurniture(arg_59_0)
	if not arg_59_0.isLoadCharacterScene then
		arg_59_0:PrepareCharacterScene()
	end

	arg_59_0:OverlayPanel(arg_59_0._tf, {
		pbList = {
			arg_59_0.shopFurniturePage:Find("bg")
		}
	})
	setActive(arg_59_0.bgColor, false)
	arg_59_0:UnloadCharacter()

	arg_59_0.shoppingCartCommodities = {}

	arg_59_0:SetCloseAndRefresh(arg_59_0.shopFurniturePage)
	arg_59_0:SetCommodityList()
	setActive(arg_59_0.shopFurniturePage:Find("scenePreviewBtn"), false)
	setActive(arg_59_0.shopFurniturePage:Find("shoppingCartBtn"), false)
end

function var_0_0.ShowShopSkin(arg_60_0)
	if not arg_60_0.isLoadCharacterScene then
		arg_60_0:PrepareCharacterScene()
	end

	arg_60_0:OverlayPanel(arg_60_0._tf, {
		pbList = {
			arg_60_0.shopSkinPage:Find("bg"),
			arg_60_0.changeCharaPanel
		}
	})
	setActive(arg_60_0.bgColor, false)

	if not arg_60_0.shoppingCartCommodities then
		arg_60_0.shoppingCartCommodities = {}
	end

	if #arg_60_0.shoppingCartCommodities > 0 then
		local var_60_0 = arg_60_0.shoppingCartCommodities[1]:GetCommodityShowType()

		if var_60_0 == IslandConst.COMMODITY_SHOW_FURNITURE or var_60_0 == IslandConst.COMMODITY_SHOW_SKIN then
			arg_60_0.shoppingCartCommodities = {}
		end
	end

	local var_60_1 = arg_60_0.showingShop:GetCommanderOrCharaType()

	if var_60_1 == 0 and (arg_60_0.showingShipId ~= 0 or #arg_60_0.shoppingCartCommodities == 0) then
		arg_60_0.showingShipId = 0

		local var_60_2 = pg.island_unit_character[0]

		arg_60_0:LoadCharacter({
			model = var_60_2.model,
			animator = var_60_2.animator
		}, true)

		arg_60_0.shoppingCartCommodities = {}
	elseif var_60_1 == 1 and (arg_60_0.showingShipId ~= arg_60_0.selectShipId or #arg_60_0.shoppingCartCommodities == 0) then
		arg_60_0.showingShipId = arg_60_0.selectShipId

		local var_60_3 = arg_60_0.characterAgency:GetShipById(arg_60_0.showingShipId):GetModel()

		arg_60_0:LoadCharacter(var_60_3, false)

		arg_60_0.shoppingCartCommodities = {}
	elseif var_60_1 == 2 then
		arg_60_0.showingShipId = arg_60_0.selectShipId

		arg_60_0:UnloadCharacter()

		arg_60_0.shoppingCartCommodities = {}
	end

	arg_60_0:SetCloseAndRefresh(arg_60_0.shopSkinPage)
	arg_60_0:SetCommodityList()
	setActive(arg_60_0.shopSkinPage:Find("cancelBtn"), #arg_60_0.shoppingCartCommodities > 0)
	setActive(arg_60_0.shopSkinPage:Find("changeCharaBtn"), var_60_1 == 1)
	setActive(arg_60_0.shopSkinPage:Find("shoppingCartBtn"), #arg_60_0.shoppingCartCommodities > 0)
	setActive(arg_60_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_60_0.shoppingCartCommodities > 0 and arg_60_0.shoppingCartCommodities[1]:GetItems()[1][1] ~= DROP_TYPE_ISLAND_SKIN)
	setText(arg_60_0.shopSkinPage:Find("shoppingCartBtn/count"), #arg_60_0.shoppingCartCommodities .. "/3")
	setActive(arg_60_0.shopSkinPage:Find("changeCharaPanel"), false)
	arg_60_0:SetChangeCharaPanel()
	onButton(arg_60_0, arg_60_0.shopSkinPage:Find("changeCharaBtn"), function()
		setActive(arg_60_0.shopSkinPage:Find("changeCharaPanel"), true)
	end, SFX_PANEL)
end

function var_0_0.SetChangeCharaPanel(arg_62_0)
	onButton(arg_62_0, arg_62_0.shopSkinPage:Find("changeCharaPanel/bg"), function()
		setActive(arg_62_0.shopSkinPage:Find("changeCharaPanel"), false)
	end, SFX_PANEL)
	onButton(arg_62_0, arg_62_0.changeCharaPanel:Find("closeBtn"), function()
		setActive(arg_62_0.shopSkinPage:Find("changeCharaPanel"), false)
	end, SFX_PANEL)

	local var_62_0 = UIItemList.New(arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content"), arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content/IslandShipTpl"))

	var_62_0:make(function(arg_65_0, arg_65_1, arg_65_2)
		if arg_65_0 == UIItemList.EventUpdate then
			local var_65_0 = arg_62_0.ships[arg_65_1 + 1]
			local var_65_1 = IslandShip.StaticGetPrefab(var_65_0.id)

			GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_65_1, "", arg_65_2:Find("mask/icon"))
			setText(arg_65_2:Find("Text"), "Lv." .. var_65_0:GetLevel())
			setActive(arg_65_2:Find("add"), false)
			setActive(arg_65_2:Find("select"), var_65_0.id == arg_62_0.selectShipId)
			onButton(arg_62_0, arg_65_2, function()
				if arg_62_0.charaSetModel == var_0_0.CharaSetModel.current then
					arg_62_0.selectShipId = var_65_0.id
					arg_62_0.showingShipId = var_65_0.id

					arg_62_0:LoadCharacter(var_65_0:GetModel(), false)

					arg_62_0.shoppingCartCommodities = {}

					setActive(arg_62_0.shopSkinPage:Find("cancelBtn"), false)
					setActive(arg_62_0.shopSkinPage:Find("shoppingCartBtn"), false)
					setText(arg_62_0.shopSkinPage:Find("shoppingCartBtn/count"), "0/3")
					arg_62_0:SetCommodityList()
				elseif arg_62_0.charaSetModel == var_0_0.CharaSetModel.default then
					arg_62_0.defaultShipId = var_65_0.id

					PlayerPrefs.SetInt("island_dressShop_defaultShipId_" .. arg_62_0.player.id, var_65_0.id)
				end

				for iter_66_0 = 0, arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
					setActive(arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_66_0):Find("select"), iter_66_0 == arg_65_1)
				end
			end, SFX_PANEL)
		end
	end)
	var_62_0:align(#arg_62_0.ships)

	arg_62_0.charaSetModel = var_0_0.CharaSetModel.current

	onButton(arg_62_0, arg_62_0.changeCharaPanel:Find("defaultSet"), function()
		if arg_62_0.charaSetModel == var_0_0.CharaSetModel.current then
			arg_62_0.charaSetModel = var_0_0.CharaSetModel.default

			for iter_67_0 = 0, arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
				setActive(arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_67_0):Find("select"), arg_62_0.ships[iter_67_0 + 1].id == arg_62_0.defaultShipId)
			end
		elseif arg_62_0.charaSetModel == var_0_0.CharaSetModel.default then
			arg_62_0.charaSetModel = var_0_0.CharaSetModel.current

			for iter_67_1 = 0, arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content").childCount - 1 do
				setActive(arg_62_0.changeCharaPanel:Find("charaScroll/Viewport/Content"):GetChild(iter_67_1):Find("select"), arg_62_0.ships[iter_67_1 + 1].id == arg_62_0.selectShipId)
			end
		end

		setActive(arg_62_0.changeCharaPanel:Find("defaultSet/off"), arg_62_0.charaSetModel == var_0_0.CharaSetModel.current)
		setActive(arg_62_0.changeCharaPanel:Find("defaultSet/on"), arg_62_0.charaSetModel == var_0_0.CharaSetModel.default)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_68_0)
	arg_68_0:AddListener(GAME.ISLAND_SHOP_OP_DONE, arg_68_0.UpdateView)
	arg_68_0:AddListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_68_0.OnSwitchMapByPoint)
	arg_68_0:AddListener(ActivityProxy.ACTIVITY_UPDATED, arg_68_0.UpdateActivity)
	arg_68_0:AddListener(GAME.ACTIVITY_DRAW_AWARD_OPERATION_DONE, arg_68_0.DrawOperation)
end

function var_0_0.RemoveListeners(arg_69_0)
	arg_69_0:RemoveListener(GAME.ISLAND_SHOP_OP_DONE, arg_69_0.UpdateView)
	arg_69_0:RemoveListener(ISLAND_EX_EVT.SWITCH_MAP_BY_POINT, arg_69_0.OnSwitchMapByPoint)
	arg_69_0:RemoveListener(ActivityProxy.ACTIVITY_UPDATED, arg_69_0.UpdateActivity)
	arg_69_0:RemoveListener(GAME.ACTIVITY_DRAW_AWARD_OPERATION_DONE, arg_69_0.DrawOperation)
end

function var_0_0.UpdateView(arg_70_0, arg_70_1)
	if arg_70_1.operation == IslandConst.SHOP_GET_DATA then
		if arg_70_1.refreshAll then
			arg_70_0:UpdateData()
			arg_70_0:SetShopList()
		else
			arg_70_0:SetShopPage()
		end
	elseif arg_70_1.operation == IslandConst.SHOP_BUY_COMMODITY then
		arg_70_0.shoppingCartCommodities = {}

		arg_70_0:SetShopPage()

		if arg_70_0.myIslandShoppingCartLayer then
			arg_70_0.myIslandShoppingCartLayer:Hide()
		end

		arg_70_0:OpenPage(IslandShopBuySuccessLayer, arg_70_1.awards, function()
			if arg_70_0.showingShop:GetShowType() == IslandConst.SHOP_TYPE_SKIN then
				arg_70_0:ShowMsgBox({
					type = IslandMsgBox.TYPE_COMMON,
					content = i18n("island_3Dshop_clothes_jump"),
					onYes = function()
						arg_70_0:ClearCharacterScene(function()
							arg_70_0:Hide()

							local var_73_0 = arg_70_0.showingShop:GetCommanderOrCharaType()

							if var_73_0 == 0 then
								arg_70_0:OpenScenePage(IslandShipIslandCommanderMainPage)
							elseif var_73_0 == 1 or var_73_0 == 2 then
								arg_70_0:OpenScenePage(IslandShipMainPage, 3)
							end
						end)
					end
				})
			end
		end)

		if arg_70_0.myIslandShopItemLayer then
			arg_70_0.myIslandShopItemLayer:Refresh()
		end
	elseif arg_70_1.operation == IslandConst.REFRESH_SHOP_BY_PLAYER then
		arg_70_0:SetShopPage()
	end
end

function var_0_0.OnSwitchMapByPoint(arg_74_0)
	setActive(arg_74_0._tf, true)
	arg_74_0:PrepareCharacterScene()
end

function var_0_0.UpdateActivity(arg_75_0, arg_75_1)
	if arg_75_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_ISLAND_DRAW_AWARD then
		arg_75_0.drawAwardActivity = arg_75_1

		arg_75_0.drawAwardPage:ActionInvoke("UpdateActivity", arg_75_0.drawAwardActivity)
		arg_75_0:SetResources()
	end
end

function var_0_0.DrawOperation(arg_76_0, arg_76_1)
	arg_76_0.drawAwardPage:ActionInvoke("DrawOperation", arg_76_1)
end

function var_0_0.Preload(arg_77_0, arg_77_1)
	arg_77_1()
end

function var_0_0.GetSmoothRotateObject(arg_78_0)
	return arg_78_0._tf:Find("adapt/model")
end

function var_0_0.LoadFurniture(arg_79_0, arg_79_1, arg_79_2)
	arg_79_0:UnloadCharacter()

	if arg_79_0.isLoadingModel then
		return
	end

	arg_79_0.isLoadingModel = true

	local var_79_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_79_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_80_0)
		arg_79_0.role = Object.Instantiate(arg_80_0)

		local var_80_0 = arg_79_0.role.name
		local var_80_1 = GameObject.New(var_80_0)

		setParent(arg_79_0.role, var_80_1.transform, false)

		arg_79_0.role = var_80_1
		arg_79_0.isLoadingModel = false

		pg.ViewUtils.SetLayer(arg_79_0.role.transform, Layer.Character3D)
		setParent(arg_79_0.role, arg_79_0.roleContainer)

		arg_79_0.role.transform.localPosition = Vector3(arg_79_2[1][1], arg_79_2[1][2], 0)
		arg_79_0.role.transform.localEulerAngles = Vector3(0, arg_79_2[2], 0)
		arg_79_0.role.transform.localScale = Vector3(arg_79_2[3], arg_79_2[3], arg_79_2[3])

		local var_80_2 = arg_79_0:GetSmoothRotateObject()
		local var_80_3 = GetOrAddComponent(var_80_2, typeof(SmoothRotateObject))

		var_80_3:SetUp(arg_79_0.role.transform)

		var_80_3.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int
	end), true, true)

	table.insert(arg_79_0.loadingIdList or {}, var_79_0)
end

function var_0_0.LoadCharacter(arg_81_0, arg_81_1, arg_81_2)
	arg_81_0:UnloadCharacter()

	if arg_81_0.isLoadingModel then
		return
	end

	arg_81_0.isLoadingModel = true

	arg_81_0.islandShipDressHelper:SetShipId(arg_81_0.showingShipId)

	arg_81_0.isCommander = arg_81_2
	arg_81_0.modelData = arg_81_1

	local function var_81_0(arg_82_0)
		arg_81_0.role = arg_82_0
		arg_81_0.isLoadingModel = false

		pg.ViewUtils.SetLayer(arg_81_0.role.transform, Layer.Character3D)
		setParent(arg_81_0.role, arg_81_0.roleContainer)

		local var_82_0 = 2.7
		local var_82_1 = arg_81_0._tf.rect.width / arg_81_0._tf.rect.height

		if var_82_1 < 1.7777777777777777 then
			var_82_0 = 2.7 - 0.5 * (1.7777777777777777 - var_82_1) / 0.4444444444444444
		end

		arg_81_0.role.transform.localPosition = Vector3(var_82_0, 0, 0)
		arg_81_0.role.transform.localEulerAngles = Vector3(0, -155, 0)

		local var_82_2 = arg_81_0:GetSmoothRotateObject()
		local var_82_3 = GetOrAddComponent(var_82_2, typeof(SmoothRotateObject))

		var_82_3:SetUp(arg_81_0.role.transform)

		var_82_3.rotationSpeed = pg.island_set.character_detail_camera_speed.key_value_int

		local var_82_4 = arg_81_0.modelData and arg_81_0.modelData.personal_ani

		if var_82_4 and var_82_4 ~= "" then
			local var_82_5 = GetOrAddComponent(arg_81_0.role.transform:GetChild(0), typeof(Animator))

			for iter_82_0 = 1, var_82_5.layerCount do
				var_82_5:CrossFadeInFixedTime(var_82_4, 0, iter_82_0 - 1)
			end
		end

		arg_81_0.islandShipDressHelper:OnRoleLoaded(arg_81_0.role.transform)
	end

	if arg_81_0.isCommander then
		arg_81_0:GetPoolMgr():GetCommanderModel(arg_81_1, function(arg_83_0)
			var_81_0(arg_83_0)
		end)
	else
		arg_81_0:GetPoolMgr():GetCharacter(arg_81_1.model, arg_81_1.animator, function(arg_84_0)
			var_81_0(arg_84_0)
		end)
	end
end

function var_0_0.UnloadCharacter(arg_85_0)
	arg_85_0.islandShipDressHelper:Destroy()

	if arg_85_0.role then
		pg.ViewUtils.SetLayer(arg_85_0.role.transform, Layer.Default)

		if arg_85_0.isCommander then
			arg_85_0:GetPoolMgr():ReturnCommanderModel(arg_85_0.role)
		elseif arg_85_0.modelData then
			arg_85_0:GetPoolMgr():ReturnCharacter(arg_85_0.modelData.model, arg_85_0.modelData.animator, arg_85_0.role)

			arg_85_0.modelData = nil
		end

		arg_85_0.role = nil
	end

	arg_85_0.modelData = nil
end

function var_0_0.OnShow(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	arg_86_0:OverlayPanel(arg_86_0._tf)

	arg_86_0.showTypes = arg_86_1
	arg_86_0.firstShopIds = arg_86_2
	arg_86_0.showDrawAward = arg_86_3 == 1
	arg_86_0.drawAwardActivity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND_DRAW_AWARD)

	arg_86_0:DoUpdateShops()
	arg_86_0:UpdateData()
	arg_86_0:SetShopList()
end

function var_0_0.OnHide(arg_87_0)
	arg_87_0:UnOverlayPanel(arg_87_0._tf)

	if arg_87_0.timer then
		arg_87_0.timer:Stop()

		arg_87_0.timer = nil
	end

	arg_87_0.shoppingCartCommodities = {}

	arg_87_0.islandShipDressHelper:Destroy()
	arg_87_0:UnloadCharacter()
	arg_87_0.drawAwardPage:Destroy()
	arg_87_0.drawAwardPage:Reset()

	for iter_87_0, iter_87_1 in ipairs(arg_87_0.loadingIdList or {}) do
		IslandAssetLoadDispatcher.Instance:Cancel(iter_87_1)
	end

	arg_87_0.loadingIdList = {}
end

function var_0_0.OnDisable(arg_88_0)
	arg_88_0:OnHide()
	var_0_0.super.OnDisable(arg_88_0)
end

function var_0_0.OnDestroy(arg_89_0)
	arg_89_0:OnHide()
	var_0_0.super.OnDestroy(arg_89_0)
end

function var_0_0.StaticUpdateCommodityTpl(arg_90_0, arg_90_1)
	local var_90_0 = arg_90_1:GetMaxNum() - arg_90_1.purchasedNum

	setText(arg_90_0:Find("name"), arg_90_1:GetName())

	if #arg_90_1:GetItems() == 1 and arg_90_1:GetItems()[1][1] ~= DROP_TYPE_ISLAND_FURNITURE and arg_90_1:GetItems()[1][1] ~= DROP_TYPE_ISLAND_DRESS and arg_90_1:GetItems()[1][1] ~= DROP_TYPE_ISLAND_SKIN then
		local var_90_1 = arg_90_1:GetItems()[1]
		local var_90_2 = {
			type = var_90_1[1],
			id = var_90_1[2],
			count = var_90_1[3]
		}

		updateCustomDrop(arg_90_0:Find("IslandItemTpl"), var_90_2, {
			style = "island"
		})
	else
		GetImageSpriteFromAtlasAsync(arg_90_1:GetIcon(), "", arg_90_0:Find("IslandItemTpl/icon_bg/icon"))
	end

	setActive(arg_90_0:Find("IslandItemTpl/icon_bg/count_bg"), arg_90_1:IsShowPurchaseLimit())
	setText(arg_90_0:Find("IslandItemTpl/icon_bg/count_bg/count"), var_90_0 .. "/" .. arg_90_1:GetMaxNum())

	local var_90_3 = arg_90_1:GetResourceConsume()

	GetImageSpriteFromAtlasAsync(Drop.New({
		type = var_90_3[1],
		id = var_90_3[2]
	}):getIcon(), "", arg_90_0:Find("cost/icon"))
	setText(arg_90_0:Find("cost/num"), math.ceil((100 - arg_90_1:GetDiscount()) / 100 * var_90_3[3]))
	setActive(arg_90_0:Find("timeLimit"), arg_90_1:IsTimeLimitCommodity())
	setActive(arg_90_0:Find("discount"), arg_90_1:GetDiscount() ~= 0)
	setText(arg_90_0:Find("discount/Text"), "-" .. arg_90_1:GetDiscount() .. "%")

	local var_90_4 = arg_90_1:GetItems()[1][1]
	local var_90_5 = arg_90_1:GetItems()[1][2]
	local var_90_6 = Drop.New({
		count = 1,
		type = var_90_4,
		id = var_90_5
	}):getOwnedCount()

	setActive(arg_90_0:Find("have"), arg_90_1:IsShowHave())
	setText(arg_90_0:Find("have"), i18n("island_3Dshop_have") .. var_90_6)
	setActive(arg_90_0:Find("hold"), arg_90_1:IsShowHold() and (var_90_6 > 0 or arg_90_1:IsCharacterInviteItemHold()))
	setActive(arg_90_0:Find("sellOut"), arg_90_1:GetMaxNum() ~= 0 and var_90_0 == 0 and not isActive(arg_90_0:Find("hold")))
	setActive(arg_90_0:Find("cost"), not isActive(arg_90_0:Find("sellOut")) and not isActive(arg_90_0:Find("hold")))
	setActive(arg_90_0:Find("select"), false)
end

function var_0_0.SortShopCommodities(arg_91_0)
	table.sort(arg_91_0, CompareFuncs({
		function(arg_92_0)
			local var_92_0 = arg_92_0:GetMaxNum() - arg_92_0.purchasedNum

			if arg_92_0:GetMaxNum() ~= 0 and var_92_0 == 0 then
				return 3
			end

			if arg_92_0:IsShowHold() then
				if arg_92_0:IsCharacterInviteItemHold() then
					return 2
				else
					local var_92_1 = arg_92_0:GetItems()[1][1]
					local var_92_2 = arg_92_0:GetItems()[1][2]

					return Drop.New({
						count = 1,
						type = var_92_1,
						id = var_92_2
					}):getOwnedCount() > 0 and 2 or 1
				end
			else
				return 1
			end
		end,
		function(arg_93_0)
			return arg_93_0.id
		end
	}))
end

return var_0_0

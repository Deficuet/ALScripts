local var_0_0 = class("ShoppingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.count
	local var_1_3 = pg.shop_template[var_1_1]

	if not var_1_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_shopId_noFound"))

		return
	end

	if var_1_3.type == DROP_TYPE_WORLD_ITEM and not nowWorld():IsActivate() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_shop_bag_unactivated"))

		return
	end

	local var_1_4 = getProxy(PlayerProxy)
	local var_1_5 = var_1_4:getData()

	if var_1_3.type == DROP_TYPE_ITEM then
		local var_1_6 = var_1_3.effect_args
		local var_1_7 = Item.getConfigData(var_1_6[1]).display_icon

		for iter_1_0, iter_1_1 in pairs(var_1_7) do
			if iter_1_1[1] == 1 then
				if iter_1_1[2] == 1 and var_1_5:GoldMax(iter_1_1[3]) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))

					return
				end

				if iter_1_1[2] == 2 and var_1_5:OilMax(iter_1_1[3]) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))

					return
				end
			end
		end
	end

	if var_1_3.type == DROP_TYPE_RESOURCE then
		if var_1_3.effect_args[1] == 1 and var_1_5:GoldMax(var_1_3.num * var_1_2) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))

			return
		end

		if var_1_3.effect_args[1] == 2 then
			local var_1_8 = var_1_3.num

			if var_1_8 == -1 and var_1_3.genre == ShopArgs.BuyOil then
				var_1_8 = ShopArgs.getOilByLevel(var_1_5.level)
			end

			if var_1_5:OilMax(var_1_8 * var_1_2) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))

				return
			end
		end
	end

	if var_1_2 == 0 then
		return
	end

	local var_1_9 = getProxy(ShopsProxy)
	local var_1_10 = var_1_9:getShopStreet()
	local var_1_11 = false
	local var_1_12 = var_1_3.resource_num
	local var_1_13 = getProxy(NavalAcademyProxy)

	if var_1_12 == -1 then
		if var_1_3.effect_args == ShopArgs.EffectShopStreetLevel then
			var_1_12 = pg.navalacademy_shoppingstreet_template[var_1_10.level].lv_up_cost[2] * var_1_2
		else
			local var_1_14 = switch(var_1_3.effect_args, {
				[ShopArgs.EffectTradingPortLevel] = function()
					return var_1_13._goldVO
				end,
				[ShopArgs.EffectOilFieldLevel] = function()
					return var_1_13._oilVO
				end,
				[ShopArgs.EffectClassLevel] = function()
					return var_1_13._classVO
				end
			})

			if var_1_14 then
				var_1_12 = var_1_14:bindConfigTable()[var_1_14:GetLevel()].use[2] * var_1_2
			end
		end
	else
		var_1_12 = var_1_3.resource_num * var_1_2

		if var_1_10 and var_1_3.genre == ShopArgs.ShoppingStreetLimit then
			var_1_11 = true

			local var_1_15 = var_1_10:getGoodsById(var_1_1)

			var_1_12 = math.ceil(var_1_15.discount / 100 * var_1_12)
		end
	end

	if var_1_3.limit_args then
		for iter_1_2, iter_1_3 in ipairs(var_1_3.limit_args) do
			if type(iter_1_3) == "table" and iter_1_3[1] == "level" and iter_1_3[2] > var_1_5.level then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_limit_level", iter_1_3[2]))

				return
			end
		end
	end

	if var_1_3.discount ~= 0 and CommonCommodity.InCommodityDiscountTime(var_1_3.id) then
		var_1_12 = var_1_12 * ((100 - var_1_3.discount) / 100)
	end

	if var_1_12 > var_1_5[id2res(var_1_3.resource_type)] then
		local var_1_16 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_1_3.resource_type
		}):getName()

		if var_1_3.resource_type == 1 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					var_1_12 - var_1_5[id2res(var_1_3.resource_type)],
					var_1_12
				}
			})
		elseif var_1_3.resource_type == 4 or var_1_3.resource_type == 14 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)

			if var_1_3.id == NewShopMainMediator.FAST_BUILD_ITEM_ID then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
			end
		elseif not ItemTipPanel.ShowItemTip(DROP_TYPE_RESOURCE, var_1_3.resource_type) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", var_1_16))
		end

		return
	end

	local var_1_17 = {}

	table.insert(var_1_17, function(arg_5_0)
		if var_1_3.genre == ShopArgs.GiftPackage or var_1_3.genre == ShopArgs.NewServerShop then
			local var_5_0 = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = var_1_3.effect_args[1]
			})
			local var_5_1 = GetItemsOverflowDic({
				var_5_0
			})
			local var_5_2, var_5_3 = CheckOverflow(var_5_1)

			if not var_5_2 then
				switch(var_5_3, {
					gold = function()
						pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))
					end,
					oil = function()
						pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))
					end,
					equip = function()
						NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)
					end,
					ship = function()
						NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)
					end
				})

				return
			end

			if not CheckShipExpOverflow(var_5_1) then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("player_expResource_mail_fullBag"),
					onYes = arg_5_0
				})

				return
			end
		end

		arg_5_0()
	end)
	seriesAsync(var_1_17, function()
		pg.ConnectionMgr.GetInstance():Send(16001, {
			id = var_1_1,
			number = var_1_2
		}, 16002, function(arg_11_0)
			if arg_11_0.result == 0 then
				local var_11_0 = {}

				if var_1_3.type == 0 then
					arg_1_0:sendNotification(GAME.EXTEND, {
						id = var_1_1,
						count = var_1_2
					})
				else
					var_11_0 = PlayerConst.addTranDrop(arg_11_0.drop_list)

					if not var_1_0.silentTip then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_buy_success"))
					end
				end

				local var_11_1 = var_1_4:getData()

				var_11_1:consume({
					[id2res(var_1_3.resource_type)] = var_1_12
				})

				local var_11_2

				if var_1_11 then
					local var_11_3 = var_1_9:getShopStreet()
					local var_11_4 = var_11_3:getGoodsById(var_1_1)

					var_11_2 = var_11_3.type

					var_11_4:reduceBuyCount()
					var_1_9:UpdateShopStreet(var_11_3)
				else
					switch(var_1_3.genre, {
						[ShopArgs.BuyOil] = function()
							var_11_1:increaseBuyOilCount()
						end,
						[ShopArgs.ArenaShopLimit] = function()
							local var_13_0 = getProxy(ShopsProxy)
							local var_13_1 = var_13_0:getMeritorousShop()
							local var_13_2 = var_13_1:getGoodsById(var_1_1)

							var_13_2:increaseBuyCount()
							var_13_1:updateGoods(var_13_2)

							var_11_2 = var_13_1.type

							var_13_0:updateMeritorousShop(var_13_1)
						end,
						[ShopArgs.GiftPackage] = function()
							var_1_9:GetNormalByID(var_1_1):increaseBuyCount()
						end,
						[ShopArgs.NewServerShop] = function()
							var_1_9:GetNormalByID(var_1_1):increaseBuyCount()
						end,
						[ShopArgs.SkinShop] = function()
							assert(false, "must be used ShoppingCommand")
						end,
						[ShopArgs.SkinShopTimeLimit] = function()
							assert(false, "must be used ShoppingCommand")
						end,
						[ShopArgs.guildShop] = function()
							local var_18_0 = getProxy(ShopsProxy):getGuildShop()

							var_18_0:getGoodsById(var_1_1):reduceBuyCount()
							var_1_9:updateGuildShop(var_18_0)
						end,
						[ShopArgs.WorldShop] = function()
							nowWorld():UpdateWorldShopGoods({
								{
									goods_id = var_1_1,
									count = var_1_2
								}
							})
						end,
						[ShopArgs.WorldCollection] = function()
							nowWorld():UpdateWorldShopGoods({
								{
									goods_id = var_1_1,
									count = var_1_2
								}
							})
						end,
						[ShopArgs.CruiseSkin] = function()
							var_1_9:GetNormalByID(var_1_1):increaseBuyCount()
						end,
						[ShopArgs.CruiseGearSkin] = function()
							var_1_9:GetNormalByID(var_1_1):increaseBuyCount()
						end
					})
				end

				var_1_4:updatePlayer(var_11_1)

				if var_1_3.group > 0 then
					var_1_9:updateNormalGroupList(var_1_3.group, var_1_3.group_buy_count)
				end

				if var_1_3.genre == ShopArgs.CruiseSkin or var_1_3.genre == ShopArgs.CruiseGearSkin then
					var_1_9:UpdateCruiseShop()
				end

				switch(var_1_3.effect_args, {
					[ShopArgs.EffecetShipBagSize] = function()
						pg.TipsMgr.GetInstance():ShowTips(i18n("shop_extendship_success"))
					end,
					[ShopArgs.EffecetEquipBagSize] = function()
						pg.TipsMgr.GetInstance():ShowTips(i18n("shop_extendequip_success"))
					end,
					[ShopArgs.EffectCommanderBagSize] = function()
						pg.TipsMgr.GetInstance():ShowTips(i18n("shop_extendcommander_success"))
					end,
					[ShopArgs.EffectSpWeaponBagSize] = function()
						pg.TipsMgr.GetInstance():ShowTips(i18n("shop_spweapon_success"))
					end
				})

				if var_1_3.limit_args then
					for iter_11_0, iter_11_1 in ipairs(var_1_3.limit_args) do
						if type(iter_11_1) == "table" and (var_1_3.type == DROP_TYPE_DORM3D_FURNITURE or var_1_3.type == DROP_TYPE_DORM3D_GIFT) then
							if iter_11_1[1] == "dailycount" then
								if var_1_3.type == DROP_TYPE_DORM3D_FURNITURE then
									getProxy(ApartmentProxy):AddDailyFurnitureShopCount(var_1_3.effect_args[1], var_1_3.effect_args[2] or 1)
								elseif var_1_3.type == DROP_TYPE_DORM3D_GIFT then
									getProxy(ApartmentProxy):AddDailyGiftShopCount(var_1_3.effect_args[1], var_1_3.effect_args[2] or 1)
								end
							elseif iter_11_1[1] == "count" then
								if var_1_3.type == DROP_TYPE_DORM3D_FURNITURE then
									getProxy(ApartmentProxy):AddPermanentFurnitureShopCount(var_1_3.effect_args[1], var_1_3.effect_args[2] or 1)
								elseif var_1_3.type == DROP_TYPE_DORM3D_GIFT then
									getProxy(ApartmentProxy):AddPermanentGiftShopCount(var_1_3.effect_args[1], var_1_3.effect_args[2] or 1)
								end
							end
						end
					end
				end

				if var_1_3.group_limit > 0 and (var_1_3.type == DROP_TYPE_DORM3D_FURNITURE or var_1_3.type == DROP_TYPE_DORM3D_GIFT) then
					if var_1_3.type == DROP_TYPE_DORM3D_FURNITURE then
						getProxy(ApartmentProxy):AddDailyFurnitureShopCount(var_1_3.effect_args[1], var_1_3.effect_args[2] or 1)
					elseif var_1_3.type == DROP_TYPE_DORM3D_GIFT then
						getProxy(ApartmentProxy):AddDailyGiftShopCount(var_1_3.effect_args[1], var_1_3.effect_args[2] or 1)
					end
				end

				if not var_1_0.isQuickShopping then
					arg_1_0:sendNotification(GAME.SHOPPING_DONE, {
						id = var_1_1,
						shopType = var_11_2,
						normalList = var_1_9:GetNormalList(),
						normalGroupList = var_1_9:GetNormalGroupList(),
						awards = var_11_0
					})
				end
			else
				originalPrint(arg_11_0.result)

				if arg_11_0.result == 4400 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("shopping_error_time_limit"))
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_11_0.result))
				end
			end
		end)
	end)
end

return var_0_0

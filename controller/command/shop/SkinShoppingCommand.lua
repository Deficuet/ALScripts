local var_0_0 = class("SkinShoppingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.count
	local var_1_3 = pg.shop_template[var_1_1]

	if not var_1_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_shopId_noFound"))

		return
	end

	if var_1_2 == 0 then
		return
	end

	local var_1_4 = getProxy(ShopsProxy)
	local var_1_5 = var_1_4:getShopStreet()
	local var_1_6 = false
	local var_1_7 = var_1_3.resource_num * var_1_2
	local var_1_8 = getProxy(PlayerProxy)
	local var_1_9 = var_1_8:getData()

	if var_1_3.limit_args then
		for iter_1_0, iter_1_1 in ipairs(var_1_3.limit_args) do
			if type(iter_1_1) == "table" and iter_1_1[1] == "level" and iter_1_1[2] > var_1_9.level then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_limit_level", iter_1_1[2]))

				return
			end
		end
	end

	if var_1_3.discount ~= 0 and CommonCommodity.InCommodityDiscountTime(var_1_3.id) then
		var_1_7 = var_1_7 * ((100 - var_1_3.discount) / 100)
	end

	if var_1_7 > var_1_9[id2res(var_1_3.resource_type)] then
		local var_1_10 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_1_3.resource_type
		}):getName()

		if var_1_3.resource_type == 1 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					var_1_7 - var_1_9[id2res(var_1_3.resource_type)],
					var_1_7
				}
			})
		elseif var_1_3.resource_type == 4 or var_1_3.resource_type == 14 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_BUILD_OR_SKIN_FAILD)
		elseif not ItemTipPanel.ShowItemTip(DROP_TYPE_RESOURCE, var_1_3.resource_type) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", var_1_10))
		end

		return
	end

	local var_1_11 = {}

	seriesAsync(var_1_11, function()
		pg.ConnectionMgr.GetInstance():Send(16001, {
			id = var_1_1,
			number = var_1_2
		}, 16002, function(arg_3_0)
			if arg_3_0.result == 0 then
				local var_3_0 = {}
				local var_3_1 = var_1_8:getData()

				var_3_1:consume({
					[id2res(var_1_3.resource_type)] = var_1_7
				})

				local var_3_2

				switch(var_1_3.genre, {
					[ShopArgs.SkinShop] = function()
						var_3_0 = PlayerConst.addTranDrop(arg_3_0.drop_list)

						local var_4_0 = var_1_3.effect_args[1]
						local var_4_1 = getProxy(ShipSkinProxy)
						local var_4_2 = ShipSkin.New({
							id = var_4_0
						})

						var_4_1:addSkin(var_4_2)
					end,
					[ShopArgs.SkinShopTimeLimit] = function()
						local var_5_0 = var_1_3.effect_args[1]
						local var_5_1 = getProxy(ShipSkinProxy)
						local var_5_2 = var_5_1:getSkinById(var_5_0)

						if var_5_2 and var_5_2:isExpireType() then
							local var_5_3 = var_1_3.time_second * var_1_2 + var_5_2.endTime
							local var_5_4 = ShipSkin.New({
								id = var_5_0,
								end_time = var_5_3
							})

							var_5_1:addSkin(var_5_4)
						elseif not var_5_2 then
							local var_5_5 = var_1_3.time_second * var_1_2 + pg.TimeMgr.GetInstance():GetServerTime()
							local var_5_6 = ShipSkin.New({
								id = var_5_0,
								end_time = var_5_5
							})

							var_5_1:addSkin(var_5_6)
						end
					end
				})
				var_1_8:updatePlayer(var_3_1)

				if var_1_3.group > 0 then
					var_1_4:updateNormalGroupList(var_1_3.group, var_1_3.group_buy_count)
				end

				arg_1_0:sendNotification(GAME.SKIN_SHOPPIGN_DONE, {
					id = var_1_1,
					shopType = var_3_2,
					normalList = var_1_4:GetNormalList(),
					normalGroupList = var_1_4:GetNormalGroupList(),
					awards = var_3_0
				})
			else
				originalPrint(arg_3_0.result)

				if arg_3_0.result == 4400 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("shopping_error_time_limit"))
				else
					pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_3_0.result))
				end
			end
		end)
	end)
end

return var_0_0

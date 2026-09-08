local var_0_0 = class("ExtendCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.count
	local var_1_3 = getProxy(PlayerProxy)
	local var_1_4 = var_1_3:getData()
	local var_1_5 = ShopConst.GetShopConfig(var_1_1)

	if var_1_5.effect_args == ShopArgs.EffecetEquipBagSize then
		var_1_4:addEquipmentBagCount(var_1_5.num * var_1_2)
	elseif var_1_5.effect_args == ShopArgs.EffecetShipBagSize then
		var_1_4:addShipBagCount(var_1_5.num * var_1_2)
	elseif var_1_5.effect_args == ShopArgs.EffectDromExpPos then
		local var_1_6 = getProxy(DormProxy)
		local var_1_7 = var_1_6:getData()

		var_1_7:increaseTrainPos()
		var_1_7:increaseRestPos()
		var_1_6:updateDrom(var_1_7, BackYardConst.DORM_UPDATE_TYPE_SHIP)
		arg_1_0:sendNotification(GAME.EXTEND_BACKYARD_DONE)
	elseif var_1_5.effect_args == ShopArgs.EffectDromFoodMax then
		local var_1_8 = getProxy(DormProxy)
		local var_1_9 = var_1_8:getData()

		var_1_9:extendFoodCapacity(var_1_5.num)
		var_1_9:increaseFoodExtendCount()
		var_1_8:updateDrom(var_1_9, BackYardConst.DORM_UPDATE_TYPE_EXTENDFOOD)
		pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_extendCapacity_ok", var_1_5.num))
	elseif var_1_5.effect_args == ShopArgs.EffectShopStreetFlash then
		pg.TipsMgr.GetInstance():ShowTips(i18n("refresh_shopStreet_ok"))
	elseif var_1_5.effect_args == ShopArgs.EffectTradingPortLevel or var_1_5.effect_args == ShopArgs.EffectOilFieldLevel or var_1_5.effect_args == ShopArgs.EffectClassLevel then
		local var_1_10
		local var_1_11 = getProxy(NavalAcademyProxy)

		if var_1_5.effect_args == ShopArgs.EffectTradingPortLevel then
			var_1_10 = var_1_11._goldVO
		elseif var_1_5.effect_args == ShopArgs.EffectOilFieldLevel then
			var_1_10 = var_1_11._oilVO
		elseif var_1_5.effect_args == ShopArgs.EffectClassLevel then
			var_1_10 = var_1_11._classVO

			local var_1_12 = var_1_10:GetLevel()

			if var_1_12 == 7 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_CLASS_LEVEL_UP_8)
			elseif var_1_12 == 8 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_CLASS_LEVEL_UP_9)
			elseif var_1_12 == 9 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_CLASS_LEVEL_UP_10)
			end
		end

		var_1_11:StartUpGradeSuccess(var_1_10)

		if PLATFORM_CODE == PLATFORM_US then
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_start") .. " " .. i18n("word_levelup"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("word_start") .. i18n("word_levelup"))
		end
	elseif var_1_5.effect_args == ShopArgs.EffectGuildFlash then
		pg.TipsMgr.GetInstance():ShowTips(i18n("guild_shop_flash_success"))
	elseif var_1_5.effect_args == ShopArgs.EffectDormFloor then
		local var_1_13 = getProxy(DormProxy)
		local var_1_14 = var_1_13:getData()

		var_1_14:setFloorNum(var_1_14.floorNum + 1)
		var_1_13:updateDrom(var_1_14, BackYardConst.DORM_UPDATE_TYPE_FLOOR)
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_buy_success"))
	elseif var_1_5.effect_args == ShopArgs.EffectSkillPos then
		getProxy(NavalAcademyProxy):inCreaseKillClassNum()
		pg.TipsMgr.GetInstance():ShowTips(i18n("open_skill_class_success"))
	elseif var_1_5.effect_args == ShopArgs.EffectCommanderBagSize then
		var_1_4:updateCommanderBagMax(var_1_5.num)
	elseif var_1_5.effect_args == ShopArgs.EffectSpWeaponBagSize then
		getProxy(EquipmentProxy):AddSpWeaponCapacity(var_1_5.num)
	else
		assert(false, "未处理类型")
	end

	var_1_3:updatePlayer(var_1_4)
end

return var_0_0

local var_0_0 = class("ShipSkinProxy", import(".NetProxy"))

var_0_0.SHIP_SKINS_UPDATE = "ship skins update"
var_0_0.SHIP_SKIN_EXPIRED = "ship skin expired"
var_0_0.FORBIDDEN_TYPE_HIDE = 0
var_0_0.FORBIDDEN_TYPE_SHOW = 1

function var_0_0.register(arg_1_0)
	arg_1_0.skins = {}
	arg_1_0.changeSkinGroupDic = {}
	arg_1_0.cacheSkins = {}
	arg_1_0.timers = {}
	arg_1_0.forbiddenSkinList = {}

	arg_1_0:on(12201, function(arg_2_0)
		_.each(arg_2_0.skin_list, function(arg_3_0)
			local var_3_0 = ShipSkin.New(arg_3_0)

			arg_1_0:addSkin(ShipSkin.New(arg_3_0))
		end)
		_.each(arg_2_0.forbidden_skin_list, function(arg_4_0)
			table.insert(arg_1_0.forbiddenSkinList, {
				id = arg_4_0,
				type = var_0_0.FORBIDDEN_TYPE_HIDE
			})
		end)

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.forbidden_skin_type) do
			arg_1_0.forbiddenSkinList[iter_2_0].type = iter_2_1
		end
	end)
end

function var_0_0.getOverDueSkins(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.cacheSkins) do
		table.insert(var_5_0, iter_5_1)
	end

	arg_5_0.cacheSkins = {}

	return var_5_0
end

function var_0_0.getRawData(arg_6_0)
	return arg_6_0.skins
end

function var_0_0.getSkinList(arg_7_0)
	return _.map(_.values(arg_7_0.skins), function(arg_8_0)
		return arg_8_0.id
	end)
end

function var_0_0.addSkin(arg_9_0, arg_9_1)
	assert(isa(arg_9_1, ShipSkin), "skin should be an instance of ShipSkin")

	if arg_9_0.prevNewSkin then
		arg_9_0.prevNewSkin:SetIsNew(false)
	end

	arg_9_0.skins[arg_9_1.id] = arg_9_1

	if ShipSkin.IsChangeSkin(arg_9_1.id) then
		arg_9_0.changeSkinGroupDic[ShipSkin.GetChangeSkinGroupId(arg_9_1.id)] = true
	end

	arg_9_0.prevNewSkin = arg_9_1

	arg_9_0:addExpireTimer(arg_9_1)

	if arg_9_1:getConfig("skin_type") == ShipSkin.SKIN_TYPE_TB then
		NewEducateHelper.UpdateUnlockBySkinId(arg_9_1.id)
	end

	arg_9_0.facade:sendNotification(var_0_0.SHIP_SKINS_UPDATE)
end

function var_0_0.getSkinById(arg_10_0, arg_10_1)
	return arg_10_0.skins[arg_10_1]
end

function var_0_0.addExpireTimer(arg_11_0, arg_11_1)
	arg_11_0:removeExpireTimer(arg_11_1.id)

	if not arg_11_1:isExpireType() then
		return
	end

	local function var_11_0()
		table.insert(arg_11_0.cacheSkins, arg_11_1)
		arg_11_0:removeSkinById(arg_11_1.id)

		local var_12_0 = getProxy(BayProxy)
		local var_12_1 = {}

		underscore.each(var_12_0:CanUseShareSkinPhantoms(arg_11_1.id), function(arg_13_0)
			if arg_13_0:getSkinId() == arg_11_1.id then
				var_12_0:updateShipSkin(arg_13_0.id, arg_13_0.phantomId, arg_13_0:getConfig("skin_id"))
			end
		end)
		arg_11_0:sendNotification(GAME.SHIP_SKIN_EXPIRED)
	end

	local var_11_1 = arg_11_1:getExpireTime() - pg.TimeMgr.GetInstance():GetServerTime()

	if var_11_1 <= 0 then
		var_11_0()
	else
		arg_11_0.timers[arg_11_1.id] = Timer.New(var_11_0, var_11_1, 1)

		arg_11_0.timers[arg_11_1.id]:Start()
	end
end

function var_0_0.removeExpireTimer(arg_14_0, arg_14_1)
	if arg_14_0.timers[arg_14_1] then
		arg_14_0.timers[arg_14_1]:Stop()

		arg_14_0.timers[arg_14_1] = nil
	end
end

function var_0_0.removeSkinById(arg_15_0, arg_15_1)
	arg_15_0.skins[arg_15_1] = nil

	arg_15_0:removeExpireTimer(arg_15_1)
	arg_15_0.facade:sendNotification(var_0_0.SHIP_SKINS_UPDATE)
end

function var_0_0.hasSkin(arg_16_0, arg_16_1)
	if ShipSkin.IsChangeSkin(arg_16_1) then
		local var_16_0 = ShipSkin.GetChangeSkinGroupId(arg_16_1)

		return arg_16_0.changeSkinGroupDic[var_16_0]
	end

	return arg_16_0.skins[arg_16_1] ~= nil
end

function var_0_0.hasNonLimitSkin(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.skins[arg_17_1]

	return var_17_0 ~= nil and not var_17_0:isExpireType()
end

function var_0_0.hasOldNonLimitSkin(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.skins[arg_18_1]

	return var_18_0 and not var_18_0:HasNewFlag() and not var_18_0:isExpireType()
end

function var_0_0.getSkinCountById(arg_19_0, arg_19_1)
	return arg_19_0:hasSkin(arg_19_1) and 1 or 0
end

function var_0_0.InForbiddenSkinListAndHide(arg_20_0, arg_20_1)
	return _.any(arg_20_0.forbiddenSkinList, function(arg_21_0)
		return arg_21_0.id == arg_20_1 and arg_21_0.type == var_0_0.FORBIDDEN_TYPE_HIDE
	end)
end

function var_0_0.InForbiddenSkinListAndShow(arg_22_0, arg_22_1)
	return _.any(arg_22_0.forbiddenSkinList, function(arg_23_0)
		return arg_23_0.id == arg_22_1 and arg_23_0.type == var_0_0.FORBIDDEN_TYPE_SHOW
	end)
end

function var_0_0.InForbiddenSkinList(arg_24_0, arg_24_1)
	return _.any(arg_24_0.forbiddenSkinList, function(arg_25_0)
		return arg_25_0.id == arg_24_1
	end)
end

function var_0_0.remove(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.timers) do
		iter_26_1:Stop()
	end

	arg_26_0.timers = nil
end

function var_0_0.GetAllSkins(arg_27_0)
	local var_27_0 = {}

	local function var_27_1(arg_28_0)
		local var_28_0 = arg_28_0:getSkinId()
		local var_28_1 = getProxy(ShipSkinProxy):getSkinById(var_28_0)
		local var_28_2 = var_28_1 and not var_28_1:isExpireType() and 1 or 0

		arg_28_0:updateBuyCount(var_28_2)
	end

	local function var_27_2(arg_29_0)
		local var_29_0 = Goods.Create({
			shop_id = arg_29_0
		}, Goods.TYPE_SKIN)

		var_27_1(var_29_0)

		local var_29_1 = pg.shop_template[arg_29_0].collaboration_skin_time
		local var_29_2 = var_29_1 == "" or var_29_1 == pg.shop_template[arg_29_0].time
		local var_29_3, var_29_4 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_29_0].time)

		if var_29_2 and var_29_3 then
			table.insert(var_27_0, var_29_0)
		end
	end

	for iter_27_0, iter_27_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_27_2(iter_27_1)
	end

	for iter_27_2, iter_27_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_27_2(iter_27_3)
	end

	local var_27_3 = getProxy(ActivityProxy)
	local var_27_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_27_4, iter_27_5 in ipairs(var_27_4) do
		local var_27_5 = pg.activity_shop_extra[iter_27_5]
		local var_27_6 = var_27_3:getActivityById(var_27_5.activity)

		if var_27_5.activity == 0 and pg.TimeMgr.GetInstance():inTime(var_27_5.time) or var_27_6 and not var_27_6:isEnd() then
			local var_27_7 = Goods.Create({
				shop_id = iter_27_5
			}, Goods.TYPE_ACTIVITY_EXTRA)

			var_27_1(var_27_7)
			table.insert(var_27_0, var_27_7)
		end
	end

	local var_27_8 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_27_6, iter_27_7 in ipairs(var_27_8) do
		local var_27_9 = pg.activity_shop_template[iter_27_7]
		local var_27_10 = var_27_3:getActivityById(var_27_9.activity)

		if var_27_10 and not var_27_10:isEnd() then
			local var_27_11 = Goods.Create({
				shop_id = iter_27_7
			}, Goods.TYPE_ACTIVITY)

			var_27_1(var_27_11)

			if not _.any(var_27_0, function(arg_30_0)
				return arg_30_0:getSkinId() == var_27_11:getSkinId()
			end) then
				table.insert(var_27_0, var_27_11)
			end
		end
	end

	for iter_27_8 = #var_27_0, 1, -1 do
		local var_27_12 = var_27_0[iter_27_8]:getSkinId()

		if arg_27_0:InForbiddenSkinList(var_27_12) or not arg_27_0:InShowTime(var_27_12) then
			table.remove(var_27_0, iter_27_8)
		end
	end

	return var_27_0
end

function var_0_0.GetShopShowingSkins(arg_31_0)
	local var_31_0 = {}

	local function var_31_1(arg_32_0)
		local var_32_0 = arg_32_0:getSkinId()
		local var_32_1 = getProxy(ShipSkinProxy):getSkinById(var_32_0)
		local var_32_2 = var_32_1 and not var_32_1:isExpireType() and 1 or 0

		arg_32_0:updateBuyCount(var_32_2)
	end

	local function var_31_2(arg_33_0)
		local var_33_0 = Goods.Create({
			shop_id = arg_33_0
		}, Goods.TYPE_SKIN)

		var_31_1(var_33_0)
		table.insert(var_31_0, var_33_0)
	end

	for iter_31_0, iter_31_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_31_2(iter_31_1)
	end

	for iter_31_2, iter_31_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_31_2(iter_31_3)
	end

	local var_31_3 = getProxy(ActivityProxy)
	local var_31_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_31_4, iter_31_5 in ipairs(var_31_4) do
		local var_31_5 = Goods.Create({
			shop_id = iter_31_5
		}, Goods.TYPE_ACTIVITY_EXTRA)

		var_31_1(var_31_5)
		table.insert(var_31_0, var_31_5)
	end

	local var_31_6 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_31_6, iter_31_7 in ipairs(var_31_6) do
		local var_31_7 = Goods.Create({
			shop_id = iter_31_7
		}, Goods.TYPE_ACTIVITY)

		var_31_1(var_31_7)

		if not _.any(var_31_0, function(arg_34_0)
			return arg_34_0:getSkinId() == var_31_7:getSkinId()
		end) then
			table.insert(var_31_0, var_31_7)
		end
	end

	return var_31_0
end

function var_0_0.GetAllSkinForShip(arg_35_0, arg_35_1)
	assert(isa(arg_35_1, Ship), "ship should be an instance of Ship")

	local var_35_0 = arg_35_1.groupId
	local var_35_1 = ShipGroup.getSkinList(var_35_0)

	for iter_35_0 = #var_35_1, 1, -1 do
		local var_35_2 = var_35_1[iter_35_0]

		if var_35_2.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_35_0:hasSkin(var_35_2.id) then
			table.remove(var_35_1, iter_35_0)
		elseif not arg_35_0:InShowTime(var_35_2.id) then
			table.remove(var_35_1, iter_35_0)
		end
	end

	if pg.ship_data_trans[var_35_0] and not arg_35_1:isRemoulded() then
		local var_35_3 = ShipGroup.GetGroupConfig(var_35_0).trans_skin

		for iter_35_1 = #var_35_1, 1, -1 do
			if var_35_1[iter_35_1].id == var_35_3 then
				table.remove(var_35_1, iter_35_1)

				break
			end
		end
	end

	for iter_35_2 = #var_35_1, 1, -1 do
		local var_35_4 = var_35_1[iter_35_2]

		if var_35_4.show_time and (type(var_35_4.show_time) == "string" and var_35_4.show_time == "stop" or type(var_35_4.show_time) == "table" and not pg.TimeMgr.GetInstance():inTime(var_35_4.show_time)) then
			table.remove(var_35_1, iter_35_2)
		end

		if var_35_4.no_showing == "1" then
			table.remove(var_35_1, iter_35_2)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_35_4.id].isHX == 1 then
			table.remove(var_35_1, iter_35_2)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		local var_35_5 = pg.gameset.big_seven_old_skin_timestamp.key_value

		for iter_35_3 = #var_35_1, 1, -1 do
			if var_35_1[iter_35_3].skin_type == ShipSkin.SKIN_TYPE_OLD and var_35_5 < arg_35_1.createTime then
				table.remove(var_35_1, iter_35_3)
			end
		end
	end

	if #arg_35_0.forbiddenSkinList > 0 then
		for iter_35_4 = #var_35_1, 1, -1 do
			local var_35_6 = var_35_1[iter_35_4].id

			if not arg_35_0:hasSkin(var_35_6) and arg_35_0:InForbiddenSkinListAndHide(var_35_6) then
				table.remove(var_35_1, iter_35_4)
			end
		end
	end

	for iter_35_5 = #var_35_1, 1, -1 do
		local var_35_7 = var_35_1[iter_35_5]
		local var_35_8 = ShipSkin.GetChangeSkinGroupId(var_35_7.id)

		if var_35_8 then
			local var_35_9 = ShipSkin.GetStoreChangeSkinId(var_35_8, arg_35_1:GetShipPhantomMark())

			if not var_35_9 then
				if var_35_7.change_skin.index ~= 1 then
					print("没有缓存的id ，" .. "移除了id" .. var_35_7.id)
					table.remove(var_35_1, iter_35_5)
				end
			elseif var_35_9 ~= var_35_7.id then
				print("有缓存的id = " .. var_35_9 .. "移除了id" .. var_35_7.id)
				table.remove(var_35_1, iter_35_5)
			end
		end
	end

	return var_35_1
end

function var_0_0.GetShareSkinsForShipGroup(arg_36_0, arg_36_1)
	local var_36_0 = pg.ship_data_group.get_id_list_by_group_type[arg_36_1][1]
	local var_36_1 = pg.ship_data_group[var_36_0]

	if not var_36_1.share_group_id or #var_36_1.share_group_id <= 0 then
		return {}
	end

	local var_36_2 = {}

	for iter_36_0, iter_36_1 in ipairs(var_36_1.share_group_id) do
		local var_36_3 = pg.ship_skin_template.get_id_list_by_ship_group[iter_36_1]

		for iter_36_2, iter_36_3 in ipairs(var_36_3) do
			local var_36_4 = ShipSkin.New({
				id = iter_36_3
			})

			if var_36_4:CanShare() then
				table.insert(var_36_2, var_36_4)
			end
		end
	end

	return var_36_2
end

function var_0_0.GetShareSkinsForShip(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1.groupId

	return arg_37_0:GetShareSkinsForShipGroup(var_37_0)
end

function var_0_0.GetAllSkinForARCamera(arg_38_0, arg_38_1)
	local var_38_0 = ShipGroup.getSkinList(arg_38_1)

	for iter_38_0 = #var_38_0, 1, -1 do
		if var_38_0[iter_38_0].skin_type == ShipSkin.SKIN_TYPE_OLD then
			table.remove(var_38_0, iter_38_0)
		end
	end

	local var_38_1 = ShipGroup.GetGroupConfig(arg_38_1).trans_skin

	if var_38_1 ~= 0 then
		local var_38_2 = false
		local var_38_3 = getProxy(CollectionProxy):getShipGroup(arg_38_1)

		if var_38_3 then
			for iter_38_1, iter_38_2 in ipairs(var_38_0) do
				if iter_38_2.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_38_3.trans then
					var_38_2 = true

					break
				end
			end
		end

		if not var_38_2 then
			for iter_38_3 = #var_38_0, 1, -1 do
				if var_38_0[iter_38_3].id == var_38_1 then
					table.remove(var_38_0, iter_38_3)

					break
				end
			end
		end
	end

	for iter_38_4 = #var_38_0, 1, -1 do
		local var_38_4 = var_38_0[iter_38_4]

		if var_38_4.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_38_0:hasSkin(var_38_4.id) then
			table.remove(var_38_0, iter_38_4)
		elseif var_38_4.no_showing == "1" then
			table.remove(var_38_0, iter_38_4)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_38_4.id].isHX == 1 then
			table.remove(var_38_0, iter_38_4)
		elseif not arg_38_0:InShowTime(var_38_4.id) then
			table.remove(var_38_0, iter_38_4)
		end
	end

	if #arg_38_0.forbiddenSkinList > 0 then
		for iter_38_5 = #var_38_0, 1, -1 do
			local var_38_5 = var_38_0[iter_38_5].id

			if not arg_38_0:hasSkin(var_38_5) and arg_38_0:InForbiddenSkinListAndHide(var_38_5) then
				table.remove(var_38_0, iter_38_5)
			end
		end
	end

	for iter_38_6 = #var_38_0, 1, -1 do
		local var_38_6 = var_38_0[iter_38_6]

		if var_38_6 and var_38_6.change_skin and var_38_6.change_skin.index and var_38_6.change_skin.index ~= 1 then
			table.remove(var_38_0, iter_38_6)
		end
	end

	return var_38_0
end

function var_0_0.InShowTime(arg_39_0, arg_39_1)
	local var_39_0 = pg.ship_skin_template_column_time[arg_39_1]

	if var_39_0 and var_39_0.time ~= "" and type(var_39_0.time) == "table" and #var_39_0.time > 0 then
		return pg.TimeMgr.GetInstance():passTime(var_39_0.time)
	end

	return true
end

function var_0_0.HasFashion(arg_40_0, arg_40_1)
	if #arg_40_0:GetShareSkinsForShip(arg_40_1) > 0 then
		return true
	end

	local var_40_0 = arg_40_0:GetAllSkinForShip(arg_40_1)

	if #var_40_0 == 1 then
		local var_40_1 = var_40_0[1]

		return (checkABExist("painting/" .. var_40_1.painting .. "_n"))
	end

	return #var_40_0 > 1
end

function var_0_0.GetEncoreSkins(arg_41_0)
	local var_41_0 = {}
	local var_41_1 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_BUFF)

	local function var_41_2(arg_42_0)
		local var_42_0 = arg_42_0:getConfig("config_client")

		if var_42_0 and var_42_0[1] and type(var_42_0[1]) == "table" then
			return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_42_0[1]) <= pg.TimeMgr.GetInstance():GetServerTime()
		else
			return arg_42_0:isEnd()
		end
	end

	for iter_41_0, iter_41_1 in ipairs(var_41_1) do
		if iter_41_1:getDataConfig("type") == 5 and not var_41_2(iter_41_1) then
			for iter_41_2, iter_41_3 in ipairs(iter_41_1:getConfig("config_data")) do
				table.insert(var_41_0, iter_41_3)
			end
		end
	end

	local var_41_3 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING)

	for iter_41_4, iter_41_5 in ipairs(var_41_3) do
		if iter_41_5 and not iter_41_5:isEnd() then
			for iter_41_6, iter_41_7 in ipairs(iter_41_5:getConfig("config_data")[2]) do
				if not table.contains(var_41_0, iter_41_7) then
					table.insert(var_41_0, iter_41_7)
				end
			end
		end
	end

	return var_41_0
end

function var_0_0.GetOwnSkins(arg_43_0)
	local var_43_0 = {}
	local var_43_1 = arg_43_0:getRawData()

	for iter_43_0, iter_43_1 in pairs(var_43_1) do
		table.insert(var_43_0, iter_43_1)
	end

	local var_43_2 = getProxy(CollectionProxy).shipGroups

	for iter_43_2, iter_43_3 in pairs(var_43_2) do
		if iter_43_3.married == 1 then
			local var_43_3 = ShipGroup.getProposeSkin(iter_43_3.id)

			if var_43_3 then
				table.insert(var_43_0, ShipSkin.New({
					id = var_43_3.id
				}))
			end
		end

		if iter_43_3.trans then
			local var_43_4 = pg.ship_data_trans[iter_43_3.id].skin_id

			table.insert(var_43_0, ShipSkin.New({
				id = var_43_4
			}))
		end
	end

	return var_43_0
end

function var_0_0.GetOwnAndShareSkins(arg_44_0)
	local var_44_0 = arg_44_0:GetOwnSkins()
	local var_44_1 = {}

	for iter_44_0, iter_44_1 in ipairs(var_44_0) do
		var_44_1[iter_44_1.id] = iter_44_1
	end

	local var_44_2 = getProxy(CollectionProxy).shipGroups

	for iter_44_2, iter_44_3 in pairs(var_44_2) do
		if iter_44_3.married == 1 then
			local var_44_3 = arg_44_0:GetShareSkinsForShipGroup(iter_44_3.id)

			for iter_44_4, iter_44_5 in ipairs(var_44_3) do
				if not var_44_1[iter_44_5.id] then
					table.insert(var_44_0, iter_44_5)
				end
			end
		end
	end

	return var_44_0
end

function var_0_0.GetProbabilitySkins(arg_45_0, arg_45_1)
	local var_45_0 = {}

	local function var_45_1(arg_46_0)
		local var_46_0 = arg_46_0:getSkinId()
		local var_46_1 = getProxy(ShipSkinProxy):getSkinById(var_46_0)
		local var_46_2 = var_46_1 and not var_46_1:isExpireType() and 1 or 0

		arg_46_0:updateBuyCount(var_46_2)
	end

	local function var_45_2(arg_47_0)
		local var_47_0 = Goods.Create({
			shop_id = arg_47_0
		}, Goods.TYPE_SKIN)

		var_45_1(var_47_0)

		local var_47_1, var_47_2 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_47_0].time)

		if var_47_1 then
			table.insert(var_45_0, var_47_0)
		end
	end

	local var_45_3 = getProxy(ShipSkinProxy):GetAllSkins()
	local var_45_4 = {}

	for iter_45_0, iter_45_1 in ipairs(var_45_3) do
		if iter_45_1:getConfig("genre") ~= ShopArgs.SkinShopTimeLimit then
			var_45_4[iter_45_1:getSkinId()] = iter_45_1.id
		end
	end

	for iter_45_2, iter_45_3 in ipairs(arg_45_1) do
		local var_45_5 = var_45_4[iter_45_3[1]]

		if var_45_5 then
			var_45_2(var_45_5)
		end
	end

	return var_45_0
end

function var_0_0.GetSkinProbabilitys(arg_48_0, arg_48_1)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_1) do
		var_48_0[iter_48_1[1]] = iter_48_1[2]
	end

	return var_48_0
end

function var_0_0.GetInTimeSkins(arg_49_0)
	local var_49_0 = arg_49_0:GetAllSkins()

	for iter_49_0 = #var_49_0, 1, -1 do
		local var_49_1 = var_49_0[iter_49_0]

		if var_49_1.type == Goods.TYPE_SKIN then
			if var_49_1:getConfig("time") == "always" then
				table.remove(var_49_0, iter_49_0)
			end
		elseif var_49_1.type == Goods.TYPE_ACTIVITY_EXTRA and pg.activity_shop_extra[var_49_1.id].shop_tag ~= 1 then
			table.remove(var_49_0, iter_49_0)
		end
	end

	return var_49_0
end

function var_0_0.GetPermanentSkins(arg_50_0)
	local var_50_0 = arg_50_0:GetAllSkins()

	for iter_50_0 = #var_50_0, 1, -1 do
		local var_50_1 = var_50_0[iter_50_0]

		if var_50_1.type == Goods.TYPE_SKIN then
			if var_50_1:getConfig("time") ~= "always" then
				table.remove(var_50_0, iter_50_0)
			end
		elseif var_50_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			if pg.activity_shop_extra[var_50_1.id].shop_tag ~= 2 then
				table.remove(var_50_0, iter_50_0)
			end
		elseif var_50_1.type == Goods.TYPE_ACTIVITY then
			table.remove(var_50_0, iter_50_0)
		end
	end

	return var_50_0
end

return var_0_0

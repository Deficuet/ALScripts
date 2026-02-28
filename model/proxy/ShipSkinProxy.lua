local var_0_0 = class("ShipSkinProxy", import(".NetProxy"))

var_0_0.SHIP_SKINS_UPDATE = "ship skins update"
var_0_0.SHIP_SKIN_EXPIRED = "ship skin expired"
var_0_0.FORBIDDEN_TYPE_HIDE = 0
var_0_0.FORBIDDEN_TYPE_SHOW = 1
var_0_0.FORBIDDEN_OVERWRITE_TYPE_TIME = 1
var_0_0.FORBIDDEN_OVERWRITE_TYPE_STOP = 2

function var_0_0.timeCall(arg_1_0)
	return {
		[ProxyRegister.SecondCall] = function(arg_2_0)
			local var_2_0 = pg.TimeMgr.GetInstance():GetServerTime()

			for iter_2_0, iter_2_1 in ipairs(arg_1_0.forbiddenSkinOverwriteList) do
				arg_1_0:CheckConfigOverwrite(var_2_0, iter_2_0, iter_2_1)
			end
		end
	}
end

function var_0_0.register(arg_3_0)
	arg_3_0.skins = {}
	arg_3_0.changeSkinGroupDic = {}
	arg_3_0.cacheSkins = {}
	arg_3_0.timers = {}
	arg_3_0.forbiddenSkinList = {}
	arg_3_0.forbiddenSkinOverwriteList = {}
	arg_3_0.overwriteFlag = {}

	arg_3_0:on(12201, function(arg_4_0)
		_.each(arg_4_0.skin_list, function(arg_5_0)
			local var_5_0 = ShipSkin.New(arg_5_0)

			arg_3_0:addSkin(ShipSkin.New(arg_5_0))
		end)

		arg_3_0.forbiddenSkinList = {}

		_.each(arg_4_0.forbidden_skin_list, function(arg_6_0)
			table.insert(arg_3_0.forbiddenSkinList, {
				id = arg_6_0,
				type = var_0_0.FORBIDDEN_TYPE_HIDE
			})
		end)

		for iter_4_0, iter_4_1 in ipairs(arg_4_0.forbidden_skin_type) do
			arg_3_0.forbiddenSkinList[iter_4_0].type = iter_4_1
		end

		for iter_4_2, iter_4_3 in ipairs(arg_3_0.forbiddenSkinOverwriteList) do
			arg_3_0:RemoveConfigOverwrite(iter_4_2)
		end

		arg_3_0.forbiddenSkinOverwriteList = {}

		local var_4_0 = pg.TimeMgr.GetInstance():GetServerTime()

		for iter_4_4, iter_4_5 in ipairs(arg_4_0.forbidden_list) do
			local var_4_1 = pg.shop_template[iter_4_5.id]

			if not var_4_1 then
				warning("without config in shop_template:" .. iter_4_5.id)
			elseif var_4_1.genre ~= "skin_shop" then
				warning("config genre error in shop_template:" .. iter_4_5.id)
			else
				warning(iter_4_5.id, iter_4_5.type, pg.TimeMgr.GetInstance():STimeDescS(iter_4_5.start_time), pg.TimeMgr.GetInstance():STimeDescS(iter_4_5.stop_time))

				arg_3_0.forbiddenSkinOverwriteList[iter_4_5.id] = {
					type = iter_4_5.type,
					range = {
						iter_4_5.start_time,
						iter_4_5.stop_time
					}
				}

				arg_3_0:CheckConfigOverwrite(var_4_0, iter_4_5.id, arg_3_0.forbiddenSkinOverwriteList[iter_4_5.id])
			end
		end
	end)
end

function var_0_0.CheckConfigOverwrite(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_1 == math.clamp(arg_7_1, unpack(arg_7_3.range))

	if var_7_0 ~= tobool(arg_7_0.overwriteFlag[arg_7_2]) then
		if var_7_0 then
			arg_7_0:AddConfigOverwrite(arg_7_2, arg_7_3)
		else
			arg_7_0:RemoveConfigOverwrite(arg_7_2)
		end
	end
end

function var_0_0.AddConfigOverwrite(arg_8_0, arg_8_1, arg_8_2)
	if not arg_8_0.overwriteFlag[arg_8_1] then
		arg_8_0.overwriteFlag[arg_8_1] = true
		pg.shop_template[arg_8_1].time = switch(arg_8_2.type, {
			[var_0_0.FORBIDDEN_OVERWRITE_TYPE_TIME] = function()
				local var_9_0 = {}

				for iter_9_0, iter_9_1 in ipairs(arg_8_2.range) do
					local var_9_1 = underscore.map(string.split(pg.TimeMgr.GetInstance():STimeDescS(iter_9_1, "%Y/%m/%d/%H/%M/%S"), "/"), function(arg_10_0)
						return tonumber(arg_10_0)
					end)

					var_9_0[iter_9_0] = {
						underscore.first(var_9_1, 3),
						underscore.rest(var_9_1, 4)
					}
				end

				return var_9_0
			end,
			[var_0_0.FORBIDDEN_OVERWRITE_TYPE_STOP] = function()
				return "stop"
			end
		})
	end
end

function var_0_0.RemoveConfigOverwrite(arg_12_0, arg_12_1)
	if arg_12_0.overwriteFlag[arg_12_1] then
		arg_12_0.overwriteFlag[arg_12_1] = nil
		pg.shop_template[arg_12_1].time = nil
	end
end

function var_0_0.getOverDueSkins(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.cacheSkins) do
		table.insert(var_13_0, iter_13_1)
	end

	arg_13_0.cacheSkins = {}

	return var_13_0
end

function var_0_0.getRawData(arg_14_0)
	return arg_14_0.skins
end

function var_0_0.getSkinList(arg_15_0)
	return _.map(_.values(arg_15_0.skins), function(arg_16_0)
		return arg_16_0.id
	end)
end

function var_0_0.addSkin(arg_17_0, arg_17_1)
	assert(isa(arg_17_1, ShipSkin), "skin should be an instance of ShipSkin")

	arg_17_0.skins[arg_17_1.id] = arg_17_1

	if ShipSkin.IsChangeSkin(arg_17_1.id) then
		arg_17_0.changeSkinGroupDic[ShipSkin.GetChangeSkinGroupId(arg_17_1.id)] = true
	end

	arg_17_0:addExpireTimer(arg_17_1)

	if arg_17_1:getConfig("skin_type") == ShipSkin.SKIN_TYPE_TB then
		NewEducateHelper.UpdateUnlockBySkinId(arg_17_1.id)
	end

	arg_17_0.facade:sendNotification(var_0_0.SHIP_SKINS_UPDATE)
end

function var_0_0.getSkinById(arg_18_0, arg_18_1)
	return arg_18_0.skins[arg_18_1]
end

function var_0_0.addExpireTimer(arg_19_0, arg_19_1)
	arg_19_0:removeExpireTimer(arg_19_1.id)

	if not arg_19_1:isExpireType() then
		return
	end

	local function var_19_0()
		table.insert(arg_19_0.cacheSkins, arg_19_1)
		arg_19_0:removeSkinById(arg_19_1.id)

		local var_20_0 = getProxy(BayProxy)
		local var_20_1 = {}

		underscore.each(var_20_0:CanUseShareSkinPhantoms(arg_19_1.id), function(arg_21_0)
			if arg_21_0:getSkinId() == arg_19_1.id then
				var_20_0:updateShipSkin(arg_21_0.id, arg_21_0.phantomId, arg_21_0:getConfig("skin_id"))
			end
		end)
		arg_19_0:sendNotification(GAME.SHIP_SKIN_EXPIRED)
	end

	local var_19_1 = arg_19_1:getExpireTime() - pg.TimeMgr.GetInstance():GetServerTime()

	if var_19_1 <= 0 then
		var_19_0()
	else
		arg_19_0.timers[arg_19_1.id] = Timer.New(var_19_0, var_19_1, 1)

		arg_19_0.timers[arg_19_1.id]:Start()
	end
end

function var_0_0.removeExpireTimer(arg_22_0, arg_22_1)
	if arg_22_0.timers[arg_22_1] then
		arg_22_0.timers[arg_22_1]:Stop()

		arg_22_0.timers[arg_22_1] = nil
	end
end

function var_0_0.removeSkinById(arg_23_0, arg_23_1)
	arg_23_0.skins[arg_23_1] = nil

	arg_23_0:removeExpireTimer(arg_23_1)
	arg_23_0.facade:sendNotification(var_0_0.SHIP_SKINS_UPDATE)
end

function var_0_0.hasSkin(arg_24_0, arg_24_1)
	if ShipSkin.IsChangeSkin(arg_24_1) then
		local var_24_0 = ShipSkin.GetChangeSkinGroupId(arg_24_1)

		return arg_24_0.changeSkinGroupDic[var_24_0]
	end

	return arg_24_0.skins[arg_24_1] ~= nil
end

function var_0_0.hasNonLimitSkin(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.skins[arg_25_1]

	return var_25_0 ~= nil and not var_25_0:isExpireType()
end

function var_0_0.getSkinCountById(arg_26_0, arg_26_1)
	return arg_26_0:hasSkin(arg_26_1) and 1 or 0
end

function var_0_0.InForbiddenSkinListAndHide(arg_27_0, arg_27_1)
	return _.any(arg_27_0.forbiddenSkinList, function(arg_28_0)
		return arg_28_0.id == arg_27_1 and arg_28_0.type == var_0_0.FORBIDDEN_TYPE_HIDE
	end)
end

function var_0_0.InForbiddenSkinListAndShow(arg_29_0, arg_29_1)
	return _.any(arg_29_0.forbiddenSkinList, function(arg_30_0)
		return arg_30_0.id == arg_29_1 and arg_30_0.type == var_0_0.FORBIDDEN_TYPE_SHOW
	end)
end

function var_0_0.InForbiddenSkinList(arg_31_0, arg_31_1)
	return _.any(arg_31_0.forbiddenSkinList, function(arg_32_0)
		return arg_32_0.id == arg_31_1
	end)
end

function var_0_0.remove(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.timers) do
		iter_33_1:Stop()
	end

	arg_33_0.timers = nil
end

function var_0_0.GetAllSkins(arg_34_0)
	local var_34_0 = {}

	local function var_34_1(arg_35_0)
		local var_35_0 = arg_35_0:getSkinId()
		local var_35_1 = getProxy(ShipSkinProxy):getSkinById(var_35_0)
		local var_35_2 = var_35_1 and not var_35_1:isExpireType() and 1 or 0

		arg_35_0:updateBuyCount(var_35_2)
	end

	local function var_34_2(arg_36_0)
		local var_36_0 = Goods.Create({
			shop_id = arg_36_0
		}, Goods.TYPE_SKIN)

		var_34_1(var_36_0)

		local var_36_1 = pg.shop_template[arg_36_0].collaboration_skin_time
		local var_36_2 = var_36_1 == "" or var_36_1 == pg.shop_template[arg_36_0].time
		local var_36_3, var_36_4 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_36_0].time)

		if var_36_2 and var_36_3 then
			table.insert(var_34_0, var_36_0)
		end
	end

	for iter_34_0, iter_34_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_34_2(iter_34_1)
	end

	for iter_34_2, iter_34_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_34_2(iter_34_3)
	end

	local var_34_3 = getProxy(ActivityProxy)
	local var_34_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_34_4, iter_34_5 in ipairs(var_34_4) do
		local var_34_5 = pg.activity_shop_extra[iter_34_5]
		local var_34_6 = var_34_3:getActivityById(var_34_5.activity)

		if var_34_5.activity == 0 and pg.TimeMgr.GetInstance():inTime(var_34_5.time) or var_34_6 and not var_34_6:isEnd() then
			local var_34_7 = Goods.Create({
				shop_id = iter_34_5
			}, Goods.TYPE_ACTIVITY_EXTRA)

			var_34_1(var_34_7)
			table.insert(var_34_0, var_34_7)
		end
	end

	local var_34_8 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_34_6, iter_34_7 in ipairs(var_34_8) do
		local var_34_9 = pg.activity_shop_template[iter_34_7]
		local var_34_10 = var_34_3:getActivityById(var_34_9.activity)

		if var_34_10 and not var_34_10:isEnd() then
			local var_34_11 = Goods.Create({
				shop_id = iter_34_7
			}, Goods.TYPE_ACTIVITY)

			var_34_1(var_34_11)

			if not _.any(var_34_0, function(arg_37_0)
				return arg_37_0:getSkinId() == var_34_11:getSkinId()
			end) then
				table.insert(var_34_0, var_34_11)
			end
		end
	end

	for iter_34_8 = #var_34_0, 1, -1 do
		local var_34_12 = var_34_0[iter_34_8]:getSkinId()

		if arg_34_0:InForbiddenSkinList(var_34_12) or not arg_34_0:InShowTime(var_34_12) then
			table.remove(var_34_0, iter_34_8)
		end
	end

	return var_34_0
end

function var_0_0.GetShopShowingSkins(arg_38_0)
	local var_38_0 = {}

	local function var_38_1(arg_39_0)
		local var_39_0 = arg_39_0:getSkinId()
		local var_39_1 = getProxy(ShipSkinProxy):getSkinById(var_39_0)
		local var_39_2 = var_39_1 and not var_39_1:isExpireType() and 1 or 0

		arg_39_0:updateBuyCount(var_39_2)
	end

	local function var_38_2(arg_40_0)
		local var_40_0 = Goods.Create({
			shop_id = arg_40_0
		}, Goods.TYPE_SKIN)

		var_38_1(var_40_0)
		table.insert(var_38_0, var_40_0)
	end

	for iter_38_0, iter_38_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_38_2(iter_38_1)
	end

	for iter_38_2, iter_38_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_38_2(iter_38_3)
	end

	local var_38_3 = getProxy(ActivityProxy)
	local var_38_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_38_4, iter_38_5 in ipairs(var_38_4) do
		local var_38_5 = Goods.Create({
			shop_id = iter_38_5
		}, Goods.TYPE_ACTIVITY_EXTRA)

		var_38_1(var_38_5)
		table.insert(var_38_0, var_38_5)
	end

	local var_38_6 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_38_6, iter_38_7 in ipairs(var_38_6) do
		local var_38_7 = Goods.Create({
			shop_id = iter_38_7
		}, Goods.TYPE_ACTIVITY)

		var_38_1(var_38_7)

		if not _.any(var_38_0, function(arg_41_0)
			return arg_41_0:getSkinId() == var_38_7:getSkinId()
		end) then
			table.insert(var_38_0, var_38_7)
		end
	end

	return var_38_0
end

function var_0_0.GetAllSkinForShip(arg_42_0, arg_42_1)
	assert(isa(arg_42_1, Ship), "ship should be an instance of Ship")

	local var_42_0 = arg_42_1.groupId
	local var_42_1 = ShipGroup.getSkinList(var_42_0)

	for iter_42_0 = #var_42_1, 1, -1 do
		local var_42_2 = var_42_1[iter_42_0]

		if var_42_2.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_42_0:hasSkin(var_42_2.id) then
			table.remove(var_42_1, iter_42_0)
		elseif not arg_42_0:InShowTime(var_42_2.id) then
			table.remove(var_42_1, iter_42_0)
		end
	end

	if pg.ship_data_trans[var_42_0] and not arg_42_1:isRemoulded() then
		local var_42_3 = ShipGroup.GetGroupConfig(var_42_0).trans_skin

		for iter_42_1 = #var_42_1, 1, -1 do
			if var_42_1[iter_42_1].id == var_42_3 then
				table.remove(var_42_1, iter_42_1)

				break
			end
		end
	end

	for iter_42_2 = #var_42_1, 1, -1 do
		local var_42_4 = var_42_1[iter_42_2]

		if var_42_4.show_time and (type(var_42_4.show_time) == "string" and var_42_4.show_time == "stop" or type(var_42_4.show_time) == "table" and not pg.TimeMgr.GetInstance():inTime(var_42_4.show_time)) then
			table.remove(var_42_1, iter_42_2)
		end

		if var_42_4.no_showing == "1" then
			table.remove(var_42_1, iter_42_2)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_42_4.id].isHX == 1 then
			table.remove(var_42_1, iter_42_2)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		local var_42_5 = pg.gameset.big_seven_old_skin_timestamp.key_value

		for iter_42_3 = #var_42_1, 1, -1 do
			if var_42_1[iter_42_3].skin_type == ShipSkin.SKIN_TYPE_OLD and var_42_5 < arg_42_1.createTime then
				table.remove(var_42_1, iter_42_3)
			end
		end
	end

	if #arg_42_0.forbiddenSkinList > 0 then
		for iter_42_4 = #var_42_1, 1, -1 do
			local var_42_6 = var_42_1[iter_42_4].id

			if not arg_42_0:hasSkin(var_42_6) and arg_42_0:InForbiddenSkinListAndHide(var_42_6) then
				table.remove(var_42_1, iter_42_4)
			end
		end
	end

	for iter_42_5 = #var_42_1, 1, -1 do
		local var_42_7 = var_42_1[iter_42_5]
		local var_42_8 = ShipSkin.GetChangeSkinGroupId(var_42_7.id)

		if var_42_8 then
			local var_42_9 = ShipSkin.GetStoreChangeSkinId(var_42_8, arg_42_1:GetShipPhantomMark())

			if not var_42_9 then
				if var_42_7.change_skin.index ~= 1 then
					print("没有缓存的id ，" .. "移除了id" .. var_42_7.id)
					table.remove(var_42_1, iter_42_5)
				end
			elseif var_42_9 ~= var_42_7.id then
				print("有缓存的id = " .. var_42_9 .. "移除了id" .. var_42_7.id)
				table.remove(var_42_1, iter_42_5)
			end
		end
	end

	return var_42_1
end

function var_0_0.GetShareSkinsForShipGroup(arg_43_0, arg_43_1)
	local var_43_0 = pg.ship_data_group.get_id_list_by_group_type[arg_43_1][1]
	local var_43_1 = pg.ship_data_group[var_43_0]

	if not var_43_1.share_group_id or #var_43_1.share_group_id <= 0 then
		return {}
	end

	local var_43_2 = {}

	for iter_43_0, iter_43_1 in ipairs(var_43_1.share_group_id) do
		local var_43_3 = pg.ship_skin_template.get_id_list_by_ship_group[iter_43_1]

		for iter_43_2, iter_43_3 in ipairs(var_43_3) do
			local var_43_4 = ShipSkin.New({
				id = iter_43_3
			})

			if var_43_4:CanShare() then
				table.insert(var_43_2, var_43_4)
			end
		end
	end

	return var_43_2
end

function var_0_0.GetShareSkinsForShip(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1.groupId
	local var_44_1 = arg_44_0:GetShareSkinsForShipGroup(var_44_0)

	for iter_44_0 = #var_44_1, 1, -1 do
		local var_44_2 = var_44_1[iter_44_0]
		local var_44_3 = ShipSkin.GetChangeSkinGroupId(var_44_2.id)

		if var_44_3 then
			local var_44_4 = ShipSkin.GetStoreChangeSkinId(var_44_3, arg_44_1:GetShipPhantomMark())
			local var_44_5 = var_44_2:getConfig("change_skin")

			if not var_44_4 then
				if var_44_5 and var_44_5 ~= "" and var_44_5.index ~= 1 then
					table.remove(var_44_1, iter_44_0)
				end
			elseif not arg_44_0:hasSkin(var_44_2.id) then
				if var_44_5 and var_44_5 ~= "" and var_44_5.index ~= 1 then
					table.remove(var_44_1, iter_44_0)
				end
			elseif var_44_4 ~= var_44_2.id then
				table.remove(var_44_1, iter_44_0)
			end
		end
	end

	return var_44_1
end

function var_0_0.GetAllSkinForARCamera(arg_45_0, arg_45_1)
	local var_45_0 = ShipGroup.getSkinList(arg_45_1)

	for iter_45_0 = #var_45_0, 1, -1 do
		if var_45_0[iter_45_0].skin_type == ShipSkin.SKIN_TYPE_OLD then
			table.remove(var_45_0, iter_45_0)
		end
	end

	local var_45_1 = ShipGroup.GetGroupConfig(arg_45_1).trans_skin

	if var_45_1 ~= 0 then
		local var_45_2 = false
		local var_45_3 = getProxy(CollectionProxy):getShipGroup(arg_45_1)

		if var_45_3 then
			for iter_45_1, iter_45_2 in ipairs(var_45_0) do
				if iter_45_2.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_45_3.trans then
					var_45_2 = true

					break
				end
			end
		end

		if not var_45_2 then
			for iter_45_3 = #var_45_0, 1, -1 do
				if var_45_0[iter_45_3].id == var_45_1 then
					table.remove(var_45_0, iter_45_3)

					break
				end
			end
		end
	end

	for iter_45_4 = #var_45_0, 1, -1 do
		local var_45_4 = var_45_0[iter_45_4]

		if var_45_4.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_45_0:hasSkin(var_45_4.id) then
			table.remove(var_45_0, iter_45_4)
		elseif var_45_4.no_showing == "1" then
			table.remove(var_45_0, iter_45_4)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_45_4.id].isHX == 1 then
			table.remove(var_45_0, iter_45_4)
		elseif not arg_45_0:InShowTime(var_45_4.id) then
			table.remove(var_45_0, iter_45_4)
		end
	end

	if #arg_45_0.forbiddenSkinList > 0 then
		for iter_45_5 = #var_45_0, 1, -1 do
			local var_45_5 = var_45_0[iter_45_5].id

			if not arg_45_0:hasSkin(var_45_5) and arg_45_0:InForbiddenSkinListAndHide(var_45_5) then
				table.remove(var_45_0, iter_45_5)
			end
		end
	end

	for iter_45_6 = #var_45_0, 1, -1 do
		local var_45_6 = var_45_0[iter_45_6]

		if var_45_6 and var_45_6.change_skin and var_45_6.change_skin.index and var_45_6.change_skin.index ~= 1 then
			table.remove(var_45_0, iter_45_6)
		end
	end

	return var_45_0
end

function var_0_0.InShowTime(arg_46_0, arg_46_1)
	local var_46_0 = pg.ship_skin_template_column_time[arg_46_1]

	if var_46_0 and var_46_0.time ~= "" and type(var_46_0.time) == "table" and #var_46_0.time > 0 then
		return pg.TimeMgr.GetInstance():passTime(var_46_0.time)
	end

	return true
end

function var_0_0.HasFashion(arg_47_0, arg_47_1)
	if #arg_47_0:GetShareSkinsForShip(arg_47_1) > 0 then
		return true
	end

	local var_47_0 = arg_47_0:GetAllSkinForShip(arg_47_1)

	if #var_47_0 == 1 then
		local var_47_1 = var_47_0[1]

		return (checkABExist("painting/" .. var_47_1.painting .. "_n"))
	end

	return #var_47_0 > 1
end

function var_0_0.GetEncoreSkins(arg_48_0)
	local var_48_0 = {}
	local var_48_1 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_BUFF)

	local function var_48_2(arg_49_0)
		local var_49_0 = arg_49_0:getConfig("config_client")

		if var_49_0 and var_49_0[1] and type(var_49_0[1]) == "table" then
			return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_49_0[1]) <= pg.TimeMgr.GetInstance():GetServerTime()
		else
			return arg_49_0:isEnd()
		end
	end

	for iter_48_0, iter_48_1 in ipairs(var_48_1) do
		if iter_48_1:getDataConfig("type") == 5 and not var_48_2(iter_48_1) then
			for iter_48_2, iter_48_3 in ipairs(iter_48_1:getConfig("config_data")) do
				table.insert(var_48_0, iter_48_3)
			end
		end
	end

	local var_48_3 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING)

	for iter_48_4, iter_48_5 in ipairs(var_48_3) do
		if iter_48_5 and not iter_48_5:isEnd() then
			for iter_48_6, iter_48_7 in ipairs(iter_48_5:getConfig("config_data")[2]) do
				if not table.contains(var_48_0, iter_48_7) then
					table.insert(var_48_0, iter_48_7)
				end
			end
		end
	end

	return var_48_0
end

function var_0_0.GetOwnSkins(arg_50_0)
	local var_50_0 = {}
	local var_50_1 = arg_50_0:getRawData()

	for iter_50_0, iter_50_1 in pairs(var_50_1) do
		table.insert(var_50_0, iter_50_1)
	end

	local var_50_2 = getProxy(CollectionProxy).shipGroups

	for iter_50_2, iter_50_3 in pairs(var_50_2) do
		if iter_50_3.married == 1 then
			local var_50_3 = ShipGroup.getProposeSkin(iter_50_3.id)

			if var_50_3 then
				table.insert(var_50_0, ShipSkin.New({
					id = var_50_3.id
				}))
			end
		end

		if iter_50_3.trans then
			local var_50_4 = pg.ship_data_trans[iter_50_3.id].skin_id

			table.insert(var_50_0, ShipSkin.New({
				id = var_50_4
			}))
		end
	end

	return var_50_0
end

function var_0_0.GetOwnAndShareSkins(arg_51_0)
	local var_51_0 = arg_51_0:GetOwnSkins()
	local var_51_1 = {}

	for iter_51_0, iter_51_1 in ipairs(var_51_0) do
		var_51_1[iter_51_1.id] = iter_51_1
	end

	local var_51_2 = getProxy(CollectionProxy).shipGroups

	for iter_51_2, iter_51_3 in pairs(var_51_2) do
		if iter_51_3.married == 1 then
			local var_51_3 = arg_51_0:GetShareSkinsForShipGroup(iter_51_3.id)

			for iter_51_4, iter_51_5 in ipairs(var_51_3) do
				if not var_51_1[iter_51_5.id] then
					table.insert(var_51_0, iter_51_5)
				end
			end
		end
	end

	return var_51_0
end

function var_0_0.GetProbabilitySkins(arg_52_0, arg_52_1)
	local var_52_0 = {}

	local function var_52_1(arg_53_0)
		local var_53_0 = arg_53_0:getSkinId()
		local var_53_1 = getProxy(ShipSkinProxy):getSkinById(var_53_0)
		local var_53_2 = var_53_1 and not var_53_1:isExpireType() and 1 or 0

		arg_53_0:updateBuyCount(var_53_2)
	end

	local function var_52_2(arg_54_0)
		local var_54_0 = Goods.Create({
			shop_id = arg_54_0
		}, Goods.TYPE_SKIN)

		var_52_1(var_54_0)

		local var_54_1, var_54_2 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_54_0].time)

		if var_54_1 then
			table.insert(var_52_0, var_54_0)
		end
	end

	local var_52_3 = getProxy(ShipSkinProxy):GetAllSkins()
	local var_52_4 = {}

	for iter_52_0, iter_52_1 in ipairs(var_52_3) do
		if iter_52_1:getConfig("genre") ~= ShopArgs.SkinShopTimeLimit then
			var_52_4[iter_52_1:getSkinId()] = iter_52_1.id
		end
	end

	for iter_52_2, iter_52_3 in ipairs(arg_52_1) do
		local var_52_5 = var_52_4[iter_52_3[1]]

		if var_52_5 then
			var_52_2(var_52_5)
		end
	end

	return var_52_0
end

function var_0_0.GetSkinProbabilitys(arg_55_0, arg_55_1)
	local var_55_0 = {}

	for iter_55_0, iter_55_1 in ipairs(arg_55_1) do
		var_55_0[iter_55_1[1]] = iter_55_1[2]
	end

	return var_55_0
end

function var_0_0.GetInTimeSkins(arg_56_0)
	local var_56_0 = arg_56_0:GetAllSkins()

	for iter_56_0 = #var_56_0, 1, -1 do
		local var_56_1 = var_56_0[iter_56_0]

		if var_56_1.type == Goods.TYPE_SKIN then
			if var_56_1:getConfig("time") == "always" then
				table.remove(var_56_0, iter_56_0)
			end
		elseif var_56_1.type == Goods.TYPE_ACTIVITY_EXTRA and pg.activity_shop_extra[var_56_1.id].shop_tag ~= 1 then
			table.remove(var_56_0, iter_56_0)
		end
	end

	return var_56_0
end

function var_0_0.GetPermanentSkins(arg_57_0)
	local var_57_0 = arg_57_0:GetAllSkins()

	for iter_57_0 = #var_57_0, 1, -1 do
		local var_57_1 = var_57_0[iter_57_0]

		if var_57_1.type == Goods.TYPE_SKIN then
			if var_57_1:getConfig("time") ~= "always" then
				table.remove(var_57_0, iter_57_0)
			end
		elseif var_57_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			if pg.activity_shop_extra[var_57_1.id].shop_tag ~= 2 then
				table.remove(var_57_0, iter_57_0)
			end
		elseif var_57_1.type == Goods.TYPE_ACTIVITY then
			table.remove(var_57_0, iter_57_0)
		end
	end

	return var_57_0
end

function var_0_0.GetShareSkinsForShipGroupInJuus(arg_58_0, arg_58_1)
	local var_58_0 = pg.ship_data_group.get_id_list_by_group_type[arg_58_1][1]
	local var_58_1 = pg.ship_data_group[var_58_0]

	if not var_58_1.share_group_id or #var_58_1.share_group_id <= 0 then
		return {}
	end

	local var_58_2 = {}

	for iter_58_0, iter_58_1 in ipairs(var_58_1.share_group_id) do
		local var_58_3 = pg.ship_skin_template.get_id_list_by_ship_group[iter_58_1]

		for iter_58_2, iter_58_3 in ipairs(var_58_3) do
			local var_58_4 = ShipSkin.New({
				id = iter_58_3
			})

			if var_58_4:CanShareInJuus() then
				table.insert(var_58_2, var_58_4)
			end
		end
	end

	return var_58_2
end

return var_0_0

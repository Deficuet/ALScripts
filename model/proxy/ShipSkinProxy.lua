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

	if arg_17_0.prevNewSkin then
		arg_17_0.prevNewSkin:SetIsNew(false)
	end

	arg_17_0.skins[arg_17_1.id] = arg_17_1

	if ShipSkin.IsChangeSkin(arg_17_1.id) then
		arg_17_0.changeSkinGroupDic[ShipSkin.GetChangeSkinGroupId(arg_17_1.id)] = true
	end

	arg_17_0.prevNewSkin = arg_17_1

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

function var_0_0.hasOldNonLimitSkin(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.skins[arg_26_1]

	return var_26_0 and not var_26_0:HasNewFlag() and not var_26_0:isExpireType()
end

function var_0_0.getSkinCountById(arg_27_0, arg_27_1)
	return arg_27_0:hasSkin(arg_27_1) and 1 or 0
end

function var_0_0.InForbiddenSkinListAndHide(arg_28_0, arg_28_1)
	return _.any(arg_28_0.forbiddenSkinList, function(arg_29_0)
		return arg_29_0.id == arg_28_1 and arg_29_0.type == var_0_0.FORBIDDEN_TYPE_HIDE
	end)
end

function var_0_0.InForbiddenSkinListAndShow(arg_30_0, arg_30_1)
	return _.any(arg_30_0.forbiddenSkinList, function(arg_31_0)
		return arg_31_0.id == arg_30_1 and arg_31_0.type == var_0_0.FORBIDDEN_TYPE_SHOW
	end)
end

function var_0_0.InForbiddenSkinList(arg_32_0, arg_32_1)
	return _.any(arg_32_0.forbiddenSkinList, function(arg_33_0)
		return arg_33_0.id == arg_32_1
	end)
end

function var_0_0.remove(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.timers) do
		iter_34_1:Stop()
	end

	arg_34_0.timers = nil
end

function var_0_0.GetAllSkins(arg_35_0)
	local var_35_0 = {}

	local function var_35_1(arg_36_0)
		local var_36_0 = arg_36_0:getSkinId()
		local var_36_1 = getProxy(ShipSkinProxy):getSkinById(var_36_0)
		local var_36_2 = var_36_1 and not var_36_1:isExpireType() and 1 or 0

		arg_36_0:updateBuyCount(var_36_2)
	end

	local function var_35_2(arg_37_0)
		local var_37_0 = Goods.Create({
			shop_id = arg_37_0
		}, Goods.TYPE_SKIN)

		var_35_1(var_37_0)

		local var_37_1 = pg.shop_template[arg_37_0].collaboration_skin_time
		local var_37_2 = var_37_1 == "" or var_37_1 == pg.shop_template[arg_37_0].time
		local var_37_3, var_37_4 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_37_0].time)

		if var_37_2 and var_37_3 then
			table.insert(var_35_0, var_37_0)
		end
	end

	for iter_35_0, iter_35_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_35_2(iter_35_1)
	end

	for iter_35_2, iter_35_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_35_2(iter_35_3)
	end

	local var_35_3 = getProxy(ActivityProxy)
	local var_35_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_35_4, iter_35_5 in ipairs(var_35_4) do
		local var_35_5 = pg.activity_shop_extra[iter_35_5]
		local var_35_6 = var_35_3:getActivityById(var_35_5.activity)

		if var_35_5.activity == 0 and pg.TimeMgr.GetInstance():inTime(var_35_5.time) or var_35_6 and not var_35_6:isEnd() then
			local var_35_7 = Goods.Create({
				shop_id = iter_35_5
			}, Goods.TYPE_ACTIVITY_EXTRA)

			var_35_1(var_35_7)
			table.insert(var_35_0, var_35_7)
		end
	end

	local var_35_8 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_35_6, iter_35_7 in ipairs(var_35_8) do
		local var_35_9 = pg.activity_shop_template[iter_35_7]
		local var_35_10 = var_35_3:getActivityById(var_35_9.activity)

		if var_35_10 and not var_35_10:isEnd() then
			local var_35_11 = Goods.Create({
				shop_id = iter_35_7
			}, Goods.TYPE_ACTIVITY)

			var_35_1(var_35_11)

			if not _.any(var_35_0, function(arg_38_0)
				return arg_38_0:getSkinId() == var_35_11:getSkinId()
			end) then
				table.insert(var_35_0, var_35_11)
			end
		end
	end

	for iter_35_8 = #var_35_0, 1, -1 do
		local var_35_12 = var_35_0[iter_35_8]:getSkinId()

		if arg_35_0:InForbiddenSkinList(var_35_12) or not arg_35_0:InShowTime(var_35_12) then
			table.remove(var_35_0, iter_35_8)
		end
	end

	return var_35_0
end

function var_0_0.GetShopShowingSkins(arg_39_0)
	local var_39_0 = {}

	local function var_39_1(arg_40_0)
		local var_40_0 = arg_40_0:getSkinId()
		local var_40_1 = getProxy(ShipSkinProxy):getSkinById(var_40_0)
		local var_40_2 = var_40_1 and not var_40_1:isExpireType() and 1 or 0

		arg_40_0:updateBuyCount(var_40_2)
	end

	local function var_39_2(arg_41_0)
		local var_41_0 = Goods.Create({
			shop_id = arg_41_0
		}, Goods.TYPE_SKIN)

		var_39_1(var_41_0)
		table.insert(var_39_0, var_41_0)
	end

	for iter_39_0, iter_39_1 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShop]) do
		var_39_2(iter_39_1)
	end

	for iter_39_2, iter_39_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.SkinShopTimeLimit]) do
		var_39_2(iter_39_3)
	end

	local var_39_3 = getProxy(ActivityProxy)
	local var_39_4 = pg.activity_shop_extra.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_39_4, iter_39_5 in ipairs(var_39_4) do
		local var_39_5 = Goods.Create({
			shop_id = iter_39_5
		}, Goods.TYPE_ACTIVITY_EXTRA)

		var_39_1(var_39_5)
		table.insert(var_39_0, var_39_5)
	end

	local var_39_6 = pg.activity_shop_template.get_id_list_by_commodity_type[DROP_TYPE_SKIN]

	for iter_39_6, iter_39_7 in ipairs(var_39_6) do
		local var_39_7 = Goods.Create({
			shop_id = iter_39_7
		}, Goods.TYPE_ACTIVITY)

		var_39_1(var_39_7)

		if not _.any(var_39_0, function(arg_42_0)
			return arg_42_0:getSkinId() == var_39_7:getSkinId()
		end) then
			table.insert(var_39_0, var_39_7)
		end
	end

	return var_39_0
end

function var_0_0.GetAllSkinForShip(arg_43_0, arg_43_1)
	assert(isa(arg_43_1, Ship), "ship should be an instance of Ship")

	local var_43_0 = arg_43_1.groupId
	local var_43_1 = ShipGroup.getSkinList(var_43_0)

	for iter_43_0 = #var_43_1, 1, -1 do
		local var_43_2 = var_43_1[iter_43_0]

		if var_43_2.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_43_0:hasSkin(var_43_2.id) then
			table.remove(var_43_1, iter_43_0)
		elseif not arg_43_0:InShowTime(var_43_2.id) then
			table.remove(var_43_1, iter_43_0)
		end
	end

	if pg.ship_data_trans[var_43_0] and not arg_43_1:isRemoulded() then
		local var_43_3 = ShipGroup.GetGroupConfig(var_43_0).trans_skin

		for iter_43_1 = #var_43_1, 1, -1 do
			if var_43_1[iter_43_1].id == var_43_3 then
				table.remove(var_43_1, iter_43_1)

				break
			end
		end
	end

	for iter_43_2 = #var_43_1, 1, -1 do
		local var_43_4 = var_43_1[iter_43_2]

		if var_43_4.show_time and (type(var_43_4.show_time) == "string" and var_43_4.show_time == "stop" or type(var_43_4.show_time) == "table" and not pg.TimeMgr.GetInstance():inTime(var_43_4.show_time)) then
			table.remove(var_43_1, iter_43_2)
		end

		if var_43_4.no_showing == "1" then
			table.remove(var_43_1, iter_43_2)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_43_4.id].isHX == 1 then
			table.remove(var_43_1, iter_43_2)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		local var_43_5 = pg.gameset.big_seven_old_skin_timestamp.key_value

		for iter_43_3 = #var_43_1, 1, -1 do
			if var_43_1[iter_43_3].skin_type == ShipSkin.SKIN_TYPE_OLD and var_43_5 < arg_43_1.createTime then
				table.remove(var_43_1, iter_43_3)
			end
		end
	end

	if #arg_43_0.forbiddenSkinList > 0 then
		for iter_43_4 = #var_43_1, 1, -1 do
			local var_43_6 = var_43_1[iter_43_4].id

			if not arg_43_0:hasSkin(var_43_6) and arg_43_0:InForbiddenSkinListAndHide(var_43_6) then
				table.remove(var_43_1, iter_43_4)
			end
		end
	end

	for iter_43_5 = #var_43_1, 1, -1 do
		local var_43_7 = var_43_1[iter_43_5]
		local var_43_8 = ShipSkin.GetChangeSkinGroupId(var_43_7.id)

		if var_43_8 then
			local var_43_9 = ShipSkin.GetStoreChangeSkinId(var_43_8, arg_43_1:GetShipPhantomMark())

			if not var_43_9 then
				if var_43_7.change_skin.index ~= 1 then
					print("没有缓存的id ，" .. "移除了id" .. var_43_7.id)
					table.remove(var_43_1, iter_43_5)
				end
			elseif var_43_9 ~= var_43_7.id then
				print("有缓存的id = " .. var_43_9 .. "移除了id" .. var_43_7.id)
				table.remove(var_43_1, iter_43_5)
			end
		end
	end

	return var_43_1
end

function var_0_0.GetShareSkinsForShipGroup(arg_44_0, arg_44_1)
	local var_44_0 = pg.ship_data_group.get_id_list_by_group_type[arg_44_1][1]
	local var_44_1 = pg.ship_data_group[var_44_0]

	if not var_44_1.share_group_id or #var_44_1.share_group_id <= 0 then
		return {}
	end

	local var_44_2 = {}

	for iter_44_0, iter_44_1 in ipairs(var_44_1.share_group_id) do
		local var_44_3 = pg.ship_skin_template.get_id_list_by_ship_group[iter_44_1]

		for iter_44_2, iter_44_3 in ipairs(var_44_3) do
			local var_44_4 = ShipSkin.New({
				id = iter_44_3
			})

			if var_44_4:CanShare() then
				table.insert(var_44_2, var_44_4)
			end
		end
	end

	return var_44_2
end

function var_0_0.GetShareSkinsForShip(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_1.groupId

	return arg_45_0:GetShareSkinsForShipGroup(var_45_0)
end

function var_0_0.GetAllSkinForARCamera(arg_46_0, arg_46_1)
	local var_46_0 = ShipGroup.getSkinList(arg_46_1)

	for iter_46_0 = #var_46_0, 1, -1 do
		if var_46_0[iter_46_0].skin_type == ShipSkin.SKIN_TYPE_OLD then
			table.remove(var_46_0, iter_46_0)
		end
	end

	local var_46_1 = ShipGroup.GetGroupConfig(arg_46_1).trans_skin

	if var_46_1 ~= 0 then
		local var_46_2 = false
		local var_46_3 = getProxy(CollectionProxy):getShipGroup(arg_46_1)

		if var_46_3 then
			for iter_46_1, iter_46_2 in ipairs(var_46_0) do
				if iter_46_2.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_46_3.trans then
					var_46_2 = true

					break
				end
			end
		end

		if not var_46_2 then
			for iter_46_3 = #var_46_0, 1, -1 do
				if var_46_0[iter_46_3].id == var_46_1 then
					table.remove(var_46_0, iter_46_3)

					break
				end
			end
		end
	end

	for iter_46_4 = #var_46_0, 1, -1 do
		local var_46_4 = var_46_0[iter_46_4]

		if var_46_4.skin_type == ShipSkin.SKIN_TYPE_NOT_HAVE_HIDE and not arg_46_0:hasSkin(var_46_4.id) then
			table.remove(var_46_0, iter_46_4)
		elseif var_46_4.no_showing == "1" then
			table.remove(var_46_0, iter_46_4)
		elseif PLATFORM == PLATFORM_KR and pg.ship_skin_template[var_46_4.id].isHX == 1 then
			table.remove(var_46_0, iter_46_4)
		elseif not arg_46_0:InShowTime(var_46_4.id) then
			table.remove(var_46_0, iter_46_4)
		end
	end

	if #arg_46_0.forbiddenSkinList > 0 then
		for iter_46_5 = #var_46_0, 1, -1 do
			local var_46_5 = var_46_0[iter_46_5].id

			if not arg_46_0:hasSkin(var_46_5) and arg_46_0:InForbiddenSkinListAndHide(var_46_5) then
				table.remove(var_46_0, iter_46_5)
			end
		end
	end

	for iter_46_6 = #var_46_0, 1, -1 do
		local var_46_6 = var_46_0[iter_46_6]

		if var_46_6 and var_46_6.change_skin and var_46_6.change_skin.index and var_46_6.change_skin.index ~= 1 then
			table.remove(var_46_0, iter_46_6)
		end
	end

	return var_46_0
end

function var_0_0.InShowTime(arg_47_0, arg_47_1)
	local var_47_0 = pg.ship_skin_template_column_time[arg_47_1]

	if var_47_0 and var_47_0.time ~= "" and type(var_47_0.time) == "table" and #var_47_0.time > 0 then
		return pg.TimeMgr.GetInstance():passTime(var_47_0.time)
	end

	return true
end

function var_0_0.HasFashion(arg_48_0, arg_48_1)
	if #arg_48_0:GetShareSkinsForShip(arg_48_1) > 0 then
		return true
	end

	local var_48_0 = arg_48_0:GetAllSkinForShip(arg_48_1)

	if #var_48_0 == 1 then
		local var_48_1 = var_48_0[1]

		return (checkABExist("painting/" .. var_48_1.painting .. "_n"))
	end

	return #var_48_0 > 1
end

function var_0_0.GetEncoreSkins(arg_49_0)
	local var_49_0 = {}
	local var_49_1 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_BUFF)

	local function var_49_2(arg_50_0)
		local var_50_0 = arg_50_0:getConfig("config_client")

		if var_50_0 and var_50_0[1] and type(var_50_0[1]) == "table" then
			return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_50_0[1]) <= pg.TimeMgr.GetInstance():GetServerTime()
		else
			return arg_50_0:isEnd()
		end
	end

	for iter_49_0, iter_49_1 in ipairs(var_49_1) do
		if iter_49_1:getDataConfig("type") == 5 and not var_49_2(iter_49_1) then
			for iter_49_2, iter_49_3 in ipairs(iter_49_1:getConfig("config_data")) do
				table.insert(var_49_0, iter_49_3)
			end
		end
	end

	local var_49_3 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING)

	for iter_49_4, iter_49_5 in ipairs(var_49_3) do
		if iter_49_5 and not iter_49_5:isEnd() then
			for iter_49_6, iter_49_7 in ipairs(iter_49_5:getConfig("config_data")[2]) do
				if not table.contains(var_49_0, iter_49_7) then
					table.insert(var_49_0, iter_49_7)
				end
			end
		end
	end

	return var_49_0
end

function var_0_0.GetOwnSkins(arg_51_0)
	local var_51_0 = {}
	local var_51_1 = arg_51_0:getRawData()

	for iter_51_0, iter_51_1 in pairs(var_51_1) do
		table.insert(var_51_0, iter_51_1)
	end

	local var_51_2 = getProxy(CollectionProxy).shipGroups

	for iter_51_2, iter_51_3 in pairs(var_51_2) do
		if iter_51_3.married == 1 then
			local var_51_3 = ShipGroup.getProposeSkin(iter_51_3.id)

			if var_51_3 then
				table.insert(var_51_0, ShipSkin.New({
					id = var_51_3.id
				}))
			end
		end

		if iter_51_3.trans then
			local var_51_4 = pg.ship_data_trans[iter_51_3.id].skin_id

			table.insert(var_51_0, ShipSkin.New({
				id = var_51_4
			}))
		end
	end

	return var_51_0
end

function var_0_0.GetOwnAndShareSkins(arg_52_0)
	local var_52_0 = arg_52_0:GetOwnSkins()
	local var_52_1 = {}

	for iter_52_0, iter_52_1 in ipairs(var_52_0) do
		var_52_1[iter_52_1.id] = iter_52_1
	end

	local var_52_2 = getProxy(CollectionProxy).shipGroups

	for iter_52_2, iter_52_3 in pairs(var_52_2) do
		if iter_52_3.married == 1 then
			local var_52_3 = arg_52_0:GetShareSkinsForShipGroup(iter_52_3.id)

			for iter_52_4, iter_52_5 in ipairs(var_52_3) do
				if not var_52_1[iter_52_5.id] then
					table.insert(var_52_0, iter_52_5)
				end
			end
		end
	end

	return var_52_0
end

function var_0_0.GetProbabilitySkins(arg_53_0, arg_53_1)
	local var_53_0 = {}

	local function var_53_1(arg_54_0)
		local var_54_0 = arg_54_0:getSkinId()
		local var_54_1 = getProxy(ShipSkinProxy):getSkinById(var_54_0)
		local var_54_2 = var_54_1 and not var_54_1:isExpireType() and 1 or 0

		arg_54_0:updateBuyCount(var_54_2)
	end

	local function var_53_2(arg_55_0)
		local var_55_0 = Goods.Create({
			shop_id = arg_55_0
		}, Goods.TYPE_SKIN)

		var_53_1(var_55_0)

		local var_55_1, var_55_2 = pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_55_0].time)

		if var_55_1 then
			table.insert(var_53_0, var_55_0)
		end
	end

	local var_53_3 = getProxy(ShipSkinProxy):GetAllSkins()
	local var_53_4 = {}

	for iter_53_0, iter_53_1 in ipairs(var_53_3) do
		if iter_53_1:getConfig("genre") ~= ShopArgs.SkinShopTimeLimit then
			var_53_4[iter_53_1:getSkinId()] = iter_53_1.id
		end
	end

	for iter_53_2, iter_53_3 in ipairs(arg_53_1) do
		local var_53_5 = var_53_4[iter_53_3[1]]

		if var_53_5 then
			var_53_2(var_53_5)
		end
	end

	return var_53_0
end

function var_0_0.GetSkinProbabilitys(arg_56_0, arg_56_1)
	local var_56_0 = {}

	for iter_56_0, iter_56_1 in ipairs(arg_56_1) do
		var_56_0[iter_56_1[1]] = iter_56_1[2]
	end

	return var_56_0
end

function var_0_0.GetInTimeSkins(arg_57_0)
	local var_57_0 = arg_57_0:GetAllSkins()

	for iter_57_0 = #var_57_0, 1, -1 do
		local var_57_1 = var_57_0[iter_57_0]

		if var_57_1.type == Goods.TYPE_SKIN then
			if var_57_1:getConfig("time") == "always" then
				table.remove(var_57_0, iter_57_0)
			end
		elseif var_57_1.type == Goods.TYPE_ACTIVITY_EXTRA and pg.activity_shop_extra[var_57_1.id].shop_tag ~= 1 then
			table.remove(var_57_0, iter_57_0)
		end
	end

	return var_57_0
end

function var_0_0.GetPermanentSkins(arg_58_0)
	local var_58_0 = arg_58_0:GetAllSkins()

	for iter_58_0 = #var_58_0, 1, -1 do
		local var_58_1 = var_58_0[iter_58_0]

		if var_58_1.type == Goods.TYPE_SKIN then
			if var_58_1:getConfig("time") ~= "always" then
				table.remove(var_58_0, iter_58_0)
			end
		elseif var_58_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			if pg.activity_shop_extra[var_58_1.id].shop_tag ~= 2 then
				table.remove(var_58_0, iter_58_0)
			end
		elseif var_58_1.type == Goods.TYPE_ACTIVITY then
			table.remove(var_58_0, iter_58_0)
		end
	end

	return var_58_0
end

return var_0_0

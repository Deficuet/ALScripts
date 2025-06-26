local var_0_0 = class("ApartmentProxy", import(".NetProxy"))

var_0_0.UPDATE_APARTMENT = "ApartmentProxy.UPDATE_APARTMENT"
var_0_0.UPDATE_ROOM = "ApartmentProxy.UPDATE_ROOM"
var_0_0.UPDATE_GIFT_COUNT = "ApartmentProxy.UPDATE_GIFT_COUNT"
var_0_0.ZERO_HOUR_REFRESH = "ApartmentProxy.ZERO_HOUR_REFRESH"
var_0_0.UPDATE_ROOM_INVITE_LIST = "ApartmentProxy.UPDATE_ROOM_INVITE_LIST"
var_0_0.UPDATE_SLIDE_INVITE_LIST = "ApartmentProxy.UPDATE_SLIDE_INVITE_LIST"

function var_0_0.register(arg_1_0)
	arg_1_0.data = {}
	arg_1_0.roomData = {}
	arg_1_0.giftBag = setDefaultZeroMetatable({})
	arg_1_0.giftGiveCount = setDefaultZeroMetatable({})
	arg_1_0.stamina = 0
	arg_1_0.shopCount = {
		dailyGift = {},
		permanentGift = {},
		dailyFurniture = {},
		permanentFurniture = {}
	}

	arg_1_0:on(28000, function(arg_2_0)
		arg_1_0.stamina = getDorm3dGameset("daily_vigor_max")[1] - arg_2_0.daily_vigor_max

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.gifts) do
			arg_1_0.giftBag[iter_2_1.gift_id] = iter_2_1.number
			arg_1_0.giftGiveCount[iter_2_1.gift_id] = iter_2_1.used_number
		end

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.ships) do
			local var_2_0 = Apartment.New(iter_2_3)

			arg_1_0.data[var_2_0:GetConfigID()] = var_2_0
		end

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.rooms) do
			local var_2_1 = ApartmentRoom.New(iter_2_5)

			arg_1_0.roomData[var_2_1:GetConfigID()] = var_2_1
		end

		local function var_2_2(arg_3_0, arg_3_1)
			_.each(arg_3_0 or {}, function(arg_4_0)
				arg_3_1[arg_4_0.gift_id] = arg_4_0.count
			end)
		end

		var_2_2(arg_2_0.gift_daily, arg_1_0.shopCount.dailyGift)
		var_2_2(arg_2_0.gift_permanent, arg_1_0.shopCount.permanentGift)
		var_2_2(arg_2_0.furniture_daily, arg_1_0.shopCount.dailyFurniture)
		var_2_2(arg_2_0.furniture_permanent, arg_1_0.shopCount.permanentFurniture)
	end)
end

function var_0_0.timeCall(arg_5_0)
	return {
		[ProxyRegister.DayCall] = function(arg_6_0, arg_6_1)
			if pg.TimeMgr.GetInstance():GetServerWeek() ~= 1 then
				return
			end

			arg_5_0:ResetDailyShopCount()

			arg_5_0.stamina = getDorm3dGameset("daily_vigor_max")[1]

			arg_5_0:sendNotification(var_0_0.ZERO_HOUR_REFRESH)
			arg_5_0:InitGiftDaily()
			var_0_0.RefreshGiftDailyTip()
		end
	}
end

function var_0_0.InitGiftDaily(arg_7_0)
	pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
		callback = function()
			for iter_8_0, iter_8_1 in pairs(pg.dorm3d_gift.all) do
				local var_8_0 = pg.dorm3d_gift[iter_8_1]

				if #var_8_0.shop_id > 0 then
					local var_8_1 = pg.shop_template[var_8_0.shop_id[1]].group

					if var_8_1 ~= 0 then
						arg_7_0.shopCount.dailyGift[var_8_0.id] = getProxy(ShopsProxy):GetGroupPayCount(var_8_1)
					end
				end
			end
		end
	})
end

function var_0_0.updateApartment(arg_9_0, arg_9_1)
	arg_9_0.data[arg_9_1.configId] = arg_9_1:clone()

	arg_9_0:sendNotification(var_0_0.UPDATE_APARTMENT, arg_9_1)
end

function var_0_0.updateRoom(arg_10_0, arg_10_1)
	arg_10_0.roomData[arg_10_1.configId] = arg_10_1:clone()

	arg_10_0:sendNotification(var_0_0.UPDATE_ROOM, arg_10_1)
end

function var_0_0.ModifyApartment(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.data[arg_11_1]

	assert(var_11_0, "apartment not exist")

	if type(arg_11_2) == "function" then
		arg_11_2(var_11_0)
	elseif type(arg_11_2) == "table" then
		for iter_11_0, iter_11_1 in pairs(arg_11_2) do
			var_11_0[iter_11_0] = iter_11_1
		end
	end

	arg_11_0:sendNotification(var_0_0.UPDATE_APARTMENT, var_11_0:clone())
end

function var_0_0.ModifyRoom(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.roomData[arg_12_1]

	assert(var_12_0, "room not exist")

	if type(arg_12_2) == "function" then
		arg_12_2(var_12_0)
	elseif type(arg_12_2) == "table" then
		for iter_12_0, iter_12_1 in pairs(arg_12_2) do
			var_12_0[iter_12_0] = iter_12_1
		end
	end

	arg_12_0:sendNotification(var_0_0.UPDATE_ROOM, var_12_0:clone())
end

function var_0_0.triggerFavor(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_3 = arg_13_3 or 1

	local var_13_0 = arg_13_0.data[arg_13_1]
	local var_13_1 = pg.dorm3d_favor_trigger[arg_13_2]
	local var_13_2 = 0
	local var_13_3 = 0

	if arg_13_0.stamina >= var_13_1.is_daily_max and not var_13_0:isMaxFavor() then
		var_13_3 = var_13_1.is_daily_max * arg_13_3
		var_13_2 = math.min(var_13_1.num * arg_13_3, var_13_0:getMaxFavor() - var_13_0.favor)
	end

	arg_13_0.stamina = arg_13_0.stamina - var_13_3
	var_13_0.favor = var_13_0.favor + var_13_2
	var_13_0.triggerCountDic[arg_13_2] = var_13_0.triggerCountDic[arg_13_2] + 1

	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataFavor(arg_13_1, var_13_2, var_13_0.favor, var_13_1.type, table.CastToString(var_13_1.param)))
	arg_13_0:updateApartment(var_13_0)

	return var_13_2, var_13_3
end

function var_0_0.getStamina(arg_14_0)
	return arg_14_0.stamina, getDorm3dGameset("daily_vigor_max")[1]
end

function var_0_0.RawGetApartment(arg_15_0, arg_15_1)
	return arg_15_0.data[arg_15_1]
end

function var_0_0.getApartment(arg_16_0, arg_16_1)
	return arg_16_0.data[arg_16_1] and arg_16_0.data[arg_16_1]:clone() or nil
end

function var_0_0.getRoom(arg_17_0, arg_17_1)
	return arg_17_0.roomData[arg_17_1]
end

function var_0_0.getGiftCount(arg_18_0, arg_18_1)
	return arg_18_0.giftBag[arg_18_1]
end

function var_0_0.changeGiftCount(arg_19_0, arg_19_1, arg_19_2)
	assert(arg_19_2 ~= 0)

	arg_19_0.giftBag[arg_19_1] = arg_19_0.giftBag[arg_19_1] + arg_19_2

	arg_19_0:sendNotification(var_0_0.UPDATE_GIFT_COUNT, arg_19_1)
end

function var_0_0.getApartmentGiftCount(arg_20_0, arg_20_1)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.giftBag) do
		if iter_20_1 > 0 and pg.dorm3d_gift[iter_20_0].ship_group_id == arg_20_1 then
			return iter_20_0
		end
	end

	return nil
end

function var_0_0.addGiftGiveCount(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.giftGiveCount[arg_21_1] = arg_21_0.giftGiveCount[arg_21_1] + arg_21_2
end

function var_0_0.isGiveGiftDone(arg_22_0, arg_22_1)
	return arg_22_0.giftGiveCount[arg_22_1] > 0
end

function var_0_0.GetGiftShopCount(arg_23_0, arg_23_1)
	return arg_23_0.shopCount.dailyGift[arg_23_1] or arg_23_0.shopCount.permanentGift[arg_23_1] or 0
end

function var_0_0.AddDailyGiftShopCount(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.shopCount.dailyGift[arg_24_1] = (arg_24_0.shopCount.dailyGift[arg_24_1] or 0) + arg_24_2
end

function var_0_0.AddPermanentGiftShopCount(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.shopCount.permanentGift[arg_25_1] = (arg_25_0.shopCount.permanentGift[arg_25_1] or 0) + arg_25_2
end

function var_0_0.GetFurnitureShopCount(arg_26_0, arg_26_1)
	return arg_26_0.shopCount.dailyFurniture[arg_26_1] or arg_26_0.shopCount.permanentFurniture[arg_26_1] or 0
end

function var_0_0.AddDailyFurnitureShopCount(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0.shopCount.dailyFurniture[arg_27_1] = (arg_27_0.shopCount.dailyFurniture[arg_27_1] or 0) + arg_27_2
end

function var_0_0.AddPermanentFurnitureShopCount(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0.shopCount.permanentFurniture[arg_28_1] = (arg_28_0.shopCount.permanentFurniture[arg_28_1] or 0) + arg_28_2
end

function var_0_0.ResetDailyShopCount(arg_29_0)
	table.clear(arg_29_0.shopCount.dailyGift)
	table.clear(arg_29_0.shopCount.dailyFurniture)
end

function var_0_0.RecordEnterTime(arg_30_0)
	arg_30_0.dormEnterTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetEnterTime(arg_31_0)
	return arg_31_0.dormEnterTimeStamp
end

function var_0_0.RecordAccompanyTime(arg_32_0)
	arg_32_0.dormAccompanyTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetAccompanyTime(arg_33_0)
	return arg_33_0.dormAccompanyTimeStamp
end

function var_0_0.GetRoomInviteList(arg_34_0)
	return underscore.map(string.split(PlayerPrefs.GetString(string.format("room%d_invite_list", arg_34_0), ""), "|"), function(arg_35_0)
		return tonumber(arg_35_0)
	end)
end

function var_0_0.SetRoomInviteList(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	local var_36_0, var_36_1, var_36_2 = table.Diff(var_0_0.GetRoomInviteList(arg_36_1), arg_36_2)

	PlayerPrefs.SetString(string.format("room%d_invite_list", arg_36_1), table.concat(arg_36_2, "|"))
	arg_36_0:sendNotification(var_0_0.UPDATE_ROOM_INVITE_LIST, {
		roomId = arg_36_1,
		groupIds = arg_36_2,
		addIds = var_36_1,
		removeIds = var_36_2,
		callback = arg_36_3
	})
end

function var_0_0.GetSlideInviteList()
	return underscore.map(string.split(PlayerPrefs.GetString("slide_invite_list", ""), "|"), function(arg_38_0)
		return tonumber(arg_38_0)
	end) or {}
end

function var_0_0.SetSlideInviteList(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0, var_39_1, var_39_2 = table.Diff(var_0_0.GetSlideInviteList(), arg_39_1)

	PlayerPrefs.SetString("slide_invite_list", table.concat(arg_39_1, "|"))
	arg_39_0:sendNotification(var_0_0.UPDATE_SLIDE_INVITE_LIST, {
		groupIds = arg_39_1,
		addIds = var_39_1,
		removeIds = var_39_2,
		callback = arg_39_2
	})
end

local var_0_1 = {
	6,
	18
}

function var_0_0.GetTimeIndex(arg_40_0)
	local var_40_0 = #var_0_1

	for iter_40_0, iter_40_1 in ipairs(var_0_1) do
		if arg_40_0 < iter_40_1 then
			break
		else
			var_40_0 = iter_40_0
		end
	end

	return var_40_0
end

function var_0_0.GetTimePPName(arg_41_0)
	local var_41_0 = getProxy(PlayerProxy):getRawData()

	return "DORM3D_SCENE_LOCK_TIME_IN_PLAYER:" .. var_41_0.id .. "_ROOM_" .. arg_41_0
end

function var_0_0.CheckUnlockConfig(arg_42_0)
	if arg_42_0 == nil or arg_42_0 == "" or #arg_42_0 == 0 then
		return true
	end

	return switch(arg_42_0[1], {
		function(arg_43_0, arg_43_1, arg_43_2)
			local var_43_0 = getProxy(ApartmentProxy):getApartment(arg_43_1)

			if var_43_0 and arg_43_2 <= var_43_0.level then
				return true
			else
				return false, i18n("apartment_level_unenough", arg_43_2)
			end
		end,
		function(arg_44_0, arg_44_1)
			local var_44_0 = getProxy(ApartmentProxy):getRoom(pg.dorm3d_furniture_template[arg_44_1].room_id)

			if var_44_0 and underscore.any(var_44_0.furnitures, function(arg_45_0)
				return arg_45_0.configId == arg_44_1
			end) then
				return true
			else
				return false, string.format("without dorm furniture:%d", arg_44_1)
			end
		end,
		function(arg_46_0, arg_46_1)
			if getProxy(ApartmentProxy):isGiveGiftDone(arg_46_1) then
				return true
			else
				return false, string.format("gift:%d didn't had given", arg_46_1)
			end
		end,
		function(arg_47_0, arg_47_1)
			local var_47_0 = getProxy(CollectionProxy):getShipGroup(arg_47_1)

			if var_47_0 and var_47_0.married > 0 then
				return true
			else
				return false, string.format("ship:%d was not married", arg_47_1)
			end
		end,
		function(arg_48_0, arg_48_1, arg_48_2)
			local var_48_0 = getProxy(ApartmentProxy):getRoom(arg_48_1)

			return var_48_0 and var_48_0.unlockCharacter[arg_48_2], i18n("dorm3d_skin_locked")
		end,
		function(arg_49_0, arg_49_1, arg_49_2)
			local var_49_0 = getProxy(ApartmentProxy):getApartment(arg_49_2)

			return var_49_0 and _.detect(var_49_0.skinList, function(arg_50_0)
				return arg_50_0 == arg_49_1
			end), i18n("dorm3d_skin_locked")
		end
	}, function(arg_51_0)
		return false, string.format("without unlock type:%d", arg_51_0)
	end, unpack(arg_42_0))
end

function var_0_0.PendingRandom(arg_52_0, arg_52_1)
	local var_52_0 = {}

	for iter_52_0, iter_52_1 in ipairs(arg_52_1) do
		local var_52_1 = underscore.detect(pg.dorm3d_rooms[arg_52_0].character_welcome, function(arg_53_0)
			return arg_53_0[1] == iter_52_1
		end)

		if var_52_1 and var_52_1[2] > math.random() * 10000 then
			var_52_0[iter_52_1] = {}
		end
	end

	for iter_52_2, iter_52_3 in ipairs(pg.dorm3d_welcome.get_id_list_by_room_id[arg_52_0] or {}) do
		local var_52_2 = pg.dorm3d_welcome[iter_52_3]

		if var_52_0[var_52_2.ship_id] then
			table.insert(var_52_0[var_52_2.ship_id], iter_52_3)
		end
	end

	local var_52_3 = {}

	for iter_52_4, iter_52_5 in pairs(var_52_0) do
		local var_52_4 = 0
		local var_52_5 = 0

		for iter_52_6, iter_52_7 in ipairs(iter_52_5) do
			var_52_5 = var_52_5 + pg.dorm3d_welcome[iter_52_7].weight
		end

		local var_52_6 = math.random() * var_52_5

		for iter_52_8, iter_52_9 in ipairs(iter_52_5) do
			var_52_4 = var_52_4 + pg.dorm3d_welcome[iter_52_9].weight

			if var_52_6 < var_52_4 then
				var_52_3[iter_52_4] = iter_52_9

				break
			end
		end
	end

	return var_52_3
end

function var_0_0.RefreshGiftDailyTip()
	for iter_54_0, iter_54_1 in pairs(pg.dorm3d_shop_template.all) do
		local var_54_0 = pg.dorm3d_shop_template[iter_54_1]

		if pg.shop_template[var_54_0.shop_id[1]].group ~= 0 then
			local var_54_1 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt(var_54_1 .. "_dorm3dGiftWeekViewed_" .. var_54_0.item_id, 0)
			PlayerPrefs.SetInt(var_54_1 .. "_dorm3dGiftWeekRefreshTimeStamp", pg.TimeMgr.GetInstance():GetServerTime())
		end
	end
end

function var_0_0.CheckDeviceRAMEnough()
	local var_55_0 = SystemInfo.systemMemorySize
	local var_55_1 = getDorm3dGameset("drom3d_memory_limit")[1]

	return var_55_0 == 0 or var_55_1 < var_55_0
end

function var_0_0.CheckAllRoomInviteAll(arg_56_0)
	for iter_56_0, iter_56_1 in ipairs(pg.dorm3d_rooms.all) do
		if iter_56_1 ~= 5 then
			if not arg_56_0.roomData[iter_56_1] then
				return false
			end

			if not arg_56_0.roomData[iter_56_1]:isPersonalRoom() and not arg_56_0.roomData[iter_56_1]:unlockAllInvite() then
				return false
			end
		end
	end

	return true
end

return var_0_0

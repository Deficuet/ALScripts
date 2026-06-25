local var_0_0 = class("Dorm3dGift", import("model.vo.BaseVO"))

function var_0_0.bindConfigTable(arg_1_0)
	return pg.dorm3d_gift
end

function var_0_0.GetName(arg_2_0)
	return arg_2_0:getConfig("name")
end

function var_0_0.GetRarity(arg_3_0)
	return arg_3_0:getConfig("rarity")
end

function var_0_0.GetShipGroupId(arg_4_0)
	return arg_4_0:getConfig("ship_group_id")
end

function var_0_0.GetIcon(arg_5_0)
	return arg_5_0:getConfig("icon")
end

function var_0_0.GetDesc(arg_6_0)
	return arg_6_0:getConfig("display")
end

function var_0_0.InTime(arg_7_0)
	return pg.TimeMgr.GetInstance():inTime(arg_7_0:getConfig("time"))
end

function var_0_0.IsSingleGiveGift(arg_8_0)
	return pg.dorm3d_gift[arg_8_0].unlock_dialogue_id ~= 0
end

function var_0_0.IsExpireSoon(arg_9_0)
	local var_9_0 = pg.dorm3d_gift[arg_9_0].time

	if type(var_9_0) ~= "table" or #var_9_0 <= 1 then
		return false
	end

	local var_9_1 = pg.TimeMgr.GetInstance()
	local var_9_2 = var_9_1:GetServerTime()
	local var_9_3 = var_9_1:parseTimeFromConfig(var_9_0[2])

	return var_9_1:inTime(var_9_0) and var_9_3 - var_9_2 <= 172800
end

function var_0_0.GetExpireSoonTipFlag(arg_10_0)
	local var_10_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_10_0 .. "_dorm3dGiftExpireSoonTip_" .. arg_10_0, 0)
end

function var_0_0.SetExpireSoonTipFlag(arg_11_0)
	if var_0_0.GetExpireSoonTipFlag(arg_11_0) > 0 then
		return
	end

	local var_11_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_11_0 .. "_dorm3dGiftExpireSoonTip_" .. arg_11_0, 1)

	return true
end

function var_0_0.GetShopID(arg_12_0)
	local var_12_0 = arg_12_0:getConfig("shop_id")
	local var_12_1 = getProxy(ApartmentProxy):GetGiftShopCount(arg_12_0.configId)

	for iter_12_0 = 1, #var_12_0 - 1 do
		local var_12_2 = var_12_0[iter_12_0]
		local var_12_3 = pg.shop_template[var_12_2]
		local var_12_4 = var_12_3.limit_args[1]

		if not var_12_4 and var_12_3.group_type == 0 then
			return var_12_2
		elseif var_12_4 and (var_12_4[1] == "dailycount" or var_12_4[1] == "count") then
			if var_12_1 < var_12_4[3] then
				return var_12_2
			end
		elseif var_12_3.group_type == 2 then
			if var_12_1 < var_12_3.group_limit then
				return var_12_2
			end
		else
			return var_12_2
		end
	end

	return var_12_0[#var_12_0] or 0
end

function var_0_0.CheckBuyLimit(arg_13_0)
	local var_13_0 = arg_13_0:GetShopID()
	local var_13_1 = pg.shop_template[var_13_0]
	local var_13_2 = getProxy(ApartmentProxy):GetGiftShopCount(var_13_1.effect_args[1])

	if var_13_1.limit_args then
		local var_13_3 = var_13_1.limit_args[1]

		if type(var_13_3) == "table" and (var_13_3[1] == "dailycount" or var_13_3[1] == "count") and var_13_2 >= var_13_3[3] then
			return false
		end
	end

	if var_13_1.group_limit > 0 and var_13_2 >= var_13_1.group_limit then
		return false
	end

	return true
end

function var_0_0.NeedViewTip(arg_14_0)
	local var_14_0 = var_0_0.bindConfigTable()
	local var_14_1 = _.keys(var_14_0.get_id_list_by_ship_group_id)

	return _.any(var_14_1, function(arg_15_0)
		if arg_15_0 == 0 then
			return
		end

		if arg_14_0 and arg_14_0 > 0 and arg_15_0 ~= arg_14_0 then
			return
		end

		local var_15_0 = var_14_0.get_id_list_by_ship_group_id[arg_15_0]

		return _.any(var_15_0, function(arg_16_0)
			local var_16_0 = Dorm3dGift.New({
				configId = arg_16_0
			})

			return var_16_0:GetShopID() and type(var_16_0:getConfig("time")) ~= "table" and (not Dorm3dGift.IsSingleGiveGift(arg_16_0) or not getProxy(ApartmentProxy):isGiveGiftDone(arg_16_0)) and Dorm3dGift.GetViewedFlag(arg_16_0) == 0
		end)
	end)
end

function var_0_0.NeedViewTipByGiftId(arg_17_0)
	return Dorm3dGift.GetViewedFlag(arg_17_0) == 0 and (not Dorm3dGift.IsSingleGiveGift(arg_17_0) or not getProxy(ApartmentProxy):isGiveGiftDone(arg_17_0))
end

function var_0_0.GetViewedFlag(arg_18_0)
	local var_18_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_18_0 .. "_dorm3dGiftViewed_" .. arg_18_0, 0)
end

function var_0_0.SetViewedFlag(arg_19_0)
	if var_0_0.GetViewedFlag(arg_19_0) > 0 then
		return
	end

	local var_19_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_19_0 .. "_dorm3dGiftViewed_" .. arg_19_0, 1)

	return true
end

return var_0_0

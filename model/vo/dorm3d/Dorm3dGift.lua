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

function var_0_0.GetShopID(arg_7_0)
	local var_7_0 = arg_7_0:getConfig("shop_id")
	local var_7_1 = getProxy(ApartmentProxy):GetGiftShopCount(arg_7_0.configId)

	for iter_7_0 = 1, #var_7_0 - 1 do
		local var_7_2 = var_7_0[iter_7_0]
		local var_7_3 = pg.shop_template[var_7_2]
		local var_7_4 = var_7_3.limit_args[1]

		if not var_7_4 and var_7_3.group_type == 0 then
			return var_7_2
		elseif var_7_4 and (var_7_4[1] == "dailycount" or var_7_4[1] == "count") then
			if var_7_1 < var_7_4[3] then
				return var_7_2
			end
		elseif var_7_3.group_type == 2 then
			if var_7_1 < var_7_3.group_limit then
				return var_7_2
			end
		else
			return var_7_2
		end
	end

	return var_7_0[#var_7_0] or 0
end

function var_0_0.CheckBuyLimit(arg_8_0)
	local var_8_0 = arg_8_0:GetShopID()
	local var_8_1 = pg.shop_template[var_8_0]
	local var_8_2 = getProxy(ApartmentProxy):GetGiftShopCount(var_8_1.effect_args[1])

	if var_8_1.limit_args then
		local var_8_3 = var_8_1.limit_args[1]

		if type(var_8_3) == "table" and (var_8_3[1] == "dailycount" or var_8_3[1] == "count") and var_8_2 >= var_8_3[3] then
			return false
		end
	end

	if var_8_1.group_limit > 0 and var_8_2 >= var_8_1.group_limit then
		return false
	end

	return true
end

function var_0_0.NeedViewTip(arg_9_0)
	local var_9_0 = var_0_0.bindConfigTable()
	local var_9_1 = _.keys(var_9_0.get_id_list_by_ship_group_id)

	return _.any(var_9_1, function(arg_10_0)
		if arg_10_0 == 0 then
			return
		end

		if arg_9_0 and arg_9_0 > 0 and arg_10_0 ~= arg_9_0 then
			return
		end

		local var_10_0 = var_9_0.get_id_list_by_ship_group_id[arg_10_0]

		return _.any(var_10_0, function(arg_11_0)
			return Dorm3dGift.New({
				configId = arg_11_0
			}):GetShopID() and not getProxy(ApartmentProxy):isGiveGiftDone(arg_11_0) and Dorm3dGift.GetViewedFlag(arg_11_0) == 0
		end)
	end)
end

function var_0_0.NeedViewTipByGiftId(arg_12_0)
	return Dorm3dGift.GetViewedFlag(arg_12_0) == 0 and not getProxy(ApartmentProxy):isGiveGiftDone(arg_12_0)
end

function var_0_0.GetViewedFlag(arg_13_0)
	local var_13_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_13_0 .. "_dorm3dGiftViewed_" .. arg_13_0, 0)
end

function var_0_0.SetViewedFlag(arg_14_0)
	if var_0_0.GetViewedFlag(arg_14_0) > 0 then
		return
	end

	local var_14_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_14_0 .. "_dorm3dGiftViewed_" .. arg_14_0, 1)

	return true
end

return var_0_0

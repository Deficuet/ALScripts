local var_0_0 = class("Dorm3dFurniture", import("model.vo.BaseVO"))

var_0_0.TYPE = {
	DECORATION = 3,
	FLOOR = 2,
	COUCH = 5,
	BED = 4,
	WALLPAPER = 1,
	TABLE = 6
}
var_0_0.TYPE2NAME = {
	"dorm3d_furnitrue_type_wallpaper",
	"dorm3d_furnitrue_type_floor",
	"dorm3d_furnitrue_type_decoration",
	"dorm3d_furnitrue_type_bed",
	"dorm3d_furnitrue_type_couch",
	"dorm3d_furnitrue_type_table"
}

function var_0_0.bindConfigTable(arg_1_0)
	return pg.dorm3d_furniture_template
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	var_0_0.super.Ctor(arg_2_0, arg_2_1)

	arg_2_0.slotId = arg_2_0.slotId or 0
end

function var_0_0.GetSlotID(arg_3_0)
	return arg_3_0.slotId
end

function var_0_0.SetSlotID(arg_4_0, arg_4_1)
	arg_4_0.slotId = arg_4_1
end

function var_0_0.GetName(arg_5_0)
	return arg_5_0:getConfig("name")
end

function var_0_0.GetType(arg_6_0)
	return arg_6_0:getConfig("type")
end

function var_0_0.GetRarity(arg_7_0)
	return arg_7_0:getConfig("rarity")
end

function var_0_0.GetTargetSlots(arg_8_0)
	return arg_8_0:getConfig("target_slots")
end

function var_0_0.GetTargetSlotID(arg_9_0)
	local var_9_0 = arg_9_0:GetTargetSlots()[1]

	assert(var_9_0, "Missing Target Slot Dorm3dFurniture ID: " .. arg_9_0:GetConfigID())

	return var_9_0
end

function var_0_0.GetIcon(arg_10_0)
	return arg_10_0:getConfig("icon")
end

function var_0_0.GetModel(arg_11_0)
	return arg_11_0:getConfig("model")
end

function var_0_0.GetAcesses(arg_12_0)
	local var_12_0 = arg_12_0:getConfig("acesses")

	if var_12_0 == nil or var_12_0 == "" then
		return {}
	end

	return var_12_0
end

function var_0_0.GetShopID(arg_13_0)
	return arg_13_0:getConfig("shop_id")[1] or 0
end

function var_0_0.IsValuable(arg_14_0)
	return arg_14_0:getConfig("is_exclusive") == 1
end

function var_0_0.IsSpecial(arg_15_0)
	return arg_15_0:getConfig("is_special") == 1
end

function var_0_0.InShopTime(arg_16_0)
	local var_16_0 = arg_16_0:GetShopID()

	if var_16_0 == 0 then
		return true
	end

	local var_16_1 = pg.shop_template[var_16_0]

	return pg.TimeMgr.GetInstance():inTime(var_16_1.time)
end

function var_0_0.GetEndTime(arg_17_0)
	local var_17_0 = arg_17_0:GetShopID()

	if var_17_0 == 0 then
		return 0
	end

	local var_17_1 = pg.shop_template[var_17_0]

	assert(var_17_1, "Missing shopCfg " .. (var_17_0 or "NIL"))

	local var_17_2 = var_17_1.time

	if var_17_2 == "always" or var_17_2 == "stop" then
		return 0
	end

	return (pg.TimeMgr.GetInstance():parseTimeFromConfig(var_17_2[2]))
end

function var_0_0.NeedViewTip(arg_18_0)
	local var_18_0 = arg_18_0 and {
		getProxy(ApartmentProxy):getRoom(arg_18_0)
	} or underscore.values(getProxy(ApartmentProxy).roomData)

	return underscore.any(var_18_0, function(arg_19_0)
		return underscore.any(arg_19_0:GetFurnitures(), function(arg_20_0)
			return Dorm3dFurniture.GetViewedFlag(arg_20_0:GetConfigID()) == 0
		end)
	end)
end

function var_0_0.GetViewedFlag(arg_21_0)
	local var_21_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_21_0 .. "_dorm3dFurnitureViewed_" .. arg_21_0, 0)
end

function var_0_0.SetViewedFlag(arg_22_0)
	if var_0_0.GetViewedFlag(arg_22_0) > 0 then
		return
	end

	local var_22_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_22_0 .. "_dorm3dFurnitureViewed_" .. arg_22_0, 1)
	PlayerPrefs.Save()

	return true
end

function var_0_0.IsTimelimitShopTip(arg_23_0)
	local var_23_0 = arg_23_0 and {
		getProxy(ApartmentProxy):getRoom(arg_23_0)
	} or underscore.values(getProxy(ApartmentProxy).roomData)

	return underscore.any(var_23_0, function(arg_24_0)
		local var_24_0 = arg_24_0:GetFurnitures()
		local var_24_1 = pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_24_0:GetConfigID()] or {}

		return _.any(var_24_1, function(arg_25_0)
			local var_25_0 = Dorm3dFurniture.New({
				configId = arg_25_0
			})

			return var_25_0:GetEndTime() > 0 and var_25_0:InShopTime() and not _.detect(var_24_0, function(arg_26_0)
				return arg_26_0:GetConfigID() == arg_25_0
			end)
		end)
	end)
end

function var_0_0.RecordLastTimelimitShopFurniture()
	local var_27_0 = getProxy(PlayerProxy):getRawData().id
	local var_27_1 = PlayerPrefs.GetInt(var_27_0 .. "_dorm3dTimelimitFurniture", 0)
	local var_27_2 = var_27_1
	local var_27_3 = underscore.values(getProxy(ApartmentProxy).roomData)

	underscore.each(var_27_3, function(arg_28_0)
		local var_28_0 = pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_28_0:GetConfigID()] or {}

		_.each(var_28_0, function(arg_29_0)
			local var_29_0 = Dorm3dFurniture.New({
				configId = arg_29_0
			})

			if var_29_0:GetEndTime() > 0 and var_29_0:InShopTime() then
				var_27_2 = math.max(var_27_2, arg_29_0)
			end
		end)
	end)

	if var_27_2 <= var_27_1 then
		return
	end

	PlayerPrefs.SetInt(var_27_0 .. "_dorm3dTimelimitFurniture", var_27_2)
	PlayerPrefs.Save()
end

function var_0_0.IsOnceTimelimitShopTip()
	local var_30_0 = getProxy(PlayerProxy):getRawData().id
	local var_30_1 = PlayerPrefs.GetInt(var_30_0 .. "_dorm3dTimelimitFurniture", 0)
	local var_30_2 = underscore.values(getProxy(ApartmentProxy).roomData)

	return underscore.any(var_30_2, function(arg_31_0)
		local var_31_0 = arg_31_0:GetFurnitures()
		local var_31_1 = pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_31_0:GetConfigID()] or {}

		return _.any(var_31_1, function(arg_32_0)
			if arg_32_0 <= var_30_1 then
				return
			end

			local var_32_0 = Dorm3dFurniture.New({
				configId = arg_32_0
			})

			return var_32_0:GetEndTime() > 0 and var_32_0:InShopTime() and not _.detect(var_31_0, function(arg_33_0)
				return arg_33_0:GetConfigID() == arg_32_0
			end)
		end)
	end)
end

return var_0_0

local var_0_0 = class("ActivityRemasterAward", import("..BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1
	arg_1_0.configId = arg_1_1
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.activity_limit_item_guide_re
end

function var_0_0.GetRawDropData(arg_3_0)
	return {
		arg_3_0:getConfig("type"),
		arg_3_0:getConfig("drop_id"),
		arg_3_0:getConfig("count")
	}
end

function var_0_0.GetDrop(arg_4_0)
	if arg_4_0:IsShip() then
		local var_4_0 = arg_4_0:GetRawDropData()
		local var_4_1 = var_4_0[1]
		local var_4_2 = var_4_0[2]
		local var_4_3 = var_4_0[3]
		local var_4_4 = ShipGroup.getDefaultShipConfig(var_4_2)

		return Drop.Create({
			var_4_1,
			var_4_4.id,
			var_4_3
		})
	else
		return Drop.Create(arg_4_0:GetRawDropData())
	end
end

function var_0_0.GetOwnedCount(arg_5_0)
	local var_5_0 = arg_5_0:GetDrop()

	if arg_5_0:IsShip() then
		local var_5_1 = arg_5_0:GetRawDropData()
		local var_5_2 = var_5_1[1]
		local var_5_3 = var_5_1[2]
		local var_5_4 = var_5_1[3]

		return getProxy(BayProxy):getSameGroupShipCount(var_5_3)
	else
		return var_5_0:getOwnedCount()
	end
end

function var_0_0.GetWays(arg_6_0)
	return arg_6_0:getConfig("link_params")
end

function var_0_0.IsCollectionFurniture(arg_7_0)
	local var_7_0 = arg_7_0:GetRawDropData()
	local var_7_1 = var_7_0[1]
	local var_7_2 = var_7_0[2]
	local var_7_3 = var_7_0[3]

	if var_7_1 == DROP_TYPE_FURNITURE then
		return pg.furniture_data_template[var_7_2].type == Furniture.TYPE_COLLECTION
	end

	return false
end

function var_0_0.IsShip(arg_8_0)
	local var_8_0 = arg_8_0:GetRawDropData()
	local var_8_1 = var_8_0[1]
	local var_8_2 = var_8_0[2]
	local var_8_3 = var_8_0[3]

	return var_8_1 == DROP_TYPE_SHIP
end

function var_0_0.IsEquipmentSkin(arg_9_0)
	local var_9_0 = arg_9_0:GetRawDropData()
	local var_9_1 = var_9_0[1]
	local var_9_2 = var_9_0[2]
	local var_9_3 = var_9_0[3]

	return var_9_1 == DROP_TYPE_EQUIPMENT_SKIN
end

return var_0_0

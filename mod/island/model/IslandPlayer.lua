local var_0_0 = class("IslandPlayer", import("model.vo.PlayerAttire"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.id = arg_1_1.id

	arg_1_0:Flush(arg_1_1)

	arg_1_0.position = Vector3.zero
	arg_1_0.rotation = Vector3.zero

	arg_1_0:InitDressupData(arg_1_1)
end

function var_0_0.Flush(arg_2_0, arg_2_1)
	var_0_0.super.Flush(arg_2_0, arg_2_1)

	arg_2_0.name = arg_2_1.name
	arg_2_0.level = arg_2_1.level
	arg_2_0.mapId = arg_2_1.map_id
end

function var_0_0.GetModelId(arg_3_0)
	if arg_3_0:IsSelf() then
		return 0
	else
		local var_3_0 = arg_3_0:GetCurCommderId()

		return pg.island_dress_commander[var_3_0].model
	end
end

function var_0_0.GetDressByType(arg_4_0, arg_4_1)
	return arg_4_0.currentDressTypeDic[arg_4_1]
end

function var_0_0.GetHairFaceBodyDress(arg_5_0)
	local var_5_0 = arg_5_0:GetDressByType(IslandShipDressHelperNew.DressType.Hair)
	local var_5_1 = arg_5_0:GetDressByType(IslandShipDressHelperNew.DressType.Face)
	local var_5_2 = arg_5_0:GetDressByType(IslandShipDressHelperNew.DressType.Body)

	return var_5_0, var_5_1, var_5_2
end

function var_0_0.GetCurCommderId(arg_6_0)
	local var_6_0, var_6_1, var_6_2 = arg_6_0:GetHairFaceBodyDress()

	return (IslandShipDressHelper.GetCurCommanderId(var_6_0, var_6_1, var_6_2))
end

function var_0_0.IsSelf(arg_7_0)
	return arg_7_0.id == getProxy(PlayerProxy):getRawData().id
end

function var_0_0.GetName(arg_8_0)
	return arg_8_0.name
end

function var_0_0.GetLevel(arg_9_0)
	return arg_9_0.level
end

function var_0_0.GetIcon(arg_10_0)
	return pg.ship_skin_template[arg_10_0.character].painting
end

function var_0_0.GetLoaction(arg_11_0)
	if not arg_11_0.mapId or not pg.island_map[arg_11_0.mapId] then
		return ""
	end

	return pg.island_map[arg_11_0.mapId].name
end

function var_0_0.SetPosition(arg_12_0, arg_12_1)
	arg_12_0.position = arg_12_1
end

function var_0_0.SetRotation(arg_13_0, arg_13_1)
	arg_13_0.rotation = arg_13_1
end

function var_0_0.UpdateName(arg_14_0, arg_14_1)
	arg_14_0.name = arg_14_1
end

function var_0_0.InitDressupData(arg_15_0, arg_15_1)
	if arg_15_1.cur_dress then
		arg_15_0.currentDressTypeDic = {}

		for iter_15_0, iter_15_1 in ipairs(arg_15_1.cur_dress or {}) do
			arg_15_0.currentDressTypeDic[iter_15_1.type] = iter_15_1.id
		end
	end
end

function var_0_0.ChangeDressupData(arg_16_0, arg_16_1)
	arg_16_0.currentDressTypeDic = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_1 or {}) do
		arg_16_0.currentDressTypeDic[iter_16_1.type] = iter_16_1.id
	end
end

function var_0_0.IsInMap(arg_17_0, arg_17_1)
	return arg_17_0.mapId == arg_17_1
end

return var_0_0

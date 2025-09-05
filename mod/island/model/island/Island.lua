local var_0_0 = class("Island", import(".BaseIsland"))

var_0_0.EXP_ADD = "Island:EXP_ADD"

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1.public_data)

	arg_1_0.inventoryAgency = IslandInventoryAgency.New(arg_1_0, arg_1_1.private_data)
	arg_1_0.orderAgency = IslandOrderAgency.New(arg_1_0, arg_1_1.private_data)
	arg_1_0.shopAgency = IslandShopAgency.New(arg_1_0, arg_1_1.private_data)
	arg_1_0.seasonAgency = IslandSeasonAgency.New(arg_1_0, arg_1_1.private_data)
	arg_1_0.dressUpAgency = IslandDressUpAgency.New(arg_1_0, arg_1_1.private_data)
	arg_1_0.achievementAgency = IslandAchievementAgency.New(arg_1_0, arg_1_1.private_data)
	arg_1_0.globalBuffAgency = IslandGlobalBuffAgency.New(arg_1_0, arg_1_1.private_data)

	arg_1_0:GetAgoraAgency():InitPrivateData(arg_1_1.private_data)
	arg_1_0:AddDefaultAgoraData()
	arg_1_0:GetInventoryAgency():InitPrivateData(arg_1_1.public_data)
	arg_1_0:GetSignInAgency():InitPrivateData(arg_1_1.private_data)
	arg_1_0:GetAccessAgency():InitPrivateData(arg_1_1.private_data)
	arg_1_0:GetBuildingAgency():InitPrivateData(arg_1_1.private_data)
end

function var_0_0.IsPrivate(arg_2_0)
	return true
end

function var_0_0.AddExp(arg_3_0, arg_3_1)
	var_0_0.super.AddExp(arg_3_0, arg_3_1)
	arg_3_0:DispatchEvent(var_0_0.EXP_ADD)
end

function var_0_0.AddDefaultAgoraData(arg_4_0)
	local var_4_0 = pg.island_set.initial_furniture.key_value_varchar
	local var_4_1 = arg_4_0:GetAgoraAgency()

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		var_4_1:RawAddFurniture(IslandFurniture.New({
			id = iter_4_1[1],
			count = iter_4_1[2]
		}))
	end
end

function var_0_0.GetInventoryAgency(arg_5_0)
	return arg_5_0.inventoryAgency
end

function var_0_0.GetOrderAgency(arg_6_0)
	return arg_6_0.orderAgency
end

function var_0_0.GetShopAgency(arg_7_0)
	return arg_7_0.shopAgency
end

function var_0_0.GetSeasonAgency(arg_8_0)
	return arg_8_0.seasonAgency
end

function var_0_0.GetDressUpAgency(arg_9_0)
	return arg_9_0.dressUpAgency
end

function var_0_0.GetAchievementAgency(arg_10_0)
	return arg_10_0.achievementAgency
end

function var_0_0.GetGlobalBuffAgency(arg_11_0)
	return arg_11_0.globalBuffAgency
end

function var_0_0.UpdatePerDay(arg_12_0)
	var_0_0.super.UpdatePerDay(arg_12_0)
	arg_12_0:GetOrderAgency():UpdatePerDay()
	arg_12_0:GetTaskAgency():UpdatePerDay()
end

function var_0_0.UpdatePerSecond(arg_13_0)
	var_0_0.super.UpdatePerSecond(arg_13_0)
	arg_13_0:GetTaskAgency():UpdatePerSecond()
end

return var_0_0

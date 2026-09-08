local var_0_0 = class("ReversePacmanDorm", import("model.vo.Dorm.Dorm"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.reversePacmanShips = {}
end

function var_0_0.GetMapSize(arg_2_0)
	local var_2_0 = 0
	local var_2_1 = 0
	local var_2_2 = BackYardConst.MAX_REVERSE_PACMAN_MAP_SIZE
	local var_2_3 = var_2_2.x
	local var_2_4 = var_2_2.y

	return Vector4(var_2_0, var_2_1, var_2_3, var_2_4)
end

function var_0_0.GetPutFurnitureList(arg_3_0, arg_3_1)
	local var_3_0 = {}
	local var_3_1 = require("GameCfg.backyardTheme.theme_reverse_pacman")
	local var_3_2 = ReversePacmanThemeTemplate.New({
		id = -1,
		furniture_put_list = var_3_1.furnitures or {}
	}, 1, arg_3_0:GetMapSize())
	local var_3_3 = var_3_2 and var_3_2:GetAllFurniture() or {}

	for iter_3_0, iter_3_1 in pairs(var_3_3) do
		table.insert(var_3_0, iter_3_1)
	end

	table.sort(var_3_0, BackyardThemeFurniture._LoadWeight)

	return var_3_0
end

function var_0_0.GetBayShipOnFloor(arg_4_0, arg_4_1)
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in pairs(arg_4_0.reversePacmanShips) do
		table.insert(var_4_0, iter_4_1)
	end

	return var_4_0
end

function var_0_0.AddShip(arg_5_0, arg_5_1)
	table.insert(arg_5_0.reversePacmanShips, arg_5_1)
end

return var_0_0

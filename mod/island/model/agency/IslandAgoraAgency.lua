local var_0_0 = class("IslandAgoraAgency", import(".IslandBaseAgency"))

var_0_0.ADD_FURNITURE = "IslandAgoraAgency:ADD_FURNITURE"
var_0_0.AGORA_UPGRADE = "IslandAgoraAgency:AGORA_UPGRADE"
var_0_0.ADD_THEME = "IslandAgoraAgency:ADD_THEME"
var_0_0.DEL_THEME = "IslandAgoraAgency:DEL_THEME"
var_0_0.PLACEMENT_UPDATE = "IslandAgoraAgency:PLACEMENT_UPDATE"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.level = arg_1_1.agora_level or 1
	arg_1_0.maxLevel = table.getCount(IslandConst.AGORA_LEVEL_2_SIZE)
	arg_1_0.furnitures = {}
	arg_1_0.themes = {}
	arg_1_0.systemThemes = {}
	arg_1_0.isUpdateThemes = false

	for iter_1_0, iter_1_1 in ipairs(pg.island_furniture_theme.all) do
		local var_1_0 = pg.island_furniture_theme[iter_1_1]
		local var_1_1 = require("Mod.Island.Agora.theme.theme_" .. iter_1_1)
		local var_1_2 = IslandTheme.New(var_1_1)

		var_1_2:SetName(var_1_0.name)
		table.insert(arg_1_0.systemThemes, var_1_2)
	end

	arg_1_0.placedData = IslandTheme.New(arg_1_1)
	arg_1_0.capacityList = {
		pg.island_set.island_build_capacity.key_value_int
	}
	arg_1_0.consumeList = {}

	for iter_1_2, iter_1_3 in ipairs(pg.island_set.island_build_expansion.key_value_varchar) do
		table.insert(arg_1_0.capacityList, iter_1_3[3])
		table.insert(arg_1_0.consumeList, iter_1_3[2])
	end
end

function var_0_0.InitPrivateData(arg_2_0, arg_2_1)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.furniture_list) do
		table.insert(var_2_0, IslandFurniture.New(iter_2_1))
	end

	local var_2_1 = pg.island_set.island_pre_placement.key_value_varchar

	if var_2_1[1] then
		local var_2_2 = var_2_1[1][1]

		if _.all(var_2_0, function(arg_3_0)
			return arg_3_0.id ~= var_2_2
		end) then
			table.insert(var_2_0, IslandFurniture.New({
				count = 1,
				id = var_2_2
			}))
		end
	end

	if var_2_1[2] then
		local var_2_3 = var_2_1[2][1]

		if _.all(var_2_0, function(arg_4_0)
			return arg_4_0.id ~= var_2_3
		end) then
			table.insert(var_2_0, IslandFurniture.New({
				count = 1,
				id = var_2_3
			}))
		end
	end

	arg_2_0.furnitures = var_2_0
end

function var_0_0.RawAddFurniture(arg_5_0, arg_5_1, arg_5_2)
	assert(isa(arg_5_1, IslandFurniture), "IslandAgoraAgency:AddFurniture: furniture must be IslandFurniture")

	local var_5_0 = _.detect(arg_5_0.furnitures, function(arg_6_0)
		return arg_6_0.id == arg_5_1.id
	end)

	if var_5_0 then
		var_5_0.count = var_5_0.count + 1
	else
		table.insert(arg_5_0.furnitures, arg_5_1)
	end
end

function var_0_0.AddFurniture(arg_7_0, arg_7_1, arg_7_2)
	assert(isa(arg_7_1, IslandFurniture), "IslandAgoraAgency:AddFurniture: furniture must be IslandFurniture")

	local var_7_0 = _.detect(arg_7_0.furnitures, function(arg_8_0)
		return arg_8_0.id == arg_7_1.id
	end)

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandFurnitureAdd(arg_7_1.id, arg_7_2 or ""))

	if var_7_0 then
		var_7_0.count = var_7_0.count + 1

		arg_7_0:DispatchEvent(var_0_0.ADD_FURNITURE, var_7_0)
	else
		IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.FURNITURE, 0, 1)

		local var_7_1 = pg.island_furniture_template[arg_7_1.id].type

		IslandAchievementHelper.UpdateRecordWithAdd(IslandAchievementType.FURNITURE, var_7_1, 1)
		table.insert(arg_7_0.furnitures, arg_7_1)
		arg_7_0:DispatchEvent(var_0_0.ADD_FURNITURE, arg_7_1)
	end
end

function var_0_0.GetSystemThemes(arg_9_0)
	return arg_9_0.systemThemes
end

function var_0_0.AddTheme(arg_10_0, arg_10_1)
	table.insert(arg_10_0.themes, arg_10_1)
	arg_10_0:DispatchEvent(var_0_0.ADD_THEME, arg_10_1)
end

function var_0_0.DelTheme(arg_11_0, arg_11_1)
	local var_11_0 = _.detect(arg_11_0.themes, function(arg_12_0)
		return arg_12_0.id == arg_11_1
	end)

	if var_11_0 then
		table.removebyvalue(arg_11_0.themes, var_11_0)
		arg_11_0:DispatchEvent(var_0_0.DEL_THEME, arg_11_1)
	end
end

function var_0_0.GetThemes(arg_13_0)
	return arg_13_0.themes
end

function var_0_0.SetThemes(arg_14_0, arg_14_1)
	arg_14_0.themes = arg_14_1

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.themes) do
		arg_14_0:DispatchEvent(var_0_0.ADD_THEME, iter_14_1)
	end

	arg_14_0.isUpdateThemes = true
end

function var_0_0.IsUpdateThemes(arg_15_0)
	return arg_15_0.isUpdateThemes
end

function var_0_0.GetFurnitures(arg_16_0)
	return arg_16_0.furnitures
end

function var_0_0.GetFurnituresByType(arg_17_0, arg_17_1)
	return underscore.select(arg_17_0.furnitures, function(arg_18_0)
		return pg.island_furniture_template[arg_18_0.id].type == arg_17_1
	end)
end

function var_0_0.GetPlacedData(arg_19_0)
	return arg_19_0.placedData
end

function var_0_0.GetCapacity(arg_20_0)
	return arg_20_0.capacityList[arg_20_0.level] or 0
end

function var_0_0.GetNextCapacity(arg_21_0)
	if not arg_21_0:CanUpgrade() then
		return arg_21_0:GetCapacity()
	end

	return arg_21_0.capacityList[arg_21_0.level + 1] or 0
end

function var_0_0.GetLevel(arg_22_0)
	return arg_22_0.level
end

function var_0_0.CanUpgrade(arg_23_0)
	return arg_23_0.level < arg_23_0.maxLevel
end

function var_0_0.GetUpgradeConsume(arg_24_0)
	if not arg_24_0:CanUpgrade() then
		return nil
	end

	local var_24_0 = arg_24_0.consumeList[arg_24_0.level] or {}

	return Drop.New({
		type = var_24_0[1],
		id = var_24_0[2],
		count = var_24_0[3]
	})
end

function var_0_0.Upgrade(arg_25_0)
	arg_25_0.level = arg_25_0.level + 1

	local var_25_0 = arg_25_0:GetCapacity()

	arg_25_0:DispatchEvent(var_0_0.AGORA_UPGRADE, arg_25_0.level, var_25_0)
end

function var_0_0.UpdatePlacedData(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.placedData = IslandTheme.New({
		placed_data = arg_26_1
	})

	if not arg_26_2 then
		arg_26_0:DispatchEvent(var_0_0.PLACEMENT_UPDATE, arg_26_0.placedData)
	end
end

return var_0_0

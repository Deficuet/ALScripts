local var_0_0 = class("IslandShipSkill", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.level = arg_1_1.level or 1
	arg_1_0.maxLevel = 1

	arg_1_0:InitMaxLevel()

	arg_1_0.lock = true
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_chara_skill
end

function var_0_0.GetName(arg_3_0)
	return arg_3_0:getConfig("name")
end

function var_0_0.GetIcon(arg_4_0)
	return arg_4_0:getConfig("icon")
end

function var_0_0.Unlock(arg_5_0)
	arg_5_0.lock = false

	if arg_5_0.level <= 0 then
		arg_5_0.level = 1
	end
end

function var_0_0.IsUnlock(arg_6_0)
	return not arg_6_0.lock
end

function var_0_0.GetLevel(arg_7_0)
	return arg_7_0.level
end

function var_0_0.IsMaxLevel(arg_8_0)
	return arg_8_0.level >= arg_8_0.maxLevel
end

function var_0_0.InitMaxLevel(arg_9_0)
	arg_9_0.maxLevel = #arg_9_0:getConfig("skill_effect")
end

function var_0_0.Upgrade(arg_10_0)
	if arg_10_0:IsMaxLevel() then
		return
	end

	arg_10_0.level = arg_10_0.level + 1
end

function var_0_0.GetLastEffectIds(arg_11_0)
	return arg_11_0:getConfig("skill_effect")[arg_11_0.level - 1] or {}
end

function var_0_0.GetEffectIds(arg_12_0)
	return arg_12_0:getConfig("skill_effect")[arg_12_0.level] or {}
end

function var_0_0.GetUnlockShipEffectIds(arg_13_0)
	if arg_13_0.lock then
		return {}
	end

	return underscore.select(arg_13_0:GetEffectIds(), function(arg_14_0)
		return not IslandBuffType.IsGlobalType(pg.island_buff_template[arg_14_0].buff_type)
	end)
end

function var_0_0.GetEffectDesc(arg_15_0)
	if arg_15_0.lock then
		return ""
	end

	local var_15_0 = Clone(arg_15_0:getConfig("desc"))

	for iter_15_0, iter_15_1 in ipairs(arg_15_0:getConfig("desc_add")) do
		var_15_0 = string.gsub(var_15_0, "$" .. iter_15_0, iter_15_1[arg_15_0.level][1])
	end

	return var_15_0
end

function var_0_0.IsEffectiveInPlace(arg_16_0, arg_16_1)
	return underscore.any(arg_16_0:GetEffectIds(), function(arg_17_0)
		local var_17_0 = pg.island_buff_template[arg_17_0]

		return IslandBuffType.GetLimitPlaceTypes(var_17_0.buff_type) and table.contains(var_17_0.type_use[1], arg_16_1)
	end)
end

function var_0_0.IsEffectiveInRest(arg_18_0, arg_18_1)
	return underscore.any(arg_18_0:GetEffectIds(), function(arg_19_0)
		local var_19_0 = pg.island_buff_template[arg_19_0]

		return IslandBuffType.GetLimitRestaurantTypes(var_19_0.buff_type) and table.contains(var_19_0.type_use[1], arg_18_1)
	end)
end

function var_0_0.GetUpgradeMaterial(arg_20_0)
	local var_20_0 = arg_20_0:getConfig("material")
	local var_20_1 = {}

	for iter_20_0, iter_20_1 in ipairs(var_20_0[arg_20_0.level] or {}) do
		table.insert(var_20_1, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_20_1[1],
			count = iter_20_1[2]
		})
	end

	return var_20_1
end

return var_0_0

local var_0_0 = class("IslandDropDescribeInfo", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.drop = arg_1_1
end

function var_0_0.GetName(arg_2_0)
	return arg_2_0.drop:getName() or ""
end

function var_0_0.GetDes(arg_3_0)
	return arg_3_0.drop.desc or ""
end

function var_0_0.GetOwnCount(arg_4_0)
	return arg_4_0.drop:getOwnedCount()
end

function var_0_0.GetDrop(arg_5_0)
	return arg_5_0.drop
end

function var_0_0.GetAcquiringWay(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = arg_6_0:GetDropConfig().jump_page or {}

	var_6_1 = var_6_1 == "" and {} or var_6_1

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		table.insert(var_6_0, iter_6_1)
	end

	return var_6_0
end

function var_0_0.IsTecUnlocked(arg_7_0)
	local var_7_0 = arg_7_0:GetDropConfig()

	if var_7_0.tech_id == 0 or var_7_0.tech_id == nil then
		return true
	end

	return getProxy(IslandProxy):GetIsland():GetTechnologyAgency():IsUnlockTech(var_7_0.tech_id)
end

function var_0_0.GetTecDes(arg_8_0)
	local var_8_0 = arg_8_0:GetDropConfig().tech_id

	if var_8_0 == 0 then
		return ""
	end

	local var_8_1 = pg.island_technology_template[var_8_0]
	local var_8_2 = IslandTechBelong.Names[var_8_1.tech_belong]
	local var_8_3 = var_8_1.tech_name

	return i18n("island_information_tech", var_8_2, var_8_3)
end

function var_0_0.GetDropConfig(arg_9_0)
	return arg_9_0.drop:getConfigTable()
end

return var_0_0

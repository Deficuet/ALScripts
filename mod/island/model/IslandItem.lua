local var_0_0 = class("IslandItem", import("model.vo.BaseVO"))

var_0_0.TYPE_MATERIAL = 1
var_0_0.TYPE_PROP = 2
var_0_0.TYPE_SPECIAL_PROP = 3
var_0_0.TYPE_SHIP_EXP_BOOK = 5
var_0_0.GOLD_ID = 1

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.count = arg_1_1.num or arg_1_1.number or arg_1_1.count or 1
	arg_1_0.time = arg_1_1.time or 0
end

function var_0_0.GetNumberOfSlotsOccupied(arg_2_0)
	if not arg_2_0:IsMaterial() then
		return 0
	end

	if arg_2_0.count <= 0 then
		return 0
	end

	local var_2_0 = arg_2_0:getConfig("group_max")

	if var_2_0 == 0 then
		return 1
	else
		return math.ceil(arg_2_0.count / var_2_0)
	end
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.island_item_data_template
end

function var_0_0.GetCount(arg_4_0)
	return arg_4_0.count
end

function var_0_0.CanRemove(arg_5_0, arg_5_1)
	return arg_5_1 <= arg_5_0:GetCount()
end

function var_0_0.ReduceCount(arg_6_0, arg_6_1)
	arg_6_0.count = arg_6_0.count - arg_6_1
end

function var_0_0.IncreaseCount(arg_7_0, arg_7_1)
	arg_7_0.count = arg_7_0.count + arg_7_1
end

function var_0_0.IsNotOwned(arg_8_0)
	return arg_8_0.count <= 0
end

function var_0_0.IsInvitationLetter(arg_9_0)
	return var_0_0.StaticGetUsageType(arg_9_0.configId) == IslandItemUsage.usage_island_invitation
end

function var_0_0.GetName(arg_10_0)
	return arg_10_0:getConfig("name")
end

function var_0_0.GetType(arg_11_0)
	return arg_11_0:getConfig("type")
end

function var_0_0.GetRarity(arg_12_0)
	return arg_12_0:getConfig("rarity")
end

function var_0_0.GetDesc(arg_13_0)
	return arg_13_0:getConfig("desc")
end

function var_0_0.GetIcon(arg_14_0)
	return arg_14_0:getConfig("icon")
end

function var_0_0.GetOwnTime(arg_15_0)
	return arg_15_0.time
end

function var_0_0.IsMaterial(arg_16_0)
	return arg_16_0:GetType() == var_0_0.TYPE_MATERIAL
end

function var_0_0.IsProp(arg_17_0)
	return arg_17_0:GetType() == var_0_0.TYPE_PROP or arg_17_0:GetType() == var_0_0.TYPE_SHIP_EXP_BOOK
end

function var_0_0.IsSpecialProp(arg_18_0)
	return arg_18_0:GetType() == var_0_0.TYPE_SPECIAL_PROP
end

function var_0_0.GetMaterialFacility(arg_19_0)
	if not arg_19_0:IsMaterial() then
		return ""
	end

	return ""
end

function var_0_0.CanConvert(arg_20_0)
	return arg_20_0:getConfig("convert") == 1
end

function var_0_0.GetConvertPt(arg_21_0)
	return arg_21_0:getConfig("pt_num")
end

function var_0_0.StaticGetMapUsageList(arg_22_0)
	return pg.island_item_data_template.get_id_list_by_usage[arg_22_0] or {}
end

function var_0_0.StaticGetUsageArg(arg_23_0)
	return pg.island_item_data_template[arg_23_0].usage_arg
end

function var_0_0.StaticGetUsageType(arg_24_0)
	return pg.island_item_data_template[arg_24_0].usage
end

function var_0_0.GetAcquiringWay(arg_25_0)
	local var_25_0 = {}
	local var_25_1 = pg.island_item_data_template[arg_25_0.configId]

	for iter_25_0, iter_25_1 in ipairs(var_25_1.jump_page) do
		table.insert(var_25_0, iter_25_1)
	end

	return var_25_0
end

function var_0_0.GetUseArg(arg_26_0)
	return var_0_0.StaticGetUsageArg(arg_26_0.configId)
end

return var_0_0

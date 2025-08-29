local var_0_0 = class("IslandUnitVO")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.modelId = arg_1_1.modelId
	arg_1_0.type = arg_1_1.type
	arg_1_0.name = arg_1_1.name
	arg_1_0.index = arg_1_1.index
	arg_1_0.genType = defaultValue(arg_1_1.genType, IslandConst.UNIT_GEN_TYPE_STATIC)
	arg_1_0.isDynamic = arg_1_0.genType == IslandConst.UNIT_GEN_TYPE_DYNAMIC
	arg_1_0.showCondition = defaultValue(arg_1_1.showCondition, {})
	arg_1_0.hideCondition = defaultValue(arg_1_1.hideCondition, {})
	arg_1_0.position = BuildVector3(arg_1_1.position)
	arg_1_0.rotation = BuildVector3(arg_1_1.rotation)
	arg_1_0.scale = BuildVector3(arg_1_1.scale)
	arg_1_0.behaviourTree = arg_1_1.behaviourTree
end

function var_0_0.GetType(arg_2_0)
	return arg_2_0.type
end

function var_0_0.IsPlayer(arg_3_0)
	return arg_3_0.type == IslandConst.UNIT_TYPE_PLAYER
end

function var_0_0.IsGift(arg_4_0)
	return arg_4_0.genType == IslandConst.UNIT_GEN_TYPE_GIFT
end

function var_0_0.Interactable(arg_5_0)
	return arg_5_0.type == IslandConst.UNIT_TYPE_ITEM_INTERACT
end

function var_0_0.GetAssetPath(arg_6_0)
	local var_6_0

	if arg_6_0.type == IslandConst.UNIT_TYPE_CHAR or arg_6_0.type == IslandConst.UNIT_TYPE_PLAYER or arg_6_0.type == IslandConst.UNIT_TYPE_VISITOR or arg_6_0.type == IslandConst.UNIT_TYPE_SYSTEM or arg_6_0.type == IslandConst.UNIT_TYPE_STROLL or arg_6_0.type == IslandConst.UNIT_TYPE_MANAGE_CHARA or arg_6_0.type == IslandConst.UNIT_TYPE_MANAGE_CUSTOMER or arg_6_0.type == IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION or arg_6_0.type == IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION then
		assert(pg.island_unit_character[arg_6_0.modelId], arg_6_0.modelId)

		var_6_0 = pg.island_unit_character[arg_6_0.modelId].model
	elseif arg_6_0.type == IslandConst.UNIT_TYPE_ITEM or arg_6_0.type == IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT or arg_6_0.type == IslandConst.UNIT_TYPE_ITEM_HANDLE_PLANTING or arg_6_0.type == IslandConst.UNIT_TYPE_ITEM_PRODUCT_ITEM or arg_6_0.type == IslandConst.UNIT_TYPE_ITEM_GATHER_ITEM or arg_6_0.type == IslandConst.UNIT_TYPE_ITEM_WILD_COLLECT_ITEM or arg_6_0.type == IslandConst.UNIT_TYPE_MANAGE_ITEM then
		var_6_0 = pg.island_unit_item[arg_6_0.modelId].model
	elseif arg_6_0.type == IslandConst.UNIT_TYPE_ITEM_INTERACT then
		var_6_0 = pg.island_unit_interactive_item[arg_6_0.modelId].model
	end

	assert(var_6_0)

	return string.lower(var_6_0)
end

function var_0_0.GetBehaviourTree(arg_7_0)
	return arg_7_0.behaviourTree
end

function var_0_0.GetAnimator(arg_8_0)
	if arg_8_0.type == IslandConst.UNIT_TYPE_PLAYER or arg_8_0.type == IslandConst.UNIT_TYPE_VISITOR or arg_8_0.type == IslandConst.UNIT_TYPE_CHAR or arg_8_0.type == IslandConst.UNIT_TYPE_STROLL or arg_8_0.type == IslandConst.UNIT_TYPE_MANAGE_CHARA or arg_8_0.type == IslandConst.UNIT_TYPE_MANAGE_CUSTOMER or arg_8_0.type == IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION or arg_8_0.type == IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION then
		return pg.island_unit_character[arg_8_0.modelId].animator
	elseif arg_8_0.type == IslandConst.UNIT_TYPE_SYSTEM then
		return pg.island_unit_character[arg_8_0.modelId].animator
	end

	warning("目前只有角色需要动态获取动画状态机")
end

function var_0_0.GetShowCondition(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.showCondition) do
		table.insert(var_9_0, iter_9_1)
	end

	return var_9_0
end

function var_0_0.GetHideCondition(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.hideCondition) do
		table.insert(var_10_0, iter_10_1)
	end

	return var_10_0
end

return var_0_0

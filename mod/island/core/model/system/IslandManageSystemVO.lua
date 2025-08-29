local var_0_0 = class("IslandManageSystemVO", import(".IslandSystemVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.id = arg_1_1
	arg_1_0.name = "_system_manage_" .. arg_1_0.id
	arg_1_0.restaurant = arg_1_2
end

function var_0_0.GetType(arg_2_0)
	return IslandConst.SYSTEM_TYPE_MANAGE
end

function var_0_0.GetBehaviourTree(arg_3_0)
	return "island/nodecanvas/system/system_manage_place"
end

function var_0_0.GetUnits(arg_4_0, arg_4_1)
	local var_4_0 = {}

	arg_4_0.assistants = {}

	if arg_4_1 then
		arg_4_0.assistants = arg_4_1
	else
		arg_4_0.assistants = arg_4_0.restaurant:GetAssistants()
	end

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.assistants) do
		local var_4_1 = iter_4_1.id or iter_4_1.post_id
		local var_4_2 = iter_4_1.shipId or iter_4_1.ship_id

		if var_4_2 ~= 0 then
			local var_4_3 = pg.island_manage_assistant[var_4_1].birthplace
			local var_4_4 = pg.island_world_objects[var_4_3]
			local var_4_5

			if var_4_2 == 1 then
				var_4_5 = IslandUnitVO.New({
					behaviourTree = "island/nodecanvas/system/system_manage_assistant_chicken",
					id = var_4_2,
					modelId = pg.island_chara_template[var_4_2].unit_id,
					type = IslandConst.UNIT_TYPE_MANAGE_CHARA,
					name = "system_unit" .. var_4_2,
					position = var_4_4.param.position,
					rotation = var_4_4.param.rotation,
					scale = Vector3.one
				})
			else
				var_4_5 = IslandUnitVO.New({
					behaviourTree = "island/nodecanvas/system/system_manage_assistant",
					id = var_4_2,
					modelId = pg.island_chara_template[var_4_2].unit_id,
					type = IslandConst.UNIT_TYPE_MANAGE_CHARA,
					name = "system_unit" .. var_4_2,
					position = var_4_4.param.position,
					rotation = var_4_4.param.rotation,
					scale = Vector3.one
				})
			end

			table.insert(var_4_0, var_4_5)
		end
	end

	local var_4_6 = arg_4_0.restaurant:getConfig("customer_slot")
	local var_4_7 = pg.island_set.island_manage_customer_list.key_value_varchar

	for iter_4_2, iter_4_3 in ipairs(var_4_6) do
		local var_4_8 = iter_4_3[1]
		local var_4_9 = iter_4_3[2]
		local var_4_10 = pg.island_world_objects[var_4_8]
		local var_4_11 = pg.island_world_objects[var_4_9]
		local var_4_12 = var_4_7[math.random(#var_4_7)]
		local var_4_13 = IslandUnitVO.New({
			behaviourTree = "island/nodecanvas/system/system_manage_customer",
			id = var_4_8,
			modelId = var_4_12,
			type = IslandConst.UNIT_TYPE_MANAGE_CUSTOMER,
			name = "system_unit" .. var_4_8,
			position = var_4_10.param.position,
			rotation = var_4_10.param.rotation,
			scale = Vector3.one
		})

		table.insert(var_4_0, var_4_13)

		local var_4_14 = IslandUnitVO.New({
			behaviourTree = "",
			id = var_4_9,
			modelId = var_4_11.unitId,
			type = IslandConst.UNIT_TYPE_MANAGE_ITEM,
			name = "system_unit" .. var_4_9,
			position = var_4_11.param.position,
			rotation = var_4_11.param.rotation,
			scale = Vector3.one
		})

		table.insert(var_4_0, var_4_14)
	end

	return var_4_0
end

function var_0_0.GetPostUnitNodeList(arg_5_0)
	local var_5_0 = System.Collections.Generic.List_IslandUnitNode()

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.assistants) do
		local var_5_1 = iter_5_1.id or iter_5_1.post_id

		if (iter_5_1.shipId or iter_5_1.ship_id) ~= 0 then
			local var_5_2

			var_5_2.unitId, var_5_2 = pg.island_manage_assistant[var_5_1].birthplace, IslandUnitNode.New()
			var_5_2.unitType = IslandConst.UNIT_LIST_OBJ

			var_5_0:Add(var_5_2)
		end
	end

	return var_5_0
end

function var_0_0.GetAssistantUnitNodeList(arg_6_0)
	local var_6_0 = System.Collections.Generic.List_IslandUnitNode()

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.assistants) do
		local var_6_1 = iter_6_1.shipId or iter_6_1.ship_id

		if var_6_1 ~= 0 then
			local var_6_2 = IslandUnitNode.New()

			var_6_2.unitId = var_6_1
			var_6_2.unitType = IslandConst.UNIT_LIST_MANAGE

			var_6_0:Add(var_6_2)
		end
	end

	return var_6_0
end

function var_0_0.GetCustomerUnitNodeList(arg_7_0)
	local var_7_0 = System.Collections.Generic.List_IslandUnitNode()
	local var_7_1 = arg_7_0.restaurant:getConfig("customer_slot")

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		local var_7_2

		var_7_2.unitId, var_7_2 = iter_7_1[1], IslandUnitNode.New()
		var_7_2.unitType = IslandConst.UNIT_LIST_MANAGE

		var_7_0:Add(var_7_2)
	end

	return var_7_0
end

function var_0_0.GetFoodUnitIds(arg_8_0)
	local var_8_0 = {}
	local var_8_1 = arg_8_0.restaurant:getConfig("customer_slot")

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		local var_8_2 = iter_8_1[2]

		table.insert(var_8_0, var_8_2)
	end

	return var_8_0
end

function var_0_0.GetStatus(arg_9_0)
	return arg_9_0.restaurant:GetStatus()
end

function var_0_0.GetRestId(arg_10_0)
	return arg_10_0.restaurant.id
end

function var_0_0.GetPostList(arg_11_0)
	return arg_11_0.restaurant:GetAssistants()
end

return var_0_0

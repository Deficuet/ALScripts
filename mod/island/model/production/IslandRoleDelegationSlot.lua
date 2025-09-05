local var_0_0 = class("IslandRoleDelegationSlot", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.buildId = arg_1_1
	arg_1_0.id = arg_1_2.id
	arg_1_0.part_list = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_2.part_list) do
		table.insert(arg_1_0.part_list, iter_1_1)
	end

	arg_1_0.formula_dic = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_2.formula_list or {}) do
		arg_1_0.formula_dic[iter_1_3.id] = iter_1_3.num
	end

	arg_1_0.isSelf = arg_1_3
end

function var_0_0.AddAnimal(arg_2_0, arg_2_1)
	table.insert(arg_2_0.part_list, arg_2_1)
end

function var_0_0.GetFormulaId(arg_3_0)
	return arg_3_0.islandRoleDelegationData and arg_3_0.islandRoleDelegationData.formula_id or arg_3_0.islandRoleDelegationReward and arg_3_0.islandRoleDelegationReward.formula_id
end

function var_0_0.AddFormulaNum(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.formula_dic[arg_4_1.formula_id] or 0

	arg_4_0.formula_dic[arg_4_1.formula_id] = var_4_0 + arg_4_1.num
end

function var_0_0.GetFromulaTatalCount(arg_5_0, arg_5_1)
	return arg_5_0.formula_dic[arg_5_1] or 0
end

function var_0_0.bindConfigTable(arg_6_0)
	return pg.island_production_slot
end

function var_0_0.UpdateSlotRoleData(arg_7_0, arg_7_1)
	if arg_7_1 then
		if arg_7_0.islandRoleDelegationData then
			arg_7_0.islandRoleDelegationData:UpdateData(arg_7_1)
		else
			arg_7_0.islandRoleDelegationData = IslandRoleDelegationData.New(arg_7_1)
		end
	else
		arg_7_0.islandRoleDelegationData = nil
	end
end

function var_0_0.UpdateSlotRewardData(arg_8_0, arg_8_1)
	if arg_8_1 then
		if arg_8_0.islandRoleDelegationReward then
			arg_8_0.islandRoleDelegationReward:UpdateData(arg_8_1)
		else
			arg_8_0.islandRoleDelegationReward = IslandRoleDelegationReward.New(arg_8_1)
		end
	else
		arg_8_0.islandRoleDelegationReward = nil
	end
end

function var_0_0.GetSlotRoleData(arg_9_0)
	return arg_9_0.islandRoleDelegationData
end

function var_0_0.GetSlotRewardData(arg_10_0)
	return arg_10_0.islandRoleDelegationReward
end

function var_0_0.CanStartDelegation(arg_11_0)
	return arg_11_0.islandRoleDelegationData == nil and arg_11_0.islandRoleDelegationReward == nil
end

function var_0_0.Clear(arg_12_0)
	return
end

function var_0_0.UpdatePerSecond(arg_13_0)
	if not arg_13_0.islandRoleDelegationData then
		return
	end

	if arg_13_0.islandRoleDelegationData:CheckDelegationIsEnd() then
		if arg_13_0.isSelf then
			pg.m02:sendNotification(GAME.ISLAND_FINISH_DELEGATION, {
				build_id = arg_13_0.buildId,
				area_id = arg_13_0.id
			})
			arg_13_0.islandRoleDelegationData:SetIsSend(true)
		else
			local var_13_0 = getProxy(IslandProxy):GetSharedIsland()
			local var_13_1 = var_13_0:GetBuildingAgency():GetBuilding(arg_13_0.buildId)
			local var_13_2 = arg_13_0.islandRoleDelegationData.formula_id
			local var_13_3 = arg_13_0.islandRoleDelegationData.ship_id

			var_13_1:UpdateDeleationRewardDataBySlotId(arg_13_0.id, {
				formula_id = var_13_2
			})
			var_13_1:UpdateDeleationRoleDataBySlotId(arg_13_0.id, nil)
			var_13_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
				remainReward = true,
				build_id = arg_13_0.buildId,
				ship_id = var_13_3,
				area_id = arg_13_0.id
			})
		end
	end
end

function var_0_0.GetRoleDelegateFinishTime(arg_14_0)
	if arg_14_0.islandRoleDelegationReward then
		return 0
	end

	if arg_14_0.islandRoleDelegationData then
		return arg_14_0.islandRoleDelegationData:GetFinishTime()
	end

	return -1
end

function var_0_0.GetRoleShipData(arg_15_0)
	if arg_15_0.islandRoleDelegationData then
		return {
			ship_id = arg_15_0.islandRoleDelegationData.ship_id,
			area_id = arg_15_0.id
		}
	end

	return nil
end

function var_0_0.GetPartList(arg_16_0)
	return arg_16_0.part_list or {}
end

return var_0_0

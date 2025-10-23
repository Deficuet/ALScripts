local var_0_0 = class("IslandAddDelegationCommand", pm.SimpleCommand)

var_0_0.END_DELEGATION = "IslandAddDelegationCommand:END_DELEGATION"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.build_id
	local var_1_2 = var_1_0.area_id
	local var_1_3 = var_1_0.add_num
	local var_1_4 = var_1_0.extraCost or 0
	local var_1_5 = getProxy(IslandProxy):GetIsland()
	local var_1_6 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_1_7 = var_1_5:GetBuildingAgency()

	pg.ConnectionMgr.GetInstance():Send(21537, {
		build_id = var_1_1,
		area_id = var_1_2,
		add_num = var_1_3
	}, 21538, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_7:GetBuilding(var_1_1):GetDelegationSlotData(var_1_2)
			local var_2_1 = var_2_0:GetSlotRoleData()

			var_2_1:AddCostList(arg_2_0.cost_time_list)
			var_2_1:AddExtraList(arg_2_0.times_extra)

			local var_2_2 = var_2_0:GetFormulaId()
			local var_2_3 = pg.island_formula[var_2_2]
			local var_2_4 = var_2_3.commission_cost

			for iter_2_0, iter_2_1 in ipairs(var_2_4) do
				var_1_6:RemoveItem(iter_2_1[1], (iter_2_1[2] + var_1_4) * var_1_3)
			end

			local var_2_5 = var_1_5:GetCharacterAgency():GetShipById(var_2_1.ship_id)
			local var_2_6 = var_2_5:GetCurrentEnergy() - var_2_3.stamina_cost * var_1_3

			var_2_5:UpdateEnergy(var_2_6)
			var_2_5:UpdateEnergyBeginRecoverTime(var_2_1:GetFinishTime())
			arg_1_0:sendNotification(GAME.ISLAND_FINISH_DELEGATION_DONE, {
				slotId = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

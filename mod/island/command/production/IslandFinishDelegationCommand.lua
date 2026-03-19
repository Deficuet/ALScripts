local var_0_0 = class("IslandFinishDelegationCommand", pm.SimpleCommand)

var_0_0.END_DELEGATION = "IslandFinishDelegationCommand:END_DELEGATION"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.build_id
	local var_1_2 = var_1_0.area_id
	local var_1_3 = getProxy(IslandProxy):GetIsland()
	local var_1_4 = var_1_3:GetBuildingAgency()
	local var_1_5 = var_1_3:GetCharacterAgency()

	pg.ConnectionMgr.GetInstance():Send(21503, {
		build_id = var_1_1,
		area_id = var_1_2
	}, 21504, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_4:GetBuilding(var_1_1)

			if arg_2_0.return_num and arg_2_0.return_num > 0 then
				local var_2_1 = var_2_0:GetDelegationSlotData(var_1_2):GetFormulaId()
				local var_2_2 = pg.island_formula[var_2_1]
				local var_2_3 = var_2_0:GetDelegationSlotData(var_1_2):GetSlotRoleData():GetReturnExtraNum(arg_2_0.return_num)
				local var_2_4 = var_2_2.commission_cost
				local var_2_5 = {}

				for iter_2_0, iter_2_1 in ipairs(var_2_4) do
					table.insert(var_2_5, {
						type = DROP_TYPE_ISLAND_ITEM,
						id = iter_2_1[1],
						number = iter_2_1[2] * arg_2_0.return_num + var_2_3
					})
				end

				local var_2_6 = IslandDropHelper.AddItems({
					drop_list = var_2_5
				})
			end

			var_2_0:UpdateDeleationRoleDataBySlotId(var_1_2, nil)

			local var_2_7

			if #arg_2_0.award > 0 then
				local var_2_8 = arg_2_0.award[1]

				var_2_7 = true

				var_2_0:UpdateDeleationRewardDataBySlotId(var_1_2, var_2_8)
			end

			local var_2_9 = var_1_5:GetShipById(arg_2_0.ship_id)

			var_2_9:AddExp(arg_2_0.add_exp)

			local var_2_10

			if arg_2_0.return_num ~= 0 then
				if arg_2_0.add_exp > 0 then
					var_2_10 = {
						addShipId = arg_2_0.ship_id,
						addExp = arg_2_0.add_exp
					}
				end

				var_2_9:UpdateEnergy(arg_2_0.cur_energy)
				var_2_9:UpdateEnergyBeginRecoverTime(arg_2_0.recover_time)
			end

			var_1_3:DispatchEvent(var_0_0.END_DELEGATION, {
				build_id = var_1_1,
				ship_id = arg_2_0.ship_id,
				area_id = var_1_2,
				remainReward = var_2_7
			})
			arg_1_0:sendNotification(GAME.ISLAND_FINISH_DELEGATION_DONE, {
				slotId = var_1_2,
				addShipExpData = var_2_10
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

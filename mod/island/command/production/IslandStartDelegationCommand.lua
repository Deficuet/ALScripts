local var_0_0 = class("IslandStartDelegationCommand", pm.SimpleCommand)

var_0_0.START_DELEGATION = "IslandStartDelegationCommand:START_DELEGATION"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.build_id
	local var_1_2 = var_1_0.area_id
	local var_1_3 = var_1_0.ship_id
	local var_1_4 = var_1_0.formula_id
	local var_1_5 = var_1_0.num
	local var_1_6 = getProxy(IslandProxy):GetIsland()
	local var_1_7 = var_1_6:GetBuildingAgency()
	local var_1_8 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_1_9 = var_1_0.extraCost or 0

	pg.ConnectionMgr.GetInstance():Send(21501, {
		build_id = var_1_1,
		area_id = var_1_2,
		ship_id = var_1_3,
		formula_id = var_1_4,
		num = var_1_5
	}, 21502, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_7:GetBuilding(var_1_1)

			var_2_0:UpdateDeleationRoleDataBySlotId(arg_2_0.ship_appoint.id, arg_2_0.ship_appoint)

			local var_2_1 = var_1_6:GetCharacterAgency():GetShipById(var_1_3)

			var_2_1:UpdateEnergy(arg_2_0.ship_power)

			local var_2_2 = var_2_0:GetDelegationSlotData(arg_2_0.ship_appoint.id)
			local var_2_3 = var_2_2:GetRoleDelegateFinishTime()

			var_2_1:UpdateEnergyBeginRecoverTime(var_2_3)

			local var_2_4 = var_1_1 == IslandTechnologyAgency.PLACE_ID and IslandShip.STATE_DELEGATION or IslandShip.STATE_TECHNOLOGY

			var_2_1:UpdateState(var_2_4, var_1_1)

			local var_2_5 = var_2_2:GetFormulaId()
			local var_2_6 = pg.island_formula[var_2_5].commission_cost

			for iter_2_0, iter_2_1 in ipairs(var_2_6) do
				var_1_8:RemoveItem(iter_2_1[1], (iter_2_1[2] + var_1_9) * var_1_5)
			end

			var_1_6:DispatchEvent(var_0_0.START_DELEGATION, {
				build_id = var_1_1,
				ship_id = var_1_3,
				area_id = var_1_2,
				formula_id = var_1_4
			})
			arg_1_0:sendNotification(GAME.ISLAND_START_DELEGATION_DONE, {
				slotId = var_1_2
			})
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandStartDelegation(var_1_3, var_1_1, var_1_2, var_1_4, var_1_5))

			local var_2_7 = var_0_0.GetLocalKeyForLastData(var_1_2)
			local var_2_8 = PackIntToString(var_1_3, var_1_4)

			PlayerPrefs.SetString(var_2_7, var_2_8)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

function var_0_0.GetLocalKeyForLastData(arg_3_0)
	local var_3_0 = getProxy(PlayerProxy):getData().id

	return "LAST_DELEGATE" .. tostring(arg_3_0) .. "_" .. var_3_0
end

return var_0_0

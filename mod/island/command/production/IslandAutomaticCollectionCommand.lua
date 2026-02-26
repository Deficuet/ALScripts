local var_0_0 = class("IslandAutomaticCollectionCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_1 - 1
	local var_1_3 = var_1_0.ship_list
	local var_1_4 = var_1_0.gatherData
	local var_1_5 = getProxy(IslandProxy):GetIsland()
	local var_1_6 = var_1_5:GetBuildingAgency()
	local var_1_7 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	local function var_1_8(arg_2_0)
		for iter_2_0, iter_2_1 in pairs(var_1_4 or {}) do
			if iter_2_1.id == arg_2_0 then
				return iter_2_1.pos
			end
		end

		return nil
	end

	pg.ConnectionMgr.GetInstance():Send(21539, {
		type = var_1_2,
		ship_list = var_1_3
	}, 21540, function(arg_3_0)
		if arg_3_0.result == 0 then
			for iter_3_0, iter_3_1 in ipairs(arg_3_0.ship_list or {}) do
				local var_3_0 = var_1_5:GetCharacterAgency():GetShipById(iter_3_1.ship_id)

				var_3_0:UpdateEnergy(iter_3_1.cur_power)
				var_3_0:UpdateEnergyBeginRecoverTime(iter_3_1.recover_time)
				var_3_0:AddExp(iter_3_1.add_exp)
			end

			for iter_3_2, iter_3_3 in ipairs(arg_3_0.gather_list or {}) do
				local var_3_1 = var_1_8(iter_3_3)

				if var_3_1 then
					var_1_5:DispatchEvent(IslandGatherCollectAgency.RemoveGatherUnit, {
						unitId = var_3_1
					})
				end
			end

			for iter_3_4, iter_3_5 in ipairs(arg_3_0.build_refresh or {}) do
				local var_3_2 = var_1_6:GetBuilding(iter_3_5.build_id):GetBuildingCollectData()

				for iter_3_6, iter_3_7 in pairs(var_3_2:GetCollectSlotDatasDic()) do
					var_1_5:DispatchEvent(IslandBuildingAgency.COLLECT_SLOT_UNIT_REMOVE, {
						slotId = iter_3_7.id
					})
				end

				var_3_2:SetAllTakeColelct()
				var_3_2:UpdateCollectRefreshtTime(iter_3_5.refresh_time)
			end

			local var_3_3 = IslandDropHelper.AddItems(arg_3_0)

			arg_1_0:sendNotification(GAME.ISLAND_TAKE_AUTO_COLLECTION_DONE, {
				dropData = var_3_3,
				selectType = var_1_1
			})
			var_1_7:RemoveItem(1, arg_3_0.cost_gold)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.result)
		end
	end)
end

return var_0_0

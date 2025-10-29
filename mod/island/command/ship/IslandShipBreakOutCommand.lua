local var_0_0 = class("IslandShipBreakOutCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id
	local var_1_1 = getProxy(IslandProxy):GetIsland()
	local var_1_2 = var_1_1:GetCharacterAgency():GetShipById(var_1_0)

	if not var_1_2 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21601, {
		ship_id = var_1_0
	}, 21602, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
			local var_2_1 = var_1_2:GetBreakoutMatrials()

			for iter_2_0, iter_2_1 in ipairs(var_2_1) do
				var_2_0:RemoveItem(iter_2_1.id, iter_2_1.count)
			end

			local var_2_2 = Clone(var_1_2)
			local var_2_3 = var_2_2:GetSkill():IsUnlock()

			var_1_2:UpgradeBreakOut()

			local var_2_4 = var_1_2:GetSkill():IsUnlock()
			local var_2_5 = not var_2_3 and var_2_4

			if var_2_5 then
				var_1_1:GetGlobalBuffAgency():OnShipSkillUnlock(var_1_0)
			end

			arg_1_0:sendNotification(GAME.ISLAND_SHIP_BREAKOUT_DONE, {
				newShip = var_1_2,
				oldShip = var_2_2,
				isUnlockSkill = var_2_5
			})
			IslandBookHelper.OnShipUpgradeOrBreakOut(var_1_0)
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandShipBreakout(var_1_0))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

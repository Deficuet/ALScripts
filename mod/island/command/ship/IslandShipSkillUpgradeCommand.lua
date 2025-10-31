local var_0_0 = class("IslandShipSkillUpgradeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id
	local var_1_1 = getProxy(IslandProxy):GetIsland()
	local var_1_2 = var_1_1:GetCharacterAgency():GetShipById(var_1_0)

	if not var_1_2 then
		return
	end

	if not var_1_2:CanUpgradeSkill() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21611, {
		ship_id = var_1_0
	}, 21612, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_2:GetSkill()
			local var_2_1 = var_2_0:GetUpgradeMaterial()

			var_2_0:Upgrade()

			local var_2_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

			for iter_2_0, iter_2_1 in ipairs(var_2_1) do
				var_2_2:RemoveItem(iter_2_1.id, iter_2_1.count)
			end

			IslandAchievementHelper.OnShipSkillUpgrade(var_2_0:GetLevel())
			var_1_1:GetGlobalBuffAgency():OnShipSkillUpgrade(var_1_0)
			arg_1_0:sendNotification(GAME.ISLAND_SHIP_SKILL_UPGRADE_DONE)
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandShipSkillUpgrade(var_1_2.id, var_2_0.id))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

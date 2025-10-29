local var_0_0 = class("UpgradeIslandCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().callback

	arg_1_0:DoUpgrade(var_1_0)
end

function var_0_0.DoUpgrade(arg_2_0, arg_2_1)
	if not getProxy(IslandProxy):GetIsland():CanLevelUp() then
		arg_2_1()

		return
	end

	pg.ConnectionMgr.GetInstance():Send(21000, {
		type = 0
	}, 21001, function(arg_3_0)
		if arg_3_0.ret == 0 then
			local var_3_0 = getProxy(IslandProxy):GetIsland()

			var_3_0:Upgrade()

			local var_3_1 = IslandDropHelper.AddItems(arg_3_0)

			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.ISLAND_LV)
			IslandAchievementHelper.UpdateRecord(IslandAchievementType.ISLAND_LV, 0, var_3_0:GetLevel())
			arg_2_0:sendNotification(GAME.ISLAND_UPGRADE_DONE, {
				dropData = var_3_1,
				callback = function()
					arg_2_0:DoUpgrade(arg_2_1)
				end
			})
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandUpgrade(var_3_0:GetLevel()))
			var_3_0:GetTechnologyAgency():TryAutoUnlock()
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.ret] .. arg_3_0.ret)
		end
	end)
end

return var_0_0

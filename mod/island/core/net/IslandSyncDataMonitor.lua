local var_0_0 = class("IslandSyncDataMonitor", import(".IslandBaseMonitor"))

function var_0_0.register(arg_1_0)
	arg_1_0:on(21212, function(arg_2_0)
		if not arg_1_0:GetIsland() then
			return
		end

		local var_2_0 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.sync_ob_list) do
			local var_2_1 = SyncUnitData.New(iter_2_1)

			table.insert(var_2_0, var_2_1)
		end

		if IslandConst.SYNC_TEST_DELAY_ON then
			local var_2_2 = math.random(IslandConst.SYNC_TEST_DELAY_L, IslandConst.SYNC_TEST_DELAY_R)

			LeanTween.delayedCall(var_2_2 / 1000, System.Action(function()
				arg_1_0:GetIsland():DispatchEvent(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, var_2_0)
			end))
		else
			arg_1_0:GetIsland():DispatchEvent(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, var_2_0)
		end
	end)
	arg_1_0:on(21207, function(arg_4_0)
		if not arg_1_0:GetIsland() then
			return
		end

		if IslandConst.SYNC_TEST_DELAY_ON then
			local var_4_0 = math.random(IslandConst.SYNC_TEST_DELAY_L, IslandConst.SYNC_TEST_DELAY_R)

			LeanTween.delayedCall(var_4_0 / 1000, System.Action(function()
				arg_1_0:GetIsland():DispatchEvent(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_4_0.object_list)
			end))
		else
			arg_1_0:GetIsland():DispatchEvent(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_4_0.object_list)
		end
	end)
	arg_1_0:on(21304, function(arg_6_0)
		local var_6_0 = arg_1_0:GetIsland()
		local var_6_1 = getProxy(IslandProxy):GetIsland()

		pg.m02:sendNotification(GAME.ISLAND_EXIT, {
			id = var_6_0.id,
			callback = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip4"))
				pg.m02:sendNotification(GAME.ISLAND_ENTER, {
					id = var_6_1.id
				})
			end
		})
	end)
end

return var_0_0

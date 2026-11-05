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

		arg_1_0:GetIsland():DispatchEvent(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, var_2_0)
	end)
	arg_1_0:on(21207, function(arg_3_0)
		if not arg_1_0:GetIsland() then
			return
		end

		local var_3_0 = arg_1_0:GetIsland()
		local var_3_1 = var_3_0:GetInteractSyncAgency()
		local var_3_2 = var_3_0:GetVisitorAgency():GetMapVisitorList()

		for iter_3_0, iter_3_1 in ipairs(arg_3_0.object_list or {}) do
			local var_3_3 = var_3_1:ApplyServerSlots(iter_3_1.id, iter_3_1.slots, iter_3_1.status, IslandInteractSyncAgency.PHASE_SYNC)

			if var_3_3 then
				arg_1_0:RecordLastInteract(var_3_1, var_3_2, iter_3_1, var_3_3)
			end
		end
	end)
	arg_1_0:on(21304, function(arg_4_0)
		local var_4_0 = arg_1_0:GetIsland()
		local var_4_1 = getProxy(IslandProxy):GetIsland()

		pg.m02:sendNotification(GAME.ISLAND_EXIT, {
			id = var_4_0.id,
			callback = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_visit_tip4"))
				pg.m02:sendNotification(GAME.ISLAND_ENTER, {
					id = var_4_1.id
				})
			end
		})
	end)
end

function var_0_0.RecordLastInteract(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	local var_6_0 = arg_6_1:GetLocalPlayerId()

	for iter_6_0, iter_6_1 in ipairs(arg_6_4.removed) do
		if iter_6_1.ownerId ~= var_6_0 and arg_6_2[iter_6_1.ownerId] then
			arg_6_1:ClearLastInteract(iter_6_1.ownerId)
		end
	end

	for iter_6_2, iter_6_3 in ipairs(arg_6_4.added) do
		if iter_6_3.ownerId ~= var_6_0 and arg_6_2[iter_6_3.ownerId] then
			arg_6_1:RecordLastInteract(iter_6_3.ownerId, arg_6_3.id, arg_6_3.type)
		end
	end
end

return var_0_0

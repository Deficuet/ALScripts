local var_0_0 = class("IslandPlayerDataMonitor", import(".IslandBaseMonitor"))

function var_0_0.register(arg_1_0)
	arg_1_0:on(21206, function(arg_2_0)
		if not arg_1_0:IsSelf(arg_2_0.island_id) then
			return
		end

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.player_list) do
			arg_1_0:HandlePlayerData(iter_2_1)
		end
	end)
	arg_1_0:on(21309, function(arg_3_0)
		if not arg_1_0:IsSelf(arg_3_0.island_id) then
			return
		end

		arg_1_0:HandleAgoraData(arg_3_0.update_data)
	end)
	arg_1_0:on(21407, function(arg_4_0)
		if not arg_1_0:IsSelf(arg_4_0.island_id) then
			return
		end

		arg_1_0:HandleOrderData(arg_4_0.order_info)
	end)
	arg_1_0:on(21040, function(arg_5_0)
		arg_1_0:HandleTaskData(arg_5_0.task_list)
	end)
	arg_1_0:on(21043, function(arg_6_0)
		arg_1_0:HandleRandomTaskData(arg_6_0.task_list_random)
	end)
	arg_1_0:on(21422, function(arg_7_0)
		arg_1_0:HandleManageData(arg_7_0)
	end)
	arg_1_0:on(21053, function(arg_8_0)
		arg_1_0:HandleAchievementData(arg_8_0.event_list)
	end)
	arg_1_0:on(21518, function(arg_9_0)
		if arg_9_0.type == 1 or arg_9_0.type == 3 then
			arg_1_0:HandleSlotFormulaData(arg_9_0)
		end

		if arg_9_0.type == 1 or arg_9_0.type == 2 then
			getProxy(IslandProxy):GetIsland():GetBuildingAgency():AddFormulaNum(arg_9_0.formula_id, arg_9_0.num)
		end
	end)
	arg_1_0:on(21519, function(arg_10_0)
		arg_1_0:HandleBuildUnlockData(arg_10_0)
	end)
	arg_1_0:on(21515, function(arg_11_0)
		arg_1_0:HandleHandSlotUnlockData(arg_11_0)
	end)
	arg_1_0:on(21314, function(arg_12_0)
		arg_1_0:HandleSignInNotify(arg_12_0)
		getProxy(IslandProxy):UpdateGiftTagCache(arg_12_0.island_id, arg_12_0.gift_count, arg_12_0.gift_timestamp)

		if not arg_1_0:IsSelf(arg_12_0.island_id) then
			return
		end

		arg_1_0:HandleSignInData(arg_12_0)
	end)
	arg_1_0:on(21528, function(arg_13_0)
		if not arg_1_0:IsSelf(arg_13_0.island_id) then
			return
		end

		arg_1_0:HandleWildGatherInData(arg_13_0)
	end)
	arg_1_0:on(21535, function(arg_14_0)
		if not arg_1_0:IsSelf(arg_14_0.island_id) then
			return
		end

		arg_1_0:HandleWildCollectInData(arg_14_0)
	end)
	arg_1_0:on(21227, function(arg_15_0)
		if not arg_1_0:IsSelf(arg_15_0.island_id) then
			return
		end

		arg_1_0:HandleAbilityData(arg_15_0)
	end)
	arg_1_0:on(21225, function(arg_16_0)
		if not arg_1_0:IsSelf(arg_16_0.island_id) then
			return
		end

		arg_1_0:SyncStartManage(arg_16_0)
	end)
	arg_1_0:on(21220, function(arg_17_0)
		if not arg_1_0:IsSelf(arg_17_0.island_id) then
			return
		end

		arg_1_0:SyncStartDelegation(arg_17_0)
	end)
	arg_1_0:on(21226, function(arg_18_0)
		if not arg_1_0:IsSelf(arg_18_0.island_id) then
			return
		end

		arg_1_0:SyncEndDelegation(arg_18_0)
	end)
	arg_1_0:on(21222, function(arg_19_0)
		if not arg_1_0:IsSelf(arg_19_0.island_id) then
			return
		end

		arg_1_0:SyncResetSlotData(arg_19_0)
	end)
	arg_1_0:on(21221, function(arg_20_0)
		if not arg_1_0:IsSelf(arg_20_0.island_id) then
			return
		end

		arg_1_0:SyncStarthHandPlant(arg_20_0)
	end)
end

function var_0_0.HandleAgoraData(arg_21_0, arg_21_1)
	if getProxy(IslandProxy):GetIsland().id == arg_21_0:GetIsland().id then
		return
	end

	arg_21_0:GetIsland():GetAgoraAgency():UpdatePlacedData(arg_21_1)
end

function var_0_0.HandlePlayerData(arg_22_0, arg_22_1)
	warning("HandlePlayerData>>>>>>>>>", arg_22_1.state, arg_22_1.map_id, arg_22_1.id)

	if arg_22_1.state == IslandConst.PLAYER_DATA_STATE_EMPTY then
		arg_22_0:UpdatePlayerData(arg_22_1)
	elseif arg_22_1.state == IslandConst.PLAYER_DATA_STATE_ENTER then
		arg_22_0:HandlePlayerEnter(arg_22_1)
	elseif arg_22_1.state == IslandConst.PLAYER_DATA_STATE_EXIT then
		arg_22_0:HandlePlayerExit(arg_22_1.id)
	end
end

function var_0_0.HandlePlayerExit(arg_23_0, arg_23_1)
	if arg_23_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_23_1] then
		arg_23_0:GetIsland():GetVisitorAgency():DeletePlayer(arg_23_1)
	end

	if arg_23_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_23_1] then
		arg_23_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_23_1)
	end
end

function var_0_0.HandlePlayerEnter(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1.id

	if not arg_24_0:GetIsland():GetVisitorAgency():GetPlayerList()[var_24_0] then
		local var_24_1 = IslandPlayer.New(arg_24_1)

		arg_24_0:GetIsland():GetVisitorAgency():AddPlayer(var_24_1)

		if var_24_1:IsInMap(arg_24_0:GetIsland():GetMapId()) then
			arg_24_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_24_1)
		end
	end
end

function var_0_0.UpdatePlayerData(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_25_1.id]

	if var_25_0 then
		var_25_0:Flush(arg_25_1)
	end

	local var_25_1 = var_25_0 and var_25_0:IsInMap(arg_25_0:GetIsland():GetMapId())
	local var_25_2 = arg_25_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_25_1.id]

	if var_25_1 and not var_25_2 then
		arg_25_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_25_0)
	elseif not var_25_1 and var_25_2 then
		arg_25_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_25_1.id)
	elseif var_25_1 and var_25_2 then
		var_25_2:Flush(arg_25_1)
	end
end

function var_0_0.HandleOrderData(arg_26_0, arg_26_1)
	arg_26_0:GetIsland():GetOrderAgency():UpdateOrAddOrder(arg_26_1)
end

function var_0_0.HandleTaskData(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0:GetIsland():GetTaskAgency()

	for iter_27_0, iter_27_1 in ipairs(arg_27_1) do
		local var_27_1 = underscore.all(iter_27_1.process_list, function(arg_28_0)
			return arg_28_0.target_count == 0
		end)
		local var_27_2 = IslandTask.New(iter_27_1)

		if var_27_1 then
			var_27_0:AddTask(var_27_2)
		else
			var_27_0:UpdateTask(var_27_2)
		end
	end
end

function var_0_0.HandleRandomTaskData(arg_29_0, arg_29_1)
	arg_29_0:GetIsland():GetTaskAgency():InitFutureTasks(arg_29_1 or {})
end

function var_0_0.HandleManageData(arg_30_0, arg_30_1)
	local var_30_0 = getProxy(IslandProxy):GetIsland():GetManageAgency()

	if arg_30_1.type == 1 then
		var_30_0:DailyRefresh(arg_30_1)
	elseif arg_30_1.type == 2 then
		var_30_0:UnlockDailyEvent(arg_30_1)
	end
end

function var_0_0.HandleAchievementData(arg_31_0, arg_31_1)
	local var_31_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	for iter_31_0, iter_31_1 in ipairs(arg_31_1) do
		var_31_0:UpdateRecord(iter_31_1.event_type, iter_31_1.event_arg, iter_31_1.value)
	end
end

function var_0_0.HandleSlotFormulaData(arg_32_0, arg_32_1)
	local var_32_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_32_1 = arg_32_1.area_id
	local var_32_2 = pg.island_production_slot[var_32_1].place

	var_32_0:GetBuilding(var_32_2):GetDelegationSlotData(var_32_1):AddFormulaNum(arg_32_1)
end

function var_0_0.HandleBuildUnlockData(arg_33_0, arg_33_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitBuildData(arg_33_1.build)
end

function var_0_0.HandleHandSlotUnlockData(arg_34_0, arg_34_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitHandSlotData(arg_34_1.collect)
end

function var_0_0.HandleSignInData(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0:GetIsland():GetSignInAgency()

	var_35_0:UpdateGiftEndTime(arg_35_1.gift_timestamp)
	var_35_0:UpdateFetchedList(arg_35_1.gift_visitor)
	var_35_0:SetGiftCnt(arg_35_1.gift_count)
end

function var_0_0.HandleSignInNotify(arg_36_0, arg_36_1)
	if arg_36_1.cmd == 2 then
		local var_36_0 = getProxy(FriendProxy):getFriend(arg_36_1.island_id)
		local var_36_1 = var_36_0 and var_36_0:GetName() or ""
		local var_36_2 = IslandVisitorLog.New({
			id = arg_36_1.island_id,
			cmd = IslandConst.VISITOR_LOG_CMD_GIFT,
			name = var_36_1,
			time = pg.TimeMgr.GetInstance():GetServerTime()
		})

		pg.IslandVisitorNotificationMgr.GetInstance():Enqueue(var_36_2)
	end
end

function var_0_0.HandleWildGatherInData(arg_37_0, arg_37_1)
	arg_37_0:GetIsland():GetWildCollectAgency():UpdateGatherData(arg_37_1)
end

function var_0_0.HandleWildCollectInData(arg_38_0, arg_38_1)
	arg_38_0:GetIsland():GetWildCollectAgency():UpdateCollectFragmentData(arg_38_1)
end

function var_0_0.HandleAbilityData(arg_39_0, arg_39_1)
	local var_39_0 = getProxy(IslandProxy):GetSharedIsland()

	if not var_39_0 then
		return
	end

	var_39_0:GetAblityAgency():AddAblity(arg_39_1.ability_id)
end

function var_0_0.SyncStartManage(arg_40_0, arg_40_1)
	local var_40_0 = getProxy(IslandProxy):GetIsland():GetManageAgency()
	local var_40_1 = arg_40_1.trade
	local var_40_2 = var_40_0:GetRestaurant(var_40_1.id)

	if not var_40_2 then
		var_40_0:UnlockNewRestaurant(var_40_1.id)

		var_40_2 = var_40_0:GetRestaurant(var_40_1.id)
	end

	var_40_2:UpdateData(var_40_1)
	getProxy(IslandProxy):GetSharedIsland():DispatchEvent(IslandOpenRestaurantCommand.OPEN_RESTAURANT, {
		restId = var_40_2.id,
		postList = var_40_1.post_list
	})
end

function var_0_0.SyncStartDelegation(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0:GetIsland()
	local var_41_1 = var_41_0:GetBuildingAgency()
	local var_41_2 = pg.island_production_slot[arg_41_1.appoint_data.id].place

	var_41_1:GetBuilding(var_41_2):UpdateDeleationRoleDataBySlotId(arg_41_1.appoint_data.id, arg_41_1.appoint_data)

	local var_41_3 = arg_41_1.appoint_data.ship_id
	local var_41_4 = arg_41_1.appoint_data.id

	var_41_0:DispatchEvent(IslandStartDelegationCommand.START_DELEGATION, {
		build_id = var_41_2,
		ship_id = var_41_3,
		area_id = var_41_4
	})
end

function var_0_0.SyncEndDelegation(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0:GetIsland()
	local var_42_1 = island:GetBuildingAgency():GetBuilding(arg_42_0.buildId)
	local var_42_2 = arg_42_0.islandRoleDelegationData.formula_id
	local var_42_3 = arg_42_0.islandRoleDelegationData.ship_id
	local var_42_4 = arg_42_0.id

	var_42_1:UpdateDeleationRewardDataBySlotId(arg_42_0.id, {
		formula_id = var_42_2
	})
	var_42_1:UpdateDeleationRoleDataBySlotId(arg_42_0.id, nil)
	var_42_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
		remainReward = true,
		build_id = build_id,
		ship_id = var_42_3,
		area_id = var_42_4
	})
end

function var_0_0.SyncResetSlotData(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0:GetIsland()
	local var_43_1 = var_43_0:GetBuildingAgency()

	for iter_43_0, iter_43_1 in ipairs(arg_43_1.slot_list) do
		local var_43_2 = pg.island_production_slot[iter_43_1]
		local var_43_3 = var_43_2.place
		local var_43_4 = var_43_1:GetBuilding(var_43_3)

		if var_43_2.type == 9 or var_43_2.type == 3 then
			local var_43_5 = var_43_4:GetDelegationSlotData(iter_43_1)
			local var_43_6 = var_43_5 and var_43_5:GetSlotRoleData()

			if var_43_6 then
				local var_43_7 = var_43_6.ship_id
				local var_43_8 = iter_43_1

				var_43_4:UpdateDeleationRoleDataBySlotId(iter_43_1, nil)
				var_43_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
					remainReward = false,
					build_id = var_43_3,
					ship_id = var_43_7,
					area_id = var_43_8
				})
			end

			var_43_4:UpdateDeleationRewardDataBySlotId(iter_43_1, nil)
			var_43_0:DispatchEvent(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, {
				build_id = var_43_3,
				area_id = iter_43_1
			})
		elseif var_43_2.type == 1 then
			var_43_4:UpdateHandPlantDataBySlotId({
				formula_id = 0,
				end_time = 0,
				state = 0,
				id = iter_43_1
			})
			var_43_0:DispatchEvent(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, {
				build_id = var_43_3,
				area_id = iter_43_1
			})
		end
	end
end

function var_0_0.SyncStarthHandPlant(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0:GetIsland()
	local var_44_1 = var_44_0:GetBuildingAgency()

	for iter_44_0, iter_44_1 in ipairs(arg_44_1.hand_list) do
		local var_44_2 = pg.island_production_slot[iter_44_1.id].place

		var_44_1:GetBuilding(var_44_2):UpdateHandPlantDataBySlotId(iter_44_1)
		var_44_0:DispatchEvent(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, {
			build_id = var_44_2,
			area_id = iter_44_1.id,
			formula_id = iter_44_1.formula_id
		})
	end
end

return var_0_0

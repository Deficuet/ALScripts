local var_0_0 = class("IslandPlayerDataMonitor", import(".IslandBaseMonitor"))

function var_0_0.register(arg_1_0)
	arg_1_0:on(21206, function(arg_2_0)
		if not arg_1_0:IsCurrentIsland(arg_2_0.island_id) then
			return
		end

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.player_list) do
			arg_1_0:HandlePlayerData(iter_2_1)
		end
	end)
	arg_1_0:on(21309, function(arg_3_0)
		if not arg_1_0:IsCurrentIsland(arg_3_0.island_id) then
			return
		end

		arg_1_0:HandleAgoraData(arg_3_0.update_data)
	end)
	arg_1_0:on(21407, function(arg_4_0)
		if not arg_1_0:IsCurrentIsland(arg_4_0.island_id) then
			return
		end

		arg_1_0:HandleOrderData(arg_4_0.order_info)
	end)
	arg_1_0:on(21040, function(arg_5_0)
		arg_1_0:HandleTaskData(arg_5_0.task_list)
	end)
	arg_1_0:on(21043, function(arg_6_0)
		arg_1_0:HandleRandomTaskData(arg_6_0)
	end)
	arg_1_0:on(21422, function(arg_7_0)
		arg_1_0:HandleManageData(arg_7_0)
	end)
	arg_1_0:on(21053, function(arg_8_0)
		arg_1_0:HandleAchievementData(arg_8_0.event_list)
	end)
	arg_1_0:on(21342, function(arg_9_0)
		arg_1_0:HandleBookData(arg_9_0.item_list)
	end)
	arg_1_0:on(21518, function(arg_10_0)
		arg_1_0:HandleSlotFormulaData(arg_10_0)
		getProxy(IslandProxy):GetIsland():GetBuildingAgency():AddFormulaNum(arg_10_0.formula_id, arg_10_0.comb_num)
	end)
	arg_1_0:on(21519, function(arg_11_0)
		arg_1_0:HandleBuildUnlockData(arg_11_0)
	end)
	arg_1_0:on(21515, function(arg_12_0)
		arg_1_0:HandleHandSlotUnlockData(arg_12_0)
	end)
	arg_1_0:on(21314, function(arg_13_0)
		arg_1_0:HandleSignInNotify(arg_13_0)
		getProxy(IslandProxy):UpdateGiftTagCache(arg_13_0.island_id, arg_13_0.gift_count, arg_13_0.gift_timestamp)

		if not arg_1_0:IsCurrentIsland(arg_13_0.island_id) then
			return
		end

		arg_1_0:HandleSignInData(arg_13_0)
	end)
	arg_1_0:on(21528, function(arg_14_0)
		if not arg_1_0:IsCurrentIsland(arg_14_0.island_id) then
			return
		end

		arg_1_0:HandleWildGatherInData(arg_14_0)
	end)
	arg_1_0:on(21535, function(arg_15_0)
		if not arg_1_0:IsCurrentIsland(arg_15_0.island_id) then
			return
		end

		arg_1_0:HandleWildCollectInData(arg_15_0)
	end)
	arg_1_0:on(21227, function(arg_16_0)
		if not arg_1_0:IsCurrentIsland(arg_16_0.island_id) then
			return
		end

		arg_1_0:HandleAbilityData(arg_16_0)
	end)
	arg_1_0:on(21225, function(arg_17_0)
		if not arg_1_0:IsCurrentIsland(arg_17_0.island_id) then
			return
		end

		arg_1_0:SyncStartManage(arg_17_0)
	end)
	arg_1_0:on(21220, function(arg_18_0)
		if not arg_1_0:IsCurrentIsland(arg_18_0.island_id) then
			return
		end

		arg_1_0:SyncStartDelegation(arg_18_0)
	end)
	arg_1_0:on(21226, function(arg_19_0)
		if not arg_1_0:IsCurrentIsland(arg_19_0.island_id) then
			return
		end

		arg_1_0:SyncEndDelegation(arg_19_0)
	end)
	arg_1_0:on(21222, function(arg_20_0)
		if not arg_1_0:IsCurrentIsland(arg_20_0.island_id) then
			return
		end

		arg_1_0:SyncResetSlotData(arg_20_0)
	end)
	arg_1_0:on(21221, function(arg_21_0)
		if not arg_1_0:IsCurrentIsland(arg_21_0.island_id) then
			return
		end

		arg_1_0:SyncStarthHandPlant(arg_21_0)
	end)
	arg_1_0:on(21701, function(arg_22_0)
		arg_1_0:ResponeAniamtion(arg_22_0)
	end)
	arg_1_0:on(21325, function(arg_23_0)
		arg_1_0:AddChatMsg(arg_23_0)
	end)
	arg_1_0:on(21228, function(arg_24_0)
		if not arg_1_0:IsCurrentIsland(arg_24_0.island_id) then
			return
		end

		arg_1_0:UpdateActivityNpc(arg_24_0)
	end)
	arg_1_0:on(21224, function(arg_25_0)
		if not arg_1_0:IsCurrentIsland(arg_25_0.island_id) then
			return
		end

		arg_1_0:UpdatePlayerDressupData(arg_25_0)
	end)
	arg_1_0:on(21232, function(arg_26_0)
		if not arg_1_0:IsCurrentIsland(arg_26_0.island_id) then
			return
		end

		arg_1_0:HandFishingStart(arg_26_0)
	end)
	arg_1_0:on(21233, function(arg_27_0)
		if not arg_1_0:IsCurrentIsland(arg_27_0.island_id) then
			return
		end

		arg_1_0:HandFishingStateChange(arg_27_0)
	end)
	arg_1_0:on(21242, function(arg_28_0)
		if not arg_1_0:IsCurrentIsland(arg_28_0.island_id) then
			return
		end

		arg_1_0:UpdateTradePrice(arg_28_0)
	end)
	arg_1_0:on(21247, function(arg_29_0)
		arg_1_0:HandleTradeNotify(arg_29_0)
	end)
end

function var_0_0.HandFishingStart(arg_30_0, arg_30_1)
	arg_30_0:emitCore(ISLAND_EVT.START_FISHING, {
		unitId = arg_30_1.user_id,
		fishPointId = arg_30_1.point_id,
		rodId = arg_30_1.rod_id,
		fishId = arg_30_1.fish_id
	})
end

function var_0_0.HandFishingStateChange(arg_31_0, arg_31_1)
	arg_31_0:emitCore(ISLAND_EVT.FISHING_STATE_CHANGE, {
		unitId = arg_31_1.user_id,
		fishPointId = arg_31_1.point_id,
		op = arg_31_1.type
	})
end

function var_0_0.UpdateTradePrice(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1.today_price.timestamp
	local var_32_1 = arg_32_1.today_price.price

	arg_32_0:GetIsland():GetTradeAgency():UpdateTodayPrice(var_32_0, var_32_1)
end

function var_0_0.HandleAgoraData(arg_33_0, arg_33_1)
	if getProxy(IslandProxy):GetIsland().id == arg_33_0:GetIsland().id then
		return
	end

	arg_33_0:GetIsland():GetAgoraAgency():UpdatePlacedData(arg_33_1)
end

function var_0_0.HandlePlayerData(arg_34_0, arg_34_1)
	warning("HandlePlayerData>>>>>>>>>", arg_34_1.state, arg_34_1.map_id, arg_34_1.id)

	if arg_34_1.state == IslandConst.PLAYER_DATA_STATE_EMPTY then
		arg_34_0:UpdatePlayerData(arg_34_1)
	elseif arg_34_1.state == IslandConst.PLAYER_DATA_STATE_ENTER then
		arg_34_0:HandlePlayerEnter(arg_34_1)
	elseif arg_34_1.state == IslandConst.PLAYER_DATA_STATE_EXIT then
		arg_34_0:HandlePlayerExit(arg_34_1.id)
	end
end

function var_0_0.HandlePlayerExit(arg_35_0, arg_35_1)
	if arg_35_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_35_1] then
		arg_35_0:GetIsland():GetVisitorAgency():DeletePlayer(arg_35_1)
	end

	if arg_35_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_35_1] then
		arg_35_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_35_1)
	end
end

function var_0_0.HandlePlayerEnter(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1.id

	if not arg_36_0:GetIsland():GetVisitorAgency():GetPlayerList()[var_36_0] then
		local var_36_1 = IslandPlayer.New(arg_36_1)

		arg_36_0:GetIsland():GetVisitorAgency():AddPlayer(var_36_1)

		if var_36_1:IsInMap(arg_36_0:GetIsland():GetMapId()) then
			arg_36_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_36_1)
		end
	end
end

function var_0_0.UpdatePlayerData(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_37_1.id]

	if var_37_0 then
		var_37_0:Flush(arg_37_1)
	end

	local var_37_1 = var_37_0 and var_37_0:IsInMap(arg_37_0:GetIsland():GetMapId())
	local var_37_2 = arg_37_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_37_1.id]

	if var_37_1 and not var_37_2 then
		arg_37_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_37_0)
	elseif not var_37_1 and var_37_2 then
		arg_37_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_37_1.id)
	elseif var_37_1 and var_37_2 then
		var_37_2:Flush(arg_37_1)
	end
end

function var_0_0.HandleOrderData(arg_38_0, arg_38_1)
	arg_38_0:GetIsland():GetOrderAgency():UpdateOrAddOrder(arg_38_1)
end

function var_0_0.HandleTaskData(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:GetIsland():GetTaskAgency()

	for iter_39_0, iter_39_1 in ipairs(arg_39_1) do
		local var_39_1 = underscore.all(iter_39_1.process_list, function(arg_40_0)
			return arg_40_0.target_count == 0
		end)
		local var_39_2 = IslandTask.New(iter_39_1)

		if var_39_1 then
			var_39_0:AddTask(var_39_2)
		else
			var_39_0:UpdateTask(var_39_2)
		end
	end
end

function var_0_0.HandleRandomTaskData(arg_41_0, arg_41_1)
	arg_41_0:GetIsland():GetTaskAgency():InitFutureTasks(arg_41_1.task_list_random or {})

	local var_41_0 = arg_41_1.task_list or {}
	local var_41_1 = arg_41_0:GetIsland():GetTaskAgency()

	for iter_41_0, iter_41_1 in ipairs(var_41_0) do
		local var_41_2 = IslandTask.New(iter_41_1)

		var_41_1:AddTask(var_41_2)
	end

	if #var_41_0 > 0 then
		var_41_1:TryAutoTrackTask()
	end
end

function var_0_0.HandleManageData(arg_42_0, arg_42_1)
	local var_42_0 = getProxy(IslandProxy):GetIsland():GetManageAgency()

	if arg_42_1.type == 1 then
		var_42_0:DailyRefresh(arg_42_1)
	elseif arg_42_1.type == 2 then
		var_42_0:UnlockDailyEvent(arg_42_1)
	end
end

function var_0_0.SyncStartManage(arg_43_0, arg_43_1)
	local var_43_0 = getProxy(IslandProxy):GetIsland():GetManageAgency()
	local var_43_1 = arg_43_1.trade
	local var_43_2 = var_43_0:GetRestaurant(var_43_1.id)

	if not var_43_2 then
		var_43_0:UnlockNewRestaurant(var_43_1.id)

		var_43_2 = var_43_0:GetRestaurant(var_43_1.id)
	end

	var_43_2:UpdateData(var_43_1)
	getProxy(IslandProxy):GetSharedIsland():DispatchEvent(IslandOpenRestaurantCommand.OPEN_RESTAURANT, {
		restId = var_43_2.id,
		postList = var_43_1.post_list
	})
end

function var_0_0.HandleAchievementData(arg_44_0, arg_44_1)
	local var_44_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	for iter_44_0, iter_44_1 in ipairs(arg_44_1) do
		var_44_0:UpdateRecord(iter_44_1.event_type, iter_44_1.event_arg, iter_44_1.value)
	end
end

function var_0_0.HandleBookData(arg_45_0, arg_45_1)
	getProxy(IslandProxy):GetIsland():GetBookAgency():HandlePushData(arg_45_1)
end

function var_0_0.HandleSlotFormulaData(arg_46_0, arg_46_1)
	local var_46_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_46_1 = arg_46_1.area_id
	local var_46_2 = pg.island_production_slot[var_46_1].place

	var_46_0:GetBuilding(var_46_2):GetDelegationSlotData(var_46_1):AddFormulaNum(arg_46_1)
end

function var_0_0.HandleBuildUnlockData(arg_47_0, arg_47_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitBuildData(arg_47_1.build)
end

function var_0_0.HandleHandSlotUnlockData(arg_48_0, arg_48_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitHandSlotData(arg_48_1.collect)
end

function var_0_0.HandleSignInData(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_0:GetIsland():GetSignInAgency()

	var_49_0:UpdateGiftEndTime(arg_49_1.gift_timestamp)
	var_49_0:UpdateFetchedList(arg_49_1.gift_visitor)
	var_49_0:SetGiftCnt(arg_49_1.gift_count)
end

function var_0_0.HandleTradeNotify(arg_50_0, arg_50_1)
	local var_50_0 = getProxy(FriendProxy):getFriend(arg_50_1.island_id)
	local var_50_1 = var_50_0 and var_50_0:GetName() or ""
	local var_50_2 = IslandVisitorLog.New({
		id = arg_50_1.island_id,
		cmd = IslandConst.VISITOR_LOG_CMD_TRADE,
		name = var_50_1,
		time = pg.TimeMgr.GetInstance():GetServerTime(),
		mapId = arg_50_1.map_id,
		extraInfo = arg_50_1.price
	})
	local var_50_3 = var_50_2:BuildWhitoutTime()

	if not var_50_3 or var_50_3 == "" then
		return
	end

	pg.IslandVisitorNotificationMgr.GetInstance():Enqueue(var_50_2)
end

function var_0_0.HandleSignInNotify(arg_51_0, arg_51_1)
	if arg_51_1.cmd == 2 then
		local var_51_0 = getProxy(FriendProxy):getFriend(arg_51_1.island_id)
		local var_51_1 = var_51_0 and var_51_0:GetName() or ""
		local var_51_2 = IslandVisitorLog.New({
			id = arg_51_1.island_id,
			cmd = IslandConst.VISITOR_LOG_CMD_GIFT,
			name = var_51_1,
			time = pg.TimeMgr.GetInstance():GetServerTime()
		})

		if arg_51_0:IsCurrentIsland(arg_51_1.island_id) then
			local var_51_3 = arg_51_0:GetIsland():GetSignInAgency()
			local var_51_4 = getProxy(PlayerProxy):getRawData().id

			var_51_3:AddInviter(var_51_4)
		end

		pg.IslandVisitorNotificationMgr.GetInstance():Enqueue(var_51_2)
	end
end

function var_0_0.HandleWildGatherInData(arg_52_0, arg_52_1)
	arg_52_0:GetIsland():GetWildCollectAgency():UpdateGatherData(arg_52_1)
end

function var_0_0.HandleWildCollectInData(arg_53_0, arg_53_1)
	arg_53_0:GetIsland():GetWildCollectAgency():UpdateCollectFragmentData(arg_53_1)
end

function var_0_0.HandleAbilityData(arg_54_0, arg_54_1)
	local var_54_0 = getProxy(IslandProxy):GetSharedIsland()

	if not var_54_0 then
		return
	end

	var_54_0:GetAblityAgency():AddAblity(arg_54_1.ability_id)
end

function var_0_0.SyncStartDelegation(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_0:GetIsland()
	local var_55_1 = var_55_0:GetBuildingAgency()
	local var_55_2 = pg.island_production_slot[arg_55_1.appoint_data.id].place

	var_55_1:GetBuilding(var_55_2):UpdateDeleationRoleDataBySlotId(arg_55_1.appoint_data.id, arg_55_1.appoint_data)

	local var_55_3 = arg_55_1.appoint_data.ship_id
	local var_55_4 = arg_55_1.appoint_data.id
	local var_55_5 = arg_55_1.appoint_data.formula_id

	var_55_0:DispatchEvent(IslandStartDelegationCommand.START_DELEGATION, {
		build_id = var_55_2,
		ship_id = var_55_3,
		area_id = var_55_4,
		formula_id = var_55_5
	})
end

function var_0_0.SyncEndDelegation(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:GetIsland()
	local var_56_1 = island:GetBuildingAgency():GetBuilding(arg_56_0.buildId)
	local var_56_2 = arg_56_0.islandRoleDelegationData.formula_id
	local var_56_3 = arg_56_0.islandRoleDelegationData.ship_id
	local var_56_4 = arg_56_0.id

	var_56_1:UpdateDeleationRewardDataBySlotId(arg_56_0.id, {
		formula_id = var_56_2
	})
	var_56_1:UpdateDeleationRoleDataBySlotId(arg_56_0.id, nil)
	var_56_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
		remainReward = true,
		build_id = build_id,
		ship_id = var_56_3,
		area_id = var_56_4
	})
end

function var_0_0.SyncResetSlotData(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0:GetIsland()
	local var_57_1 = var_57_0:GetBuildingAgency()

	for iter_57_0, iter_57_1 in ipairs(arg_57_1.slot_list) do
		local var_57_2 = pg.island_production_slot[iter_57_1]
		local var_57_3 = var_57_2.place
		local var_57_4 = var_57_1:GetBuilding(var_57_3)

		if var_57_2.type == 9 or var_57_2.type == 3 then
			local var_57_5 = var_57_4:GetDelegationSlotData(iter_57_1)
			local var_57_6 = var_57_5 and var_57_5:GetSlotRoleData()

			if var_57_6 then
				local var_57_7 = var_57_6.ship_id
				local var_57_8 = iter_57_1

				var_57_4:UpdateDeleationRoleDataBySlotId(iter_57_1, nil)
				var_57_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
					remainReward = false,
					build_id = var_57_3,
					ship_id = var_57_7,
					area_id = var_57_8
				})
			end

			var_57_4:UpdateDeleationRewardDataBySlotId(iter_57_1, nil)
			var_57_0:DispatchEvent(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, {
				build_id = var_57_3,
				area_id = iter_57_1
			})
		elseif var_57_2.type == 1 then
			var_57_4:UpdateHandPlantDataBySlotId({
				formula_id = 0,
				end_time = 0,
				state = 0,
				id = iter_57_1
			})
			var_57_0:DispatchEvent(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, {
				build_id = var_57_3,
				area_id = iter_57_1
			})
		end
	end
end

function var_0_0.SyncStarthHandPlant(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_0:GetIsland()
	local var_58_1 = var_58_0:GetBuildingAgency()

	for iter_58_0, iter_58_1 in ipairs(arg_58_1.hand_list) do
		local var_58_2 = pg.island_production_slot[iter_58_1.id].place

		var_58_1:GetBuilding(var_58_2):UpdateHandPlantDataBySlotId(iter_58_1)
		var_58_0:DispatchEvent(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, {
			build_id = var_58_2,
			area_id = iter_58_1.id,
			formula_id = iter_58_1.formula_id
		})
	end
end

function var_0_0.ResponeAniamtion(arg_59_0, arg_59_1)
	arg_59_0:GetIsland():DispatchEvent(IslandProxy.LINK_CORE, ISLAND_EVT.RESPON_ANIMATION_OP, {
		id = arg_59_1.player_id,
		targetId = arg_59_1.target_id,
		actionId = arg_59_1.action_id
	})
end

function var_0_0.AddChatMsg(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0:GetIsland():GetVisitorAgency()
	local var_60_1 = getProxy(PlayerProxy):getRawData()
	local var_60_2 = arg_60_1.user_id == var_60_1.id and var_60_1 or var_60_0:GetPlayer(arg_60_1.user_id)

	if not var_60_2 then
		return
	end

	local var_60_3 = ChatProxy.InjectPublicMsg(arg_60_1.content, Clone(var_60_2))
	local var_60_4 = ChatMsg.New(ChatConst.ChannelIsland, var_60_3)

	getProxy(IslandProxy):AddChatMsg(arg_60_1.island_id, var_60_4)
end

function var_0_0.UpdateActivityNpc(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_0:GetIsland():GetActivityNpcAgency()

	for iter_61_0, iter_61_1 in ipairs(arg_61_1.refresh_list) do
		local var_61_1 = {
			id = iter_61_1.id,
			object_id = iter_61_1.object_id
		}

		if iter_61_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_UPDATE then
			var_61_0:UpdateNpc(var_61_1)
		elseif iter_61_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_ADD then
			var_61_0:AddNpc(var_61_1)
		elseif iter_61_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_DEL then
			var_61_0:RemoveNpc(var_61_1)
		end
	end
end

function var_0_0.UpdatePlayerDressupData(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_0:GetIsland()
	local var_62_1 = var_62_0:GetVisitorAgency():GetPlayer(arg_62_1.user_id)

	if not var_62_1 then
		return
	end

	local var_62_2 = {}

	for iter_62_0, iter_62_1 in ipairs(arg_62_1.dress_list) do
		local var_62_3 = iter_62_1.type
		local var_62_4 = iter_62_1.id
		local var_62_5 = 0

		for iter_62_2, iter_62_3 in ipairs(arg_62_1.dress_color or {}) do
			if iter_62_3.id == var_62_4 then
				var_62_5 = iter_62_3.color
			end
		end

		local var_62_6 = var_62_1:GetDressByType(var_62_3)
		local var_62_7 = var_62_1:GetCurrentColorByDressId(var_62_6)

		if var_62_6 ~= var_62_4 then
			var_62_2[var_62_3] = {
				changeedDressId = var_62_4,
				changedDressColorId = var_62_5
			}
		elseif var_62_7 ~= var_62_5 then
			var_62_2[var_62_3] = {
				changedDressColorId = var_62_5
			}
		end
	end

	var_62_0:DispatchEvent(IslandProxy.LINK_CORE, ISLAND_EVT.CHANGE_VISTER_DRESS, {
		id = arg_62_1.user_id,
		changeDressData = var_62_2
	})
	var_62_1:ChangeDressupData(arg_62_1.dress_list, arg_62_1.dress_color)
end

return var_0_0

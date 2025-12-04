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
end

function var_0_0.HandFishingStart(arg_28_0, arg_28_1)
	arg_28_0:emitCore(ISLAND_EVT.START_FISHING, {
		unitId = arg_28_1.user_id,
		fishPointId = arg_28_1.point_id,
		rodId = arg_28_1.rod_id,
		fishId = arg_28_1.fish_id
	})
end

function var_0_0.HandFishingStateChange(arg_29_0, arg_29_1)
	arg_29_0:emitCore(ISLAND_EVT.FISHING_STATE_CHANGE, {
		unitId = arg_29_1.user_id,
		fishPointId = arg_29_1.point_id,
		op = arg_29_1.type
	})
end

function var_0_0.HandleAgoraData(arg_30_0, arg_30_1)
	if getProxy(IslandProxy):GetIsland().id == arg_30_0:GetIsland().id then
		return
	end

	arg_30_0:GetIsland():GetAgoraAgency():UpdatePlacedData(arg_30_1)
end

function var_0_0.HandlePlayerData(arg_31_0, arg_31_1)
	warning("HandlePlayerData>>>>>>>>>", arg_31_1.state, arg_31_1.map_id, arg_31_1.id)

	if arg_31_1.state == IslandConst.PLAYER_DATA_STATE_EMPTY then
		arg_31_0:UpdatePlayerData(arg_31_1)
	elseif arg_31_1.state == IslandConst.PLAYER_DATA_STATE_ENTER then
		arg_31_0:HandlePlayerEnter(arg_31_1)
	elseif arg_31_1.state == IslandConst.PLAYER_DATA_STATE_EXIT then
		arg_31_0:HandlePlayerExit(arg_31_1.id)
	end
end

function var_0_0.HandlePlayerExit(arg_32_0, arg_32_1)
	if arg_32_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_32_1] then
		arg_32_0:GetIsland():GetVisitorAgency():DeletePlayer(arg_32_1)
	end

	if arg_32_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_32_1] then
		arg_32_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_32_1)
	end
end

function var_0_0.HandlePlayerEnter(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1.id

	if not arg_33_0:GetIsland():GetVisitorAgency():GetPlayerList()[var_33_0] then
		local var_33_1 = IslandPlayer.New(arg_33_1)

		arg_33_0:GetIsland():GetVisitorAgency():AddPlayer(var_33_1)

		if var_33_1:IsInMap(arg_33_0:GetIsland():GetMapId()) then
			arg_33_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_33_1)
		end
	end
end

function var_0_0.UpdatePlayerData(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_34_1.id]

	if var_34_0 then
		var_34_0:Flush(arg_34_1)
	end

	local var_34_1 = var_34_0 and var_34_0:IsInMap(arg_34_0:GetIsland():GetMapId())
	local var_34_2 = arg_34_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_34_1.id]

	if var_34_1 and not var_34_2 then
		arg_34_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_34_0)
	elseif not var_34_1 and var_34_2 then
		arg_34_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_34_1.id)
	elseif var_34_1 and var_34_2 then
		var_34_2:Flush(arg_34_1)
	end
end

function var_0_0.HandleOrderData(arg_35_0, arg_35_1)
	arg_35_0:GetIsland():GetOrderAgency():UpdateOrAddOrder(arg_35_1)
end

function var_0_0.HandleTaskData(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0:GetIsland():GetTaskAgency()

	for iter_36_0, iter_36_1 in ipairs(arg_36_1) do
		local var_36_1 = underscore.all(iter_36_1.process_list, function(arg_37_0)
			return arg_37_0.target_count == 0
		end)
		local var_36_2 = IslandTask.New(iter_36_1)

		if var_36_1 then
			var_36_0:AddTask(var_36_2)
		else
			var_36_0:UpdateTask(var_36_2)
		end
	end
end

function var_0_0.HandleRandomTaskData(arg_38_0, arg_38_1)
	arg_38_0:GetIsland():GetTaskAgency():InitFutureTasks(arg_38_1.task_list_random or {})

	local var_38_0 = arg_38_1.task_list or {}
	local var_38_1 = arg_38_0:GetIsland():GetTaskAgency()

	for iter_38_0, iter_38_1 in ipairs(var_38_0) do
		local var_38_2 = IslandTask.New(iter_38_1)

		var_38_1:AddTask(var_38_2)
	end

	if #var_38_0 > 0 then
		var_38_1:TryAutoTrackTask()
	end
end

function var_0_0.HandleManageData(arg_39_0, arg_39_1)
	local var_39_0 = getProxy(IslandProxy):GetIsland():GetManageAgency()

	if arg_39_1.type == 1 then
		var_39_0:DailyRefresh(arg_39_1)
	elseif arg_39_1.type == 2 then
		var_39_0:UnlockDailyEvent(arg_39_1)
	end
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

function var_0_0.HandleAchievementData(arg_41_0, arg_41_1)
	local var_41_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	for iter_41_0, iter_41_1 in ipairs(arg_41_1) do
		var_41_0:UpdateRecord(iter_41_1.event_type, iter_41_1.event_arg, iter_41_1.value)
	end
end

function var_0_0.HandleBookData(arg_42_0, arg_42_1)
	getProxy(IslandProxy):GetIsland():GetBookAgency():HandlePushData(arg_42_1)
end

function var_0_0.HandleSlotFormulaData(arg_43_0, arg_43_1)
	local var_43_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_43_1 = arg_43_1.area_id
	local var_43_2 = pg.island_production_slot[var_43_1].place

	var_43_0:GetBuilding(var_43_2):GetDelegationSlotData(var_43_1):AddFormulaNum(arg_43_1)
end

function var_0_0.HandleBuildUnlockData(arg_44_0, arg_44_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitBuildData(arg_44_1.build)
end

function var_0_0.HandleHandSlotUnlockData(arg_45_0, arg_45_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitHandSlotData(arg_45_1.collect)
end

function var_0_0.HandleSignInData(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0:GetIsland():GetSignInAgency()

	var_46_0:UpdateGiftEndTime(arg_46_1.gift_timestamp)
	var_46_0:UpdateFetchedList(arg_46_1.gift_visitor)
	var_46_0:SetGiftCnt(arg_46_1.gift_count)
end

function var_0_0.HandleSignInNotify(arg_47_0, arg_47_1)
	if arg_47_1.cmd == 2 then
		local var_47_0 = getProxy(FriendProxy):getFriend(arg_47_1.island_id)
		local var_47_1 = var_47_0 and var_47_0:GetName() or ""
		local var_47_2 = IslandVisitorLog.New({
			id = arg_47_1.island_id,
			cmd = IslandConst.VISITOR_LOG_CMD_GIFT,
			name = var_47_1,
			time = pg.TimeMgr.GetInstance():GetServerTime()
		})

		if arg_47_0:IsCurrentIsland(arg_47_1.island_id) then
			local var_47_3 = arg_47_0:GetIsland():GetSignInAgency()
			local var_47_4 = getProxy(PlayerProxy):getRawData().id

			var_47_3:AddInviter(var_47_4)
		end

		pg.IslandVisitorNotificationMgr.GetInstance():Enqueue(var_47_2)
	end
end

function var_0_0.HandleWildGatherInData(arg_48_0, arg_48_1)
	arg_48_0:GetIsland():GetWildCollectAgency():UpdateGatherData(arg_48_1)
end

function var_0_0.HandleWildCollectInData(arg_49_0, arg_49_1)
	arg_49_0:GetIsland():GetWildCollectAgency():UpdateCollectFragmentData(arg_49_1)
end

function var_0_0.HandleAbilityData(arg_50_0, arg_50_1)
	local var_50_0 = getProxy(IslandProxy):GetSharedIsland()

	if not var_50_0 then
		return
	end

	var_50_0:GetAblityAgency():AddAblity(arg_50_1.ability_id)
end

function var_0_0.SyncStartDelegation(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_0:GetIsland()
	local var_51_1 = var_51_0:GetBuildingAgency()
	local var_51_2 = pg.island_production_slot[arg_51_1.appoint_data.id].place

	var_51_1:GetBuilding(var_51_2):UpdateDeleationRoleDataBySlotId(arg_51_1.appoint_data.id, arg_51_1.appoint_data)

	local var_51_3 = arg_51_1.appoint_data.ship_id
	local var_51_4 = arg_51_1.appoint_data.id
	local var_51_5 = arg_51_1.appoint_data.formula_id

	var_51_0:DispatchEvent(IslandStartDelegationCommand.START_DELEGATION, {
		build_id = var_51_2,
		ship_id = var_51_3,
		area_id = var_51_4,
		formula_id = var_51_5
	})
end

function var_0_0.SyncEndDelegation(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0:GetIsland()
	local var_52_1 = island:GetBuildingAgency():GetBuilding(arg_52_0.buildId)
	local var_52_2 = arg_52_0.islandRoleDelegationData.formula_id
	local var_52_3 = arg_52_0.islandRoleDelegationData.ship_id
	local var_52_4 = arg_52_0.id

	var_52_1:UpdateDeleationRewardDataBySlotId(arg_52_0.id, {
		formula_id = var_52_2
	})
	var_52_1:UpdateDeleationRoleDataBySlotId(arg_52_0.id, nil)
	var_52_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
		remainReward = true,
		build_id = build_id,
		ship_id = var_52_3,
		area_id = var_52_4
	})
end

function var_0_0.SyncResetSlotData(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0:GetIsland()
	local var_53_1 = var_53_0:GetBuildingAgency()

	for iter_53_0, iter_53_1 in ipairs(arg_53_1.slot_list) do
		local var_53_2 = pg.island_production_slot[iter_53_1]
		local var_53_3 = var_53_2.place
		local var_53_4 = var_53_1:GetBuilding(var_53_3)

		if var_53_2.type == 9 or var_53_2.type == 3 then
			local var_53_5 = var_53_4:GetDelegationSlotData(iter_53_1)
			local var_53_6 = var_53_5 and var_53_5:GetSlotRoleData()

			if var_53_6 then
				local var_53_7 = var_53_6.ship_id
				local var_53_8 = iter_53_1

				var_53_4:UpdateDeleationRoleDataBySlotId(iter_53_1, nil)
				var_53_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
					remainReward = false,
					build_id = var_53_3,
					ship_id = var_53_7,
					area_id = var_53_8
				})
			end

			var_53_4:UpdateDeleationRewardDataBySlotId(iter_53_1, nil)
			var_53_0:DispatchEvent(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, {
				build_id = var_53_3,
				area_id = iter_53_1
			})
		elseif var_53_2.type == 1 then
			var_53_4:UpdateHandPlantDataBySlotId({
				formula_id = 0,
				end_time = 0,
				state = 0,
				id = iter_53_1
			})
			var_53_0:DispatchEvent(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, {
				build_id = var_53_3,
				area_id = iter_53_1
			})
		end
	end
end

function var_0_0.SyncStarthHandPlant(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0:GetIsland()
	local var_54_1 = var_54_0:GetBuildingAgency()

	for iter_54_0, iter_54_1 in ipairs(arg_54_1.hand_list) do
		local var_54_2 = pg.island_production_slot[iter_54_1.id].place

		var_54_1:GetBuilding(var_54_2):UpdateHandPlantDataBySlotId(iter_54_1)
		var_54_0:DispatchEvent(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, {
			build_id = var_54_2,
			area_id = iter_54_1.id,
			formula_id = iter_54_1.formula_id
		})
	end
end

function var_0_0.ResponeAniamtion(arg_55_0, arg_55_1)
	arg_55_0:GetIsland():DispatchEvent(IslandProxy.LINK_CORE, ISLAND_EVT.RESPON_ANIMATION_OP, {
		id = arg_55_1.player_id,
		targetId = arg_55_1.target_id,
		actionId = arg_55_1.action_id
	})
end

function var_0_0.AddChatMsg(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:GetIsland():GetVisitorAgency()
	local var_56_1 = getProxy(PlayerProxy):getRawData()
	local var_56_2 = arg_56_1.user_id == var_56_1.id and var_56_1 or var_56_0:GetPlayer(arg_56_1.user_id)

	if not var_56_2 then
		return
	end

	local var_56_3 = ChatProxy.InjectPublicMsg(arg_56_1.content, Clone(var_56_2))
	local var_56_4 = ChatMsg.New(ChatConst.ChannelIsland, var_56_3)

	getProxy(IslandProxy):AddChatMsg(arg_56_1.island_id, var_56_4)
end

function var_0_0.UpdateActivityNpc(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0:GetIsland():GetActivityNpcAgency()

	for iter_57_0, iter_57_1 in ipairs(arg_57_1.refresh_list) do
		local var_57_1 = {
			id = iter_57_1.id,
			object_id = iter_57_1.object_id
		}

		if iter_57_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_UPDATE then
			var_57_0:UpdateNpc(var_57_1)
		elseif iter_57_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_ADD then
			var_57_0:AddNpc(var_57_1)
		elseif iter_57_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_DEL then
			var_57_0:RemoveNpc(var_57_1)
		end
	end
end

function var_0_0.UpdatePlayerDressupData(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_0:GetIsland()
	local var_58_1 = var_58_0:GetVisitorAgency():GetPlayer(arg_58_1.user_id)

	if not var_58_1 then
		return
	end

	local var_58_2 = {}

	for iter_58_0, iter_58_1 in ipairs(arg_58_1.dress_list) do
		local var_58_3 = iter_58_1.type
		local var_58_4 = iter_58_1.id
		local var_58_5 = 0

		for iter_58_2, iter_58_3 in ipairs(arg_58_1.dress_color or {}) do
			if iter_58_3.id == var_58_4 then
				var_58_5 = iter_58_3.color
			end
		end

		local var_58_6 = var_58_1:GetDressByType(var_58_3)
		local var_58_7 = var_58_1:GetCurrentColorByDressId(var_58_6)

		if var_58_6 ~= var_58_4 then
			var_58_2[var_58_3] = {
				changeedDressId = var_58_4,
				changedDressColorId = var_58_5
			}
		elseif var_58_7 ~= var_58_5 then
			var_58_2[var_58_3] = {
				changedDressColorId = var_58_5
			}
		end
	end

	var_58_0:DispatchEvent(IslandProxy.LINK_CORE, ISLAND_EVT.CHANGE_VISTER_DRESS, {
		id = arg_58_1.user_id,
		changeDressData = var_58_2
	})
	var_58_1:ChangeDressupData(arg_58_1.dress_list, arg_58_1.dress_color)
end

return var_0_0

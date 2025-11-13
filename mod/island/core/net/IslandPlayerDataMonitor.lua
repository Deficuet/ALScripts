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
		arg_1_0:HandleRandomTaskData(arg_6_0.task_list or {})
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

		if not arg_1_0:IsSelf(arg_13_0.island_id) then
			return
		end

		arg_1_0:HandleSignInData(arg_13_0)
	end)
	arg_1_0:on(21528, function(arg_14_0)
		if not arg_1_0:IsSelf(arg_14_0.island_id) then
			return
		end

		arg_1_0:HandleWildGatherInData(arg_14_0)
	end)
	arg_1_0:on(21535, function(arg_15_0)
		if not arg_1_0:IsSelf(arg_15_0.island_id) then
			return
		end

		arg_1_0:HandleWildCollectInData(arg_15_0)
	end)
	arg_1_0:on(21227, function(arg_16_0)
		if not arg_1_0:IsSelf(arg_16_0.island_id) then
			return
		end

		arg_1_0:HandleAbilityData(arg_16_0)
	end)
	arg_1_0:on(21225, function(arg_17_0)
		if not arg_1_0:IsSelf(arg_17_0.island_id) then
			return
		end

		arg_1_0:SyncStartManage(arg_17_0)
	end)
	arg_1_0:on(21220, function(arg_18_0)
		if not arg_1_0:IsSelf(arg_18_0.island_id) then
			return
		end

		arg_1_0:SyncStartDelegation(arg_18_0)
	end)
	arg_1_0:on(21226, function(arg_19_0)
		if not arg_1_0:IsSelf(arg_19_0.island_id) then
			return
		end

		arg_1_0:SyncEndDelegation(arg_19_0)
	end)
	arg_1_0:on(21222, function(arg_20_0)
		if not arg_1_0:IsSelf(arg_20_0.island_id) then
			return
		end

		arg_1_0:SyncResetSlotData(arg_20_0)
	end)
	arg_1_0:on(21221, function(arg_21_0)
		if not arg_1_0:IsSelf(arg_21_0.island_id) then
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
		if not arg_1_0:IsSelf(arg_24_0.island_id) then
			return
		end

		arg_1_0:UpdateActivityNpc(arg_24_0)
	end)
	arg_1_0:on(21224, function(arg_25_0)
		if not arg_1_0:IsSelf(arg_25_0.island_id) then
			return
		end

		arg_1_0:UpdatePlayerDressupData(arg_25_0)
	end)
end

function var_0_0.HandleAgoraData(arg_26_0, arg_26_1)
	if getProxy(IslandProxy):GetIsland().id == arg_26_0:GetIsland().id then
		return
	end

	arg_26_0:GetIsland():GetAgoraAgency():UpdatePlacedData(arg_26_1)
end

function var_0_0.HandlePlayerData(arg_27_0, arg_27_1)
	warning("HandlePlayerData>>>>>>>>>", arg_27_1.state, arg_27_1.map_id, arg_27_1.id)

	if arg_27_1.state == IslandConst.PLAYER_DATA_STATE_EMPTY then
		arg_27_0:UpdatePlayerData(arg_27_1)
	elseif arg_27_1.state == IslandConst.PLAYER_DATA_STATE_ENTER then
		arg_27_0:HandlePlayerEnter(arg_27_1)
	elseif arg_27_1.state == IslandConst.PLAYER_DATA_STATE_EXIT then
		arg_27_0:HandlePlayerExit(arg_27_1.id)
	end
end

function var_0_0.HandlePlayerExit(arg_28_0, arg_28_1)
	if arg_28_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_28_1] then
		arg_28_0:GetIsland():GetVisitorAgency():DeletePlayer(arg_28_1)
	end

	if arg_28_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_28_1] then
		arg_28_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_28_1)
	end
end

function var_0_0.HandlePlayerEnter(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1.id

	if not arg_29_0:GetIsland():GetVisitorAgency():GetPlayerList()[var_29_0] then
		local var_29_1 = IslandPlayer.New(arg_29_1)

		arg_29_0:GetIsland():GetVisitorAgency():AddPlayer(var_29_1)

		if var_29_1:IsInMap(arg_29_0:GetIsland():GetMapId()) then
			arg_29_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_29_1)
		end
	end
end

function var_0_0.UpdatePlayerData(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_30_1.id]

	if var_30_0 then
		var_30_0:Flush(arg_30_1)
	end

	local var_30_1 = var_30_0 and var_30_0:IsInMap(arg_30_0:GetIsland():GetMapId())
	local var_30_2 = arg_30_0:GetIsland():GetVisitorAgency():GetMapVisitorList()[arg_30_1.id]

	if var_30_1 and not var_30_2 then
		arg_30_0:GetIsland():GetVisitorAgency():AddMapVisitor(var_30_0)
	elseif not var_30_1 and var_30_2 then
		arg_30_0:GetIsland():GetVisitorAgency():DeleteMapVisitor(arg_30_1.id)
	elseif var_30_1 and var_30_2 then
		var_30_2:Flush(arg_30_1)
	end
end

function var_0_0.HandleOrderData(arg_31_0, arg_31_1)
	arg_31_0:GetIsland():GetOrderAgency():UpdateOrAddOrder(arg_31_1)
end

function var_0_0.HandleTaskData(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:GetIsland():GetTaskAgency()

	for iter_32_0, iter_32_1 in ipairs(arg_32_1) do
		local var_32_1 = underscore.all(iter_32_1.process_list, function(arg_33_0)
			return arg_33_0.target_count == 0
		end)
		local var_32_2 = IslandTask.New(iter_32_1)

		if var_32_1 then
			var_32_0:AddTask(var_32_2)
		else
			var_32_0:UpdateTask(var_32_2)
		end
	end
end

function var_0_0.HandleRandomTaskData(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetIsland():GetTaskAgency()

	for iter_34_0, iter_34_1 in ipairs(arg_34_1) do
		local var_34_1 = IslandTask.New(iter_34_1)

		var_34_0:AddTask(var_34_1)
	end

	if #arg_34_1 > 0 then
		var_34_0:TryAutoTrackTask()
	end
end

function var_0_0.HandleManageData(arg_35_0, arg_35_1)
	local var_35_0 = getProxy(IslandProxy):GetIsland():GetManageAgency()

	if arg_35_1.type == 1 then
		var_35_0:DailyRefresh(arg_35_1)
	elseif arg_35_1.type == 2 then
		var_35_0:UnlockDailyEvent(arg_35_1)
	end
end

function var_0_0.HandleAchievementData(arg_36_0, arg_36_1)
	local var_36_0 = getProxy(IslandProxy):GetIsland():GetAchievementAgency()

	for iter_36_0, iter_36_1 in ipairs(arg_36_1) do
		var_36_0:UpdateRecord(iter_36_1.event_type, iter_36_1.event_arg, iter_36_1.value)
	end
end

function var_0_0.HandleBookData(arg_37_0, arg_37_1)
	getProxy(IslandProxy):GetIsland():GetBookAgency():HandlePushData(arg_37_1)
end

function var_0_0.HandleSlotFormulaData(arg_38_0, arg_38_1)
	local var_38_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_38_1 = arg_38_1.area_id
	local var_38_2 = pg.island_production_slot[var_38_1].place

	var_38_0:GetBuilding(var_38_2):GetDelegationSlotData(var_38_1):AddFormulaNum(arg_38_1)
end

function var_0_0.HandleBuildUnlockData(arg_39_0, arg_39_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitBuildData(arg_39_1.build)
end

function var_0_0.HandleHandSlotUnlockData(arg_40_0, arg_40_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitHandSlotData(arg_40_1.collect)
end

function var_0_0.HandleSignInData(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0:GetIsland():GetSignInAgency()

	var_41_0:UpdateGiftEndTime(arg_41_1.gift_timestamp)
	var_41_0:UpdateFetchedList(arg_41_1.gift_visitor)
	var_41_0:SetGiftCnt(arg_41_1.gift_count)
end

function var_0_0.HandleSignInNotify(arg_42_0, arg_42_1)
	if arg_42_1.cmd == 2 then
		local var_42_0 = getProxy(FriendProxy):getFriend(arg_42_1.island_id)
		local var_42_1 = var_42_0 and var_42_0:GetName() or ""
		local var_42_2 = IslandVisitorLog.New({
			id = arg_42_1.island_id,
			cmd = IslandConst.VISITOR_LOG_CMD_GIFT,
			name = var_42_1,
			time = pg.TimeMgr.GetInstance():GetServerTime()
		})

		if arg_42_0:IsSelf(arg_42_1.island_id) then
			local var_42_3 = arg_42_0:GetIsland():GetSignInAgency()
			local var_42_4 = getProxy(PlayerProxy):getRawData().id

			var_42_3:AddInviter(var_42_4)
		end

		pg.IslandVisitorNotificationMgr.GetInstance():Enqueue(var_42_2)
	end
end

function var_0_0.HandleWildGatherInData(arg_43_0, arg_43_1)
	arg_43_0:GetIsland():GetWildCollectAgency():UpdateGatherData(arg_43_1)
end

function var_0_0.HandleWildCollectInData(arg_44_0, arg_44_1)
	arg_44_0:GetIsland():GetWildCollectAgency():UpdateCollectFragmentData(arg_44_1)
end

function var_0_0.HandleAbilityData(arg_45_0, arg_45_1)
	local var_45_0 = getProxy(IslandProxy):GetSharedIsland()

	if not var_45_0 then
		return
	end

	var_45_0:GetAblityAgency():AddAblity(arg_45_1.ability_id)
end

function var_0_0.SyncStartManage(arg_46_0, arg_46_1)
	local var_46_0 = getProxy(IslandProxy):GetIsland():GetManageAgency()
	local var_46_1 = arg_46_1.trade
	local var_46_2 = var_46_0:GetRestaurant(var_46_1.id)

	if not var_46_2 then
		var_46_0:UnlockNewRestaurant(var_46_1.id)

		var_46_2 = var_46_0:GetRestaurant(var_46_1.id)
	end

	var_46_2:UpdateData(var_46_1)
	getProxy(IslandProxy):GetSharedIsland():DispatchEvent(IslandOpenRestaurantCommand.OPEN_RESTAURANT, {
		restId = var_46_2.id,
		postList = var_46_1.post_list
	})
end

function var_0_0.SyncStartDelegation(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:GetIsland()
	local var_47_1 = var_47_0:GetBuildingAgency()
	local var_47_2 = pg.island_production_slot[arg_47_1.appoint_data.id].place

	var_47_1:GetBuilding(var_47_2):UpdateDeleationRoleDataBySlotId(arg_47_1.appoint_data.id, arg_47_1.appoint_data)

	local var_47_3 = arg_47_1.appoint_data.ship_id
	local var_47_4 = arg_47_1.appoint_data.id

	var_47_0:DispatchEvent(IslandStartDelegationCommand.START_DELEGATION, {
		build_id = var_47_2,
		ship_id = var_47_3,
		area_id = var_47_4
	})
end

function var_0_0.SyncEndDelegation(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_0:GetIsland()
	local var_48_1 = island:GetBuildingAgency():GetBuilding(arg_48_0.buildId)
	local var_48_2 = arg_48_0.islandRoleDelegationData.formula_id
	local var_48_3 = arg_48_0.islandRoleDelegationData.ship_id
	local var_48_4 = arg_48_0.id

	var_48_1:UpdateDeleationRewardDataBySlotId(arg_48_0.id, {
		formula_id = var_48_2
	})
	var_48_1:UpdateDeleationRoleDataBySlotId(arg_48_0.id, nil)
	var_48_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
		remainReward = true,
		build_id = build_id,
		ship_id = var_48_3,
		area_id = var_48_4
	})
end

function var_0_0.SyncResetSlotData(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_0:GetIsland()
	local var_49_1 = var_49_0:GetBuildingAgency()

	for iter_49_0, iter_49_1 in ipairs(arg_49_1.slot_list) do
		local var_49_2 = pg.island_production_slot[iter_49_1]
		local var_49_3 = var_49_2.place
		local var_49_4 = var_49_1:GetBuilding(var_49_3)

		if var_49_2.type == 9 or var_49_2.type == 3 then
			local var_49_5 = var_49_4:GetDelegationSlotData(iter_49_1)
			local var_49_6 = var_49_5 and var_49_5:GetSlotRoleData()

			if var_49_6 then
				local var_49_7 = var_49_6.ship_id
				local var_49_8 = iter_49_1

				var_49_4:UpdateDeleationRoleDataBySlotId(iter_49_1, nil)
				var_49_0:DispatchEvent(IslandFinishDelegationCommand.END_DELEGATION, {
					remainReward = false,
					build_id = var_49_3,
					ship_id = var_49_7,
					area_id = var_49_8
				})
			end

			var_49_4:UpdateDeleationRewardDataBySlotId(iter_49_1, nil)
			var_49_0:DispatchEvent(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, {
				build_id = var_49_3,
				area_id = iter_49_1
			})
		elseif var_49_2.type == 1 then
			var_49_4:UpdateHandPlantDataBySlotId({
				formula_id = 0,
				end_time = 0,
				state = 0,
				id = iter_49_1
			})
			var_49_0:DispatchEvent(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, {
				build_id = var_49_3,
				area_id = iter_49_1
			})
		end
	end
end

function var_0_0.SyncStarthHandPlant(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_0:GetIsland()
	local var_50_1 = var_50_0:GetBuildingAgency()

	for iter_50_0, iter_50_1 in ipairs(arg_50_1.hand_list) do
		local var_50_2 = pg.island_production_slot[iter_50_1.id].place

		var_50_1:GetBuilding(var_50_2):UpdateHandPlantDataBySlotId(iter_50_1)
		var_50_0:DispatchEvent(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, {
			build_id = var_50_2,
			area_id = iter_50_1.id,
			formula_id = iter_50_1.formula_id
		})
	end
end

function var_0_0.ResponeAniamtion(arg_51_0, arg_51_1)
	arg_51_0:GetIsland():DispatchEvent(IslandProxy.LINK_CORE, ISLAND_EVT.RESPON_ANIMATION_OP, {
		id = arg_51_1.player_id,
		targetId = arg_51_1.target_id,
		actionId = arg_51_1.action_id
	})
end

function var_0_0.AddChatMsg(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0:GetIsland():GetVisitorAgency()
	local var_52_1 = getProxy(PlayerProxy):getRawData()
	local var_52_2 = arg_52_1.user_id == var_52_1.id and var_52_1 or var_52_0:GetPlayer(arg_52_1.user_id)

	if not var_52_2 then
		return
	end

	local var_52_3 = ChatProxy.InjectPublicMsg(arg_52_1.content, Clone(var_52_2))
	local var_52_4 = ChatMsg.New(ChatConst.ChannelIsland, var_52_3)

	getProxy(IslandProxy):AddChatMsg(arg_52_1.island_id, var_52_4)
end

function var_0_0.UpdateActivityNpc(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0:GetIsland():GetActivityNpcAgency()

	for iter_53_0, iter_53_1 in ipairs(arg_53_1.refresh_list) do
		local var_53_1 = {
			id = iter_53_1.id,
			object_id = iter_53_1.object_id
		}

		if iter_53_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_UPDATE then
			var_53_0:UpdateNpc(var_53_1)
		elseif iter_53_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_ADD then
			var_53_0:AddNpc(var_53_1)
		elseif iter_53_1.type == IslandConst.ACTIVITY_NPC_OP_TYPE_DEL then
			var_53_0:RemoveNpc(var_53_1)
		end
	end
end

function var_0_0.UpdatePlayerDressupData(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0:GetIsland()
	local var_54_1 = var_54_0:GetVisitorAgency():GetPlayer(arg_54_1.user_id)

	if not var_54_1 then
		return
	end

	local var_54_2 = {}

	for iter_54_0, iter_54_1 in ipairs(arg_54_1.dress_list) do
		local var_54_3 = iter_54_1.type
		local var_54_4 = iter_54_1.id
		local var_54_5 = 0

		for iter_54_2, iter_54_3 in ipairs(arg_54_1.dress_color or {}) do
			if iter_54_3.id == var_54_4 then
				var_54_5 = iter_54_3.color
			end
		end

		local var_54_6 = var_54_1:GetDressByType(var_54_3)
		local var_54_7 = var_54_1:GetCurrentColorByDressId(var_54_6)

		if var_54_6 ~= var_54_4 then
			var_54_2[var_54_3] = {
				changeedDressId = var_54_4,
				changedDressColorId = var_54_5
			}
		elseif var_54_7 ~= var_54_5 then
			var_54_2[var_54_3] = {
				changedDressColorId = var_54_5
			}
		end
	end

	var_54_0:DispatchEvent(IslandProxy.LINK_CORE, ISLAND_EVT.CHANGE_VISTER_DRESS, {
		id = arg_54_1.user_id,
		changeDressData = var_54_2
	})
	var_54_1:ChangeDressupData(arg_54_1.dress_list, arg_54_1.dress_color)
end

return var_0_0

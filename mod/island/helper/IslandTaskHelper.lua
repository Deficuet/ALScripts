local var_0_0 = class("IslandTaskHelper")

function var_0_0.GetRuntimeData(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1[1]
	local var_1_1 = getProxy(IslandProxy):GetIsland()
	local var_1_2 = var_1_1:GetCharacterAgency()

	return switch(arg_1_0, {
		[IslandTaskTargetType.RECYCLE] = function()
			return var_1_1:GetInventoryAgency():GetOwnCount(var_1_0)
		end,
		[IslandTaskTargetType.TECHNOLOGY] = function()
			return var_1_1:GetTechnologyAgency():IsFinishedTech(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.ISLAND_LV] = function()
			return var_1_1:GetLevel()
		end,
		[IslandTaskTargetType.FRAGMENT] = function()
			return var_1_1:GetWildCollectAgency():ExistFragment(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.UNLOCK_SHIP] = function()
			return var_1_2:GetShipById(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.FURNITURE] = function()
			local var_7_0 = var_1_1:GetAgoraAgency()

			return var_1_0 == 0 and #var_7_0:GetFurnitures() or #var_7_0:GetFurnituresByType(var_1_0)
		end,
		[IslandTaskTargetType.COMMANDER_DRESS] = function()
			local var_8_0 = var_1_1:GetDressUpAgency()

			return var_1_0 == 0 and #var_8_0:GetAllHasDress() or #var_8_0:GetHasDressByType(var_1_0)
		end,
		[IslandTaskTargetType.SHIP_DRESS] = function()
			return var_1_0 == 0 and var_1_2:GetDiffDressCnt() or var_1_2:GetDiffDressCntByType(var_1_0)
		end,
		[IslandTaskTargetType.SHIP_SKIN] = function()
			return var_1_0 == 0 and var_1_2:GetAllSkinCnt() or #var_1_2:GetOwnSkinListByShipId(var_1_0)
		end,
		[IslandTaskTargetType.SKIN_ALL_COLOR] = function()
			local var_11_0 = var_1_2:GetSkinData(var_1_0)

			return var_11_0 and var_11_0:IsOwnAllColor() and 1 or 0
		end,
		[IslandTaskTargetType.SKIN_COLOR] = function()
			local var_12_0 = pg.island_skin_colordiff_template[var_1_0].skin_group
			local var_12_1 = var_1_2:GetSkinData(var_12_0)

			return var_12_1 and var_12_1:CheckColorOwned(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.ACHIEVEMENT] = function()
			return var_1_1:GetAchievementAgency():IsGot(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.TASK] = function()
			return pg.island_task[var_1_0].count_offset == 1 and var_1_1:GetTaskAgency():IsFinishTask(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.TASK_TYPE_PLUS] = function()
			return var_1_1:GetTaskAgency():GetFinishCntByType(var_1_0, true)
		end,
		[IslandTaskTargetType.RESTAURANT_RANK] = function()
			return var_1_1:GetManageAgency():GetCntByRestLevel(var_1_0)
		end,
		[IslandTaskTargetType.STORY] = function()
			local var_17_0 = pg.NewStoryMgr.GetInstance()
			local var_17_1 = var_17_0:StoryId2StoryName(var_1_0)

			return var_17_0:IsPlayed(var_17_1) and 1 or 0
		end,
		[IslandTaskTargetType.ACTION] = function()
			return var_1_1:GetActionAgency():ExistAction(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.COMMANDER_DRESS_ID] = function()
			return var_1_1:GetDressUpAgency():CheckOwnDress(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.SHIP_DRESS_ID] = function()
			return var_1_2:GetDressIdRealCount(var_1_0)
		end,
		[IslandTaskTargetType.ACTIVITY_ORDER] = function()
			return var_1_1:GetOrderAgency():GetFinishedCntByActId(var_1_0)
		end,
		[IslandTaskTargetType.ORDER_DAILY] = function()
			return var_1_1:GetOrderAgency():GetFinishCnt()
		end,
		[IslandTaskTargetType.ACTION_HELLO_DAILY] = function()
			return #var_1_1:GetNpcFeedbackAgency():GetNpcList()
		end,
		[IslandTaskTargetType.TASK_DAILY_IN_WEEK] = function()
			return var_1_1:GetTaskAgency():GetFinishedDailyCntInWeek()
		end,
		[IslandTaskTargetType.GAME_MAX_SCORE] = function()
			local var_25_0 = pg.mode_room[var_1_0].activity_type
			local var_25_1 = getProxy(ActivityProxy):getActivityByType(var_25_0)

			return var_25_1 and var_25_1.data2 or 0
		end,
		[IslandTaskTargetType.GAME_CUR_SCORE] = function()
			local var_26_0 = pg.mode_room[var_1_0].activity_type
			local var_26_1 = getProxy(ActivityProxy):getActivityByType(var_26_0)

			return var_26_1 and var_26_1.data1 or 0
		end
	}, function()
		assert(false, "not exist runtime type: " .. arg_1_0)
	end)
end

function var_0_0.UpdateRuntimeTaskByTargetType(arg_28_0)
	local var_28_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

	for iter_28_0, iter_28_1 in pairs(var_28_0:GetTasks()) do
		if iter_28_1:ExistTargetType(arg_28_0) then
			var_28_0:UpdateTask(iter_28_1)
		end
	end
end

function var_0_0.UpdateClientTaskProgress(arg_29_0, arg_29_1)
	local var_29_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetDiffTargetIdsByTypeAndParam(arg_29_0, arg_29_1)

	for iter_29_0, iter_29_1 in ipairs(var_29_0) do
		pg.m02:sendNotification(GAME.ISLAND_UPDATE_TASK, {
			taskId = 0,
			progress = 1,
			targetId = iter_29_1
		})
	end
end

function var_0_0.OnApproach(arg_30_0)
	seriesAsync({
		function(arg_31_0)
			local var_31_0 = {}

			for iter_31_0, iter_31_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanAcceptTasks()) do
				if iter_31_1:CheckAcceptOnApproach(arg_30_0) then
					table.insert(var_31_0, iter_31_1.id)
				end
			end

			if #var_31_0 > 0 then
				pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
					taskIds = var_31_0,
					callback = arg_31_0
				})
			else
				arg_31_0()
			end
		end,
		function(arg_32_0)
			local var_32_0 = {}

			for iter_32_0, iter_32_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanSubmitTasks()) do
				if iter_32_1:CheckSubmitOnApproach(arg_30_0) then
					table.insert(var_32_0, iter_32_1.id)
				end
			end

			local var_32_1 = {}

			for iter_32_2, iter_32_3 in ipairs(var_32_0) do
				table.insert(var_32_1, function(arg_33_0)
					pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
						taskId = iter_32_3,
						callback = arg_33_0
					})
				end)
			end

			seriesAsync(var_32_1, arg_32_0)
		end
	}, function()
		var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.APPROACH, arg_30_0)
	end)
end

function var_0_0.OnActionEnd(arg_35_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, arg_35_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, 0)
end

function var_0_0.OnSubmitTask(arg_36_0)
	IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.TASK)
	IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.TASK_TYPE_PLUS)

	if underscore.any(arg_36_0, function(arg_37_0)
		local var_37_0 = pg.island_task[arg_37_0]

		return var_37_0.type == IslandTaskType.DAILY and var_37_0.count_offset == 1
	end) then
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.TASK_DAILY_IN_WEEK)
	end
end

function var_0_0._GetTaskAcceptStoryId(arg_38_0)
	local var_38_0 = pg.island_task[arg_38_0].rec_perform

	return pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_38_0)
end

function var_0_0._GetTaskTargetLinkStoryIds(arg_39_0)
	if pg.island_task_target[arg_39_0].type ~= IslandTaskTargetType.INTERACTION then
		return nil
	end

	local var_39_0 = pg.island_task_target[arg_39_0].target_param[1]
	local var_39_1 = pg.island_interaction[var_39_0]

	if var_39_1.type == IslandInteractionUntil.TYPE_STORY then
		local var_39_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_39_1.param)

		return var_39_2 and {
			var_39_2
		} or nil
	elseif var_39_1.type == IslandInteractionUntil.TYPE_PERFORMANCE then
		return IslandPerformancePerformer.GetStoryNameList(var_39_1.param)
	end

	return nil
end

function var_0_0._GetTaskSubmitStoryIds(arg_40_0)
	local var_40_0 = pg.island_task[arg_40_0].com_perform
	local var_40_1 = var_40_0[1]

	if not var_40_1 then
		return nil
	end

	local var_40_2 = var_40_0[2]

	if var_40_1 == 1 then
		local var_40_3 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_40_2)

		return var_40_3 and {
			var_40_3
		} or nil
	elseif var_40_1 == 2 then
		return IslandPerformancePerformer.GetStoryNameList(var_40_2)
	end

	return nil
end

function var_0_0._GetTaskLinkStoryIds(arg_41_0)
	local var_41_0 = {}
	local var_41_1 = var_0_0._GetTaskAcceptStoryId(arg_41_0.id)

	if var_41_1 then
		table.insert(var_41_0, var_41_1)
	end

	for iter_41_0, iter_41_1 in ipairs(arg_41_0:GetTargetList()) do
		if iter_41_1:IsFinish() then
			local var_41_2 = var_0_0._GetTaskTargetLinkStoryIds(iter_41_1.id)

			if var_41_2 then
				table.insertto(var_41_0, var_41_2)
			end
		end
	end

	return var_41_0
end

function var_0_0._GetFinishTaskLinkStoryIds(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = var_0_0._GetTaskAcceptStoryId(arg_42_0)

	if var_42_1 then
		table.insert(var_42_0, var_42_1)
	end

	for iter_42_0, iter_42_1 in ipairs(pg.island_task[arg_42_0].target_id) do
		local var_42_2 = var_0_0._GetTaskTargetLinkStoryIds(iter_42_1)

		if var_42_2 then
			table.insertto(var_42_0, var_42_2)
		end
	end

	local var_42_3 = var_0_0._GetTaskSubmitStoryIds(arg_42_0)

	if var_42_3 then
		table.insertto(var_42_0, var_42_3)
	end

	return var_42_0
end

function var_0_0.FixTaskLinksStory(arg_43_0)
	local var_43_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
	local var_43_1 = {}

	for iter_43_0, iter_43_1 in pairs(var_43_0:GetTasks()) do
		table.insertto(var_43_1, var_0_0._GetTaskLinkStoryIds(iter_43_1))
	end

	for iter_43_2, iter_43_3 in ipairs(var_43_0:GetFinishedIds()) do
		table.insertto(var_43_1, var_0_0._GetFinishTaskLinkStoryIds(iter_43_3))
	end

	for iter_43_4 = 3110000, 3119999 do
		local var_43_2 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(iter_43_4)

		if var_43_2 and pg.NewStoryMgr.GetInstance():GetPlayedFlag(iter_43_4) then
			local var_43_3 = IslandPerformancePerformer.GetStoryNameList(var_43_2)

			for iter_43_5, iter_43_6 in ipairs(var_43_3) do
				table.insert(var_43_1, iter_43_6)
			end
		end
	end

	if #var_43_1 > 0 then
		pg.m02:sendNotification(GAME.STORY_UPDATE_LIST, {
			storyIds = var_43_1,
			callback = arg_43_0
		})
	else
		arg_43_0()
	end
end

return var_0_0

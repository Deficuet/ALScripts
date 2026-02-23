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
		end
	}, function()
		assert(false, "not exist runtime type: " .. arg_1_0)
	end)
end

function var_0_0.UpdateRuntimeTaskByTargetType(arg_26_0)
	local var_26_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

	for iter_26_0, iter_26_1 in pairs(var_26_0:GetTasks()) do
		if iter_26_1:ExistTargetType(arg_26_0) then
			var_26_0:UpdateTask(iter_26_1)
		end
	end
end

function var_0_0.UpdateClientTaskProgress(arg_27_0, arg_27_1)
	local var_27_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetDiffTargetIdsByTypeAndParam(arg_27_0, arg_27_1)

	for iter_27_0, iter_27_1 in ipairs(var_27_0) do
		pg.m02:sendNotification(GAME.ISLAND_UPDATE_TASK, {
			taskId = 0,
			progress = 1,
			targetId = iter_27_1
		})
	end
end

function var_0_0.OnApproach(arg_28_0)
	seriesAsync({
		function(arg_29_0)
			local var_29_0 = {}

			for iter_29_0, iter_29_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanAcceptTasks()) do
				if iter_29_1:CheckAcceptOnApproach(arg_28_0) then
					table.insert(var_29_0, iter_29_1.id)
				end
			end

			if #var_29_0 > 0 then
				pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
					taskIds = var_29_0,
					callback = arg_29_0
				})
			else
				arg_29_0()
			end
		end,
		function(arg_30_0)
			local var_30_0 = {}

			for iter_30_0, iter_30_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanSubmitTasks()) do
				if iter_30_1:CheckSubmitOnApproach(arg_28_0) then
					table.insert(var_30_0, iter_30_1.id)
				end
			end

			local var_30_1 = {}

			for iter_30_2, iter_30_3 in ipairs(var_30_0) do
				table.insert(var_30_1, function(arg_31_0)
					pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
						taskId = iter_30_3,
						callback = arg_31_0
					})
				end)
			end

			seriesAsync(var_30_1, arg_30_0)
		end
	}, function()
		var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.APPROACH, arg_28_0)
	end)
end

function var_0_0.OnActionEnd(arg_33_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, arg_33_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, 0)
end

function var_0_0.OnSubmitTask(arg_34_0)
	IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.TASK)
	IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.TASK_TYPE_PLUS)

	if underscore.any(arg_34_0, function(arg_35_0)
		local var_35_0 = pg.island_task[arg_35_0]

		return var_35_0.type == IslandTaskType.DAILY and var_35_0.count_offset == 1
	end) then
		IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.TASK_DAILY_IN_WEEK)
	end
end

function var_0_0._GetTaskAcceptStoryId(arg_36_0)
	local var_36_0 = pg.island_task[arg_36_0].rec_perform

	return pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_36_0)
end

function var_0_0._GetTaskTargetLinkStoryIds(arg_37_0)
	if pg.island_task_target[arg_37_0].type ~= IslandTaskTargetType.INTERACTION then
		return nil
	end

	local var_37_0 = pg.island_task_target[arg_37_0].target_param[1]
	local var_37_1 = pg.island_interaction[var_37_0]

	if var_37_1.type == IslandInteractionUntil.TYPE_STORY then
		local var_37_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_37_1.param)

		return var_37_2 and {
			var_37_2
		} or nil
	elseif var_37_1.type == IslandInteractionUntil.TYPE_PERFORMANCE then
		return IslandPerformancePerformer.GetStoryNameList(var_37_1.param)
	end

	return nil
end

function var_0_0._GetTaskSubmitStoryIds(arg_38_0)
	local var_38_0 = pg.island_task[arg_38_0].com_perform
	local var_38_1 = var_38_0[1]

	if not var_38_1 then
		return nil
	end

	local var_38_2 = var_38_0[2]

	if var_38_1 == 1 then
		local var_38_3 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_38_2)

		return var_38_3 and {
			var_38_3
		} or nil
	elseif var_38_1 == 2 then
		return IslandPerformancePerformer.GetStoryNameList(var_38_2)
	end

	return nil
end

function var_0_0._GetTaskLinkStoryIds(arg_39_0)
	local var_39_0 = {}
	local var_39_1 = var_0_0._GetTaskAcceptStoryId(arg_39_0.id)

	if var_39_1 then
		table.insert(var_39_0, var_39_1)
	end

	for iter_39_0, iter_39_1 in ipairs(arg_39_0:GetTargetList()) do
		if iter_39_1:IsFinish() then
			local var_39_2 = var_0_0._GetTaskTargetLinkStoryIds(iter_39_1.id)

			if var_39_2 then
				table.insertto(var_39_0, var_39_2)
			end
		end
	end

	return var_39_0
end

function var_0_0._GetFinishTaskLinkStoryIds(arg_40_0)
	local var_40_0 = {}
	local var_40_1 = var_0_0._GetTaskAcceptStoryId(arg_40_0)

	if var_40_1 then
		table.insert(var_40_0, var_40_1)
	end

	for iter_40_0, iter_40_1 in ipairs(pg.island_task[arg_40_0].target_id) do
		local var_40_2 = var_0_0._GetTaskTargetLinkStoryIds(iter_40_1)

		if var_40_2 then
			table.insertto(var_40_0, var_40_2)
		end
	end

	local var_40_3 = var_0_0._GetTaskSubmitStoryIds(arg_40_0)

	if var_40_3 then
		table.insertto(var_40_0, var_40_3)
	end

	return var_40_0
end

function var_0_0.FixTaskLinksStory(arg_41_0)
	local var_41_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
	local var_41_1 = {}

	for iter_41_0, iter_41_1 in pairs(var_41_0:GetTasks()) do
		table.insertto(var_41_1, var_0_0._GetTaskLinkStoryIds(iter_41_1))
	end

	for iter_41_2, iter_41_3 in ipairs(var_41_0:GetFinishedIds()) do
		table.insertto(var_41_1, var_0_0._GetFinishTaskLinkStoryIds(iter_41_3))
	end

	for iter_41_4 = 3110000, 3119999 do
		local var_41_2 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(iter_41_4)

		if var_41_2 and pg.NewStoryMgr.GetInstance():GetPlayedFlag(iter_41_4) then
			local var_41_3 = IslandPerformancePerformer.GetStoryNameList(var_41_2)

			for iter_41_5, iter_41_6 in ipairs(var_41_3) do
				table.insert(var_41_1, iter_41_6)
			end
		end
	end

	if #var_41_1 > 0 then
		pg.m02:sendNotification(GAME.STORY_UPDATE_LIST, {
			storyIds = var_41_1,
			callback = arg_41_0
		})
	else
		arg_41_0()
	end
end

return var_0_0

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
			return var_1_1:GetTaskAgency():IsFinishTask(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.TASK_TYPE_PLUS] = function()
			return var_1_1:GetTaskAgency():GetFinishCntByType(var_1_0)
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
		end
	}, function()
		assert(false, "not exist runtime type: " .. arg_1_0)
	end)
end

function var_0_0.UpdateRuntimeTaskByTargetType(arg_23_0)
	local var_23_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

	for iter_23_0, iter_23_1 in pairs(var_23_0:GetTasks()) do
		if iter_23_1:ExistTargetType(arg_23_0) then
			var_23_0:UpdateTask(iter_23_1)
		end
	end
end

function var_0_0.UpdateClientTaskProgress(arg_24_0, arg_24_1)
	local var_24_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetDiffTargetIdsByTypeAndParam(arg_24_0, arg_24_1)

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		pg.m02:sendNotification(GAME.ISLAND_UPDATE_TASK, {
			taskId = 0,
			progress = 1,
			targetId = iter_24_1
		})
	end
end

function var_0_0.OnApproach(arg_25_0)
	seriesAsync({
		function(arg_26_0)
			local var_26_0 = {}

			for iter_26_0, iter_26_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanAcceptTasks()) do
				if iter_26_1:CheckAcceptOnApproach(arg_25_0) then
					table.insert(var_26_0, iter_26_1.id)
				end
			end

			if #var_26_0 > 0 then
				pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
					taskIds = var_26_0,
					callback = arg_26_0
				})
			else
				arg_26_0()
			end
		end,
		function(arg_27_0)
			local var_27_0 = {}

			for iter_27_0, iter_27_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanSubmitTasks()) do
				if iter_27_1:CheckSubmitOnApproach(arg_25_0) then
					table.insert(var_27_0, iter_27_1.id)
				end
			end

			local var_27_1 = {}

			for iter_27_2, iter_27_3 in ipairs(var_27_0) do
				table.insert(var_27_1, function(arg_28_0)
					pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
						taskId = iter_27_3,
						callback = arg_28_0
					})
				end)
			end

			seriesAsync(var_27_1, arg_27_0)
		end
	}, function()
		var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.APPROACH, arg_25_0)
	end)
end

function var_0_0.OnActionEnd(arg_30_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, arg_30_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, 0)
end

function var_0_0._GetTaskAcceptStoryId(arg_31_0)
	local var_31_0 = pg.island_task[arg_31_0].rec_perform

	return pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_31_0)
end

function var_0_0._GetTaskTargetLinkStoryIds(arg_32_0)
	if pg.island_task_target[arg_32_0].type ~= IslandTaskTargetType.INTERACTION then
		return nil
	end

	local var_32_0 = pg.island_task_target[arg_32_0].target_param[1]
	local var_32_1 = pg.island_interaction[var_32_0]

	if var_32_1.type == IslandInteractionUntil.TYPE_STORY then
		local var_32_2 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_32_1.param)

		return var_32_2 and {
			var_32_2
		} or nil
	elseif var_32_1.type == IslandInteractionUntil.TYPE_PERFORMANCE then
		return IslandPerformancePerformer.GetStoryNameList(var_32_1.param)
	end

	return nil
end

function var_0_0._GetTaskSubmitStoryIds(arg_33_0)
	local var_33_0 = pg.island_task[arg_33_0].com_perform
	local var_33_1 = var_33_0[1]

	if not var_33_1 then
		return nil
	end

	local var_33_2 = var_33_0[2]

	if var_33_1 == 1 then
		local var_33_3 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_33_2)

		return var_33_3 and {
			var_33_3
		} or nil
	elseif var_33_1 == 2 then
		return IslandPerformancePerformer.GetStoryNameList(var_33_2)
	end

	return nil
end

function var_0_0._GetTaskLinkStoryIds(arg_34_0)
	local var_34_0 = {}
	local var_34_1 = var_0_0._GetTaskAcceptStoryId(arg_34_0.id)

	if var_34_1 then
		table.insert(var_34_0, var_34_1)
	end

	for iter_34_0, iter_34_1 in ipairs(arg_34_0:GetTargetList()) do
		if iter_34_1:IsFinish() then
			local var_34_2 = var_0_0._GetTaskTargetLinkStoryIds(iter_34_1.id)

			if var_34_2 then
				table.insertto(var_34_0, var_34_2)
			end
		end
	end

	return var_34_0
end

function var_0_0._GetFinishTaskLinkStoryIds(arg_35_0)
	local var_35_0 = {}
	local var_35_1 = var_0_0._GetTaskAcceptStoryId(arg_35_0)

	if var_35_1 then
		table.insert(var_35_0, var_35_1)
	end

	for iter_35_0, iter_35_1 in ipairs(pg.island_task[arg_35_0].target_id) do
		local var_35_2 = var_0_0._GetTaskTargetLinkStoryIds(iter_35_1)

		if var_35_2 then
			table.insertto(var_35_0, var_35_2)
		end
	end

	local var_35_3 = var_0_0._GetTaskSubmitStoryIds(arg_35_0)

	if var_35_3 then
		table.insertto(var_35_0, var_35_3)
	end

	return var_35_0
end

function var_0_0.FixTaskLinksStory(arg_36_0)
	local var_36_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
	local var_36_1 = {}

	for iter_36_0, iter_36_1 in pairs(var_36_0:GetTasks()) do
		table.insertto(var_36_1, var_0_0._GetTaskLinkStoryIds(iter_36_1))
	end

	for iter_36_2, iter_36_3 in ipairs(var_36_0:GetFinishedIds()) do
		table.insertto(var_36_1, var_0_0._GetFinishTaskLinkStoryIds(iter_36_3))
	end

	for iter_36_4 = 3110000, 3119999 do
		local var_36_2 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(iter_36_4)

		if var_36_2 and pg.NewStoryMgr.GetInstance():GetPlayedFlag(iter_36_4) then
			local var_36_3 = IslandPerformancePerformer.GetStoryNameList(var_36_2)

			for iter_36_5, iter_36_6 in ipairs(var_36_3) do
				table.insert(var_36_1, iter_36_6)
			end
		end
	end

	if #var_36_1 > 0 then
		pg.m02:sendNotification(GAME.STORY_UPDATE_LIST, {
			storyIds = var_36_1,
			callback = arg_36_0
		})
	else
		arg_36_0()
	end
end

return var_0_0

local var_0_0 = class("IslandTaskHelper")

function var_0_0.GetRuntimeData(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1[1]
	local var_1_1 = getProxy(IslandProxy):GetIsland()
	local var_1_2 = var_1_1:GetCharacterAgency()

	return switch(arg_1_0, {
		[IslandTaskTargetType.RECYCLE] = function()
			return var_1_1:GetInventoryAgency():GetOwnCount(var_1_0)
		end,
		[IslandTaskTargetType.ISLAND_LV] = function()
			return var_1_1:GetLevel()
		end,
		[IslandTaskTargetType.FURNITURE] = function()
			local var_4_0 = var_1_1:GetAgoraAgency()

			return var_1_0 == 0 and #var_4_0:GetFurnitures() or #var_4_0:GetFurnituresByType(var_1_0)
		end,
		[IslandTaskTargetType.COMMANDER_DRESS] = function()
			local var_5_0 = var_1_1:GetDressUpAgency()

			return var_1_0 == 0 and #var_5_0:GetAllHasDress() or #var_5_0:GetHasDressByType(var_1_0)
		end,
		[IslandTaskTargetType.SHIP_DRESS] = function()
			return var_1_0 == 0 and var_1_2:GetDiffDressCnt() or var_1_2:GetDiffDressCntByType(var_1_0)
		end,
		[IslandTaskTargetType.SHIP_SKIN] = function()
			return var_1_0 == 0 and var_1_2:GetAllSkinCnt() or #var_1_2:GetOwnSkinListByShipId(var_1_0)
		end,
		[IslandTaskTargetType.SKIN_ALL_COLOR] = function()
			local var_8_0 = var_1_2:GetSkinData(var_1_0)

			return var_8_0 and var_8_0:IsOwnAllColor() and 1 or 0
		end,
		[IslandTaskTargetType.SKIN_COLOR] = function()
			local var_9_0 = pg.island_skin_colordiff_template[var_1_0].skin_group
			local var_9_1 = var_1_2:GetSkinData(var_9_0)

			return var_9_1 and var_9_1:CheckColorOwned(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.ACHIEVEMENT] = function()
			return var_1_1:GetAchievementAgency():IsGot(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.TASK] = function()
			return var_1_1:GetTaskAgency():IsFinishTask(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.RESTAURANT_RANK] = function()
			return var_1_1:GetManageAgency():GetCntByRestLevel(var_1_0)
		end,
		[IslandTaskTargetType.STORY] = function()
			local var_13_0 = pg.NewStoryMgr.GetInstance()
			local var_13_1 = var_13_0:StoryId2StoryName(var_1_0)

			return var_13_0:IsPlayed(var_13_1) and 1 or 0
		end
	}, function()
		assert(false, "not exist runtime type: " .. arg_1_0)
	end)
end

function var_0_0.UpdateRuntimeTaskByTargetType(arg_15_0)
	local var_15_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

	for iter_15_0, iter_15_1 in pairs(var_15_0:GetTasks()) do
		if iter_15_1:ExistTargetType(arg_15_0) then
			var_15_0:UpdateTask(iter_15_1)
		end
	end
end

function var_0_0.UpdateClientTaskProgress(arg_16_0, arg_16_1)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetDiffTargetIdsByTypeAndParam(arg_16_0, arg_16_1)

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		pg.m02:sendNotification(GAME.ISLAND_UPDATE_TASK, {
			taskId = 0,
			progress = 1,
			targetId = iter_16_1
		})
	end
end

function var_0_0.OnApproach(arg_17_0)
	seriesAsync({
		function(arg_18_0)
			local var_18_0 = {}

			for iter_18_0, iter_18_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanAcceptTasks()) do
				if iter_18_1:CheckAcceptOnApproach(arg_17_0) then
					table.insert(var_18_0, iter_18_1.id)
				end
			end

			if #var_18_0 > 0 then
				pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
					taskIds = var_18_0,
					callback = arg_18_0
				})
			else
				arg_18_0()
			end
		end,
		function(arg_19_0)
			local var_19_0 = {}

			for iter_19_0, iter_19_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanSubmitTasks()) do
				if iter_19_1:CheckSubmitOnApproach(arg_17_0) then
					table.insert(var_19_0, iter_19_1.id)
				end
			end

			local var_19_1 = {}

			for iter_19_2, iter_19_3 in ipairs(var_19_0) do
				table.insert(var_19_1, function(arg_20_0)
					pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
						taskId = iter_19_3,
						callback = arg_20_0
					})
				end)
			end

			seriesAsync(var_19_1, arg_19_0)
		end
	}, function()
		var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.APPROACH, arg_17_0)
	end)
end

return var_0_0

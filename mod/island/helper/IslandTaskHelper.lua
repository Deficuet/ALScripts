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
		[IslandTaskTargetType.RESTAURANT_RANK] = function()
			return var_1_1:GetManageAgency():GetCntByRestLevel(var_1_0)
		end,
		[IslandTaskTargetType.STORY] = function()
			local var_16_0 = pg.NewStoryMgr.GetInstance()
			local var_16_1 = var_16_0:StoryId2StoryName(var_1_0)

			return var_16_0:IsPlayed(var_16_1) and 1 or 0
		end,
		[IslandTaskTargetType.ACTION] = function()
			return var_1_1:GetActionAgency():ExistAction(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.COMMANDER_DRESS_ID] = function()
			return var_1_1:GetDressUpAgency():CheckOwnDress(var_1_0) and 1 or 0
		end,
		[IslandTaskTargetType.SHIP_DRESS_ID] = function()
			return var_1_2:GetDressIdRealCount(var_1_0)
		end
	}, function()
		assert(false, "not exist runtime type: " .. arg_1_0)
	end)
end

function var_0_0.UpdateRuntimeTaskByTargetType(arg_21_0)
	local var_21_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

	for iter_21_0, iter_21_1 in pairs(var_21_0:GetTasks()) do
		if iter_21_1:ExistTargetType(arg_21_0) then
			var_21_0:UpdateTask(iter_21_1)
		end
	end
end

function var_0_0.UpdateClientTaskProgress(arg_22_0, arg_22_1)
	local var_22_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetDiffTargetIdsByTypeAndParam(arg_22_0, arg_22_1)

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		pg.m02:sendNotification(GAME.ISLAND_UPDATE_TASK, {
			taskId = 0,
			progress = 1,
			targetId = iter_22_1
		})
	end
end

function var_0_0.OnApproach(arg_23_0)
	seriesAsync({
		function(arg_24_0)
			local var_24_0 = {}

			for iter_24_0, iter_24_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanAcceptTasks()) do
				if iter_24_1:CheckAcceptOnApproach(arg_23_0) then
					table.insert(var_24_0, iter_24_1.id)
				end
			end

			if #var_24_0 > 0 then
				pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
					taskIds = var_24_0,
					callback = arg_24_0
				})
			else
				arg_24_0()
			end
		end,
		function(arg_25_0)
			local var_25_0 = {}

			for iter_25_0, iter_25_1 in pairs(getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanSubmitTasks()) do
				if iter_25_1:CheckSubmitOnApproach(arg_23_0) then
					table.insert(var_25_0, iter_25_1.id)
				end
			end

			local var_25_1 = {}

			for iter_25_2, iter_25_3 in ipairs(var_25_0) do
				table.insert(var_25_1, function(arg_26_0)
					pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
						taskId = iter_25_3,
						callback = arg_26_0
					})
				end)
			end

			seriesAsync(var_25_1, arg_25_0)
		end
	}, function()
		var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.APPROACH, arg_23_0)
	end)
end

function var_0_0.OnActionEnd(arg_28_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, arg_28_0)
	var_0_0.UpdateClientTaskProgress(IslandTaskTargetType.ACTION_END, 0)
end

return var_0_0

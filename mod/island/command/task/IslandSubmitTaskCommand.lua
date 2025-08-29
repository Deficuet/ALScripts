local var_0_0 = class("IslandSubmitTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.taskId
	local var_1_2 = var_1_0.callback

	pg.ConnectionMgr.GetInstance():Send(21038, {
		task_id = var_1_1
	}, 21039, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland()
			local var_2_1 = var_2_0:GetTaskAgency()
			local var_2_2 = var_2_1:GetTask(var_1_1)
			local var_2_3 = var_2_2.id == var_2_1:GetTraceId()
			local var_2_4 = var_2_2:GetExp()

			if var_2_2:GetType() == IslandTaskType.MAIN then
				IslandAchievementHelper.UpdateRecord(IslandAchievementType.FINISH_MAIN_TASK, var_1_1, 1)
			end

			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandTaskSubmit(var_2_2:GetType(), var_2_2.id))

			local var_2_5 = var_2_0:GetInventoryAgency()

			for iter_2_0, iter_2_1 in ipairs(var_2_2:GetRecycleItemInfos()) do
				var_2_5:RemoveItem(iter_2_1.id, iter_2_1.count)
			end

			if var_2_2:getConfig("is_tech_task") == 1 then
				var_2_0:GetTechnologyAgency():TryAutoUnlock()
			end

			var_2_1:RemoveTask(var_1_1)
			var_2_1:AddFinishId(var_1_1)
			IslandTaskHelper.UpdateRuntimeTaskByTargetType(IslandTaskTargetType.TASK)
			var_2_1:TryAcceptAutoTasks(function()
				if var_2_3 then
					getProxy(IslandProxy):GetIsland():GetTaskAgency():TryAutoTrackTask()
				end
			end)

			local var_2_6 = IslandDropHelper.AddItems(arg_2_0, var_2_4)

			arg_1_0:sendNotification(GAME.ISLAND_SUBMIT_TASK_DONE, {
				taskId = var_1_1,
				dropData = var_2_6,
				callback = var_1_2
			})
			arg_1_0:UpdateGuide(var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

function var_0_0.UpdateGuide(arg_4_0, arg_4_1)
	switch(arg_4_1, {
		[IslandGuideChecker.MOVE_TASK_ID] = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = "ISLAND_GUIDE_2"
			})
		end,
		[IslandGuideChecker.ORDER_TASK_ID] = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = "ISLAND_GUIDE_7"
			})
		end,
		[IslandGuideChecker.TECH_TASK_ID] = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = "ISLAND_GUIDE_8"
			})
		end,
		[IslandGuideChecker.INVITE_TASK_ID] = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = "ISLAND_GUIDE_9"
			})
		end
	}, function()
		return
	end)
end

return var_0_0

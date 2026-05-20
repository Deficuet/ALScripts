local var_0_0 = class("TaskMediator", import("..base.ContextMediator"))

var_0_0.ON_TASK_SUBMIT = "TaskMediator:ON_TASK_SUBMIT"
var_0_0.ON_TASK_GO = "TaskMediator:ON_TASK_GO"
var_0_0.TASK_FILTER = "TaskMediator:TASK_FILTER"
var_0_0.ON_SUBMIT_AVATAR_TASK = "TaskMediator:ON_SUBMIT_AVATAR_TASK"
var_0_0.ON_SUBMIT_WEEK_PROGREE = "TaskMediator:ON_SUBMIT_WEEK_PROGREE"
var_0_0.ON_BATCH_SUBMIT_WEEK_TASK = "TaskMediator:ON_BATCH_SUBMIT_WEEK_TASK"
var_0_0.ON_SUBMIT_WEEK_TASK = "TaskMediator:ON_SUBMIT_WEEK_TASK"
var_0_0.CLICK_GET_ALL = "TaskMediator:CLICK_GET_ALL"
var_0_0.ON_DROP = "TaskMediator:ON_DROP"
var_0_0.STORE_ACTIVITY_AWARDS = "TaskMediator:STORE_ACTIVITY_AWARDS"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_SUBMIT_WEEK_TASK, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.SUBMIT_WEEK_TASK, {
			id = arg_2_1.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_AVATAR_TASK, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_3_1:getActId(),
			task_ids = {
				arg_3_1.id
			}
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_WEEK_PROGREE, function(arg_4_0)
		arg_1_0:sendNotification(GAME.SUBMIT_WEEK_TASK_PROGRESS)
	end)
	arg_1_0:bind(var_0_0.ON_BATCH_SUBMIT_WEEK_TASK, function(arg_5_0, arg_5_1, arg_5_2)
		arg_1_0:sendNotification(GAME.BATCH_SUBMIT_WEEK_TASK, {
			ids = arg_5_1,
			callback = arg_5_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_DROP, function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_1.type == DROP_TYPE_EQUIP then
			arg_1_0:addSubLayers(Context.New({
				mediator = EquipmentInfoMediator,
				viewComponent = EquipmentInfoLayer,
				data = {
					equipmentId = arg_6_1:getConfig("id"),
					type = EquipmentInfoMediator.TYPE_DISPLAY,
					onRemoved = arg_6_2
				}
			}))
		elseif arg_6_1.type == DROP_TYPE_SPWEAPON then
			arg_1_0:addSubLayers(Context.New({
				mediator = SpWeaponInfoMediator,
				viewComponent = SpWeaponInfoLayer,
				data = {
					spWeaponConfigId = arg_6_1:getConfig("id"),
					type = SpWeaponInfoLayer.TYPE_DISPLAY,
					onRemoved = arg_6_2
				}
			}))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = arg_6_1,
				onNo = arg_6_2,
				onYes = arg_6_2
			})
		end
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_7_0, arg_7_1)
		local var_7_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

		if var_7_0 then
			local var_7_1 = var_7_0:getConfig("config_data")
			local var_7_2 = _.flatten(var_7_1)

			if arg_7_1.id == var_7_2[#var_7_2] then
				pg.NewStoryMgr.GetInstance():Play("YIXIAN8", function()
					arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_7_1.id)
				end)

				return
			end
		end

		if arg_7_1.index then
			arg_1_0:sendNotification(GAME.SUBMIT_TASK, {
				taskId = arg_7_1.id,
				index = arg_7_1.index
			})
		else
			arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_7_1.id)
		end
	end)
	arg_1_0:bind(var_0_0.ON_TASK_GO, function(arg_9_0, arg_9_1)
		arg_1_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_9_1
		})
	end)
	arg_1_0:bind(var_0_0.STORE_ACTIVITY_AWARDS, function(arg_10_0, arg_10_1)
		arg_1_0.storeActivityAwardFlag = arg_10_1
	end)
	arg_1_0:SetTaskVOs()

	local var_1_0 = getProxy(TaskProxy)

	arg_1_0.viewComponent:SetWeekTaskProgressInfo(var_1_0:GetWeekTaskProgressInfo())
end

function var_0_0.SetTaskVOs(arg_11_0)
	local var_11_0 = getProxy(TaskProxy):getData()
	local var_11_1 = getProxy(BagProxy)

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		if iter_11_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			local var_11_2 = tonumber(iter_11_1:getConfig("target_id"))

			iter_11_1.progress = var_11_1:getItemCountById(tonumber(var_11_2))
		elseif iter_11_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			local var_11_3 = tonumber(iter_11_1:getConfig("target_id"))

			iter_11_1.progress = getProxy(ActivityProxy):getVirtualItemNumber(var_11_3)
		end
	end

	arg_11_0.viewComponent:setTaskVOs(var_11_0)
end

function var_0_0.enterLevel(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(ChapterProxy):getChapterById(arg_12_1)

	if var_12_0 then
		local var_12_1 = {
			mapIdx = var_12_0:getConfig("map")
		}

		if var_12_0.active then
			var_12_1.chapterId = var_12_0.id
		else
			var_12_1.openChapterId = arg_12_1
		end

		arg_12_0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, var_12_1)
	end
end

function var_0_0.listNotificationInterests(arg_13_0)
	return {
		TaskProxy.TASK_ADDED,
		TaskProxy.TASK_UPDATED,
		TaskProxy.TASK_REMOVED,
		TaskProxy.TASK_DELETE,
		GAME.SUBMIT_TASK_DONE,
		var_0_0.TASK_FILTER,
		GAME.BEGIN_STAGE_DONE,
		GAME.CHAPTER_OP_DONE,
		TaskProxy.WEEK_TASK_UPDATED,
		TaskProxy.WEEK_TASKS_ADDED,
		TaskProxy.WEEK_TASKS_DELETED,
		GAME.SUBMIT_WEEK_TASK_DONE,
		GAME.SUBMIT_WEEK_TASK_PROGRESS_DONE,
		GAME.SUBMIT_ACTIVITY_TASK_DONE,
		GAME.SUBMIT_AVATAR_TASK_DONE,
		TaskProxy.WEEK_TASK_RESET,
		GAME.MERGE_TASK_ONE_STEP_AWARD_DONE,
		AvatarFrameProxy.FRAME_TASK_TIME_OUT
	}
end

function var_0_0.handleNotification(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1:getName()
	local var_14_1 = arg_14_1:getBody()

	if var_14_0 == TaskProxy.TASK_ADDED then
		if var_14_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			local var_14_2 = tonumber(var_14_1:getConfig("target_id"))

			var_14_1.progress = getProxy(BagProxy):getItemCountById(tonumber(var_14_2))
		elseif var_14_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			local var_14_3 = tonumber(var_14_1:getConfig("target_id"))

			var_14_1.progress = getProxy(ActivityProxy):getVirtualItemNumber(var_14_3)
		end

		arg_14_0.viewComponent:addTask(var_14_1)
	elseif var_14_0 == GAME.CHAPTER_OP_DONE then
		if arg_14_0.chapterId then
			arg_14_0:enterLevel(arg_14_0.chapterId)

			arg_14_0.chapterId = nil
		end
	elseif var_14_0 == TaskProxy.TASK_UPDATED then
		if var_14_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			local var_14_4 = tonumber(var_14_1:getConfig("target_id"))

			var_14_1.progress = getProxy(BagProxy):getItemCountById(tonumber(var_14_4))
		elseif var_14_1:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			local var_14_5 = tonumber(var_14_1:getConfig("target_id"))

			var_14_1.progress = getProxy(ActivityProxy):getVirtualItemNumber(var_14_5)
		end

		arg_14_0.viewComponent:updateTask(var_14_1)
	elseif var_14_0 == TaskProxy.TASK_REMOVED or var_14_0 == TaskProxy.TASK_DELETE then
		arg_14_0.viewComponent:removeTask(var_14_1)
	elseif var_14_0 == var_0_0.TASK_FILTER then
		arg_14_0.viewComponent:GoToFilter(var_14_1)
	elseif var_14_0 == GAME.SUBMIT_TASK_DONE then
		local var_14_6 = arg_14_1:getType()
		local var_14_7 = var_14_1
		local var_14_8 = getProxy(TaskProxy)

		arg_14_0.viewComponent.onShowAwards = true

		if arg_14_0.activityAwards and #arg_14_0.activityAwards > 0 then
			for iter_14_0, iter_14_1 in ipairs(arg_14_0.activityAwards) do
				table.insert(var_14_7, iter_14_1)
			end

			arg_14_0.activityAwards = {}
		end

		arg_14_0:addAwardShow(var_14_7, function()
			arg_14_0.viewComponent.onShowAwards = nil

			arg_14_0:accepetActivityTask()
			arg_14_0.viewComponent:refreshPage()
			arg_14_0.viewComponent:updateOneStepBtn()

			local var_15_0 = {}

			for iter_15_0, iter_15_1 in ipairs(var_14_6) do
				table.insert(var_15_0, function(arg_16_0)
					arg_14_0:PlayStoryForTaskAct(iter_15_1, arg_16_0)
				end)
			end

			if arg_14_0.refreshWeekTaskPageFlag then
				arg_14_0.viewComponent:RefreshWeekTaskPage()

				arg_14_0.refreshWeekTaskPageFlag = nil
			end

			table.insert(var_15_0, function(arg_17_0)
				getProxy(FeastProxy):HandleTaskStories(var_14_6, arg_17_0)
			end)

			if #var_15_0 > 0 then
				seriesAsync(var_15_0)
			end
		end)
	elseif var_14_0 == GAME.BEGIN_STAGE_DONE then
		arg_14_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_14_1)
	elseif var_14_0 == TaskProxy.WEEK_TASKS_ADDED or var_14_0 == TaskProxy.WEEK_TASKS_DELETED or var_14_0 == TaskProxy.WEEK_TASK_UPDATED then
		arg_14_0.viewComponent:RefreshWeekTaskPage()
	elseif var_14_0 == GAME.SUBMIT_WEEK_TASK_DONE then
		arg_14_0.viewComponent:RefreshWeekTaskPageBefore(var_14_1.id)

		local function var_14_9()
			arg_14_0.viewComponent:RefreshWeekTaskPage()
		end

		if #var_14_1.awards > 0 then
			arg_14_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_14_1.awards, var_14_9)
		else
			var_14_9()
		end
	elseif var_14_0 == GAME.SUBMIT_WEEK_TASK_PROGRESS_DONE then
		local function var_14_10()
			arg_14_0.viewComponent:RefreshWeekTaskProgress()
		end

		if #var_14_1.awards > 0 then
			arg_14_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_14_1.awards, var_14_10)
		else
			var_14_10()
		end
	elseif var_14_0 == GAME.SUBMIT_AVATAR_TASK_DONE or var_14_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		local function var_14_11()
			arg_14_0.viewComponent:refreshPage()

			arg_14_0.refreshWeekTaskPageFlag = true
		end

		if #var_14_1.awards > 0 then
			if arg_14_0.storeActivityAwardFlag then
				if not arg_14_0.activityAwards then
					arg_14_0.activityAwards = {}
				end

				for iter_14_2, iter_14_3 in ipairs(var_14_1.awards) do
					table.insert(arg_14_0.activityAwards, iter_14_3)
				end
			else
				arg_14_0:addAwardShow(var_14_1.awards, var_14_11)
			end
		else
			var_14_11()
		end
	elseif var_14_0 == TaskProxy.WEEK_TASK_RESET then
		arg_14_0:SetTaskVOs()
		arg_14_0.viewComponent:ResetWeekTaskPage()
	elseif var_14_0 == GAME.MERGE_TASK_ONE_STEP_AWARD_DONE then
		arg_14_0.refreshWeekTaskPageFlag = true

		arg_14_0:sendNotification(GAME.SUBMIT_TASK_DONE, var_14_1.awards, var_14_1.taskIds)
	elseif var_14_0 == AvatarFrameProxy.FRAME_TASK_TIME_OUT then
		arg_14_0.viewComponent:refreshPage()
	end
end

function var_0_0.addAwardShow(arg_21_0, arg_21_1, arg_21_2)
	if not arg_21_1 or #arg_21_1 == 0 then
		return
	end

	if not arg_21_0.awardsShowList then
		arg_21_0.awardsShowList = {}
	end

	table.insert(arg_21_0.awardsShowList, {
		awards = arg_21_1,
		callback = arg_21_2
	})

	if arg_21_0.isShowAwardFlag then
		return
	else
		arg_21_0:showAwardList()
	end
end

function var_0_0.showAwardList(arg_22_0)
	if arg_22_0.isShowAwardFlag then
		return
	end

	if arg_22_0.awardsShowList and #arg_22_0.awardsShowList > 0 then
		arg_22_0.isShowAwardFlag = true

		local var_22_0 = table.remove(arg_22_0.awardsShowList, 1)

		arg_22_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_22_0.awards, function()
			if var_22_0.callback then
				var_22_0.callback()
			end

			arg_22_0.isShowAwardFlag = false

			arg_22_0:showAwardList()
		end)
	end
end

function var_0_0.accepetActivityTask(arg_24_0)
	arg_24_0:sendNotification(GAME.ACCEPT_ACTIVITY_TASK)
end

function var_0_0.PlayStoryForTaskAct(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST)
	local var_25_1

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		if iter_25_1 and not iter_25_1:isEnd() then
			local var_25_2 = iter_25_1:getConfig("config_data")
			local var_25_3 = 0
			local var_25_4 = 0

			for iter_25_2, iter_25_3 in ipairs(var_25_2) do
				for iter_25_4, iter_25_5 in ipairs(iter_25_3) do
					if iter_25_5 == arg_25_1 then
						var_25_3 = iter_25_2
						var_25_4 = iter_25_4
					end
				end
			end

			local var_25_5 = iter_25_1:getConfig("config_client").story or {}

			if var_25_5[var_25_3] then
				local var_25_6 = var_25_5[var_25_3][var_25_4]

				if var_25_6 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_25_6) then
					var_25_1 = var_25_6
				end
			end
		end
	end

	if var_25_1 then
		pg.NewStoryMgr.GetInstance():Play(var_25_1, arg_25_2)
	else
		arg_25_2()
	end
end

return var_0_0

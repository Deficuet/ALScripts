local var_0_0 = class("ToLoveCollabTaskMediator", import("view.base.ContextMediator"))

var_0_0.ON_TASK_GO = "event on task go"
var_0_0.ON_TASK_SUBMIT = "event on task submit"
var_0_0.ON_TASK_SUBMIT_ONESTEP = "event on task submit one step"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_TASK_GO, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_3_0, arg_3_1, arg_3_2)
		seriesAsync({
			function(arg_4_0)
				arg_1_0.awardIndex = 0
				arg_1_0.showAwards = {}

				arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
					act_id = arg_3_1:getActId(),
					task_ids = {
						arg_3_1.id
					}
				}, arg_3_2)
			end
		}, function()
			return
		end)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT_ONESTEP, function(arg_6_0, arg_6_1)
		seriesAsync({
			function(arg_7_0)
				local var_7_0 = arg_1_0:getSubmitDatas(arg_6_1)

				arg_1_0.awardIndex = 0
				arg_1_0.showAwards = {}

				for iter_7_0, iter_7_1 in pairs(var_7_0) do
					arg_1_0.awardIndex = arg_1_0.awardIndex + 1

					arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
						act_id = iter_7_0,
						task_ids = iter_7_1
					})
				end
			end
		}, function()
			return
		end)
	end)
end

function var_0_0.listNotificationInterests(arg_9_0)
	return {
		GAME.SUBMIT_ACTIVITY_TASK_DONE,
		GAME.ACTIVITY_UPDATED
	}
end

function var_0_0.handleNotification(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:getName()
	local var_10_1 = arg_10_1:getBody()

	if var_10_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		if arg_10_0.awardIndex > 0 then
			arg_10_0.awardIndex = arg_10_0.awardIndex - 1
		end

		for iter_10_0, iter_10_1 in ipairs(var_10_1.awards) do
			table.insert(arg_10_0.showAwards, iter_10_1)
		end

		if arg_10_0.awardIndex == 0 then
			arg_10_0.viewComponent:emit(BaseUI.ON_ACHIEVE, arg_10_0.showAwards, function()
				arg_10_0.viewComponent:Show()
			end)

			arg_10_0.showAwards = {}
		end
	elseif var_10_0 == GAME.ACTIVITY_UPDATED then
		arg_10_0.viewComponent:Show()
	end
end

function var_0_0.getSubmitDatas(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(TaskProxy)
	local var_12_1 = {}

	for iter_12_0 = 1, #arg_12_1 do
		local var_12_2 = arg_12_1[iter_12_0]
		local var_12_3 = var_12_0:getTaskById(var_12_2)

		if var_12_3 and var_12_3:getActId() then
			local var_12_4 = var_12_3:getActId()

			if not var_12_1[var_12_4] then
				var_12_1[var_12_4] = {}
			end

			table.insert(var_12_1[var_12_4], var_12_2)
		end
	end

	return var_12_1
end

function var_0_0.GetTaskRedTip()
	local var_13_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.TOLOVE_TASK_ID)

	if var_13_0 and not var_13_0:isEnd() then
		local var_13_1 = var_13_0:getConfig("config_data")

		for iter_13_0, iter_13_1 in pairs(var_13_1) do
			local var_13_2 = getProxy(TaskProxy):getTaskVO(iter_13_1)

			if var_13_2 and var_13_2:getTaskStatus() == 1 then
				return true
			end
		end
	end

	return false
end

return var_0_0

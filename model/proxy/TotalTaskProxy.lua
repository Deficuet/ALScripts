local var_0_0 = class("TotalTaskProxy", import(".NetProxy"))

var_0_0.act_task_onece_type = {
	6,
	26
}
var_0_0.avatar_task_type = {
	ActivityConst.ACTIVITY_TYPE_PT_OTHER
}
var_0_0.activity_task_type = {
	ActivityConst.ACTIVITY_TYPE_TASK_RYZA,
	ActivityConst.ACTIVITY_TYPE_HOTSPRING_2,
	ActivityConst.ACTIVITY_TYPE_NOT_TRACEABLE
}
var_0_0.normal_task_type = {
	ActivityConst.ACTIVITY_TYPE_TASKS,
	ActivityConst.ACTIVITY_TYPE_PT_CRUSING,
	ActivityConst.ACTIVITY_TYPE_PT_HEI5,
	ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB
}

function var_0_0.register(arg_1_0)
	arg_1_0.avatarFrames = {}
	arg_1_0.actTasks = {}

	arg_1_0:on(20201, function(arg_2_0)
		getProxy(AvatarFrameProxy):clearData()
		getProxy(ActivityTaskProxy):clearData()

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.info) do
			local var_2_0 = iter_2_1.act_id
			local var_2_1 = iter_2_1.tasks
			local var_2_2 = iter_2_1.finish_ids
			local var_2_3 = pg.activity_template[var_2_0].type

			if table.contains(TotalTaskProxy.avatar_task_type, var_2_3) then
				getProxy(AvatarFrameProxy):initListData(var_2_0, var_2_1, var_2_2)
			elseif table.contains(TotalTaskProxy.activity_task_type, var_2_3) then
				getProxy(ActivityTaskProxy):initActList(var_2_0, var_2_1, var_2_2)
			elseif table.contains(TotalTaskProxy.normal_task_type, var_2_3) then
				getProxy(TaskProxy):initActData(var_2_0, var_2_1, var_2_2)
			end
		end
	end)
	arg_1_0:on(20202, function(arg_3_0)
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.info) do
			local var_3_0 = iter_3_1.act_id
			local var_3_1 = iter_3_1.tasks
			local var_3_2 = pg.activity_template[var_3_0].type

			if table.contains(TotalTaskProxy.avatar_task_type, var_3_2) then
				getProxy(AvatarFrameProxy):update(var_3_0, var_3_1)
			elseif table.contains(TotalTaskProxy.activity_task_type, var_3_2) then
				getProxy(ActivityTaskProxy):updateActList(var_3_0, var_3_1)
			elseif table.contains(TotalTaskProxy.normal_task_type, var_3_2) then
				getProxy(TaskProxy):updateActProgress(var_3_0, var_3_1)
			end
		end

		arg_1_0.facade:sendNotification(GAME.TOTAL_TASK_UPDATED)
	end)
	arg_1_0:on(20203, function(arg_4_0)
		for iter_4_0, iter_4_1 in ipairs(arg_4_0.info) do
			local var_4_0 = iter_4_1.act_id
			local var_4_1 = iter_4_1.tasks
			local var_4_2 = pg.activity_template[var_4_0].type

			if table.contains(TotalTaskProxy.avatar_task_type, var_4_2) then
				getProxy(AvatarFrameProxy):addData(var_4_0, var_4_1)
			elseif table.contains(TotalTaskProxy.activity_task_type, var_4_2) then
				getProxy(ActivityTaskProxy):addActList(var_4_0, var_4_1)
			elseif table.contains(TotalTaskProxy.normal_task_type, var_4_2) then
				getProxy(TaskProxy):addActData(var_4_0, var_4_1)
			end

			local var_4_3 = getProxy(ActivityProxy):getActivityById(var_4_0)

			arg_1_0:sendNotification(ActivityProxy.ACTIVITY_UPDATED, var_4_3:clone())
		end

		arg_1_0.facade:sendNotification(GAME.TOTAL_TASK_UPDATED)
	end)
	arg_1_0:on(20204, function(arg_5_0)
		for iter_5_0, iter_5_1 in ipairs(arg_5_0.info) do
			local var_5_0 = iter_5_1.act_id
			local var_5_1 = iter_5_1.tasks
			local var_5_2 = pg.activity_template[var_5_0].type

			if table.contains(TotalTaskProxy.avatar_task_type, var_5_2) then
				getProxy(AvatarFrameProxy):removeData(var_5_0, var_5_1)
			elseif table.contains(TotalTaskProxy.activity_task_type, var_5_2) then
				getProxy(ActivityTaskProxy):removeActList(var_5_0, var_5_1)
			elseif table.contains(TotalTaskProxy.normal_task_type, var_5_2) then
				getProxy(TaskProxy):removeActData(var_5_0, var_5_1)
			end
		end

		arg_1_0.facade:sendNotification(GAME.TOTAL_TASK_UPDATED)
	end)
end

function var_0_0.timeCall(arg_6_0)
	return {
		[ProxyRegister.DayCall] = function(arg_7_0)
			arg_6_0:clearTimeOut()
		end
	}
end

function var_0_0.clearTimeOut(arg_8_0)
	getProxy(AvatarFrameProxy):clearTimeOut()
	getProxy(TaskProxy):clearTimeOut()
end

return var_0_0

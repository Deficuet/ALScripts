local var_0_0 = class("IslandMainBtnTipHelper")

function var_0_0.IsTip(arg_1_0)
	return switch(arg_1_0, {
		map = function()
			return var_0_0.IsMapTip()
		end,
		device = function()
			return var_0_0.IsDeviceTip()
		end,
		mail = function()
			return var_0_0.IsMailTip()
		end,
		friend = function()
			return var_0_0.IsFriendTip()
		end,
		technology = function()
			return var_0_0.IsTechnologyTip()
		end,
		achievement = function()
			return var_0_0.IsAchievementTip()
		end
	}, function()
		return false
	end)
end

function var_0_0.IsMapTip()
	local var_9_0 = getProxy(IslandProxy):GetIsland()
	local var_9_1 = var_9_0:GetTaskAgency():GetTraceTask()

	if var_9_1 then
		local var_9_2 = var_9_1:GetTraceParam()
		local var_9_3 = tonumber(var_9_2)

		if var_9_3 then
			return var_9_0:GetMapId() ~= pg.island_world_objects[var_9_3].mapId
		end
	end

	return false
end

function var_0_0.IsDeviceTip()
	for iter_10_0, iter_10_1 in ipairs(pg.island_main_btns.get_id_list_by_main_type[2]) do
		local var_10_0 = pg.island_main_btns[iter_10_1].btn_name

		if var_0_0.IsTip(var_10_0) then
			return true
		end
	end

	return false
end

function var_0_0.IsMailTip()
	return getProxy(MailProxy):GetUnreadCount() > 0
end

function var_0_0.IsFriendTip()
	return getProxy(NotificationProxy):getRequestCount() > 0
end

function var_0_0.IsTechnologyTip()
	return getProxy(IslandProxy):GetIsland():GetTechnologyAgency():IsTip()
end

function var_0_0.IsAchievementTip()
	return getProxy(IslandProxy):GetIsland():GetAchievementAgency():IsTip()
end

return var_0_0

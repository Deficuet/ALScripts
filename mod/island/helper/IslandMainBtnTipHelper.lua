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
		end,
		post_manage = function()
			return var_0_0.IsPostManageTip()
		end,
		book = function()
			return var_0_0.IsBookTip()
		end
	}, function()
		return false
	end)
end

function var_0_0.IsMapTip()
	local var_11_0 = getProxy(IslandProxy):GetIsland()
	local var_11_1 = var_11_0:GetTaskAgency():GetTraceTask()

	if var_11_1 then
		local var_11_2 = var_11_1:GetTraceParam()
		local var_11_3 = tonumber(var_11_2)

		if var_11_3 and var_11_0:GetMapId() ~= pg.island_world_objects[var_11_3].mapId then
			return true
		end
	end

	local var_11_4 = var_11_0:GetTaskAgency():GetMainTraceTask()

	if var_11_4 then
		local var_11_5 = var_11_4:GetTraceParam()
		local var_11_6 = tonumber(var_11_5)

		if var_11_6 and var_11_0:GetMapId() ~= pg.island_world_objects[var_11_6].mapId then
			return true
		end
	end

	return false
end

function var_0_0.IsDeviceTip()
	local var_12_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_12_0, iter_12_1 in ipairs(pg.island_main_btns.get_id_list_by_main_type[2]) do
		local var_12_1 = pg.island_main_btns[iter_12_1]
		local var_12_2 = var_12_1.btn_name
		local var_12_3 = var_12_1.ability_id

		if var_12_0:HasAbility(var_12_3) and var_0_0.IsTip(var_12_2) then
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

function var_0_0.IsPostManageTip()
	return var_0_0.IsPostProdTip() or var_0_0.IsPostRestTip()
end

function var_0_0.IsPostProdTip()
	local var_18_0 = pg.island_set.post_manage_produce.key_value_varchar
	local var_18_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()

	return underscore.any(var_18_0, function(arg_19_0)
		local var_19_0 = var_18_1:GetBuilding(arg_19_0)

		return var_19_0 and var_19_0:IsPostTip()
	end)
end

function var_0_0.IsPostRestTip()
	local var_20_0 = pg.island_set.post_manage_operate.key_value_varchar
	local var_20_1 = getProxy(IslandProxy):GetIsland():GetManageAgency()

	return underscore.any(var_20_0, function(arg_21_0)
		local var_21_0 = var_20_1:GetRestaurant(arg_21_0)

		return var_21_0 and var_21_0:IsPostTip()
	end)
end

function var_0_0.IsBookTip()
	return getProxy(IslandProxy):GetIsland():GetBookAgency():IsTipFromTypes({
		IslandIllustration.TYPES.CHAR,
		IslandIllustration.TYPES.NPC,
		IslandIllustration.TYPES.ITEM
	})
end

function var_0_0.IsUnlock(arg_23_0)
	local var_23_0 = underscore.detect(pg.island_main_btns.all, function(arg_24_0)
		return pg.island_main_btns[arg_24_0].btn_name == arg_23_0
	end)

	if not var_23_0 then
		return false
	end

	local var_23_1 = pg.island_main_btns[var_23_0].ability_id

	return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_23_1)
end

return var_0_0

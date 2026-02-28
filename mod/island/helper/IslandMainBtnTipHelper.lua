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
		end,
		season = function()
			return var_0_0.IsSeasonTip()
		end
	}, function()
		return false
	end)
end

function var_0_0.IsMapTip()
	local var_12_0 = getProxy(IslandProxy):GetIsland()
	local var_12_1 = var_12_0:GetTaskAgency():GetTraceTask()

	if var_12_1 then
		local var_12_2 = var_12_1:GetTraceParam()
		local var_12_3 = tonumber(var_12_2)

		if var_12_3 and var_12_0:GetMapId() ~= pg.island_world_objects[var_12_3].mapId then
			return true
		end
	end

	local var_12_4 = var_12_0:GetTaskAgency():GetMainTraceTask()

	if var_12_4 then
		local var_12_5 = var_12_4:GetTraceParam()
		local var_12_6 = tonumber(var_12_5)

		if var_12_6 and var_12_0:GetMapId() ~= pg.island_world_objects[var_12_6].mapId then
			return true
		end
	end

	return false
end

function var_0_0.IsDeviceTip()
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

	for iter_13_0, iter_13_1 in ipairs(pg.island_main_btns.get_id_list_by_main_type[2]) do
		local var_13_1 = pg.island_main_btns[iter_13_1]
		local var_13_2 = var_13_1.btn_name
		local var_13_3 = var_13_1.ability_id

		if var_13_0:HasAbility(var_13_3) and var_0_0.IsTip(var_13_2) then
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
	local var_19_0 = pg.island_set.post_manage_produce.key_value_varchar
	local var_19_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()

	return underscore.any(var_19_0, function(arg_20_0)
		local var_20_0 = var_19_1:GetBuilding(arg_20_0)

		return var_20_0 and var_20_0:IsPostTip()
	end)
end

function var_0_0.IsPostRestTip()
	local var_21_0 = pg.island_set.post_manage_operate.key_value_varchar
	local var_21_1 = getProxy(IslandProxy):GetIsland():GetManageAgency()

	return underscore.any(var_21_0, function(arg_22_0)
		local var_22_0 = var_21_1:GetRestaurant(arg_22_0)

		return var_22_0 and var_22_0:IsPostTip()
	end)
end

function var_0_0.IsPostCollectionTip()
	local var_23_0 = getProxy(PlayerProxy):getPlayerId()
	local var_23_1 = "IslandSignAutoCollectTime" .. tostring(var_23_0)
	local var_23_2 = PlayerPrefs.GetInt(var_23_1, 0)

	if var_23_2 == 0 then
		return true
	end

	local var_23_3 = pg.TimeMgr.GetInstance():GetServerTime()

	return not pg.TimeMgr.GetInstance():IsSameDay(var_23_3, var_23_2)
end

function var_0_0.IsBookTip()
	return getProxy(IslandProxy):GetIsland():GetBookAgency():IsTipFromTypes({
		IslandIllustration.TYPES.CHAR,
		IslandIllustration.TYPES.NPC,
		IslandIllustration.TYPES.ITEM,
		IslandIllustration.TYPES.FISH
	})
end

function var_0_0.IsUnlock(arg_25_0)
	local var_25_0 = underscore.detect(pg.island_main_btns.all, function(arg_26_0)
		return pg.island_main_btns[arg_26_0].btn_name == arg_25_0
	end)

	if not var_25_0 then
		return false
	end

	local var_25_1 = pg.island_main_btns[var_25_0].ability_id

	return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_25_1)
end

function var_0_0.IsSeasonTip()
	local var_27_0 = getProxy(ActivityProxy):getIslandPanelActivities()

	return _.any(var_27_0, function(arg_28_0)
		return arg_28_0:readyToAchieve()
	end)
end

return var_0_0

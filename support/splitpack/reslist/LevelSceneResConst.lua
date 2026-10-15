ResList = ResList or {}
ResList.LevelSceneResConst = {}

local var_0_0 = ResList.LevelSceneResConst

function var_0_0.GetResource(arg_1_0)
	local var_1_0 = arg_1_0.contextData
	local var_1_1 = {
		"ui/ambushwarnui",
		"ui/radareffectui",
		"ui/airstrike",
		"ui/torpeto",
		"ui/spunitwin",
		"ui/spunitlose",
		"ui/levelmaptransition_1420001",
		"ui/levelmaptransition_1420011",
		"ui/levels",
		"ui/escort_levels",
		"ui/skirmish_levels",
		"ui/bismarck_levels",
		"ui/bismarck_levels_atlas",
		"ui/shinano_levels",
		"ui/levelselectspui",
		"ui/levelselectspfullui",
		"ui/levelselectspseriesui",
		"ui/levelselectspseriesrecrewui",
		"ui/levelselectatelieryumia",
		"ui/levelselectatelieryumia_atlas",
		"ui/levelselectexspui",
		"chapterno",
		"ui/levelmainscene_atlas",
		"chapter/pic/cellgrid",
		"ui/share/ship_gizmos_atlas",
		"leveluiview/tpl_enemy",
		"leveluiview/tpl_staticchampion",
		"leveluiview/tpl_box",
		"leveluiview/tpl_box",
		"leveluiview/tpl_supply",
		"leveluiview/tpl_dead",
		"leveluiview/tpl_antiairgun",
		"leveluiview/tpl_antiairgunarea",
		"leveluiview/tpl_dockyard",
		"boxprefab/gangkou",
		"boxprefab/event_task_small",
		"boxprefab/event2",
		"chapter/plane",
		"chapter/cell",
		"chapter/cell_quad",
		"chapter/cell_quad_mark",
		"artresource/effect/common/material/add",
		"effect/fleet_status_recorded"
	}

	table.insertto(var_1_1, var_0_0.GetInitialMapResList(arg_1_0))
	table.insertto(var_1_1, var_0_0.GetDynamicResList(var_1_0))

	return var_1_1
end

function var_0_0.GetInitialMapResList(arg_2_0)
	local var_2_0 = arg_2_0.contextData
	local var_2_1 = {}
	local var_2_2 = var_0_0.GetInitialMap(var_2_0)

	if var_2_2 then
		local var_2_3 = arg_2_0:GetMapBG(var_2_2)

		_.each(var_2_3 or {}, function(arg_3_0)
			local var_3_0 = arg_3_0.bgPrefix and arg_3_0.bgPrefix or ResPathSupport.ConstPath.LevelMap
			local var_3_1 = ResPathSupport.CombinePath(var_3_0, arg_3_0.BG)

			table.insert(var_2_1, var_3_1)

			if arg_3_0.Animator then
				table.insert(var_2_1, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, arg_3_0.Animator))
			end
		end)

		local var_2_4 = var_2_2:getConfig("cloud_suffix")

		if noEmptyStr(var_2_4) then
			for iter_2_0, iter_2_1 in ipairs(var_2_2:getConfig("clouds_pos") or {}) do
				table.insert(var_2_1, "clouds/cloud_" .. iter_2_0 .. "_" .. var_2_4)
			end
		end
	end

	return var_2_1
end

function var_0_0.GetInitialMap(arg_4_0)
	arg_4_0 = arg_4_0 or {}

	local var_4_0 = getProxy(ChapterProxy)
	local var_4_1 = arg_4_0.map

	if arg_4_0.chapterVO and arg_4_0.chapterVO.active then
		var_4_1 = var_4_0:getMapById(arg_4_0.chapterVO:getConfig("map"))
	elseif arg_4_0.mapIdx then
		var_4_1 = var_4_0:getMapById(arg_4_0.mapIdx)
	elseif arg_4_0.targetMap then
		var_4_1 = arg_4_0.targetMap
	elseif arg_4_0.eliteDefault then
		var_4_1 = var_4_0:getUseableMaxEliteMap()
	end

	if var_4_1 then
		if var_4_1:isUnlock() then
			return var_4_1
		end

		return var_4_0:getLastUnlockMap()
	end

	return var_4_0:getMapById(var_4_0:GetLastNormalMap())
end

function var_0_0.GetInitialChapter(arg_5_0)
	arg_5_0 = arg_5_0 or {}

	local var_5_0 = getProxy(ChapterProxy)

	if arg_5_0.chapterVO then
		return arg_5_0.chapterVO
	end

	if arg_5_0.chapterId then
		return var_5_0:getChapterById(arg_5_0.chapterId)
	end

	return var_5_0:getActiveChapter(true)
end

function var_0_0.GetDynamicResList(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = var_0_0.GetInitialChapter(arg_6_0)

	table.insertto(var_6_0, var_0_0.GetEntranceActivityResList())
	table.insertto(var_6_0, var_0_0.GetActivityResList(arg_6_0))
	table.insertto(var_6_0, ResList.ChapterResConst.GetInactiveResList(var_6_1))
	table.insertto(var_6_0, var_0_0.GetProcessAnimResList())

	return var_6_0
end

function var_0_0.GetEntranceActivityResList()
	local var_7_0 = {}
	local var_7_1 = getProxy(ActivityProxy):getEnterReadyActivity()[1]

	if var_7_1 then
		local var_7_2 = var_7_1:getConfig("config_client").entrance_bg

		if noEmptyStr(var_7_2) then
			table.insert(var_7_0, var_7_2)
		end
	end

	return var_7_0
end

function var_0_0.GetActivityResList(arg_8_0)
	local var_8_0 = {}
	local var_8_1 = var_0_0.GetInitialMap(arg_8_0)

	if var_8_1 and var_8_1.isActivity and var_8_1:isActivity() and not var_8_1:isRemaster() then
		local var_8_2 = getProxy(ActivityProxy):getActivityById(var_8_1:getConfig("on_activity"))
		local var_8_3 = var_8_2 and not var_8_2:isEnd() and var_8_2:GetConfigClientSetting("PTID")

		if var_8_3 then
			local var_8_4 = underscore.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK), function(arg_9_0)
				return arg_9_0:getConfig("config_id") == var_8_3
			end)

			if var_8_4 then
				local var_8_5 = Drop.New({
					type = DROP_TYPE_RESOURCE,
					id = tonumber(var_8_4:getConfig("config_id"))
				}):getIcon()

				if noEmptyStr(var_8_5) then
					table.insert(var_8_0, var_8_5)
				end
			end
		end
	end

	return var_8_0
end

function var_0_0.GetProcessAnimResList()
	return {
		"ui/spbombret",
		"ui/missilestrikebar",
		"ui/coastalgun",
		"ui/antiairfire",
		"ui/airstrikelava",
		"ui/airstrikebar",
		"ui/subsairentorpedoui"
	}
end

return var_0_0

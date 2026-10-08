ResList = ResList or {}
ResList.LevelScene = {}

local var_0_0 = ResList.LevelScene

function var_0_0.GetResource(arg_1_0, arg_1_1)
	local var_1_0 = {
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
		"artresource/effect/common/material/add",
		"effect/fleet_status_recorded"
	}

	table.insertto(var_1_0, var_0_0.GetInitialMapResList(arg_1_0, arg_1_1))
	table.insertto(var_1_0, var_0_0.GetDynamicResList(arg_1_1))

	return var_1_0
end

function var_0_0.GetInitialMapResList(arg_2_0, arg_2_1)
	local var_2_0 = {}
	local var_2_1 = var_0_0.GetInitialMap(arg_2_1)

	if var_2_1 then
		local var_2_2 = arg_2_0:GetMapBG(var_2_1)

		_.each(var_2_2 or {}, function(arg_3_0)
			local var_3_0 = arg_3_0.bgPrefix and arg_3_0.bgPrefix or ResPathSupport.ConstPath.LevelMap
			local var_3_1 = ResPathSupport.CombinePath(var_3_0, arg_3_0.BG)

			table.insert(var_2_0, var_3_1)

			if arg_3_0.Animator then
				table.insert(var_2_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, arg_3_0.Animator))
			end
		end)

		local var_2_3 = var_2_1:getConfig("cloud_suffix")

		if noEmptyStr(var_2_3) then
			for iter_2_0, iter_2_1 in ipairs(var_2_1:getConfig("clouds_pos") or {}) do
				table.insert(var_2_0, "clouds/cloud_" .. iter_2_0 .. "_" .. var_2_3)
			end
		end
	end

	local var_2_4 = var_0_0.GetInitialChapter(arg_2_1)

	if var_2_4 and var_2_4.theme then
		local var_2_5 = var_2_4.theme

		if noEmptyStr(var_2_5.assetSea) then
			table.insert(var_2_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.ChapterPic, var_2_5.assetSea))
		end

		if noEmptyStr(var_2_5.seaBase) then
			table.insert(var_2_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.ChapterPic, var_2_5.seaBase))
		end
	end

	return var_2_0
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
	table.insertto(var_6_0, var_0_0.GetChapterShipResList(var_6_1))
	table.insertto(var_6_0, var_0_0.GetChapterChampionResList(var_6_1))
	table.insertto(var_6_0, var_0_0.GetChapterCommanderResList(var_6_1))
	table.insertto(var_6_0, var_0_0.GetLevelGridResList(var_6_1))
	table.insertto(var_6_0, var_0_0.GetProcessAnimResList(var_6_1))

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

function var_0_0.GetUIAnimResList(arg_10_0)
	local var_10_0 = {}

	if noEmptyStr(arg_10_0) then
		table.insert(var_10_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, arg_10_0))
	end

	return var_10_0
end

function var_0_0.GetChapterShipResList(arg_11_0)
	local var_11_0 = {}

	if arg_11_0 and arg_11_0.fleets then
		_.each(arg_11_0.fleets, function(arg_12_0)
			if arg_12_0.getShips then
				local var_12_0 = arg_12_0:getShips(false)

				_.each(var_12_0, function(arg_13_0)
					table.insertto(var_11_0, var_0_0.GetShipStrikeResList(arg_13_0, arg_13_0:GetMapStrikeAnim()))
				end)
			end
		end)
	end

	return var_11_0
end

function var_0_0.GetChapterChampionResList(arg_14_0)
	local var_14_0 = {}

	if arg_14_0 and arg_14_0.champions then
		_.each(arg_14_0.champions, function(arg_15_0)
			table.insertto(var_14_0, var_0_0.GetEnemyStrikeResList(arg_15_0, "SubSairenTorpedoUI"))
		end)
	end

	return var_14_0
end

function var_0_0.GetChapterCommanderResList(arg_16_0)
	local var_16_0 = {}

	if arg_16_0 and arg_16_0.fleets then
		_.each(arg_16_0.fleets, function(arg_17_0)
			if arg_17_0.getCommanders then
				_.each(arg_17_0:getCommanders(), function(arg_18_0)
					table.insertto(var_16_0, var_0_0.GetCommanderResList(arg_18_0))
				end)
			end
		end)
	end

	return var_16_0
end

function var_0_0.GetLevelGridResList(arg_19_0)
	local var_19_0 = {}

	if not arg_19_0 then
		return var_19_0
	end

	if arg_19_0.theme then
		local var_19_1 = arg_19_0.theme

		if noEmptyStr(var_19_1.assetSea) then
			table.insert(var_19_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.ChapterPic, var_19_1.assetSea))
		end

		if noEmptyStr(var_19_1.seaBase) then
			table.insert(var_19_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.ChapterPic, var_19_1.seaBase))
		end
	end

	local var_19_2 = arg_19_0:getConfig("chapter_fx")

	if type(var_19_2) == "table" then
		for iter_19_0, iter_19_1 in pairs(var_19_2) do
			if noEmptyStr(iter_19_0) then
				local var_19_3 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, iter_19_0)

				table.insert(var_19_0, var_19_3)
			end
		end
	end

	table.insert(var_19_0, "effect/huoqiubaozha")
	table.insert(var_19_0, "effect/atdun_full_slg")
	table.insert(var_19_0, "effect/dexiv4_slg_missile")
	table.insert(var_19_0, "effect/shellhitblue")
	table.insert(var_19_0, "effect/miwuxiaosan")
	table.insert(var_19_0, "effect/qianting_01")
	_.each(arg_19_0:GetChapterCellAttachemnts(), function(arg_20_0)
		local var_20_0 = pg.expedition_data_template[arg_20_0.attachmentId]
		local var_20_1 = var_20_0 and var_20_0.SLG_destroy_FX

		if not noEmptyStr(var_20_1) then
			var_20_1 = "huoqiubaozha"
		end

		table.insert(var_19_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, var_20_1))
	end)

	return var_19_0
end

function var_0_0.GetProcessAnimResList(arg_21_0)
	local var_21_0 = {
		"ui/spbombret",
		"ui/missilestrikebar",
		"ui/coastalgun",
		"ui/antiairfire",
		"ui/airstrikelava",
		"ui/airstrikebar",
		"ui/subsairentorpedoui"
	}

	if arg_21_0 and arg_21_0.fleets then
		_.each(arg_21_0.fleets, function(arg_22_0)
			if arg_22_0.getShips then
				_.each(arg_22_0:getShips(false), function(arg_23_0)
					table.insertto(var_21_0, var_0_0.GetUIAnimResList(arg_23_0:GetMapStrikeAnim()))
				end)
			end
		end)
	end

	return var_21_0
end

function var_0_0.GetShipStrikeResList(arg_24_0, arg_24_1)
	local var_24_0 = var_0_0.GetUIAnimResList(arg_24_1)

	if arg_24_0 then
		local var_24_1 = arg_24_0:getPainting()

		if noEmptyStr(var_24_1) then
			local var_24_2 = ResPathSupport.GetPaintingListByPaintingName(var_24_1)

			table.insertto(var_24_0, var_24_2)
		end

		table.insertto(var_24_0, ResPathSupport.GetSpineCharListByPrefabName(arg_24_0:getPrefab()))
	end

	return var_24_0
end

function var_0_0.GetEnemyStrikeResList(arg_25_0, arg_25_1)
	local var_25_0 = var_0_0.GetUIAnimResList(arg_25_1)

	if arg_25_0 then
		table.insertto(var_25_0, ResPathSupport.GetSpineCharListByPrefabName(arg_25_0:getPrefab()))
	end

	return var_25_0
end

function var_0_0.GetCommanderResList(arg_26_0)
	local var_26_0 = {}

	if arg_26_0 then
		local var_26_1 = arg_26_0:getConfig("painting")

		if noEmptyStr(var_26_1) then
			local var_26_2 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderHrz, var_26_1)

			table.insert(var_26_0, var_26_2)
		end
	end

	return var_26_0
end

return var_0_0

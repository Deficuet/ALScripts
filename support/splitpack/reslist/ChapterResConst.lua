ResList = ResList or {}
ResList.ChapterResConst = {}

local var_0_0 = ResList.ChapterResConst

local function var_0_1(arg_1_0, arg_1_1, arg_1_2)
	if noEmptyStr(arg_1_2) then
		table.insert(arg_1_0, ResPathSupport.CombinePath(arg_1_1, arg_1_2))
	end
end

local var_0_2 = {
	"effect/huoqiubaozha",
	"effect/atdun_full_slg",
	"effect/dexiv4_slg_missile",
	"effect/shellhitblue",
	"effect/miwuxiaosan",
	"effect/qianting_01"
}

function var_0_0.IsActive(arg_2_0)
	return arg_2_0 ~= nil and arg_2_0.active == true
end

function var_0_0.GetResList(arg_3_0)
	local var_3_0 = var_0_0.GetInactiveResList(arg_3_0)

	table.insertto(var_3_0, var_0_0.GetActiveResList(arg_3_0))

	return var_3_0
end

function var_0_0.GetInactiveResList(arg_4_0)
	local var_4_0 = {}

	if not arg_4_0 then
		return var_4_0
	end

	table.insertto(var_4_0, var_0_0.GetThemeResList(arg_4_0))
	table.insertto(var_4_0, var_0_0.GetEffectResList(arg_4_0))
	table.insertto(var_4_0, var_0_0.GetSceneResList(arg_4_0))

	return var_4_0
end

function var_0_0.GetActiveResList(arg_5_0)
	local var_5_0 = {}

	if not var_0_0.IsActive(arg_5_0) then
		return var_5_0
	end

	table.insertto(var_5_0, var_0_0.GetFleetResList(arg_5_0))
	table.insertto(var_5_0, var_0_0.GetChampionResList(arg_5_0))
	table.insertto(var_5_0, var_0_0.GetCellAttachmentResList(arg_5_0))
	table.insertto(var_5_0, var_0_0.GetStrategyResList(arg_5_0))
	table.insertto(var_5_0, var_0_0.GetCommanderSkillResList(arg_5_0))
	table.insertto(var_5_0, var_0_0.GetFleetIconResList(arg_5_0))

	return var_5_0
end

function var_0_0.GetThemeResList(arg_6_0)
	local var_6_0 = {}

	if not arg_6_0 then
		return var_6_0
	end

	local var_6_1 = arg_6_0:getConfig("theme")

	if type(var_6_1) ~= "table" then
		return var_6_0
	end

	for iter_6_0, iter_6_1 in ipairs({
		1,
		10
	}) do
		local var_6_2 = var_6_1[iter_6_1]

		if noEmptyStr(var_6_2) then
			table.insert(var_6_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.ChapterPic, var_6_2))
		end
	end

	return var_6_0
end

function var_0_0.GetEffectResList(arg_7_0)
	local var_7_0 = {}

	if not arg_7_0 then
		return var_7_0
	end

	local var_7_1 = arg_7_0:getConfig("chapter_fx")

	if type(var_7_1) == "table" then
		for iter_7_0, iter_7_1 in pairs(var_7_1) do
			if noEmptyStr(iter_7_0) then
				table.insert(var_7_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, iter_7_0))
			end
		end
	end

	local var_7_2 = arg_7_0:getConfig("wall_prefab")

	if type(var_7_2) == "table" then
		for iter_7_2, iter_7_3 in ipairs(var_7_2) do
			var_0_1(var_7_0, ResPathSupport.ConstPath.UI.Effect, iter_7_3[3])
			var_0_1(var_7_0, ResPathSupport.ConstPath.UI.Effect, iter_7_3[4])
		end
	end

	for iter_7_4, iter_7_5 in ipairs(var_0_2) do
		table.insert(var_7_0, iter_7_5)
	end

	return var_7_0
end

function var_0_0.GetSceneResList(arg_8_0)
	local var_8_0 = {}

	if not arg_8_0 then
		return var_8_0
	end

	local var_8_1 = arg_8_0:getConfig("bg")

	if noEmptyStr(var_8_1) then
		table.insert(var_8_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.LevelMap, var_8_1))
	end

	table.insertto(var_8_0, var_0_0.GetUIAnimResList(arg_8_0:getConfig("pop_pic")))

	local var_8_2 = arg_8_0:getConfig("bgm")

	if noEmptyStr(var_8_2) then
		table.insert(var_8_0, "cue/bgm-" .. var_8_2 .. ".b")
	end

	return var_8_0
end

function var_0_0.GetFleetResList(arg_9_0)
	local var_9_0 = {}

	if not var_0_0.IsActive(arg_9_0) then
		return var_9_0
	end

	_.each(arg_9_0.fleets or {}, function(arg_10_0)
		if arg_10_0.getFleetType and arg_10_0:getFleetType() == FleetType.Transport then
			var_0_1(var_9_0, "enemies", arg_10_0:getPrefab())
		end

		if arg_10_0.getShips then
			_.each(arg_10_0:getShips(false), function(arg_11_0)
				table.insertto(var_9_0, var_0_0.GetShipStrikeResList(arg_11_0, arg_11_0:GetMapStrikeAnim()))
			end)
		end

		if arg_10_0.getCommanders then
			for iter_10_0, iter_10_1 in pairs(arg_10_0:getCommanders()) do
				table.insertto(var_9_0, var_0_0.GetCommanderResList(iter_10_1))
			end
		end
	end)

	return var_9_0
end

function var_0_0.GetChampionResList(arg_12_0)
	local var_12_0 = {}

	if not var_0_0.IsActive(arg_12_0) then
		return var_12_0
	end

	_.each(arg_12_0.champions or {}, function(arg_13_0)
		if arg_13_0:getPoolType() == ChapterConst.TemplateOni then
			for iter_13_0 = 1, #(arg_12_0.fleets or {}) + 1 do
				var_0_1(var_12_0, "enemies", "sp_" .. iter_13_0)
			end
		else
			if arg_13_0:getPoolType() == ChapterConst.TemplateChampion then
				table.insertto(var_12_0, var_0_0.GetEnemyStrikeResList(arg_13_0, "SubSairenTorpedoUI"))
			end

			table.insertto(var_12_0, var_0_0.GetEnemyMapResList(arg_13_0:getConfigTable()))
		end
	end)

	return var_12_0
end

function var_0_0.GetEnemyMapResList(arg_14_0, arg_14_1)
	local var_14_0 = {}

	if not arg_14_0 then
		return var_14_0
	end

	if noEmptyStr(arg_14_0.icon) then
		if arg_14_0.icon_type == 1 then
			var_0_1(var_14_0, "enemies", arg_14_0.icon)

			if arg_14_1 then
				var_0_1(var_14_0, "enemies", arg_14_0.icon .. "_d_blue")
			end

			table.insert(var_14_0, "enemies/fogsrqz")
		else
			table.insertto(var_14_0, ResPathSupport.GetSpineCharListByPrefabName(arg_14_0.icon))
		end
	end

	var_0_1(var_14_0, ResPathSupport.ConstPath.UI.Effect, arg_14_0.effect_prefab)

	return var_14_0
end

function var_0_0.GetTransformedUIResList(arg_15_0, arg_15_1)
	local var_15_0 = {}

	if not var_0_0.IsActive(arg_15_0) or not noEmptyStr(arg_15_1) then
		return var_15_0
	end

	local var_15_1 = {
		arg_15_1
	}
	local var_15_2 = arg_15_0:getConfig("ItemTransformPattern")

	if type(var_15_2) == "table" then
		for iter_15_0, iter_15_1 in ipairs(arg_15_0:getExtraFlags()) do
			local var_15_3 = var_15_2[iter_15_1]

			if var_15_3 then
				local var_15_4 = {}

				for iter_15_2, iter_15_3 in ipairs(var_15_1) do
					if var_15_3[3] and var_15_3[3] < 1 then
						table.insert(var_15_4, iter_15_3)
					end

					if not var_15_3[3] or var_15_3[3] > 0 then
						local var_15_5 = string.gsub(iter_15_3, var_15_3[1], var_15_3[2])

						table.insert(var_15_4, var_15_5)
					end
				end

				var_15_1 = var_15_4
			end
		end
	end

	for iter_15_4, iter_15_5 in ipairs(var_15_1) do
		var_0_1(var_15_0, ResPathSupport.ConstPath.UI.Base, iter_15_5)
	end

	return var_15_0
end

function var_0_0.GetStoryResList(arg_16_0, arg_16_1)
	local var_16_0 = {}

	if not var_0_0.IsActive(arg_16_0) or not arg_16_1 then
		return var_16_0
	end

	local var_16_1 = pg.map_event_template[arg_16_1.attachmentId]

	if not var_16_1 then
		return var_16_0
	end

	if arg_16_1.data == ChapterConst.Story then
		var_0_1(var_16_0, "boxprefab", var_16_1.icon)
	elseif arg_16_1.data == ChapterConst.StoryObstacle then
		if noEmptyStr(var_16_1.icon) then
			table.insertto(var_16_0, var_0_0.GetTransformedUIResList(arg_16_0, var_16_1.icon .. "_2"))
		end

		var_0_1(var_16_0, ResPathSupport.ConstPath.UI.Base, var_16_1.animation)
	elseif arg_16_1.data == ChapterConst.StoryTrigger and var_16_1.c_type ~= ChapterConst.EvtType_AdditionalFloor and noEmptyStr(var_16_1.icon) then
		table.insertto(var_16_0, var_0_0.GetTransformedUIResList(arg_16_0, var_16_1.icon .. "_1"))

		local var_16_2 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, var_16_1.icon .. "_1shangceng")

		if checkABExist(var_16_2) then
			table.insert(var_16_0, var_16_2)
		end
	end

	return var_16_0
end

function var_0_0.GetCellAttachmentResList(arg_17_0)
	local var_17_0 = {}

	if not var_0_0.IsActive(arg_17_0) then
		return var_17_0
	end

	local function var_17_1(arg_18_0)
		local var_18_0 = ChapterConst.GetDestroyFX(arg_18_0)

		if noEmptyStr(var_18_0) then
			table.insert(var_17_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, var_18_0))
		end
	end

	for iter_17_0, iter_17_1 in pairs(arg_17_0.cells or {}) do
		if ChapterConst.IsEnemyAttach(iter_17_1.attachment) then
			var_17_1(iter_17_1)
			table.insertto(var_17_0, var_0_0.GetEnemyMapResList(pg.expedition_data_template[iter_17_1.attachmentId], iter_17_1.attachment ~= ChapterConst.AttachAmbush))
		elseif iter_17_1.attachment == ChapterConst.AttachStory then
			table.insertto(var_17_0, var_0_0.GetStoryResList(arg_17_0, iter_17_1))
		elseif iter_17_1.attachment == ChapterConst.AttachBox then
			local var_17_2 = pg.box_data_template[iter_17_1.attachmentId]

			var_0_1(var_17_0, "boxprefab", var_17_2 and var_17_2.icon)
		elseif iter_17_1.attachment == ChapterConst.AttachBomb_Enemy then
			local var_17_3 = pg.specialunit_template[iter_17_1.attachmentId]
			local var_17_4 = pg.land_based_template[iter_17_1.attachmentId]

			var_0_1(var_17_0, "enemies", var_17_3 and var_17_3.prefab)

			if var_17_4 and noEmptyStr(var_17_4.prefab) then
				var_0_1(var_17_0, "enemies", var_17_4.prefab .. "_d_blue")
			end
		elseif iter_17_1.attachment == ChapterConst.AttachLandbase then
			local var_17_5 = pg.land_based_template[iter_17_1.attachmentId]

			if var_17_5 and noEmptyStr(var_17_5.prefab) then
				if var_17_5.type == ChapterConst.LBCoastalGun then
					var_0_1(var_17_0, "enemies", var_17_5.prefab)
					var_0_1(var_17_0, "enemies", var_17_5.prefab .. "_d_blue")
				elseif var_17_5.type == ChapterConst.LBFogLightBase then
					var_0_1(var_17_0, "chapter", var_17_5.prefab)
					var_0_1(var_17_0, "chapter", var_17_5.prefab .. "_d_blue")
				end
			end
		end

		var_0_1(var_17_0, "chapter", iter_17_1.item)

		if iter_17_1.GetWeatherFlagList then
			for iter_17_2, iter_17_3 in ipairs(iter_17_1:GetWeatherFlagList()) do
				local var_17_6 = pg.weather_data_template[iter_17_3]

				var_0_1(var_17_0, ResPathSupport.ConstPath.UI.Base, var_17_6 and var_17_6.icon)
			end
		end
	end

	for iter_17_4, iter_17_5 in pairs(arg_17_0:GetChapterCellAttachemnts() or {}) do
		table.insertto(var_17_0, var_0_0.GetStoryResList(arg_17_0, iter_17_5))
	end

	for iter_17_6, iter_17_7 in pairs(arg_17_0.wallAssets or {}) do
		var_0_1(var_17_0, ResPathSupport.ConstPath.UI.Effect, iter_17_7[3])
		var_0_1(var_17_0, ResPathSupport.ConstPath.UI.Effect, iter_17_7[4])
	end

	local var_17_7 = getProxy(ChapterProxy):GetLastDefeatedEnemy(arg_17_0.id)

	if var_17_7 then
		var_17_1(var_17_7)
	end

	return var_17_0
end

function var_0_0.GetStrategyResList(arg_19_0)
	local var_19_0 = {}

	if not var_0_0.IsActive(arg_19_0) then
		return var_19_0
	end

	local function var_19_1(arg_20_0)
		local var_20_0 = pg.strategy_data_template[arg_20_0]

		if var_20_0 and noEmptyStr(var_20_0.icon) then
			table.insert(var_19_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_20_0.icon))
		end
	end

	_.each(arg_19_0:GetShowingStrategies(), var_19_1)
	_.each(arg_19_0.fleets or {}, function(arg_21_0)
		if arg_21_0.getStrategies then
			_.each(arg_21_0:getStrategies(), function(arg_22_0)
				var_19_1(arg_22_0.id)
			end)
		end
	end)

	if arg_19_0:getChapterSupportFleet() and not arg_19_0:IsSupportSubmarineStage() then
		var_19_1(ChapterConst.StrategyAirSupportFriendly)
	end

	_.each(arg_19_0:GetWeather(), function(arg_23_0)
		local var_23_0 = pg.weather_data_template[arg_23_0]

		if var_23_0 and noEmptyStr(var_23_0.buff_icon) then
			table.insert(var_19_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_23_0.buff_icon))
		end
	end)

	for iter_19_0, iter_19_1 in pairs(arg_19_0.cells or {}) do
		if iter_19_1.attachment == ChapterConst.AttachStrategy then
			local var_19_2 = ChapterStrategy.New(pg.strategy_data_template[iter_19_1.attachmentId])

			if var_19_2 and var_19_2.count > 0 then
				var_19_1(var_19_2.id)
			end
		end
	end

	_.each(arg_19_0:GetInteractableStrategies(), function(arg_24_0)
		if arg_24_0.id ~= ChapterConst.StrategyHuntingRange and arg_24_0.id ~= ChapterConst.StrategySubAutoAttack then
			var_19_1(arg_24_0.id)
		end
	end)

	return var_19_0
end

function var_0_0.GetCommanderSkillResList(arg_25_0)
	local var_25_0 = {}

	if not var_0_0.IsActive(arg_25_0) then
		return var_25_0
	end

	_.each(arg_25_0.fleets or {}, function(arg_26_0)
		if arg_26_0.getCommanders then
			for iter_26_0, iter_26_1 in pairs(arg_26_0:getCommanders()) do
				local var_26_0 = iter_26_1:getSkills()[1]
				local var_26_1 = var_26_0 and var_26_0:getConfig("icon")

				if noEmptyStr(var_26_1) then
					table.insert(var_25_0, "commanderskillicon/" .. var_26_1)
				end
			end
		end
	end)

	return var_25_0
end

function var_0_0.GetFleetIconResList(arg_27_0)
	local var_27_0 = {}

	if not var_0_0.IsActive(arg_27_0) then
		return var_27_0
	end

	_.each(arg_27_0.fleets or {}, function(arg_28_0)
		if arg_28_0.getShips then
			_.each(arg_28_0:getShips(true), function(arg_29_0)
				table.insertto(var_27_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(arg_29_0:getPainting()))
				table.insertto(var_27_0, ResPathSupport.GetSpineQIconListByPrefabName(arg_29_0:getPrefab()))
			end)
		end
	end)

	return var_27_0
end

function var_0_0.GetUIAnimResList(arg_30_0)
	local var_30_0 = {}

	if noEmptyStr(arg_30_0) then
		table.insert(var_30_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Base, arg_30_0))
	end

	return var_30_0
end

function var_0_0.GetShipStrikeResList(arg_31_0, arg_31_1)
	local var_31_0 = var_0_0.GetUIAnimResList(arg_31_1)

	if arg_31_0 then
		local var_31_1 = arg_31_0:getPainting()

		if noEmptyStr(var_31_1) then
			table.insertto(var_31_0, ResPathSupport.GetPaintingListByPaintingName(var_31_1))
		end

		table.insertto(var_31_0, ResPathSupport.GetSpineCharListByPrefabName(arg_31_0:getPrefab()))
	end

	return var_31_0
end

function var_0_0.GetEnemyStrikeResList(arg_32_0, arg_32_1)
	local var_32_0 = var_0_0.GetUIAnimResList(arg_32_1)

	if arg_32_0 then
		table.insertto(var_32_0, ResPathSupport.GetSpineCharListByPrefabName(arg_32_0:getPrefab()))
	end

	return var_32_0
end

function var_0_0.GetCommanderResList(arg_33_0)
	local var_33_0 = {}

	if arg_33_0 then
		local var_33_1 = arg_33_0:getConfig("painting")

		if noEmptyStr(var_33_1) then
			table.insert(var_33_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderHrz, var_33_1))
		end
	end

	return var_33_0
end

return var_0_0

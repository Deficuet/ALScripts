ResList = ResList or {}
ResList.LevelStageView = {}

local var_0_0 = ResList.LevelStageView

function var_0_0.GetResource(arg_1_0)
	local var_1_0 = {}
	local var_1_1 = arg_1_0 and arg_1_0.chapterVO

	table.insertto(var_1_0, var_0_0.GetStrategyResList(var_1_1))
	table.insertto(var_1_0, var_0_0.GetCommanderSkillResList(var_1_1))
	table.insertto(var_1_0, var_0_0.GetShipResList(var_1_1))
	table.insertto(var_1_0, ResList.LevelScene.GetLevelGridResList(var_1_1))

	return var_1_0
end

function var_0_0.GetStrategyResList(arg_2_0)
	local var_2_0 = {}

	if not arg_2_0 then
		return var_2_0
	end

	_.each(arg_2_0:GetShowingStrategies() or {}, function(arg_3_0)
		local var_3_0 = pg.strategy_data_template[arg_3_0]

		if var_3_0 and noEmptyStr(var_3_0.icon) then
			local var_3_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_3_0.icon)

			table.insert(var_2_0, var_3_1)
		end
	end)

	local var_2_1 = arg_2_0.fleet
	local var_2_2 = var_2_1 and var_2_1:getStrategies() or {}

	_.each(var_2_2, function(arg_4_0)
		local var_4_0 = pg.strategy_data_template[arg_4_0.id]

		if var_4_0 and noEmptyStr(var_4_0.icon) then
			local var_4_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_4_0.icon)

			table.insert(var_2_0, var_4_1)
		end
	end)
	_.each(arg_2_0:GetWeather(), function(arg_5_0)
		local var_5_0 = pg.weather_data_template[arg_5_0]

		if var_5_0 and noEmptyStr(var_5_0.buff_icon) then
			local var_5_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_5_0.buff_icon)

			table.insert(var_2_0, var_5_1)
		end
	end)
	_.each(arg_2_0:GetChapterCellAttachemnts(), function(arg_6_0)
		if arg_6_0.attachment == ChapterConst.AttachStrategy then
			local var_6_0 = ChapterStrategy.New(pg.strategy_data_template[arg_6_0.attachmentId])

			if var_6_0 and var_6_0.count > 0 then
				local var_6_1 = pg.strategy_data_template[var_6_0.id]

				if var_6_1 and noEmptyStr(var_6_1.icon) then
					local var_6_2 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_6_1.icon)

					table.insert(var_2_0, var_6_2)
				end
			end
		end
	end)
	_.each(arg_2_0:GetInteractableStrategies(), function(arg_7_0)
		if arg_7_0.id ~= ChapterConst.StrategyHuntingRange and arg_7_0.id ~= ChapterConst.StrategySubAutoAttack then
			local var_7_0 = pg.strategy_data_template[arg_7_0.id]

			if var_7_0 and noEmptyStr(var_7_0.icon) then
				local var_7_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.StrategyIcon, var_7_0.icon)

				table.insert(var_2_0, var_7_1)
			end
		end
	end)

	return var_2_0
end

function var_0_0.GetCommanderSkillResList(arg_8_0)
	local var_8_0 = {}

	if not arg_8_0 or not arg_8_0.fleets then
		return var_8_0
	end

	_.each(arg_8_0.fleets, function(arg_9_0)
		if arg_9_0 and arg_9_0.getCommanders then
			_.each(arg_9_0:getCommanders(), function(arg_10_0)
				local var_10_0 = arg_10_0 and arg_10_0:getSkills()[1]
				local var_10_1 = var_10_0 and var_10_0:getConfig("icon")

				if noEmptyStr(var_10_1) then
					table.insert(var_8_0, "commanderskillicon/" .. var_10_1)
				end
			end)
		end
	end)

	return var_8_0
end

function var_0_0.GetShipResList(arg_11_0)
	local var_11_0 = {}

	if not arg_11_0 or not arg_11_0.fleets then
		return var_11_0
	end

	_.each(arg_11_0.fleets, function(arg_12_0)
		if arg_12_0 and arg_12_0.getShips then
			_.each(arg_12_0:getShips(true), function(arg_13_0)
				var_0_0.InsertShipResList(var_11_0, arg_13_0)
			end)
		end
	end)

	local var_11_1 = arg_11_0:getChapterSupportFleet()

	if var_11_1 and var_11_1.getShips then
		_.each(var_11_1:getShips(true), function(arg_14_0)
			var_0_0.InsertShipResList(var_11_0, arg_14_0)
		end)
	end

	return var_11_0
end

function var_0_0.InsertShipResList(arg_15_0, arg_15_1)
	if not arg_15_1 then
		return
	end

	table.insertto(arg_15_0, ResPathSupport.GetPaintingSquareIconListByPaintingName(arg_15_1:getPainting()))
	table.insertto(arg_15_0, ResPathSupport.GetSpineQIconListByPrefabName(arg_15_1:getPrefab()))
end

return var_0_0

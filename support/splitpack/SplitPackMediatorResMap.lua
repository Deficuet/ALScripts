local var_0_0 = {}

SplitPackMediatorResMap = var_0_0

function var_0_0.TryGetList(arg_1_0)
	local var_1_0 = var_0_0.TryGetConfigList(arg_1_0)
	local var_1_1 = var_0_0.TryGetLogicList(arg_1_0)

	return (var_0_0.MergeLuaArr(var_1_0, var_1_1))
end

function var_0_0.GetUIPreloadList(arg_2_0)
	local var_2_0 = arg_2_0.context.viewComponent:preloadUIList()

	return (_.map(var_2_0, function(arg_3_0)
		return "ui/" .. arg_3_0
	end))
end

function var_0_0.GetBGMList(arg_4_0)
	local var_4_0 = arg_4_0.context.viewComponent:getBGM()

	if var_4_0 then
		return {
			"cue/bgm-" .. var_4_0 .. ".b"
		}
	end

	return {}
end

function var_0_0.TryGetConfigList(arg_5_0)
	local var_5_0 = arg_5_0.context.viewComponent
	local var_5_1 = arg_5_0.context.mediator
	local var_5_2 = var_5_0.__cname
	local var_5_3 = var_5_1.__cname
	local var_5_4 = pg.split_pack_config[var_5_3]
	local var_5_5 = {}

	if var_5_4 then
		var_5_5 = var_5_4.res_list
	end

	local var_5_6 = pg.split_pack_config[var_5_2]
	local var_5_7 = {}

	if var_5_6 then
		var_5_7 = var_5_6.res_list
	end

	return (var_0_0.MergeLuaArr(var_5_5, var_5_7))
end

function var_0_0.TryGetLogicList(arg_6_0)
	local var_6_0 = arg_6_0.context.viewComponent
	local var_6_1 = arg_6_0.context.mediator
	local var_6_2 = var_6_0.__cname
	local var_6_3 = var_6_1.__cname
	local var_6_4 = var_0_0.LogicMap[var_6_3]
	local var_6_5 = {}

	if var_6_4 and type(var_6_4) == "function" then
		var_6_5 = var_6_4(arg_6_0)
	end

	local var_6_6 = var_0_0.LogicMap[var_6_2]
	local var_6_7 = {}

	if var_6_6 and type(var_6_6) == "function" then
		var_6_7 = var_6_6(arg_6_0)
	end

	local var_6_8 = {}
	local var_6_9 = var_6_0.getResource

	if var_6_9 and type(var_6_9) == "function" then
		var_6_8 = var_6_9(var_6_0)
	end

	return (var_0_0.MergeLuaArr(var_6_5, var_6_7, var_6_8))
end

function var_0_0.MergeLuaArr(...)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in ipairs({
		...
	}) do
		if iter_7_1 then
			for iter_7_2 = 1, #iter_7_1 do
				var_7_0[#var_7_0 + 1] = iter_7_1[iter_7_2]
			end
		end
	end

	return var_7_0
end

var_0_0.LogicMap = {}

function var_0_0.LogicMap.LoginScene(arg_8_0)
	local var_8_0 = var_0_0.GetUIPreloadList(arg_8_0)
	local var_8_1 = var_0_0.GetBGMList(arg_8_0)
	local var_8_2, var_8_3, var_8_4, var_8_5, var_8_6 = getLoginConfig()
	local var_8_7 = {
		"effect/" .. var_8_3,
		"loadingbg_hx/" .. var_8_3,
		"loadingbg/" .. var_8_3
	}

	if var_8_4 and var_8_4 ~= "" then
		local var_8_8 = "cue/bgm-" .. var_8_4 .. ".b"

		table.insert(var_8_7, var_8_8)
	end

	return (var_0_0.MergeLuaArr(var_8_7, var_8_0, var_8_1))
end

function var_0_0.LogicMap.CombatLoadUI(arg_9_0)
	local var_9_0 = var_0_0.GetUIPreloadList(arg_9_0)
	local var_9_1 = var_0_0.GetBGMList(arg_9_0)
	local var_9_2 = CombatLoadUI.EnsureBaseBGList()
	local var_9_3 = {}
	local var_9_4, var_9_5, var_9_6 = CombatLoadUI.GetTotalResourceList(arg_9_0.context.data)

	if var_9_4 and #var_9_4 > 0 then
		for iter_9_0, iter_9_1 in ipairs(var_9_4) do
			iter_9_1 = string.lower(iter_9_1)

			table.insert(var_9_3, iter_9_1)
		end
	end

	return (var_0_0.MergeLuaArr(var_9_0, var_9_1, var_9_2, var_9_3, var_9_6))
end

function var_0_0.LogicMap.BattleScene(arg_10_0)
	local var_10_0 = var_0_0.GetUIPreloadList(arg_10_0)
	local var_10_1 = {}
	local var_10_2
	local var_10_3 = arg_10_0.context.data

	table.insert(var_10_1, var_10_3.system == SYSTEM_WORLD and checkExist(pg.world_expedition_data[var_10_3.stageId], {
		"bgm"
	}) or "")
	table.insert(var_10_1, pg.expedition_data_template[var_10_3.stageId].bgm)

	for iter_10_0, iter_10_1 in ipairs(var_10_1) do
		if iter_10_1 ~= "" then
			var_10_2 = iter_10_1

			break
		end
	end

	if #var_10_1 == 0 then
		var_10_2 = getBGM(arg_10_0.context.viewComponent.__cname)
	end

	if var_10_2 then
		local var_10_4 = "cue/bgm-" .. var_10_2 .. ".b"

		var_10_1 = {
			var_10_4
		}
	end

	return (var_0_0.MergeLuaArr(var_10_0, var_10_1))
end

function var_0_0.LogicMap.NewPlayerScene(arg_11_0)
	local var_11_0 = var_0_0.GetUIPreloadList(arg_11_0)
	local var_11_1 = var_0_0.GetBGMList(arg_11_0)
	local var_11_2 = {}
	local var_11_3 = {}
	local var_11_4 = {}
	local var_11_5 = {
		101171,
		201211,
		401231
	}

	_.each(var_11_5, function(arg_12_0)
		PaintingGroupConst.AddPaintingNameByShipConfigID(var_11_2, arg_12_0)

		local var_12_0 = pg.ship_data_template[arg_12_0]

		_.each(var_12_0.buff_list_display, function(arg_13_0)
			local var_13_0 = getSkillConfig(arg_13_0)

			table.insert(var_11_3, "skillicon/" .. var_13_0.icon)
		end)

		local var_12_1 = Ship.New({
			configId = arg_12_0
		}):getPrefab()

		table.insert(var_11_4, "char/" .. var_12_1)
		table.insert(var_11_4, "char/" .. var_12_1 .. "_hx")
	end)

	return (var_0_0.MergeLuaArr(var_11_0, var_11_1, var_11_2, var_11_3, var_11_4))
end

function var_0_0.LogicMap.SkillInfoLayer(arg_14_0)
	local var_14_0 = var_0_0.GetUIPreloadList(arg_14_0)
	local var_14_1 = var_0_0.GetBGMList(arg_14_0)
	local var_14_2 = {}
	local var_14_3 = arg_14_0.context.data.skillId
	local var_14_4 = getSkillConfig(var_14_3)

	table.insert(var_14_2, "skillicon/" .. var_14_4.icon)

	return (var_0_0.MergeLuaArr(var_14_0, var_14_1, var_14_2))
end

function var_0_0.LogicMap.NewMainScene(arg_15_0)
	local var_15_0 = var_0_0.GetUIPreloadList(arg_15_0)
	local var_15_1 = var_0_0.GetBGMList(arg_15_0)

	return (var_0_0.MergeLuaArr(var_15_0, var_15_1))
end

return var_0_0

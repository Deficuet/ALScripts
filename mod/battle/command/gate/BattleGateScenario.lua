local var_0_0 = class("BattleGateScenario")

ys.Battle.BattleGateScenario = var_0_0
var_0_0.__name = "BattleGateScenario"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	if BeginStageCommand.DockOverload() then
		getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.DOCK_OVERLOADED)

		return
	end

	local var_1_0 = getProxy(PlayerProxy)
	local var_1_1 = getProxy(BayProxy)
	local var_1_2 = pg.battle_cost_template[SYSTEM_SCENARIO]
	local var_1_3 = var_1_2.oil_cost > 0
	local var_1_4 = {}
	local var_1_5 = 0
	local var_1_6 = 0
	local var_1_7 = 0
	local var_1_8 = 0
	local var_1_9 = getProxy(ChapterProxy):getActiveChapter()
	local var_1_10 = var_1_9.fleet
	local var_1_11 = var_1_10:getShips(false)

	for iter_1_0, iter_1_1 in ipairs(var_1_11) do
		var_1_4[#var_1_4 + 1] = iter_1_1.id
	end

	local var_1_12, var_1_13 = var_1_9:getFleetCost(var_1_10, arg_1_0.stageId)
	local var_1_14 = var_1_12.gold
	local var_1_15 = var_1_12.oil
	local var_1_16 = var_1_12.gold + var_1_13.gold
	local var_1_17 = var_1_12.oil + var_1_13.oil
	local var_1_18 = var_1_0:getData()

	if var_1_3 and var_1_17 > var_1_18.oil then
		getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.OIL_LACK)

		if not ItemTipPanel.ShowOilBuyTip(var_1_17) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))
		end

		return
	end

	local var_1_19 = arg_1_0.stageId
	local var_1_20 = pg.expedition_data_template[var_1_19].dungeon_id
	local var_1_21 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_20).fleet_prefab

	arg_1_1.ShipVertify()

	local var_1_22

	if var_1_9:getPlayType() == ChapterConst.TypeExtra then
		var_1_22 = true
	end

	local var_1_23 = var_1_9:GetExtraCostRate()

	local function var_1_24(arg_2_0)
		if var_1_3 then
			var_1_18:consume({
				gold = 0,
				oil = var_1_15
			})
		end

		if var_1_2.enter_energy_cost > 0 and not var_1_22 then
			local var_2_0 = pg.gameset.battle_consume_energy.key_value * var_1_23

			for iter_2_0, iter_2_1 in ipairs(var_1_4) do
				local var_2_1 = var_1_1:getShipById(iter_2_1)

				if var_2_1 then
					var_2_1:cosumeEnergy(var_2_0)
					var_1_1:updateShip(var_2_1)
				end
			end
		end

		var_1_0:updatePlayer(var_1_18)

		local var_2_2 = {
			prefabFleet = var_1_21,
			stageId = var_1_19,
			system = SYSTEM_SCENARIO,
			token = arg_2_0.key,
			exitCallback = arg_2_0.exitCallback
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_2)
	end

	local function var_1_25(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
		getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.UNKNOWN)
	end

	BeginStageCommand.SendRequest(SYSTEM_SCENARIO, var_1_4, {
		var_1_19
	}, var_1_24, var_1_25)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	if arg_4_1.CheaterVertify() then
		return
	end

	local var_4_0 = pg.battle_cost_template[SYSTEM_SCENARIO]
	local var_4_1 = getProxy(FleetProxy)
	local var_4_2 = getProxy(ChapterProxy)
	local var_4_3 = arg_4_0.statistics._battleScore
	local var_4_4 = 0
	local var_4_5 = 0
	local var_4_6 = {}
	local var_4_7 = var_4_2:getActiveChapter()
	local var_4_8 = var_4_7:getPlayType() == ChapterConst.TypeExtra
	local var_4_9 = var_4_7.fleet
	local var_4_10 = var_4_9:getShips(true)

	for iter_4_0, iter_4_1 in ipairs(var_4_10) do
		table.insert(var_4_6, iter_4_1)
	end

	local var_4_11 = arg_4_0.stageId
	local var_4_12, var_4_13 = var_4_7:getFleetCost(var_4_9, var_4_11)
	local var_4_14 = var_4_13.gold
	local var_4_15 = var_4_13.oil
	local var_4_16 = var_4_7:GetExtraCostRate()

	if arg_4_0.statistics.submarineAid then
		local var_4_17 = var_4_7:GetSubmarineFleet()

		if var_4_17 then
			local var_4_18 = 0

			for iter_4_2, iter_4_3 in ipairs(var_4_17:getShipsByTeam(TeamType.Submarine, true)) do
				if arg_4_0.statistics[iter_4_3.id] then
					table.insert(var_4_6, iter_4_3)

					var_4_18 = var_4_18 + iter_4_3:getEndBattleExpend()
				end
			end

			if var_4_8 then
				var_4_18 = 0
			end

			var_4_15 = var_4_15 + math.min(var_4_18, var_4_7:GetLimitOilCost(true)) * var_4_16
		else
			originalPrint("finish stage error: can not find submarine fleet.")
		end
	end

	local var_4_19 = var_4_3 > ys.Battle.BattleConst.BattleScore.C

	var_4_7:writeBack(var_4_19, arg_4_0)
	var_4_2:updateChapter(var_4_7)

	local var_4_20 = arg_4_1.GeneralPackage(arg_4_0, var_4_6)

	local function var_4_21(arg_5_0)
		arg_4_1.addShipsExp(arg_5_0.ship_exp_list, arg_4_0.statistics, true)

		local var_5_0 = arg_4_1.GenerateCommanderExp(arg_5_0, var_4_2:getActiveChapter().fleet, var_4_7:GetSubmarineFleet())

		arg_4_0.statistics.mvpShipID = arg_5_0.mvp

		local var_5_1, var_5_2 = arg_4_1:GeneralLoot(arg_5_0)

		arg_4_1.GeneralPlayerCosume(SYSTEM_SCENARIO, var_4_19, var_4_15, arg_5_0.player_exp, var_4_8)

		local var_5_3 = {
			system = SYSTEM_SCENARIO,
			statistics = arg_4_0.statistics,
			score = var_4_3,
			drops = var_5_1,
			commanderExps = var_5_0,
			result = arg_5_0.result,
			extraDrops = var_5_2,
			exitCallback = arg_4_0.exitCallback
		}

		var_4_2:updateActiveChapterShips()

		local var_5_4 = var_4_2:getActiveChapter()

		var_5_4:writeDrops(var_5_1)
		var_4_2:updateChapter(var_5_4)

		if PlayerConst.CanDropItem(var_5_1) then
			local var_5_5 = {}

			for iter_5_0, iter_5_1 in ipairs(var_5_1) do
				table.insert(var_5_5, iter_5_1)
			end

			for iter_5_2, iter_5_3 in ipairs(var_5_2) do
				iter_5_3.riraty = true

				table.insert(var_5_5, iter_5_3)
			end

			local var_5_6 = getProxy(ChapterProxy):getActiveChapter(true)

			if var_5_6 then
				if var_5_6:isLoop() then
					getProxy(ChapterProxy):AddExtendChapterDataArray(var_5_6.id, "TotalDrops", var_5_5)
				end

				var_5_6:writeDrops(var_5_5)
			end
		end

		local var_5_7 = var_4_2:getLastUnlockMap().id
		local var_5_8 = var_4_2:getLastUnlockMap().id

		if Map.lastMap and var_5_8 ~= var_5_7 and var_5_7 < var_5_8 then
			Map.autoNextPage = true
		end

		arg_4_1:sendNotification(GAME.CHAPTER_BATTLE_RESULT_REQUEST, {
			callback = function()
				arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_5_3)
			end
		})
	end

	arg_4_1:SendRequest(var_4_20, var_4_21)
end

function var_0_0.GetPreloadList(arg_7_0)
	local var_7_0 = {}
	local var_7_1
	local var_7_2 = getProxy(ChapterProxy)
	local var_7_3 = var_7_2:getActiveChapter()
	local var_7_4 = ys.Battle.BattleResourceManager.GetInstance()
	local var_7_5 = var_7_3.fleet
	local var_7_6 = var_7_5:getShips(false)

	for iter_7_0, iter_7_1 in ipairs(var_7_6) do
		table.insert(var_7_0, iter_7_1)
	end

	local var_7_7, var_7_8 = var_7_3:getFleetBattleBuffs(var_7_5)
	local var_7_9 = var_7_2.GetChapterAuraBuffs(var_7_3)
	local var_7_10 = var_7_2.GetChapterAidBuffs(var_7_3)

	for iter_7_2, iter_7_3 in pairs(var_7_10) do
		for iter_7_4, iter_7_5 in ipairs(iter_7_3) do
			table.insert(var_7_9, iter_7_5)
		end
	end

	local var_7_11, var_7_12 = var_7_2.getSubAidFlag(var_7_3, arg_7_0.stageId)

	if var_7_11 == true or var_7_11 > 0 then
		local var_7_13 = var_7_12:getShipsByTeam(TeamType.Submarine, false)

		for iter_7_6, iter_7_7 in ipairs(var_7_13) do
			table.insert(var_7_0, iter_7_7)
		end

		local var_7_14, var_7_15 = var_7_3:getFleetBattleBuffs(var_7_12)

		for iter_7_8, iter_7_9 in ipairs(var_7_14) do
			table.insert(var_7_7, iter_7_9)
		end

		for iter_7_10, iter_7_11 in ipairs(var_7_15) do
			table.insert(var_7_8, iter_7_11)
		end
	end

	local var_7_16, var_7_17 = var_7_4.GetPlayerShipResource(var_7_0, arg_7_0.system)
	local var_7_18 = var_7_4.GetCommanderBuffRes(var_7_8)

	for iter_7_12, iter_7_13 in ipairs(var_7_18) do
		table.insert(var_7_16, iter_7_13)
	end

	local var_7_19 = var_7_4.GetResFromBuffIDList(var_7_7)

	for iter_7_14, iter_7_15 in ipairs(var_7_19) do
		table.insert(var_7_16, iter_7_15)
	end

	local var_7_20 = var_7_4.GetResFromBuffList(var_7_9)

	for iter_7_16, iter_7_17 in ipairs(var_7_20) do
		table.insert(var_7_16, iter_7_17)
	end

	return var_7_16, var_7_17
end

return var_0_0

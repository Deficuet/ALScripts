local var_0_0 = class("BattleGateWorld")

ys.Battle.BattleGateWorld = var_0_0
var_0_0.__name = "BattleGateWorld"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = nowWorld()

	if BeginStageCommand.DockOverload() then
		var_1_0:TriggerAutoFight(false)

		return
	end

	local var_1_1 = getProxy(PlayerProxy)
	local var_1_2 = getProxy(BayProxy)
	local var_1_3 = pg.battle_cost_template[SYSTEM_WORLD]
	local var_1_4 = var_1_3.oil_cost > 0
	local var_1_5 = {}
	local var_1_6 = 0
	local var_1_7 = 0
	local var_1_8 = 0
	local var_1_9 = 0
	local var_1_10 = var_1_0:GetActiveMap():GetFleet()
	local var_1_11 = var_1_10:GetShipVOs(false)

	for iter_1_0, iter_1_1 in ipairs(var_1_11) do
		var_1_5[#var_1_5 + 1] = iter_1_1.id
	end

	local var_1_12, var_1_13 = var_1_10:GetCost()
	local var_1_14 = var_1_12.gold
	local var_1_15 = var_1_12.oil
	local var_1_16 = var_1_12.gold + var_1_13.gold
	local var_1_17 = var_1_12.oil + var_1_13.oil
	local var_1_18 = var_1_1:getData()

	if var_1_4 and var_1_17 > var_1_18.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	local var_1_19 = arg_1_0.stageId
	local var_1_20 = pg.expedition_data_template[var_1_19].dungeon_id
	local var_1_21 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_20).fleet_prefab
	local var_1_22 = arg_1_0.hpRate

	arg_1_1.ShipVertify()

	local function var_1_23(arg_2_0)
		if var_1_4 then
			var_1_18:consume({
				gold = 0,
				oil = var_1_15
			})
		end

		if var_1_3.enter_energy_cost > 0 and not exFlag then
			local var_2_0 = pg.gameset.battle_consume_energy.key_value

			for iter_2_0, iter_2_1 in ipairs(var_1_11) do
				iter_2_1:cosumeEnergy(var_2_0)
				var_1_2:updateShip(iter_2_1)
			end
		end

		var_1_1:updatePlayer(var_1_18)

		local var_2_1 = {
			prefabFleet = var_1_21,
			stageId = var_1_19,
			system = SYSTEM_WORLD,
			token = arg_2_0.key,
			hpRate = var_1_22
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_1)
	end

	local function var_1_24(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
	end

	BeginStageCommand.SendRequest(SYSTEM_WORLD, var_1_5, {
		var_1_19
	}, var_1_23, var_1_24)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	if arg_4_1.CheaterVertify() then
		return
	end

	local var_4_0 = pg.battle_cost_template[SYSTEM_WORLD]
	local var_4_1 = arg_4_0.statistics._battleScore
	local var_4_2 = 0
	local var_4_3 = {}
	local var_4_4 = nowWorld():GetActiveMap()
	local var_4_5 = var_4_4:GetFleet()
	local var_4_6 = var_4_5:GetShipVOs(true)
	local var_4_7, var_4_8 = var_4_5:GetCost()
	local var_4_9 = var_4_8.oil

	if arg_4_0.statistics.submarineAid then
		local var_4_10 = var_4_4:GetSubmarineFleet()

		assert(var_4_10, "submarine fleet not exist.")

		local var_4_11 = var_4_10:GetTeamShipVOs(TeamType.Submarine, true)

		for iter_4_0, iter_4_1 in ipairs(var_4_11) do
			if arg_4_0.statistics[iter_4_1.id] then
				table.insert(var_4_6, iter_4_1)
			end
		end

		local var_4_12, var_4_13 = var_4_10:GetCost()

		var_4_9 = var_4_9 + var_4_13.oil
	end

	local var_4_14 = arg_4_1.GeneralPackage(arg_4_0, var_4_6)

	local function var_4_15(arg_5_0)
		arg_4_1.addShipsExp(arg_5_0.ship_exp_list, arg_4_0.statistics, true)

		local var_5_0 = arg_4_1.GenerateCommanderExp(arg_5_0, var_4_5, var_4_4:GetSubmarineFleet())

		arg_4_0.statistics.mvpShipID = arg_5_0.mvp

		local var_5_1, var_5_2 = arg_4_1:GeneralLoot(arg_5_0)
		local var_5_3 = var_4_1 > ys.Battle.BattleConst.BattleScore.C

		arg_4_1.GeneralPlayerCosume(SYSTEM_WORLD, var_5_3, var_4_9, arg_5_0.player_exp, exFlag)

		arg_4_0.hpDropInfo = arg_5_0.hp_drop_info

		local var_5_4 = {
			system = SYSTEM_WORLD,
			statistics = arg_4_0.statistics,
			score = var_4_1,
			drops = var_5_1,
			commanderExps = var_5_0,
			result = arg_5_0.result,
			extraDrops = var_5_2
		}

		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_5_4)
		var_4_4:WriteBack(var_5_3, arg_4_0)
	end

	arg_4_1:SendRequest(var_4_14, var_4_15)
end

function var_0_0.GetPreloadList(arg_6_0)
	local var_6_0 = {}
	local var_6_1
	local var_6_2 = ys.Battle.BattleResourceManager.GetInstance()
	local var_6_3 = nowWorld()
	local var_6_4 = var_6_3:GetActiveMap()
	local var_6_5 = var_6_4:GetFleet()

	for iter_6_0, iter_6_1 in ipairs(var_6_5:GetShipVOs(true)) do
		table.insert(var_6_0, iter_6_1)
	end

	local var_6_6, var_6_7 = var_6_4:getFleetBattleBuffs(var_6_5)

	if var_6_3:GetSubAidFlag() == true then
		local var_6_8 = var_6_4:GetSubmarineFleet()
		local var_6_9 = var_6_8:GetTeamShipVOs(TeamType.Submarine, false)

		for iter_6_2, iter_6_3 in ipairs(var_6_9) do
			table.insert(var_6_0, iter_6_3)
		end

		local var_6_10, var_6_11 = var_6_4:getFleetBattleBuffs(var_6_8)

		for iter_6_4, iter_6_5 in ipairs(var_6_10) do
			table.insert(var_6_6, iter_6_5)
		end

		for iter_6_6, iter_6_7 in ipairs(var_6_11) do
			table.insert(var_6_7, iter_6_7)
		end
	end

	local var_6_12, var_6_13 = var_6_2.GetPlayerShipResource(var_6_0, arg_6_0.system)
	local var_6_14 = var_6_4:GetChapterAuraBuffs()
	local var_6_15 = var_6_4:GetChapterAidBuffs()

	for iter_6_8, iter_6_9 in pairs(var_6_15) do
		for iter_6_10, iter_6_11 in ipairs(iter_6_9) do
			table.insert(var_6_14, iter_6_11)
		end
	end

	local var_6_16 = var_6_2.GetResFromBuffList(var_6_14)

	for iter_6_12, iter_6_13 in ipairs(var_6_16) do
		table.insert(var_6_12, iter_6_13)
	end

	local var_6_17 = var_6_4:GetCell(var_6_5.row, var_6_5.column):GetStageEnemy()
	local var_6_18 = table.mergeArray(var_6_17:GetBattleLuaBuffs(), var_6_4:GetBattleLuaBuffs(WorldMap.FactionEnemy, var_6_17))

	for iter_6_14, iter_6_15 in ipairs(var_6_18) do
		table.insert(var_6_6, iter_6_15)
	end

	local var_6_19 = var_6_2.GetResFromBuffIDList(var_6_6)

	for iter_6_16, iter_6_17 in ipairs(var_6_19) do
		table.insert(var_6_12, iter_6_17)
	end

	local var_6_20 = var_6_2.GetCommanderBuffRes(var_6_7)

	for iter_6_18, iter_6_19 in ipairs(var_6_20) do
		table.insert(var_6_12, iter_6_19)
	end

	return var_6_12, var_6_13
end

return var_0_0

local var_0_0 = class("BattleGateGuild")

ys.Battle.BattleGateGuild = var_0_0
var_0_0.__name = "BattleGateGuild"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = pg.guildset.use_oil.key_value
	local var_1_1 = getProxy(PlayerProxy):getRawData()

	if var_1_0 > var_1_1.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	local var_1_2 = var_0_0.GetGuildBossMission()
	local var_1_3 = var_1_2:GetMyShipIds()
	local var_1_4 = var_1_2:GetShipsSplitByUserID()
	local var_1_5 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_4) do
		table.insert(var_1_5, {
			ship_id = iter_1_1.shipID,
			user_id = iter_1_1.userID
		})
	end

	local var_1_6 = var_1_2:GetStageID()

	local function var_1_7(arg_2_0)
		local var_2_0 = {
			prefabFleet = {},
			bossId = var_1_2.id,
			actId = var_1_2.id,
			stageId = var_1_6,
			system = SYSTEM_GUILD,
			token = arg_2_0.key
		}
		local var_2_1 = getProxy(GuildProxy)
		local var_2_2 = var_2_1:getData()
		local var_2_3 = pg.guildset.operation_boss_guild_active.key_value

		var_2_2:getMemberById(var_1_1.id):AddLiveness(var_2_3)
		var_2_1:updateGuild(var_2_2)
		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_0)
	end

	local function var_1_8(arg_3_0)
		arg_1_1:RequestFailStandardProcess(arg_3_0)
	end

	BeginStageCommand.SendRequest(SYSTEM_GUILD, var_1_3, {
		var_1_6
	}, var_1_7, var_1_8, var_1_5)
end

function var_0_0.Exit(arg_4_0, arg_4_1)
	local var_4_0 = getProxy(FleetProxy)
	local var_4_1 = arg_4_0.statistics._battleScore
	local var_4_2 = pg.guildset.use_oil.key_value
	local var_4_3 = {}
	local var_4_4 = var_0_0.GetGuildBossMission()
	local var_4_5 = var_4_4:GetMainFleet()
	local var_4_6 = {}

	for iter_4_0, iter_4_1 in pairs(var_4_5:getCommanders()) do
		table.insert(var_4_6, iter_4_1.id)
	end

	local var_4_7 = var_4_5:GetShips()

	for iter_4_2, iter_4_3 in ipairs(var_4_7) do
		table.insert(var_4_3, iter_4_3.ship)
	end

	if arg_4_0.statistics.submarineAid then
		local var_4_8 = var_4_4:GetSubFleet()

		if var_4_8 then
			local var_4_9 = var_4_8:GetShips()

			for iter_4_4, iter_4_5 in ipairs(var_4_9) do
				local var_4_10 = iter_4_5.ship

				if arg_4_0.statistics[var_4_10.id] then
					table.insert(var_4_3, var_4_10)
				end
			end

			for iter_4_6, iter_4_7 in pairs(var_4_8:getCommanders()) do
				table.insert(var_4_6, iter_4_7.id)
			end
		else
			originalPrint("finish stage error: can not find submarin fleet.")
		end
	end

	local var_4_11 = 0
	local var_4_12 = 0

	for iter_4_8, iter_4_9 in ipairs(var_4_3) do
		local var_4_13 = arg_4_0.statistics[iter_4_9.id]

		if var_4_11 < var_4_13.output then
			var_4_12 = iter_4_9.id
			var_4_11 = var_4_13.output
		end
	end

	local var_4_14 = var_0_0.GeneralPackage(arg_4_0, var_4_3)

	var_4_14.commander_id_list = var_4_6

	local function var_4_15(arg_5_0)
		arg_4_0.statistics.mvpShipID = var_4_12

		local var_5_0, var_5_1 = arg_4_1:GeneralLoot(arg_5_0)
		local var_5_2 = var_4_1 > ys.Battle.BattleConst.BattleScore.C
		local var_5_3 = arg_4_1.GenerateCommanderExp(arg_5_0, var_4_5, var_4_4:GetSubFleet())

		var_0_0.GeneralPlayerCosume(SYSTEM_GUILD, var_5_2, var_4_2, arg_5_0.player_exp, exFlag)

		local var_5_4 = {
			system = SYSTEM_GUILD,
			statistics = arg_4_0.statistics,
			score = var_4_1,
			drops = var_5_0,
			commanderExps = var_5_3,
			result = arg_5_0.result,
			extraDrops = var_5_1
		}

		var_0_0.UpdateGuildBossMission()
		arg_4_1:sendNotification(GAME.FINISH_STAGE_DONE, var_5_4)
	end

	var_0_0.SendRequest(arg_4_1, var_4_14, var_4_15)
end

function var_0_0.SendRequest(arg_6_0, arg_6_1, arg_6_2)
	pg.ConnectionMgr.GetInstance():Send(40003, arg_6_1, 40004, function(arg_7_0)
		if arg_7_0.result == 0 or arg_7_0.result == 1030 then
			arg_6_2(arg_7_0)
		elseif arg_7_0.result == 20 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("guild_battle_result_boss_is_death"),
				onYes = function()
					pg.m02:sendNotification(GAME.QUIT_BATTLE)
				end
			})
		elseif arg_7_0.result == 4 then
			pg.m02:sendNotification(GAME.QUIT_BATTLE)
		else
			arg_6_0:RequestFailStandardProcess(arg_7_0)
		end
	end)
end

function var_0_0.GetGuildBossMission()
	local var_9_0 = getProxy(GuildProxy):getData():GetActiveEvent()

	assert(var_9_0)

	local var_9_1 = var_9_0:GetBossMission()

	assert(var_9_1)

	return var_9_1
end

function var_0_0.UpdateGuildBossMission()
	local var_10_0 = getProxy(GuildProxy)
	local var_10_1 = var_10_0:getData()
	local var_10_2 = var_10_1:GetActiveEvent()

	assert(var_10_2)

	local var_10_3 = var_10_2:GetBossMission()

	assert(var_10_3)
	var_10_3:ReduceDailyCnt()
	var_10_0:ResetBossRankTime()
	var_10_0:ResetRefreshBossTime()
	var_10_0:updateGuild(var_10_1)
end

function var_0_0.GeneralPlayerCosume(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = getProxy(PlayerProxy)
	local var_11_1 = var_11_0:getData()

	var_11_1:addExp(arg_11_3)
	var_11_1:consume({
		gold = 0,
		oil = arg_11_2
	})
	var_11_0:updatePlayer(var_11_1)
end

function var_0_0.GeneralPackage(arg_12_0, arg_12_1)
	local var_12_0 = 0
	local var_12_1 = {}
	local var_12_2 = {}
	local var_12_3 = arg_12_0.system
	local var_12_4 = arg_12_0.stageId
	local var_12_5 = arg_12_0.statistics._battleScore
	local var_12_6 = var_12_3 + var_12_4 + var_12_5
	local var_12_7 = getProxy(PlayerProxy):getRawData().id

	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		local var_12_8 = arg_12_0.statistics[iter_12_1.id]

		if var_12_8 then
			local var_12_9 = GuildAssaultFleet.GetRealId(var_12_8.id)
			local var_12_10 = GuildAssaultFleet.GetUserId(var_12_8.id)
			local var_12_11 = math.floor(var_12_8.bp)
			local var_12_12 = math.floor(var_12_8.output)
			local var_12_13 = math.max(0, math.floor(var_12_8.damage))
			local var_12_14 = math.floor(var_12_8.maxDamageOnce)
			local var_12_15 = math.floor(var_12_8.gearScore)
			local var_12_16 = var_12_10 ~= var_12_7 and var_12_2 or var_12_1

			table.insert(var_12_16, {
				ship_id = var_12_9,
				hp_rest = var_12_11,
				damage_cause = var_12_12,
				damage_caused = var_12_13,
				max_damage_once = var_12_14,
				ship_gear_score = var_12_15
			})

			var_12_6 = var_12_6 + var_12_9 + var_12_11 + var_12_12 + var_12_14
			var_12_0 = var_12_0 + iter_12_1:getShipCombatPower()
		end
	end

	local var_12_17, var_12_18 = GetBattleCheckResult(var_12_6, arg_12_0.token, arg_12_0.statistics._totalTime)
	local var_12_19 = {}

	for iter_12_2, iter_12_3 in ipairs(arg_12_0.statistics._enemyInfoList) do
		table.insert(var_12_19, {
			enemy_id = iter_12_3.id,
			damage_taken = iter_12_3.damage,
			total_hp = iter_12_3.totalHp
		})
	end

	local var_12_20 = math.fmod(arg_12_0.statistics._autoCount, 2)
	local var_12_21 = math.fmod(var_12_20 + arg_12_0.statistics._autoInit, 2)

	return {
		system = var_12_3,
		data = var_12_4,
		score = var_12_5,
		key = var_12_17,
		statistics = var_12_1,
		otherstatistics = var_12_2,
		kill_id_list = arg_12_0.statistics.kill_id_list,
		total_time = arg_12_0.statistics._totalTime,
		bot_percentage = arg_12_0.statistics._botPercentage,
		extra_param = var_12_0,
		file_check = var_12_18,
		enemy_info = var_12_19,
		data2 = {},
		auto_before = arg_12_0.statistics._autoInit,
		auto_switch_time = arg_12_0.statistics._autoCount,
		auto_after = var_12_21
	}
end

function var_0_0.GetPreloadList(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = {}
	local var_13_2
	local var_13_3 = ys.Battle.BattleResourceManager.GetInstance()
	local var_13_4 = getProxy(GuildProxy):getRawData():GetActiveEvent():GetBossMission()
	local var_13_5 = var_13_4:GetMainFleet()
	local var_13_6 = var_13_5:GetShips()

	for iter_13_0, iter_13_1 in ipairs(var_13_6) do
		if iter_13_1 and iter_13_1.ship then
			table.insert(var_13_0, iter_13_1.ship)
		end
	end

	local var_13_7 = var_13_5:buildBattleBuffList()
	local var_13_8 = var_13_4:GetSubFleet()
	local var_13_9 = var_13_8:GetShips()

	for iter_13_2, iter_13_3 in ipairs(var_13_9) do
		if iter_13_3 and iter_13_3.ship then
			table.insert(var_13_0, iter_13_3.ship)
		end
	end

	local var_13_10 = var_13_8:BuildBattleBuffList()

	for iter_13_4, iter_13_5 in ipairs(var_13_10) do
		table.insert(var_13_7, iter_13_5)
	end

	local var_13_11, var_13_12 = var_13_3.GetPlayerShipResource(var_13_0, arg_13_0.system)
	local var_13_13 = var_13_3.GetCommanderBuffRes(var_13_7)

	for iter_13_6, iter_13_7 in ipairs(var_13_13) do
		table.insert(var_13_11, iter_13_7)
	end
end

return var_0_0

local var_0_0 = class("BattleGateWorldBoss")

ys.Battle.BattleGateWorldBoss = var_0_0
var_0_0.__name = "BattleGateWorldBoss"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	if BeginStageCommand.DockOverload() then
		return
	end

	local var_1_0 = arg_1_0.actId
	local var_1_1 = getProxy(PlayerProxy)
	local var_1_2 = getProxy(BayProxy)
	local var_1_3 = pg.battle_cost_template[SYSTEM_WORLD_BOSS]
	local var_1_4 = true
	local var_1_5 = {}
	local var_1_6 = 0
	local var_1_7 = 0
	local var_1_8 = nowWorld()
	local var_1_9 = var_1_8:GetBossProxy():GetFleet(arg_1_0.bossId)
	local var_1_10 = var_1_9.ships

	for iter_1_0, iter_1_1 in ipairs(var_1_10) do
		var_1_5[#var_1_5 + 1] = iter_1_1
	end

	local var_1_11 = var_1_2:getSortShipsByFleet(var_1_9)
	local var_1_12 = var_1_1:getData()
	local var_1_13 = arg_1_0.bossId
	local var_1_14 = arg_1_0.hpRate
	local var_1_15 = var_1_8:GetBossProxy()
	local var_1_16 = var_1_15:GetBossById(var_1_13)
	local var_1_17 = var_1_16:GetStageID()

	if var_1_15:IsSelfBoss(var_1_16) and var_1_16:GetSelfFightCnt() > 0 then
		var_1_7 = var_1_16:GetOilConsume()
	end

	if var_1_4 and var_1_7 > var_1_12.oil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("stage_beginStage_error_noResource"))

		return
	end

	arg_1_1.ShipVertify()

	local function var_1_18(arg_2_0)
		if var_1_4 then
			var_1_12:consume({
				gold = 0,
				oil = var_1_7
			})
		end

		if var_1_3.enter_energy_cost > 0 then
			local var_2_0 = pg.gameset.battle_consume_energy.key_value

			for iter_2_0, iter_2_1 in ipairs(var_1_11) do
				iter_2_1:cosumeEnergy(var_2_0)
				var_1_2:updateShip(iter_2_1)
			end
		end

		if var_1_15:IsSelfBoss(var_1_16) then
			var_1_16:IncreaseFightCnt()
		else
			if WorldBossConst._IsCurrBoss(var_1_16) then
				var_1_15:reducePt()
			end

			var_1_15:LockCacheBoss(var_1_13)
		end

		var_1_1:updatePlayer(var_1_12)

		local var_2_1 = {
			prefabFleet = {},
			bossId = var_1_13,
			actId = var_1_0,
			stageId = var_1_17,
			system = SYSTEM_WORLD_BOSS,
			token = arg_2_0.key,
			bossLevel = var_1_16:GetLevel(),
			bossConfigId = var_1_16:GetConfigID(),
			hpRate = var_1_14
		}

		arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_2_1)
	end

	local function var_1_19(arg_3_0)
		local function var_3_0()
			var_1_15:UnlockCacheBoss()
			var_1_15:RemoveCacheBoss(var_1_16.id)
			pg.m02:sendNotification(GAME.WORLD_BOSS_START_BATTLE_FIALED)
		end

		if arg_3_0.result == 1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_none"))
			var_3_0()
		elseif arg_3_0.result == 3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_none"))
			var_3_0()
		elseif arg_3_0.result == 6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_max_challenge_cnt"))
			var_3_0()
		elseif arg_3_0.result == 20 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_none"))
			var_3_0()
		elseif arg_3_0.result == 9997 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_boss_maintenance"))
			var_3_0()
		else
			arg_1_1:RequestFailStandardProcess(arg_3_0)
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.result)
		end
	end

	BeginStageCommand.SendRequest(SYSTEM_WORLD_BOSS, var_1_5, {
		var_1_13
	}, var_1_18, var_1_19)
end

function var_0_0.Exit(arg_5_0, arg_5_1)
	if arg_5_1.CheaterVertify() then
		return
	end

	local var_5_0 = pg.battle_cost_template[SYSTEM_WORLD_BOSS]
	local var_5_1 = arg_5_0.statistics._battleScore
	local var_5_2 = {}
	local var_5_3 = nowWorld():GetBossProxy():GetFleet(arg_5_0.bossId)
	local var_5_4 = getProxy(BayProxy):getSortShipsByFleet(var_5_3)
	local var_5_5 = arg_5_1.GeneralPackage(arg_5_0, var_5_4)
	local var_5_6 = 0
	local var_5_7 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.statistics._enemyInfoList) do
		table.insert(var_5_7, {
			enemy_id = iter_5_1.id,
			damage_taken = iter_5_1.damage,
			total_hp = iter_5_1.totalHp
		})

		if var_5_6 < iter_5_1.damage then
			var_5_6 = iter_5_1.damage
		end
	end

	var_5_5.enemy_info = var_5_7

	local function var_5_8(arg_6_0)
		local var_6_0, var_6_1 = arg_5_1:GeneralLoot(arg_6_0)

		arg_5_1.addShipsExp(arg_6_0.ship_exp_list, arg_5_0.statistics, accumulate)

		local var_6_2 = nowWorld():GetBossProxy()
		local var_6_3 = var_6_2:GetBossById(arg_5_0.bossId)
		local var_6_4 = var_6_3:GetName()

		var_6_2:ClearRank(var_6_3.id)
		var_6_2:UpdateHighestDamage(var_5_6)

		arg_5_0.statistics.mvpShipID = arg_6_0.mvp

		local var_6_5 = {
			system = SYSTEM_WORLD_BOSS,
			statistics = arg_5_0.statistics,
			score = var_5_1,
			drops = var_6_0,
			commanderExps = {},
			result = arg_6_0.result,
			extraDrops = var_6_1,
			bossId = arg_5_0.bossId,
			name = var_6_4
		}

		arg_5_1:sendNotification(GAME.FINISH_STAGE_DONE, var_6_5)
		var_6_2:UnlockCacheBoss()
	end

	arg_5_1:SendRequest(var_5_5, var_5_8)
end

function var_0_0.GetPreloadList(arg_7_0)
	local var_7_0 = {}
	local var_7_1
	local var_7_2 = ys.Battle.BattleResourceManager.GetInstance()
	local var_7_3 = nowWorld():GetBossProxy()
	local var_7_4 = var_7_3:GetFleet(arg_7_0.bossId)
	local var_7_5 = getProxy(BayProxy):getSortShipsByFleet(var_7_4)

	for iter_7_0, iter_7_1 in ipairs(var_7_5) do
		table.insert(var_7_0, iter_7_1)
	end

	local var_7_6, var_7_7 = var_7_2.GetPlayerShipResource(var_7_0, arg_7_0.system)
	local var_7_8 = var_7_3:GetBossById(arg_7_0.bossId)

	if var_7_8 and var_7_8:IsSelf() then
		local var_7_9, var_7_10, var_7_11 = var_7_3.GetSupportValue()

		if var_7_9 then
			local var_7_12 = var_7_2.GetResFromBuffIDList({
				var_7_11
			})

			for iter_7_2, iter_7_3 in ipairs(var_7_12) do
				table.insert(var_7_6, iter_7_3)
			end
		end
	end

	return var_7_6, var_7_7
end

return var_0_0

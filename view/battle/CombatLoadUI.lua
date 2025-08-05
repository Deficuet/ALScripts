local var_0_0 = class("CombatLoadUI", import("..base.BaseUI"))

var_0_0._loadObs = nil
var_0_0.LOADING_ANIMA_DISTANCE = 1820

function var_0_0.getUIName(arg_1_0)
	return "CombatLoadUI"
end

function var_0_0.init(arg_2_0)
	local var_2_0 = arg_2_0:findTF("loading")

	arg_2_0._loadingProgress = var_2_0:Find("loading_bar"):GetComponent(typeof(Slider))
	arg_2_0._loadingProgress.value = 0
	arg_2_0._loadingText = var_2_0:Find("loading_label/percent"):GetComponent(typeof(Text))
	arg_2_0._loadingAnima = var_2_0:Find("loading_anima")
	arg_2_0._loadingAnimaPosY = arg_2_0._loadingAnima.anchoredPosition.y
	arg_2_0._finishAnima = var_2_0:Find("done_anima")

	SetActive(arg_2_0._loadingAnima, true)
	SetActive(arg_2_0._finishAnima, false)
	arg_2_0._finishAnima:GetComponent("DftAniEvent"):SetEndEvent(function(arg_3_0)
		arg_2_0:emit(CombatLoadMediator.FINISH, arg_2_0._loadObs)
	end)

	local var_2_1 = arg_2_0._tf:Find("bg")
	local var_2_2 = arg_2_0._tf:Find("bg2")
	local var_2_3 = PlayerPrefs.GetInt("bgFitMode", 0)
	local var_2_4 = var_2_3 == 1 and var_2_2 or var_2_1

	SetActive(var_2_1, var_2_3 ~= 1)
	SetActive(var_2_2, var_2_3 == 1)

	local var_2_5 = (LOADING_HX and PlayerProxy.GetDeviceMaxPlayerLevel() <= pg.gameset.LOADING_HX_LV.key_value and "loadingbg_hx/bg_" or "loadingbg/bg_") .. math.random(1, BG_RANDOM_RANGE)

	setImageSprite(var_2_4, LoadSprite(var_2_5))

	arg_2_0._tipsText = var_2_0:Find("tipsText"):GetComponent(typeof(Text))
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:Preload()
end

function var_0_0.onBackPressed(arg_5_0)
	return
end

function var_0_0.Preload(arg_6_0)
	PoolMgr.GetInstance():DestroyAllSprite()

	arg_6_0._loadObs = {}
	arg_6_0._toLoad = {}

	ys.Battle.BattleFXPool.GetInstance():Init()

	local var_6_0 = ys.Battle.BattleResourceManager.GetInstance()

	var_6_0:Init()

	local var_6_1 = getProxy(BayProxy)

	if arg_6_0.contextData.system == SYSTEM_DEBUG then
		local var_6_2 = {}
		local var_6_3 = getProxy(FleetProxy)
		local var_6_4 = var_6_3:getFleetById(arg_6_0.contextData.mainFleetId)

		assert(var_6_4)

		local var_6_5 = var_6_1:getShipsByFleet(var_6_4)

		for iter_6_0, iter_6_1 in ipairs(var_6_5) do
			var_6_2[iter_6_1.configId] = iter_6_1
		end

		local var_6_6 = var_6_3:getFleetById(11)

		assert(var_6_6)

		local var_6_7 = var_6_6:getTeamByName(TeamType.Submarine)

		for iter_6_2, iter_6_3 in ipairs(var_6_7) do
			local var_6_8 = var_6_1:getShipById(iter_6_3)

			var_6_2[var_6_8.configId] = var_6_8
		end

		var_0_0.addCommanderBuffRes(var_6_6:buildBattleBuffList())

		for iter_6_4, iter_6_5 in pairs(var_6_2) do
			if type(iter_6_4) == "number" then
				var_6_0:AddPreloadCV(iter_6_5.skinId)
				var_6_0:AddPreloadResource(var_6_0.GetShipResource(iter_6_4, iter_6_5.skinId, true))

				local var_6_9 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(iter_6_4)

				for iter_6_6, iter_6_7 in ipairs(iter_6_5:getActiveEquipments()) do
					local var_6_10
					local var_6_11
					local var_6_12 = 0

					if not iter_6_7 then
						var_6_10 = var_6_9.default_equip_list[iter_6_6]
					else
						var_6_10 = iter_6_7.configId
						var_6_12 = iter_6_7.skinId
					end

					if var_6_10 then
						local var_6_13 = ys.Battle.BattleDataFunction.GetWeaponDataFromID(var_6_10).weapon_id

						if #var_6_13 > 0 then
							for iter_6_8, iter_6_9 in ipairs(var_6_13) do
								var_6_0:AddPreloadResource(var_6_0.GetWeaponResource(iter_6_9, var_6_12))
							end
						else
							var_6_0:AddPreloadResource(var_6_0.GetEquipResource(var_6_10, var_6_12, arg_6_0.contextData.system))
						end
					end
				end

				for iter_6_10, iter_6_11 in ipairs(var_6_9.depth_charge_list) do
					local var_6_14 = ys.Battle.BattleDataFunction.GetWeaponDataFromID(iter_6_11).weapon_id

					for iter_6_12, iter_6_13 in ipairs(var_6_14) do
						var_6_0:AddPreloadResource(var_6_0.GetWeaponResource(iter_6_13))
					end
				end

				for iter_6_14, iter_6_15 in ipairs(var_6_9.fix_equip_list) do
					local var_6_15 = ys.Battle.BattleDataFunction.GetWeaponDataFromID(iter_6_15).weapon_id

					for iter_6_16, iter_6_17 in ipairs(var_6_15) do
						var_6_0:AddPreloadResource(var_6_0.GetWeaponResource(iter_6_17))
					end
				end

				local var_6_16 = iter_6_5.GetSpWeapon and iter_6_5:GetSpWeapon()

				if var_6_16 then
					var_6_0:AddPreloadResource(var_6_0.GetSpWeaponResource(var_6_16:GetConfigID(), arg_6_0.contextData.system))
				end

				local var_6_17 = ys.Battle.BattleDataFunction.GetBuffBulletRes(iter_6_4, iter_6_5.skills, arg_6_0.contextData.system, iter_6_5.skinId)

				for iter_6_18, iter_6_19 in pairs(var_6_17) do
					var_6_0:AddPreloadResource(iter_6_19)
				end
			end
		end

		if BATTLE_DEBUG_CUSTOM_WEAPON then
			for iter_6_20, iter_6_21 in pairs(ys.Battle.BattleUnitDetailView.BulletForger) do
				local var_6_18 = "触发自定义子弹替换>>>" .. iter_6_20 .. "<<<，检查是否测试需要，否则联系程序"

				pg.TipsMgr.GetInstance():ShowTips(var_6_18)

				pg.bullet_template[iter_6_20] = iter_6_21
			end

			for iter_6_22, iter_6_23 in pairs(ys.Battle.BattleUnitDetailView.BarrageForger) do
				local var_6_19 = "触发自定义弹幕替换>>>" .. iter_6_22 .. "<<<，检查是否测试需要，否则联系程序"

				pg.TipsMgr.GetInstance():ShowTips(var_6_19)

				pg.barrage_template[iter_6_22] = iter_6_23
			end

			for iter_6_24, iter_6_25 in pairs(ys.Battle.BattleUnitDetailView.AircraftForger) do
				local var_6_20 = "触发自定义飞机替换>>>" .. iter_6_24 .. "<<<，检查是否测试需要，否则联系程序"

				pg.TipsMgr.GetInstance():ShowTips(var_6_20)

				pg.aircraft_template[iter_6_24] = iter_6_25
			end

			for iter_6_26, iter_6_27 in pairs(ys.Battle.BattleUnitDetailView.WeaponForger) do
				local var_6_21 = "触发自定义武器替换>>>" .. iter_6_26 .. "<<<，检查是否测试需要，否则联系程序"

				pg.TipsMgr.GetInstance():ShowTips(var_6_21)

				pg.weapon_property[iter_6_26] = iter_6_27

				local var_6_22 = var_6_0.GetWeaponResource(iter_6_26)

				for iter_6_28, iter_6_29 in ipairs(var_6_22) do
					var_6_0:AddPreloadResource(iter_6_29)
				end
			end
		end

		var_6_0:AddPreloadResource(var_6_0.GetAircraftResource(30001, {}))
	else
		local var_6_23 = {}
		local var_6_24 = {}

		if arg_6_0.contextData.system == SYSTEM_SCENARIO then
			local var_6_25 = getProxy(ChapterProxy)
			local var_6_26 = var_6_25:getActiveChapter()
			local var_6_27 = var_6_26.fleet
			local var_6_28 = var_6_27:getShips(false)

			for iter_6_30, iter_6_31 in ipairs(var_6_28) do
				table.insert(var_6_23, iter_6_31)
			end

			local var_6_29, var_6_30 = var_6_26:getFleetBattleBuffs(var_6_27)

			var_0_0.addCommanderBuffRes(var_6_30)
			var_0_0.addChapterBuffRes(var_6_29)

			local var_6_31 = var_6_25.GetChapterAuraBuffs(var_6_26)

			var_0_0.addChapterAuraRes(var_6_31)

			local var_6_32 = var_6_25.GetChapterAidBuffs(var_6_26)
			local var_6_33 = {}

			for iter_6_32, iter_6_33 in pairs(var_6_32) do
				for iter_6_34, iter_6_35 in ipairs(iter_6_33) do
					table.insert(var_6_33, iter_6_35)
				end
			end

			var_0_0.addChapterAuraRes(var_6_33)

			local var_6_34, var_6_35 = var_6_25.getSubAidFlag(var_6_26, arg_6_0.contextData.stageId)

			if var_6_34 == true or var_6_34 > 0 then
				local var_6_36 = var_6_35:getShipsByTeam(TeamType.Submarine, false)

				for iter_6_36, iter_6_37 in ipairs(var_6_36) do
					table.insert(var_6_23, iter_6_37)
				end

				local var_6_37, var_6_38 = var_6_26:getFleetBattleBuffs(var_6_35)

				var_0_0.addCommanderBuffRes(var_6_38)
				var_0_0.addChapterBuffRes(var_6_37)
			end
		elseif arg_6_0.contextData.system == SYSTEM_HP_SHARE_ACT_BOSS or arg_6_0.contextData.system == SYSTEM_ACT_BOSS or arg_6_0.contextData.system == SYSTEM_ACT_BOSS_SP or arg_6_0.contextData.system == SYSTEM_BOSS_EXPERIMENT or arg_6_0.contextData.system == SYSTEM_BOSS_SINGLE or arg_6_0.contextData.system == SYSTEM_BOSS_SINGLE_VARIABLE then
			local var_6_39 = getProxy(FleetProxy):getActivityFleets()[arg_6_0.contextData.actId]
			local var_6_40 = var_6_39[arg_6_0.contextData.mainFleetId]

			if var_6_40 then
				local var_6_41 = var_6_40.ships

				for iter_6_38, iter_6_39 in ipairs(var_6_41) do
					table.insert(var_6_23, var_6_1:getShipById(iter_6_39))
				end

				var_0_0.addCommanderBuffRes(var_6_40:buildBattleBuffList())
			end

			local var_6_42 = arg_6_0.contextData.system == SYSTEM_BOSS_SINGLE_VARIABLE and Fleet.MEGA_SUBMARINE_FLEET_OFFSET or 10
			local var_6_43 = var_6_39[arg_6_0.contextData.mainFleetId + var_6_42]

			if var_6_43 then
				local var_6_44 = var_6_43:getTeamByName(TeamType.Submarine)

				for iter_6_40, iter_6_41 in ipairs(var_6_44) do
					table.insert(var_6_23, var_6_1:getShipById(iter_6_41))
				end

				var_0_0.addCommanderBuffRes(var_6_43:buildBattleBuffList())
			end

			if arg_6_0.contextData.system == SYSTEM_ACT_BOSS_SP then
				local var_6_45 = getProxy(ActivityProxy):GetActivityBossRuntime(arg_6_0.contextData.actId).buffIds
				local var_6_46 = _.map(var_6_45, function(arg_7_0)
					return ActivityBossBuff.New({
						configId = arg_7_0
					}):GetBuffID()
				end)

				var_0_0.addChapterBuffRes(var_6_46)
			end

			if arg_6_0.contextData.system == SYSTEM_BOSS_SINGLE then
				local var_6_47 = getProxy(ActivityProxy):getActivityById(arg_6_0.contextData.actId)

				var_0_0.addChapterBuffRes(var_6_47:GetBuffIdsByStageId(arg_6_0.contextData.stageId))
			end

			if arg_6_0.contextData.system == SYSTEM_BOSS_SINGLE_VARIABLE then
				local var_6_48 = getProxy(ActivityProxy):getActivityById(arg_6_0.contextData.actId)

				var_0_0.addChapterBuffRes(var_6_48:GetBuffIdsByStageId(arg_6_0.contextData.stageId))

				local var_6_49 = pg.strategy_data_template
				local var_6_50 = {}

				for iter_6_42, iter_6_43 in ipairs(arg_6_0.contextData.variableBuffList) do
					table.insert(var_6_50, var_6_49[iter_6_43].buff_id)
				end

				var_0_0.addChapterBuffRes(var_6_50)
			end
		elseif arg_6_0.contextData.system == SYSTEM_BOSS_RUSH or arg_6_0.contextData.system == SYSTEM_BOSS_RUSH_EX then
			local var_6_51 = getProxy(ActivityProxy):getActivityById(arg_6_0.contextData.actId):GetSeriesData()

			assert(var_6_51)

			local var_6_52 = var_6_51:GetStaegLevel() + 1
			local var_6_53 = var_6_51:GetFleetIds()
			local var_6_54 = var_6_53[var_6_52]
			local var_6_55 = var_6_53[#var_6_53]

			if var_6_51:GetMode() == BossRushSeriesData.MODE.SINGLE then
				var_6_54 = var_6_53[1]
			end

			local var_6_56 = getProxy(FleetProxy):getActivityFleets()[arg_6_0.contextData.actId]
			local var_6_57 = var_6_56[var_6_54]
			local var_6_58 = var_6_56[var_6_55]

			if var_6_57 then
				local var_6_59 = var_6_57:GetRawShipIds()

				for iter_6_44, iter_6_45 in ipairs(var_6_59) do
					table.insert(var_6_23, var_6_1:getShipById(iter_6_45))
				end

				var_0_0.addCommanderBuffRes(var_6_57:buildBattleBuffList())
			end

			if var_6_58 then
				local var_6_60 = var_6_58:GetRawShipIds()

				for iter_6_46, iter_6_47 in ipairs(var_6_60) do
					table.insert(var_6_23, var_6_1:getShipById(iter_6_47))
				end

				var_0_0.addCommanderBuffRes(var_6_58:buildBattleBuffList())
			end
		elseif arg_6_0.contextData.system == SYSTEM_LIMIT_CHALLENGE then
			local var_6_61 = FleetProxy.CHALLENGE_FLEET_ID
			local var_6_62 = FleetProxy.CHALLENGE_SUB_FLEET_ID
			local var_6_63 = getProxy(FleetProxy)
			local var_6_64 = var_6_63:getFleetById(var_6_61)
			local var_6_65 = var_6_63:getFleetById(var_6_62)

			if var_6_64 then
				local var_6_66 = var_6_64:GetRawShipIds()

				for iter_6_48, iter_6_49 in ipairs(var_6_66) do
					table.insert(var_6_23, var_6_1:getShipById(iter_6_49))
				end

				var_0_0.addCommanderBuffRes(var_6_64:buildBattleBuffList())
			end

			if var_6_65 then
				local var_6_67 = var_6_65:GetRawShipIds()

				for iter_6_50, iter_6_51 in ipairs(var_6_67) do
					table.insert(var_6_23, var_6_1:getShipById(iter_6_51))
				end

				var_0_0.addCommanderBuffRes(var_6_65:buildBattleBuffList())
			end

			local var_6_68 = LimitChallengeConst.GetChallengeIDByStageID(arg_6_0.contextData.stageId)
			local var_6_69 = AcessWithinNull(pg.expedition_constellation_challenge_template[var_6_68], "buff_id")

			if var_6_69 then
				var_0_0.addEnemyBuffRes(var_6_69)
			end
		elseif arg_6_0.contextData.system == SYSTEM_GUILD then
			local var_6_70 = getProxy(GuildProxy):getRawData():GetActiveEvent():GetBossMission()
			local var_6_71 = var_6_70:GetMainFleet()
			local var_6_72 = var_6_71:GetShips()

			for iter_6_52, iter_6_53 in ipairs(var_6_72) do
				if iter_6_53 and iter_6_53.ship then
					table.insert(var_6_23, iter_6_53.ship)
				end
			end

			var_0_0.addCommanderBuffRes(var_6_71:BuildBattleBuffList())

			local var_6_73 = var_6_70:GetSubFleet()
			local var_6_74 = var_6_73:GetShips()

			for iter_6_54, iter_6_55 in ipairs(var_6_74) do
				if iter_6_55 and iter_6_55.ship then
					table.insert(var_6_23, iter_6_55.ship)
				end
			end

			var_0_0.addCommanderBuffRes(var_6_73:BuildBattleBuffList())
		elseif arg_6_0.contextData.system == SYSTEM_CHALLENGE then
			local var_6_75 = getProxy(ChallengeProxy):getUserChallengeInfo(arg_6_0.contextData.mode)
			local var_6_76 = var_6_75:getRegularFleet()

			ships = var_6_76:getShips(false)

			for iter_6_56, iter_6_57 in ipairs(ships) do
				table.insert(var_6_23, iter_6_57)
			end

			var_0_0.addCommanderBuffRes(var_6_76:buildBattleBuffList())

			local var_6_77 = var_6_75:getSubmarineFleet()

			ships = var_6_77:getShips(false)

			for iter_6_58, iter_6_59 in ipairs(ships) do
				table.insert(var_6_23, iter_6_59)
			end

			var_0_0.addCommanderBuffRes(var_6_77:buildBattleBuffList())
		elseif arg_6_0.contextData.system == SYSTEM_WORLD_BOSS then
			local var_6_78 = nowWorld():GetBossProxy()
			local var_6_79 = var_6_78:GetFleet(arg_6_0.contextData.bossId)
			local var_6_80 = var_6_1:getSortShipsByFleet(var_6_79)

			for iter_6_60, iter_6_61 in ipairs(var_6_80) do
				table.insert(var_6_23, iter_6_61)
			end

			local var_6_81 = var_6_78:GetBossById(arg_6_0.contextData.bossId)

			if var_6_81 and var_6_81:IsSelf() then
				local var_6_82, var_6_83, var_6_84 = var_6_78.GetSupportValue()

				if var_6_82 then
					var_0_0.addChapterAuraRes({
						{
							level = 1,
							id = var_6_84
						}
					})
				end
			end
		elseif arg_6_0.contextData.system == SYSTEM_WORLD then
			local var_6_85 = nowWorld()
			local var_6_86 = var_6_85:GetActiveMap()
			local var_6_87 = var_6_86:GetFleet()

			for iter_6_62, iter_6_63 in ipairs(var_6_87:GetShipVOs(true)) do
				table.insert(var_6_23, iter_6_63)
			end

			local var_6_88, var_6_89 = var_6_86:getFleetBattleBuffs(var_6_87)

			var_0_0.addCommanderBuffRes(var_6_89)
			var_0_0.addChapterBuffRes(var_6_88)

			local var_6_90 = var_6_86:GetChapterAuraBuffs()

			var_0_0.addChapterAuraRes(var_6_90)

			local var_6_91 = var_6_86:GetChapterAidBuffs()
			local var_6_92 = {}

			for iter_6_64, iter_6_65 in pairs(var_6_91) do
				for iter_6_66, iter_6_67 in ipairs(iter_6_65) do
					table.insert(var_6_92, iter_6_67)
				end
			end

			var_0_0.addChapterAuraRes(var_6_92)

			if var_6_85:GetSubAidFlag() == true then
				local var_6_93 = var_6_86:GetSubmarineFleet()
				local var_6_94 = var_6_93:GetTeamShipVOs(TeamType.Submarine, false)

				for iter_6_68, iter_6_69 in ipairs(var_6_94) do
					table.insert(var_6_23, iter_6_69)
				end

				local var_6_95, var_6_96 = var_6_86:getFleetBattleBuffs(var_6_93)

				var_0_0.addCommanderBuffRes(var_6_96)
				var_0_0.addChapterBuffRes(var_6_95)
			end

			local var_6_97 = var_6_86:GetCell(var_6_87.row, var_6_87.column):GetStageEnemy()

			var_0_0.addChapterBuffRes(table.mergeArray(var_6_97:GetBattleLuaBuffs(), var_6_86:GetBattleLuaBuffs(WorldMap.FactionEnemy, var_6_97)))
		elseif arg_6_0.contextData.mainFleetId then
			local var_6_98 = getProxy(FleetProxy):getFleetById(arg_6_0.contextData.mainFleetId)

			assert(var_6_98)

			local var_6_99 = var_6_1:getShipsByFleet(var_6_98)

			for iter_6_70, iter_6_71 in ipairs(var_6_99) do
				table.insert(var_6_23, iter_6_71)
			end
		end

		local var_6_100 = {}

		if arg_6_0.contextData.rivalId then
			local var_6_101 = getProxy(MilitaryExerciseProxy):getRivalById(arg_6_0.contextData.rivalId)

			assert(var_6_101, "rival id >>>> " .. arg_6_0.contextData.rivalId)

			local var_6_102 = var_6_101:getShips()

			for iter_6_72, iter_6_73 in ipairs(var_6_102) do
				table.insert(var_6_23, iter_6_73)

				var_6_100[iter_6_73] = true
			end
		end

		if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
			local var_6_103 = getProxy(FleetProxy):getFleetById(11)
			local var_6_104 = var_6_103:getTeamByName(TeamType.Submarine)

			for iter_6_74, iter_6_75 in ipairs(var_6_104) do
				table.insert(var_6_23, var_6_1:getShipById(iter_6_75))
			end

			var_0_0.addCommanderBuffRes(var_6_103:buildBattleBuffList())
		end

		if arg_6_0.contextData.system == SYSTEM_CARDPUZZLE then
			local var_6_105 = arg_6_0.contextData.cards

			for iter_6_76, iter_6_77 in ipairs(var_6_105) do
				local var_6_106 = ys.Battle.BattleDataFunction.GetPuzzleCardDataTemplate(iter_6_77).effect[1]
				local var_6_107 = ys.Battle.BattleDataFunction.GetCardRes(var_6_106)

				for iter_6_78, iter_6_79 in ipairs(var_6_107) do
					var_6_0:AddPreloadResource(iter_6_79)
				end
			end

			for iter_6_80, iter_6_81 in ipairs(arg_6_0.contextData.cardPuzzleFleet) do
				local var_6_108 = iter_6_81:getConfig("id")
				local var_6_109 = ys.Battle.BattleDataFunction.GetPuzzleShipDataTemplate(var_6_108)

				var_6_0:AddPreloadCV(var_6_109.skin_id)
				var_6_0:AddPreloadResource(var_6_0.GetShipResource(var_6_109.id, var_6_109.skin_id, true))
			end

			var_6_0:AddPreloadResource(var_6_0.GetUIPath("CardTowerCardCombat"))
			var_6_0:AddPreloadResource(var_6_0.GetFXPath("kapai_weizhi"))
		end

		if arg_6_0.contextData.prefabFleet then
			local var_6_110 = arg_6_0.contextData.prefabFleet.main_unitList
			local var_6_111 = arg_6_0.contextData.prefabFleet.vanguard_unitList
			local var_6_112 = arg_6_0.contextData.prefabFleet.submarine_unitList

			if var_6_110 then
				for iter_6_82, iter_6_83 in ipairs(var_6_110) do
					local var_6_113 = {
						configId = iter_6_83.configId,
						equipments = {},
						skinId = iter_6_83.skinId,
						buffs = iter_6_83.skills
					}
					local var_6_114 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(iter_6_83.configId)
					local var_6_115 = math.max(#iter_6_83.equipment, #var_6_114.default_equip_list)

					for iter_6_84 = 1, var_6_115 do
						var_6_113.equipments[iter_6_84] = iter_6_83.equipment[iter_6_84] and {
							configId = iter_6_83.equipment[iter_6_84]
						} or false
					end

					function var_6_113.getActiveEquipments(arg_8_0)
						return arg_8_0.equipments
					end

					table.insert(var_6_23, var_6_113)
				end
			end

			if var_6_111 then
				for iter_6_85, iter_6_86 in ipairs(var_6_111) do
					local var_6_116 = {
						configId = iter_6_86.configId,
						equipments = {},
						skinId = iter_6_86.skinId,
						buffs = iter_6_86.skills
					}
					local var_6_117 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(iter_6_86.configId)
					local var_6_118 = math.max(#iter_6_86.equipment, #var_6_117.default_equip_list)

					for iter_6_87 = 1, var_6_118 do
						var_6_116.equipments[iter_6_87] = iter_6_86.equipment[iter_6_87] and {
							configId = iter_6_86.equipment[iter_6_87]
						} or false
					end

					function var_6_116.getActiveEquipments(arg_9_0)
						return arg_9_0.equipments
					end

					table.insert(var_6_23, var_6_116)
				end
			end

			if var_6_112 then
				for iter_6_88, iter_6_89 in ipairs(var_6_112) do
					local var_6_119 = {
						configId = iter_6_89.configId,
						equipments = {},
						skinId = iter_6_89.skinId,
						buffs = iter_6_89.skills
					}
					local var_6_120 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(iter_6_89.configId)
					local var_6_121 = math.max(#iter_6_89.equipment, #var_6_120.default_equip_list)

					for iter_6_90 = 1, var_6_121 do
						var_6_119.equipments[iter_6_90] = iter_6_89.equipment[iter_6_90] and {
							configId = iter_6_89.equipment[iter_6_90]
						} or false
					end

					function var_6_119.getActiveEquipments(arg_10_0)
						return arg_10_0.equipments
					end

					table.insert(var_6_23, var_6_119)
				end
			end
		end

		for iter_6_91, iter_6_92 in ipairs(var_6_23) do
			var_6_0:AddPreloadCV(iter_6_92.skinId)

			local var_6_122 = true

			if var_6_100[iter_6_92] == true then
				var_6_122 = false
			end

			var_6_0:AddPreloadResource(var_6_0.GetShipResource(iter_6_92.configId, iter_6_92.skinId, var_6_122))

			local var_6_123 = ys.Battle.BattleDataFunction.GetPlayerShipTmpDataFromID(iter_6_92.configId)

			for iter_6_93, iter_6_94 in ipairs(iter_6_92:getActiveEquipments()) do
				local var_6_124
				local var_6_125
				local var_6_126 = 0

				if not iter_6_94 then
					var_6_124 = var_6_123.default_equip_list[iter_6_93]
				else
					var_6_124 = iter_6_94.configId
					var_6_126 = iter_6_94.skinId
				end

				if var_6_124 then
					local var_6_127 = ys.Battle.BattleDataFunction.GetWeaponDataFromID(var_6_124).weapon_id

					if #var_6_127 > 0 then
						for iter_6_95, iter_6_96 in ipairs(var_6_127) do
							var_6_0:AddPreloadResource(var_6_0.GetWeaponResource(iter_6_96, var_6_126))
						end
					else
						var_6_0:AddPreloadResource(var_6_0.GetEquipResource(var_6_124, var_6_126, arg_6_0.contextData.system))
					end
				end
			end

			for iter_6_97, iter_6_98 in ipairs(var_6_123.depth_charge_list) do
				local var_6_128 = ys.Battle.BattleDataFunction.GetWeaponDataFromID(iter_6_98).weapon_id

				for iter_6_99, iter_6_100 in ipairs(var_6_128) do
					var_6_0:AddPreloadResource(var_6_0.GetWeaponResource(iter_6_100))
				end
			end

			for iter_6_101, iter_6_102 in ipairs(var_6_123.fix_equip_list) do
				local var_6_129 = ys.Battle.BattleDataFunction.GetWeaponDataFromID(iter_6_102).weapon_id

				for iter_6_103, iter_6_104 in ipairs(var_6_129) do
					var_6_0:AddPreloadResource(var_6_0.GetWeaponResource(iter_6_104))
				end
			end

			local var_6_130 = iter_6_92.GetSpWeapon and iter_6_92:GetSpWeapon()

			if var_6_130 then
				var_6_0:AddPreloadResource(var_6_0.GetSpWeaponResource(var_6_130:GetConfigID(), arg_6_0.contextData.system))
			end

			local var_6_131 = ys.Battle.BattleDataFunction.GetBuffBulletRes(iter_6_92.configId, iter_6_92.skills, arg_6_0.contextData.system, iter_6_92.skinId, var_6_130)

			for iter_6_105, iter_6_106 in pairs(var_6_131) do
				var_6_0:AddPreloadResource(iter_6_106)
			end

			if iter_6_92.buffs then
				var_6_0:AddPreloadResource(ys.Battle.BattleDataFunction.GetBuffListRes(iter_6_92.buffs, arg_6_0.contextData.system, iter_6_92.skinId))
			end
		end
	end

	local var_6_132 = pg.expedition_data_template[arg_6_0.contextData.stageId]
	local var_6_133

	if arg_6_0.contextData.system == SYSTEM_WORLD and var_6_132.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
		local var_6_134 = nowWorld():GetActiveMap().config.expedition_map_id

		var_6_0:AddPreloadResource(var_6_0.GetMapResource(var_6_134))
	else
		for iter_6_107, iter_6_108 in ipairs(var_6_132.map_id) do
			var_6_0:AddPreloadResource(var_6_0.GetMapResource(iter_6_108[1]))
		end
	end

	local var_6_135 = pg.expedition_data_template[arg_6_0.contextData.stageId].dungeon_id
	local var_6_136, var_6_137 = var_6_0.GetStageResource(var_6_135)

	var_6_0:AddPreloadResource(var_6_136)
	var_6_0:AddPreloadResource(var_6_0.GetCommonResource())
	var_6_0:AddPreloadResource(var_6_0.GetBuffResource())

	if pg.battle_cost_template[arg_6_0.contextData.system].global_buff_effected > 0 then
		var_0_0.addGlobalBuffRes()
	end

	for iter_6_109, iter_6_110 in ipairs(var_6_137) do
		var_6_0:AddPreloadCV(iter_6_110)
	end

	local function var_6_138()
		SetActive(arg_6_0._loadingAnima, false)
		SetActive(arg_6_0._finishAnima, true)

		arg_6_0._finishAnima:GetComponent("Animator").enabled = true
	end

	local var_6_139 = 0

	local function var_6_140(arg_12_0)
		local var_12_0
		local var_12_1 = var_6_139 == 0 and 0 or arg_12_0 / var_6_139

		arg_6_0._loadingProgress.value = var_12_1
		arg_6_0._loadingText.text = string.format("%.2f", var_12_1 * 100) .. "%"
		arg_6_0._loadingAnima.anchoredPosition = Vector2(var_12_1 * var_0_0.LOADING_ANIMA_DISTANCE, arg_6_0._loadingAnimaPosY)
	end

	local var_6_141 = pg.UIMgr.GetInstance():GetMainCamera()

	setActive(var_6_141, true)

	var_6_139 = var_6_0:StartPreload(var_6_138, var_6_140)
	arg_6_0._tipsText.text = pg.server_language[math.random(#pg.server_language)].content
end

function var_0_0.addCommanderBuffRes(arg_13_0)
	local var_13_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_13_0, iter_13_1 in ipairs(arg_13_0) do
		local var_13_1 = var_13_0.GetCommanderResource(iter_13_1)

		for iter_13_2, iter_13_3 in ipairs(var_13_1) do
			var_13_0:AddPreloadResource(iter_13_3)
		end
	end
end

function var_0_0.addGlobalBuffRes()
	local var_14_0 = BuffHelper.GetBattleBuffs()
	local var_14_1 = _.map(var_14_0, function(arg_15_0)
		return arg_15_0:getConfig("benefit_effect")
	end)
	local var_14_2 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_14_0, iter_14_1 in ipairs(var_14_1) do
		iter_14_1 = tonumber(iter_14_1)

		local var_14_3 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_14_1, 1, {})

		for iter_14_2, iter_14_3 in ipairs(var_14_3) do
			var_14_2:AddPreloadResource(iter_14_3)
		end
	end
end

function var_0_0.addChapterBuffRes(arg_16_0)
	local var_16_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_16_0, iter_16_1 in ipairs(arg_16_0) do
		local var_16_1 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_16_1, 1, {})

		for iter_16_2, iter_16_3 in ipairs(var_16_1) do
			var_16_0:AddPreloadResource(iter_16_3)
		end
	end
end

function var_0_0.addChapterAuraRes(arg_17_0)
	local var_17_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_17_0, iter_17_1 in ipairs(arg_17_0) do
		local var_17_1 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_17_1.id, iter_17_1.level, {})

		for iter_17_2, iter_17_3 in ipairs(var_17_1) do
			var_17_0:AddPreloadResource(iter_17_3)
		end
	end
end

function var_0_0.addEnemyBuffRes(arg_18_0)
	local var_18_0 = ys.Battle.BattleResourceManager.GetInstance()

	for iter_18_0, iter_18_1 in ipairs(arg_18_0) do
		local var_18_1 = ys.Battle.BattleDataFunction.GetResFromBuff(iter_18_1.ID, iter_18_1.LV, {})

		for iter_18_2, iter_18_3 in ipairs(var_18_1) do
			var_18_0:AddPreloadResource(iter_18_3)
		end
	end
end

function var_0_0.StartLoad(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0._toLoad[arg_19_3] = 1

	LoadAndInstantiateAsync(arg_19_1, arg_19_2, function(arg_20_0)
		arg_19_0:LoadFinish(arg_20_0, arg_19_3)
	end)
end

function var_0_0.LoadFinish(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0._loadObs.map = arg_21_1
	arg_21_0._toLoad.map = nil

	if table.getCount(arg_21_0._toLoad) <= 0 then
		arg_21_0._go:GetComponent("Animator"):Play("start")
	end
end

return var_0_0

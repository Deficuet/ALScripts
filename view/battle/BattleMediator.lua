local var_0_0 = class("BattleMediator", import("..base.ContextMediator"))

var_0_0.ON_BATTLE_RESULT = "BattleMediator:ON_BATTLE_RESULT"
var_0_0.ON_PAUSE = "BattleMediator:ON_PAUSE"
var_0_0.ENTER = "BattleMediator:ENTER"
var_0_0.ON_BACK_PRE_SCENE = "BattleMediator:ON_BACK_PRE_SCENE"
var_0_0.ON_LEAVE = "BattleMediator:ON_LEAVE"
var_0_0.ON_QUIT_BATTLE_MANUALLY = "BattleMediator:ON_QUIT_BATTLE_MANUALLY"
var_0_0.HIDE_ALL_BUTTONS = "BattleMediator:HIDE_ALL_BUTTONS"
var_0_0.ON_CHAT = "BattleMediator:ON_CHAT"
var_0_0.CLOSE_CHAT = "BattleMediator:CLOSE_CHAT"
var_0_0.ON_AUTO = "BattleMediator:ON_AUTO"
var_0_0.UPDATE_AUTO_COUNT = "BattleMediator:UPDATE_AUTO_COUNT"
var_0_0.ON_PUZZLE_RELIC = "BattleMediator.ON_PUZZLE_RELIC"
var_0_0.ON_PUZZLE_CARD = "BattleMediator.ON_PUZZLE_CARD"

function var_0_0.register(arg_1_0)
	pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(true)
	arg_1_0:GenBattleData()

	arg_1_0.contextData.battleData = arg_1_0._battleData

	local var_1_0 = ys.Battle.BattleState.GetInstance()
	local var_1_1 = arg_1_0.contextData.system

	arg_1_0:bind(var_0_0.ON_BATTLE_RESULT, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.FINISH_STAGE, {
			token = arg_1_0.contextData.token,
			mainFleetId = arg_1_0.contextData.mainFleetId,
			stageId = arg_1_0.contextData.stageId,
			rivalId = arg_1_0.contextData.rivalId,
			memory = arg_1_0.contextData.memory,
			bossId = arg_1_0.contextData.bossId,
			exitCallback = arg_1_0.contextData.exitCallback,
			system = var_1_1,
			statistics = arg_2_1,
			actId = arg_1_0.contextData.actId,
			mode = arg_1_0.contextData.mode,
			puzzleCombatID = arg_1_0.contextData.puzzleCombatID,
			useVariableTicket = arg_1_0.contextData.useVariableTicket,
			isSimulate = arg_1_0.contextData.isSimulate
		})
	end)
	arg_1_0:bind(var_0_0.ON_AUTO, function(arg_3_0, arg_3_1)
		arg_1_0:onAutoBtn(arg_3_1)
	end)
	arg_1_0:bind(var_0_0.ON_PAUSE, function(arg_4_0)
		arg_1_0:onPauseBtn()
	end)
	arg_1_0:bind(var_0_0.ON_LEAVE, function(arg_5_0)
		arg_1_0:warnFunc()
	end)
	arg_1_0:bind(var_0_0.ON_CHAT, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = NotificationMediator,
			viewComponent = NotificationLayer,
			data = {
				form = NotificationLayer.FORM_BATTLE
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ENTER, function(arg_7_0)
		var_1_0:EnterBattle(arg_1_0._battleData, arg_1_0.contextData.prePause)
	end)
	arg_1_0:bind(var_0_0.ON_BACK_PRE_SCENE, function()
		local var_8_0 = getProxy(ContextProxy)
		local var_8_1 = var_8_0:getContextByMediator(DailyLevelMediator)
		local var_8_2 = var_8_0:getContextByMediator(LevelMediator2)
		local var_8_3 = var_8_0:getContextByMediator(ChallengeMainMediator)
		local var_8_4 = var_8_0:getContextByMediator(ActivityBossMediatorTemplate)
		local var_8_5 = var_8_0:getContextByMediator(WorldMediator)
		local var_8_6 = var_8_0:getContextByMediator(WorldBossMediator)
		local var_8_7, var_8_8 = var_8_0:getContextByMediator(BossSinglePreCombatMediator)

		if var_8_6 and arg_1_0.contextData.bossId then
			arg_1_0:sendNotification(GAME.WORLD_BOSS_BATTLE_QUIT, {
				id = arg_1_0.contextData.bossId
			})

			local var_8_9 = var_8_6:getContextByMediator(WorldBossFormationMediator)

			if var_8_9 then
				var_8_6:removeChild(var_8_9)
			end
		elseif var_8_5 then
			local var_8_10 = var_8_5:getContextByMediator(WorldPreCombatMediator) or var_8_5:getContextByMediator(WorldBossInformationMediator)

			if var_8_10 then
				var_8_5:removeChild(var_8_10)
			end
		elseif var_8_1 then
			local var_8_11 = var_8_1:getContextByMediator(PreCombatMediator)

			var_8_1:removeChild(var_8_11)
		elseif var_8_3 then
			arg_1_0:sendNotification(GAME.CHALLENGE2_RESET, {
				mode = arg_1_0.contextData.mode
			})

			local var_8_12 = var_8_3:getContextByMediator(ChallengePreCombatMediator)

			var_8_3:removeChild(var_8_12)
		elseif var_8_2 then
			if var_1_1 == SYSTEM_DUEL then
				-- block empty
			elseif var_1_1 == SYSTEM_SCENARIO then
				local var_8_13 = var_8_2:getContextByMediator(ChapterPreCombatMediator)

				if var_8_13 then
					var_8_2:removeChild(var_8_13)
				end
			elseif var_1_1 ~= SYSTEM_PERFORM and var_1_1 ~= SYSTEM_SIMULATION then
				local var_8_14 = var_8_2:getContextByMediator(PreCombatMediator)

				if var_8_14 then
					var_8_2:removeChild(var_8_14)
				end
			end
		elseif var_8_4 then
			local var_8_15 = var_8_4:getContextByMediator(PreCombatMediator)

			if var_8_15 then
				var_8_4:removeChild(var_8_15)
			end
		elseif var_8_7 then
			local var_8_16 = var_8_8:removeChild(var_8_7)
		end

		arg_1_0:sendNotification(GAME.GO_BACK)
	end)
	arg_1_0:bind(var_0_0.ON_QUIT_BATTLE_MANUALLY, function(arg_9_0)
		if var_1_1 == SYSTEM_SCENARIO then
			getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.MANUAL)
		elseif var_1_1 == SYSTEM_WORLD then
			nowWorld():TriggerAutoFight(false)
		elseif var_1_1 == SYSTEM_ACT_BOSS then
			if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
				getProxy(ContextProxy):GetPrevContext(1):addChild(Context.New({
					mediator = ActivityBossTotalRewardPanelMediator,
					viewComponent = ActivityBossTotalRewardPanel,
					data = {
						isAutoFight = false,
						isLayer = true,
						rewards = getProxy(ChapterProxy):PopActBossRewards(),
						continuousBattleTimes = arg_1_0.contextData.continuousBattleTimes,
						totalBattleTimes = arg_1_0.contextData.totalBattleTimes
					}
				}))
			end
		elseif var_1_1 == SYSTEM_BOSS_RUSH or var_1_1 == SYSTEM_BOSS_RUSH_COLLABRATE then
			if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
				local var_9_0 = getProxy(ActivityProxy):PopBossRushAwards()

				getProxy(ContextProxy):GetPrevContext(1):addChild(Context.New({
					mediator = BossRushTotalRewardPanelMediator,
					viewComponent = BossRushTotalRewardPanel,
					data = {
						isAutoFight = false,
						isLayer = true,
						rewards = var_9_0
					}
				}))
			end
		elseif (var_1_1 == SYSTEM_BOSS_SINGLE or var_1_1 == SYSTEM_BOSS_SINGLE_VARIABLE) and getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator) then
			getProxy(ContextProxy):GetPrevContext(1):addChild(Context.New({
				mediator = BossSingleTotalRewardPanelMediator,
				viewComponent = BossSingleTotalRewardPanel,
				data = {
					isAutoFight = false,
					isLayer = true,
					rewards = getProxy(ChapterProxy):PopBossSingleRewards(),
					continuousBattleTimes = arg_1_0.contextData.continuousBattleTimes,
					totalBattleTimes = arg_1_0.contextData.totalBattleTimes
				}
			}))
		end
	end)
	arg_1_0:bind(var_0_0.ON_PUZZLE_RELIC, function(arg_10_0, arg_10_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = CardPuzzleRelicDeckMediator,
			viewComponent = CardPuzzleRelicDeckLayerCombat,
			data = arg_10_1
		}))
		var_1_0:Pause()
	end)
	arg_1_0:bind(var_0_0.ON_PUZZLE_CARD, function(arg_11_0, arg_11_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = CardPuzzleCardDeckMediator,
			viewComponent = CardPuzzleCardDeckLayerCombat,
			data = arg_11_1
		}))
		var_1_0:Pause()
	end)

	if arg_1_0.contextData.continuousBattleTimes and arg_1_0.contextData.continuousBattleTimes > 0 then
		if var_1_1 == SYSTEM_BOSS_SINGLE or var_1_1 == SYSTEM_BOSS_SINGLE_VARIABLE then
			if not getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator) then
				local var_1_2 = CreateShell(arg_1_0.contextData)

				arg_1_0:addSubLayers(Context.New({
					mediator = BossSingleContinuousOperationMediator,
					viewComponent = BossSingleContinuousOperationPanel,
					data = var_1_2
				}))
			end
		elseif not getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
			local var_1_3 = CreateShell(arg_1_0.contextData)

			arg_1_0:addSubLayers(Context.New({
				mediator = ContinuousOperationMediator,
				viewComponent = ContinuousOperationPanel,
				data = var_1_3
			}))
		end

		arg_1_0.contextData.battleData.hideAllButtons = true
	end

	local var_1_4 = getProxy(PlayerProxy)

	if var_1_4 then
		arg_1_0.player = var_1_4:getData()

		var_1_4:setFlag("battle", true)
		var_1_4:setFlag("random_skin", true)
	end
end

function var_0_0.onAutoBtn(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.isOn
	local var_12_1 = arg_12_1.toggle
	local var_12_2 = arg_12_1.system

	arg_12_0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = var_12_0,
		toggle = var_12_1,
		system = var_12_2
	})
end

function var_0_0.updateAutoCount(arg_13_0, arg_13_1)
	local var_13_0 = ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name):AutoStatistics(arg_13_1.isOn)
end

function var_0_0.onPauseBtn(arg_14_0)
	local var_14_0 = ys.Battle.BattleState.GetInstance()

	if arg_14_0.contextData.system == SYSTEM_PROLOGUE or arg_14_0.contextData.system == SYSTEM_PERFORM then
		local var_14_1 = {}

		if EPILOGUE_SKIPPABLE then
			local var_14_2 = {
				text = "关爱胡德",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = function()
					var_14_0:Deactive()
					arg_14_0:sendNotification(GAME.CHANGE_SCENE, SCENE.CREATE_PLAYER)
				end
			}

			table.insert(var_14_1, 1, var_14_2)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_rule"),
			onClose = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = var_14_1
		})
		var_14_0:Pause()
	elseif arg_14_0.contextData.system == SYSTEM_DODGEM then
		local var_14_3 = {
			text = "text_cancel_fight",
			btnType = pg.MsgboxMgr.BUTTON_RED,
			onCallback = function()
				arg_14_0:warnFunc(function()
					ys.Battle.BattleState.GetInstance():Resume()
				end)
			end
		}

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_warspite"),
			onClose = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = {
				var_14_3
			}
		})
		var_14_0:Pause()
	elseif arg_14_0.contextData.system == SYSTEM_SIMULATION then
		local var_14_4 = {
			text = "text_cancel_fight",
			btnType = pg.MsgboxMgr.BUTTON_RED,
			onCallback = function()
				arg_14_0:warnFunc(function()
					ys.Battle.BattleState.GetInstance():Resume()
				end)
			end
		}

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_rule"),
			onClose = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = {
				var_14_4
			}
		})
		var_14_0:Pause()
	elseif arg_14_0.contextData.system == SYSTEM_SUBMARINE_RUN or arg_14_0.contextData.system == SYSTEM_SUB_ROUTINE or arg_14_0.contextData.system == SYSTEM_REWARD_PERFORM or arg_14_0.contextData.system == SYSTEM_AIRFIGHT then
		var_14_0:Pause()
		arg_14_0:warnFunc(function()
			ys.Battle.BattleState.GetInstance():Resume()
		end)
	elseif arg_14_0.contextData.system == SYSTEM_CARDPUZZLE then
		arg_14_0:addSubLayers(Context.New({
			mediator = CardPuzzleCombatPauseMediator,
			viewComponent = CardPuzzleCombatPauseLayer
		}))
		var_14_0:Pause()
	else
		arg_14_0.viewComponent:updatePauseWindow()
		var_14_0:Pause()
	end
end

function var_0_0.warnFunc(arg_27_0, arg_27_1)
	local var_27_0 = ys.Battle.BattleState.GetInstance()
	local var_27_1 = arg_27_0.contextData.system
	local var_27_2
	local var_27_3

	local function var_27_4()
		var_27_0:Stop()
	end

	local var_27_5 = arg_27_0.contextData.warnMsg

	if var_27_5 and #var_27_5 > 0 then
		var_27_3 = i18n(var_27_5)
	elseif var_27_1 == SYSTEM_CHALLENGE then
		var_27_3 = i18n("battle_battleMediator_clear_warning")
	elseif var_27_1 == SYSTEM_SIMULATION then
		var_27_3 = i18n("tech_simulate_quit")
	elseif var_27_1 == SYSTEM_SCENARIO_SUB_STRIKE then
		var_27_3 = i18n("battle_battleMediator_quest_exist_submarine_support")

		function var_27_4()
			var_27_0:GetCommandByName(ys.Battle.BattleScenarioSubStrikeCommand.__name):CalcBattleEnd()
			arg_27_0.viewComponent:ClosePauseWindow()
		end
	else
		var_27_3 = i18n("battle_battleMediator_quest_exist")
	end

	local function var_27_6()
		if arg_27_1 then
			arg_27_1()
		end

		local var_30_0 = arg_27_0.viewComponent.leaveBtn:GetComponent(typeof(Animation))

		if var_30_0 then
			var_30_0:Play("msgbox_btn_into")
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		hideNo = true,
		hideYes = true,
		content = var_27_3,
		onClose = var_27_6,
		custom = {
			{
				text = "text_cancel",
				onCallback = var_27_6,
				sound = SFX_CANCEL
			},
			{
				text = "text_exit",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = var_27_4,
				sound = SFX_CONFIRM
			}
		}
	})
end

function var_0_0.guideDispatch(arg_31_0)
	return
end

local function var_0_1(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = {}

	for iter_32_0, iter_32_1 in ipairs(arg_32_1:getActiveEquipments()) do
		if iter_32_1 then
			var_32_0[#var_32_0 + 1] = {
				id = iter_32_1.configId,
				skin = iter_32_1.skinId,
				equipmentInfo = iter_32_1
			}
		else
			var_32_0[#var_32_0 + 1] = {
				skin = 0,
				id = iter_32_1,
				equipmentInfo = iter_32_1
			}
		end
	end

	local var_32_1 = {}

	local function var_32_2(arg_33_0)
		local var_33_0 = {
			level = arg_33_0.level
		}
		local var_33_1 = arg_33_0.id
		local var_33_2 = arg_32_1:RemapSkillId(var_33_1, true)

		var_33_0.id = ys.Battle.BattleDataFunction.SkillTranform(arg_32_0, var_33_2)

		return var_33_0
	end

	local var_32_3 = ys.Battle.BattleDataFunction.GenerateHiddenBuff(arg_32_1.configId)

	for iter_32_2, iter_32_3 in pairs(var_32_3) do
		local var_32_4 = var_32_2(iter_32_3)

		var_32_1[var_32_4.id] = var_32_4
	end

	for iter_32_4, iter_32_5 in pairs(arg_32_1.skills) do
		if iter_32_5 and iter_32_5.id == 14900 and not arg_32_1.transforms[16412] then
			-- block empty
		else
			local var_32_5 = var_32_2(iter_32_5)

			var_32_1[var_32_5.id] = var_32_5
		end
	end

	local var_32_6 = ys.Battle.BattleDataFunction.GetEquipSkill(var_32_0)

	for iter_32_6, iter_32_7 in ipairs(var_32_6) do
		local var_32_7 = {
			level = iter_32_7.buffLV,
			id = ys.Battle.BattleDataFunction.SkillTranform(arg_32_0, iter_32_7.buffID)
		}

		var_32_1[var_32_7.id] = var_32_7
	end

	local var_32_8

	;(function()
		var_32_8 = arg_32_1:GetSpWeapon()

		if not var_32_8 then
			return
		end

		local var_34_0 = var_32_8:GetEffect()

		if var_34_0 == 0 then
			return
		end

		local var_34_1 = {}

		var_34_1.level = 1
		var_34_1.id = ys.Battle.BattleDataFunction.SkillTranform(arg_32_0, var_34_0)
		var_32_1[var_34_1.id] = var_34_1
	end)()

	for iter_32_8, iter_32_9 in pairs(arg_32_1:getTriggerSkills()) do
		local var_32_9 = {
			level = iter_32_9.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(arg_32_0, iter_32_9.id)
		}

		var_32_1[var_32_9.id] = var_32_9
	end

	local var_32_10 = arg_32_0 == SYSTEM_WORLD
	local var_32_11 = false

	if var_32_10 then
		local var_32_12 = WorldConst.FetchWorldShip(arg_32_1.id)

		if var_32_12 then
			var_32_11 = var_32_12:IsBroken()
		end
	end

	if var_32_11 then
		for iter_32_10, iter_32_11 in pairs(var_32_1) do
			local var_32_13 = pg.skill_data_template[iter_32_10].world_death_mark[1]

			if var_32_13 == ys.Battle.BattleConst.DEATH_MARK_SKILL.DEACTIVE then
				var_32_1[iter_32_10] = nil
			elseif var_32_13 == ys.Battle.BattleConst.DEATH_MARK_SKILL.IGNORE then
				-- block empty
			end
		end
	end

	return {
		id = arg_32_1.id,
		tmpID = arg_32_1.configId,
		skinId = arg_32_1.skinId,
		level = arg_32_1.level,
		equipment = var_32_0,
		properties = arg_32_1:getProperties(arg_32_2, arg_32_3, var_32_10),
		baseProperties = arg_32_1:getShipProperties(),
		proficiency = arg_32_1:getEquipProficiencyList(),
		rarity = arg_32_1:getRarity(),
		intimacy = arg_32_1:getCVIntimacy(),
		shipGS = arg_32_1:getShipCombatPower(),
		skills = var_32_1,
		baseList = arg_32_1:getBaseList(),
		preloasList = arg_32_1:getPreLoadCount(),
		name = arg_32_1:getName(),
		deathMark = var_32_11,
		spWeapon = var_32_8
	}
end

local function var_0_2(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0:getProperties(arg_35_1)
	local var_35_1 = arg_35_0:getConfig("id")

	return {
		deathMark = false,
		shipGS = 100,
		rarity = 1,
		intimacy = 100,
		id = var_35_1,
		tmpID = var_35_1,
		skinId = arg_35_0:getConfig("skin_id"),
		level = arg_35_0:getConfig("level"),
		equipment = arg_35_0:getConfig("default_equip"),
		properties = var_35_0,
		baseProperties = var_35_0,
		proficiency = {
			1,
			1,
			1
		},
		skills = {},
		baseList = {
			1,
			1,
			1
		},
		preloasList = {
			0,
			0,
			0
		},
		name = var_35_1,
		fleetIndex = arg_35_0:getConfig("location")
	}
end

function var_0_0.GenBattleData(arg_36_0)
	local var_36_0 = {}
	local var_36_1 = arg_36_0.contextData.system

	arg_36_0._battleData = var_36_0
	var_36_0.battleType = arg_36_0.contextData.system
	var_36_0.StageTmpId = arg_36_0.contextData.stageId
	var_36_0.CMDArgs = arg_36_0.contextData.cmdArgs
	var_36_0.isMemory = arg_36_0.contextData.memory
	var_36_0.MainUnitList = {}
	var_36_0.VanguardUnitList = {}
	var_36_0.SubUnitList = {}
	var_36_0.AidUnitList = {}
	var_36_0.SupportUnitList = {}
	var_36_0.SubFlag = -1
	var_36_0.ActID = arg_36_0.contextData.actId
	var_36_0.bossLevel = arg_36_0.contextData.bossLevel
	var_36_0.bossConfigId = arg_36_0.contextData.bossConfigId

	if pg.battle_cost_template[var_36_1].global_buff_effected > 0 then
		local var_36_2 = BuffHelper.GetBattleBuffs(var_36_1)

		var_36_0.GlobalBuffIDs = underscore.filter(var_36_2, function(arg_37_0)
			local var_37_0
			local var_37_1 = {
				"dungeon"
			}

			if var_36_1 == SYSTEM_SCENARIO then
				table.insert(var_37_1, "chapter")

				var_37_0 = getProxy(ChapterProxy):getActiveChapter().id
			end

			return underscore.all(var_37_1, function(arg_38_0)
				return switch(arg_38_0, {
					chapter = function()
						return arg_37_0:checkChaper(var_37_0)
					end,
					dungeon = function()
						return arg_37_0:checkDungeon(arg_36_0.contextData.stageId)
					end
				}, function()
					return false
				end)
			end)
		end)
	end

	local var_36_3 = pg.battle_cost_template[var_36_1]
	local var_36_4 = getProxy(BayProxy)
	local var_36_5 = {}

	if var_36_1 == SYSTEM_SCENARIO then
		local var_36_6 = getProxy(ChapterProxy)
		local var_36_7 = var_36_6:getActiveChapter()

		var_36_0.RepressInfo = var_36_7:getRepressInfo()

		arg_36_0.viewComponent:setChapter(var_36_7)

		local var_36_8 = var_36_7.fleet

		var_36_0.KizunaJamming = var_36_7:getExtraFlags()
		var_36_0.DefeatCount = var_36_8:getDefeatCount()
		var_36_0.ChapterBuffIDs, var_36_0.CommanderList = var_36_7:getFleetBattleBuffs(var_36_8)
		var_36_0.StageWaveFlags = var_36_7:GetStageFlags()
		var_36_0.ChapterWeatherIDS = var_36_7:GetWeather(var_36_8.line.row, var_36_8.line.column)
		var_36_0.MapAuraSkills = var_36_6.GetChapterAuraBuffs(var_36_7)
		var_36_0.MapAidSkills = {}
		var_36_0.ChapterType = var_36_7:getPlayType()

		local var_36_9 = var_36_6.GetChapterAidBuffs(var_36_7)

		for iter_36_0, iter_36_1 in pairs(var_36_9) do
			local var_36_10 = var_36_7:getFleetByShipVO(iter_36_0)
			local var_36_11 = _.values(var_36_10:getCommanders())
			local var_36_12 = var_0_1(var_36_1, iter_36_0, var_36_11)

			table.insert(var_36_0.AidUnitList, var_36_12)

			for iter_36_2, iter_36_3 in ipairs(iter_36_1) do
				table.insert(var_36_0.MapAidSkills, iter_36_3)
			end
		end

		local var_36_13 = var_36_8:getShipsByTeam(TeamType.Main, false)
		local var_36_14 = var_36_8:getShipsByTeam(TeamType.Vanguard, false)
		local var_36_15 = {}
		local var_36_16 = _.values(var_36_8:getCommanders())
		local var_36_17 = {}
		local var_36_18, var_36_19 = var_36_6.getSubAidFlag(var_36_7, arg_36_0.contextData.stageId)

		if var_36_18 == true or var_36_18 > 0 then
			var_36_0.SubFlag = 1
			var_36_0.TotalSubAmmo = 1
			var_36_15 = var_36_19:getShipsByTeam(TeamType.Submarine, false)
			var_36_17 = _.values(var_36_19:getCommanders())

			local var_36_20, var_36_21 = var_36_7:getFleetBattleBuffs(var_36_19)

			var_36_0.SubCommanderList = var_36_21
		else
			var_36_0.SubFlag = var_36_18

			if var_36_18 ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				var_36_0.TotalSubAmmo = 0
			end
		end

		arg_36_0.mainShips = {}

		local function var_36_22(arg_42_0, arg_42_1, arg_42_2)
			local var_42_0 = arg_42_0.id
			local var_42_1 = arg_42_0.hpRant * 0.0001

			if table.contains(var_36_5, var_42_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = var_42_0

			local var_42_2 = var_0_1(var_36_1, arg_42_0, arg_42_1)

			var_42_2.initHPRate = var_42_1

			table.insert(arg_36_0.mainShips, arg_42_0)
			table.insert(arg_42_2, var_42_2)
		end

		for iter_36_4, iter_36_5 in ipairs(var_36_13) do
			var_36_22(iter_36_5, var_36_16, var_36_0.MainUnitList)
		end

		for iter_36_6, iter_36_7 in ipairs(var_36_14) do
			var_36_22(iter_36_7, var_36_16, var_36_0.VanguardUnitList)
		end

		for iter_36_8, iter_36_9 in ipairs(var_36_15) do
			var_36_22(iter_36_9, var_36_17, var_36_0.SubUnitList)
		end

		local var_36_23 = var_36_7:getChapterSupportFleet()

		if var_36_23 then
			local var_36_24 = var_36_23:getShips()

			for iter_36_10, iter_36_11 in pairs(var_36_24) do
				var_36_22(iter_36_11, {}, var_36_0.SupportUnitList)
			end
		end

		arg_36_0.viewComponent:setFleet(var_36_13, var_36_14, var_36_15)
	elseif var_36_1 == SYSTEM_CHALLENGE then
		local var_36_25 = arg_36_0.contextData.mode
		local var_36_26 = getProxy(ChallengeProxy):getUserChallengeInfo(var_36_25)

		var_36_0.ChallengeInfo = var_36_26

		arg_36_0.viewComponent:setChapter(var_36_26)

		local var_36_27 = var_36_26:getRegularFleet()

		var_36_0.CommanderList = var_36_27:buildBattleBuffList()

		local var_36_28 = _.values(var_36_27:getCommanders())
		local var_36_29 = {}
		local var_36_30 = var_36_27:getShipsByTeam(TeamType.Main, false)
		local var_36_31 = var_36_27:getShipsByTeam(TeamType.Vanguard, false)
		local var_36_32 = {}
		local var_36_33 = var_36_26:getSubmarineFleet()
		local var_36_34 = var_36_33:getShipsByTeam(TeamType.Submarine, false)

		if #var_36_34 > 0 then
			var_36_0.SubFlag = 1
			var_36_0.TotalSubAmmo = 1
			var_36_29 = _.values(var_36_33:getCommanders())
			var_36_0.SubCommanderList = var_36_33:buildBattleBuffList()
		else
			var_36_0.SubFlag = 0
			var_36_0.TotalSubAmmo = 0
		end

		arg_36_0.mainShips = {}

		local function var_36_35(arg_43_0, arg_43_1, arg_43_2)
			local var_43_0 = arg_43_0.id
			local var_43_1 = arg_43_0.hpRant * 0.0001

			if table.contains(var_36_5, var_43_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = var_43_0

			local var_43_2 = var_0_1(var_36_1, arg_43_0, arg_43_1)

			var_43_2.initHPRate = var_43_1

			table.insert(arg_36_0.mainShips, arg_43_0)
			table.insert(arg_43_2, var_43_2)
		end

		for iter_36_12, iter_36_13 in ipairs(var_36_30) do
			var_36_35(iter_36_13, var_36_28, var_36_0.MainUnitList)
		end

		for iter_36_14, iter_36_15 in ipairs(var_36_31) do
			var_36_35(iter_36_15, var_36_28, var_36_0.VanguardUnitList)
		end

		for iter_36_16, iter_36_17 in ipairs(var_36_34) do
			var_36_35(iter_36_17, var_36_29, var_36_0.SubUnitList)
		end

		arg_36_0.viewComponent:setFleet(var_36_30, var_36_31, var_36_34)
	elseif var_36_1 == SYSTEM_WORLD then
		local var_36_36 = nowWorld()
		local var_36_37 = var_36_36:GetActiveMap()
		local var_36_38 = var_36_37:GetFleet()
		local var_36_39 = var_36_37:GetCell(var_36_38.row, var_36_38.column):GetStageEnemy()

		if arg_36_0.contextData.hpRate then
			var_36_0.RepressInfo = {
				repressEnemyHpRant = arg_36_0.contextData.hpRate
			}
		end

		var_36_0.AffixBuffList = table.mergeArray(var_36_39:GetBattleLuaBuffs(), var_36_37:GetBattleLuaBuffs(WorldMap.FactionEnemy, var_36_39))

		local function var_36_40(arg_44_0)
			local var_44_0 = {}

			for iter_44_0, iter_44_1 in ipairs(arg_44_0) do
				local var_44_1 = {
					id = ys.Battle.BattleDataFunction.SkillTranform(var_36_1, iter_44_1.id),
					level = iter_44_1.level
				}

				table.insert(var_44_0, var_44_1)
			end

			return var_44_0
		end

		var_36_0.DefeatCount = var_36_38:getDefeatCount()
		var_36_0.ChapterBuffIDs, var_36_0.CommanderList = var_36_37:getFleetBattleBuffs(var_36_38, true)
		var_36_0.MapAuraSkills = var_36_37:GetChapterAuraBuffs()
		var_36_0.MapAuraSkills = var_36_40(var_36_0.MapAuraSkills)
		var_36_0.MapAidSkills = {}

		local var_36_41 = var_36_37:GetChapterAidBuffs()

		for iter_36_18, iter_36_19 in pairs(var_36_41) do
			local var_36_42 = var_36_37:GetFleet(iter_36_18.fleetId)
			local var_36_43 = _.values(var_36_42:getCommanders(true))
			local var_36_44 = var_0_1(var_36_1, WorldConst.FetchShipVO(iter_36_18.id), var_36_43)

			table.insert(var_36_0.AidUnitList, var_36_44)

			var_36_0.MapAidSkills = table.mergeArray(var_36_0.MapAidSkills, var_36_40(iter_36_19))
		end

		local var_36_45 = var_36_38:GetTeamShipVOs(TeamType.Main, false)
		local var_36_46 = var_36_38:GetTeamShipVOs(TeamType.Vanguard, false)
		local var_36_47 = {}
		local var_36_48 = _.values(var_36_38:getCommanders(true))
		local var_36_49 = {}
		local var_36_50 = var_36_36:GetSubAidFlag()

		if var_36_50 == true then
			local var_36_51 = var_36_37:GetSubmarineFleet()

			var_36_0.SubFlag = 1
			var_36_0.TotalSubAmmo = 1
			var_36_47 = var_36_51:GetTeamShipVOs(TeamType.Submarine, false)
			var_36_49 = _.values(var_36_51:getCommanders(true))

			local var_36_52, var_36_53 = var_36_37:getFleetBattleBuffs(var_36_51, true)

			var_36_0.SubCommanderList = var_36_53
		else
			var_36_0.SubFlag = 0

			if var_36_50 ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				var_36_0.TotalSubAmmo = 0
			end
		end

		arg_36_0.mainShips = {}

		for iter_36_20, iter_36_21 in ipairs(var_36_45) do
			local var_36_54 = iter_36_21.id
			local var_36_55 = WorldConst.FetchWorldShip(iter_36_21.id).hpRant * 0.0001

			if table.contains(var_36_5, var_36_54) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = var_36_54

			local var_36_56 = var_0_1(var_36_1, iter_36_21, var_36_48)

			var_36_56.initHPRate = var_36_55

			table.insert(arg_36_0.mainShips, iter_36_21)
			table.insert(var_36_0.MainUnitList, var_36_56)
		end

		for iter_36_22, iter_36_23 in ipairs(var_36_46) do
			local var_36_57 = iter_36_23.id
			local var_36_58 = WorldConst.FetchWorldShip(iter_36_23.id).hpRant * 0.0001

			if table.contains(var_36_5, var_36_57) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = var_36_57

			local var_36_59 = var_0_1(var_36_1, iter_36_23, var_36_48)

			var_36_59.initHPRate = var_36_58

			table.insert(arg_36_0.mainShips, iter_36_23)
			table.insert(var_36_0.VanguardUnitList, var_36_59)
		end

		for iter_36_24, iter_36_25 in ipairs(var_36_47) do
			local var_36_60 = iter_36_25.id
			local var_36_61 = WorldConst.FetchWorldShip(iter_36_25.id).hpRant * 0.0001

			if table.contains(var_36_5, var_36_60) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = var_36_60

			local var_36_62 = var_0_1(var_36_1, iter_36_25, var_36_49)

			var_36_62.initHPRate = var_36_61

			table.insert(arg_36_0.mainShips, iter_36_25)
			table.insert(var_36_0.SubUnitList, var_36_62)
		end

		arg_36_0.viewComponent:setFleet(var_36_45, var_36_46, var_36_47)

		local var_36_63 = pg.expedition_data_template[arg_36_0.contextData.stageId]

		if var_36_63.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
			var_36_0.WorldMapId = var_36_37.config.expedition_map_id
			var_36_0.WorldLevel = WorldConst.WorldLevelCorrect(var_36_37.config.expedition_level, var_36_63.type)
		end
	elseif var_36_1 == SYSTEM_WORLD_BOSS then
		local var_36_64 = nowWorld():GetBossProxy()
		local var_36_65 = arg_36_0.contextData.bossId
		local var_36_66 = var_36_64:GetFleet(var_36_65)
		local var_36_67 = var_36_64:GetBossById(var_36_65)

		if arg_36_0.contextData.hpRate then
			var_36_0.RepressInfo = {
				repressEnemyHpRant = arg_36_0.contextData.hpRate
			}
		end

		local var_36_68 = _.values(var_36_66:getCommanders())

		var_36_0.CommanderList = var_36_66:buildBattleBuffList()
		arg_36_0.mainShips = var_36_4:getShipsByFleet(var_36_66)

		local var_36_69 = {}
		local var_36_70 = {}
		local var_36_71 = {}
		local var_36_72 = var_36_66:getTeamByName(TeamType.Main)

		for iter_36_26, iter_36_27 in ipairs(var_36_72) do
			if table.contains(var_36_5, iter_36_27) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = iter_36_27

			local var_36_73 = var_36_4:getShipById(iter_36_27)
			local var_36_74 = var_0_1(var_36_1, var_36_73, var_36_68)

			table.insert(var_36_69, var_36_73)
			table.insert(var_36_0.MainUnitList, var_36_74)
		end

		local var_36_75 = var_36_66:getTeamByName(TeamType.Vanguard)

		for iter_36_28, iter_36_29 in ipairs(var_36_75) do
			if table.contains(var_36_5, iter_36_29) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = iter_36_29

			local var_36_76 = var_36_4:getShipById(iter_36_29)
			local var_36_77 = var_0_1(var_36_1, var_36_76, var_36_68)

			table.insert(var_36_70, var_36_76)
			table.insert(var_36_0.VanguardUnitList, var_36_77)
		end

		arg_36_0.viewComponent:setFleet(var_36_69, var_36_70, var_36_71)

		var_36_0.MapAidSkills = {}

		if var_36_67 and var_36_67:IsSelf() then
			local var_36_78, var_36_79, var_36_80 = var_36_64.GetSupportValue()

			if var_36_78 then
				table.insert(var_36_0.MapAidSkills, {
					level = 1,
					id = var_36_80
				})
			end
		end
	elseif var_36_1 == SYSTEM_HP_SHARE_ACT_BOSS or var_36_1 == SYSTEM_ACT_BOSS or var_36_1 == SYSTEM_ACT_BOSS_SP or var_36_1 == SYSTEM_BOSS_EXPERIMENT then
		if arg_36_0.contextData.mainFleetId then
			local var_36_81 = getProxy(FleetProxy):getActivityFleets()[arg_36_0.contextData.actId]
			local var_36_82 = var_36_81[arg_36_0.contextData.mainFleetId]
			local var_36_83 = _.values(var_36_82:getCommanders())

			var_36_0.CommanderList = var_36_82:buildBattleBuffList()
			arg_36_0.mainShips = {}

			local var_36_84 = {}
			local var_36_85 = {}
			local var_36_86 = {}

			local function var_36_87(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
				if table.contains(var_36_5, arg_45_0) then
					BattleVertify.cloneShipVertiry = true
				end

				var_36_5[#var_36_5 + 1] = arg_45_0

				local var_45_0 = var_36_4:getShipById(arg_45_0)
				local var_45_1 = var_0_1(var_36_1, var_45_0, arg_45_1)

				table.insert(arg_36_0.mainShips, var_45_0)
				table.insert(arg_45_3, var_45_0)
				table.insert(arg_45_2, var_45_1)
			end

			local var_36_88 = var_36_82:getTeamByName(TeamType.Main)
			local var_36_89 = var_36_82:getTeamByName(TeamType.Vanguard)

			for iter_36_30, iter_36_31 in ipairs(var_36_88) do
				var_36_87(iter_36_31, var_36_83, var_36_0.MainUnitList, var_36_84)
			end

			for iter_36_32, iter_36_33 in ipairs(var_36_89) do
				var_36_87(iter_36_33, var_36_83, var_36_0.VanguardUnitList, var_36_85)
			end

			local var_36_90 = var_36_81[arg_36_0.contextData.mainFleetId + 10]
			local var_36_91 = _.values(var_36_90:getCommanders())
			local var_36_92 = var_36_90:getTeamByName(TeamType.Submarine)

			for iter_36_34, iter_36_35 in ipairs(var_36_92) do
				var_36_87(iter_36_35, var_36_91, var_36_0.SubUnitList, var_36_86)
			end

			local var_36_93 = getProxy(PlayerProxy):getRawData()
			local var_36_94 = getProxy(ActivityProxy):getActivityById(arg_36_0.contextData.actId)
			local var_36_95 = var_36_94:getConfig("config_id")
			local var_36_96 = pg.activity_event_worldboss[var_36_95].use_oil_limit[arg_36_0.contextData.mainFleetId]
			local var_36_97 = var_36_94:IsOilLimit(arg_36_0.contextData.stageId)
			local var_36_98 = 0
			local var_36_99 = var_36_3.oil_cost > 0

			local function var_36_100(arg_46_0, arg_46_1)
				if var_36_99 then
					local var_46_0 = arg_46_0:getEndCost().oil

					if arg_46_1 > 0 then
						local var_46_1 = arg_46_0:getStartCost().oil

						cost = math.clamp(arg_46_1 - var_46_1, 0, var_46_0)
					end

					var_36_98 = var_36_98 + var_46_0
				end
			end

			if var_36_1 == SYSTEM_ACT_BOSS_SP then
				local var_36_101 = getProxy(ActivityProxy):GetActivityBossRuntime(arg_36_0.contextData.actId).buffIds
				local var_36_102 = _.map(var_36_101, function(arg_47_0)
					return ActivityBossBuff.New({
						configId = arg_47_0
					})
				end)

				var_36_0.ExtraBuffList = _.map(_.select(var_36_102, function(arg_48_0)
					return arg_48_0:CastOnEnemy()
				end), function(arg_49_0)
					return arg_49_0:GetBuffID()
				end)
				var_36_0.ChapterBuffIDs = _.map(_.select(var_36_102, function(arg_50_0)
					return not arg_50_0:CastOnEnemy()
				end), function(arg_51_0)
					return arg_51_0:GetBuffID()
				end)
			else
				var_36_100(var_36_82, var_36_97 and var_36_96[1] or 0)
				var_36_100(var_36_90, var_36_97 and var_36_96[2] or 0)
			end

			if var_36_90:isLegalToFight() == true and (var_36_1 == SYSTEM_BOSS_EXPERIMENT or var_36_98 <= var_36_93.oil) then
				var_36_0.SubFlag = 1
				var_36_0.TotalSubAmmo = 1
			end

			var_36_0.SubCommanderList = var_36_90:buildBattleBuffList()

			arg_36_0.viewComponent:setFleet(var_36_84, var_36_85, var_36_86)
		end
	elseif var_36_1 == SYSTEM_GUILD then
		local var_36_103 = getProxy(GuildProxy):getRawData():GetActiveEvent():GetBossMission()
		local var_36_104 = var_36_103:GetMainFleet()
		local var_36_105 = _.values(var_36_104:getCommanders())

		var_36_0.CommanderList = var_36_104:BuildBattleBuffList()
		arg_36_0.mainShips = {}

		local var_36_106 = {}
		local var_36_107 = {}
		local var_36_108 = {}

		local function var_36_109(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
			local var_52_0 = var_0_1(var_36_1, arg_52_0, arg_52_1)

			table.insert(arg_36_0.mainShips, arg_52_0)
			table.insert(arg_52_3, arg_52_0)
			table.insert(arg_52_2, var_52_0)
		end

		local var_36_110 = {}
		local var_36_111 = {}
		local var_36_112 = var_36_104:GetShips()

		for iter_36_36, iter_36_37 in pairs(var_36_112) do
			local var_36_113 = iter_36_37.ship

			if var_36_113:getTeamType() == TeamType.Main then
				table.insert(var_36_110, var_36_113)
			elseif var_36_113:getTeamType() == TeamType.Vanguard then
				table.insert(var_36_111, var_36_113)
			end
		end

		for iter_36_38, iter_36_39 in ipairs(var_36_110) do
			var_36_109(iter_36_39, var_36_105, var_36_0.MainUnitList, var_36_106)
		end

		for iter_36_40, iter_36_41 in ipairs(var_36_111) do
			var_36_109(iter_36_41, var_36_105, var_36_0.VanguardUnitList, var_36_107)
		end

		local var_36_114 = var_36_103:GetSubFleet()
		local var_36_115 = _.values(var_36_114:getCommanders())
		local var_36_116 = {}
		local var_36_117 = var_36_114:GetShips()

		for iter_36_42, iter_36_43 in pairs(var_36_117) do
			local var_36_118 = iter_36_43.ship

			if var_36_118:getTeamType() == TeamType.Submarine then
				table.insert(var_36_116, var_36_118)
			end
		end

		for iter_36_44, iter_36_45 in ipairs(var_36_116) do
			var_36_109(iter_36_45, var_36_115, var_36_0.SubUnitList, var_36_108)
		end

		if #var_36_108 > 0 then
			var_36_0.SubFlag = 1
			var_36_0.TotalSubAmmo = 1
		end

		var_36_0.SubCommanderList = var_36_114:BuildBattleBuffList()

		arg_36_0.viewComponent:setFleet(var_36_106, var_36_107, var_36_108)
	elseif var_36_1 == SYSTEM_BOSS_RUSH or var_36_1 == SYSTEM_BOSS_RUSH_EX or var_36_1 == SYSTEM_BOSS_RUSH_COLLABRATE then
		local var_36_119 = getProxy(ActivityProxy):getActivityById(arg_36_0.contextData.actId):GetSeriesData()

		assert(var_36_119)

		local var_36_120 = var_36_119:GetStaegLevel() + 1
		local var_36_121 = var_36_119:GetMode()
		local var_36_122, var_36_123 = var_36_119:GetStageFleets(var_36_121, var_36_120)
		local var_36_124 = getProxy(FleetProxy):getActivityFleets()[arg_36_0.contextData.actId]

		arg_36_0.mainShips = {}

		local var_36_125 = {}
		local var_36_126 = {}
		local var_36_127 = {}

		local function var_36_128(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
			if table.contains(var_36_5, arg_53_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = arg_53_0

			local var_53_0 = var_36_4:getShipById(arg_53_0)
			local var_53_1 = var_0_1(var_36_1, var_53_0, arg_53_1)

			table.insert(arg_36_0.mainShips, var_53_0)
			table.insert(arg_53_3, var_53_0)
			table.insert(arg_53_2, var_53_1)
		end

		local var_36_129 = var_36_124[var_36_122]
		local var_36_130 = _.values(var_36_129:getCommanders())

		var_36_0.CommanderList = var_36_129:buildBattleBuffList()

		local var_36_131 = var_36_129:getTeamByName(TeamType.Main)
		local var_36_132 = var_36_129:getTeamByName(TeamType.Vanguard)

		for iter_36_46, iter_36_47 in ipairs(var_36_131) do
			var_36_128(iter_36_47, var_36_130, var_36_0.MainUnitList, var_36_125)
		end

		for iter_36_48, iter_36_49 in ipairs(var_36_132) do
			var_36_128(iter_36_49, var_36_130, var_36_0.VanguardUnitList, var_36_126)
		end

		local var_36_133 = var_36_124[var_36_123]
		local var_36_134 = _.values(var_36_133:getCommanders())

		var_36_0.SubCommanderList = var_36_133:buildBattleBuffList()

		local var_36_135 = var_36_133:getTeamByName(TeamType.Submarine)

		for iter_36_50, iter_36_51 in ipairs(var_36_135) do
			var_36_128(iter_36_51, var_36_134, var_36_0.SubUnitList, var_36_127)
		end

		local var_36_136 = getProxy(PlayerProxy):getRawData()
		local var_36_137 = 0
		local var_36_138 = var_36_119:GetOilLimit()
		local var_36_139 = var_36_3.oil_cost > 0

		local function var_36_140(arg_54_0, arg_54_1)
			local var_54_0 = 0

			if var_36_139 then
				local var_54_1 = arg_54_0:getStartCost().oil
				local var_54_2 = arg_54_0:getEndCost().oil

				var_54_0 = var_54_2

				if arg_54_1 > 0 then
					var_54_0 = math.clamp(arg_54_1 - var_54_1, 0, var_54_2)
				end
			end

			return var_54_0
		end

		local var_36_141 = var_36_137 + var_36_140(var_36_129, var_36_138[1]) + var_36_140(var_36_133, var_36_138[2])

		if var_36_133:isLegalToFight() == true and var_36_141 <= var_36_136.oil then
			var_36_0.SubFlag = 1
			var_36_0.TotalSubAmmo = 1
		end

		arg_36_0.viewComponent:setFleet(var_36_125, var_36_126, var_36_127)

		if var_36_1 == SYSTEM_BOSS_RUSH_COLLABRATE then
			var_36_0.ChapterBuffIDs = {}
			var_36_0.DALAidBuffIDs = {}

			local var_36_142 = var_36_119:getConfig("aid_buff")

			if var_36_119:GetBossHpRate() <= var_36_142[1] then
				table.insert(var_36_0.DALAidBuffIDs, var_36_142[2])
			end
		end
	elseif var_36_1 == SYSTEM_LIMIT_CHALLENGE then
		local var_36_143 = LimitChallengeConst.GetChallengeIDByStageID(arg_36_0.contextData.stageId)

		var_36_0.ExtraBuffList = AcessWithinNull(pg.expedition_constellation_challenge_template[var_36_143], "buff_id")

		local var_36_144 = FleetProxy.CHALLENGE_FLEET_ID
		local var_36_145 = FleetProxy.CHALLENGE_SUB_FLEET_ID
		local var_36_146 = getProxy(FleetProxy)
		local var_36_147 = var_36_146:getFleetById(var_36_144)
		local var_36_148 = var_36_146:getFleetById(var_36_145)

		arg_36_0.mainShips = {}

		local var_36_149 = {}
		local var_36_150 = {}
		local var_36_151 = {}

		local function var_36_152(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
			if table.contains(var_36_5, arg_55_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_36_5[#var_36_5 + 1] = arg_55_0

			local var_55_0 = var_36_4:getShipById(arg_55_0)
			local var_55_1 = var_0_1(var_36_1, var_55_0, arg_55_1)

			table.insert(arg_36_0.mainShips, var_55_0)
			table.insert(arg_55_3, var_55_0)
			table.insert(arg_55_2, var_55_1)
		end

		local var_36_153 = _.values(var_36_147:getCommanders())

		var_36_0.CommanderList = var_36_147:buildBattleBuffList()

		local var_36_154 = var_36_147:getTeamByName(TeamType.Main)
		local var_36_155 = var_36_147:getTeamByName(TeamType.Vanguard)

		for iter_36_52, iter_36_53 in ipairs(var_36_154) do
			var_36_152(iter_36_53, var_36_153, var_36_0.MainUnitList, var_36_149)
		end

		for iter_36_54, iter_36_55 in ipairs(var_36_155) do
			var_36_152(iter_36_55, var_36_153, var_36_0.VanguardUnitList, var_36_150)
		end

		local var_36_156 = _.values(var_36_148:getCommanders())

		var_36_0.SubCommanderList = var_36_148:buildBattleBuffList()

		local var_36_157 = var_36_148:getTeamByName(TeamType.Submarine)

		for iter_36_56, iter_36_57 in ipairs(var_36_157) do
			var_36_152(iter_36_57, var_36_156, var_36_0.SubUnitList, var_36_151)
		end

		local var_36_158 = getProxy(PlayerProxy):getRawData()
		local var_36_159 = 0
		local var_36_160 = var_36_3.oil_cost > 0

		local function var_36_161(arg_56_0, arg_56_1)
			local var_56_0 = 0

			if var_36_160 then
				local var_56_1 = arg_56_0:getStartCost().oil
				local var_56_2 = arg_56_0:getEndCost().oil

				var_56_0 = var_56_2

				if arg_56_1 > 0 then
					var_56_0 = math.clamp(arg_56_1 - var_56_1, 0, var_56_2)
				end
			end

			return var_56_0
		end

		local var_36_162 = var_36_159 + var_36_161(var_36_147, 0) + var_36_161(var_36_148, 0)

		if var_36_148:isLegalToFight() == true and var_36_162 <= var_36_158.oil then
			var_36_0.SubFlag = 1
			var_36_0.TotalSubAmmo = 1
		end

		arg_36_0.viewComponent:setFleet(var_36_149, var_36_150, var_36_151)
	elseif var_36_1 == SYSTEM_CARDPUZZLE then
		local var_36_163 = {}
		local var_36_164 = {}
		local var_36_165 = arg_36_0.contextData.relics

		for iter_36_58, iter_36_59 in ipairs(arg_36_0.contextData.cardPuzzleFleet) do
			local var_36_166 = var_0_2(iter_36_59, var_36_165)
			local var_36_167 = var_36_166.fleetIndex

			if var_36_167 == 1 then
				table.insert(var_36_164, var_36_166)
				table.insert(var_36_0.VanguardUnitList, var_36_166)
			elseif var_36_167 == 2 then
				table.insert(var_36_163, var_36_166)
				table.insert(var_36_0.MainUnitList, var_36_166)
			end
		end

		var_36_0.CardPuzzleCardIDList = arg_36_0.contextData.cards
		var_36_0.CardPuzzleCommonHPValue = arg_36_0.contextData.hp
		var_36_0.CardPuzzleRelicList = var_36_165
		var_36_0.CardPuzzleCombatID = arg_36_0.contextData.puzzleCombatID
	elseif var_36_1 == SYSTEM_BOSS_SINGLE or var_36_1 == SYSTEM_BOSS_SINGLE_VARIABLE then
		if arg_36_0.contextData.mainFleetId then
			local var_36_168 = getProxy(FleetProxy):getActivityFleets()[arg_36_0.contextData.actId]
			local var_36_169 = var_36_168[arg_36_0.contextData.mainFleetId]
			local var_36_170 = _.values(var_36_169:getCommanders())

			var_36_0.CommanderList = var_36_169:buildBattleBuffList()
			arg_36_0.mainShips = {}

			local var_36_171 = {}
			local var_36_172 = {}
			local var_36_173 = {}

			local function var_36_174(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
				if table.contains(var_36_5, arg_57_0) then
					BattleVertify.cloneShipVertiry = true
				end

				var_36_5[#var_36_5 + 1] = arg_57_0

				local var_57_0 = var_36_4:getShipById(arg_57_0)
				local var_57_1 = var_0_1(var_36_1, var_57_0, arg_57_1)

				table.insert(arg_36_0.mainShips, var_57_0)
				table.insert(arg_57_3, var_57_0)
				table.insert(arg_57_2, var_57_1)
			end

			local var_36_175 = var_36_169:getTeamByName(TeamType.Main)
			local var_36_176 = var_36_169:getTeamByName(TeamType.Vanguard)

			for iter_36_60, iter_36_61 in ipairs(var_36_175) do
				var_36_174(iter_36_61, var_36_170, var_36_0.MainUnitList, var_36_171)
			end

			for iter_36_62, iter_36_63 in ipairs(var_36_176) do
				var_36_174(iter_36_63, var_36_170, var_36_0.VanguardUnitList, var_36_172)
			end

			local var_36_177 = var_36_1 == SYSTEM_BOSS_SINGLE_VARIABLE and 100 or 10
			local var_36_178 = var_36_168[arg_36_0.contextData.mainFleetId + var_36_177]

			if var_36_178 then
				local var_36_179 = _.values(var_36_178:getCommanders())
				local var_36_180 = var_36_178:getTeamByName(TeamType.Submarine)

				for iter_36_64, iter_36_65 in ipairs(var_36_180) do
					var_36_174(iter_36_65, var_36_179, var_36_0.SubUnitList, var_36_173)
				end
			end

			local var_36_181 = getProxy(PlayerProxy):getRawData()
			local var_36_182 = getProxy(ActivityProxy):getActivityById(arg_36_0.contextData.actId)

			var_36_0.ChapterBuffIDs = var_36_182:GetBuffIdsByStageId(arg_36_0.contextData.stageId)

			local var_36_183 = pg.strategy_data_template

			if arg_36_0.contextData.variableBuffList then
				for iter_36_66, iter_36_67 in ipairs(arg_36_0.contextData.variableBuffList) do
					table.insert(var_36_0.ChapterBuffIDs, var_36_183[iter_36_67].buff_id)
				end
			end

			local var_36_184 = var_36_182:GetEnemyDataByStageId(arg_36_0.contextData.stageId):GetOilLimit()
			local var_36_185 = 0
			local var_36_186 = var_36_3.oil_cost > 0

			local function var_36_187(arg_58_0, arg_58_1)
				if var_36_186 then
					local var_58_0 = arg_58_0:getEndCost().oil

					if arg_58_1 > 0 then
						local var_58_1 = arg_58_0:getStartCost().oil

						cost = math.clamp(arg_58_1 - var_58_1, 0, var_58_0)
					end

					var_36_185 = var_36_185 + var_58_0
				end
			end

			var_36_187(var_36_169, var_36_184[1] or 0)

			if var_36_178 then
				var_36_187(var_36_178, var_36_184[2] or 0)

				if var_36_178:isLegalToFight() == true and var_36_185 <= var_36_181.oil then
					var_36_0.SubFlag = 1
					var_36_0.TotalSubAmmo = 1
				end

				var_36_0.SubCommanderList = var_36_178:buildBattleBuffList()
			end

			arg_36_0.viewComponent:setFleet(var_36_171, var_36_172, var_36_173)
		end
	elseif var_36_1 == SYSTEM_SCENARIO_SUB_STRIKE then
		local var_36_188 = {}

		arg_36_0.mainShips = {}

		local function var_36_189(arg_59_0, arg_59_1, arg_59_2)
			for iter_59_0, iter_59_1 in ipairs(arg_59_0) do
				if table.contains(var_36_5, iter_59_1) then
					BattleVertify.cloneShipVertiry = true
				end

				var_36_5[#var_36_5 + 1] = iter_59_1

				local var_59_0 = var_36_4:getShipById(iter_59_1)
				local var_59_1 = var_0_1(var_36_1, var_59_0, nil)

				table.insert(arg_59_1, var_59_0)
				table.insert(arg_36_0.mainShips, var_59_0)
				table.insert(arg_59_2, var_59_1)
			end
		end

		local var_36_190 = getProxy(ChapterProxy):getActiveChapter()

		arg_36_0.viewComponent:setChapter(var_36_190)
		arg_36_0.viewComponent:setFleet(nil, nil, var_36_188)

		local var_36_191 = var_36_190:getChapterSupportFleet():getTeamByName(TeamType.Submarine)

		var_36_189(var_36_191, var_36_188, var_36_0.SubUnitList)
	elseif arg_36_0.contextData.mainFleetId then
		local var_36_192 = var_36_1 == SYSTEM_DUEL
		local var_36_193 = getProxy(FleetProxy)
		local var_36_194
		local var_36_195
		local var_36_196 = var_36_193:getFleetById(arg_36_0.contextData.mainFleetId)

		arg_36_0.mainShips = var_36_4:getShipsByFleet(var_36_196)

		local var_36_197 = {}
		local var_36_198 = {}
		local var_36_199 = {}

		local function var_36_200(arg_60_0, arg_60_1, arg_60_2)
			for iter_60_0, iter_60_1 in ipairs(arg_60_0) do
				if table.contains(var_36_5, iter_60_1) then
					BattleVertify.cloneShipVertiry = true
				end

				var_36_5[#var_36_5 + 1] = iter_60_1

				local var_60_0 = var_36_4:getShipById(iter_60_1)
				local var_60_1 = var_0_1(var_36_1, var_60_0, nil, var_36_192)

				table.insert(arg_60_1, var_60_0)
				table.insert(arg_60_2, var_60_1)
			end
		end

		local var_36_201 = var_36_196:getTeamByName(TeamType.Main)
		local var_36_202 = var_36_196:getTeamByName(TeamType.Vanguard)
		local var_36_203 = var_36_196:getTeamByName(TeamType.Submarine)

		var_36_200(var_36_201, var_36_197, var_36_0.MainUnitList)
		var_36_200(var_36_202, var_36_198, var_36_0.VanguardUnitList)
		var_36_200(var_36_203, var_36_199, var_36_0.SubUnitList)
		arg_36_0.viewComponent:setFleet(var_36_197, var_36_198, var_36_199)

		if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
			local var_36_204 = var_36_193:getFleetById(11)
			local var_36_205 = var_36_204:getTeamByName(TeamType.Submarine)

			if #var_36_205 > 0 then
				var_36_0.SubFlag = 1
				var_36_0.TotalSubAmmo = 1

				local var_36_206 = _.values(var_36_204:getCommanders())

				var_36_0.SubCommanderList = var_36_204:buildBattleBuffList()

				for iter_36_68, iter_36_69 in ipairs(var_36_205) do
					local var_36_207 = var_36_4:getShipById(iter_36_69)
					local var_36_208 = var_0_1(var_36_1, var_36_207, var_36_206, var_36_192)

					table.insert(var_36_199, var_36_207)
					table.insert(var_36_0.SubUnitList, var_36_208)
				end
			end
		end
	end

	if var_36_1 == SYSTEM_WORLD then
		local var_36_209 = nowWorld()
		local var_36_210 = var_36_209:GetActiveMap()
		local var_36_211 = var_36_210:GetFleet()
		local var_36_212 = var_36_210:GetCell(var_36_211.row, var_36_211.column):GetStageEnemy()
		local var_36_213 = pg.world_expedition_data[arg_36_0.contextData.stageId]
		local var_36_214 = var_36_209:GetWorldMapDifficultyBuffLevel()

		var_36_0.EnemyMapRewards = {
			var_36_214[1] * (1 + var_36_213.expedition_sairenvalueA / 10000),
			var_36_214[2] * (1 + var_36_213.expedition_sairenvalueB / 10000),
			var_36_214[3] * (1 + var_36_213.expedition_sairenvalueC / 10000)
		}
		var_36_0.FleetMapRewards = var_36_209:GetWorldMapBuffLevel()
	end

	var_36_0.RivalMainUnitList, var_36_0.RivalVanguardUnitList = {}, {}

	local var_36_215

	if var_36_1 == SYSTEM_DUEL and arg_36_0.contextData.rivalId then
		local var_36_216 = getProxy(MilitaryExerciseProxy)

		var_36_215 = var_36_216:getRivalById(arg_36_0.contextData.rivalId)
		arg_36_0.oldRank = var_36_216:getSeasonInfo()
	end

	if var_36_215 then
		var_36_0.RivalVO = var_36_215

		local var_36_217 = 0

		for iter_36_70, iter_36_71 in ipairs(var_36_215.mainShips) do
			var_36_217 = var_36_217 + iter_36_71.level
		end

		for iter_36_72, iter_36_73 in ipairs(var_36_215.vanguardShips) do
			var_36_217 = var_36_217 + iter_36_73.level
		end

		BattleVertify = BattleVertify or {}
		BattleVertify.rivalLevel = var_36_217

		for iter_36_74, iter_36_75 in ipairs(var_36_215.mainShips) do
			if not iter_36_75.hpRant or iter_36_75.hpRant > 0 then
				local var_36_218 = var_0_1(var_36_1, iter_36_75, nil, true)

				if iter_36_75.hpRant then
					var_36_218.initHPRate = iter_36_75.hpRant * 0.0001
				end

				table.insert(var_36_0.RivalMainUnitList, var_36_218)
			end
		end

		for iter_36_76, iter_36_77 in ipairs(var_36_215.vanguardShips) do
			if not iter_36_77.hpRant or iter_36_77.hpRant > 0 then
				local var_36_219 = var_0_1(var_36_1, iter_36_77, nil, true)

				if iter_36_77.hpRant then
					var_36_219.initHPRate = iter_36_77.hpRant * 0.0001
				end

				table.insert(var_36_0.RivalVanguardUnitList, var_36_219)
			end
		end
	end

	local var_36_220 = arg_36_0.contextData.prefabFleet.main_unitList
	local var_36_221 = arg_36_0.contextData.prefabFleet.vanguard_unitList
	local var_36_222 = arg_36_0.contextData.prefabFleet.submarine_unitList

	if var_36_220 then
		for iter_36_78, iter_36_79 in ipairs(var_36_220) do
			local var_36_223 = {}

			for iter_36_80, iter_36_81 in ipairs(iter_36_79.equipment) do
				var_36_223[#var_36_223 + 1] = {
					skin = 0,
					id = iter_36_81
				}
			end

			local var_36_224 = {
				id = iter_36_79.id,
				tmpID = iter_36_79.configId,
				skinId = iter_36_79.skinId,
				level = iter_36_79.level,
				equipment = var_36_223,
				properties = iter_36_79.properties,
				baseProperties = iter_36_79.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_36_79.skills
			}

			table.insert(var_36_0.MainUnitList, var_36_224)
		end
	end

	if var_36_221 then
		for iter_36_82, iter_36_83 in ipairs(var_36_221) do
			local var_36_225 = {}

			for iter_36_84, iter_36_85 in ipairs(iter_36_83.equipment) do
				var_36_225[#var_36_225 + 1] = {
					skin = 0,
					id = iter_36_85
				}
			end

			local var_36_226 = {
				id = iter_36_83.id,
				tmpID = iter_36_83.configId,
				skinId = iter_36_83.skinId,
				level = iter_36_83.level,
				equipment = var_36_225,
				properties = iter_36_83.properties,
				baseProperties = iter_36_83.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_36_83.skills
			}

			table.insert(var_36_0.VanguardUnitList, var_36_226)
		end
	end

	if var_36_222 then
		for iter_36_86, iter_36_87 in ipairs(var_36_222) do
			local var_36_227 = {}

			for iter_36_88, iter_36_89 in ipairs(iter_36_87.equipment) do
				var_36_227[#var_36_227 + 1] = {
					skin = 0,
					id = iter_36_89
				}
			end

			local var_36_228 = {
				id = iter_36_87.id,
				tmpID = iter_36_87.configId,
				skinId = iter_36_87.skinId,
				level = iter_36_87.level,
				equipment = var_36_227,
				properties = iter_36_87.properties,
				baseProperties = iter_36_87.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_36_87.skills
			}

			table.insert(var_36_0.SubUnitList, var_36_228)

			if var_36_1 == SYSTEM_SIMULATION and #var_36_0.SubUnitList > 0 then
				var_36_0.SubFlag = 1
				var_36_0.TotalSubAmmo = 1
			end
		end
	end
end

function var_0_0.listNotificationInterests(arg_61_0)
	return {
		GAME.FINISH_STAGE_DONE,
		GAME.FINISH_STAGE_ERROR,
		GAME.STORY_BEGIN,
		GAME.STORY_END,
		GAME.END_GUIDE,
		GAME.START_GUIDE,
		GAME.PAUSE_BATTLE,
		GAME.RESUME_BATTLE,
		var_0_0.CLOSE_CHAT,
		GAME.QUIT_BATTLE,
		var_0_0.HIDE_ALL_BUTTONS,
		var_0_0.UPDATE_AUTO_COUNT
	}
end

function var_0_0.handleNotification(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_1:getName()
	local var_62_1 = arg_62_1:getBody()
	local var_62_2 = ys.Battle.BattleState.GetInstance()
	local var_62_3 = arg_62_0.contextData.system

	if var_62_0 == GAME.FINISH_STAGE_DONE then
		pg.MsgboxMgr.GetInstance():hide()

		local var_62_4 = var_62_1.system

		if var_62_4 == SYSTEM_PROLOGUE then
			ys.Battle.BattleState.GetInstance():Deactive()
			arg_62_0:sendNotification(GAME.CHANGE_SCENE, SCENE.CREATE_PLAYER)
		elseif var_62_4 == SYSTEM_PERFORM or var_62_4 == SYSTEM_SIMULATION then
			ys.Battle.BattleState.GetInstance():Deactive()
			arg_62_0.viewComponent:exitBattle()

			if var_62_1.exitCallback then
				var_62_1.exitCallback()
			end
		else
			local var_62_5 = BattleResultMediator.GetResultView(var_62_4)
			local var_62_6 = {}

			if var_62_4 == SYSTEM_SCENARIO then
				var_62_6 = getProxy(ChapterProxy):getActiveChapter().operationBuffList
			end

			arg_62_0:addSubLayers(Context.New({
				mediator = NewBattleResultMediator,
				viewComponent = NewBattleResultScene,
				data = {
					system = var_62_4,
					rivalId = arg_62_0.contextData.rivalId,
					mainFleetId = arg_62_0.contextData.mainFleetId,
					stageId = arg_62_0.contextData.stageId,
					oldMainShips = arg_62_0.mainShips or {},
					oldPlayer = arg_62_0.player,
					oldRank = arg_62_0.oldRank,
					statistics = var_62_1.statistics,
					score = var_62_1.score,
					drops = var_62_1.drops,
					bossId = var_62_1.bossId,
					name = var_62_1.name,
					prefabFleet = var_62_1.prefabFleet,
					commanderExps = var_62_1.commanderExps,
					actId = arg_62_0.contextData.actId,
					result = var_62_1.result,
					extraDrops = var_62_1.extraDrops,
					extraBuffList = var_62_6,
					isLastBonus = var_62_1.isLastBonus,
					continuousBattleTimes = arg_62_0.contextData.continuousBattleTimes,
					totalBattleTimes = arg_62_0.contextData.totalBattleTimes,
					mode = arg_62_0.contextData.mode,
					cmdArgs = arg_62_0.contextData.cmdArgs,
					variableBuffList = arg_62_0.contextData.variableBuffList,
					useVariableTicket = arg_62_0.contextData.useVariableTicket
				}
			}))
		end
	elseif var_62_0 == GAME.STORY_BEGIN then
		var_62_2:Pause()
	elseif var_62_0 == GAME.STORY_END then
		var_62_2:Resume()
	elseif var_62_0 == GAME.START_GUIDE then
		var_62_2:Pause()
	elseif var_62_0 == GAME.END_GUIDE then
		var_62_2:Resume()
	elseif var_62_0 == GAME.PAUSE_BATTLE then
		if not var_62_2:IsPause() then
			arg_62_0:onPauseBtn()
		end
	elseif var_62_0 == GAME.RESUME_BATTLE then
		var_62_2:Resume()
	elseif var_62_0 == GAME.FINISH_STAGE_ERROR then
		gcAll(true)

		local var_62_7 = getProxy(ContextProxy)
		local var_62_8 = var_62_7:getContextByMediator(DailyLevelMediator)
		local var_62_9 = var_62_7:getContextByMediator(LevelMediator2)
		local var_62_10 = var_62_7:getContextByMediator(ChallengeMainMediator)
		local var_62_11 = var_62_7:getContextByMediator(ActivityBossMediatorTemplate)

		if var_62_8 then
			local var_62_12 = var_62_8:getContextByMediator(PreCombatMediator)

			var_62_8:removeChild(var_62_12)
		elseif var_62_10 then
			local var_62_13 = var_62_10:getContextByMediator(ChallengePreCombatMediator)

			var_62_10:removeChild(var_62_13)
		elseif var_62_9 then
			if var_62_3 == SYSTEM_DUEL then
				-- block empty
			elseif var_62_3 == SYSTEM_SCENARIO then
				local var_62_14 = var_62_9:getContextByMediator(ChapterPreCombatMediator)

				var_62_9:removeChild(var_62_14)
			elseif var_62_3 ~= SYSTEM_PERFORM and var_62_3 ~= SYSTEM_SIMULATION then
				local var_62_15 = var_62_9:getContextByMediator(PreCombatMediator)

				if var_62_15 then
					var_62_9:removeChild(var_62_15)
				end
			end
		elseif var_62_11 then
			local var_62_16 = var_62_11:getContextByMediator(PreCombatMediator)

			if var_62_16 then
				var_62_11:removeChild(var_62_16)
			end
		end

		arg_62_0:sendNotification(GAME.GO_BACK)
	elseif var_62_0 == var_0_0.CLOSE_CHAT then
		arg_62_0.viewComponent:OnCloseChat()
	elseif var_62_0 == var_0_0.HIDE_ALL_BUTTONS then
		ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name):DispatchEvent(ys.Event.New(ys.Battle.BattleEvent.HIDE_INTERACTABLE_BUTTONS, {
			isActive = var_62_1
		}))
	elseif var_62_0 == GAME.QUIT_BATTLE then
		var_62_2:Stop()
	elseif var_62_0 == var_0_0.UPDATE_AUTO_COUNT then
		arg_62_0:updateAutoCount(var_62_1)
	end
end

function var_0_0.remove(arg_63_0)
	pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(false)
end

return var_0_0

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
			useVariableTicket = arg_1_0.contextData.useVariableTicket
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
				form = NotificationLayer.FORM_BATTLE,
				chatViewParent = arg_6_1
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
		elseif var_1_1 == SYSTEM_BOSS_RUSH then
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

				var_1_2.LayerWeightMgr_weight = LayerWeightConst.BASE_LAYER

				arg_1_0:addSubLayers(Context.New({
					mediator = BossSingleContinuousOperationMediator,
					viewComponent = BossSingleContinuousOperationPanel,
					data = var_1_2
				}))
			end
		elseif not getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
			local var_1_3 = CreateShell(arg_1_0.contextData)

			var_1_3.LayerWeightMgr_weight = LayerWeightConst.BASE_LAYER

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
	else
		var_27_3 = i18n("battle_battleMediator_quest_exist")
	end

	local function var_27_6()
		if arg_27_1 then
			arg_27_1()
		end

		local var_29_0 = arg_27_0.viewComponent.leaveBtn:GetComponent(typeof(Animation))

		if var_29_0 then
			var_29_0:Play("msgbox_btn_into")
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

function var_0_0.guideDispatch(arg_30_0)
	return
end

local function var_0_1(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in ipairs(arg_31_1:getActiveEquipments()) do
		if iter_31_1 then
			var_31_0[#var_31_0 + 1] = {
				id = iter_31_1.configId,
				skin = iter_31_1.skinId,
				equipmentInfo = iter_31_1
			}
		else
			var_31_0[#var_31_0 + 1] = {
				skin = 0,
				id = iter_31_1,
				equipmentInfo = iter_31_1
			}
		end
	end

	local var_31_1 = {}

	local function var_31_2(arg_32_0)
		local var_32_0 = {
			level = arg_32_0.level
		}
		local var_32_1 = arg_32_0.id
		local var_32_2 = arg_31_1:RemapSkillId(var_32_1)

		var_32_0.id = ys.Battle.BattleDataFunction.SkillTranform(arg_31_0, var_32_2)

		return var_32_0
	end

	local var_31_3 = ys.Battle.BattleDataFunction.GenerateHiddenBuff(arg_31_1.configId)

	for iter_31_2, iter_31_3 in pairs(var_31_3) do
		local var_31_4 = var_31_2(iter_31_3)

		var_31_1[var_31_4.id] = var_31_4
	end

	for iter_31_4, iter_31_5 in pairs(arg_31_1.skills) do
		if iter_31_5 and iter_31_5.id == 14900 and not arg_31_1.transforms[16412] then
			-- block empty
		else
			local var_31_5 = var_31_2(iter_31_5)

			var_31_1[var_31_5.id] = var_31_5
		end
	end

	local var_31_6 = ys.Battle.BattleDataFunction.GetEquipSkill(var_31_0)

	for iter_31_6, iter_31_7 in ipairs(var_31_6) do
		local var_31_7 = {
			level = iter_31_7.buffLV,
			id = ys.Battle.BattleDataFunction.SkillTranform(arg_31_0, iter_31_7.buffID)
		}

		var_31_1[var_31_7.id] = var_31_7
	end

	local var_31_8

	;(function()
		var_31_8 = arg_31_1:GetSpWeapon()

		if not var_31_8 then
			return
		end

		local var_33_0 = var_31_8:GetEffect()

		if var_33_0 == 0 then
			return
		end

		local var_33_1 = {}

		var_33_1.level = 1
		var_33_1.id = ys.Battle.BattleDataFunction.SkillTranform(arg_31_0, var_33_0)
		var_31_1[var_33_1.id] = var_33_1
	end)()

	for iter_31_8, iter_31_9 in pairs(arg_31_1:getTriggerSkills()) do
		local var_31_9 = {
			level = iter_31_9.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(arg_31_0, iter_31_9.id)
		}

		var_31_1[var_31_9.id] = var_31_9
	end

	local var_31_10 = arg_31_0 == SYSTEM_WORLD
	local var_31_11 = false

	if var_31_10 then
		local var_31_12 = WorldConst.FetchWorldShip(arg_31_1.id)

		if var_31_12 then
			var_31_11 = var_31_12:IsBroken()
		end
	end

	if var_31_11 then
		for iter_31_10, iter_31_11 in pairs(var_31_1) do
			local var_31_13 = pg.skill_data_template[iter_31_10].world_death_mark[1]

			if var_31_13 == ys.Battle.BattleConst.DEATH_MARK_SKILL.DEACTIVE then
				var_31_1[iter_31_10] = nil
			elseif var_31_13 == ys.Battle.BattleConst.DEATH_MARK_SKILL.IGNORE then
				-- block empty
			end
		end
	end

	return {
		id = arg_31_1.id,
		tmpID = arg_31_1.configId,
		skinId = arg_31_1.skinId,
		level = arg_31_1.level,
		equipment = var_31_0,
		properties = arg_31_1:getProperties(arg_31_2, arg_31_3, var_31_10),
		baseProperties = arg_31_1:getShipProperties(),
		proficiency = arg_31_1:getEquipProficiencyList(),
		rarity = arg_31_1:getRarity(),
		intimacy = arg_31_1:getCVIntimacy(),
		shipGS = arg_31_1:getShipCombatPower(),
		skills = var_31_1,
		baseList = arg_31_1:getBaseList(),
		preloasList = arg_31_1:getPreLoadCount(),
		name = arg_31_1:getName(),
		deathMark = var_31_11,
		spWeapon = var_31_8
	}
end

local function var_0_2(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:getProperties(arg_34_1)
	local var_34_1 = arg_34_0:getConfig("id")

	return {
		deathMark = false,
		shipGS = 100,
		rarity = 1,
		intimacy = 100,
		id = var_34_1,
		tmpID = var_34_1,
		skinId = arg_34_0:getConfig("skin_id"),
		level = arg_34_0:getConfig("level"),
		equipment = arg_34_0:getConfig("default_equip"),
		properties = var_34_0,
		baseProperties = var_34_0,
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
		name = var_34_1,
		fleetIndex = arg_34_0:getConfig("location")
	}
end

function var_0_0.GenBattleData(arg_35_0)
	local var_35_0 = {}
	local var_35_1 = arg_35_0.contextData.system

	arg_35_0._battleData = var_35_0
	var_35_0.battleType = arg_35_0.contextData.system
	var_35_0.StageTmpId = arg_35_0.contextData.stageId
	var_35_0.CMDArgs = arg_35_0.contextData.cmdArgs
	var_35_0.isMemory = arg_35_0.contextData.memory
	var_35_0.MainUnitList = {}
	var_35_0.VanguardUnitList = {}
	var_35_0.SubUnitList = {}
	var_35_0.AidUnitList = {}
	var_35_0.SupportUnitList = {}
	var_35_0.SubFlag = -1
	var_35_0.ActID = arg_35_0.contextData.actId
	var_35_0.bossLevel = arg_35_0.contextData.bossLevel
	var_35_0.bossConfigId = arg_35_0.contextData.bossConfigId

	if pg.battle_cost_template[var_35_1].global_buff_effected > 0 then
		local var_35_2 = BuffHelper.GetBattleBuffs(var_35_1)

		var_35_0.GlobalBuffIDs = _.map(var_35_2, function(arg_36_0)
			return arg_36_0:getConfig("benefit_effect")
		end) or {}
	end

	local var_35_3 = pg.battle_cost_template[var_35_1]
	local var_35_4 = getProxy(BayProxy)
	local var_35_5 = {}

	if var_35_1 == SYSTEM_SCENARIO then
		local var_35_6 = getProxy(ChapterProxy)
		local var_35_7 = var_35_6:getActiveChapter()

		var_35_0.RepressInfo = var_35_7:getRepressInfo()

		arg_35_0.viewComponent:setChapter(var_35_7)

		local var_35_8 = var_35_7.fleet

		var_35_0.KizunaJamming = var_35_7.extraFlagList
		var_35_0.DefeatCount = var_35_8:getDefeatCount()
		var_35_0.ChapterBuffIDs, var_35_0.CommanderList = var_35_7:getFleetBattleBuffs(var_35_8)
		var_35_0.StageWaveFlags = var_35_7:GetStageFlags()
		var_35_0.ChapterWeatherIDS = var_35_7:GetWeather(var_35_8.line.row, var_35_8.line.column)
		var_35_0.MapAuraSkills = var_35_6.GetChapterAuraBuffs(var_35_7)
		var_35_0.MapAidSkills = {}

		local var_35_9 = var_35_6.GetChapterAidBuffs(var_35_7)

		for iter_35_0, iter_35_1 in pairs(var_35_9) do
			local var_35_10 = var_35_7:getFleetByShipVO(iter_35_0)
			local var_35_11 = _.values(var_35_10:getCommanders())
			local var_35_12 = var_0_1(var_35_1, iter_35_0, var_35_11)

			table.insert(var_35_0.AidUnitList, var_35_12)

			for iter_35_2, iter_35_3 in ipairs(iter_35_1) do
				table.insert(var_35_0.MapAidSkills, iter_35_3)
			end
		end

		local var_35_13 = var_35_8:getShipsByTeam(TeamType.Main, false)
		local var_35_14 = var_35_8:getShipsByTeam(TeamType.Vanguard, false)
		local var_35_15 = {}
		local var_35_16 = _.values(var_35_8:getCommanders())
		local var_35_17 = {}
		local var_35_18, var_35_19 = var_35_6.getSubAidFlag(var_35_7, arg_35_0.contextData.stageId)

		if var_35_18 == true or var_35_18 > 0 then
			var_35_0.SubFlag = 1
			var_35_0.TotalSubAmmo = 1
			var_35_15 = var_35_19:getShipsByTeam(TeamType.Submarine, false)
			var_35_17 = _.values(var_35_19:getCommanders())

			local var_35_20, var_35_21 = var_35_7:getFleetBattleBuffs(var_35_19)

			var_35_0.SubCommanderList = var_35_21
		else
			var_35_0.SubFlag = var_35_18

			if var_35_18 ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				var_35_0.TotalSubAmmo = 0
			end
		end

		arg_35_0.mainShips = {}

		local function var_35_22(arg_37_0, arg_37_1, arg_37_2)
			local var_37_0 = arg_37_0.id
			local var_37_1 = arg_37_0.hpRant * 0.0001

			if table.contains(var_35_5, var_37_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = var_37_0

			local var_37_2 = var_0_1(var_35_1, arg_37_0, arg_37_1)

			var_37_2.initHPRate = var_37_1

			table.insert(arg_35_0.mainShips, arg_37_0)
			table.insert(arg_37_2, var_37_2)
		end

		for iter_35_4, iter_35_5 in ipairs(var_35_13) do
			var_35_22(iter_35_5, var_35_16, var_35_0.MainUnitList)
		end

		for iter_35_6, iter_35_7 in ipairs(var_35_14) do
			var_35_22(iter_35_7, var_35_16, var_35_0.VanguardUnitList)
		end

		for iter_35_8, iter_35_9 in ipairs(var_35_15) do
			var_35_22(iter_35_9, var_35_17, var_35_0.SubUnitList)
		end

		local var_35_23 = var_35_7:getChapterSupportFleet()

		if var_35_23 then
			local var_35_24 = var_35_23:getShips()

			for iter_35_10, iter_35_11 in pairs(var_35_24) do
				var_35_22(iter_35_11, {}, var_35_0.SupportUnitList)
			end
		end

		arg_35_0.viewComponent:setFleet(var_35_13, var_35_14, var_35_15)
	elseif var_35_1 == SYSTEM_CHALLENGE then
		local var_35_25 = arg_35_0.contextData.mode
		local var_35_26 = getProxy(ChallengeProxy):getUserChallengeInfo(var_35_25)

		var_35_0.ChallengeInfo = var_35_26

		arg_35_0.viewComponent:setChapter(var_35_26)

		local var_35_27 = var_35_26:getRegularFleet()

		var_35_0.CommanderList = var_35_27:buildBattleBuffList()

		local var_35_28 = _.values(var_35_27:getCommanders())
		local var_35_29 = {}
		local var_35_30 = var_35_27:getShipsByTeam(TeamType.Main, false)
		local var_35_31 = var_35_27:getShipsByTeam(TeamType.Vanguard, false)
		local var_35_32 = {}
		local var_35_33 = var_35_26:getSubmarineFleet()
		local var_35_34 = var_35_33:getShipsByTeam(TeamType.Submarine, false)

		if #var_35_34 > 0 then
			var_35_0.SubFlag = 1
			var_35_0.TotalSubAmmo = 1
			var_35_29 = _.values(var_35_33:getCommanders())
			var_35_0.SubCommanderList = var_35_33:buildBattleBuffList()
		else
			var_35_0.SubFlag = 0
			var_35_0.TotalSubAmmo = 0
		end

		arg_35_0.mainShips = {}

		local function var_35_35(arg_38_0, arg_38_1, arg_38_2)
			local var_38_0 = arg_38_0.id
			local var_38_1 = arg_38_0.hpRant * 0.0001

			if table.contains(var_35_5, var_38_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = var_38_0

			local var_38_2 = var_0_1(var_35_1, arg_38_0, arg_38_1)

			var_38_2.initHPRate = var_38_1

			table.insert(arg_35_0.mainShips, arg_38_0)
			table.insert(arg_38_2, var_38_2)
		end

		for iter_35_12, iter_35_13 in ipairs(var_35_30) do
			var_35_35(iter_35_13, var_35_28, var_35_0.MainUnitList)
		end

		for iter_35_14, iter_35_15 in ipairs(var_35_31) do
			var_35_35(iter_35_15, var_35_28, var_35_0.VanguardUnitList)
		end

		for iter_35_16, iter_35_17 in ipairs(var_35_34) do
			var_35_35(iter_35_17, var_35_29, var_35_0.SubUnitList)
		end

		arg_35_0.viewComponent:setFleet(var_35_30, var_35_31, var_35_34)
	elseif var_35_1 == SYSTEM_WORLD then
		local var_35_36 = nowWorld()
		local var_35_37 = var_35_36:GetActiveMap()
		local var_35_38 = var_35_37:GetFleet()
		local var_35_39 = var_35_37:GetCell(var_35_38.row, var_35_38.column):GetStageEnemy()

		if arg_35_0.contextData.hpRate then
			var_35_0.RepressInfo = {
				repressEnemyHpRant = arg_35_0.contextData.hpRate
			}
		end

		var_35_0.AffixBuffList = table.mergeArray(var_35_39:GetBattleLuaBuffs(), var_35_37:GetBattleLuaBuffs(WorldMap.FactionEnemy, var_35_39))

		local function var_35_40(arg_39_0)
			local var_39_0 = {}

			for iter_39_0, iter_39_1 in ipairs(arg_39_0) do
				local var_39_1 = {
					id = ys.Battle.BattleDataFunction.SkillTranform(var_35_1, iter_39_1.id),
					level = iter_39_1.level
				}

				table.insert(var_39_0, var_39_1)
			end

			return var_39_0
		end

		var_35_0.DefeatCount = var_35_38:getDefeatCount()
		var_35_0.ChapterBuffIDs, var_35_0.CommanderList = var_35_37:getFleetBattleBuffs(var_35_38, true)
		var_35_0.MapAuraSkills = var_35_37:GetChapterAuraBuffs()
		var_35_0.MapAuraSkills = var_35_40(var_35_0.MapAuraSkills)
		var_35_0.MapAidSkills = {}

		local var_35_41 = var_35_37:GetChapterAidBuffs()

		for iter_35_18, iter_35_19 in pairs(var_35_41) do
			local var_35_42 = var_35_37:GetFleet(iter_35_18.fleetId)
			local var_35_43 = _.values(var_35_42:getCommanders(true))
			local var_35_44 = var_0_1(var_35_1, WorldConst.FetchShipVO(iter_35_18.id), var_35_43)

			table.insert(var_35_0.AidUnitList, var_35_44)

			var_35_0.MapAidSkills = table.mergeArray(var_35_0.MapAidSkills, var_35_40(iter_35_19))
		end

		local var_35_45 = var_35_38:GetTeamShipVOs(TeamType.Main, false)
		local var_35_46 = var_35_38:GetTeamShipVOs(TeamType.Vanguard, false)
		local var_35_47 = {}
		local var_35_48 = _.values(var_35_38:getCommanders(true))
		local var_35_49 = {}
		local var_35_50 = var_35_36:GetSubAidFlag()

		if var_35_50 == true then
			local var_35_51 = var_35_37:GetSubmarineFleet()

			var_35_0.SubFlag = 1
			var_35_0.TotalSubAmmo = 1
			var_35_47 = var_35_51:GetTeamShipVOs(TeamType.Submarine, false)
			var_35_49 = _.values(var_35_51:getCommanders(true))

			local var_35_52, var_35_53 = var_35_37:getFleetBattleBuffs(var_35_51, true)

			var_35_0.SubCommanderList = var_35_53
		else
			var_35_0.SubFlag = 0

			if var_35_50 ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				var_35_0.TotalSubAmmo = 0
			end
		end

		arg_35_0.mainShips = {}

		for iter_35_20, iter_35_21 in ipairs(var_35_45) do
			local var_35_54 = iter_35_21.id
			local var_35_55 = WorldConst.FetchWorldShip(iter_35_21.id).hpRant * 0.0001

			if table.contains(var_35_5, var_35_54) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = var_35_54

			local var_35_56 = var_0_1(var_35_1, iter_35_21, var_35_48)

			var_35_56.initHPRate = var_35_55

			table.insert(arg_35_0.mainShips, iter_35_21)
			table.insert(var_35_0.MainUnitList, var_35_56)
		end

		for iter_35_22, iter_35_23 in ipairs(var_35_46) do
			local var_35_57 = iter_35_23.id
			local var_35_58 = WorldConst.FetchWorldShip(iter_35_23.id).hpRant * 0.0001

			if table.contains(var_35_5, var_35_57) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = var_35_57

			local var_35_59 = var_0_1(var_35_1, iter_35_23, var_35_48)

			var_35_59.initHPRate = var_35_58

			table.insert(arg_35_0.mainShips, iter_35_23)
			table.insert(var_35_0.VanguardUnitList, var_35_59)
		end

		for iter_35_24, iter_35_25 in ipairs(var_35_47) do
			local var_35_60 = iter_35_25.id
			local var_35_61 = WorldConst.FetchWorldShip(iter_35_25.id).hpRant * 0.0001

			if table.contains(var_35_5, var_35_60) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = var_35_60

			local var_35_62 = var_0_1(var_35_1, iter_35_25, var_35_49)

			var_35_62.initHPRate = var_35_61

			table.insert(arg_35_0.mainShips, iter_35_25)
			table.insert(var_35_0.SubUnitList, var_35_62)
		end

		arg_35_0.viewComponent:setFleet(var_35_45, var_35_46, var_35_47)

		local var_35_63 = pg.expedition_data_template[arg_35_0.contextData.stageId]

		if var_35_63.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
			var_35_0.WorldMapId = var_35_37.config.expedition_map_id
			var_35_0.WorldLevel = WorldConst.WorldLevelCorrect(var_35_37.config.expedition_level, var_35_63.type)
		end
	elseif var_35_1 == SYSTEM_WORLD_BOSS then
		local var_35_64 = nowWorld():GetBossProxy()
		local var_35_65 = arg_35_0.contextData.bossId
		local var_35_66 = var_35_64:GetFleet(var_35_65)
		local var_35_67 = var_35_64:GetBossById(var_35_65)

		assert(var_35_67, var_35_65)

		if arg_35_0.contextData.hpRate then
			var_35_0.RepressInfo = {
				repressEnemyHpRant = arg_35_0.contextData.hpRate
			}
		end

		local var_35_68 = _.values(var_35_66:getCommanders())

		var_35_0.CommanderList = var_35_66:buildBattleBuffList()
		arg_35_0.mainShips = var_35_4:getShipsByFleet(var_35_66)

		local var_35_69 = {}
		local var_35_70 = {}
		local var_35_71 = {}
		local var_35_72 = var_35_66:getTeamByName(TeamType.Main)

		for iter_35_26, iter_35_27 in ipairs(var_35_72) do
			if table.contains(var_35_5, iter_35_27) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = iter_35_27

			local var_35_73 = var_35_4:getShipById(iter_35_27)
			local var_35_74 = var_0_1(var_35_1, var_35_73, var_35_68)

			table.insert(var_35_69, var_35_73)
			table.insert(var_35_0.MainUnitList, var_35_74)
		end

		local var_35_75 = var_35_66:getTeamByName(TeamType.Vanguard)

		for iter_35_28, iter_35_29 in ipairs(var_35_75) do
			if table.contains(var_35_5, iter_35_29) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = iter_35_29

			local var_35_76 = var_35_4:getShipById(iter_35_29)
			local var_35_77 = var_0_1(var_35_1, var_35_76, var_35_68)

			table.insert(var_35_70, var_35_76)
			table.insert(var_35_0.VanguardUnitList, var_35_77)
		end

		arg_35_0.viewComponent:setFleet(var_35_69, var_35_70, var_35_71)

		var_35_0.MapAidSkills = {}

		if var_35_67:IsSelf() then
			local var_35_78, var_35_79, var_35_80 = var_35_64.GetSupportValue()

			if var_35_78 then
				table.insert(var_35_0.MapAidSkills, {
					level = 1,
					id = var_35_80
				})
			end
		end
	elseif var_35_1 == SYSTEM_HP_SHARE_ACT_BOSS or var_35_1 == SYSTEM_ACT_BOSS or var_35_1 == SYSTEM_ACT_BOSS_SP or var_35_1 == SYSTEM_BOSS_EXPERIMENT then
		if arg_35_0.contextData.mainFleetId then
			local var_35_81 = getProxy(FleetProxy):getActivityFleets()[arg_35_0.contextData.actId]
			local var_35_82 = var_35_81[arg_35_0.contextData.mainFleetId]
			local var_35_83 = _.values(var_35_82:getCommanders())

			var_35_0.CommanderList = var_35_82:buildBattleBuffList()
			arg_35_0.mainShips = {}

			local var_35_84 = {}
			local var_35_85 = {}
			local var_35_86 = {}

			local function var_35_87(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
				if table.contains(var_35_5, arg_40_0) then
					BattleVertify.cloneShipVertiry = true
				end

				var_35_5[#var_35_5 + 1] = arg_40_0

				local var_40_0 = var_35_4:getShipById(arg_40_0)
				local var_40_1 = var_0_1(var_35_1, var_40_0, arg_40_1)

				table.insert(arg_35_0.mainShips, var_40_0)
				table.insert(arg_40_3, var_40_0)
				table.insert(arg_40_2, var_40_1)
			end

			local var_35_88 = var_35_82:getTeamByName(TeamType.Main)
			local var_35_89 = var_35_82:getTeamByName(TeamType.Vanguard)

			for iter_35_30, iter_35_31 in ipairs(var_35_88) do
				var_35_87(iter_35_31, var_35_83, var_35_0.MainUnitList, var_35_84)
			end

			for iter_35_32, iter_35_33 in ipairs(var_35_89) do
				var_35_87(iter_35_33, var_35_83, var_35_0.VanguardUnitList, var_35_85)
			end

			local var_35_90 = var_35_81[arg_35_0.contextData.mainFleetId + 10]
			local var_35_91 = _.values(var_35_90:getCommanders())
			local var_35_92 = var_35_90:getTeamByName(TeamType.Submarine)

			for iter_35_34, iter_35_35 in ipairs(var_35_92) do
				var_35_87(iter_35_35, var_35_91, var_35_0.SubUnitList, var_35_86)
			end

			local var_35_93 = getProxy(PlayerProxy):getRawData()
			local var_35_94 = getProxy(ActivityProxy):getActivityById(arg_35_0.contextData.actId)
			local var_35_95 = var_35_94:getConfig("config_id")
			local var_35_96 = pg.activity_event_worldboss[var_35_95].use_oil_limit[arg_35_0.contextData.mainFleetId]
			local var_35_97 = var_35_94:IsOilLimit(arg_35_0.contextData.stageId)
			local var_35_98 = 0
			local var_35_99 = var_35_3.oil_cost > 0

			local function var_35_100(arg_41_0, arg_41_1)
				if var_35_99 then
					local var_41_0 = arg_41_0:getEndCost().oil

					if arg_41_1 > 0 then
						local var_41_1 = arg_41_0:getStartCost().oil

						cost = math.clamp(arg_41_1 - var_41_1, 0, var_41_0)
					end

					var_35_98 = var_35_98 + var_41_0
				end
			end

			if var_35_1 == SYSTEM_ACT_BOSS_SP then
				local var_35_101 = getProxy(ActivityProxy):GetActivityBossRuntime(arg_35_0.contextData.actId).buffIds
				local var_35_102 = _.map(var_35_101, function(arg_42_0)
					return ActivityBossBuff.New({
						configId = arg_42_0
					})
				end)

				var_35_0.ExtraBuffList = _.map(_.select(var_35_102, function(arg_43_0)
					return arg_43_0:CastOnEnemy()
				end), function(arg_44_0)
					return arg_44_0:GetBuffID()
				end)
				var_35_0.ChapterBuffIDs = _.map(_.select(var_35_102, function(arg_45_0)
					return not arg_45_0:CastOnEnemy()
				end), function(arg_46_0)
					return arg_46_0:GetBuffID()
				end)
			else
				var_35_100(var_35_82, var_35_97 and var_35_96[1] or 0)
				var_35_100(var_35_90, var_35_97 and var_35_96[2] or 0)
			end

			if var_35_90:isLegalToFight() == true and (var_35_1 == SYSTEM_BOSS_EXPERIMENT or var_35_98 <= var_35_93.oil) then
				var_35_0.SubFlag = 1
				var_35_0.TotalSubAmmo = 1
			end

			var_35_0.SubCommanderList = var_35_90:buildBattleBuffList()

			arg_35_0.viewComponent:setFleet(var_35_84, var_35_85, var_35_86)
		end
	elseif var_35_1 == SYSTEM_GUILD then
		local var_35_103 = getProxy(GuildProxy):getRawData():GetActiveEvent():GetBossMission()
		local var_35_104 = var_35_103:GetMainFleet()
		local var_35_105 = _.values(var_35_104:getCommanders())

		var_35_0.CommanderList = var_35_104:BuildBattleBuffList()
		arg_35_0.mainShips = {}

		local var_35_106 = {}
		local var_35_107 = {}
		local var_35_108 = {}

		local function var_35_109(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
			local var_47_0 = var_0_1(var_35_1, arg_47_0, arg_47_1)

			table.insert(arg_35_0.mainShips, arg_47_0)
			table.insert(arg_47_3, arg_47_0)
			table.insert(arg_47_2, var_47_0)
		end

		local var_35_110 = {}
		local var_35_111 = {}
		local var_35_112 = var_35_104:GetShips()

		for iter_35_36, iter_35_37 in pairs(var_35_112) do
			local var_35_113 = iter_35_37.ship

			if var_35_113:getTeamType() == TeamType.Main then
				table.insert(var_35_110, var_35_113)
			elseif var_35_113:getTeamType() == TeamType.Vanguard then
				table.insert(var_35_111, var_35_113)
			end
		end

		for iter_35_38, iter_35_39 in ipairs(var_35_110) do
			var_35_109(iter_35_39, var_35_105, var_35_0.MainUnitList, var_35_106)
		end

		for iter_35_40, iter_35_41 in ipairs(var_35_111) do
			var_35_109(iter_35_41, var_35_105, var_35_0.VanguardUnitList, var_35_107)
		end

		local var_35_114 = var_35_103:GetSubFleet()
		local var_35_115 = _.values(var_35_114:getCommanders())
		local var_35_116 = {}
		local var_35_117 = var_35_114:GetShips()

		for iter_35_42, iter_35_43 in pairs(var_35_117) do
			local var_35_118 = iter_35_43.ship

			if var_35_118:getTeamType() == TeamType.Submarine then
				table.insert(var_35_116, var_35_118)
			end
		end

		for iter_35_44, iter_35_45 in ipairs(var_35_116) do
			var_35_109(iter_35_45, var_35_115, var_35_0.SubUnitList, var_35_108)
		end

		if #var_35_108 > 0 then
			var_35_0.SubFlag = 1
			var_35_0.TotalSubAmmo = 1
		end

		var_35_0.SubCommanderList = var_35_114:BuildBattleBuffList()

		arg_35_0.viewComponent:setFleet(var_35_106, var_35_107, var_35_108)
	elseif var_35_1 == SYSTEM_BOSS_RUSH or var_35_1 == SYSTEM_BOSS_RUSH_EX then
		local var_35_119 = getProxy(ActivityProxy):getActivityById(arg_35_0.contextData.actId):GetSeriesData()

		assert(var_35_119)

		local var_35_120 = var_35_119:GetStaegLevel() + 1
		local var_35_121 = var_35_119:GetFleetIds()
		local var_35_122 = var_35_121[var_35_120]
		local var_35_123 = var_35_121[#var_35_121]

		if var_35_119:GetMode() == BossRushSeriesData.MODE.SINGLE then
			var_35_122 = var_35_121[1]
		end

		local var_35_124 = getProxy(FleetProxy):getActivityFleets()[arg_35_0.contextData.actId]

		arg_35_0.mainShips = {}

		local var_35_125 = {}
		local var_35_126 = {}
		local var_35_127 = {}

		local function var_35_128(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
			if table.contains(var_35_5, arg_48_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = arg_48_0

			local var_48_0 = var_35_4:getShipById(arg_48_0)
			local var_48_1 = var_0_1(var_35_1, var_48_0, arg_48_1)

			table.insert(arg_35_0.mainShips, var_48_0)
			table.insert(arg_48_3, var_48_0)
			table.insert(arg_48_2, var_48_1)
		end

		local var_35_129 = var_35_124[var_35_122]
		local var_35_130 = _.values(var_35_129:getCommanders())

		var_35_0.CommanderList = var_35_129:buildBattleBuffList()

		local var_35_131 = var_35_129:getTeamByName(TeamType.Main)
		local var_35_132 = var_35_129:getTeamByName(TeamType.Vanguard)

		for iter_35_46, iter_35_47 in ipairs(var_35_131) do
			var_35_128(iter_35_47, var_35_130, var_35_0.MainUnitList, var_35_125)
		end

		for iter_35_48, iter_35_49 in ipairs(var_35_132) do
			var_35_128(iter_35_49, var_35_130, var_35_0.VanguardUnitList, var_35_126)
		end

		local var_35_133 = var_35_124[var_35_123]
		local var_35_134 = _.values(var_35_133:getCommanders())

		var_35_0.SubCommanderList = var_35_133:buildBattleBuffList()

		local var_35_135 = var_35_133:getTeamByName(TeamType.Submarine)

		for iter_35_50, iter_35_51 in ipairs(var_35_135) do
			var_35_128(iter_35_51, var_35_134, var_35_0.SubUnitList, var_35_127)
		end

		local var_35_136 = getProxy(PlayerProxy):getRawData()
		local var_35_137 = 0
		local var_35_138 = var_35_119:GetOilLimit()
		local var_35_139 = var_35_3.oil_cost > 0

		local function var_35_140(arg_49_0, arg_49_1)
			local var_49_0 = 0

			if var_35_139 then
				local var_49_1 = arg_49_0:getStartCost().oil
				local var_49_2 = arg_49_0:getEndCost().oil

				var_49_0 = var_49_2

				if arg_49_1 > 0 then
					var_49_0 = math.clamp(arg_49_1 - var_49_1, 0, var_49_2)
				end
			end

			return var_49_0
		end

		local var_35_141 = var_35_137 + var_35_140(var_35_129, var_35_138[1]) + var_35_140(var_35_133, var_35_138[2])

		if var_35_133:isLegalToFight() == true and var_35_141 <= var_35_136.oil then
			var_35_0.SubFlag = 1
			var_35_0.TotalSubAmmo = 1
		end

		arg_35_0.viewComponent:setFleet(var_35_125, var_35_126, var_35_127)
	elseif var_35_1 == SYSTEM_LIMIT_CHALLENGE then
		local var_35_142 = LimitChallengeConst.GetChallengeIDByStageID(arg_35_0.contextData.stageId)

		var_35_0.ExtraBuffList = AcessWithinNull(pg.expedition_constellation_challenge_template[var_35_142], "buff_id")

		local var_35_143 = FleetProxy.CHALLENGE_FLEET_ID
		local var_35_144 = FleetProxy.CHALLENGE_SUB_FLEET_ID
		local var_35_145 = getProxy(FleetProxy)
		local var_35_146 = var_35_145:getFleetById(var_35_143)
		local var_35_147 = var_35_145:getFleetById(var_35_144)

		arg_35_0.mainShips = {}

		local var_35_148 = {}
		local var_35_149 = {}
		local var_35_150 = {}

		local function var_35_151(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
			if table.contains(var_35_5, arg_50_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_35_5[#var_35_5 + 1] = arg_50_0

			local var_50_0 = var_35_4:getShipById(arg_50_0)
			local var_50_1 = var_0_1(var_35_1, var_50_0, arg_50_1)

			table.insert(arg_35_0.mainShips, var_50_0)
			table.insert(arg_50_3, var_50_0)
			table.insert(arg_50_2, var_50_1)
		end

		local var_35_152 = _.values(var_35_146:getCommanders())

		var_35_0.CommanderList = var_35_146:buildBattleBuffList()

		local var_35_153 = var_35_146:getTeamByName(TeamType.Main)
		local var_35_154 = var_35_146:getTeamByName(TeamType.Vanguard)

		for iter_35_52, iter_35_53 in ipairs(var_35_153) do
			var_35_151(iter_35_53, var_35_152, var_35_0.MainUnitList, var_35_148)
		end

		for iter_35_54, iter_35_55 in ipairs(var_35_154) do
			var_35_151(iter_35_55, var_35_152, var_35_0.VanguardUnitList, var_35_149)
		end

		local var_35_155 = _.values(var_35_147:getCommanders())

		var_35_0.SubCommanderList = var_35_147:buildBattleBuffList()

		local var_35_156 = var_35_147:getTeamByName(TeamType.Submarine)

		for iter_35_56, iter_35_57 in ipairs(var_35_156) do
			var_35_151(iter_35_57, var_35_155, var_35_0.SubUnitList, var_35_150)
		end

		local var_35_157 = getProxy(PlayerProxy):getRawData()
		local var_35_158 = 0
		local var_35_159 = var_35_3.oil_cost > 0

		local function var_35_160(arg_51_0, arg_51_1)
			local var_51_0 = 0

			if var_35_159 then
				local var_51_1 = arg_51_0:getStartCost().oil
				local var_51_2 = arg_51_0:getEndCost().oil

				var_51_0 = var_51_2

				if arg_51_1 > 0 then
					var_51_0 = math.clamp(arg_51_1 - var_51_1, 0, var_51_2)
				end
			end

			return var_51_0
		end

		local var_35_161 = var_35_158 + var_35_160(var_35_146, 0) + var_35_160(var_35_147, 0)

		if var_35_147:isLegalToFight() == true and var_35_161 <= var_35_157.oil then
			var_35_0.SubFlag = 1
			var_35_0.TotalSubAmmo = 1
		end

		arg_35_0.viewComponent:setFleet(var_35_148, var_35_149, var_35_150)
	elseif var_35_1 == SYSTEM_CARDPUZZLE then
		local var_35_162 = {}
		local var_35_163 = {}
		local var_35_164 = arg_35_0.contextData.relics

		for iter_35_58, iter_35_59 in ipairs(arg_35_0.contextData.cardPuzzleFleet) do
			local var_35_165 = var_0_2(iter_35_59, var_35_164)
			local var_35_166 = var_35_165.fleetIndex

			if var_35_166 == 1 then
				table.insert(var_35_163, var_35_165)
				table.insert(var_35_0.VanguardUnitList, var_35_165)
			elseif var_35_166 == 2 then
				table.insert(var_35_162, var_35_165)
				table.insert(var_35_0.MainUnitList, var_35_165)
			end
		end

		var_35_0.CardPuzzleCardIDList = arg_35_0.contextData.cards
		var_35_0.CardPuzzleCommonHPValue = arg_35_0.contextData.hp
		var_35_0.CardPuzzleRelicList = var_35_164
		var_35_0.CardPuzzleCombatID = arg_35_0.contextData.puzzleCombatID
	elseif var_35_1 == SYSTEM_BOSS_SINGLE or var_35_1 == SYSTEM_BOSS_SINGLE_VARIABLE then
		if arg_35_0.contextData.mainFleetId then
			local var_35_167 = getProxy(FleetProxy):getActivityFleets()[arg_35_0.contextData.actId]
			local var_35_168 = var_35_167[arg_35_0.contextData.mainFleetId]
			local var_35_169 = _.values(var_35_168:getCommanders())

			var_35_0.CommanderList = var_35_168:buildBattleBuffList()
			arg_35_0.mainShips = {}

			local var_35_170 = {}
			local var_35_171 = {}
			local var_35_172 = {}

			local function var_35_173(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
				if table.contains(var_35_5, arg_52_0) then
					BattleVertify.cloneShipVertiry = true
				end

				var_35_5[#var_35_5 + 1] = arg_52_0

				local var_52_0 = var_35_4:getShipById(arg_52_0)
				local var_52_1 = var_0_1(var_35_1, var_52_0, arg_52_1)

				table.insert(arg_35_0.mainShips, var_52_0)
				table.insert(arg_52_3, var_52_0)
				table.insert(arg_52_2, var_52_1)
			end

			local var_35_174 = var_35_168:getTeamByName(TeamType.Main)
			local var_35_175 = var_35_168:getTeamByName(TeamType.Vanguard)

			for iter_35_60, iter_35_61 in ipairs(var_35_174) do
				var_35_173(iter_35_61, var_35_169, var_35_0.MainUnitList, var_35_170)
			end

			for iter_35_62, iter_35_63 in ipairs(var_35_175) do
				var_35_173(iter_35_63, var_35_169, var_35_0.VanguardUnitList, var_35_171)
			end

			local var_35_176 = var_35_1 == SYSTEM_BOSS_SINGLE_VARIABLE and 100 or 10
			local var_35_177 = var_35_167[arg_35_0.contextData.mainFleetId + var_35_176]

			if var_35_177 then
				local var_35_178 = _.values(var_35_177:getCommanders())
				local var_35_179 = var_35_177:getTeamByName(TeamType.Submarine)

				for iter_35_64, iter_35_65 in ipairs(var_35_179) do
					var_35_173(iter_35_65, var_35_178, var_35_0.SubUnitList, var_35_172)
				end
			end

			local var_35_180 = getProxy(PlayerProxy):getRawData()
			local var_35_181 = getProxy(ActivityProxy):getActivityById(arg_35_0.contextData.actId)

			var_35_0.ChapterBuffIDs = var_35_181:GetBuffIdsByStageId(arg_35_0.contextData.stageId)

			local var_35_182 = pg.strategy_data_template

			if arg_35_0.contextData.variableBuffList then
				for iter_35_66, iter_35_67 in ipairs(arg_35_0.contextData.variableBuffList) do
					table.insert(var_35_0.ChapterBuffIDs, var_35_182[iter_35_67].buff_id)
				end
			end

			local var_35_183 = var_35_181:GetEnemyDataByStageId(arg_35_0.contextData.stageId):GetOilLimit()
			local var_35_184 = 0
			local var_35_185 = var_35_3.oil_cost > 0

			local function var_35_186(arg_53_0, arg_53_1)
				if var_35_185 then
					local var_53_0 = arg_53_0:getEndCost().oil

					if arg_53_1 > 0 then
						local var_53_1 = arg_53_0:getStartCost().oil

						cost = math.clamp(arg_53_1 - var_53_1, 0, var_53_0)
					end

					var_35_184 = var_35_184 + var_53_0
				end
			end

			var_35_186(var_35_168, var_35_183[1] or 0)

			if var_35_177 then
				var_35_186(var_35_177, var_35_183[2] or 0)

				if var_35_177:isLegalToFight() == true and var_35_184 <= var_35_180.oil then
					var_35_0.SubFlag = 1
					var_35_0.TotalSubAmmo = 1
				end

				var_35_0.SubCommanderList = var_35_177:buildBattleBuffList()
			end

			arg_35_0.viewComponent:setFleet(var_35_170, var_35_171, var_35_172)
		end
	elseif arg_35_0.contextData.mainFleetId then
		local var_35_187 = var_35_1 == SYSTEM_DUEL
		local var_35_188 = getProxy(FleetProxy)
		local var_35_189
		local var_35_190
		local var_35_191 = var_35_188:getFleetById(arg_35_0.contextData.mainFleetId)

		arg_35_0.mainShips = var_35_4:getShipsByFleet(var_35_191)

		local var_35_192 = {}
		local var_35_193 = {}
		local var_35_194 = {}

		local function var_35_195(arg_54_0, arg_54_1, arg_54_2)
			for iter_54_0, iter_54_1 in ipairs(arg_54_0) do
				if table.contains(var_35_5, iter_54_1) then
					BattleVertify.cloneShipVertiry = true
				end

				var_35_5[#var_35_5 + 1] = iter_54_1

				local var_54_0 = var_35_4:getShipById(iter_54_1)
				local var_54_1 = var_0_1(var_35_1, var_54_0, nil, var_35_187)

				table.insert(arg_54_1, var_54_0)
				table.insert(arg_54_2, var_54_1)
			end
		end

		local var_35_196 = var_35_191:getTeamByName(TeamType.Main)
		local var_35_197 = var_35_191:getTeamByName(TeamType.Vanguard)
		local var_35_198 = var_35_191:getTeamByName(TeamType.Submarine)

		var_35_195(var_35_196, var_35_192, var_35_0.MainUnitList)
		var_35_195(var_35_197, var_35_193, var_35_0.VanguardUnitList)
		var_35_195(var_35_198, var_35_194, var_35_0.SubUnitList)
		arg_35_0.viewComponent:setFleet(var_35_192, var_35_193, var_35_194)

		if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
			local var_35_199 = var_35_188:getFleetById(11)
			local var_35_200 = var_35_199:getTeamByName(TeamType.Submarine)

			if #var_35_200 > 0 then
				var_35_0.SubFlag = 1
				var_35_0.TotalSubAmmo = 1

				local var_35_201 = _.values(var_35_199:getCommanders())

				var_35_0.SubCommanderList = var_35_199:buildBattleBuffList()

				for iter_35_68, iter_35_69 in ipairs(var_35_200) do
					local var_35_202 = var_35_4:getShipById(iter_35_69)
					local var_35_203 = var_0_1(var_35_1, var_35_202, var_35_201, var_35_187)

					table.insert(var_35_194, var_35_202)
					table.insert(var_35_0.SubUnitList, var_35_203)
				end
			end
		end
	end

	if var_35_1 == SYSTEM_WORLD then
		local var_35_204 = nowWorld()
		local var_35_205 = var_35_204:GetActiveMap()
		local var_35_206 = var_35_205:GetFleet()
		local var_35_207 = var_35_205:GetCell(var_35_206.row, var_35_206.column):GetStageEnemy()
		local var_35_208 = pg.world_expedition_data[arg_35_0.contextData.stageId]
		local var_35_209 = var_35_204:GetWorldMapDifficultyBuffLevel()

		var_35_0.EnemyMapRewards = {
			var_35_209[1] * (1 + var_35_208.expedition_sairenvalueA / 10000),
			var_35_209[2] * (1 + var_35_208.expedition_sairenvalueB / 10000),
			var_35_209[3] * (1 + var_35_208.expedition_sairenvalueC / 10000)
		}
		var_35_0.FleetMapRewards = var_35_204:GetWorldMapBuffLevel()
	end

	var_35_0.RivalMainUnitList, var_35_0.RivalVanguardUnitList = {}, {}

	local var_35_210

	if var_35_1 == SYSTEM_DUEL and arg_35_0.contextData.rivalId then
		local var_35_211 = getProxy(MilitaryExerciseProxy)

		var_35_210 = var_35_211:getRivalById(arg_35_0.contextData.rivalId)
		arg_35_0.oldRank = var_35_211:getSeasonInfo()
	end

	if var_35_210 then
		var_35_0.RivalVO = var_35_210

		local var_35_212 = 0

		for iter_35_70, iter_35_71 in ipairs(var_35_210.mainShips) do
			var_35_212 = var_35_212 + iter_35_71.level
		end

		for iter_35_72, iter_35_73 in ipairs(var_35_210.vanguardShips) do
			var_35_212 = var_35_212 + iter_35_73.level
		end

		BattleVertify = BattleVertify or {}
		BattleVertify.rivalLevel = var_35_212

		for iter_35_74, iter_35_75 in ipairs(var_35_210.mainShips) do
			if not iter_35_75.hpRant or iter_35_75.hpRant > 0 then
				local var_35_213 = var_0_1(var_35_1, iter_35_75, nil, true)

				if iter_35_75.hpRant then
					var_35_213.initHPRate = iter_35_75.hpRant * 0.0001
				end

				table.insert(var_35_0.RivalMainUnitList, var_35_213)
			end
		end

		for iter_35_76, iter_35_77 in ipairs(var_35_210.vanguardShips) do
			if not iter_35_77.hpRant or iter_35_77.hpRant > 0 then
				local var_35_214 = var_0_1(var_35_1, iter_35_77, nil, true)

				if iter_35_77.hpRant then
					var_35_214.initHPRate = iter_35_77.hpRant * 0.0001
				end

				table.insert(var_35_0.RivalVanguardUnitList, var_35_214)
			end
		end
	end

	local var_35_215 = arg_35_0.contextData.prefabFleet.main_unitList
	local var_35_216 = arg_35_0.contextData.prefabFleet.vanguard_unitList
	local var_35_217 = arg_35_0.contextData.prefabFleet.submarine_unitList

	if var_35_215 then
		for iter_35_78, iter_35_79 in ipairs(var_35_215) do
			local var_35_218 = {}

			for iter_35_80, iter_35_81 in ipairs(iter_35_79.equipment) do
				var_35_218[#var_35_218 + 1] = {
					skin = 0,
					id = iter_35_81
				}
			end

			local var_35_219 = {
				id = iter_35_79.id,
				tmpID = iter_35_79.configId,
				skinId = iter_35_79.skinId,
				level = iter_35_79.level,
				equipment = var_35_218,
				properties = iter_35_79.properties,
				baseProperties = iter_35_79.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_35_79.skills
			}

			table.insert(var_35_0.MainUnitList, var_35_219)
		end
	end

	if var_35_216 then
		for iter_35_82, iter_35_83 in ipairs(var_35_216) do
			local var_35_220 = {}

			for iter_35_84, iter_35_85 in ipairs(iter_35_83.equipment) do
				var_35_220[#var_35_220 + 1] = {
					skin = 0,
					id = iter_35_85
				}
			end

			local var_35_221 = {
				id = iter_35_83.id,
				tmpID = iter_35_83.configId,
				skinId = iter_35_83.skinId,
				level = iter_35_83.level,
				equipment = var_35_220,
				properties = iter_35_83.properties,
				baseProperties = iter_35_83.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_35_83.skills
			}

			table.insert(var_35_0.VanguardUnitList, var_35_221)
		end
	end

	if var_35_217 then
		for iter_35_86, iter_35_87 in ipairs(var_35_217) do
			local var_35_222 = {}

			for iter_35_88, iter_35_89 in ipairs(iter_35_87.equipment) do
				var_35_222[#var_35_222 + 1] = {
					skin = 0,
					id = iter_35_89
				}
			end

			local var_35_223 = {
				id = iter_35_87.id,
				tmpID = iter_35_87.configId,
				skinId = iter_35_87.skinId,
				level = iter_35_87.level,
				equipment = var_35_222,
				properties = iter_35_87.properties,
				baseProperties = iter_35_87.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_35_87.skills
			}

			table.insert(var_35_0.SubUnitList, var_35_223)

			if var_35_1 == SYSTEM_SIMULATION and #var_35_0.SubUnitList > 0 then
				var_35_0.SubFlag = 1
				var_35_0.TotalSubAmmo = 1
			end
		end
	end
end

function var_0_0.listNotificationInterests(arg_55_0)
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

function var_0_0.handleNotification(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_1:getName()
	local var_56_1 = arg_56_1:getBody()
	local var_56_2 = ys.Battle.BattleState.GetInstance()
	local var_56_3 = arg_56_0.contextData.system

	if var_56_0 == GAME.FINISH_STAGE_DONE then
		pg.MsgboxMgr.GetInstance():hide()

		local var_56_4 = var_56_1.system

		if var_56_4 == SYSTEM_PROLOGUE then
			ys.Battle.BattleState.GetInstance():Deactive()
			arg_56_0:sendNotification(GAME.CHANGE_SCENE, SCENE.CREATE_PLAYER)
		elseif var_56_4 == SYSTEM_PERFORM or var_56_4 == SYSTEM_SIMULATION then
			ys.Battle.BattleState.GetInstance():Deactive()
			arg_56_0.viewComponent:exitBattle()

			if var_56_1.exitCallback then
				var_56_1.exitCallback()
			end
		else
			local var_56_5 = BattleResultMediator.GetResultView(var_56_4)
			local var_56_6 = {}

			if var_56_4 == SYSTEM_SCENARIO then
				var_56_6 = getProxy(ChapterProxy):getActiveChapter().operationBuffList
			end

			arg_56_0:addSubLayers(Context.New({
				mediator = NewBattleResultMediator,
				viewComponent = NewBattleResultScene,
				data = {
					system = var_56_4,
					rivalId = arg_56_0.contextData.rivalId,
					mainFleetId = arg_56_0.contextData.mainFleetId,
					stageId = arg_56_0.contextData.stageId,
					oldMainShips = arg_56_0.mainShips or {},
					oldPlayer = arg_56_0.player,
					oldRank = arg_56_0.oldRank,
					statistics = var_56_1.statistics,
					score = var_56_1.score,
					drops = var_56_1.drops,
					bossId = var_56_1.bossId,
					name = var_56_1.name,
					prefabFleet = var_56_1.prefabFleet,
					commanderExps = var_56_1.commanderExps,
					actId = arg_56_0.contextData.actId,
					result = var_56_1.result,
					extraDrops = var_56_1.extraDrops,
					extraBuffList = var_56_6,
					isLastBonus = var_56_1.isLastBonus,
					continuousBattleTimes = arg_56_0.contextData.continuousBattleTimes,
					totalBattleTimes = arg_56_0.contextData.totalBattleTimes,
					mode = arg_56_0.contextData.mode,
					cmdArgs = arg_56_0.contextData.cmdArgs,
					variableBuffList = arg_56_0.contextData.variableBuffList,
					useVariableTicket = arg_56_0.contextData.useVariableTicket
				}
			}))
		end
	elseif var_56_0 == GAME.STORY_BEGIN then
		var_56_2:Pause()
	elseif var_56_0 == GAME.STORY_END then
		var_56_2:Resume()
	elseif var_56_0 == GAME.START_GUIDE then
		var_56_2:Pause()
	elseif var_56_0 == GAME.END_GUIDE then
		var_56_2:Resume()
	elseif var_56_0 == GAME.PAUSE_BATTLE then
		if not var_56_2:IsPause() then
			arg_56_0:onPauseBtn()
		end
	elseif var_56_0 == GAME.RESUME_BATTLE then
		var_56_2:Resume()
	elseif var_56_0 == GAME.FINISH_STAGE_ERROR then
		gcAll(true)

		local var_56_7 = getProxy(ContextProxy)
		local var_56_8 = var_56_7:getContextByMediator(DailyLevelMediator)
		local var_56_9 = var_56_7:getContextByMediator(LevelMediator2)
		local var_56_10 = var_56_7:getContextByMediator(ChallengeMainMediator)
		local var_56_11 = var_56_7:getContextByMediator(ActivityBossMediatorTemplate)

		if var_56_8 then
			local var_56_12 = var_56_8:getContextByMediator(PreCombatMediator)

			var_56_8:removeChild(var_56_12)
		elseif var_56_10 then
			local var_56_13 = var_56_10:getContextByMediator(ChallengePreCombatMediator)

			var_56_10:removeChild(var_56_13)
		elseif var_56_9 then
			if var_56_3 == SYSTEM_DUEL then
				-- block empty
			elseif var_56_3 == SYSTEM_SCENARIO then
				local var_56_14 = var_56_9:getContextByMediator(ChapterPreCombatMediator)

				var_56_9:removeChild(var_56_14)
			elseif var_56_3 ~= SYSTEM_PERFORM and var_56_3 ~= SYSTEM_SIMULATION then
				local var_56_15 = var_56_9:getContextByMediator(PreCombatMediator)

				if var_56_15 then
					var_56_9:removeChild(var_56_15)
				end
			end
		elseif var_56_11 then
			local var_56_16 = var_56_11:getContextByMediator(PreCombatMediator)

			if var_56_16 then
				var_56_11:removeChild(var_56_16)
			end
		end

		arg_56_0:sendNotification(GAME.GO_BACK)
	elseif var_56_0 == var_0_0.CLOSE_CHAT then
		arg_56_0.viewComponent:OnCloseChat()
	elseif var_56_0 == var_0_0.HIDE_ALL_BUTTONS then
		ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name):DispatchEvent(ys.Event.New(ys.Battle.BattleEvent.HIDE_INTERACTABLE_BUTTONS, {
			isActive = var_56_1
		}))
	elseif var_56_0 == GAME.QUIT_BATTLE then
		var_56_2:Stop()
	elseif var_56_0 == var_0_0.UPDATE_AUTO_COUNT then
		arg_56_0:updateAutoCount(var_56_1)
	end
end

function var_0_0.remove(arg_57_0)
	pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(false)
end

return var_0_0

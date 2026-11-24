local var_0_0 = class("ActivityBossMediatorTemplate", import("view.base.ContextMediator"))

var_0_0.ON_SUBMIT_TASK = "ActivityBossMediatorTemplate ON_SUBMIT_TASK"
var_0_0.ON_RANK = "ActivityBossMediatorTemplate ON_RANK"
var_0_0.ON_PRECOMBAT = "ActivityBossMediatorTemplate ON_PRECOMBAT"
var_0_0.ON_EX_PRECOMBAT = "ActivityBossMediatorTemplate ON_EX_PRECOMBAT"
var_0_0.ON_SP_PRECOMBAT = "ActivityBossMediatorTemplate ON_SP_PRECOMBAT"
var_0_0.ON_COMMIT_FLEET = "ActivityBossMediatorTemplate ON_COMMIT_FLEET"
var_0_0.ON_FLEET_RECOMMEND = "ActivityBossMediatorTemplate ON_FLEET_RECOMMEND"
var_0_0.ON_FLEET_CLEAR = "ActivityBossMediatorTemplate ON_FLEET_CLEAR"
var_0_0.ON_OPEN_DOCK = "ActivityBossMediatorTemplate ON_OPEN_DOCK"
var_0_0.ON_FLEET_SHIPINFO = "ActivityBossMediatorTemplate ON_FLEET_SHIPINFO"
var_0_0.ON_SELECT_COMMANDER = "ActivityBossMediatorTemplate ON_SELECT_COMMANDER"
var_0_0.ON_PERFORM_COMBAT = "ActivityBossMediatorTemplate ON_PERFORM_COMBAT"
var_0_0.ONEN_BUFF_SELECT = "ActivityBossMediatorTemplate ONEN_BUFF_SELECT"
var_0_0.COMMANDER_FORMATION_OP = "ActivityBossMediatorTemplate COMMANDER_FORMATION_OP"
var_0_0.ON_COMMANDER_SKILL = "ActivityBossMediatorTemplate ON_COMMANDER_SKILL"

local var_0_1 = {
	"word_easy",
	"word_normal_junhe",
	"word_hard"
}

function var_0_0.GetPairedFleetIndex(arg_1_0)
	if arg_1_0 < Fleet.SUBMARINE_FLEET_ID then
		return arg_1_0 + 10
	else
		return arg_1_0 - 10
	end
end

function var_0_0.register(arg_2_0)
	arg_2_0.contextData.mediatorClass = arg_2_0.class
	arg_2_0.activityProxy = getProxy(ActivityProxy)
	arg_2_0.timeMgr = pg.TimeMgr.GetInstance()

	local var_2_0 = arg_2_0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

	if not var_2_0 then
		return
	end

	arg_2_0:BindEvent()

	local var_2_1 = getProxy(FleetProxy)

	arg_2_0:UpdateActivityData(var_2_0)

	arg_2_0.contextData.activityID = var_2_0 and var_2_0.id

	local var_2_2 = var_2_0:GetBossConfig()

	arg_2_0.contextData.TicketID = var_2_2:GetTicketID()
	arg_2_0.contextData.exStageID = var_2_2:GetEXStageID()
	arg_2_0.contextData.normalStageIDs = var_2_2:GetNormalStageIDs()
	arg_2_0.contextData.ticketInitPools = var_2_2:GetInitTicketPools()
	arg_2_0.contextData.useOilLimit = var_2_2:GetOilLimits()
	arg_2_0.contextData.DisplayItems = var_2_2:GetMilestoneRewards()
	arg_2_0.contextData.spStageID = var_2_2:GetSPStageID()

	arg_2_0:RequestAndUpdateView()

	local var_2_3 = var_2_1:getActivityFleets()[var_2_0.id]

	arg_2_0.contextData.actFleets = var_2_3

	local var_2_4 = var_2_0:GetBindPtActID()

	arg_2_0.contextData.ptActId = var_2_4

	local var_2_5 = arg_2_0.activityProxy:getActivityById(var_2_4)

	if var_2_5 then
		arg_2_0.contextData.ptData = ActivityBossPtData.New(var_2_5)
	else
		errorMsg("没有找到当期BossPT活动 activity_event_pt link_id 未找到id: " .. var_2_0.id)
	end

	local var_2_6 = arg_2_0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RANK)

	if var_2_6 and not var_2_6:isEnd() then
		local var_2_7 = getProxy(BillboardProxy)
		local var_2_8 = PowerRank.TYPE_ACT_BOSS_BATTLE
		local var_2_9 = var_2_6.id

		if var_2_7:canFetch(var_2_8, var_2_9) then
			arg_2_0:sendNotification(GAME.GET_POWERRANK, {
				type = var_2_8,
				activityId = var_2_9
			})
		else
			local var_2_10 = var_2_7:getRankList(var_2_8, var_2_9)

			arg_2_0:UpdateRankData(var_2_10)
		end
	end

	local var_2_11 = getProxy(CommanderProxy):getPrefabFleet()

	arg_2_0.viewComponent:setCommanderPrefabs(var_2_11)
	pg.GuildMsgBoxMgr.GetInstance():NotificationForBattle()
end

function var_0_0.BindEvent(arg_3_0)
	local var_3_0 = getProxy(FleetProxy)
	local var_3_1 = arg_3_0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

	assert(var_3_1)
	arg_3_0:bind(var_0_0.ON_RANK, function(arg_4_0)
		arg_3_0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			index = PowerRank.TYPE_ACT_BOSS_BATTLE
		})
	end)
	arg_3_0:bind(ActivityMediator.EVENT_PT_OPERATION, function(arg_5_0, arg_5_1)
		arg_3_0:sendNotification(GAME.ACT_NEW_PT, arg_5_1)
	end)
	arg_3_0:bind(var_0_0.ON_SUBMIT_TASK, function(arg_6_0, arg_6_1)
		arg_3_0:sendNotification(GAME.SUBMIT_TASK, arg_6_1)
	end)
	arg_3_0:bind(var_0_0.ON_PRECOMBAT, function(arg_7_0, arg_7_1)
		local var_7_0 = var_3_0:getActivityFleets()[var_3_1.id]

		if not var_7_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		var_7_0[arg_7_1]:RemoveUnusedItems()

		if var_7_0[arg_7_1]:isLegalToFight() ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_formation_unsatisfied"))

			return
		end

		var_7_0[arg_7_1 + 10]:RemoveUnusedItems()

		local var_7_1 = {
			var_7_0[arg_7_1],
			var_7_0[arg_7_1 + 10]
		}
		local var_7_2 = var_3_1.id

		if _.any(var_7_1, function(arg_8_0)
			local var_8_0, var_8_1 = arg_8_0:HaveShipsInEvent()

			if var_8_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_8_1)

				return true
			end

			return _.any(arg_8_0:getShipIds(), function(arg_9_0)
				local var_9_0 = getProxy(BayProxy):RawGetShipById(arg_9_0)

				if not var_9_0 then
					return
				end

				local var_9_1, var_9_2 = ShipStatus.ShipStatusCheck("inActivity", var_9_0, nil, {
					inActivity = var_7_2
				})

				if not var_9_1 then
					pg.TipsMgr.GetInstance():ShowTips(var_9_2)

					return true
				end
			end)
		end) then
			return
		end

		local var_7_3
		local var_7_4
		local var_7_5 = SYSTEM_ACT_BOSS
		local var_7_6 = arg_3_0.contextData.normalStageIDs[arg_7_1]
		local var_7_7 = arg_3_0.contextData.useOilLimit[arg_7_1]

		if not arg_3_0.contextData.activity:IsOilLimit(var_7_6) then
			var_7_7 = {
				0,
				0
			}
		end

		arg_3_0:addSubLayers(Context.New({
			mediator = ActivityBossPreCombatMediator,
			viewComponent = ActivityBossPreCombatLayer,
			data = {
				system = var_7_5,
				stageId = var_7_6,
				actId = var_3_1.id,
				fleets = var_7_1,
				costLimit = var_7_7,
				OnConfirm = function(arg_10_0)
					if not arg_3_0.contextData.activity:checkBattleTimeInBossAct() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

						return
					end

					local var_10_0 = getProxy(SettingsProxy):isTipActBossExchangeTicket()
					local var_10_1 = getProxy(PlayerProxy):getRawData():getResource(arg_3_0.contextData.TicketID) > 0 and (arg_3_0.contextData.stageTickets[var_7_6] or 0) <= 0

					if var_10_0 == nil and var_10_1 then
						local var_10_2 = Drop.New({
							type = DROP_TYPE_RESOURCE,
							id = arg_3_0.contextData.TicketID or 1
						}):getIcon()

						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							hideYes = true,
							noText = "text_inconsume",
							content = i18n("tip_exchange_ticket", i18n(var_0_1[arg_7_1])),
							custom = {
								{
									text = "text_consume",
									sound = SFX_CONFIRM,
									onCallback = function()
										getProxy(SettingsProxy):setActBossExchangeTicketTip(1)

										arg_3_0.contextData.ready2battleCb = arg_10_0

										arg_3_0:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET, {
											stageId = var_7_6
										})
									end,
									btnType = pg.MsgboxMgr.BUTTON_BLUE_WITH_ICON,
									iconName = {
										var_10_2
									}
								}
							},
							onNo = function()
								getProxy(SettingsProxy):setActBossExchangeTicketTip(0)
								arg_10_0()
							end,
							onClose = function()
								return
							end
						})
					else
						local var_10_3 = var_10_0 == 1

						if var_10_1 and var_10_3 then
							arg_3_0.contextData.ready2battleCb = arg_10_0

							arg_3_0:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET, {
								stageId = var_7_6
							})
						else
							arg_10_0()
						end
					end
				end
			},
			onRemoved = function()
				arg_3_0.viewComponent:updateEditPanel()
			end
		}))
	end)
	arg_3_0:bind(var_0_0.ON_EX_PRECOMBAT, function(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0 = var_3_0:getActivityFleets()[var_3_1.id]

		if not var_15_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		var_15_0[arg_15_1]:RemoveUnusedItems()

		if var_15_0[arg_15_1]:isLegalToFight() ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_formation_unsatisfied"))

			return
		end

		var_15_0[arg_15_1 + 10]:RemoveUnusedItems()

		local var_15_1 = {
			var_15_0[arg_15_1],
			var_15_0[arg_15_1 + 10]
		}
		local var_15_2 = var_3_1.id

		if _.any(var_15_1, function(arg_16_0)
			local var_16_0, var_16_1 = arg_16_0:HaveShipsInEvent()

			if var_16_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_16_1)

				return true
			end

			return _.any(arg_16_0:getShipIds(), function(arg_17_0)
				local var_17_0 = getProxy(BayProxy):RawGetShipById(arg_17_0)

				if not var_17_0 then
					return
				end

				local var_17_1, var_17_2 = ShipStatus.ShipStatusCheck("inActivity", var_17_0, nil, {
					inActivity = var_15_2
				})

				if not var_17_1 then
					pg.TipsMgr.GetInstance():ShowTips(var_17_2)

					return true
				end
			end)
		end) then
			return
		end

		seriesAsync({
			function(arg_18_0)
				local var_18_0 = "NG0017"

				if not arg_15_2 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_18_0) then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideNo = false,
						showStopRemind = true,
						hideYes = false,
						helps = pg.gametip.worldbossex_help.tip,
						type = MSGBOX_TYPE_HELP,
						stopRamindContent = i18n("dont_remind"),
						onYes = function()
							if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
								pg.m02:sendNotification(GAME.STORY_UPDATE, {
									storyId = var_18_0
								})
							end

							arg_18_0()
						end,
						onNo = function()
							if pg.MsgboxMgr.GetInstance().stopRemindToggle.isOn then
								pg.m02:sendNotification(GAME.STORY_UPDATE, {
									storyId = var_18_0
								})
							end
						end
					})
				else
					arg_18_0()
				end
			end,
			function(arg_21_0)
				local var_21_0
				local var_21_1
				local var_21_2 = arg_15_2 and SYSTEM_BOSS_EXPERIMENT or SYSTEM_HP_SHARE_ACT_BOSS
				local var_21_3 = arg_3_0.contextData.exStageID
				local var_21_4 = arg_3_0.contextData.useOilLimit[4]

				if not arg_3_0.contextData.activity:IsOilLimit(var_21_3) then
					var_21_4 = {
						0,
						0
					}
				end

				arg_3_0:addSubLayers(Context.New({
					mediator = ActivityBossPreCombatMediator,
					viewComponent = ActivityBossPreCombatLayer,
					data = {
						system = var_21_2,
						stageId = var_21_3,
						actId = var_3_1.id,
						fleets = var_15_1,
						costLimit = var_21_4,
						OnConfirm = function(arg_22_0)
							if not arg_3_0.contextData.activity:checkBattleTimeInBossAct() then
								pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

								return
							end

							arg_22_0()
						end
					}
				}))
			end
		})
	end)
	arg_3_0:bind(var_0_0.ON_SP_PRECOMBAT, function(arg_23_0, arg_23_1)
		local var_23_0 = var_3_0:getActivityFleets()[var_3_1.id]

		if not var_23_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_no_fleet"))

			return
		end

		var_23_0[arg_23_1]:RemoveUnusedItems()

		if var_23_0[arg_23_1]:isLegalToFight() ~= true then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_formation_unsatisfied"))

			return
		end

		var_23_0[arg_23_1 + 10]:RemoveUnusedItems()

		local var_23_1 = {
			var_23_0[arg_23_1],
			var_23_0[arg_23_1 + 10]
		}
		local var_23_2 = var_3_1.id

		if _.any(var_23_1, function(arg_24_0)
			local var_24_0, var_24_1 = arg_24_0:HaveShipsInEvent()

			if var_24_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_24_1)

				return true
			end

			return _.any(arg_24_0:getShipIds(), function(arg_25_0)
				local var_25_0 = getProxy(BayProxy):RawGetShipById(arg_25_0)

				if not var_25_0 then
					return
				end

				local var_25_1, var_25_2 = ShipStatus.ShipStatusCheck("inActivity", var_25_0, nil, {
					inActivity = var_23_2
				})

				if not var_25_1 then
					pg.TipsMgr.GetInstance():ShowTips(var_25_2)

					return true
				end
			end)
		end) then
			return
		end

		seriesAsync({
			function(arg_26_0)
				local var_26_0
				local var_26_1
				local var_26_2 = SYSTEM_ACT_BOSS_SP
				local var_26_3 = arg_3_0.contextData.spStageID
				local var_26_4 = {
					0,
					0
				}

				arg_3_0:addSubLayers(Context.New({
					mediator = ActivityBossPreCombatMediator,
					viewComponent = ActivityBossPreCombatLayer,
					data = {
						system = var_26_2,
						stageId = var_26_3,
						actId = var_3_1.id,
						fleets = var_23_1,
						costLimit = var_26_4,
						OnConfirm = function(arg_27_0)
							if not arg_3_0.contextData.activity:checkBattleTimeInBossAct() then
								pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

								return
							end

							arg_27_0()
						end
					}
				}))
			end
		})
	end)
	arg_3_0:bind(var_0_0.ON_COMMIT_FLEET, function()
		var_3_0:commitActivityFleet(var_3_1.id)
	end)
	arg_3_0:bind(var_0_0.ON_FLEET_RECOMMEND, function(arg_29_0, arg_29_1)
		var_3_0:recommendActivityFleet(var_3_1.id, arg_29_1)

		local var_29_0 = var_3_0:getActivityFleets()[var_3_1.id]

		arg_3_0.contextData.actFleets = var_29_0

		arg_3_0.viewComponent:updateEditPanel()
	end)
	arg_3_0:bind(var_0_0.ON_FLEET_CLEAR, function(arg_30_0, arg_30_1)
		local var_30_0 = var_3_0:getActivityFleets()[var_3_1.id]
		local var_30_1 = var_30_0[arg_30_1]

		var_30_1:clearFleet()
		var_3_0:updateActivityFleet(var_3_1.id, arg_30_1, var_30_1)

		arg_3_0.contextData.actFleets = var_30_0

		arg_3_0.viewComponent:updateEditPanel()
	end)
	arg_3_0:bind(var_0_0.ON_OPEN_DOCK, function(arg_31_0, arg_31_1)
		local var_31_0 = arg_31_1.fleetIndex
		local var_31_1 = arg_31_1.shipVO
		local var_31_2 = arg_31_1.fleet
		local var_31_3 = arg_31_1.teamType
		local var_31_4, var_31_5, var_31_6 = arg_3_0.getDockCallbackFuncs4ActicityFleet(var_31_1, var_31_0, var_31_3)

		arg_3_0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1,
			useBlackBlock = true,
			selectedMin = 0,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = var_31_1 ~= nil,
			teamFilter = var_31_3,
			leftTopInfo = i18n("word_formation"),
			onShip = var_31_4,
			confirmSelect = var_31_5,
			onSelected = var_31_6,
			hideTagFlags = setmetatable({
				inActivity = var_3_1.id
			}, {
				__index = ShipStatus.TAG_HIDE_ACTIVITY_BOSS
			}),
			otherSelectedIds = var_31_2,
			ignoredIds = pg.ShipFlagMgr.GetInstance():FilterShips({
				isActivityNpc = true
			})
		})
	end)
	arg_3_0:bind(var_0_0.ON_FLEET_SHIPINFO, function(arg_32_0, arg_32_1)
		arg_3_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_32_1.shipId,
			shipVOs = arg_32_1.shipVOs
		})
	end)
	arg_3_0:bind(var_0_0.COMMANDER_FORMATION_OP, function(arg_33_0, arg_33_1)
		arg_3_0:sendNotification(GAME.COMMANDER_FORMATION_OP, {
			data = arg_33_1
		})
	end)
	arg_3_0:bind(var_0_0.ON_COMMANDER_SKILL, function(arg_34_0, arg_34_1)
		arg_3_0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = arg_34_1
			}
		}))
	end)
	arg_3_0:bind(var_0_0.ON_SELECT_COMMANDER, function(arg_35_0, arg_35_1, arg_35_2)
		local var_35_0 = var_3_0:getActivityFleets()[var_3_1.id]
		local var_35_1 = var_35_0[arg_35_1]
		local var_35_2 = var_35_1:getCommanders()

		arg_3_0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDERCAT, {
			maxCount = 1,
			mode = CommanderCatScene.MODE_SELECT,
			activeCommander = var_35_2[arg_35_2],
			fleetType = CommanderCatScene.FLEET_TYPE_ACTBOSS,
			ignoredIds = {},
			onCommander = function(arg_36_0)
				return true
			end,
			onSelected = function(arg_37_0, arg_37_1)
				local var_37_0 = arg_37_0[1]
				local var_37_1 = getProxy(CommanderProxy):getCommanderById(var_37_0)

				for iter_37_0, iter_37_1 in pairs(var_35_0) do
					if iter_37_0 == arg_35_1 then
						for iter_37_2, iter_37_3 in pairs(var_35_2) do
							if iter_37_3.groupId == var_37_1.groupId and iter_37_2 ~= arg_35_2 then
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

								return
							end
						end
					elseif iter_37_0 == var_0_0.GetPairedFleetIndex(arg_35_1) then
						local var_37_2 = iter_37_1:getCommanders()

						for iter_37_4, iter_37_5 in pairs(var_37_2) do
							if var_37_0 == iter_37_5.id then
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_fleet_already"))

								return
							end
						end
					end
				end

				var_35_1:updateCommanderByPos(arg_35_2, var_37_1)
				var_3_0:updateActivityFleet(var_3_1.id, arg_35_1, var_35_1)
				arg_37_1()
			end,
			onQuit = function(arg_38_0)
				var_35_1:updateCommanderByPos(arg_35_2, nil)
				var_3_0:updateActivityFleet(var_3_1.id, arg_35_1, var_35_1)
				arg_38_0()
			end
		})
	end)
	arg_3_0:bind(var_0_0.ON_PERFORM_COMBAT, function(arg_39_0, arg_39_1, arg_39_2)
		arg_3_0:sendNotification(GAME.BEGIN_STAGE, {
			mainFleetId = 1,
			memory = true,
			system = SYSTEM_PERFORM,
			stageId = arg_39_1,
			exitCallback = arg_39_2
		})
	end)
	arg_3_0:bind(PreCombatMediator.BEGIN_STAGE_PROXY, function(arg_40_0, arg_40_1)
		arg_3_0:sendNotification(PreCombatMediator.BEGIN_STAGE_PROXY, {
			curFleetId = arg_40_1
		})
	end)
	arg_3_0:bind(var_0_0.ONEN_BUFF_SELECT, function(arg_41_0)
		local var_41_0 = ActivityBossBuffSelectLayer
		local var_41_1 = ActivityBossBuffSelectMediator

		;(function(arg_42_0)
			if not arg_42_0 or arg_42_0:isEnd() then
				return
			end

			local var_42_0 = arg_42_0:getConfig("config_client").buff_scene

			if not var_42_0 then
				return
			end

			var_41_0 = _G[var_42_0]
		end)(arg_3_0.contextData.activity)
		arg_3_0:addSubLayers(Context.New({
			mediator = var_41_1,
			viewComponent = var_41_0,
			data = {
				spEnemyInfo = arg_3_0.contextData.activity:GetBossConfig():GetSPEnemy(),
				score = arg_3_0.contextData.activity:GetHighestScore()
			}
		}))
	end)
end

function var_0_0.listNotificationInterests(arg_43_0)
	return {
		ActivityProxy.ACTIVITY_ADDED,
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.SUBMIT_TASK_DONE,
		PlayerProxy.UPDATED,
		GAME.BEGIN_STAGE_DONE,
		GAME.ACT_NEW_PT_DONE,
		GAME.ACT_BOSS_EXCHANGE_TICKET_DONE,
		GAME.GET_POWERRANK_DONE,
		ActivityBossBuffSelectMediator.ON_START,
		GAME.COMMANDER_ACTIVITY_FORMATION_OP_DONE,
		CommanderProxy.PREFAB_FLEET_UPDATE,
		GAME.START_CHAPTER_AUTO_DONE,
		GAME.END_CHAPTER_AUTO_DONE,
		GAME.ADD_CHAPTER_AUTO_TIME_DONE,
		GAME.ZERO_HOUR_OP_DONE
	}
end

function var_0_0.handleNotification(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1:getName()
	local var_44_1 = arg_44_1:getBody()

	if var_44_0 == ActivityProxy.ACTIVITY_ADDED or var_44_0 == ActivityProxy.ACTIVITY_UPDATED then
		if var_44_1.id == arg_44_0.contextData.ptActId then
			if arg_44_0.contextData.ptData then
				arg_44_0.contextData.ptData:Update(var_44_1)
			else
				arg_44_0.contextData.ptData = ActivityBossPtData.New(var_44_1)
			end

			arg_44_0:UpdateView()
		elseif var_44_1.id == arg_44_0.contextData.activityID then
			arg_44_0:UpdateActivityData(var_44_1)
			arg_44_0:UpdateView()
		end
	elseif var_44_0 == PlayerProxy.UPDATED then
		arg_44_0:RequestAndUpdateView()
	elseif var_44_0 == GAME.BEGIN_STAGE_DONE then
		arg_44_0.contextData.editFleet = nil

		if not getProxy(ContextProxy):getContextByMediator(PreCombatMediator) then
			arg_44_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_44_1)
		end
	elseif var_44_0 == GAME.ACT_BOSS_EXCHANGE_TICKET_DONE then
		if arg_44_0.contextData.ready2battleCb then
			arg_44_0.contextData.ready2battleCb()

			arg_44_0.contextData.ready2battleCb = nil
		end
	elseif var_44_0 == GAME.GET_POWERRANK_DONE then
		if var_44_1.type == PowerRank.TYPE_ACT_BOSS_BATTLE then
			arg_44_0:UpdateRankData(var_44_1.list)
		end
	elseif var_44_0 == GAME.ACT_NEW_PT_DONE then
		arg_44_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_44_1.awards)
	elseif var_44_0 == GAME.COMMANDER_ACTIVITY_FORMATION_OP_DONE then
		local var_44_2 = getProxy(FleetProxy):getActivityFleets()[var_44_1.actId]

		arg_44_0.contextData.actFleets = var_44_2

		arg_44_0.viewComponent:updateEditPanel()
		arg_44_0.viewComponent:updateCommanderFleet(var_44_2[var_44_1.fleetId])
	elseif var_44_0 == CommanderProxy.PREFAB_FLEET_UPDATE then
		local var_44_3 = getProxy(CommanderProxy):getPrefabFleet()

		arg_44_0.viewComponent:setCommanderPrefabs(var_44_3)
		arg_44_0.viewComponent:updateCommanderPrefab()
	elseif var_44_0 == ActivityBossBuffSelectMediator.ON_START then
		arg_44_0.viewComponent:ShowSPFleet()
	elseif var_44_0 == GAME.START_CHAPTER_AUTO_DONE then
		arg_44_0.viewComponent:OnStartChapterAuto(var_44_1)
	elseif var_44_0 == GAME.END_CHAPTER_AUTO_DONE then
		arg_44_0.viewComponent:OnEndChapterAuto(var_44_1)
		arg_44_0:addSubLayers(Context.New({
			viewComponent = ChapterAutoTotalRewardLayer,
			mediator = ChapterAutoTotalRewardMediator,
			data = {
				rewards = var_44_1.awards,
				totalTimes = var_44_1.allCnt,
				finishTimes = var_44_1.finishCnt,
				proficiency = var_44_1.proficiency
			}
		}), true)
	elseif var_44_0 == GAME.ADD_CHAPTER_AUTO_TIME_DONE then
		arg_44_0.viewComponent:OnAddChapterAutoTimeDone(var_44_1)
	elseif var_44_0 == GAME.ZERO_HOUR_OP_DONE then
		arg_44_0.viewComponent:OnZeroHour(var_44_1)
	end
end

function var_0_0.RequestAndUpdateView(arg_45_0)
	arg_45_0:sendNotification(GAME.ACTIVITY_BOSS_PAGE_UPDATE, {
		activity_id = arg_45_0.contextData.activityID
	})
end

function var_0_0.UpdateView(arg_46_0)
	arg_46_0.viewComponent:UpdateView()
end

function var_0_0.UpdateRankData(arg_47_0, arg_47_1)
	arg_47_0.viewComponent:UpdateRank(arg_47_1)
end

function var_0_0.UpdateActivityData(arg_48_0, arg_48_1)
	arg_48_0.contextData.activity = arg_48_1
	arg_48_0.contextData.bossHP = arg_48_1:GetBossHP()
	arg_48_0.contextData.mileStones = arg_48_1:GetMileStones()
	arg_48_0.contextData.stageTickets = arg_48_1:GetTickets()
end

function var_0_0.getDockCallbackFuncs4ActicityFleet(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = getProxy(BayProxy)
	local var_49_1 = getProxy(FleetProxy)
	local var_49_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)
	local var_49_3 = var_49_1:getActivityFleets()[var_49_2.id][arg_49_1]

	local function var_49_4(arg_50_0, arg_50_1)
		local var_50_0, var_50_1 = ShipStatus.ShipStatusCheck("inActivity", arg_50_0, arg_50_1, {
			inActivity = var_49_2.id
		})

		if not var_50_0 then
			return var_50_0, var_50_1
		end

		if arg_49_0 and arg_49_0:isSameKind(arg_50_0) then
			return true
		end

		for iter_50_0, iter_50_1 in ipairs(var_49_3.ships) do
			if arg_50_0:isSameKind(var_49_0:getShipById(iter_50_1)) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end

		return true
	end

	local function var_49_5(arg_51_0, arg_51_1, arg_51_2)
		arg_51_1()
	end

	local function var_49_6(arg_52_0)
		if arg_49_0 then
			var_49_3:removeShip(arg_49_0)
		end

		if #arg_52_0 > 0 then
			local var_52_0 = var_49_0:getShipById(arg_52_0[1])

			if not var_49_3:containShip(var_52_0) then
				var_49_3:insertShip(var_52_0, nil, arg_49_2)
			elseif arg_49_0 then
				var_49_3:insertShip(arg_49_0, nil, arg_49_2)
			end

			var_49_3:RemoveUnusedItems()
		end

		var_49_1:updateActivityFleet(var_49_2.id, arg_49_1, var_49_3)
	end

	return var_49_4, var_49_5, var_49_6
end

return var_0_0

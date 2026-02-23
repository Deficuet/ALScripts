local var_0_0 = class("BossRushFleetSelectMediator", import("view.base.ContextMediator"))

var_0_0.ON_OPEN_DECK = "BossRushFleetSelectMediator:ON_OPEN_DECK"
var_0_0.ON_FLEET_SHIPINFO = "BossRushFleetSelectMediator:ON_FLEET_SHIPINFO"
var_0_0.ON_TRACE = "BossRushFleetSelectMediator:ON_TRACE"
var_0_0.ON_UPDATE_CUSTOM_FLEET = "BossRushFleetSelectMediator:ON_UPDATE_CUSTOM_FLEET"
var_0_0.ON_PRECOMBAT = "BossRushFleetSelectMediator:ON_PRECOMBAT"
var_0_0.ON_ELITE_RECOMMEND = "BossRushFleetSelectMediator:ON_ELITE_RECOMMEND"
var_0_0.ON_ELITE_CLEAR = "BossRushFleetSelectMediator:ON_ELITE_CLEAR"
var_0_0.OPEN_COMMANDER_PANEL = "BossRushFleetSelectMediator:OPEN_COMMANDER_PANEL"
var_0_0.ON_SELECT_COMMANDER = "BossRushFleetSelectMediator:ON_SELECT_COMMANDER"
var_0_0.ON_COMMANDER_SKILL = "BossRushFleetSelectMediator:ON_COMMANDER_SKILL"
var_0_0.ON_SWITCH_MODE = "BossRushFleetSelectMediator:ON_SWITCH_MODE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_OPEN_DECK, function(arg_2_0, arg_2_1)
		local var_2_0 = arg_2_1.fleetIndex
		local var_2_1 = arg_2_1.shipVO
		local var_2_2 = _.flatten(_.map(arg_1_0.contextData.fleets, function(arg_3_0)
			return arg_3_0:GetRawShipIds()
		end))
		local var_2_3 = arg_2_1.teamType
		local var_2_4, var_2_5, var_2_6 = arg_1_0.getDockCallbackFuncs(var_2_1, arg_1_0.contextData.fleets[var_2_0], var_2_3, var_2_2, arg_1_0.contextData.actId)

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 1,
			useBlackBlock = true,
			selectedMin = 0,
			energyDisplay = true,
			leastLimitMsg = i18n("ship_formationMediator_leastLimit"),
			quitTeam = var_2_1 ~= nil,
			teamFilter = var_2_3,
			leftTopInfo = i18n("word_formation"),
			onShip = var_2_4,
			confirmSelect = var_2_5,
			onSelected = var_2_6,
			hideTagFlags = setmetatable({
				inActivity = arg_1_0.contextData.actId
			}, {
				__index = ShipStatus.TAG_HIDE_ACTIVITY_BOSS
			}),
			otherSelectedIds = var_2_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_FLEET_SHIPINFO, function(arg_4_0, arg_4_1)
		local var_4_0 = arg_1_0.contextData.fleet

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
			shipId = arg_4_1.shipId,
			shipVOs = arg_4_1.shipVOs
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPDATE_CUSTOM_FLEET, function(arg_5_0)
		_.each(arg_1_0.contextData.fullFleets, function(arg_6_0)
			getProxy(FleetProxy):updateActivityFleet(arg_1_0.contextData.actId, arg_6_0.id, arg_6_0)
		end)

		local var_5_0 = {}

		_.each(arg_1_0.contextData.fullFleets, function(arg_7_0)
			var_5_0[arg_7_0.id] = arg_7_0
		end)
		arg_1_0:sendNotification(GAME.EDIT_ACTIVITY_FLEET, {
			actID = arg_1_0.contextData.actId,
			fleets = var_5_0
		})
	end)
	arg_1_0:bind(var_0_0.ON_TRACE, function(arg_8_0)
		arg_1_0.viewComponent:emit(var_0_0.ON_UPDATE_CUSTOM_FLEET)
		arg_1_0:sendNotification(GAME.BOSSRUSH_TRACE, {
			actId = arg_1_0.contextData.actId,
			seriesId = arg_1_0.contextData.seriesData.id,
			mode = arg_1_0.contextData.mode
		})
	end)
	arg_1_0:bind(var_0_0.ON_ELITE_RECOMMEND, function(arg_9_0, arg_9_1)
		local var_9_0 = arg_9_1.index
		local var_9_1 = arg_1_0.contextData.fleets[var_9_0]
		local var_9_2

		var_9_2 = var_9_0 == #arg_1_0.contextData.fleets

		local var_9_3 = table.shallowCopy(var_9_1:GetRawShipIds())
		local var_9_4 = underscore(arg_1_0.contextData.fleets):chain():map(function(arg_10_0)
			return arg_10_0:GetRawShipIds()
		end):flatten():value()
		local var_9_5 = getProxy(BayProxy):getRawData()

		local function var_9_6(arg_11_0, arg_11_1)
			local var_11_0 = TeamType.GetTeamShipMax(arg_11_1) - #underscore.filter(var_9_1:GetRawShipIds(), function(arg_12_0)
				return var_9_5[arg_12_0]:getTeamType() == arg_11_1
			end)
			local var_11_1 = getProxy(BayProxy):getActivityRecommendShips(arg_11_0, var_9_4, var_11_0, arg_1_0.contextData.actId)

			for iter_11_0, iter_11_1 in ipairs(var_11_1) do
				var_9_1:insertShip(iter_11_1, nil, iter_11_1:getTeamType())
				table.insert(var_9_3, iter_11_1.id)
				table.insert(var_9_4, iter_11_1.id)
			end
		end

		local var_9_7

		if var_9_0 == #arg_1_0.contextData.fleets then
			var_9_6(ShipType.SubShipType, TeamType.Submarine)
		else
			var_9_6(ShipType.MainShipType, TeamType.Main)
			var_9_6(ShipType.VanguardShipType, TeamType.Vanguard)
		end

		arg_1_0.viewComponent:updateEliteFleets()
	end)
	arg_1_0:bind(var_0_0.ON_ELITE_CLEAR, function(arg_13_0, arg_13_1)
		arg_1_0.contextData.fleets[arg_13_1.index]:clearFleet()
		arg_1_0.viewComponent:updateEliteFleets()
	end)
	arg_1_0:bind(var_0_0.ON_PRECOMBAT, function(arg_14_0)
		local var_14_0 = table.shallowCopy(arg_1_0.contextData.fleets)

		arg_1_0:addSubLayers(Context.New({
			mediator = BossRushPreCombatMediator,
			viewComponent = BossRushPreCombatLayer,
			data = {
				seriesData = arg_1_0.contextData.seriesData,
				actId = arg_1_0.contextData.actId,
				system = arg_1_0.contextData.system,
				mode = arg_1_0.contextData.mode,
				stageIds = arg_1_0.contextData.stageIds,
				fleets = var_14_0,
				fleetIndex = arg_1_0.contextData.fleetIndex
			}
		}), true)
	end)
	arg_1_0:bind(var_0_0.OPEN_COMMANDER_PANEL, function(arg_15_0, arg_15_1)
		arg_1_0:openCommanderPanel(arg_15_1, arg_1_0.contextData.fleetIndex)
	end)
	arg_1_0:bind(var_0_0.ON_SELECT_COMMANDER, function(arg_16_0, arg_16_1, arg_16_2)
		local var_16_0 = arg_1_0.contextData.fleets
		local var_16_1 = var_16_0[arg_16_1]
		local var_16_2 = var_16_1:getCommanders()

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDERCAT, {
			maxCount = 1,
			mode = CommanderCatScene.MODE_SELECT,
			activeCommander = var_16_2[arg_16_2],
			fleetType = CommanderCatScene.FLEET_TYPE_BOSSRUSH,
			fleets = var_16_0,
			ignoredIds = {},
			onCommander = function(arg_17_0)
				return true
			end,
			onSelected = function(arg_18_0, arg_18_1)
				local var_18_0 = arg_18_0[1]
				local var_18_1 = getProxy(CommanderProxy):getCommanderById(var_18_0)

				for iter_18_0, iter_18_1 in pairs(var_16_0) do
					if iter_18_0 == arg_16_1 then
						for iter_18_2, iter_18_3 in pairs(var_16_2) do
							if iter_18_3.groupId == var_18_1.groupId and iter_18_2 ~= arg_16_2 then
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_can_not_select_same_group"))

								return
							end
						end
					else
						local var_18_2 = iter_18_1:getCommanders()

						for iter_18_4, iter_18_5 in pairs(var_18_2) do
							if var_18_0 == iter_18_5.id then
								pg.TipsMgr.GetInstance():ShowTips(i18n("commander_is_in_fleet_already"))

								return
							end
						end
					end
				end

				var_16_1:updateCommanderByPos(arg_16_2, var_18_1)
				arg_18_1()
			end,
			onQuit = function(arg_19_0)
				var_16_1:updateCommanderByPos(arg_16_2, nil)
				arg_19_0()
			end
		})
	end)
	arg_1_0:bind(var_0_0.ON_COMMANDER_SKILL, function(arg_20_0, arg_20_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = CommanderSkillMediator,
			viewComponent = CommanderSkillLayer,
			data = {
				skill = arg_20_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_SWITCH_MODE, function(arg_21_0, arg_21_1)
		arg_1_0:OnSwitchMode(arg_21_1)
	end)

	local var_1_0 = arg_1_0.contextData.seriesData

	arg_1_0.contextData.stageIds = var_1_0:GetExpeditionIds()
	arg_1_0.contextData.fullFleets = var_1_0:GetFleets()

	if not arg_1_0.contextData.mode then
		local var_1_1 = "series_mode_flag" .. var_1_0.id
		local var_1_2 = PlayerPrefs.GetInt(var_1_1, -1)

		if var_1_2 ~= -1 then
			arg_1_0.contextData.mode = var_1_2
		end
	end

	arg_1_0.contextData.mode = arg_1_0.contextData.mode or BossRushSeriesData.MODE.MULTIPLE

	if not var_1_0:IsSingleFight() then
		arg_1_0.contextData.mode = BossRushSeriesData.MODE.MULTIPLE
	end

	local var_1_3 = arg_1_0.contextData.fullFleets

	if arg_1_0.contextData.mode == BossRushSeriesData.MODE.SINGLE then
		arg_1_0.contextData.fleets = {
			var_1_3[1],
			var_1_3[#var_1_3]
		}
	else
		arg_1_0.contextData.fleets = arg_1_0.contextData.fleets or underscore.rest(var_1_3)
	end

	arg_1_0.contextData.fleetIndex = arg_1_0.contextData.fleetIndex or 1

	if arg_1_0.contextData.fleetIndex > #arg_1_0.contextData.fleets then
		arg_1_0.contextData.fleetIndex = 1
	end

	if var_1_0.__cname == "CollabrateBossRushSeriesData" then
		arg_1_0.contextData.system = SYSTEM_BOSS_RUSH_COLLABRATE
	else
		local var_1_4 = var_1_0:GetType() == BossRushSeriesData.TYPE.EXTRA

		arg_1_0.contextData.system = not var_1_4 and SYSTEM_BOSS_RUSH or SYSTEM_BOSS_RUSH_EX
	end

	arg_1_0.contextData.actId = var_1_0.actId

	arg_1_0.viewComponent:setHardShipVOs(getProxy(BayProxy):getRawData())
end

function var_0_0.OnSwitchMode(arg_22_0, arg_22_1)
	assert(arg_22_1)

	local var_22_0 = arg_22_0.contextData.mode

	arg_22_0.contextData.mode = arg_22_1

	local var_22_1 = arg_22_0.contextData.fullFleets

	if arg_22_0.contextData.mode == BossRushSeriesData.MODE.SINGLE then
		if arg_22_1 ~= var_22_0 then
			if arg_22_0.contextData.fleetIndex < #arg_22_0.contextData.fleets then
				arg_22_0.contextData.fleetIndex = 1
			else
				arg_22_0.contextData.fleetIndex = 2
			end
		end

		arg_22_0.contextData.fleets = {
			var_22_1[1],
			var_22_1[#var_22_1]
		}
	else
		arg_22_0.contextData.fleets = underscore.rest(var_22_1)

		if arg_22_1 ~= var_22_0 and arg_22_0.contextData.fleetIndex == 2 then
			arg_22_0.contextData.fleetIndex = #arg_22_0.contextData.fleets
		end
	end

	local var_22_2 = "series_mode_flag" .. arg_22_0.contextData.seriesData.id

	PlayerPrefs.SetInt(var_22_2, arg_22_1)
end

function var_0_0.openCommanderPanel(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.contextData.actId

	arg_23_0:addSubLayers(Context.New({
		mediator = BossRushCMDFormationMediator,
		viewComponent = BossRushCMDFormationView,
		data = {
			fleet = arg_23_1,
			callback = function(arg_24_0)
				if arg_24_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
					arg_23_0.viewComponent:emit(var_0_0.ON_COMMANDER_SKILL, arg_24_0.skill)
				elseif arg_24_0.type == LevelUIConst.COMMANDER_OP_ADD then
					arg_23_0:closeCommanderPanel()
					arg_23_0.viewComponent:emit(var_0_0.ON_SELECT_COMMANDER, arg_23_2, arg_24_0.pos)
				else
					arg_23_0:sendNotification(GAME.COMMANDER_FORMATION_OP, {
						data = {
							FleetType = LevelUIConst.FLEET_TYPE_BOSSRUSH,
							data = arg_24_0,
							fleetId = arg_23_1.id,
							actId = var_23_0,
							fleets = arg_23_0.contextData.fleets
						}
					})
				end
			end
		}
	}))
end

function var_0_0.closeCommanderPanel(arg_25_0)
	local var_25_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossRushCMDFormationMediator)

	if var_25_0 then
		arg_25_0:sendNotification(GAME.REMOVE_LAYERS, {
			context = var_25_0
		})
	end
end

function var_0_0.listNotificationInterests(arg_26_0)
	return {
		GAME.COMMANDER_ACTIVITY_FORMATION_OP_DONE,
		BossRushPreCombatMediator.ON_FLEET_REFRESHED
	}
end

function var_0_0.handleNotification(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1:getName()
	local var_27_1 = arg_27_1:getBody()

	if var_27_0 == nil then
		-- block empty
	elseif var_27_0 == GAME.COMMANDER_ACTIVITY_FORMATION_OP_DONE then
		arg_27_0.viewComponent:updateEliteFleets()
	elseif var_27_0 == BossRushPreCombatMediator.ON_FLEET_REFRESHED then
		arg_27_0.viewComponent:updateEliteFleets()
	end
end

function var_0_0.remove(arg_28_0)
	return
end

function var_0_0.getDockCallbackFuncs(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4)
	local var_29_0 = getProxy(BayProxy)

	local function var_29_1(arg_30_0, arg_30_1)
		local var_30_0, var_30_1 = ShipStatus.ShipStatusCheck("inActivity", arg_30_0, arg_30_1, {
			inActivity = arg_29_4
		})

		if not var_30_0 then
			return var_30_0, var_30_1
		end

		if arg_29_0 and arg_29_0:isSameKind(arg_30_0) then
			return true
		end

		for iter_30_0, iter_30_1 in ipairs(arg_29_3) do
			if arg_30_0:isSameKind(var_29_0:getShipById(iter_30_1)) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end

		return true
	end

	local function var_29_2(arg_31_0, arg_31_1, arg_31_2)
		arg_31_1()
	end

	local function var_29_3(arg_32_0)
		if arg_29_0 then
			arg_29_1:removeShip(arg_29_0)
		end

		if #arg_32_0 > 0 then
			local var_32_0 = var_29_0:getShipById(arg_32_0[1])

			if not arg_29_1:containShip(var_32_0) then
				arg_29_1:insertShip(var_32_0, nil, arg_29_2)
			elseif arg_29_0 then
				arg_29_1:insertShip(arg_29_0, nil, arg_29_2)
			end

			arg_29_1:RemoveUnusedItems()
		end

		getProxy(FleetProxy):updateActivityFleet(arg_29_4, arg_29_1.id, arg_29_1)
	end

	return var_29_1, var_29_2, var_29_3
end

return var_0_0

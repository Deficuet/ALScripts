local var_0_0 = class("WSCommand", import(".WSBaseCommand"))
local var_0_1

function var_0_0.Bind(arg_1_0)
	var_0_1 = arg_1_0
end

function var_0_0.Unbind()
	var_0_1 = nil
end

function var_0_0.OpCall(arg_3_0, arg_3_1)
	arg_3_1(function()
		arg_3_0:OpDone()
	end)
end

function var_0_0.OpSwitchMap(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = nowWorld()

	arg_5_2 = defaultValue(arg_5_2, function()
		arg_5_0:OpInteractive()
	end)

	local var_5_1 = var_5_0:GetActiveMap()

	if not var_0_1:GetInMap() then
		arg_5_0:OpDone()
		arg_5_1:Apply()

		local var_5_2 = var_5_0:GetActiveEntrance()
		local var_5_3 = var_5_0:GetActiveMap()

		if World.ReplacementMapType(var_5_2, var_5_3) == "complete_chapter" and getProxy(SettingsProxy):GetWorldFlag("auto_save_area") then
			PlayerPrefs.SetInt("autoBotIsAcitve" .. AutoBotCommand.GetAutoBotMark(SYSTEM_WORLD), 1)
		end

		var_5_0:TriggerAutoFight(var_5_0.isAutoSwitch or World.ReplacementMapType(var_5_2, var_5_3) == "complete_chapter" and getProxy(SettingsProxy):GetWorldFlag("auto_save_area"))
		arg_5_0:OpSetInMap(true, arg_5_2)
	elseif arg_5_1.destMapId ~= var_5_1.id or arg_5_1.destGridId ~= var_5_1.gid then
		local var_5_4 = {}

		table.insert(var_5_4, function(arg_7_0)
			pg.UIMgr.GetInstance():BlurCamera(pg.UIMgr.CameraOverlay, true)
			var_0_1.wsTimer:AddInMapTimer(arg_7_0, 1, 1):Start()
		end)
		table.insert(var_5_4, function(arg_8_0)
			pg.UIMgr.GetInstance():UnblurCamera(pg.UIMgr.CameraOverlay)
			var_0_1:StopAnim()
			var_0_1:HideMap()
			var_0_1:HideMapUI()
			arg_8_0()
		end)
		table.insert(var_5_4, function(arg_9_0)
			arg_5_1:Apply()

			local var_9_0 = var_5_0:GetActiveEntrance()
			local var_9_1 = var_5_0:GetActiveMap()

			if World.ReplacementMapType(var_9_0, var_9_1) == "complete_chapter" and getProxy(SettingsProxy):GetWorldFlag("auto_save_area") then
				PlayerPrefs.SetInt("autoBotIsAcitve" .. AutoBotCommand.GetAutoBotMark(SYSTEM_WORLD), 1)
			end

			var_5_0:TriggerAutoFight(var_5_0.isAutoSwitch or World.ReplacementMapType(var_9_0, var_9_1) == "complete_chapter" and getProxy(SettingsProxy):GetWorldFlag("auto_save_area"))
			assert(var_9_1, "active map not exist")
			parallelAsync({
				function(arg_10_0)
					var_0_1:DisplayEnv(arg_10_0)
				end,
				function(arg_11_0)
					var_0_1:LoadMap(var_9_1, arg_11_0)
				end
			}, arg_9_0)
		end)
		table.insert(var_5_4, function(arg_12_0)
			var_0_1:DisplayMap()
			var_0_1:DisplayMapUI()
			var_0_1:UpdateMapUI()
			arg_12_0()
		end)
		table.insert(var_5_4, function(arg_13_0)
			var_0_1.wsTimer:AddInMapTimer(arg_13_0, 0.5, 1):Start()
		end)
		seriesAsync(var_5_4, function()
			arg_5_0:OpDone()

			return arg_5_2()
		end)
	else
		arg_5_0:OpDone()
		arg_5_1:Apply()
		var_0_1.wsDragProxy:Focus(var_0_1.wsMap:GetFleet().transform.position)

		return arg_5_2()
	end
end

function var_0_0.OpOpenLayer(arg_15_0, arg_15_1)
	arg_15_0:OpDone()
	var_0_1:emit(WorldMediator.OnOpenLayer, arg_15_1)
end

function var_0_0.OpOpenScene(arg_16_0, arg_16_1, ...)
	arg_16_0:OpDone()
	var_0_1:emit(WorldMediator.OnOpenScene, arg_16_1, ...)
end

function var_0_0.OpChangeScene(arg_17_0, arg_17_1, ...)
	arg_17_0:OpDone()
	var_0_1:emit(WorldMediator.OnChangeScene, arg_17_1, ...)
end

function var_0_0.OpInteractive(arg_18_0, arg_18_1)
	local var_18_0 = nowWorld()

	if var_18_0.forceLock then
		return
	end

	arg_18_0:OpDone()

	if var_0_1.contextData.inShop then
		var_0_1.contextData.inShop = false

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_shop_init_notice"),
			onYes = function()
				var_0_1:MoveAndOpenLayer({
					inMap = false,
					context = Context.New({
						mediator = WorldShopMediator,
						viewComponent = WorldShopLayer
					})
				})
			end,
			onNo = function()
				arg_18_0:OpInteractive()
			end
		})

		return
	end

	if var_18_0:GetRound() == WorldConst.RoundElse then
		arg_18_0:OpReqRound()

		return
	end

	var_0_1:InteractiveMoveQueue()

	if not var_0_1:GetInMap() then
		return
	end

	local var_18_1 = var_18_0:GetActiveMap()
	local var_18_2 = {}

	table.insert(var_18_2, function(arg_21_0)
		local var_21_0 = var_18_0:GetTaskProxy():getAutoSubmitTaskVO()

		if var_21_0 then
			arg_18_0:OpAutoSubmitTask(var_21_0)
		else
			arg_21_0()
		end
	end)
	table.insert(var_18_2, function(arg_22_0)
		if var_0_1:CheckEventForMsg() then
			local var_22_0 = getProxy(EventProxy)
			local var_22_1 = var_22_0.eventForMsg.id or 0
			local var_22_2 = pg.collection_template[var_22_1] and pg.collection_template[var_22_1].title or ""

			if var_18_0.isAutoFight then
				var_18_0:AddAutoInfo("message", i18n("autofight_entrust", var_22_2))
				arg_22_0()
			else
				local function var_22_3()
					arg_18_0:OpInteractive()
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					content = i18n("event_special_update", var_22_2),
					onYes = var_22_3,
					onNo = var_22_3
				})
			end

			var_22_0.eventForMsg = nil
		else
			arg_22_0()
		end
	end)
	table.insert(var_18_2, function(arg_24_0)
		local var_24_0 = pg.GuildMsgBoxMgr.GetInstance()

		if var_18_0.isAutoFight then
			if var_24_0:GetShouldShowBattleTip() then
				var_24_0:SubmitTask(function(arg_25_0, arg_25_1, arg_25_2)
					var_18_0:AddAutoInfo("message", i18n("autofight_task", pg.task_data_template[arg_25_2].desc))

					if arg_25_1 then
						if arg_25_0 then
							var_18_0:AddAutoInfo("message", i18n("guild_task_autoaccept_1", pg.task_data_template[arg_25_2].desc))
						end

						var_24_0:CancelShouldShowBattleTip()
						arg_24_0()
					else
						var_24_0:NotificationForWorld(arg_24_0)
					end
				end)
			else
				arg_24_0()
			end
		else
			var_24_0:NotificationForWorld(arg_24_0)
		end
	end)
	table.insert(var_18_2, function(arg_26_0)
		local var_26_0 = var_18_1.isLoss

		var_18_1.isLoss = false

		if var_26_0 then
			if WorldConst.IsRookieMap(var_18_1.id) then
				arg_18_0:OpStory(WorldConst.GetRookieBattleLoseStory(), true, false, false, function()
					arg_18_0:OpKillWorld()
				end)

				return
			elseif WorldGuider.GetInstance():PlayGuide("WorldG161") then
				var_18_0:TriggerAutoFight(false)
				arg_18_0:OpInteractive()

				return
			end
		end

		arg_26_0()
	end)
	table.insert(var_18_2, function(arg_28_0)
		if #var_0_1.achievedList > 0 then
			var_0_1:ShowSubView("Achievement", var_0_1.achievedList[1])
		else
			arg_28_0()
		end
	end)
	table.insert(var_18_2, function(arg_29_0)
		if #var_18_1.phaseDisplayList > 0 then
			var_0_1:DisplayPhaseAction(var_18_1.phaseDisplayList)
		else
			arg_29_0()
		end
	end)
	table.insert(var_18_2, function(arg_30_0)
		if var_18_1:CheckFleetSalvage() then
			arg_18_0:OpReqCatSalvage()
		else
			arg_30_0()
		end
	end)
	table.insert(var_18_2, function(arg_31_0)
		local var_31_0 = var_18_0:GetBossProxy()

		if not var_31_0:ShouldTipProgress() then
			arg_31_0()
		else
			var_31_0:ClearTipProgress()
			var_18_0:TriggerAutoFight(false)

			if WorldGuider.GetInstance():PlayGuide("WorldG190") then
				-- block empty
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("world_boss_get_item"),
					onYes = function()
						arg_18_0:OpOpenScene(SCENE.WORLDBOSS)
					end,
					onNo = function()
						arg_18_0:OpInteractive()
					end
				})
			end
		end
	end)
	table.insert(var_18_2, function(arg_34_0)
		local var_34_0 = var_18_1:CheckInteractive()

		if var_34_0 then
			local var_34_1 = var_18_1:GetFleet()

			if var_34_0.type == WorldMapAttachment.TypeEvent then
				if var_34_0:RemainOpEffect() then
					arg_18_0:OpEventOp(var_34_0)
				else
					arg_18_0:OpEvent(var_34_1, var_34_0)
				end
			elseif WorldMapAttachment.IsEnemyType(var_34_0.type) then
				if var_18_0.isAutoFight or arg_18_1 then
					local var_34_2 = var_34_0:GetBattleStageId()
					local var_34_3 = pg.expedition_data_template[var_34_2]

					assert(var_34_3, "expedition_data_template not exist: " .. var_34_2)

					if var_18_0:CheckSkipBattle() then
						arg_18_0:OpReqSkipBattle(var_34_1.id)
					elseif var_18_0.isAutoFight or PlayerPrefs.GetInt("world_skip_precombat", 0) == 1 then
						var_0_1:emit(WorldMediator.OnStart, var_34_2, var_34_1, var_34_0)
					else
						local var_34_4 = pg.world_expedition_data[var_34_2]
						local var_34_5 = var_34_4 and var_34_4.battle_type and var_34_4.battle_type ~= 0
						local var_34_6 = {}

						if var_34_5 then
							var_34_6.mediator = WorldBossInformationMediator
							var_34_6.viewComponent = WorldBossInformationLayer
						else
							var_34_6.mediator = WorldPreCombatMediator
							var_34_6.viewComponent = WorldPreCombatLayer
						end

						arg_18_0:OpOpenLayer(Context.New(var_34_6))
					end
				else
					arg_34_0()
				end
			elseif var_34_0.type == WorldMapAttachment.TypeBox then
				arg_18_0:OpReqBox(var_34_1, var_34_0)
			else
				assert(false, "invalide interactive type: " .. var_34_0.type)
			end
		else
			arg_34_0()
		end
	end)
	table.insert(var_18_2, function(arg_35_0)
		if var_0_1.inLoopAutoFight then
			var_0_1.inLoopAutoFight = false

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("autofight_tip_bigworld_loop"),
				onYes = arg_35_0,
				onNo = arg_35_0
			})
		else
			arg_35_0()
		end
	end)
	table.insert(var_18_2, function(arg_36_0)
		if not var_18_0.isAutoFight and not var_18_0.isAutoSwitch and var_18_0:HasAutoFightDrops() then
			arg_18_0:OpOpenLayer(Context.New({
				mediator = WorldAutoFightRewardMediator,
				viewComponent = WorldAutoFightRewardLayer,
				onRemoved = arg_36_0
			}))
		else
			arg_36_0()
		end
	end)
	seriesAsync(var_18_2, function()
		arg_18_0:OpReqDiscover()
	end)
end

function var_0_0.OpReqDiscover(arg_38_0)
	local var_38_0 = nowWorld():GetActiveMap()
	local var_38_1 = var_38_0:CheckDiscover()

	if #var_38_1 > 0 then
		local var_38_2 = {}
		local var_38_3 = {}

		_.each(var_38_1, function(arg_39_0)
			local var_39_0 = var_38_0:GetCell(arg_39_0.row, arg_39_0.column)

			table.insert(var_38_2, var_39_0)
			_.each(var_39_0.attachments, function(arg_40_0)
				if arg_40_0:ShouldMarkAsLurk() then
					table.insert(var_38_3, arg_40_0)
				end
			end)
		end)
		var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
			op = WorldConst.OpReqDiscover,
			locations = var_38_1,
			hiddenCells = var_38_2,
			hiddenAttachments = var_38_3
		}))
	else
		arg_38_0:OpDone("OpReqDiscoverDone")
	end
end

function var_0_0.OpReqDiscoverDone(arg_41_0, arg_41_1)
	local var_41_0 = nowWorld()
	local var_41_1 = var_41_0:GetActiveMap()
	local var_41_2 = {}

	if arg_41_1 and #arg_41_1.hiddenAttachments > 0 then
		table.insert(var_41_2, function(arg_42_0)
			arg_41_0:OpAnim(WorldConst.AnimRadar, arg_42_0)
		end)
	end

	seriesAsync(var_41_2, function()
		if arg_41_1 then
			arg_41_1:Apply()
			arg_41_0:OpInteractive()
		elseif var_41_1:CheckMapPressing() then
			arg_41_0:OpReqPressingMap()
		elseif var_41_0:CheckFleetMovable() then
			arg_41_0:OpReadyToMove()
		else
			local var_43_0 = var_41_1:GetFleet()

			if not var_41_1:CheckFleetMovable(var_43_0) and var_41_1:GetFleetTerrain(var_43_0) == WorldMapCell.TerrainWind then
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_wind_move"))
			end
		end
	end)
end

function var_0_0.OpAnim(arg_44_0, arg_44_1, arg_44_2)
	var_0_1:DoAnim(arg_44_1, function()
		arg_44_0:OpDone()
		arg_44_2()
	end)
end

function var_0_0.OpReadyToMove(arg_46_0)
	arg_46_0:OpDone()

	local var_46_0 = var_0_1.wsMap
	local var_46_1 = var_46_0.map
	local var_46_2 = var_46_1:GetFleet()

	if #var_46_2:GetBuffsByTrap(WorldBuff.TrapDisturbance) > 0 then
		local var_46_3 = var_46_1:GetMoveRange(var_46_2)
		local var_46_4 = math.clamp(math.ceil(math.random() * #var_46_3), 1, #var_46_3)

		if var_46_3[var_46_4] then
			var_0_1:ClearMoveQueue()
			arg_46_0:OpReqMoveFleet(var_46_2, var_46_3[var_46_4].row, var_46_3[var_46_4].column)

			return
		end
	end

	local var_46_5 = nowWorld()

	if var_46_5.isAutoFight then
		if #var_0_1.moveQueue > 0 then
			var_0_1:DoQueueMove(var_46_2)
		elseif var_0_1:CheckLostMoveQueueCount() then
			var_0_1:ResetLostMoveQueueCount(true)
			var_46_5:TriggerAutoFight(false)
			arg_46_0:OpInteractive()
		else
			arg_46_0:OpAutoFightSeach()
		end

		return
	end

	if #var_0_1.moveQueue > 0 and var_46_1:CanLongMove(var_46_2) then
		var_0_1:DoQueueMove(var_46_2)

		return
	end

	var_0_1:ClearMoveQueue()
	var_46_0:UpdateRangeVisible(true)

	local var_46_6 = var_0_1.contextData.inPort

	var_0_1.contextData.inPort = false

	if var_46_6 and checkExist(var_46_1, {
		"GetPort"
	}, {
		"IsOpen",
		{
			var_46_5:GetRealm(),
			var_46_5:GetProgress()
		}
	}) then
		arg_46_0:OpReqEnterPort()

		return
	end

	var_0_1:CheckGuideSLG(var_46_1, var_46_2)
end

function var_0_0.OpLongMoveFleet(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	arg_47_0:OpDone()

	local var_47_0 = nowWorld()
	local var_47_1 = var_47_0:GetActiveMap()

	if var_47_0:CheckFleetMovable() then
		local var_47_2 = {
			row = arg_47_1.row,
			column = arg_47_1.column
		}
		local var_47_3 = {
			row = arg_47_2,
			column = arg_47_3
		}
		local var_47_4, var_47_5 = var_47_1:GetLongMoveRange(arg_47_1)

		if not _.any(var_47_4, function(arg_48_0)
			return arg_48_0.row == var_47_3.row and arg_48_0.column == var_47_3.column
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("destination_not_in_range"))
		else
			local var_47_6 = {}
			local var_47_7 = 0
			local var_47_8

			local function var_47_9(arg_49_0, arg_49_1)
				if arg_49_0.last[arg_49_1] then
					var_47_9(arg_49_0.last[arg_49_1][1], arg_49_0.last[arg_49_1][2])

					var_47_7 = var_47_7 + 1

					table.insert(var_47_6, {
						row = arg_49_0.row,
						column = arg_49_0.column,
						step = var_47_7,
						stay = arg_49_1 == 0
					})
				end
			end

			var_47_9(var_47_5[var_47_3.row][var_47_3.column], 0)
			var_0_1:SetMoveQueue(var_47_6)
			var_0_1:DoQueueMove(arg_47_1)
		end
	end
end

function var_0_0.OpReqMoveFleet(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0 = nowWorld()
	local var_50_1 = var_50_0:GetActiveMap()

	if var_50_0:CheckFleetMovable() then
		local var_50_2 = {
			row = arg_50_1.row,
			column = arg_50_1.column
		}
		local var_50_3 = {
			row = arg_50_2,
			column = arg_50_3
		}
		local var_50_4

		if var_50_1:IsSign(var_50_3.row, var_50_3.column) then
			local var_50_5, var_50_6 = var_50_1:FindPath(var_50_2, var_50_3)

			if var_50_5 < PathFinding.PrioObstacle then
				var_50_4 = var_50_3
				var_50_3 = var_50_6[#var_50_6 - 1]
			end
		end

		local var_50_7 = var_50_1:GetMoveRange(arg_50_1)

		if _.detect(var_50_7, function(arg_51_0)
			return arg_51_0.row == var_50_3.row and arg_51_0.column == var_50_3.column
		end) then
			local var_50_8
			local var_50_9 = arg_50_1:GetBuffsByTrap(WorldBuff.TrapVortex)

			if #var_50_9 > 0 then
				local var_50_10 = math.random() * 100

				if underscore.all(var_50_9, function(arg_52_0)
					return var_50_10 < arg_52_0:GetTrapParams()[1]
				end) then
					var_50_3.row, var_50_3.column = arg_50_1.row, arg_50_1.column
					var_50_8 = WorldBuff.TrapVortex
				end
			end

			local var_50_11, var_50_12 = var_50_1:FindPath(var_50_2, var_50_3)

			if var_50_11 < PathFinding.PrioObstacle then
				var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
					op = WorldConst.OpReqMoveFleet,
					id = arg_50_1.id,
					arg1 = var_50_3.row,
					arg2 = var_50_3.column,
					sign = var_50_4,
					trap = var_50_8
				}))

				return
			elseif var_50_11 < PathFinding.PrioForbidden then
				pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach_safety"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("destination_can_not_reach"))
			end
		else
			local var_50_13 = trap and "world_fleet_in_vortex" or "destination_not_in_range"

			pg.TipsMgr.GetInstance():ShowTips(i18n(var_50_13))
		end
	end

	var_0_1:ClearMoveQueue()
	arg_50_0:OpDone()
end

function var_0_0.OpReqMoveFleetDone(arg_53_0, arg_53_1)
	local var_53_0 = {}
	local var_53_1 = var_0_1.wsMap
	local var_53_2 = var_53_1.map
	local var_53_3 = var_53_2:GetFleet()

	table.insert(var_53_0, function(arg_54_0)
		var_53_1:UpdateRangeVisible(false)

		if var_53_3.row ~= arg_53_1.arg1 or var_53_3.column ~= arg_53_1.arg2 then
			var_53_1:DisplayTargetArrow(arg_53_1.arg1, arg_53_1.arg2)
		end

		arg_53_0:OpActions(arg_53_1.childOps, arg_54_0)
	end)
	table.insert(var_53_0, function(arg_55_0)
		var_0_1:CheckMoveQueue(arg_53_1.path)
		arg_55_0()
	end)

	if arg_53_1.sign then
		table.insert(var_53_0, function(arg_56_0)
			var_0_1:ClearMoveQueue()

			if var_53_3.row == arg_53_1.arg1 and var_53_3.column == arg_53_1.arg2 then
				local var_56_0 = var_53_2:GetCell(arg_53_1.sign.row, arg_53_1.sign.column)

				arg_53_0:OpTriggerSign(var_53_3, var_56_0:GetEventAttachment(), arg_56_0)
			else
				arg_56_0()
			end
		end)
	end

	seriesAsync(var_53_0, function()
		var_53_1:HideTargetArrow()
		arg_53_1:Apply()
		arg_53_0:OpInteractive()
	end)
end

function var_0_0.OpMoveFleet(arg_58_0, arg_58_1, arg_58_2)
	arg_58_2 = var_0_1:DoTopBlock(arg_58_2)

	local var_58_0 = var_0_1.wsMap
	local var_58_1 = var_58_0.map:GetFleet(arg_58_1.id)
	local var_58_2 = var_58_0:GetFleet(var_58_1)
	local var_58_3 = var_58_2.fleet
	local var_58_4 = var_58_0.map:GetCell(var_58_3.row, var_58_3.column)
	local var_58_5 = var_58_0:MovePath(var_58_2, arg_58_1.path, arg_58_1.pos, WorldConst.DirType2, var_58_4:GetTerrain() == WorldMapCell.TerrainWind)

	local function var_58_6(arg_59_0, arg_59_1)
		local var_59_0 = arg_58_1.stepOps[arg_59_0]

		assert(var_59_0, "step op not exist: " .. arg_59_0)

		local var_59_1 = {}

		if #var_59_0.hiddenAttachments > 0 then
			table.insert(var_59_1, function(arg_60_0)
				if arg_59_0 < #arg_58_1.stepOps then
					var_58_5:UpdatePaused(true)
				end

				var_0_1:DoAnim(WorldConst.AnimRadar, function()
					if arg_59_0 < #arg_58_1.stepOps then
						var_58_5:UpdatePaused(false)
					end

					arg_60_0()
				end)
			end)
		end

		seriesAsync(var_59_1, function()
			var_59_0:Apply()

			return existCall(arg_59_1)
		end)
	end

	local function var_58_7(arg_63_0)
		local var_63_0 = arg_58_1.path[arg_63_0 + 1]
		local var_63_1 = var_58_0:GetCell(var_63_0.row, var_63_0.column).transform.position

		var_0_1.wsDragProxy:Focus(var_63_1, var_63_0.duration, LeanTweenType.linear)
	end

	local var_58_8 = 0

	var_58_7(var_58_8)

	local function var_58_9(arg_64_0, arg_64_1)
		var_58_8 = var_58_8 + 1

		var_58_7(var_58_8)
		var_0_1.wsMapRight:UpdateCompassRotation(arg_58_1.path[var_58_8 + 1])
		var_58_6(var_58_8)
	end

	local var_58_10

	local function var_58_11()
		var_58_5:RemoveListener(WSMapPath.EventArrivedStep, var_58_9)
		var_58_5:RemoveListener(WSMapPath.EventArrived, var_58_11)

		var_58_8 = var_58_8 + 1

		var_58_6(var_58_8, function()
			if #arg_58_1.locations > 0 then
				var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
					op = WorldConst.OpReqDiscover,
					locations = arg_58_1.locations,
					hiddenCells = {},
					hiddenAttachments = {},
					routine = function(arg_67_0)
						arg_67_0:Apply()
						arg_58_0:OpDone()
						arg_58_2()
					end
				}))
			else
				arg_58_0:OpDone()
				arg_58_2()
			end
		end)
	end

	var_58_5:AddListener(WSMapPath.EventArrivedStep, var_58_9)
	var_58_5:AddListener(WSMapPath.EventArrived, var_58_11)

	for iter_58_0, iter_58_1 in ipairs(var_58_3:GetCarries()) do
		local var_58_12 = var_58_0:GetCarryItem(iter_58_1)
		local var_58_13 = var_58_3:BuildCarryPath(iter_58_1, arg_58_1.pos, arg_58_1.path)

		var_58_12:FollowPath(var_58_13)
	end

	var_0_1.wsMapRight:UpdateCompassRotation(arg_58_1.path[1])
end

function var_0_0.OpMoveAttachment(arg_68_0, arg_68_1, arg_68_2)
	arg_68_2 = var_0_1:DoTopBlock(arg_68_2)

	local var_68_0 = var_0_1.wsMap
	local var_68_1 = var_68_0.map
	local var_68_2 = arg_68_1.attachment
	local var_68_3 = var_68_0:GetAttachment(var_68_2.row, var_68_2.column, var_68_2.type)

	var_68_0:FlushMovingAttachment(var_68_3)

	local var_68_4 = 0
	local var_68_5 = var_68_0:MovePath(var_68_3, arg_68_1.path, arg_68_1.pos, var_68_2:GetDirType())

	local function var_68_6(arg_69_0, arg_69_1)
		var_68_4 = var_68_4 + 1

		var_68_0:FlushMovingAttachmentOrder(var_68_3, arg_68_1.path[var_68_4])
	end

	local var_68_7

	local function var_68_8()
		var_68_5:RemoveListener(WSMapPath.EventArrivedStep, var_68_6)
		var_68_5:RemoveListener(WSMapPath.EventArrived, var_68_8)
		arg_68_0:OpDone()
		arg_68_2()
	end

	var_68_5:AddListener(WSMapPath.EventArrivedStep, var_68_6)
	var_68_5:AddListener(WSMapPath.EventArrived, var_68_8)
end

function var_0_0.OpReqRound(arg_71_0)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqRound
	}))
end

function var_0_0.OpReqRoundDone(arg_72_0, arg_72_1)
	arg_72_0:OpActions(arg_72_1.childOps, function()
		arg_72_1:Apply()
		arg_72_0:OpInteractive(true)
	end)
end

function var_0_0.OpActions(arg_74_0, arg_74_1, arg_74_2)
	arg_74_0:OpDone()

	local var_74_0 = _.map(arg_74_1 or {}, function(arg_75_0)
		return function(arg_76_0)
			arg_74_0:OpAction(arg_75_0, arg_76_0)
		end
	end)

	seriesAsync(var_74_0, arg_74_2)
end

function var_0_0.OpAction(arg_77_0, arg_77_1, arg_77_2)
	arg_77_0:OpDone()

	local var_77_0 = {}

	if arg_77_1.childOps then
		table.insert(var_77_0, function(arg_78_0)
			arg_77_0:OpActions(arg_77_1.childOps, arg_78_0)
		end)
	end

	if arg_77_1.op == WorldConst.OpActionUpdate then
		table.insert(var_77_0, function(arg_79_0)
			arg_77_1:Apply()
			arg_79_0()
		end)
	elseif arg_77_1.op == WorldConst.OpActionFleetMove then
		table.insert(var_77_0, function(arg_80_0)
			arg_77_0:OpMoveFleet(arg_77_1, function()
				arg_77_1:Apply()
				arg_80_0()
			end)
		end)
	elseif arg_77_1.op == WorldConst.OpActionAttachmentMove then
		table.insert(var_77_0, function(arg_82_0)
			arg_77_0:OpMoveAttachment(arg_77_1, function()
				arg_77_1:Apply()
				arg_82_0()
			end)
		end)
	elseif arg_77_1.op == WorldConst.OpActionAttachmentAnim then
		table.insert(var_77_0, function(arg_84_0)
			arg_77_0:OpAttachmentAnim(arg_77_1, function()
				arg_77_1:Apply()
				arg_84_0()
			end)
		end)
	elseif arg_77_1.op == WorldConst.OpActionFleetAnim then
		table.insert(var_77_0, function(arg_86_0)
			arg_77_0:OpFleetAnim(arg_77_1, function()
				arg_77_1:Apply()
				arg_86_0()
			end)
		end)
	elseif arg_77_1.op == WorldConst.OpActionEventEffect then
		table.insert(var_77_0, function(arg_88_0)
			arg_77_0:OpTriggerEvent(arg_77_1, arg_88_0)
		end)
	elseif arg_77_1.op == WorldConst.OpActionCameraMove then
		table.insert(var_77_0, function(arg_89_0)
			arg_77_0:OpMoveCameraTarget(arg_77_1.attachment, 0.1, function()
				arg_77_1:Apply()
				arg_89_0()
			end)
		end)
	elseif arg_77_1.op == WorldConst.OpActionTrapGravityAnim then
		table.insert(var_77_0, function(arg_91_0)
			arg_77_0:OpTrapGravityAnim(arg_77_1.attachment, function()
				arg_77_1:Apply()
				arg_91_0()
			end)
		end)
	else
		assert(false)
	end

	seriesAsync(var_77_0, arg_77_2)
end

function var_0_0.OpEvent(arg_93_0, arg_93_1, arg_93_2)
	arg_93_0:OpDone()

	local var_93_0 = nowWorld()
	local var_93_1
	local var_93_2
	local var_93_3 = arg_93_2:GetEventEffect()
	local var_93_4 = var_93_3.effect_type
	local var_93_5 = var_93_3.effect_paramater
	local var_93_6 = {}

	if var_93_4 == WorldMapAttachment.EffectEventStoryOption then
		local var_93_7 = var_93_5[1]
		local var_93_8 = var_93_3.autoflag[1]

		if var_93_8 and WorldConst.CheckWorldStorySkip(var_93_7) then
			table.insert(var_93_6, function(arg_94_0)
				arg_94_0(var_93_8)
			end)
		else
			table.insert(var_93_6, function(arg_95_0)
				arg_93_0:OpStory(var_93_7, true, true, var_93_0.isAutoFight and var_93_8 and {
					var_93_8
				} or false, arg_95_0)
			end)
		end

		table.insert(var_93_6, function(arg_96_0, arg_96_1)
			assert(arg_96_1, "without option in story:" .. var_93_5[1])

			local var_96_0 = underscore.detect(var_93_5[2], function(arg_97_0)
				return arg_97_0[1] == arg_96_1
			end)

			if var_96_0 then
				var_93_1 = var_96_0[2]

				arg_96_0()
			else
				arg_93_2.triggered = true

				arg_93_0:OpInteractive()
			end
		end)
	elseif var_93_4 == WorldMapAttachment.EffectEventConsumeItem then
		if var_93_0.isAutoFight or var_93_5[4] then
			-- block empty
		else
			table.insert(var_93_6, function(arg_98_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("sub_item_warning"),
					items = {
						{
							type = DROP_TYPE_WORLD_ITEM,
							id = var_93_5[1],
							count = var_93_5[2]
						}
					},
					onYes = arg_98_0,
					onNo = function()
						arg_93_2.triggered = true

						arg_93_0:OpInteractive()
					end
				})
			end)
		end

		table.insert(var_93_6, function(arg_100_0)
			if var_93_0:GetInventoryProxy():GetItemCount(var_93_5[1]) < var_93_5[2] then
				var_93_0:TriggerAutoFight(false)

				arg_93_2.triggered = true

				arg_93_0:OpStory(var_93_5[3], true, false, false, function()
					arg_93_0:OpInteractive()
				end)
			else
				arg_100_0()
			end
		end)
	elseif var_93_4 == WorldMapAttachment.EffectEventGuide then
		table.insert(var_93_6, function(arg_102_0)
			if arg_93_2:IsAttachmentFinish() then
				arg_102_0()
			else
				arg_93_0:OpGuide(var_93_5[1], var_93_5[2], function()
					arg_93_2.finishMark = arg_93_2.data

					if var_0_1 then
						arg_93_0:OpInteractive()
					end
				end)
			end
		end)
	elseif var_93_4 == WorldMapAttachment.EffectEventConsumeCarry then
		local var_93_9 = var_93_3.effect_paramater[1] or {}

		if _.any(var_93_9, function(arg_104_0)
			return not arg_93_1:ExistCarry(arg_104_0)
		end) then
			arg_93_2.triggered = true

			var_93_0:TriggerAutoFight(false)

			local var_93_10 = var_93_3.effect_paramater[2]

			if var_93_10 then
				table.insert(var_93_6, function(arg_105_0)
					arg_93_0:OpStory(var_93_10, true, false, false, arg_105_0)
				end)
			end

			table.insert(var_93_6, function(arg_106_0)
				arg_93_0:OpInteractive()
			end)
		end
	elseif var_93_4 == WorldMapAttachment.EffectEventCatSalvage then
		if arg_93_1:GetDisplayCommander() and not arg_93_1:IsCatSalvage() then
			if not var_93_0.isAutoFight then
				table.insert(var_93_6, function(arg_107_0)
					arg_93_0:OpStory(var_93_5[1], true, true, false, function(arg_108_0)
						if arg_108_0 == var_93_5[2] then
							arg_107_0()
						else
							arg_93_2.triggered = true

							arg_93_0:OpInteractive()
						end
					end)
				end)
			end
		else
			arg_93_2.triggered = true

			if not var_93_0.isAutoFight then
				local var_93_11 = pg.gameset.world_catsearch_failure.description[1]

				table.insert(var_93_6, function(arg_109_0)
					arg_93_0:OpStory(var_93_11, true, false, false, arg_109_0)
				end)
			end

			table.insert(var_93_6, function(arg_110_0)
				arg_93_0:OpInteractive()
			end)
		end
	elseif var_93_4 == WorldMapAttachment.EffectEventMsgbox then
		table.insert(var_93_6, function(arg_111_0)
			var_93_0:TriggerAutoFight(false)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n(var_93_5[1]),
				onYes = arg_111_0,
				onNo = var_93_5[1] == 0 and arg_111_0 or function()
					arg_93_2.triggered = true

					arg_93_0:OpInteractive()
				end,
				hideNo = var_93_5[1] == 0
			})
		end)
	elseif var_93_4 == WorldMapAttachment.EffectEventStoryBattle then
		table.insert(var_93_6, function(arg_113_0)
			if arg_93_2:IsAttachmentFinish() then
				arg_113_0()
			else
				var_0_1:emit(WorldMediator.OnStartPerform, var_93_5[1], function()
					arg_93_2.finishMark = arg_93_2.data
				end)
			end
		end)
	end

	seriesAsync(var_93_6, function()
		local var_115_0 = var_0_1:NewMapOp({
			op = WorldConst.OpReqEvent,
			id = arg_93_1.id,
			arg1 = var_93_1,
			arg2 = var_93_2,
			attachment = arg_93_2,
			effect = var_93_3,
			locations = {
				{
					row = arg_93_2.row,
					column = arg_93_2.column
				}
			}
		})

		arg_93_0:OpReqEvent(var_115_0)
	end)
end

function var_0_0.OpReqEvent(arg_116_0, arg_116_1)
	var_0_1:emit(WorldMediator.OnMapOp, arg_116_1)
end

function var_0_0.OpReqEventDone(arg_117_0, arg_117_1)
	arg_117_0:OpTriggerEvent(arg_117_1, function()
		arg_117_0:OpInteractive(true)
	end)
end

function var_0_0.OpEventOp(arg_119_0, arg_119_1)
	arg_119_0:OpDone()

	local var_119_0 = var_0_1:NewMapOp({
		op = WorldConst.OpActionEventOp,
		attachment = arg_119_1,
		effect = arg_119_1:GetOpEffect()
	})

	arg_119_0:OpTriggerEvent(var_119_0, function()
		arg_119_0:OpInteractive()
	end)
end

function var_0_0.OpTriggerEvent(arg_121_0, arg_121_1, arg_121_2)
	arg_121_0:OpDone()

	local var_121_0 = nowWorld()
	local var_121_1 = {}
	local var_121_2 = arg_121_1.effect
	local var_121_3 = var_121_2.effect_type
	local var_121_4 = var_121_2.effect_paramater

	switch(var_121_3, {
		[WorldMapAttachment.EffectEventStory] = function()
			local var_122_0 = getProxy(WorldProxy)
			local var_122_1 = var_121_4[1]

			if WorldConst.CheckWorldStorySkip(var_122_1) then
				table.insert(var_121_1, function(arg_123_0)
					var_0_1:ReContinueMoveQueue()
					arg_123_0()
				end)
			else
				table.insert(var_121_1, function(arg_124_0)
					arg_121_0:OpStory(var_122_1, true, false, var_121_0.isAutoFight and {} or false, arg_124_0)
				end)
			end

			table.insert(var_121_1, function(arg_125_0)
				arg_121_1:Apply()
				arg_125_0()
			end)
		end,
		[WorldMapAttachment.EffectEventTeleport] = function()
			local var_126_0 = arg_121_1.attachment

			assert(var_126_0 and var_126_0.type == WorldMapAttachment.TypeEvent)

			local var_126_1 = var_121_0:GetMap(arg_121_1.destMapId)
			local var_126_2 = arg_121_1.effect.effect_paramater[1]

			if var_126_2[#var_126_2] == 1 then
				table.insert(var_121_1, function(arg_127_0)
					var_0_1:ShowTransportMarkOverview({
						ids = {
							arg_121_1.entranceId
						}
					}, arg_127_0)
				end)
			end

			if var_0_1:GetInMap() and var_126_0.config.icon == "chuansong01" then
				table.insert(var_121_1, function(arg_128_0)
					arg_121_0:OpAttachmentAnim(var_0_1:NewMapOp({
						anim = "chuansong_open",
						attachment = var_126_0
					}), arg_128_0)
				end)
			end

			table.insert(var_121_1, function(arg_129_0)
				arg_121_0:OpSwitchMap(arg_121_1, arg_129_0)
			end)
		end,
		[WorldMapAttachment.EffectEventTeleportBack] = WorldMapAttachment.EffectEventTeleport,
		[WorldMapAttachment.EffectEventShowMapMark] = function()
			if var_121_0.isAutoFight then
				-- block empty
			else
				table.insert(var_121_1, function(arg_131_0)
					arg_121_0:OpShowMarkOverview({
						ids = var_121_4
					}, arg_131_0)
				end)
			end

			table.insert(var_121_1, function(arg_132_0)
				arg_121_1:Apply()
				arg_132_0()
			end)
		end,
		[WorldMapAttachment.EffectEventCameraMove] = function()
			table.insert(var_121_1, function(arg_134_0)
				arg_121_0:OpMoveCamera(var_121_4[1], var_121_4[2], function()
					arg_121_1:Apply()
					arg_134_0()
				end)
			end)
		end,
		[WorldMapAttachment.EffectEventShakePlane] = function()
			table.insert(var_121_1, function(arg_137_0)
				arg_121_0:OpShakePlane(var_121_4[1], var_121_4[2], var_121_4[3], var_121_4[4], function()
					arg_121_1:Apply()
					arg_137_0()
				end)
			end)
		end,
		[WorldMapAttachment.EffectEventBlink1] = function()
			table.insert(var_121_1, function(arg_140_0)
				var_121_0:TriggerAutoFight(false)
				arg_121_0:OpActions(arg_121_1.childOps, function()
					arg_121_1:Apply()
					arg_140_0()
				end)
			end)
		end,
		[WorldMapAttachment.EffectEventBlink2] = WorldMapAttachment.EffectEventBlink1,
		[WorldMapAttachment.EffectEventFlash] = function()
			table.insert(var_121_1, function(arg_143_0)
				local var_143_0 = Color.New(var_121_4[4][1] / 255, var_121_4[4][2] / 255, var_121_4[4][3] / 255, var_121_4[4][4] / 255)

				arg_121_0:OpFlash(var_121_4[1], var_121_4[2], var_121_4[3], var_143_0, function()
					arg_121_1:Apply()
					arg_143_0()
				end)
			end)
		end,
		[WorldMapAttachment.EffectEventShipBuff] = function()
			table.insert(var_121_1, function(arg_146_0)
				arg_121_1:Apply()
				arg_146_0()
			end)
		end,
		[WorldMapAttachment.EffectEventHelp] = function()
			if var_121_0.isAutoFight then
				-- block empty
			else
				table.insert(var_121_1, function(arg_148_0)
					local var_148_0 = WorldConst.BuildHelpTips(var_121_0:GetProgress())

					var_148_0.defaultpage = var_121_4[1]

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = var_148_0,
						onClose = arg_148_0
					})
				end)
			end

			table.insert(var_121_1, function(arg_149_0)
				arg_121_1:Apply()
				arg_149_0()
			end)
		end,
		[WorldMapAttachment.EffectEventProgress] = function()
			table.insert(var_121_1, function(arg_151_0)
				arg_121_0:OpActions(arg_121_1.childOps, function()
					arg_121_1:Apply()
					arg_151_0()
				end)
			end)
		end,
		[WorldMapAttachment.EffectEventReturn2World] = function()
			table.insert(var_121_1, function(arg_154_0)
				var_121_0:TriggerAutoFight(false)
				arg_121_0:OpSetInMap(false, function()
					arg_121_1:Apply()
					arg_154_0()
				end)
			end)
		end,
		[WorldMapAttachment.EffectEventShowPort] = function()
			table.insert(var_121_1, function(arg_157_0)
				arg_121_1:Apply()
				var_121_0:TriggerAutoFight(false)
				var_0_1:OpenPortLayer({
					page = var_121_4[1]
				})
				arg_157_0()
			end)
		end,
		[WorldMapAttachment.EffectEventGlobalBuff] = function()
			local var_158_0 = {
				id = var_121_4[1],
				floor = var_121_4[2],
				before = var_121_0:GetGlobalBuff(var_121_4[1]):GetFloor()
			}

			if var_121_0.isAutoFight then
				var_121_0:AddAutoInfo("buffs", var_158_0)
			else
				table.insert(var_121_1, function(arg_159_0)
					var_0_1:ShowSubView("GlobalBuff", {
						var_158_0,
						arg_159_0
					})
				end)
			end

			table.insert(var_121_1, function(arg_160_0)
				arg_121_1:Apply()
				arg_160_0()
			end)
		end,
		[WorldMapAttachment.EffectEventSound] = function()
			table.insert(var_121_1, function(arg_162_0)
				arg_121_0:OpPlaySound(var_121_4[1], function()
					arg_121_1:Apply()
					arg_162_0()
				end)
			end)
		end,
		[WorldMapAttachment.EffectEventHelpLayer] = function()
			table.insert(var_121_1, function(arg_165_0)
				var_121_0:TriggerAutoFight(false)
				arg_121_1:Apply()
				arg_121_0:OpOpenLayer(Context.New({
					mediator = WorldHelpMediator,
					viewComponent = WorldHelpLayer,
					data = {
						titleId = var_121_4[1],
						pageId = var_121_4[2]
					},
					onRemoved = arg_165_0
				}))
			end)
		end,
		[WorldMapAttachment.EffectEventFleetShipHP] = function()
			table.insert(var_121_1, function(arg_167_0)
				arg_121_1:Apply()

				if var_121_4[1] > 0 then
					arg_121_0:OpShowAllFleetHealth(arg_167_0)
				else
					arg_167_0()
				end
			end)
		end,
		[WorldMapAttachment.EffectEventCatSalvage] = function()
			table.insert(var_121_1, function(arg_169_0)
				arg_121_1:Apply()
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_catsearch_success"))
				arg_169_0()
			end)
		end,
		[WorldMapAttachment.EffectEventTeleportEvent] = function()
			table.insert(var_121_1, function(arg_171_0)
				arg_121_1:Apply()

				local var_171_0 = var_0_1.wsMap:GetFleet()

				var_0_1.wsDragProxy:Focus(var_171_0.transform.position, nil, LeanTweenType.easeInOutSine, arg_171_0)
			end)
		end,
		[WorldMapAttachment.EffectSideText] = function()
			table.insert(var_121_1, function(arg_173_0)
				arg_121_1:Apply()
				var_0_1.wsMapTop:OnUpdateFlashTips(nil, nil, var_121_4[1])
				arg_173_0()
			end)
		end
	}, function()
		table.insert(var_121_1, function(arg_175_0)
			arg_121_1:Apply()
			arg_175_0()
		end)
	end)
	seriesAsync(var_121_1, arg_121_2)
end

function var_0_0.OpReqRetreat(arg_176_0, arg_176_1)
	local var_176_0 = nowWorld():GetActiveMap():GetCell(arg_176_1.row, arg_176_1.column)

	assert(var_176_0:ExistEnemy())

	local var_176_1 = var_176_0:GetAliveAttachment()

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqRetreat,
		id = arg_176_1.id,
		attachment = var_176_1
	}))
end

function var_0_0.OpReqRetreatDone(arg_177_0, arg_177_1)
	local var_177_0 = {}

	table.insert(var_177_0, function(arg_178_0)
		arg_177_0:OpActions(arg_177_1.childOps, arg_178_0)
	end)
	seriesAsync(var_177_0, function()
		arg_177_1:Apply()
		arg_177_0:OpInteractive()
	end)
end

function var_0_0.OpTransport(arg_180_0, arg_180_1, arg_180_2)
	arg_180_0:OpDone()

	local var_180_0 = nowWorld()
	local var_180_1 = var_180_0:GetActiveMap()

	if not var_180_0:IsSystemOpen(WorldConst.SystemOutMap) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
	elseif not arg_180_2:IsMapOpen() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_map_not_open"))
	else
		arg_180_0:OpReqTransport(var_180_1:GetFleet(), arg_180_1, arg_180_2)
	end
end

function var_0_0.OpReqTransport(arg_181_0, arg_181_1, arg_181_2, arg_181_3)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqTransport,
		id = arg_181_1.id,
		arg1 = arg_181_3.id,
		arg2 = arg_181_2.id,
		locations = {
			arg_181_3:CalcTransportPos(nowWorld():GetActiveEntrance(), arg_181_2)
		}
	}))
end

function var_0_0.OpReqTransportDone(arg_182_0, arg_182_1)
	local var_182_0 = {}

	seriesAsync(var_182_0, function()
		arg_182_0:OpSwitchMap(arg_182_1)
	end)
end

function var_0_0.OpReqSub(arg_184_0, arg_184_1)
	assert(nowWorld():CanCallSubmarineSupport())

	var_0_1.subCallback = arg_184_1

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqSub,
		id = nowWorld():GetSubmarineFleet().id
	}))
end

function var_0_0.OpReqSubDone(arg_185_0, arg_185_1)
	local var_185_0 = nowWorld()
	local var_185_1 = var_185_0:CalcOrderCost(WorldConst.OpReqSub)

	var_185_0.staminaMgr:ConsumeStamina(var_185_1)
	var_185_0:SetReqCDTime(WorldConst.OpReqSub, pg.TimeMgr.GetInstance():GetServerTime())

	local var_185_2 = var_185_0:GetSubmarineFleet():GetFlagShipVO()

	var_0_1:DoStrikeAnim(var_185_2:GetMapStrikeAnim(), var_185_2, function()
		arg_185_1:Apply()

		if var_0_1.subCallback then
			local var_186_0 = var_0_1.subCallback

			var_0_1.subCallback = nil

			var_186_0()
		end
	end)
end

function var_0_0.OpReqJumpOut(arg_187_0, arg_187_1, arg_187_2)
	local var_187_0 = {}

	if not arg_187_2 then
		table.insert(var_187_0, function(arg_188_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = pg.world_chapter_template_reset[arg_187_1].tip,
				onYes = arg_188_0,
				onNo = function()
					arg_187_0:OpDone()
				end
			})
		end)
	end

	seriesAsync(var_187_0, function()
		var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
			op = WorldConst.OpReqJumpOut,
			skipDisplay = arg_187_2
		}))
	end)
end

function var_0_0.OpReqJumpOutDone(arg_191_0, arg_191_1)
	local var_191_0 = {}

	if not arg_191_1.skipDisplay then
		table.insert(var_191_0, function(arg_192_0)
			var_0_1:ShowTransportMarkOverview({
				ids = {
					arg_191_1.entranceId
				}
			}, arg_192_0)
		end)
	end

	seriesAsync(var_191_0, function()
		arg_191_0:OpSwitchMap(arg_191_1)
	end)
end

function var_0_0.OpReqSwitchFleet(arg_194_0, arg_194_1)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqSwitchFleet,
		id = arg_194_1.id
	}))
end

function var_0_0.OpReqSwitchFleetDone(arg_195_0, arg_195_1)
	local var_195_0 = nowWorld()
	local var_195_1 = table.indexof(var_195_0.fleets, var_195_0:GetFleet(arg_195_1.id))

	var_195_0:GetActiveMap():UpdateFleetIndex(var_195_1)
	var_0_1.wsMap:UpdateRangeVisible(false)
	arg_195_0:OpInteractive()
end

function var_0_0.OpStory(arg_196_0, arg_196_1, arg_196_2, arg_196_3, arg_196_4, arg_196_5)
	local function var_196_0(arg_197_0, arg_197_1)
		arg_196_0:OpDone()
		existCall(arg_196_5, arg_197_1)
	end

	pg.NewStoryMgr.GetInstance():PlayForWorld(arg_196_1, arg_196_4, var_196_0, arg_196_2, false, tobool(arg_196_4), arg_196_3)
end

function var_0_0.OpTriggerSign(arg_198_0, arg_198_1, arg_198_2, arg_198_3)
	assert(arg_198_2:IsSign())
	arg_198_0:OpDone()

	if arg_198_2:IsAvatar() then
		local var_198_0 = var_0_1.wsMap:GetAttachment(arg_198_2.row, arg_198_2.column, arg_198_2.type)
		local var_198_1 = var_0_1.wsMap:GetFleet()

		if arg_198_2.column ~= var_198_1.fleet.column then
			local var_198_2 = var_198_0:GetModelAngles()

			var_198_2.y = arg_198_2.column < var_198_1.fleet.column and 0 or 180

			var_198_0:UpdateModelAngles(var_198_2)

			local var_198_3 = var_198_1:GetModelAngles()

			var_198_3.y = 180 - var_198_2.y

			var_198_1:UpdateModelAngles(var_198_3)
		end
	end

	local var_198_4 = {}
	local var_198_5 = arg_198_2:GetEventEffects()

	_.each(var_198_5, function(arg_199_0)
		local var_199_0 = arg_199_0.effect_type
		local var_199_1 = arg_199_0.effect_paramater

		if var_199_0 == WorldMapAttachment.EffectEventStoryOptionClient then
			local var_199_2 = var_199_1[1]
			local var_199_3 = arg_199_0.autoflag[1]

			if var_199_3 and WorldConst.CheckWorldStorySkip(var_199_2) then
				table.insert(var_198_4, function(arg_200_0)
					arg_200_0(var_199_3)
				end)
			else
				table.insert(var_198_4, function(arg_201_0)
					arg_198_0:OpStory(var_199_2, true, true, nowWorld().isAutoFight and var_199_3 and {
						var_199_3
					} or false, arg_201_0)
				end)
			end

			table.insert(var_198_4, function(arg_202_0, arg_202_1)
				assert(arg_202_1, "without option in story:" .. var_199_1[1])

				local var_202_0 = _.detect(var_199_1[2], function(arg_203_0)
					return arg_203_0[1] == arg_202_1
				end)

				if var_202_0 and var_202_0[2] > 0 then
					arg_198_0:OpTriggerEvent(var_0_1:NewMapOp({
						attachment = arg_198_2,
						effect = pg.world_effect_data[var_202_0[2]]
					}), arg_202_0)
				else
					arg_202_0()
				end
			end)
		else
			table.insert(var_198_4, function(arg_204_0)
				arg_198_0:OpTriggerEvent(var_0_1:NewMapOp({
					attachment = arg_198_2,
					effect = arg_199_0
				}), arg_204_0)
			end)
		end
	end)
	seriesAsync(var_198_4, arg_198_3)
end

function var_0_0.OpShowMarkOverview(arg_205_0, arg_205_1, arg_205_2)
	var_0_1:emit(WorldMediator.OnOpenLayer, Context.New({
		mediator = WorldOverviewMediator,
		viewComponent = WorldOverviewLayer,
		data = {
			info = arg_205_1
		},
		onRemoved = function()
			arg_205_0:OpDone()

			return existCall(arg_205_2)
		end
	}))
end

function var_0_0.OpFocusTargetEntrance(arg_207_0, arg_207_1)
	arg_207_0:OpDone()

	local var_207_0 = {}

	if var_0_1:GetInMap() then
		table.insert(var_207_0, function(arg_208_0)
			var_0_1:QueryTransport(arg_208_0)
		end)
	end

	seriesAsync(var_207_0, function()
		var_0_1:EnterTransportWorld(arg_207_1)
	end)
end

function var_0_0.OpShowOrderPanel(arg_210_0)
	arg_210_0:OpDone()

	local var_210_0 = nowWorld()

	var_0_1:ShowSubView("OrderPanel", {
		var_210_0:GetActiveEntrance(),
		var_210_0:GetActiveMap(),
		var_0_1.wsMapRight.wsCompass:GetAnchorEulerAngles()
	})
end

function var_0_0.OpShowScannerPanel(arg_211_0, arg_211_1, arg_211_2)
	arg_211_0:OpDone()

	local var_211_0 = nowWorld()

	var_0_1:ShowSubView("ScannerPanel", {
		var_211_0:GetActiveMap(),
		var_0_1.wsDragProxy
	}, {
		arg_211_1,
		arg_211_2
	})
end

function var_0_0.OpMoveCamera(arg_212_0, arg_212_1, arg_212_2, arg_212_3)
	arg_212_3 = var_0_1:DoTopBlock(arg_212_3)

	local var_212_0 = {}

	if arg_212_1 > 0 then
		local var_212_1 = var_0_1.wsMap.map:FindAttachments(WorldMapAttachment.TypeEvent, arg_212_1)

		for iter_212_0, iter_212_1 in ipairs(var_212_1) do
			table.insert(var_212_0, {
				focusPos = function()
					return var_0_1.wsMap:GetAttachment(iter_212_1.row, iter_212_1.column, iter_212_1.type).transform.position
				end,
				row = iter_212_1.row,
				column = iter_212_1.column
			})
		end
	else
		local var_212_2 = var_0_1.wsMap:GetFleet()

		table.insert(var_212_0, {
			focusPos = function()
				return var_212_2.transform.position
			end,
			row = var_212_2.fleet.row,
			column = var_212_2.fleet.column
		})
	end

	local var_212_3 = {}

	for iter_212_2, iter_212_3 in ipairs(var_212_0) do
		table.insert(var_212_3, function(arg_215_0)
			var_0_1.wsMapRight:UpdateCompossView(iter_212_3.row, iter_212_3.column)
			arg_215_0()
		end)
		table.insert(var_212_3, function(arg_216_0)
			var_0_1.wsDragProxy:Focus(iter_212_3.focusPos(), nil, LeanTweenType.easeInOutSine, arg_216_0)
		end)
		table.insert(var_212_3, function(arg_217_0)
			var_0_1.wsTimer:AddInMapTimer(arg_217_0, arg_212_2, 1):Start()
		end)
	end

	seriesAsync(var_212_3, function()
		arg_212_0:OpDone()

		return existCall(arg_212_3)
	end)
end

function var_0_0.OpMoveCameraTarget(arg_219_0, arg_219_1, arg_219_2, arg_219_3)
	arg_219_3 = var_0_1:DoTopBlock(arg_219_3)

	if not arg_219_1 then
		local var_219_0 = var_0_1.wsMap:GetFleet()

		arg_219_1 = {
			row = var_219_0.fleet.row,
			column = var_219_0.fleet.column
		}
	end

	local var_219_1 = {}

	table.insert(var_219_1, function(arg_220_0)
		var_0_1.wsMapRight:UpdateCompossView(arg_219_1.row, arg_219_1.column)
		arg_220_0()
	end)
	table.insert(var_219_1, function(arg_221_0)
		var_0_1.wsDragProxy:Focus(var_0_1.wsMap:GetCell(arg_219_1.row, arg_219_1.column).transform.position, nil, LeanTweenType.easeInOutSine, arg_221_0)
	end)
	table.insert(var_219_1, function(arg_222_0)
		var_0_1.wsTimer:AddInMapTimer(arg_222_0, arg_219_2, 1):Start()
	end)
	seriesAsync(var_219_1, function()
		arg_219_0:OpDone()

		return existCall(arg_219_3)
	end)
end

function var_0_0.OpShakePlane(arg_224_0, arg_224_1, arg_224_2, arg_224_3, arg_224_4, arg_224_5)
	var_0_1.wsDragProxy:ShakePlane(arg_224_1, arg_224_2, arg_224_3, arg_224_4, function()
		arg_224_0:OpDone()

		if arg_224_5 then
			arg_224_5()
		end
	end)
end

function var_0_0.OpAttachmentAnim(arg_226_0, arg_226_1, arg_226_2)
	local var_226_0 = arg_226_1.attachment
	local var_226_1 = var_0_1.wsMap:GetAttachment(var_226_0.row, var_226_0.column, var_226_0.type)

	seriesAsync({
		function(arg_227_0)
			var_226_1:PlayModelAction(arg_226_1.anim, arg_226_1.duration, arg_227_0)
		end
	}, function()
		var_226_1:FlushModelAction()
		arg_226_0:OpDone()
		arg_226_2()
	end)
end

function var_0_0.OpFleetAnim(arg_229_0, arg_229_1, arg_229_2)
	local var_229_0 = var_0_1.wsMap.map:GetFleet(arg_229_1.id)
	local var_229_1 = var_0_1.wsMap:GetFleet(var_229_0)

	seriesAsync({
		function(arg_230_0)
			var_229_1:PlayModelAction(arg_229_1.anim, arg_229_1.duration, arg_230_0)
		end
	}, function()
		var_229_1:FlushModelAction()
		arg_229_0:OpDone()
		arg_229_2()
	end)
end

function var_0_0.OpFlash(arg_232_0, arg_232_1, arg_232_2, arg_232_3, arg_232_4, arg_232_5)
	local var_232_0 = var_0_1.rtTop:Find("flash")

	setActive(var_232_0, true)
	setImageColor(var_232_0, arg_232_4)
	setImageAlpha(var_232_0, 0)
	var_0_1.wsTimer:AddInMapTween(LeanTween.alpha(var_232_0, arg_232_4.a, arg_232_1).uniqueId)
	var_0_1.wsTimer:AddInMapTween(LeanTween.alpha(var_232_0, 0, arg_232_3):setDelay(arg_232_1 + arg_232_2):setOnComplete(System.Action(function()
		setActive(var_232_0, false)
		arg_232_0:OpDone()
		arg_232_5()
	end)).uniqueId)
end

function var_0_0.OpReqBox(arg_234_0, arg_234_1, arg_234_2)
	assert(arg_234_2 and arg_234_2.type == WorldMapAttachment.TypeBox)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqBox,
		id = arg_234_1.id,
		attachment = arg_234_2
	}))
end

function var_0_0.OpReqBoxDone(arg_235_0, arg_235_1)
	arg_235_1:Apply()
	arg_235_0:OpInteractive()
end

function var_0_0.OpSetInMap(arg_236_0, arg_236_1, arg_236_2)
	arg_236_0:OpDone()
	var_0_1:SetInMap(arg_236_1, arg_236_2)
end

function var_0_0.OpSwitchInMap(arg_237_0, arg_237_1)
	local var_237_0 = {}

	table.insert(var_237_0, function(arg_238_0)
		var_0_1:DisplayMap()
		var_0_1:DisplayMapUI()
		var_0_1:UpdateMapUI()

		return arg_238_0()
	end)
	table.insert(var_237_0, function(arg_239_0)
		var_0_1:EaseInMapUI(arg_239_0)
	end)
	table.insert(var_237_0, function(arg_240_0)
		arg_237_0:OpDone()

		return arg_240_0()
	end)
	seriesAsync(var_237_0, arg_237_1)
end

function var_0_0.OpSwitchOutMap(arg_241_0, arg_241_1)
	local var_241_0 = {}

	table.insert(var_241_0, function(arg_242_0)
		var_0_1:EaseOutMapUI(arg_242_0)
	end)
	table.insert(var_241_0, function(arg_243_0)
		var_0_1:HideMap()
		var_0_1:HideMapUI()

		return arg_243_0()
	end)
	table.insert(var_241_0, function(arg_244_0)
		arg_241_0:OpDone()

		return arg_244_0()
	end)
	seriesAsync(var_241_0, arg_241_1)
end

function var_0_0.OpSwitchInWorld(arg_245_0, arg_245_1)
	local var_245_0 = {}

	table.insert(var_245_0, function(arg_246_0)
		var_0_1:DisplayAtlas()
		var_0_1:DisplayAtlasUI()

		return arg_246_0()
	end)
	table.insert(var_245_0, function(arg_247_0)
		var_0_1:EaseInAtlasUI(arg_247_0)
	end)
	table.insert(var_245_0, function(arg_248_0)
		arg_245_0:OpDone()

		return arg_248_0()
	end)
	seriesAsync(var_245_0, arg_245_1)
end

function var_0_0.OpSwitchOutWorld(arg_249_0, arg_249_1)
	local var_249_0 = {}

	table.insert(var_249_0, function(arg_250_0)
		var_0_1:EaseOutAtlasUI(arg_250_0)
	end)
	table.insert(var_249_0, function(arg_251_0)
		var_0_1:HideAtlas()
		var_0_1:HideAtlasUI()

		return arg_251_0()
	end)
	table.insert(var_249_0, function(arg_252_0)
		arg_249_0:OpDone()

		return arg_252_0()
	end)
	seriesAsync(var_249_0, arg_249_1)
end

function var_0_0.OpRedeploy(arg_253_0)
	arg_253_0:OpDone()

	local var_253_0 = nowWorld()
	local var_253_1 = var_253_0:GetActiveMap()

	if underscore.any(var_253_1:GetNormalFleets(), function(arg_254_0)
		return #arg_254_0:GetCarries() > 0
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_redeploy_3"))

		return
	end

	if var_253_1:CheckFleetSalvage(true) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_catsearch_fleetcheck"),
			onYes = function()
				var_253_1.salvageAutoResult = true

				arg_253_0:OpInteractive()
			end
		})
	else
		local var_253_2, var_253_3 = var_253_0:BuildFormationIds()

		arg_253_0:OpOpenScene(SCENE.WORLD_FLEET_SELECT, {
			type = var_253_2,
			fleets = var_253_3
		})
	end
end

function var_0_0.OpKillWorld(arg_256_0)
	getProxy(ContextProxy):getContextByMediator(WorldMediator).onRemoved = function()
		pg.m02:sendNotification(GAME.WORLD_KILL)
	end

	var_0_1:ExitWorld(function()
		arg_256_0:OpDone()
	end, true)
end

function var_0_0.OpReqMaintenance(arg_259_0, arg_259_1)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqMaintenance,
		id = arg_259_1
	}))
end

function var_0_0.OpReqMaintenanceDone(arg_260_0, arg_260_1)
	arg_260_1:Apply()

	local var_260_0 = nowWorld()
	local var_260_1 = var_260_0:GetFleets()

	_.each(var_260_1, function(arg_261_0)
		arg_261_0:ClearDamageLevel()

		for iter_261_0, iter_261_1 in ipairs(arg_261_0:GetShips(true)) do
			iter_261_1:Repair()
		end
	end)

	local var_260_2 = var_260_0:CalcOrderCost(WorldConst.OpReqMaintenance)

	var_260_0.staminaMgr:ConsumeStamina(var_260_2)
	var_260_0:SetReqCDTime(WorldConst.OpReqMaintenance, pg.TimeMgr.GetInstance():GetServerTime())
	var_0_1.wsMap:UpdateRangeVisible(false)
	arg_260_0:OpShowAllFleetHealth(function()
		arg_260_0:OpInteractive()
	end)
end

function var_0_0.OpReqVision(arg_263_0)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqVision
	}))
end

function var_0_0.OpReqVisionDone(arg_264_0, arg_264_1)
	arg_264_1:Apply()

	local var_264_0 = nowWorld()
	local var_264_1 = var_264_0:CalcOrderCost(WorldConst.OpReqVision)

	var_264_0.staminaMgr:ConsumeStamina(var_264_1)
	var_264_0:SetReqCDTime(WorldConst.OpReqVision, pg.TimeMgr.GetInstance():GetServerTime())
	var_264_0:GetActiveMap():UpdateVisionFlag(true)
	var_0_1.wsMap:UpdateRangeVisible(false)
	arg_264_0:OpInteractive()
end

function var_0_0.OpReqPressingMap(arg_265_0)
	local var_265_0 = nowWorld():GetActiveMap()
	local var_265_1 = var_265_0:GetFleet().id

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqPressingMap,
		id = var_265_1,
		arg1 = var_265_0.id
	}))
end

function var_0_0.OpReqPressingMapDone(arg_266_0, arg_266_1, arg_266_2)
	local var_266_0 = arg_266_2
	local var_266_1 = arg_266_1.arg1
	local var_266_2 = nowWorld()

	if var_266_2:GetMap(var_266_1):CheckMapPressingDisplay() then
		table.insert(var_266_0, 1, function(arg_267_0)
			var_0_1:BuildCutInAnim("WorldPressingWindow", arg_267_0)
		end)
	end

	local var_266_3 = var_266_2:GetPressingAward(var_266_1)

	if var_266_3 and var_266_3.flag then
		local var_266_4 = pg.world_event_complete[var_266_3.id].event_reward_slgbuff

		if #var_266_4 > 1 then
			local var_266_5 = {
				id = var_266_4[1],
				floor = var_266_4[2],
				before = var_266_2:GetGlobalBuff(var_266_4[1]):GetFloor()
			}

			if var_266_2.isAutoFight then
				var_266_2:AddAutoInfo("buffs", var_266_5)
			else
				table.insert(var_266_0, function(arg_268_0)
					var_0_1:ShowSubView("GlobalBuff", {
						var_266_5,
						arg_268_0
					})
				end)
			end

			table.insert(var_266_0, function(arg_269_0)
				var_266_2:AddGlobalBuff(var_266_4[1], var_266_4[2])
				arg_269_0()
			end)
		end
	end

	seriesAsync(var_266_0, function()
		arg_266_1:Apply()
		var_0_1.wsMap:UpdateRangeVisible(false)
		arg_266_0:OpInteractive()
	end)
end

function var_0_0.OpReqEnterPort(arg_271_0)
	local var_271_0 = nowWorld()
	local var_271_1 = var_271_0:GetActiveMap():GetPort()

	if var_271_1:IsOpen(var_271_0:GetRealm(), var_271_0:GetProgress()) then
		var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
			op = WorldConst.OpReqEnterPort
		}))
	else
		pg.TipsMgr.GetInstance():ShowTips("port is not open: " .. var_271_1.id)
	end
end

function var_0_0.OpReqEnterPortDone(arg_272_0, arg_272_1)
	arg_272_1:Apply()
	var_0_1:OpenPortLayer()
end

function var_0_0.OpReqCatSalvage(arg_273_0, arg_273_1)
	arg_273_1 = arg_273_1 or nowWorld():GetActiveMap():CheckFleetSalvage()

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqCatSalvage,
		id = arg_273_1
	}))
end

function var_0_0.OpReqCatSalvageDone(arg_274_0, arg_274_1, arg_274_2)
	local var_274_0 = arg_274_2
	local var_274_1 = nowWorld()

	if var_274_1.isAutoFight then
		-- block empty
	else
		table.insert(var_274_0, 1, function(arg_275_0)
			local var_275_0 = var_274_1:GetFleet(arg_274_1.id):GetRarityState() > 0 and 2 or 1

			pg.NewStoryMgr.GetInstance():Play(pg.gameset.world_catsearch_completed.description[var_275_0], arg_275_0, true)
		end)
	end

	seriesAsync(var_274_0, function()
		arg_274_1:Apply()
		arg_274_0:OpInteractive()
	end)
end

function var_0_0.OpReqSkipBattle(arg_277_0, arg_277_1)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqSkipBattle,
		id = arg_277_1
	}))
end

function var_0_0.OpReqSkipBattleDone(arg_278_0, arg_278_1)
	arg_278_1:Apply()
	arg_278_0:OpInteractive()
end

function var_0_0.OpPlaySound(arg_279_0, arg_279_1, arg_279_2)
	var_0_1:PlaySound(arg_279_1, arg_279_2)
end

function var_0_0.OpGuide(arg_280_0, arg_280_1, arg_280_2, arg_280_3)
	arg_280_0:OpDone()

	local var_280_0 = WorldGuider.GetInstance()

	arg_280_1 = var_280_0:SpecialCheck(arg_280_1)
	arg_280_2 = arg_280_2 == 1 and true or false

	if var_280_0:PlayGuide(arg_280_1, arg_280_2, arg_280_3) then
		nowWorld():TriggerAutoFight(false)
	end
end

function var_0_0.OpTaskGoto(arg_281_0, arg_281_1)
	arg_281_0:OpDone()

	local var_281_0 = nowWorld()
	local var_281_1 = var_281_0:GetTaskProxy():getTaskById(arg_281_1)

	if var_281_1:GetFollowingAreaId() then
		arg_281_0:OpShowMarkOverview({
			mode = "Task",
			taskId = arg_281_1
		})
	elseif var_281_0:GetActiveEntrance().id ~= var_281_1:GetFollowingEntrance() then
		local var_281_2 = var_281_1:GetFollowingEntrance()
		local var_281_3 = var_281_0:GetAtlas():GetTaskDic(var_281_1.id)

		var_0_1:QueryTransport(function()
			var_0_1:EnterTransportWorld({
				entrance = var_281_0:GetEntrance(var_281_2),
				mapTypes = var_281_3[var_281_2] and {
					"task_chapter"
				} or {
					"complete_chapter",
					"base_chapter"
				}
			})
		end)
	else
		local var_281_4 = var_281_1.config.task_goto
		local var_281_5 = var_281_1.config.following_random
		local var_281_6 = var_281_0:GetActiveMap()

		if #var_281_5 > 0 and not _.any(var_281_5, function(arg_283_0)
			return arg_283_0 == var_281_6.id
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_task_goto0"))

			return
		end

		if not var_281_4[1] then
			return
		elseif var_281_4[1] == 1 then
			local var_281_7 = {}

			for iter_281_0, iter_281_1 in ipairs(var_281_4[2]) do
				assert(pg.world_effect_data[iter_281_1], "without effect: " .. iter_281_1)
				table.insert(var_281_7, function(arg_284_0)
					local var_284_0 = var_0_1:NewMapOp({
						op = WorldConst.OpActionTaskGoto,
						effect = pg.world_effect_data[iter_281_1]
					})

					arg_281_0:OpTriggerEvent(var_284_0, arg_284_0)
				end)
			end

			seriesAsync(var_281_7, function()
				arg_281_0:OpInteractive()
			end)
		elseif var_281_4[1] == 2 then
			local var_281_8 = checkExist(var_281_0:GetActiveMap(), {
				"GetPort"
			})
			local var_281_9 = var_281_0:GetRealm()

			if var_281_9 == checkExist(var_281_8, {
				"GetRealm"
			}) and checkExist(var_281_8, {
				"IsOpen",
				{
					var_281_9,
					var_281_0:GetProgress()
				}
			}) then
				arg_281_0:OpRedeploy()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_redeploy_1"))

				return
			end
		elseif var_281_4[1] == 3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_task_goto3"))

			return
		else
			assert(false, "goto info error:" .. var_281_4[1])

			return
		end
	end
end

function var_0_0.OpShowAllFleetHealth(arg_286_0, arg_286_1)
	arg_286_0:OpDone()

	if var_0_1:GetInMap() then
		for iter_286_0, iter_286_1 in ipairs(var_0_1.wsMap.wsMapFleets) do
			iter_286_1:DisplayHealth()
		end
	end

	return existCall(arg_286_1)
end

function var_0_0.OpAutoSubmitTask(arg_287_0, arg_287_1)
	var_0_1:emit(WorldMediator.OnAutoSubmitTask, arg_287_1)
end

function var_0_0.OpAutoSubmitTaskDone(arg_288_0, arg_288_1)
	arg_288_0:OpInteractive()
end

function var_0_0.OpTrapGravityAnim(arg_289_0, arg_289_1, arg_289_2)
	var_0_1:ClearMoveQueue()
	var_0_1.wsMap:GetAttachment(arg_289_1.row, arg_289_1.column, arg_289_1.type):TrapAnimDisplay(function()
		arg_289_0:OpDone()
		existCall(arg_289_2)
	end)
end

function var_0_0.OpAutoFightSeach(arg_291_0)
	arg_291_0:OpDone()

	local var_291_0 = nowWorld()
	local var_291_1 = var_291_0:GetActiveMap()
	local var_291_2 = var_291_1:GetFleet()
	local var_291_3 = var_291_1:GetLongMoveRange(var_291_2)
	local var_291_4
	local var_291_5 = 0

	for iter_291_0, iter_291_1 in ipairs(var_291_3) do
		local var_291_6 = var_291_1:GetCell(iter_291_1.row, iter_291_1.column):GetEventAttachment()
		local var_291_7 = var_291_6 and var_291_6:GetEventAutoPri()

		if var_291_7 and var_291_5 < var_291_7 and var_291_1:CheckEventAutoTrigger(var_291_6) then
			var_291_4 = iter_291_1
			var_291_5 = var_291_7
		end
	end

	if var_291_4 then
		arg_291_0:OpLongMoveFleet(var_291_2, var_291_4.row, var_291_4.column)
	elseif var_291_2:IsCatSalvage() then
		local var_291_8 = var_291_3[1]

		arg_291_0:OpLongMoveFleet(var_291_2, var_291_8.row, var_291_8.column)
	else
		local var_291_9 = {}
		local var_291_10 = false

		if var_291_0.isAutoSwitch then
			local var_291_11 = {
				event_1 = {
					"auto_switch_wait",
					"world_planning_stop_event"
				},
				event_2 = {
					"auto_switch_wait_2",
					"world_planning_stop_event2"
				},
				event_3 = {
					nil,
					"world_planning_stop_event3"
				}
			}
			local var_291_12 = var_291_1:FindAttachments(WorldMapAttachment.TypeEvent)

			local function var_291_13(arg_292_0)
				if arg_292_0[1] and PlayerPrefs.GetInt(arg_292_0[1], 0) == 0 then
					return false
				else
					local var_292_0 = {}

					for iter_292_0, iter_292_1 in ipairs(pg.gameset[arg_292_0[2]].description) do
						var_292_0[iter_292_1] = true
					end

					return underscore.any(var_291_12, function(arg_293_0)
						return arg_293_0:IsAlive() and var_292_0[arg_293_0.id]
					end)
				end
			end

			switch(PlayerPrefs.GetInt("auto_switch_mode", 0), {
				[WorldSwitchPlanningLayer.MODE_DIFFICULT] = function()
					var_291_10 = var_291_1.isPressing and not underscore.any({
						"event_1",
						"event_2"
					}, function(arg_295_0)
						return var_291_13(var_291_11[arg_295_0])
					end)
				end,
				[WorldSwitchPlanningLayer.MODE_SAFE] = function()
					local var_296_0 = PlayerPrefs.GetString("auto_switch_difficult_safe", "only") == "only" and World.ReplacementMapType(var_291_0:GetActiveEntrance(), var_291_1) == "base_chapter"

					var_291_10 = var_291_1.isPressing and (var_296_0 or not underscore.any({
						"event_1",
						"event_2"
					}, function(arg_297_0)
						return var_291_13(var_291_11[arg_297_0])
					end))
				end,
				[WorldSwitchPlanningLayer.MODE_TREASURE] = function()
					var_291_10 = World.ReplacementMapType(var_291_0:GetActiveEntrance(), var_291_1) ~= "teasure_chapter" or not underscore.any({
						"event_1",
						"event_3"
					}, function(arg_299_0)
						return var_291_13(var_291_11[arg_299_0])
					end)
				end
			})
		end

		if var_291_10 then
			table.insert(var_291_9, function(arg_300_0)
				arg_291_0:OpAutoSwitchMap(arg_300_0)
			end)
		end

		seriesAsync(var_291_9, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_tip_bigworld_suspend"))
			var_291_0:TriggerAutoFight(false)
			arg_291_0:OpInteractive()
		end)
	end
end

function var_0_0.OpAutoSwitchMap(arg_302_0, arg_302_1)
	arg_302_0:OpDone()

	local var_302_0 = nowWorld()
	local var_302_1 = var_302_0:GetAtlas()
	local var_302_2 = var_302_0:GetActiveEntrance()
	local var_302_3 = var_302_0:GetActiveMap()
	local var_302_4 = false
	local var_302_5
	local var_302_6

	switch(PlayerPrefs.GetInt("auto_switch_mode", 0), {
		[WorldSwitchPlanningLayer.MODE_DIFFICULT] = function()
			local var_303_0 = underscore.values(var_302_1.entranceDic)

			table.sort(var_303_0, CompareFuncs({
				function(arg_304_0)
					return arg_304_0:GetBaseMap():GetDanger()
				end,
				function(arg_305_0)
					return arg_305_0.id
				end
			}))

			local var_303_1 = PlayerPrefs.GetString("auto_switch_difficult_base", "all")

			for iter_303_0, iter_303_1 in ipairs(var_303_0) do
				if var_302_1.transportDic[iter_303_1.id] then
					local var_303_2 = iter_303_1:GetBaseMap()

					if var_303_2:GetPressingLevel() > 0 and not var_303_2.isPressing and var_303_2:IsMapOpen() and WorldSwitchPlanningLayer.checkDifficultValid(var_303_1, var_303_2:GetDanger()) and not var_302_5 then
						var_302_5, var_302_6 = var_303_2, iter_303_1

						break
					end
				end
			end
		end,
		[WorldSwitchPlanningLayer.MODE_SAFE] = function()
			local var_306_0 = PlayerPrefs.GetString("auto_switch_difficult_safe", "only")

			switch(var_306_0, {
				all = function()
					local var_307_0 = var_302_0:GetActiveEntrance()
					local var_307_1 = {}

					for iter_307_0, iter_307_1 in pairs(var_302_1.entranceDic) do
						if iter_307_1 ~= var_307_0 and var_302_1.transportDic[iter_307_1.id] and iter_307_1:GetBaseMap().isPressing and #iter_307_1.config.complete_chapter > 0 then
							local var_307_2 = var_302_0:GetMap(iter_307_1.config.complete_chapter[1])

							if var_307_2:IsMapOpen() then
								table.insert(var_307_1, {
									iter_307_1,
									var_307_2
								})
							end
						end
					end

					if #var_307_1 > 0 then
						var_302_6, var_302_5 = unpack(var_307_1[math.floor(math.random() * #var_307_1) + 1])
					end
				end,
				only = function()
					var_302_6 = var_302_2

					local var_308_0 = var_302_6:GetBaseMapId()
					local var_308_1 = var_302_6.config.complete_chapter[1]

					assert(var_308_0 and var_308_1)

					if var_302_3.id == var_308_0 then
						var_302_5 = var_302_0:GetMap(var_308_1)
					elseif var_302_3.id == var_308_1 then
						var_302_5 = var_302_0:GetMap(var_308_0)
					else
						assert(false)
					end
				end
			})
		end,
		[WorldSwitchPlanningLayer.MODE_TREASURE] = function()
			if World.ReplacementMapType(var_302_2, var_302_3) == "teasure_chapter" then
				var_302_4 = true

				return
			end

			local var_309_0 = underscore.map(var_302_0:GetInventoryProxy():GetItemsByType(WorldItem.UsageWorldMap), function(arg_310_0)
				return arg_310_0.id
			end)
			local var_309_1 = underscore.filter(var_309_0, function(arg_311_0)
				return pg.world_item_data_template[arg_311_0].usage_arg[1] ~= 1
			end)
			local var_309_2 = underscore.map(var_309_1, function(arg_312_0)
				local var_312_0 = var_302_0:FindTreasureEntrance(arg_312_0)
				local var_312_1

				for iter_312_0, iter_312_1 in ipairs(var_312_0.config.teasure_chapter) do
					if arg_312_0 == iter_312_1[1] then
						var_312_1 = iter_312_1[2]

						break
					end
				end

				return {
					var_302_0:GetMap(var_312_1),
					var_312_0
				}
			end)

			table.sort(var_309_2, CompareFuncs({
				function(arg_313_0)
					return arg_313_0[1]:GetDanger()
				end,
				function(arg_314_0)
					return arg_314_0[1].id
				end
			}))

			local var_309_3 = PlayerPrefs.GetString("auto_switch_difficult_treasure", "all")

			for iter_309_0, iter_309_1 in ipairs(var_309_2) do
				local var_309_4, var_309_5 = unpack(iter_309_1)

				if var_302_1.transportDic[var_309_5.id] and var_309_4:IsMapOpen() and WorldSwitchPlanningLayer.checkDifficultValid(var_309_3, var_309_4:GetDanger()) and not var_302_5 then
					var_302_5, var_302_6 = var_309_4, var_309_5

					break
				end
			end
		end
	})

	if var_302_4 then
		arg_302_0:OpReqJumpOut(var_302_3.gid, true)
	elseif not var_302_5 then
		var_302_0:TriggerAutoSwitch(false)
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_automode_start_tip1"))

		return existCall(arg_302_1)
	elseif not var_302_5.isCost and var_302_0.staminaMgr:GetTotalStamina() < var_302_5.config.enter_cost then
		var_302_0:TriggerAutoSwitch(false)
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_automode_start_tip2"))

		return existCall(arg_302_1)
	else
		nowWorld():TriggerAutoSwitch(true)

		if var_302_5.active then
			nowWorld():TriggerAutoFight(true)
			arg_302_0:OpSetInMap(true)
		else
			arg_302_0:OpTransport(var_302_6, var_302_5)
		end
	end
end

return var_0_0

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
		if var_93_0.isAutoFight then
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

	if var_121_3 == WorldMapAttachment.EffectEventStory then
		local var_121_5 = getProxy(WorldProxy)
		local var_121_6 = var_121_4[1]

		if WorldConst.CheckWorldStorySkip(var_121_6) then
			table.insert(var_121_1, function(arg_122_0)
				var_0_1:ReContinueMoveQueue()
				arg_122_0()
			end)
		else
			table.insert(var_121_1, function(arg_123_0)
				arg_121_0:OpStory(var_121_6, true, false, var_121_0.isAutoFight and {} or false, arg_123_0)
			end)
		end

		table.insert(var_121_1, function(arg_124_0)
			arg_121_1:Apply()
			arg_124_0()
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventTeleport or var_121_3 == WorldMapAttachment.EffectEventTeleportBack then
		local var_121_7 = arg_121_1.attachment

		assert(var_121_7 and var_121_7.type == WorldMapAttachment.TypeEvent)

		local var_121_8 = var_121_0:GetMap(arg_121_1.destMapId)
		local var_121_9 = arg_121_1.effect.effect_paramater[1]

		if var_121_9[#var_121_9] == 1 then
			table.insert(var_121_1, function(arg_125_0)
				var_0_1:ShowTransportMarkOverview({
					ids = {
						arg_121_1.entranceId
					}
				}, arg_125_0)
			end)
		end

		if var_0_1:GetInMap() and var_121_7.config.icon == "chuansong01" then
			table.insert(var_121_1, function(arg_126_0)
				arg_121_0:OpAttachmentAnim(var_0_1:NewMapOp({
					anim = "chuansong_open",
					attachment = var_121_7
				}), arg_126_0)
			end)
		end

		table.insert(var_121_1, function(arg_127_0)
			arg_121_0:OpSwitchMap(arg_121_1, arg_127_0)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventShowMapMark then
		if var_121_0.isAutoFight then
			-- block empty
		else
			table.insert(var_121_1, function(arg_128_0)
				arg_121_0:OpShowMarkOverview({
					ids = var_121_4
				}, arg_128_0)
			end)
		end

		table.insert(var_121_1, function(arg_129_0)
			arg_121_1:Apply()
			arg_129_0()
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventCameraMove then
		table.insert(var_121_1, function(arg_130_0)
			arg_121_0:OpMoveCamera(var_121_4[1], var_121_4[2], function()
				arg_121_1:Apply()
				arg_130_0()
			end)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventShakePlane then
		table.insert(var_121_1, function(arg_132_0)
			arg_121_0:OpShakePlane(var_121_4[1], var_121_4[2], var_121_4[3], var_121_4[4], function()
				arg_121_1:Apply()
				arg_132_0()
			end)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventBlink1 or var_121_3 == WorldMapAttachment.EffectEventBlink2 then
		table.insert(var_121_1, function(arg_134_0)
			var_121_0:TriggerAutoFight(false)
			arg_121_0:OpActions(arg_121_1.childOps, function()
				arg_121_1:Apply()
				arg_134_0()
			end)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventFlash then
		table.insert(var_121_1, function(arg_136_0)
			local var_136_0 = Color.New(var_121_4[4][1] / 255, var_121_4[4][2] / 255, var_121_4[4][3] / 255, var_121_4[4][4] / 255)

			arg_121_0:OpFlash(var_121_4[1], var_121_4[2], var_121_4[3], var_136_0, function()
				arg_121_1:Apply()
				arg_136_0()
			end)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventShipBuff then
		table.insert(var_121_1, function(arg_138_0)
			arg_121_1:Apply()
			arg_138_0()
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventHelp then
		if var_121_0.isAutoFight then
			-- block empty
		else
			table.insert(var_121_1, function(arg_139_0)
				local var_139_0 = WorldConst.BuildHelpTips(var_121_0:GetProgress())

				var_139_0.defaultpage = var_121_4[1]

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = var_139_0,
					onClose = arg_139_0
				})
			end)
		end

		table.insert(var_121_1, function(arg_140_0)
			arg_121_1:Apply()
			arg_140_0()
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventProgress then
		table.insert(var_121_1, function(arg_141_0)
			arg_121_0:OpActions(arg_121_1.childOps, function()
				arg_121_1:Apply()
				arg_141_0()
			end)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventReturn2World then
		table.insert(var_121_1, function(arg_143_0)
			var_121_0:TriggerAutoFight(false)
			arg_121_0:OpSetInMap(false, function()
				arg_121_1:Apply()
				arg_143_0()
			end)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventShowPort then
		table.insert(var_121_1, function(arg_145_0)
			arg_121_1:Apply()
			var_121_0:TriggerAutoFight(false)
			var_0_1:OpenPortLayer({
				page = var_121_4[1]
			})
			arg_145_0()
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventGlobalBuff then
		local var_121_10 = {
			id = var_121_4[1],
			floor = var_121_4[2],
			before = var_121_0:GetGlobalBuff(var_121_4[1]):GetFloor()
		}

		if var_121_0.isAutoFight then
			var_121_0:AddAutoInfo("buffs", var_121_10)
		else
			table.insert(var_121_1, function(arg_146_0)
				var_0_1:ShowSubView("GlobalBuff", {
					var_121_10,
					arg_146_0
				})
			end)
		end

		table.insert(var_121_1, function(arg_147_0)
			arg_121_1:Apply()
			arg_147_0()
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventSound then
		table.insert(var_121_1, function(arg_148_0)
			arg_121_0:OpPlaySound(var_121_4[1], function()
				arg_121_1:Apply()
				arg_148_0()
			end)
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventHelpLayer then
		table.insert(var_121_1, function(arg_150_0)
			var_121_0:TriggerAutoFight(false)
			arg_121_1:Apply()
			arg_121_0:OpOpenLayer(Context.New({
				mediator = WorldHelpMediator,
				viewComponent = WorldHelpLayer,
				data = {
					titleId = var_121_4[1],
					pageId = var_121_4[2]
				},
				onRemoved = arg_150_0
			}))
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventFleetShipHP then
		table.insert(var_121_1, function(arg_151_0)
			arg_121_1:Apply()

			if var_121_4[1] > 0 then
				arg_121_0:OpShowAllFleetHealth(arg_151_0)
			else
				arg_151_0()
			end
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventCatSalvage then
		table.insert(var_121_1, function(arg_152_0)
			arg_121_1:Apply()
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_catsearch_success"))
			arg_152_0()
		end)
	elseif var_121_3 == WorldMapAttachment.EffectEventTeleportEvent then
		table.insert(var_121_1, function(arg_153_0)
			arg_121_1:Apply()

			local var_153_0 = var_0_1.wsMap:GetFleet()

			var_0_1.wsDragProxy:Focus(var_153_0.transform.position, nil, LeanTweenType.easeInOutSine, arg_153_0)
		end)
	else
		table.insert(var_121_1, function(arg_154_0)
			arg_121_1:Apply()
			arg_154_0()
		end)
	end

	seriesAsync(var_121_1, arg_121_2)
end

function var_0_0.OpReqRetreat(arg_155_0, arg_155_1)
	local var_155_0 = nowWorld():GetActiveMap():GetCell(arg_155_1.row, arg_155_1.column)

	assert(var_155_0:ExistEnemy())

	local var_155_1 = var_155_0:GetAliveAttachment()

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqRetreat,
		id = arg_155_1.id,
		attachment = var_155_1
	}))
end

function var_0_0.OpReqRetreatDone(arg_156_0, arg_156_1)
	local var_156_0 = {}

	table.insert(var_156_0, function(arg_157_0)
		arg_156_0:OpActions(arg_156_1.childOps, arg_157_0)
	end)
	seriesAsync(var_156_0, function()
		arg_156_1:Apply()
		arg_156_0:OpInteractive()
	end)
end

function var_0_0.OpTransport(arg_159_0, arg_159_1, arg_159_2)
	arg_159_0:OpDone()

	local var_159_0 = nowWorld()
	local var_159_1 = var_159_0:GetActiveMap()

	if not var_159_0:IsSystemOpen(WorldConst.SystemOutMap) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_systemClose"))
	elseif not arg_159_2:IsMapOpen() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_map_not_open"))
	else
		arg_159_0:OpReqTransport(var_159_1:GetFleet(), arg_159_1, arg_159_2)
	end
end

function var_0_0.OpReqTransport(arg_160_0, arg_160_1, arg_160_2, arg_160_3)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqTransport,
		id = arg_160_1.id,
		arg1 = arg_160_3.id,
		arg2 = arg_160_2.id,
		locations = {
			arg_160_3:CalcTransportPos(nowWorld():GetActiveEntrance(), arg_160_2)
		}
	}))
end

function var_0_0.OpReqTransportDone(arg_161_0, arg_161_1)
	local var_161_0 = {}

	seriesAsync(var_161_0, function()
		arg_161_0:OpSwitchMap(arg_161_1)
	end)
end

function var_0_0.OpReqSub(arg_163_0, arg_163_1)
	assert(nowWorld():CanCallSubmarineSupport())

	var_0_1.subCallback = arg_163_1

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqSub,
		id = nowWorld():GetSubmarineFleet().id
	}))
end

function var_0_0.OpReqSubDone(arg_164_0, arg_164_1)
	local var_164_0 = nowWorld()
	local var_164_1 = var_164_0:CalcOrderCost(WorldConst.OpReqSub)

	var_164_0.staminaMgr:ConsumeStamina(var_164_1)
	var_164_0:SetReqCDTime(WorldConst.OpReqSub, pg.TimeMgr.GetInstance():GetServerTime())

	local var_164_2 = var_164_0:GetSubmarineFleet():GetFlagShipVO()

	var_0_1:DoStrikeAnim(var_164_2:GetMapStrikeAnim(), var_164_2, function()
		arg_164_1:Apply()

		if var_0_1.subCallback then
			local var_165_0 = var_0_1.subCallback

			var_0_1.subCallback = nil

			var_165_0()
		end
	end)
end

function var_0_0.OpReqJumpOut(arg_166_0, arg_166_1, arg_166_2)
	local var_166_0 = {}

	if not arg_166_2 then
		table.insert(var_166_0, function(arg_167_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = pg.world_chapter_template_reset[arg_166_1].tip,
				onYes = arg_167_0,
				onNo = function()
					arg_166_0:OpDone()
				end
			})
		end)
	end

	seriesAsync(var_166_0, function()
		var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
			op = WorldConst.OpReqJumpOut,
			skipDisplay = arg_166_2
		}))
	end)
end

function var_0_0.OpReqJumpOutDone(arg_170_0, arg_170_1)
	local var_170_0 = {}

	if not arg_170_1.skipDisplay then
		table.insert(var_170_0, function(arg_171_0)
			var_0_1:ShowTransportMarkOverview({
				ids = {
					arg_170_1.entranceId
				}
			}, arg_171_0)
		end)
	end

	seriesAsync(var_170_0, function()
		arg_170_0:OpSwitchMap(arg_170_1)
	end)
end

function var_0_0.OpReqSwitchFleet(arg_173_0, arg_173_1)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqSwitchFleet,
		id = arg_173_1.id
	}))
end

function var_0_0.OpReqSwitchFleetDone(arg_174_0, arg_174_1)
	local var_174_0 = nowWorld()
	local var_174_1 = table.indexof(var_174_0.fleets, var_174_0:GetFleet(arg_174_1.id))

	var_174_0:GetActiveMap():UpdateFleetIndex(var_174_1)
	var_0_1.wsMap:UpdateRangeVisible(false)
	arg_174_0:OpInteractive()
end

function var_0_0.OpStory(arg_175_0, arg_175_1, arg_175_2, arg_175_3, arg_175_4, arg_175_5)
	local function var_175_0(arg_176_0, arg_176_1)
		arg_175_0:OpDone()
		existCall(arg_175_5, arg_176_1)
	end

	pg.NewStoryMgr.GetInstance():PlayForWorld(arg_175_1, arg_175_4, var_175_0, arg_175_2, false, tobool(arg_175_4), arg_175_3)
end

function var_0_0.OpTriggerSign(arg_177_0, arg_177_1, arg_177_2, arg_177_3)
	assert(arg_177_2:IsSign())
	arg_177_0:OpDone()

	if arg_177_2:IsAvatar() then
		local var_177_0 = var_0_1.wsMap:GetAttachment(arg_177_2.row, arg_177_2.column, arg_177_2.type)
		local var_177_1 = var_0_1.wsMap:GetFleet()

		if arg_177_2.column ~= var_177_1.fleet.column then
			local var_177_2 = var_177_0:GetModelAngles()

			var_177_2.y = arg_177_2.column < var_177_1.fleet.column and 0 or 180

			var_177_0:UpdateModelAngles(var_177_2)

			local var_177_3 = var_177_1:GetModelAngles()

			var_177_3.y = 180 - var_177_2.y

			var_177_1:UpdateModelAngles(var_177_3)
		end
	end

	local var_177_4 = {}
	local var_177_5 = arg_177_2:GetEventEffects()

	_.each(var_177_5, function(arg_178_0)
		local var_178_0 = arg_178_0.effect_type
		local var_178_1 = arg_178_0.effect_paramater

		if var_178_0 == WorldMapAttachment.EffectEventStoryOptionClient then
			local var_178_2 = var_178_1[1]
			local var_178_3 = arg_178_0.autoflag[1]

			if var_178_3 and WorldConst.CheckWorldStorySkip(var_178_2) then
				table.insert(var_177_4, function(arg_179_0)
					arg_179_0(var_178_3)
				end)
			else
				table.insert(var_177_4, function(arg_180_0)
					arg_177_0:OpStory(var_178_2, true, true, nowWorld().isAutoFight and var_178_3 and {
						var_178_3
					} or false, arg_180_0)
				end)
			end

			table.insert(var_177_4, function(arg_181_0, arg_181_1)
				assert(arg_181_1, "without option in story:" .. var_178_1[1])

				local var_181_0 = _.detect(var_178_1[2], function(arg_182_0)
					return arg_182_0[1] == arg_181_1
				end)

				if var_181_0 and var_181_0[2] > 0 then
					arg_177_0:OpTriggerEvent(var_0_1:NewMapOp({
						attachment = arg_177_2,
						effect = pg.world_effect_data[var_181_0[2]]
					}), arg_181_0)
				else
					arg_181_0()
				end
			end)
		else
			table.insert(var_177_4, function(arg_183_0)
				arg_177_0:OpTriggerEvent(var_0_1:NewMapOp({
					attachment = arg_177_2,
					effect = arg_178_0
				}), arg_183_0)
			end)
		end
	end)
	seriesAsync(var_177_4, arg_177_3)
end

function var_0_0.OpShowMarkOverview(arg_184_0, arg_184_1, arg_184_2)
	var_0_1:emit(WorldMediator.OnOpenLayer, Context.New({
		mediator = WorldOverviewMediator,
		viewComponent = WorldOverviewLayer,
		data = {
			info = arg_184_1
		},
		onRemoved = function()
			arg_184_0:OpDone()

			return existCall(arg_184_2)
		end
	}))
end

function var_0_0.OpFocusTargetEntrance(arg_186_0, arg_186_1)
	arg_186_0:OpDone()

	local var_186_0 = {}

	if var_0_1:GetInMap() then
		table.insert(var_186_0, function(arg_187_0)
			var_0_1:QueryTransport(arg_187_0)
		end)
	end

	seriesAsync(var_186_0, function()
		var_0_1:EnterTransportWorld(arg_186_1)
	end)
end

function var_0_0.OpShowOrderPanel(arg_189_0)
	arg_189_0:OpDone()

	local var_189_0 = nowWorld()

	var_0_1:ShowSubView("OrderPanel", {
		var_189_0:GetActiveEntrance(),
		var_189_0:GetActiveMap(),
		var_0_1.wsMapRight.wsCompass:GetAnchorEulerAngles()
	})
end

function var_0_0.OpShowScannerPanel(arg_190_0, arg_190_1, arg_190_2)
	arg_190_0:OpDone()

	local var_190_0 = nowWorld()

	var_0_1:ShowSubView("ScannerPanel", {
		var_190_0:GetActiveMap(),
		var_0_1.wsDragProxy
	}, {
		arg_190_1,
		arg_190_2
	})
end

function var_0_0.OpMoveCamera(arg_191_0, arg_191_1, arg_191_2, arg_191_3)
	arg_191_3 = var_0_1:DoTopBlock(arg_191_3)

	local var_191_0 = {}

	if arg_191_1 > 0 then
		local var_191_1 = var_0_1.wsMap.map:FindAttachments(WorldMapAttachment.TypeEvent, arg_191_1)

		for iter_191_0, iter_191_1 in ipairs(var_191_1) do
			table.insert(var_191_0, {
				focusPos = function()
					return var_0_1.wsMap:GetAttachment(iter_191_1.row, iter_191_1.column, iter_191_1.type).transform.position
				end,
				row = iter_191_1.row,
				column = iter_191_1.column
			})
		end
	else
		local var_191_2 = var_0_1.wsMap:GetFleet()

		table.insert(var_191_0, {
			focusPos = function()
				return var_191_2.transform.position
			end,
			row = var_191_2.fleet.row,
			column = var_191_2.fleet.column
		})
	end

	local var_191_3 = {}

	for iter_191_2, iter_191_3 in ipairs(var_191_0) do
		table.insert(var_191_3, function(arg_194_0)
			var_0_1.wsMapRight:UpdateCompossView(iter_191_3.row, iter_191_3.column)
			arg_194_0()
		end)
		table.insert(var_191_3, function(arg_195_0)
			var_0_1.wsDragProxy:Focus(iter_191_3.focusPos(), nil, LeanTweenType.easeInOutSine, arg_195_0)
		end)
		table.insert(var_191_3, function(arg_196_0)
			var_0_1.wsTimer:AddInMapTimer(arg_196_0, arg_191_2, 1):Start()
		end)
	end

	seriesAsync(var_191_3, function()
		arg_191_0:OpDone()

		return existCall(arg_191_3)
	end)
end

function var_0_0.OpMoveCameraTarget(arg_198_0, arg_198_1, arg_198_2, arg_198_3)
	arg_198_3 = var_0_1:DoTopBlock(arg_198_3)

	if not arg_198_1 then
		local var_198_0 = var_0_1.wsMap:GetFleet()

		arg_198_1 = {
			row = var_198_0.fleet.row,
			column = var_198_0.fleet.column
		}
	end

	local var_198_1 = {}

	table.insert(var_198_1, function(arg_199_0)
		var_0_1.wsMapRight:UpdateCompossView(arg_198_1.row, arg_198_1.column)
		arg_199_0()
	end)
	table.insert(var_198_1, function(arg_200_0)
		var_0_1.wsDragProxy:Focus(var_0_1.wsMap:GetCell(arg_198_1.row, arg_198_1.column).transform.position, nil, LeanTweenType.easeInOutSine, arg_200_0)
	end)
	table.insert(var_198_1, function(arg_201_0)
		var_0_1.wsTimer:AddInMapTimer(arg_201_0, arg_198_2, 1):Start()
	end)
	seriesAsync(var_198_1, function()
		arg_198_0:OpDone()

		return existCall(arg_198_3)
	end)
end

function var_0_0.OpShakePlane(arg_203_0, arg_203_1, arg_203_2, arg_203_3, arg_203_4, arg_203_5)
	var_0_1.wsDragProxy:ShakePlane(arg_203_1, arg_203_2, arg_203_3, arg_203_4, function()
		arg_203_0:OpDone()

		if arg_203_5 then
			arg_203_5()
		end
	end)
end

function var_0_0.OpAttachmentAnim(arg_205_0, arg_205_1, arg_205_2)
	local var_205_0 = arg_205_1.attachment
	local var_205_1 = var_0_1.wsMap:GetAttachment(var_205_0.row, var_205_0.column, var_205_0.type)

	seriesAsync({
		function(arg_206_0)
			var_205_1:PlayModelAction(arg_205_1.anim, arg_205_1.duration, arg_206_0)
		end
	}, function()
		var_205_1:FlushModelAction()
		arg_205_0:OpDone()
		arg_205_2()
	end)
end

function var_0_0.OpFleetAnim(arg_208_0, arg_208_1, arg_208_2)
	local var_208_0 = var_0_1.wsMap.map:GetFleet(arg_208_1.id)
	local var_208_1 = var_0_1.wsMap:GetFleet(var_208_0)

	seriesAsync({
		function(arg_209_0)
			var_208_1:PlayModelAction(arg_208_1.anim, arg_208_1.duration, arg_209_0)
		end
	}, function()
		var_208_1:FlushModelAction()
		arg_208_0:OpDone()
		arg_208_2()
	end)
end

function var_0_0.OpFlash(arg_211_0, arg_211_1, arg_211_2, arg_211_3, arg_211_4, arg_211_5)
	local var_211_0 = var_0_1.rtTop:Find("flash")

	setActive(var_211_0, true)
	setImageColor(var_211_0, arg_211_4)
	setImageAlpha(var_211_0, 0)
	var_0_1.wsTimer:AddInMapTween(LeanTween.alpha(var_211_0, arg_211_4.a, arg_211_1).uniqueId)
	var_0_1.wsTimer:AddInMapTween(LeanTween.alpha(var_211_0, 0, arg_211_3):setDelay(arg_211_1 + arg_211_2):setOnComplete(System.Action(function()
		setActive(var_211_0, false)
		arg_211_0:OpDone()
		arg_211_5()
	end)).uniqueId)
end

function var_0_0.OpReqBox(arg_213_0, arg_213_1, arg_213_2)
	assert(arg_213_2 and arg_213_2.type == WorldMapAttachment.TypeBox)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqBox,
		id = arg_213_1.id,
		attachment = arg_213_2
	}))
end

function var_0_0.OpReqBoxDone(arg_214_0, arg_214_1)
	arg_214_1:Apply()
	arg_214_0:OpInteractive()
end

function var_0_0.OpSetInMap(arg_215_0, arg_215_1, arg_215_2)
	arg_215_0:OpDone()
	var_0_1:SetInMap(arg_215_1, arg_215_2)
end

function var_0_0.OpSwitchInMap(arg_216_0, arg_216_1)
	local var_216_0 = {}

	table.insert(var_216_0, function(arg_217_0)
		var_0_1:DisplayMap()
		var_0_1:DisplayMapUI()
		var_0_1:UpdateMapUI()

		return arg_217_0()
	end)
	table.insert(var_216_0, function(arg_218_0)
		var_0_1:EaseInMapUI(arg_218_0)
	end)
	table.insert(var_216_0, function(arg_219_0)
		arg_216_0:OpDone()

		return arg_219_0()
	end)
	seriesAsync(var_216_0, arg_216_1)
end

function var_0_0.OpSwitchOutMap(arg_220_0, arg_220_1)
	local var_220_0 = {}

	table.insert(var_220_0, function(arg_221_0)
		var_0_1:EaseOutMapUI(arg_221_0)
	end)
	table.insert(var_220_0, function(arg_222_0)
		var_0_1:HideMap()
		var_0_1:HideMapUI()

		return arg_222_0()
	end)
	table.insert(var_220_0, function(arg_223_0)
		arg_220_0:OpDone()

		return arg_223_0()
	end)
	seriesAsync(var_220_0, arg_220_1)
end

function var_0_0.OpSwitchInWorld(arg_224_0, arg_224_1)
	local var_224_0 = {}

	table.insert(var_224_0, function(arg_225_0)
		var_0_1:DisplayAtlas()
		var_0_1:DisplayAtlasUI()

		return arg_225_0()
	end)
	table.insert(var_224_0, function(arg_226_0)
		var_0_1:EaseInAtlasUI(arg_226_0)
	end)
	table.insert(var_224_0, function(arg_227_0)
		arg_224_0:OpDone()

		return arg_227_0()
	end)
	seriesAsync(var_224_0, arg_224_1)
end

function var_0_0.OpSwitchOutWorld(arg_228_0, arg_228_1)
	local var_228_0 = {}

	table.insert(var_228_0, function(arg_229_0)
		var_0_1:EaseOutAtlasUI(arg_229_0)
	end)
	table.insert(var_228_0, function(arg_230_0)
		var_0_1:HideAtlas()
		var_0_1:HideAtlasUI()

		return arg_230_0()
	end)
	table.insert(var_228_0, function(arg_231_0)
		arg_228_0:OpDone()

		return arg_231_0()
	end)
	seriesAsync(var_228_0, arg_228_1)
end

function var_0_0.OpRedeploy(arg_232_0)
	arg_232_0:OpDone()

	local var_232_0 = nowWorld()
	local var_232_1 = var_232_0:GetActiveMap()

	if underscore.any(var_232_1:GetNormalFleets(), function(arg_233_0)
		return #arg_233_0:GetCarries() > 0
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_redeploy_3"))

		return
	end

	if var_232_1:CheckFleetSalvage(true) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_catsearch_fleetcheck"),
			onYes = function()
				var_232_1.salvageAutoResult = true

				arg_232_0:OpInteractive()
			end
		})
	else
		local var_232_2, var_232_3 = var_232_0:BuildFormationIds()

		arg_232_0:OpOpenScene(SCENE.WORLD_FLEET_SELECT, {
			type = var_232_2,
			fleets = var_232_3
		})
	end
end

function var_0_0.OpKillWorld(arg_235_0)
	getProxy(ContextProxy):getContextByMediator(WorldMediator).onRemoved = function()
		pg.m02:sendNotification(GAME.WORLD_KILL)
	end

	var_0_1:ExitWorld(function()
		arg_235_0:OpDone()
	end, true)
end

function var_0_0.OpReqMaintenance(arg_238_0, arg_238_1)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqMaintenance,
		id = arg_238_1
	}))
end

function var_0_0.OpReqMaintenanceDone(arg_239_0, arg_239_1)
	arg_239_1:Apply()

	local var_239_0 = nowWorld()
	local var_239_1 = var_239_0:GetFleets()

	_.each(var_239_1, function(arg_240_0)
		arg_240_0:ClearDamageLevel()

		for iter_240_0, iter_240_1 in ipairs(arg_240_0:GetShips(true)) do
			iter_240_1:Repair()
		end
	end)

	local var_239_2 = var_239_0:CalcOrderCost(WorldConst.OpReqMaintenance)

	var_239_0.staminaMgr:ConsumeStamina(var_239_2)
	var_239_0:SetReqCDTime(WorldConst.OpReqMaintenance, pg.TimeMgr.GetInstance():GetServerTime())
	var_0_1.wsMap:UpdateRangeVisible(false)
	arg_239_0:OpShowAllFleetHealth(function()
		arg_239_0:OpInteractive()
	end)
end

function var_0_0.OpReqVision(arg_242_0)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqVision
	}))
end

function var_0_0.OpReqVisionDone(arg_243_0, arg_243_1)
	arg_243_1:Apply()

	local var_243_0 = nowWorld()
	local var_243_1 = var_243_0:CalcOrderCost(WorldConst.OpReqVision)

	var_243_0.staminaMgr:ConsumeStamina(var_243_1)
	var_243_0:SetReqCDTime(WorldConst.OpReqVision, pg.TimeMgr.GetInstance():GetServerTime())
	var_243_0:GetActiveMap():UpdateVisionFlag(true)
	var_0_1.wsMap:UpdateRangeVisible(false)
	arg_243_0:OpInteractive()
end

function var_0_0.OpReqPressingMap(arg_244_0)
	local var_244_0 = nowWorld():GetActiveMap()
	local var_244_1 = var_244_0:GetFleet().id

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqPressingMap,
		id = var_244_1,
		arg1 = var_244_0.id
	}))
end

function var_0_0.OpReqPressingMapDone(arg_245_0, arg_245_1, arg_245_2)
	local var_245_0 = arg_245_2
	local var_245_1 = arg_245_1.arg1
	local var_245_2 = nowWorld()

	if var_245_2:GetMap(var_245_1):CheckMapPressingDisplay() then
		table.insert(var_245_0, 1, function(arg_246_0)
			var_0_1:BuildCutInAnim("WorldPressingWindow", arg_246_0)
		end)
	end

	local var_245_3 = var_245_2:GetPressingAward(var_245_1)

	if var_245_3 and var_245_3.flag then
		local var_245_4 = pg.world_event_complete[var_245_3.id].event_reward_slgbuff

		if #var_245_4 > 1 then
			local var_245_5 = {
				id = var_245_4[1],
				floor = var_245_4[2],
				before = var_245_2:GetGlobalBuff(var_245_4[1]):GetFloor()
			}

			if var_245_2.isAutoFight then
				var_245_2:AddAutoInfo("buffs", var_245_5)
			else
				table.insert(var_245_0, function(arg_247_0)
					var_0_1:ShowSubView("GlobalBuff", {
						var_245_5,
						arg_247_0
					})
				end)
			end

			table.insert(var_245_0, function(arg_248_0)
				var_245_2:AddGlobalBuff(var_245_4[1], var_245_4[2])
				arg_248_0()
			end)
		end
	end

	seriesAsync(var_245_0, function()
		arg_245_1:Apply()
		var_0_1.wsMap:UpdateRangeVisible(false)
		arg_245_0:OpInteractive()
	end)
end

function var_0_0.OpReqEnterPort(arg_250_0)
	local var_250_0 = nowWorld()
	local var_250_1 = var_250_0:GetActiveMap():GetPort()

	if var_250_1:IsOpen(var_250_0:GetRealm(), var_250_0:GetProgress()) then
		var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
			op = WorldConst.OpReqEnterPort
		}))
	else
		pg.TipsMgr.GetInstance():ShowTips("port is not open: " .. var_250_1.id)
	end
end

function var_0_0.OpReqEnterPortDone(arg_251_0, arg_251_1)
	arg_251_1:Apply()
	var_0_1:OpenPortLayer()
end

function var_0_0.OpReqCatSalvage(arg_252_0, arg_252_1)
	arg_252_1 = arg_252_1 or nowWorld():GetActiveMap():CheckFleetSalvage()

	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqCatSalvage,
		id = arg_252_1
	}))
end

function var_0_0.OpReqCatSalvageDone(arg_253_0, arg_253_1, arg_253_2)
	local var_253_0 = arg_253_2
	local var_253_1 = nowWorld()

	if var_253_1.isAutoFight then
		-- block empty
	else
		table.insert(var_253_0, 1, function(arg_254_0)
			local var_254_0 = var_253_1:GetFleet(arg_253_1.id):GetRarityState() > 0 and 2 or 1

			pg.NewStoryMgr.GetInstance():Play(pg.gameset.world_catsearch_completed.description[var_254_0], arg_254_0, true)
		end)
	end

	seriesAsync(var_253_0, function()
		arg_253_1:Apply()
		arg_253_0:OpInteractive()
	end)
end

function var_0_0.OpReqSkipBattle(arg_256_0, arg_256_1)
	var_0_1:emit(WorldMediator.OnMapOp, var_0_1:NewMapOp({
		op = WorldConst.OpReqSkipBattle,
		id = arg_256_1
	}))
end

function var_0_0.OpReqSkipBattleDone(arg_257_0, arg_257_1)
	arg_257_1:Apply()
	arg_257_0:OpInteractive()
end

function var_0_0.OpPlaySound(arg_258_0, arg_258_1, arg_258_2)
	var_0_1:PlaySound(arg_258_1, arg_258_2)
end

function var_0_0.OpGuide(arg_259_0, arg_259_1, arg_259_2, arg_259_3)
	arg_259_0:OpDone()

	local var_259_0 = WorldGuider.GetInstance()

	arg_259_1 = var_259_0:SpecialCheck(arg_259_1)
	arg_259_2 = arg_259_2 == 1 and true or false

	if var_259_0:PlayGuide(arg_259_1, arg_259_2, arg_259_3) then
		nowWorld():TriggerAutoFight(false)
	end
end

function var_0_0.OpTaskGoto(arg_260_0, arg_260_1)
	arg_260_0:OpDone()

	local var_260_0 = nowWorld()
	local var_260_1 = var_260_0:GetTaskProxy():getTaskById(arg_260_1)

	if var_260_1:GetFollowingAreaId() then
		arg_260_0:OpShowMarkOverview({
			mode = "Task",
			taskId = arg_260_1
		})
	elseif var_260_0:GetActiveEntrance().id ~= var_260_1:GetFollowingEntrance() then
		local var_260_2 = var_260_1:GetFollowingEntrance()
		local var_260_3 = var_260_0:GetAtlas():GetTaskDic(var_260_1.id)

		var_0_1:QueryTransport(function()
			var_0_1:EnterTransportWorld({
				entrance = var_260_0:GetEntrance(var_260_2),
				mapTypes = var_260_3[var_260_2] and {
					"task_chapter"
				} or {
					"complete_chapter",
					"base_chapter"
				}
			})
		end)
	else
		local var_260_4 = var_260_1.config.task_goto
		local var_260_5 = var_260_1.config.following_random
		local var_260_6 = var_260_0:GetActiveMap()

		if #var_260_5 > 0 and not _.any(var_260_5, function(arg_262_0)
			return arg_262_0 == var_260_6.id
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_task_goto0"))

			return
		end

		if not var_260_4[1] then
			return
		elseif var_260_4[1] == 1 then
			local var_260_7 = {}

			for iter_260_0, iter_260_1 in ipairs(var_260_4[2]) do
				assert(pg.world_effect_data[iter_260_1], "without effect: " .. iter_260_1)
				table.insert(var_260_7, function(arg_263_0)
					local var_263_0 = var_0_1:NewMapOp({
						op = WorldConst.OpActionTaskGoto,
						effect = pg.world_effect_data[iter_260_1]
					})

					arg_260_0:OpTriggerEvent(var_263_0, arg_263_0)
				end)
			end

			seriesAsync(var_260_7, function()
				arg_260_0:OpInteractive()
			end)
		elseif var_260_4[1] == 2 then
			local var_260_8 = checkExist(var_260_0:GetActiveMap(), {
				"GetPort"
			})
			local var_260_9 = var_260_0:GetRealm()

			if var_260_9 == checkExist(var_260_8, {
				"GetRealm"
			}) and checkExist(var_260_8, {
				"IsOpen",
				{
					var_260_9,
					var_260_0:GetProgress()
				}
			}) then
				arg_260_0:OpRedeploy()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("world_instruction_redeploy_1"))

				return
			end
		elseif var_260_4[1] == 3 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_task_goto3"))

			return
		else
			assert(false, "goto info error:" .. var_260_4[1])

			return
		end
	end
end

function var_0_0.OpShowAllFleetHealth(arg_265_0, arg_265_1)
	arg_265_0:OpDone()

	if var_0_1:GetInMap() then
		for iter_265_0, iter_265_1 in ipairs(var_0_1.wsMap.wsMapFleets) do
			iter_265_1:DisplayHealth()
		end
	end

	return existCall(arg_265_1)
end

function var_0_0.OpAutoSubmitTask(arg_266_0, arg_266_1)
	var_0_1:emit(WorldMediator.OnAutoSubmitTask, arg_266_1)
end

function var_0_0.OpAutoSubmitTaskDone(arg_267_0, arg_267_1)
	arg_267_0:OpInteractive()
end

function var_0_0.OpTrapGravityAnim(arg_268_0, arg_268_1, arg_268_2)
	var_0_1:ClearMoveQueue()
	var_0_1.wsMap:GetAttachment(arg_268_1.row, arg_268_1.column, arg_268_1.type):TrapAnimDisplay(function()
		arg_268_0:OpDone()
		existCall(arg_268_2)
	end)
end

function var_0_0.OpAutoFightSeach(arg_270_0)
	arg_270_0:OpDone()

	local var_270_0 = nowWorld()
	local var_270_1 = var_270_0:GetActiveMap()
	local var_270_2 = var_270_1:GetFleet()
	local var_270_3 = var_270_1:GetLongMoveRange(var_270_2)
	local var_270_4
	local var_270_5 = 0

	for iter_270_0, iter_270_1 in ipairs(var_270_3) do
		local var_270_6 = var_270_1:GetCell(iter_270_1.row, iter_270_1.column):GetEventAttachment()
		local var_270_7 = var_270_6 and var_270_6:GetEventAutoPri()

		if var_270_7 and var_270_5 < var_270_7 and var_270_1:CheckEventAutoTrigger(var_270_6) then
			var_270_4 = iter_270_1
			var_270_5 = var_270_7
		end
	end

	if var_270_4 then
		arg_270_0:OpLongMoveFleet(var_270_2, var_270_4.row, var_270_4.column)
	elseif var_270_2:IsCatSalvage() then
		local var_270_8 = var_270_3[1]

		arg_270_0:OpLongMoveFleet(var_270_2, var_270_8.row, var_270_8.column)
	else
		local var_270_9 = {}
		local var_270_10 = false

		if var_270_0.isAutoSwitch then
			local var_270_11 = {
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
			local var_270_12 = var_270_1:FindAttachments(WorldMapAttachment.TypeEvent)

			local function var_270_13(arg_271_0)
				if arg_271_0[1] and PlayerPrefs.GetInt(arg_271_0[1], 0) == 0 then
					return false
				else
					local var_271_0 = {}

					for iter_271_0, iter_271_1 in ipairs(pg.gameset[arg_271_0[2]].description) do
						var_271_0[iter_271_1] = true
					end

					return underscore.any(var_270_12, function(arg_272_0)
						return arg_272_0:IsAlive() and var_271_0[arg_272_0.id]
					end)
				end
			end

			switch(PlayerPrefs.GetInt("auto_switch_mode", 0), {
				[WorldSwitchPlanningLayer.MODE_DIFFICULT] = function()
					var_270_10 = var_270_1.isPressing and not underscore.any({
						"event_1",
						"event_2"
					}, function(arg_274_0)
						return var_270_13(var_270_11[arg_274_0])
					end)
				end,
				[WorldSwitchPlanningLayer.MODE_SAFE] = function()
					local var_275_0 = PlayerPrefs.GetString("auto_switch_difficult_safe", "only") == "only" and World.ReplacementMapType(var_270_0:GetActiveEntrance(), var_270_1) == "base_chapter"

					var_270_10 = var_270_1.isPressing and (var_275_0 or not underscore.any({
						"event_1",
						"event_2"
					}, function(arg_276_0)
						return var_270_13(var_270_11[arg_276_0])
					end))
				end,
				[WorldSwitchPlanningLayer.MODE_TREASURE] = function()
					var_270_10 = World.ReplacementMapType(var_270_0:GetActiveEntrance(), var_270_1) ~= "teasure_chapter" or not underscore.any({
						"event_1",
						"event_3"
					}, function(arg_278_0)
						return var_270_13(var_270_11[arg_278_0])
					end)
				end
			})
		end

		if var_270_10 then
			table.insert(var_270_9, function(arg_279_0)
				arg_270_0:OpAutoSwitchMap(arg_279_0)
			end)
		end

		seriesAsync(var_270_9, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("autofight_tip_bigworld_suspend"))
			var_270_0:TriggerAutoFight(false)
			arg_270_0:OpInteractive()
		end)
	end
end

function var_0_0.OpAutoSwitchMap(arg_281_0, arg_281_1)
	arg_281_0:OpDone()

	local var_281_0 = nowWorld()
	local var_281_1 = var_281_0:GetAtlas()
	local var_281_2 = var_281_0:GetActiveEntrance()
	local var_281_3 = var_281_0:GetActiveMap()
	local var_281_4 = false
	local var_281_5
	local var_281_6

	switch(PlayerPrefs.GetInt("auto_switch_mode", 0), {
		[WorldSwitchPlanningLayer.MODE_DIFFICULT] = function()
			local var_282_0 = underscore.values(var_281_1.entranceDic)

			table.sort(var_282_0, CompareFuncs({
				function(arg_283_0)
					return arg_283_0:GetBaseMap():GetDanger()
				end,
				function(arg_284_0)
					return arg_284_0.id
				end
			}))

			local var_282_1 = PlayerPrefs.GetString("auto_switch_difficult_base", "all")

			for iter_282_0, iter_282_1 in ipairs(var_282_0) do
				if var_281_1.transportDic[iter_282_1.id] then
					local var_282_2 = iter_282_1:GetBaseMap()

					if var_282_2:GetPressingLevel() > 0 and not var_282_2.isPressing and var_282_2:IsMapOpen() and WorldSwitchPlanningLayer.checkDifficultValid(var_282_1, var_282_2:GetDanger()) and not var_281_5 then
						var_281_5, var_281_6 = var_282_2, iter_282_1

						break
					end
				end
			end
		end,
		[WorldSwitchPlanningLayer.MODE_SAFE] = function()
			local var_285_0 = PlayerPrefs.GetString("auto_switch_difficult_safe", "only")

			switch(var_285_0, {
				all = function()
					local var_286_0 = var_281_0:GetActiveEntrance()
					local var_286_1 = {}

					for iter_286_0, iter_286_1 in pairs(var_281_1.entranceDic) do
						if iter_286_1 ~= var_286_0 and var_281_1.transportDic[iter_286_1.id] and iter_286_1:GetBaseMap().isPressing and #iter_286_1.config.complete_chapter > 0 then
							local var_286_2 = var_281_0:GetMap(iter_286_1.config.complete_chapter[1])

							if var_286_2:IsMapOpen() then
								table.insert(var_286_1, {
									iter_286_1,
									var_286_2
								})
							end
						end
					end

					if #var_286_1 > 0 then
						var_281_6, var_281_5 = unpack(var_286_1[math.floor(math.random() * #var_286_1) + 1])
					end
				end,
				only = function()
					var_281_6 = var_281_2

					local var_287_0 = var_281_6:GetBaseMapId()
					local var_287_1 = var_281_6.config.complete_chapter[1]

					assert(var_287_0 and var_287_1)

					if var_281_3.id == var_287_0 then
						var_281_5 = var_281_0:GetMap(var_287_1)
					elseif var_281_3.id == var_287_1 then
						var_281_5 = var_281_0:GetMap(var_287_0)
					else
						assert(false)
					end
				end
			})
		end,
		[WorldSwitchPlanningLayer.MODE_TREASURE] = function()
			if World.ReplacementMapType(var_281_2, var_281_3) == "teasure_chapter" then
				var_281_4 = true

				return
			end

			local var_288_0 = underscore.map(var_281_0:GetInventoryProxy():GetItemsByType(WorldItem.UsageWorldMap), function(arg_289_0)
				return arg_289_0.id
			end)
			local var_288_1 = underscore.filter(var_288_0, function(arg_290_0)
				return pg.world_item_data_template[arg_290_0].usage_arg[1] ~= 1
			end)
			local var_288_2 = underscore.map(var_288_1, function(arg_291_0)
				local var_291_0 = var_281_0:FindTreasureEntrance(arg_291_0)
				local var_291_1

				for iter_291_0, iter_291_1 in ipairs(var_291_0.config.teasure_chapter) do
					if arg_291_0 == iter_291_1[1] then
						var_291_1 = iter_291_1[2]

						break
					end
				end

				return {
					var_281_0:GetMap(var_291_1),
					var_291_0
				}
			end)

			table.sort(var_288_2, CompareFuncs({
				function(arg_292_0)
					return arg_292_0[1]:GetDanger()
				end,
				function(arg_293_0)
					return arg_293_0[1].id
				end
			}))

			local var_288_3 = PlayerPrefs.GetString("auto_switch_difficult_treasure", "all")

			for iter_288_0, iter_288_1 in ipairs(var_288_2) do
				local var_288_4, var_288_5 = unpack(iter_288_1)

				if var_281_1.transportDic[var_288_5.id] and var_288_4:IsMapOpen() and WorldSwitchPlanningLayer.checkDifficultValid(var_288_3, var_288_4:GetDanger()) and not var_281_5 then
					var_281_5, var_281_6 = var_288_4, var_288_5

					break
				end
			end
		end
	})

	if var_281_4 then
		arg_281_0:OpReqJumpOut(var_281_3.gid, true)
	elseif not var_281_5 then
		var_281_0:TriggerAutoSwitch(false)
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_automode_start_tip1"))

		return existCall(arg_281_1)
	elseif not var_281_5.isCost and var_281_0.staminaMgr:GetTotalStamina() < var_281_5.config.enter_cost then
		var_281_0:TriggerAutoSwitch(false)
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_automode_start_tip2"))

		return existCall(arg_281_1)
	else
		nowWorld():TriggerAutoSwitch(true)

		if var_281_5.active then
			nowWorld():TriggerAutoFight(true)
			arg_281_0:OpSetInMap(true)
		else
			arg_281_0:OpTransport(var_281_6, var_281_5)
		end
	end
end

return var_0_0

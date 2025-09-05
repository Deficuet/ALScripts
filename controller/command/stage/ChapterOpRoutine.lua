local var_0_0 = class("ChapterOpRoutine", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	return
end

function var_0_0.initData(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.op = arg_2_1
	arg_2_0.data = arg_2_2
	arg_2_0.chapter = arg_2_3
	arg_2_0.items = {}
	arg_2_0.fullpath = nil
	arg_2_0.flag = 0
	arg_2_0.extraFlag = 0
end

function var_0_0.doDropUpdate(arg_3_0)
	arg_3_0.items = PlayerConst.addTranDrop(arg_3_0.data.drop_list)

	table.insertto(arg_3_0.items, underscore.map(PlayerConst.addTranDrop(arg_3_0.data.extra_drop_list), function(arg_4_0)
		arg_4_0.riraty = true

		return arg_4_0
	end))
end

function var_0_0.doMapUpdate(arg_5_0)
	local var_5_0 = arg_5_0.data
	local var_5_1 = arg_5_0.flag
	local var_5_2 = arg_5_0.extraFlag
	local var_5_3 = arg_5_0.chapter

	if #var_5_0.map_update > 0 then
		_.each(var_5_0.map_update, function(arg_6_0)
			if arg_6_0.item_type == ChapterConst.AttachStory and arg_6_0.item_data == ChapterConst.StoryTrigger then
				local var_6_0 = ChapterCell.Line2Name(arg_6_0.pos.row, arg_6_0.pos.column)
				local var_6_1 = var_5_3:GetChapterCellAttachemnts()
				local var_6_2 = var_6_1[var_6_0]

				if var_6_2 then
					if var_6_2.flag == ChapterConst.CellFlagTriggerActive and arg_6_0.item_flag == ChapterConst.CellFlagTriggerDisabled then
						local var_6_3 = pg.map_event_template[var_6_2.attachmentId].gametip

						if var_6_3 ~= "" then
							pg.TipsMgr.GetInstance():ShowTips(i18n(var_6_3))
						end
					end

					var_6_2.attachment = arg_6_0.item_type
					var_6_2.attachmentId = arg_6_0.item_id
					var_6_2.flag = arg_6_0.item_flag
					var_6_2.data = arg_6_0.item_data
				else
					var_6_1[var_6_0] = ChapterCell.New(arg_6_0)
				end
			elseif arg_6_0.item_type ~= ChapterConst.AttachNone and arg_6_0.item_type ~= ChapterConst.AttachBorn and arg_6_0.item_type ~= ChapterConst.AttachBorn_Sub then
				local var_6_4 = ChapterCell.New(arg_6_0)

				var_5_3:mergeChapterCell(var_6_4)
			end
		end)

		var_5_1 = bit.bor(var_5_1, ChapterConst.DirtyAttachment)
		var_5_2 = bit.bor(var_5_2, ChapterConst.DirtyAutoAction)
	end

	arg_5_0.flag = var_5_1
	arg_5_0.extraFlag = var_5_2
end

function var_0_0.doCellFlagUpdate(arg_7_0)
	local var_7_0 = arg_7_0.data
	local var_7_1 = arg_7_0.flag
	local var_7_2 = arg_7_0.chapter

	if #var_7_0.cell_flag_list > 0 then
		_.each(var_7_0.cell_flag_list, function(arg_8_0)
			local var_8_0 = var_7_2:getChapterCell(arg_8_0.pos.row, arg_8_0.pos.column)

			if var_8_0 then
				var_8_0:updateFlagList(arg_8_0)
			else
				var_8_0 = ChapterCell.New(arg_8_0)
			end

			arg_7_0.chapter:updateChapterCell(var_8_0)
		end)

		var_7_1 = bit.bor(var_7_1, ChapterConst.DirtyCellFlag)
	end

	arg_7_0.flag = var_7_1
end

function var_0_0.doAIUpdate(arg_9_0)
	local var_9_0 = arg_9_0.data
	local var_9_1 = arg_9_0.flag
	local var_9_2 = arg_9_0.extraFlag
	local var_9_3 = arg_9_0.chapter

	if #var_9_0.ai_list > 0 then
		_.each(var_9_0.ai_list, function(arg_10_0)
			local var_10_0 = ChapterChampionPackage.New(arg_10_0)

			var_9_3:mergeChampion(var_10_0)
		end)

		var_9_1 = bit.bor(var_9_1, ChapterConst.DirtyChampion)
		var_9_2 = bit.bor(var_9_2, ChapterConst.DirtyAutoAction)
	end

	arg_9_0.flag = var_9_1
	arg_9_0.extraFlag = var_9_2
end

function var_0_0.doShipUpdate(arg_11_0)
	local var_11_0 = arg_11_0.data
	local var_11_1 = arg_11_0.flag
	local var_11_2 = arg_11_0.chapter

	if #var_11_0.ship_update > 0 then
		_.each(var_11_0.ship_update, function(arg_12_0)
			var_11_2:updateFleetShipHp(arg_12_0.id, arg_12_0.hp_rant)

			var_11_1 = bit.bor(var_11_1, ChapterConst.DirtyStrategy)
		end)

		var_11_1 = bit.bor(var_11_1, ChapterConst.DirtyFleet)
	end

	arg_11_0.flag = var_11_1
end

function var_0_0.doBuffUpdate(arg_13_0)
	local var_13_0 = arg_13_0.data

	arg_13_0.chapter:UpdateBuffList(var_13_0.buff_list)
end

function var_0_0.doExtraFlagUpdate(arg_14_0)
	local var_14_0 = arg_14_0.data
	local var_14_1 = arg_14_0.chapter
	local var_14_2 = getProxy(ChapterProxy)

	if #var_14_0.add_flag_list > 0 or #var_14_0.del_flag_list > 0 then
		var_14_2:updateExtraFlag(var_14_1, var_14_0.add_flag_list, var_14_0.del_flag_list)

		arg_14_0.flag = bit.bor(arg_14_0.flag, ChapterConst.DirtyFleet, ChapterConst.DirtyStrategy, ChapterConst.DirtyCellFlag, ChapterConst.DirtyFloatItems, ChapterConst.DirtyAttachment)
	end
end

function var_0_0.doRetreat(arg_15_0)
	local var_15_0 = arg_15_0.op
	local var_15_1 = arg_15_0.flag
	local var_15_2 = arg_15_0.chapter

	if var_15_0.id then
		if #var_15_2.fleets > 0 then
			local var_15_3 = var_15_2.fleets[var_15_0.id]

			var_15_2.fleets = _.filter(var_15_2.fleets, function(arg_16_0)
				return arg_16_0.id ~= var_15_0.id
			end)

			if var_15_3 and var_15_3:getFleetType() == FleetType.Normal then
				var_15_2.findex = 1
			end

			var_15_1 = bit.bor(var_15_1, ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampion, ChapterConst.DirtyStrategy)
		end
	else
		var_15_2:retreat(var_15_0.win)
	end

	arg_15_0.flag = var_15_1
end

function var_0_0.doMove(arg_17_0)
	local var_17_0 = arg_17_0.extraFlag
	local var_17_1 = arg_17_0.data
	local var_17_2 = arg_17_0.chapter
	local var_17_3

	if #var_17_1.move_path > 0 then
		var_17_3 = _.map(_.rest(var_17_1.move_path, 1), function(arg_18_0)
			return {
				row = arg_18_0.row,
				column = arg_18_0.column
			}
		end)
		var_17_2.moveStep = var_17_2.moveStep + #var_17_1.move_path
		var_17_0 = bit.bor(var_17_0, ChapterConst.DirtyAutoAction)
	end

	arg_17_0.fullpath = var_17_3

	var_17_2:IncreaseRound()

	arg_17_0.extraFlag = var_17_0
end

function var_0_0.doOpenBox(arg_19_0)
	local var_19_0 = arg_19_0.items
	local var_19_1 = arg_19_0.flag
	local var_19_2 = arg_19_0.chapter
	local var_19_3 = var_19_2.fleet
	local var_19_4 = var_19_3.line
	local var_19_5 = var_19_2:getChapterCell(var_19_4.row, var_19_4.column)

	var_19_5.flag = ChapterConst.CellFlagDisabled

	local var_19_6 = bit.bor(var_19_1, ChapterConst.DirtyAttachment)
	local var_19_7 = pg.box_data_template[var_19_5.attachmentId]

	assert(var_19_7, "box_data_template not exist: " .. var_19_5.attachmentId)

	if var_19_7.type == ChapterConst.BoxStrategy then
		local var_19_8 = var_19_7.effect_id
		local var_19_9 = var_19_7.effect_arg

		var_19_3:achievedStrategy(var_19_8, var_19_9)
		table.insert(var_19_0, Drop.New({
			type = DROP_TYPE_STRATEGY,
			id = var_19_8,
			count = var_19_9
		}))

		var_19_6 = bit.bor(var_19_6, ChapterConst.DirtyStrategy)
	elseif var_19_7.type == ChapterConst.BoxSupply then
		local var_19_10, var_19_11 = var_19_2:getFleetAmmo(var_19_3)

		var_19_3.restAmmo = var_19_3.restAmmo + math.min(var_19_10 - var_19_11, var_19_7.effect_id)
		var_19_6 = bit.bor(var_19_6, ChapterConst.DirtyFleet)

		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply_p1", var_19_7.effect_id))
	end

	var_19_2:clearChapterCell(var_19_4.row, var_19_4.column)

	arg_19_0.flag = var_19_6
	arg_19_0.extraFlag = bit.bor(arg_19_0.extraFlag, ChapterConst.DirtyAutoAction)
end

function var_0_0.doPlayStory(arg_20_0)
	local var_20_0 = arg_20_0.flag
	local var_20_1 = arg_20_0.chapter
	local var_20_2 = var_20_1.fleet.line
	local var_20_3 = var_20_1:getChapterCell(var_20_2.row, var_20_2.column)

	var_20_3.flag = ChapterConst.CellFlagDisabled

	var_20_1:updateChapterCell(var_20_3)

	arg_20_0.flag = bit.bor(var_20_0, ChapterConst.DirtyAttachment)
end

function var_0_0.doAmbush(arg_21_0)
	local var_21_0 = arg_21_0.op
	local var_21_1 = arg_21_0.chapter
	local var_21_2 = var_21_1.fleet

	if var_21_0.arg1 == 1 then
		local var_21_3 = var_21_2.line
		local var_21_4 = var_21_1:getChapterCell(var_21_3.row, var_21_3.column)

		if var_21_4.flag == ChapterConst.CellFlagAmbush then
			var_21_1:clearChapterCell(var_21_3.row, var_21_3.column)
		end

		pg.TipsMgr.GetInstance():ShowTips(var_21_4.flag == ChapterConst.CellFlagActive and i18n("chapter_tip_aovid_failed") or i18n("chapter_tip_aovid_succeed"))
	end
end

function var_0_0.doStrategy(arg_22_0)
	local var_22_0 = arg_22_0.flag
	local var_22_1 = arg_22_0.op
	local var_22_2 = arg_22_0.chapter
	local var_22_3 = pg.strategy_data_template[var_22_1.arg1]

	if var_22_3.type == ChapterConst.StgTypeForm then
		local var_22_4 = var_22_2.fleet

		for iter_22_0, iter_22_1 in ipairs(var_22_4.stgIds) do
			if pg.strategy_data_template[iter_22_1].type == ChapterConst.StgTypeForm then
				var_22_4.stgIds[iter_22_0] = var_22_3.id
			end
		end

		PlayerPrefs.SetInt("team_formation_" .. var_22_4.id, var_22_3.id)
		pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_change", var_22_3.name))
	elseif var_22_3.type == ChapterConst.StgTypeConsume then
		var_22_2.fleet:consumeOneStrategy(var_22_3.id)

		if var_22_3.id == ChapterConst.StrategyRepair or var_22_3.id == ChapterConst.StrategyExchange then
			pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_use", var_22_3.name))
		end

		if var_22_3.id == ChapterConst.StrategyExchange then
			local var_22_5 = var_22_2:getFleetById(var_22_1.id)
			local var_22_6 = var_22_2:getFleetById(var_22_1.arg2)

			var_22_5.line, var_22_6.line = var_22_6.line, var_22_5.line
			var_22_0 = bit.bor(var_22_0, ChapterConst.DirtyFleet)
		end
	elseif var_22_3.type == ChapterConst.StgTypeBindSupportConsume then
		var_22_2:getChapterSupportFleet():consumeOneStrategy(var_22_3.id)
	end

	arg_22_0.flag = bit.bor(var_22_0, ChapterConst.DirtyStrategy)
end

function var_0_0.doRepair(arg_23_0)
	local var_23_0 = getProxy(ChapterProxy)

	var_23_0.repairTimes = var_23_0.repairTimes + 1

	local var_23_1, var_23_2, var_23_3 = ChapterConst.GetRepairParams()

	if var_23_1 < var_23_0.repairTimes then
		local var_23_4 = getProxy(PlayerProxy)
		local var_23_5 = var_23_4:getData()

		var_23_5:consume({
			gem = var_23_3
		})
		var_23_4:updatePlayer(var_23_5)
	end
end

function var_0_0.doSupply(arg_24_0)
	local var_24_0 = arg_24_0.flag
	local var_24_1 = arg_24_0.chapter
	local var_24_2 = var_24_1.fleet
	local var_24_3, var_24_4 = var_24_1:getFleetAmmo(var_24_2)
	local var_24_5 = var_24_2.line
	local var_24_6 = var_24_1:getChapterCell(var_24_5.row, var_24_5.column)
	local var_24_7 = math.min(var_24_6.attachmentId, var_24_3 - var_24_4)

	var_24_6.attachmentId = var_24_6.attachmentId - var_24_7
	var_24_2.restAmmo = var_24_2.restAmmo + var_24_7

	var_24_1:updateChapterCell(var_24_6)

	if var_24_6.attachmentId > 20 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply_p1", var_24_7))
	elseif var_24_6.attachmentId > 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply", var_24_7, var_24_6.attachmentId))
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_empty", var_24_7))
	end

	arg_24_0.flag = bit.bor(var_24_0, ChapterConst.DirtyAttachment, ChapterConst.DirtyFleet)
end

function var_0_0.doSubState(arg_25_0)
	local var_25_0 = arg_25_0.flag
	local var_25_1 = arg_25_0.op

	arg_25_0.chapter.subAutoAttack = var_25_1.arg1
	arg_25_0.flag = bit.bor(var_25_0, ChapterConst.DirtyStrategy)
end

function var_0_0.doCollectAI(arg_26_0)
	local var_26_0 = arg_26_0.data

	arg_26_0.aiActs = arg_26_0.aiActs or {}

	if var_26_0.submarine_act_list then
		_.each(var_26_0.submarine_act_list, function(arg_27_0)
			table.insert(arg_26_0.aiActs, SubAIAction.New(arg_27_0))
		end)
	end

	if var_26_0.escort_act_list then
		_.each(var_26_0.escort_act_list, function(arg_28_0)
			table.insert(arg_26_0.aiActs, TransportAIAction.New(arg_28_0))
		end)
	end

	_.each(var_26_0.ai_act_list, function(arg_29_0)
		local var_29_0

		if arg_29_0.act_type == ChapterConst.ActType_TargetDown then
			if arg_26_0.op.type == ChapterConst.OpStrategy then
				if arg_26_0.op.arg1 == ChapterConst.StrategyMissileStrike then
					var_29_0 = ChapterMissileExplodeAction.New(arg_29_0)
				elseif arg_26_0.op.arg1 == ChapterConst.StrategyAirSupport then
					var_29_0 = ChapterAirSupportAIAction.New(arg_29_0)
				end

				var_29_0:SetTargetLine({
					row = arg_26_0.op.arg2,
					column = arg_26_0.op.arg3
				})
			else
				var_29_0 = ChapterMissileExplodeAction.New(arg_29_0)
			end
		elseif arg_29_0.act_type == ChapterConst.ActType_Expel then
			var_29_0 = ChapterExpelAIAction.New(arg_29_0)

			var_29_0:SetTargetLine({
				row = arg_26_0.op.arg2,
				column = arg_26_0.op.arg3
			}, {
				row = arg_26_0.op.arg4,
				column = arg_26_0.op.arg5
			})
		else
			var_29_0 = ChapterAIAction.New(arg_29_0)
		end

		table.insert(arg_26_0.aiActs, var_29_0)
	end)
	_.each(var_26_0.fleet_act_list, function(arg_30_0)
		table.insert(arg_26_0.aiActs, FleetAIAction.New(arg_30_0))
	end)
end

function var_0_0.doBarrier(arg_31_0)
	local var_31_0 = arg_31_0.flag
	local var_31_1 = arg_31_0.op
	local var_31_2 = arg_31_0.chapter
	local var_31_3 = var_31_2:getChapterCell(var_31_1.arg1, var_31_1.arg2)

	assert(var_31_3, "cell not exist: " .. var_31_1.arg1 .. ", " .. var_31_1.arg2)

	local var_31_4 = ChapterConst.AttachBox
	local var_31_5 = _.detect(pg.box_data_template.all, function(arg_32_0)
		return pg.box_data_template[arg_32_0].type == ChapterConst.BoxBarrier
	end)

	if var_31_3.attachment ~= var_31_4 or var_31_3.attachmentId ~= var_31_5 then
		var_31_3.attachment = var_31_4
		var_31_3.attachmentId = var_31_5
		var_31_3.flag = ChapterConst.CellFlagDisabled
	end

	var_31_2.modelCount = var_31_2.modelCount + (var_31_3.flag == ChapterConst.CellFlagDisabled and -1 or 1)
	var_31_3.flag = 1 - var_31_3.flag

	var_31_2:updateChapterCell(var_31_3)

	arg_31_0.flag = bit.bor(var_31_0, ChapterConst.DirtyAttachment, ChapterConst.DirtyStrategy)
end

function var_0_0.doRequest(arg_33_0)
	local var_33_0 = arg_33_0.data
	local var_33_1 = -1
	local var_33_2 = arg_33_0.chapter.fleet

	if #var_33_0.move_path > 0 then
		local var_33_3 = var_33_0.move_path[#var_33_0.move_path]

		var_33_2.line = {
			row = var_33_3.row,
			column = var_33_3.column
		}
	end

	arg_33_0.flag = var_33_1
end

function var_0_0.doSkipBattle(arg_34_0)
	local var_34_0 = arg_34_0.flag

	arg_34_0.flag = bit.bor(var_34_0, ChapterConst.DirtyStrategy, ChapterConst.DirtyAttachment, ChapterConst.DirtyAchieve, ChapterConst.DirtyFleet, ChapterConst.DirtyChampion)
end

function var_0_0.doTeleportSub(arg_35_0)
	local var_35_0 = arg_35_0.op
	local var_35_1 = arg_35_0.chapter
	local var_35_2 = _.detect(var_35_1.fleets, function(arg_36_0)
		return arg_36_0.id == var_35_0.id
	end).startPos

	arg_35_0.fullpath = {
		var_35_2,
		{
			row = var_35_0.arg1,
			column = var_35_0.arg2
		}
	}
end

function var_0_0.doEnemyRound(arg_37_0)
	local var_37_0 = arg_37_0.chapter
	local var_37_1 = arg_37_0.extraFlag

	var_37_0:IncreaseRound()

	if var_37_0:getPlayType() == ChapterConst.TypeDefence then
		arg_37_0.flag = bit.bor(arg_37_0.flag, ChapterConst.DirtyAttachment)
	end

	arg_37_0.extraFlag = bit.bor(var_37_1, ChapterConst.DirtyAutoAction)
end

function var_0_0.doTeleportByPortal(arg_38_0)
	local var_38_0 = arg_38_0.fullpath and arg_38_0.fullpath[#arg_38_0.fullpath]

	if not var_38_0 then
		return
	end

	local var_38_1 = arg_38_0.chapter
	local var_38_2

	if arg_38_0.op.type == ChapterConst.OpMove then
		var_38_2 = var_38_1:GetCellEventByKey("jump", var_38_0.row, var_38_0.column)
	elseif arg_38_0.op.type == ChapterConst.OpSubTeleport then
		var_38_2 = var_38_1:GetCellEventByKey("jumpsub", var_38_0.row, var_38_0.column)
	end

	if not var_38_2 then
		return
	end

	local var_38_3 = {
		row = var_38_2[1],
		column = var_38_2[2]
	}

	if arg_38_0.op.type == ChapterConst.OpMove and var_38_1:getFleet(FleetType.Normal, var_38_3.row, var_38_3.column) then
		return
	end

	arg_38_0.teleportPaths = arg_38_0.teleportPaths or {}

	table.insert(arg_38_0.teleportPaths, {
		row = var_38_0.row,
		column = var_38_0.column
	})
	table.insert(arg_38_0.teleportPaths, var_38_3)
end

function var_0_0.doCollectCommonAction(arg_39_0)
	arg_39_0.aiActs = arg_39_0.aiActs or {}

	table.insert(arg_39_0.aiActs, ChapterCommonAction.New(arg_39_0))
end

function var_0_0.AddBoxAction(arg_40_0)
	local var_40_0 = arg_40_0.chapter
	local var_40_1 = var_40_0.fleet.line
	local var_40_2 = var_40_0:getChapterCell(var_40_1.row, var_40_1.column)
	local var_40_3 = pg.box_data_template[var_40_2.attachmentId]

	assert(var_40_3, "box_data_template not exist: " .. var_40_2.attachmentId)

	if var_40_3.type == ChapterConst.BoxStrategy then
		local var_40_4 = var_40_3.effect_id
		local var_40_5 = var_40_3.effect_arg

		table.insert(arg_40_0.items, Drop.New({
			type = DROP_TYPE_STRATEGY,
			id = var_40_4,
			count = var_40_5
		}))
	end

	arg_40_0.aiActs = arg_40_0.aiActs or {}

	table.insert(arg_40_0.aiActs, ChapterBoxAction.New(arg_40_0))
end

return var_0_0

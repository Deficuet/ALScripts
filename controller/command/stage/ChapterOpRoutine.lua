local var_0_0 = class("ChapterOpRoutine", pm.SimpleCommand)

function var_0_0.initData(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.op = arg_1_1
	arg_1_0.data = arg_1_2
	arg_1_0.chapter = arg_1_3
	arg_1_0.items = {}
	arg_1_0.fullpath = nil
	arg_1_0.flag = 0
	arg_1_0.extraFlag = 0
end

function var_0_0.doDropUpdate(arg_2_0)
	arg_2_0.items = PlayerConst.addTranDrop(arg_2_0.data.drop_list)

	table.insertto(arg_2_0.items, underscore.map(PlayerConst.addTranDrop(arg_2_0.data.extra_drop_list), function(arg_3_0)
		arg_3_0.riraty = true

		return arg_3_0
	end))
end

function var_0_0.doMapUpdate(arg_4_0)
	local var_4_0 = arg_4_0.data
	local var_4_1 = arg_4_0.flag
	local var_4_2 = arg_4_0.extraFlag
	local var_4_3 = arg_4_0.chapter

	if #var_4_0.map_update > 0 then
		_.each(var_4_0.map_update, function(arg_5_0)
			if arg_5_0.item_type == ChapterConst.AttachStory and arg_5_0.item_data == ChapterConst.StoryTrigger then
				local var_5_0 = ChapterCell.Line2Name(arg_5_0.pos.row, arg_5_0.pos.column)
				local var_5_1 = var_4_3:GetChapterCellAttachemnts()
				local var_5_2 = var_5_1[var_5_0]

				if var_5_2 then
					if var_5_2.flag == ChapterConst.CellFlagTriggerActive and arg_5_0.item_flag == ChapterConst.CellFlagTriggerDisabled then
						local var_5_3 = pg.map_event_template[var_5_2.attachmentId].gametip

						if var_5_3 ~= "" then
							pg.TipsMgr.GetInstance():ShowTips(i18n(var_5_3))
						end
					end

					var_5_2.attachment = arg_5_0.item_type
					var_5_2.attachmentId = arg_5_0.item_id
					var_5_2.flag = arg_5_0.item_flag
					var_5_2.data = arg_5_0.item_data
				else
					var_5_1[var_5_0] = ChapterCell.New(arg_5_0)
				end
			elseif arg_5_0.item_type ~= ChapterConst.AttachNone and arg_5_0.item_type ~= ChapterConst.AttachBorn and arg_5_0.item_type ~= ChapterConst.AttachBorn_Sub then
				local var_5_4 = ChapterCell.New(arg_5_0)

				var_4_3:mergeChapterCell(var_5_4)
			end
		end)

		var_4_1 = bit.bor(var_4_1, ChapterConst.DirtyAttachment)
		var_4_2 = bit.bor(var_4_2, ChapterConst.DirtyAutoAction)
	end

	arg_4_0.flag = var_4_1
	arg_4_0.extraFlag = var_4_2
end

function var_0_0.doCellFlagUpdate(arg_6_0)
	local var_6_0 = arg_6_0.data
	local var_6_1 = arg_6_0.flag
	local var_6_2 = arg_6_0.chapter

	if #var_6_0.cell_flag_list > 0 then
		_.each(var_6_0.cell_flag_list, function(arg_7_0)
			local var_7_0 = var_6_2:getChapterCell(arg_7_0.pos.row, arg_7_0.pos.column)

			if var_7_0 then
				var_7_0:updateFlagList(arg_7_0)
			else
				var_7_0 = ChapterCell.New(arg_7_0)
			end

			arg_6_0.chapter:updateChapterCell(var_7_0)
		end)

		var_6_1 = bit.bor(var_6_1, ChapterConst.DirtyCellFlag)
	end

	arg_6_0.flag = var_6_1
end

function var_0_0.doAIUpdate(arg_8_0)
	local var_8_0 = arg_8_0.data
	local var_8_1 = arg_8_0.flag
	local var_8_2 = arg_8_0.extraFlag
	local var_8_3 = arg_8_0.chapter

	if #var_8_0.ai_list > 0 then
		_.each(var_8_0.ai_list, function(arg_9_0)
			local var_9_0 = ChapterChampionPackage.New(arg_9_0)

			var_8_3:mergeChampion(var_9_0)
		end)

		var_8_1 = bit.bor(var_8_1, ChapterConst.DirtyChampion)
		var_8_2 = bit.bor(var_8_2, ChapterConst.DirtyAutoAction)
	end

	arg_8_0.flag = var_8_1
	arg_8_0.extraFlag = var_8_2
end

function var_0_0.doShipUpdate(arg_10_0)
	local var_10_0 = arg_10_0.data
	local var_10_1 = arg_10_0.flag
	local var_10_2 = arg_10_0.chapter

	if #var_10_0.ship_update > 0 then
		_.each(var_10_0.ship_update, function(arg_11_0)
			var_10_2:updateFleetShipHp(arg_11_0.id, arg_11_0.hp_rant)

			var_10_1 = bit.bor(var_10_1, ChapterConst.DirtyStrategy)
		end)

		var_10_1 = bit.bor(var_10_1, ChapterConst.DirtyFleet)
	end

	arg_10_0.flag = var_10_1
end

function var_0_0.doBuffUpdate(arg_12_0)
	local var_12_0 = arg_12_0.data

	arg_12_0.chapter:UpdateBuffList(var_12_0.buff_list)
end

function var_0_0.doExtraFlagUpdate(arg_13_0)
	local var_13_0 = arg_13_0.data
	local var_13_1 = arg_13_0.chapter
	local var_13_2 = getProxy(ChapterProxy)

	if #var_13_0.add_flag_list > 0 or #var_13_0.del_flag_list > 0 then
		var_13_2:updateExtraFlag(var_13_1, var_13_0.add_flag_list, var_13_0.del_flag_list)

		arg_13_0.flag = bit.bor(arg_13_0.flag, ChapterConst.DirtyFleet, ChapterConst.DirtyStrategy, ChapterConst.DirtyCellFlag, ChapterConst.DirtyFloatItems, ChapterConst.DirtyAttachment)
	end
end

function var_0_0.doRetreat(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.op
	local var_14_1 = arg_14_0.flag
	local var_14_2 = arg_14_0.chapter

	if var_14_0.id then
		if #var_14_2.fleets > 0 then
			var_14_2:retreatFleet(var_14_0.id)

			var_14_1 = bit.bor(var_14_1, ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampion, ChapterConst.DirtyStrategy)
		end
	else
		var_14_2:retreat(var_14_0.win, var_14_0.arg1, arg_14_1)
	end

	arg_14_0.flag = var_14_1
end

function var_0_0.doMove(arg_15_0)
	local var_15_0 = arg_15_0.extraFlag
	local var_15_1 = arg_15_0.data
	local var_15_2 = arg_15_0.chapter
	local var_15_3

	if #var_15_1.move_path > 0 then
		var_15_3 = _.map(_.rest(var_15_1.move_path, 1), function(arg_16_0)
			return {
				row = arg_16_0.row,
				column = arg_16_0.column
			}
		end)
		var_15_2.moveStep = var_15_2.moveStep + #var_15_1.move_path
		var_15_0 = bit.bor(var_15_0, ChapterConst.DirtyAutoAction, ChapterConst.DirtyWeather)
	end

	arg_15_0.fullpath = var_15_3

	var_15_2:IncreaseRound()

	arg_15_0.extraFlag = var_15_0
end

function var_0_0.doOpenBox(arg_17_0)
	local var_17_0 = arg_17_0.items
	local var_17_1 = arg_17_0.flag
	local var_17_2 = arg_17_0.chapter
	local var_17_3 = var_17_2.fleet
	local var_17_4 = var_17_3.line
	local var_17_5 = var_17_2:getChapterCell(var_17_4.row, var_17_4.column)

	var_17_5.flag = ChapterConst.CellFlagDisabled

	local var_17_6 = bit.bor(var_17_1, ChapterConst.DirtyAttachment)
	local var_17_7 = pg.box_data_template[var_17_5.attachmentId]

	assert(var_17_7, "box_data_template not exist: " .. var_17_5.attachmentId)

	if var_17_7.type == ChapterConst.BoxStrategy then
		local var_17_8 = var_17_7.effect_id
		local var_17_9 = var_17_7.effect_arg

		var_17_3:achievedStrategy(var_17_8, var_17_9)
		table.insert(var_17_0, Drop.New({
			type = DROP_TYPE_STRATEGY,
			id = var_17_8,
			count = var_17_9
		}))

		var_17_6 = bit.bor(var_17_6, ChapterConst.DirtyStrategy)
	elseif var_17_7.type == ChapterConst.BoxSupply then
		local var_17_10, var_17_11 = var_17_2:getFleetAmmo(var_17_3)

		var_17_3.restAmmo = var_17_3.restAmmo + math.min(var_17_10 - var_17_11, var_17_7.effect_id)
		var_17_6 = bit.bor(var_17_6, ChapterConst.DirtyFleet)

		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply_p1", var_17_7.effect_id))
	end

	var_17_2:clearChapterCell(var_17_4.row, var_17_4.column)

	arg_17_0.flag = var_17_6
	arg_17_0.extraFlag = bit.bor(arg_17_0.extraFlag, ChapterConst.DirtyAutoAction)
end

function var_0_0.doPlayStory(arg_18_0)
	local var_18_0 = arg_18_0.flag
	local var_18_1 = arg_18_0.chapter
	local var_18_2 = var_18_1.fleet.line
	local var_18_3 = var_18_1:getChapterCell(var_18_2.row, var_18_2.column)

	var_18_3.flag = ChapterConst.CellFlagDisabled

	var_18_1:updateChapterCell(var_18_3)

	arg_18_0.flag = bit.bor(var_18_0, ChapterConst.DirtyAttachment)
end

function var_0_0.doAmbush(arg_19_0)
	local var_19_0 = arg_19_0.op
	local var_19_1 = arg_19_0.chapter
	local var_19_2 = var_19_1.fleet

	if var_19_0.arg1 == 1 then
		local var_19_3 = var_19_2.line
		local var_19_4 = var_19_1:getChapterCell(var_19_3.row, var_19_3.column)

		if var_19_4.flag == ChapterConst.CellFlagAmbush then
			var_19_1:clearChapterCell(var_19_3.row, var_19_3.column)
		end

		pg.TipsMgr.GetInstance():ShowTips(var_19_4.flag == ChapterConst.CellFlagActive and i18n("chapter_tip_aovid_failed") or i18n("chapter_tip_aovid_succeed"))
	end
end

function var_0_0.doStrategy(arg_20_0)
	local var_20_0 = arg_20_0.flag
	local var_20_1 = arg_20_0.op
	local var_20_2 = arg_20_0.chapter
	local var_20_3 = pg.strategy_data_template[var_20_1.arg1]

	if var_20_3.type == ChapterConst.StgTypeForm then
		local var_20_4 = var_20_2.fleet

		for iter_20_0, iter_20_1 in ipairs(var_20_4.stgIds) do
			if pg.strategy_data_template[iter_20_1].type == ChapterConst.StgTypeForm then
				var_20_4.stgIds[iter_20_0] = var_20_3.id
			end
		end

		PlayerPrefs.SetInt("team_formation_" .. var_20_4.id, var_20_3.id)
		pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_change", var_20_3.name))
	elseif var_20_3.type == ChapterConst.StgTypeConsume then
		var_20_2.fleet:consumeOneStrategy(var_20_3.id)

		if var_20_3.id == ChapterConst.StrategyRepair or var_20_3.id == ChapterConst.StrategyExchange then
			pg.TipsMgr.GetInstance():ShowTips(i18n("chapter_tip_use", var_20_3.name))
		end

		if var_20_3.id == ChapterConst.StrategyExchange then
			local var_20_5 = var_20_2:getFleetById(var_20_1.id)
			local var_20_6 = var_20_2:getFleetById(var_20_1.arg2)

			var_20_5.line, var_20_6.line = var_20_6.line, var_20_5.line
			var_20_0 = bit.bor(var_20_0, ChapterConst.DirtyFleet)
		end
	elseif var_20_3.type == ChapterConst.StgTypeBindSupportConsume then
		var_20_2:getChapterSupportFleet():consumeOneStrategy(var_20_3.id)
	end

	arg_20_0.flag = bit.bor(var_20_0, ChapterConst.DirtyStrategy)
end

function var_0_0.doRepair(arg_21_0)
	local var_21_0 = getProxy(ChapterProxy)

	var_21_0.repairTimes = var_21_0.repairTimes + 1

	local var_21_1, var_21_2, var_21_3 = ChapterConst.GetRepairParams()

	if var_21_1 < var_21_0.repairTimes then
		local var_21_4 = getProxy(PlayerProxy)
		local var_21_5 = var_21_4:getData()

		var_21_5:consume({
			gem = var_21_3
		})
		var_21_4:updatePlayer(var_21_5)
	end
end

function var_0_0.doSupply(arg_22_0)
	local var_22_0 = arg_22_0.flag
	local var_22_1 = arg_22_0.chapter
	local var_22_2 = var_22_1.fleet
	local var_22_3, var_22_4 = var_22_1:getFleetAmmo(var_22_2)
	local var_22_5 = var_22_2.line
	local var_22_6 = var_22_1:getChapterCell(var_22_5.row, var_22_5.column)
	local var_22_7 = math.min(var_22_6.attachmentId, var_22_3 - var_22_4)

	var_22_6.attachmentId = var_22_6.attachmentId - var_22_7
	var_22_2.restAmmo = var_22_2.restAmmo + var_22_7

	var_22_1:updateChapterCell(var_22_6)

	if var_22_6.attachmentId > 20 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply_p1", var_22_7))
	elseif var_22_6.attachmentId > 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_supply", var_22_7, var_22_6.attachmentId))
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("level_ammo_empty", var_22_7))
	end

	arg_22_0.flag = bit.bor(var_22_0, ChapterConst.DirtyAttachment, ChapterConst.DirtyFleet)
end

function var_0_0.doSubState(arg_23_0)
	local var_23_0 = arg_23_0.flag
	local var_23_1 = arg_23_0.op

	arg_23_0.chapter.subAutoAttack = var_23_1.arg1
	arg_23_0.flag = bit.bor(var_23_0, ChapterConst.DirtyStrategy)
end

function var_0_0.doCollectAI(arg_24_0)
	local var_24_0 = arg_24_0.data

	arg_24_0.aiActs = arg_24_0.aiActs or {}

	if var_24_0.submarine_act_list then
		_.each(var_24_0.submarine_act_list, function(arg_25_0)
			table.insert(arg_24_0.aiActs, SubAIAction.New(arg_25_0))
		end)
	end

	if var_24_0.escort_act_list then
		_.each(var_24_0.escort_act_list, function(arg_26_0)
			table.insert(arg_24_0.aiActs, TransportAIAction.New(arg_26_0))
		end)
	end

	_.each(var_24_0.ai_act_list, function(arg_27_0)
		local var_27_0

		if arg_27_0.act_type == ChapterConst.ActType_TargetDown then
			if arg_24_0.op.type == ChapterConst.OpStrategy then
				if arg_24_0.op.arg1 == ChapterConst.StrategyMissileStrike then
					var_27_0 = ChapterMissileExplodeAction.New(arg_27_0)
				elseif arg_24_0.op.arg1 == ChapterConst.StrategyAirSupport then
					var_27_0 = ChapterAirSupportAIAction.New(arg_27_0)
				end

				var_27_0:SetTargetLine({
					row = arg_24_0.op.arg2,
					column = arg_24_0.op.arg3
				})
			else
				var_27_0 = ChapterMissileExplodeAction.New(arg_27_0)
			end
		elseif arg_27_0.act_type == ChapterConst.ActType_Expel then
			var_27_0 = ChapterExpelAIAction.New(arg_27_0)

			var_27_0:SetTargetLine({
				row = arg_24_0.op.arg2,
				column = arg_24_0.op.arg3
			}, {
				row = arg_24_0.op.arg4,
				column = arg_24_0.op.arg5
			})
		else
			var_27_0 = ChapterAIAction.New(arg_27_0)
		end

		table.insert(arg_24_0.aiActs, var_27_0)
	end)
	_.each(var_24_0.fleet_act_list, function(arg_28_0)
		table.insert(arg_24_0.aiActs, FleetAIAction.New(arg_28_0))
	end)
end

function var_0_0.doBarrier(arg_29_0)
	local var_29_0 = arg_29_0.flag
	local var_29_1 = arg_29_0.op
	local var_29_2 = arg_29_0.chapter
	local var_29_3 = var_29_2:getChapterCell(var_29_1.arg1, var_29_1.arg2)

	assert(var_29_3, "cell not exist: " .. var_29_1.arg1 .. ", " .. var_29_1.arg2)

	local var_29_4 = ChapterConst.AttachBox
	local var_29_5 = _.detect(pg.box_data_template.all, function(arg_30_0)
		return pg.box_data_template[arg_30_0].type == ChapterConst.BoxBarrier
	end)

	if var_29_3.attachment ~= var_29_4 or var_29_3.attachmentId ~= var_29_5 then
		var_29_3.attachment = var_29_4
		var_29_3.attachmentId = var_29_5
		var_29_3.flag = ChapterConst.CellFlagDisabled
	end

	var_29_2.modelCount = var_29_2.modelCount + (var_29_3.flag == ChapterConst.CellFlagDisabled and -1 or 1)
	var_29_3.flag = 1 - var_29_3.flag

	var_29_2:updateChapterCell(var_29_3)

	arg_29_0.flag = bit.bor(var_29_0, ChapterConst.DirtyAttachment, ChapterConst.DirtyStrategy)
end

function var_0_0.doRequest(arg_31_0)
	local var_31_0 = arg_31_0.data
	local var_31_1 = -1
	local var_31_2 = arg_31_0.chapter.fleet

	if #var_31_0.move_path > 0 then
		local var_31_3 = var_31_0.move_path[#var_31_0.move_path]

		var_31_2.line = {
			row = var_31_3.row,
			column = var_31_3.column
		}
	end

	arg_31_0.flag = var_31_1
end

function var_0_0.doSkipBattle(arg_32_0)
	local var_32_0 = arg_32_0.flag

	arg_32_0.flag = bit.bor(var_32_0, ChapterConst.DirtyStrategy, ChapterConst.DirtyAttachment, ChapterConst.DirtyAchieve, ChapterConst.DirtyFleet, ChapterConst.DirtyChampion)
end

function var_0_0.doTeleportSub(arg_33_0)
	local var_33_0 = arg_33_0.op
	local var_33_1 = arg_33_0.chapter
	local var_33_2 = _.detect(var_33_1.fleets, function(arg_34_0)
		return arg_34_0.id == var_33_0.id
	end).startPos

	arg_33_0.fullpath = {
		var_33_2,
		{
			row = var_33_0.arg1,
			column = var_33_0.arg2
		}
	}
end

function var_0_0.doEnemyRound(arg_35_0)
	local var_35_0 = arg_35_0.chapter
	local var_35_1 = arg_35_0.extraFlag

	var_35_0:IncreaseRound()

	if var_35_0:getPlayType() == ChapterConst.TypeDefence then
		arg_35_0.flag = bit.bor(arg_35_0.flag, ChapterConst.DirtyAttachment)
	end

	arg_35_0.extraFlag = bit.bor(var_35_1, ChapterConst.DirtyAutoAction)
end

function var_0_0.doTeleportByPortal(arg_36_0)
	local var_36_0 = arg_36_0.fullpath and arg_36_0.fullpath[#arg_36_0.fullpath]

	if not var_36_0 then
		return
	end

	local var_36_1 = arg_36_0.chapter
	local var_36_2

	if arg_36_0.op.type == ChapterConst.OpMove then
		var_36_2 = var_36_1:GetCellEventByKey("jump", var_36_0.row, var_36_0.column)
	elseif arg_36_0.op.type == ChapterConst.OpSubTeleport then
		var_36_2 = var_36_1:GetCellEventByKey("jumpsub", var_36_0.row, var_36_0.column)
	end

	if not var_36_2 then
		return
	end

	local var_36_3 = {
		row = var_36_2[1],
		column = var_36_2[2]
	}

	if arg_36_0.op.type == ChapterConst.OpMove and var_36_1:getFleet(FleetType.Normal, var_36_3.row, var_36_3.column) then
		return
	end

	arg_36_0.teleportPaths = arg_36_0.teleportPaths or {}

	table.insert(arg_36_0.teleportPaths, {
		row = var_36_0.row,
		column = var_36_0.column
	})
	table.insert(arg_36_0.teleportPaths, var_36_3)
end

function var_0_0.doCollectCommonAction(arg_37_0)
	arg_37_0.aiActs = arg_37_0.aiActs or {}

	table.insert(arg_37_0.aiActs, ChapterCommonAction.New(arg_37_0))
end

function var_0_0.AddBoxAction(arg_38_0)
	local var_38_0 = arg_38_0.chapter
	local var_38_1 = var_38_0.fleet.line
	local var_38_2 = var_38_0:getChapterCell(var_38_1.row, var_38_1.column)
	local var_38_3 = pg.box_data_template[var_38_2.attachmentId]

	assert(var_38_3, "box_data_template not exist: " .. var_38_2.attachmentId)

	if var_38_3.type == ChapterConst.BoxStrategy then
		local var_38_4 = var_38_3.effect_id
		local var_38_5 = var_38_3.effect_arg

		table.insert(arg_38_0.items, Drop.New({
			type = DROP_TYPE_STRATEGY,
			id = var_38_4,
			count = var_38_5
		}))
	end

	arg_38_0.aiActs = arg_38_0.aiActs or {}

	table.insert(arg_38_0.aiActs, ChapterBoxAction.New(arg_38_0))
end

return var_0_0

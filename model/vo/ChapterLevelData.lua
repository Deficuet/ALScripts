local var_0_0 = import(".Chapter")

function var_0_0.update(arg_1_0, arg_1_1)
	assert(arg_1_1.id == arg_1_0.id, "章节ID不一致, 无法更新数据")

	arg_1_0.active = true
	arg_1_0.dueTime = arg_1_1.time
	arg_1_0.loopFlag = arg_1_1.loop_flag
	arg_1_0.modelCount = arg_1_1.model_act_count
	arg_1_0.roundIndex = arg_1_1.round
	arg_1_0.subAutoAttack = arg_1_1.is_submarine_auto_attack
	arg_1_0.barriers = 0
	arg_1_0.pathFinder = OrientedPathFinding.New({}, ChapterConst.MaxRow, ChapterConst.MaxColumn)
	arg_1_0.wallAssets = {}

	if arg_1_0:getConfig("wall_prefab") and #arg_1_0:getConfig("wall_prefab") > 0 then
		for iter_1_0, iter_1_1 in ipairs(arg_1_0:getConfig("wall_prefab")) do
			arg_1_0.wallAssets[iter_1_1[1] .. "_" .. iter_1_1[2]] = iter_1_1
		end
	end

	arg_1_0.winConditions = {}

	local var_1_0 = arg_1_0:getConfig("win_condition")

	assert(var_1_0, "Assure Chapter's WIN Conditions is not empty")

	for iter_1_2, iter_1_3 in pairs(var_1_0) do
		table.insert(arg_1_0.winConditions, {
			type = iter_1_3[1],
			param = iter_1_3[2]
		})
	end

	arg_1_0.loseConditions = {}

	local var_1_1 = arg_1_0:getConfig("lose_condition")

	assert(var_1_1, "Assure Chapter's LOSE Conditions is not empty")

	for iter_1_4, iter_1_5 in pairs(var_1_1) do
		table.insert(arg_1_0.loseConditions, {
			type = iter_1_5[1],
			param = iter_1_5[2]
		})
	end

	arg_1_0.theme = ChapterTheme.New(arg_1_0:getConfig("theme"))

	local var_1_2 = arg_1_1.cell_list
	local var_1_3 = arg_1_1.cell_flag_list
	local var_1_4 = arg_1_0:getConfig("float_items")
	local var_1_5 = arg_1_0:getConfig("grids")

	arg_1_0.cells = {}
	arg_1_0.cellAttachments = {}

	local function var_1_6(arg_2_0)
		local var_2_0 = ChapterCell.Line2Name(arg_2_0.pos.row, arg_2_0.pos.column)

		if arg_2_0.item_type == ChapterConst.AttachStory and arg_2_0.item_data == ChapterConst.StoryTrigger then
			if arg_1_0.cellAttachments[var_2_0] then
				warning("Multi Cell Attachemnts in one cell " .. arg_2_0.pos.row .. " " .. arg_2_0.pos.column)
			end

			arg_1_0.cellAttachments[var_2_0] = ChapterCell.New(arg_2_0)
			arg_2_0 = {
				item_id = 0,
				item_data = 0,
				item_flag = 0,
				pos = {
					row = arg_2_0.pos.row,
					column = arg_2_0.pos.column
				},
				item_type = ChapterConst.AttachNone
			}
		end

		if not arg_1_0.cells[var_2_0] or arg_1_0.cells[var_2_0].attachment == ChapterConst.AttachNone then
			local var_2_1 = ChapterCell.New(arg_2_0)

			if var_2_1.attachment == ChapterConst.AttachOni_Target or var_2_1.attachment == ChapterConst.AttachOni then
				var_2_1.attachment = ChapterConst.AttachNone
			end

			local var_2_2 = _.detect(var_1_4, function(arg_3_0)
				return arg_3_0[1] == var_2_1.row and arg_3_0[2] == var_2_1.column
			end)

			if var_2_2 then
				var_2_1.item = var_2_2[3]
				var_2_1.itemOffset = Vector2(var_2_2[4], var_2_2[5])
			end

			arg_1_0.cells[var_2_0] = var_2_1

			return var_2_1
		end
	end

	_.each(var_1_2, function(arg_4_0)
		var_1_6(arg_4_0)
	end)
	_.each(var_1_5, function(arg_5_0)
		local var_5_0 = ChapterCell.Line2Name(arg_5_0[1], arg_5_0[2])

		;(arg_1_0.cells[var_5_0] or var_1_6({
			pos = {
				row = arg_5_0[1],
				column = arg_5_0[2]
			},
			item_type = ChapterConst.AttachNone
		})):SetWalkable(arg_5_0[3])
	end)

	arg_1_0.cellsCount = #underscore.values(arg_1_0.cells)

	if arg_1_0:IsFogStage() then
		arg_1_0.fleetVisibleStore = {}
		arg_1_0.cellsVisibleCount = 0

		for iter_1_6, iter_1_7 in pairs(arg_1_0.cells) do
			iter_1_7:InitVisible()
		end
	end

	arg_1_0.indexMin, arg_1_0.indexMax = Vector2(ChapterConst.MaxRow, ChapterConst.MaxColumn), Vector2(-ChapterConst.MaxRow, -ChapterConst.MaxColumn)

	_.each(var_1_5, function(arg_6_0)
		arg_1_0.indexMin.x = math.min(arg_1_0.indexMin.x, arg_6_0[1])
		arg_1_0.indexMin.y = math.min(arg_1_0.indexMin.y, arg_6_0[2])
		arg_1_0.indexMax.x = math.max(arg_1_0.indexMax.x, arg_6_0[1])
		arg_1_0.indexMax.y = math.max(arg_1_0.indexMax.y, arg_6_0[2])
	end)
	_.each(var_1_3 or {}, function(arg_7_0)
		local var_7_0 = ChapterCell.Line2Name(arg_7_0.pos.row, arg_7_0.pos.column)
		local var_7_1 = arg_1_0.cells[var_7_0]

		assert(var_7_1, "Attach cellFlaglist On NIL Cell " .. var_7_0)

		if var_7_1 then
			var_7_1:updateFlagList(arg_7_0)
		end
	end)

	arg_1_0.buff_list = {}

	if arg_1_1.buff_list then
		for iter_1_8, iter_1_9 in ipairs(arg_1_1.buff_list) do
			arg_1_0.buff_list[iter_1_8] = iter_1_9
		end
	end

	arg_1_0.operationBuffList = {}

	for iter_1_10, iter_1_11 in ipairs(arg_1_1.operation_buff) do
		arg_1_0.operationBuffList[#arg_1_0.operationBuffList + 1] = iter_1_11
	end

	local var_1_7 = arg_1_0:getNpcShipByType()

	arg_1_0.fleets = {}

	for iter_1_12, iter_1_13 in pairs({
		[FleetType.Normal] = arg_1_1.main_group_list,
		[FleetType.Submarine] = arg_1_1.submarine_group_list,
		[FleetType.Support] = arg_1_1.support_group_list
	}) do
		for iter_1_14, iter_1_15 in ipairs(iter_1_13) do
			local var_1_8 = ChapterFleet.New(setmetatable({
				fleetType = iter_1_12
			}, {
				__index = iter_1_15
			}), var_1_7)

			var_1_8:setup(arg_1_0)
			table.insert(arg_1_0.fleets, var_1_8)
		end
	end

	table.sort(arg_1_0.fleets, CompareFuncs({
		function(arg_8_0)
			return arg_8_0.id
		end
	}))

	if arg_1_1.escort_list then
		for iter_1_16, iter_1_17 in ipairs(arg_1_1.escort_list) do
			arg_1_0.fleets[#arg_1_0.fleets + 1] = ChapterTransportFleet.New(iter_1_17, #arg_1_0.fleets + 1)
		end
	end

	arg_1_0.findex = 0
	arg_1_0.findex = arg_1_0:getNextValidIndex()

	if arg_1_0.findex == 0 then
		arg_1_0.findex = 1
	end

	arg_1_0.champions = {}

	if arg_1_1.ai_list then
		for iter_1_18, iter_1_19 in ipairs(arg_1_1.ai_list) do
			if iter_1_19.item_flag ~= 1 then
				local var_1_9 = ChapterChampionPackage.New(iter_1_19)

				arg_1_0:mergeChampion(var_1_9, true)
			end
		end
	end

	arg_1_0.airDominanceStatus = nil
	arg_1_0.extraFlagList = {}

	for iter_1_20, iter_1_21 in ipairs(arg_1_1.extra_flag_list) do
		table.insert(arg_1_0.extraFlagList, iter_1_21)
	end

	arg_1_0.defeatEnemies = arg_1_1.kill_count or 0
	arg_1_0.BaseHP = arg_1_1.chapter_hp or 0
	arg_1_0.orignalShipCount = arg_1_1.init_ship_count or 0
	arg_1_0.combo = arg_1_1.continuous_kill_count or 0
	arg_1_0.scoreHistory = {}

	for iter_1_22 = ys.Battle.BattleConst.BattleScore.D, ys.Battle.BattleConst.BattleScore.S do
		arg_1_0.scoreHistory[iter_1_22] = 0
	end

	if arg_1_1.battle_statistics then
		for iter_1_23, iter_1_24 in ipairs(arg_1_1.battle_statistics) do
			arg_1_0.scoreHistory[iter_1_24.id] = iter_1_24.count
		end
	end

	local var_1_10 = {}

	if arg_1_1.chapter_strategy_list then
		for iter_1_25, iter_1_26 in ipairs(arg_1_1.chapter_strategy_list) do
			var_1_10[iter_1_26.id] = iter_1_26.count
		end
	end

	arg_1_0.strategies = var_1_10
	arg_1_0.duties = {}

	if #arg_1_1.fleet_duties > 0 then
		_.each(arg_1_1.fleet_duties, function(arg_9_0)
			arg_1_0.duties[arg_9_0.key] = arg_9_0.value
		end)
	end

	arg_1_0.moveStep = arg_1_1.move_step_count or 0
	arg_1_0.activateAmbush = not arg_1_0:isLoop() and arg_1_0:GetWillActiveAmbush()
end

function var_0_0.retreat(arg_10_0, arg_10_1)
	if arg_10_1 then
		arg_10_0.todayDefeatCount = arg_10_0.todayDefeatCount + 1

		arg_10_0:updateTodayDefeatCount()
	end
end

function var_0_0.CleanLevelData(arg_11_0)
	arg_11_0.active = false
	arg_11_0.loopFlag = 0
	arg_11_0.dueTime = nil
	arg_11_0.cells = nil
	arg_11_0.fleets = nil
	arg_11_0.findex = nil
	arg_11_0.champions = nil
	arg_11_0.cellAttachments = nil
	arg_11_0.round = nil
	arg_11_0.airDominanceStatus = nil
	arg_11_0.winConditions, arg_11_0.loseConditions = nil
	arg_11_0.theme = nil
	arg_11_0.buff_list = nil
	arg_11_0.operationBuffList = nil
	arg_11_0.modelCount = nil
	arg_11_0.roundIndex = nil
	arg_11_0.subAutoAttack = nil
	arg_11_0.barriers = nil
	arg_11_0.pathFinder = nil
	arg_11_0.wallAssets = nil
	arg_11_0.strategies = nil
	arg_11_0.duties = nil
	arg_11_0.indexMin, arg_11_0.indexMax = nil
	arg_11_0.extraFlagList = nil
	arg_11_0.defeatEnemies = nil
	arg_11_0.BaseHP = nil
	arg_11_0.orignalShipCount = nil
	arg_11_0.combo = nil
	arg_11_0.scoreHistory = nil
end

function var_0_0.__index(arg_12_0, arg_12_1)
	if arg_12_1 == "fleet" then
		local var_12_0 = rawget(arg_12_0, "fleets")

		if not var_12_0 then
			return nil
		end

		return var_12_0[rawget(arg_12_0, "findex")]
	end

	return rawget(arg_12_0, arg_12_1) or var_0_0[arg_12_1]
end

function var_0_0.GetActiveFleet(arg_13_0)
	if not arg_13_0.fleets then
		return nil
	end

	return arg_13_0.fleets[arg_13_0.findex]
end

function var_0_0.getFleetById(arg_14_0, arg_14_1)
	return _.detect(arg_14_0.fleets, function(arg_15_0)
		return arg_15_0.id == arg_14_1
	end)
end

function var_0_0.getChapterSupportFleet(arg_16_0)
	return table.Find(arg_16_0.fleets, function(arg_17_0, arg_17_1)
		return arg_17_1:getFleetType() == FleetType.Support
	end)
end

function var_0_0.getFleetByShipVO(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.id
	local var_18_1

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.fleets) do
		if iter_18_1:getShip(var_18_0) then
			var_18_1 = iter_18_1

			break
		end
	end

	return var_18_1
end

function var_0_0.getRound(arg_19_0)
	return arg_19_0.roundIndex % 2
end

function var_0_0.getRoundNum(arg_20_0)
	return math.floor(arg_20_0.roundIndex / 2)
end

function var_0_0.IncreaseRound(arg_21_0)
	arg_21_0.roundIndex = arg_21_0.roundIndex + 1
end

function var_0_0.existMoveLimit(arg_22_0)
	return arg_22_0:getConfig("is_limit_move") == 1 or arg_22_0:existOni() or arg_22_0:isPlayingWithBombEnemy()
end

function var_0_0.getChapterCell(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = ChapterCell.Line2Name(arg_23_1, arg_23_2)

	return Clone(arg_23_0.cells[var_23_0])
end

function var_0_0.GetRawChapterCell(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = ChapterCell.Line2Name(arg_24_1, arg_24_2)

	return arg_24_0.cells[var_24_0]
end

function var_0_0.FilterCell(arg_25_0, arg_25_1)
	return table.Checkout(arg_25_0.cells, arg_25_1)
end

function var_0_0.findChapterCell(arg_26_0, arg_26_1, arg_26_2)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.cells) do
		if iter_26_1.attachment == arg_26_1 and (not arg_26_2 or iter_26_1.attachmentId == arg_26_2) then
			return iter_26_1
		end
	end

	return nil
end

function var_0_0.findChapterCells(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.cells) do
		if iter_27_1.attachment == arg_27_1 and (not arg_27_2 or iter_27_1.attachmentId == arg_27_2) then
			table.insert(var_27_0, iter_27_1)
		end
	end

	return var_27_0
end

function var_0_0.GetBossCell(arg_28_0)
	return table.Find(arg_28_0.cells, function(arg_29_0, arg_29_1)
		return ChapterConst.IsBossCell(arg_29_1)
	end)
end

function var_0_0.mergeChapterCell(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = ChapterCell.Line2Name(arg_30_1.row, arg_30_1.column)
	local var_30_1 = arg_30_0.cells[var_30_0]
	local var_30_2 = var_30_1 == nil or var_30_1.attachment ~= arg_30_1.attachment or var_30_1.attachmentId ~= arg_30_1.attachmentId

	if var_30_1 then
		var_30_1.attachment = arg_30_1.attachment
		var_30_1.attachmentId = arg_30_1.attachmentId
		var_30_1.flag = arg_30_1.flag
		var_30_1.data = arg_30_1.data
		arg_30_1 = var_30_1
	end

	if not arg_30_2 and var_30_2 and ChapterConst.NeedMarkAsLurk(arg_30_1) then
		arg_30_1.trait = ChapterConst.TraitLurk
	end

	if ChapterConst.IsBossCell(arg_30_1) then
		local var_30_3 = arg_30_0:getChampionIndex(arg_30_1.row, arg_30_1.column)

		if var_30_3 then
			table.remove(arg_30_0.champions, var_30_3)
		end
	end

	arg_30_0:updateChapterCell(arg_30_1)
end

function var_0_0.updateChapterCell(arg_31_0, arg_31_1)
	local var_31_0 = ChapterCell.Line2Name(arg_31_1.row, arg_31_1.column)

	arg_31_0.cells[var_31_0] = Clone(arg_31_1)
end

function var_0_0.clearChapterCell(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = ChapterCell.Line2Name(arg_32_1, arg_32_2)
	local var_32_1 = arg_32_0.cells[var_32_0]

	var_32_1.attachment = ChapterConst.AttachNone
	var_32_1.attachmentId = 0
	var_32_1.flag = ChapterConst.CellFlagActive
	var_32_1.data = 0
	var_32_1.trait = ChapterConst.TraitNone
end

function var_0_0.GetChapterCellAttachemnts(arg_33_0)
	return arg_33_0.cellAttachments
end

function var_0_0.GetRawChapterAttachemnt(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = ChapterCell.Line2Name(arg_34_1, arg_34_2)

	return arg_34_0.cellAttachments[var_34_0]
end

function var_0_0.getShips(arg_35_0)
	local var_35_0 = {}

	_.each(arg_35_0.fleets, function(arg_36_0)
		local var_36_0 = arg_36_0:getShips(true)

		_.each(var_36_0, function(arg_37_0)
			table.insert(var_35_0, Clone(arg_37_0))
		end)
	end)

	return var_35_0
end

function var_0_0.getNextValidIndex(arg_38_0)
	for iter_38_0 = arg_38_0.findex + 1, #arg_38_0.fleets do
		if arg_38_0.fleets[iter_38_0]:getFleetType() == FleetType.Normal and arg_38_0.fleets[iter_38_0]:isValid() then
			return iter_38_0
		end
	end

	for iter_38_1 = 1, arg_38_0.findex - 1 do
		if arg_38_0.fleets[iter_38_1]:getFleetType() == FleetType.Normal and arg_38_0.fleets[iter_38_1]:isValid() then
			return iter_38_1
		end
	end

	return 0
end

function var_0_0.getAmbushRate(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_1:getInvestSums()
	local var_39_1 = arg_39_0:getConfig("investigation_ratio")
	local var_39_2 = var_39_1 / (var_39_1 + var_39_0) / 4
	local var_39_3 = _.detect(arg_39_0:getConfig("ambush_ratio_extra"), function(arg_40_0)
		return arg_40_0[1] == arg_39_2.row and arg_40_0[2] == arg_39_2.column
	end)
	local var_39_4 = _.detect(arg_39_0:getConfig("ambush_ratio_extra"), function(arg_41_0)
		return #arg_41_0 == 1
	end)
	local var_39_5

	var_39_5 = var_39_3 and var_39_3[3] / 10000 or 0

	local var_39_6 = var_39_5 + (var_39_4 and var_39_4[1] / 10000 or 0)
	local var_39_7 = 0.05 + var_39_2 * math.max(arg_39_1.step - 1, 0) + var_39_6

	if var_39_6 == 0 then
		var_39_7 = var_39_7 - arg_39_1:getEquipAmbushRateReduce()
	end

	return (math.clamp(var_39_7, 0, 1))
end

function var_0_0.getAmbushDodge(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1.line
	local var_42_1 = arg_42_1:getDodgeSums()
	local var_42_2 = var_42_1 / (var_42_1 + arg_42_0:getConfig("avoid_ratio"))
	local var_42_3 = _.detect(arg_42_0:getConfig("ambush_ratio_extra"), function(arg_43_0)
		return arg_43_0[1] == var_42_0.row and arg_43_0[2] == var_42_0.column
	end)
	local var_42_4

	var_42_4 = var_42_3 and var_42_3[3] / 10000 or 0

	if var_42_4 == 0 then
		var_42_2 = var_42_2 + arg_42_1:getEquipDodgeRateUp()
	end

	return (math.clamp(var_42_2, 0, 1))
end

function var_0_0.inWartime(arg_44_0)
	return arg_44_0.dueTime and pg.TimeMgr.GetInstance():GetServerTime() < arg_44_0.dueTime
end

function var_0_0.inActTime(arg_45_0)
	local var_45_0 = arg_45_0:GetBindActID()

	if var_45_0 == 0 then
		return true
	end

	local var_45_1 = var_45_0 and getProxy(ActivityProxy):getActivityById(var_45_0)

	return var_45_1 and not var_45_1:isEnd()
end

function var_0_0.getRemainTime(arg_46_0)
	return arg_46_0.dueTime and math.max(arg_46_0.dueTime - pg.TimeMgr.GetInstance():GetServerTime() - 1, 0) or 0
end

function var_0_0.getStartTime(arg_47_0)
	return math.max(arg_47_0.dueTime - arg_47_0:getConfig("time"), 0)
end

function var_0_0.GetWillActiveAmbush(arg_48_0)
	if not arg_48_0:existAmbush() then
		return false
	end

	local var_48_0 = arg_48_0:getConfig("avoid_require")

	return not _.any(arg_48_0.fleets, function(arg_49_0)
		return arg_49_0:getFleetType() == FleetType.Normal and arg_49_0:getInvestSums(true) >= var_48_0
	end)
end

function var_0_0.findPath(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0 = {}

	for iter_50_0 = 0, ChapterConst.MaxRow - 1 do
		var_50_0[iter_50_0] = var_50_0[iter_50_0] or {}

		for iter_50_1 = 0, ChapterConst.MaxColumn - 1 do
			var_50_0[iter_50_0][iter_50_1] = var_50_0[iter_50_0][iter_50_1] or {}

			local var_50_1 = PathFinding.PrioForbidden
			local var_50_2 = ChapterConst.ForbiddenAll
			local var_50_3 = ChapterCell.Line2Name(iter_50_0, iter_50_1)
			local var_50_4 = arg_50_0.cells[var_50_3]

			if var_50_4 and var_50_4:IsWalkable() then
				var_50_1 = PathFinding.PrioNormal

				if arg_50_0:considerAsObstacle(arg_50_1, var_50_4.row, var_50_4.column) then
					var_50_1 = PathFinding.PrioObstacle
				end

				if arg_50_1 == ChapterConst.SubjectPlayer then
					var_50_2 = var_50_4.forbiddenDirections
				else
					var_50_2 = ChapterConst.ForbiddenNone
				end
			end

			var_50_0[iter_50_0][iter_50_1].forbiddens = var_50_2
			var_50_0[iter_50_0][iter_50_1].priority = var_50_1
		end
	end

	if arg_50_1 == ChapterConst.SubjectPlayer then
		local var_50_5 = arg_50_0:getCoastalGunArea()

		for iter_50_2, iter_50_3 in ipairs(var_50_5) do
			var_50_0[iter_50_3.row][iter_50_3.column].priority = math.max(var_50_0[iter_50_3.row][iter_50_3.column].priority, PathFinding.PrioObstacle)
		end
	end

	local var_50_6 = var_50_0[arg_50_3.row] and var_50_0[arg_50_3.row][arg_50_3.column]

	if var_50_6 then
		var_50_6.priority = arg_50_0:considerAsStayPoint(arg_50_1, arg_50_3.row, arg_50_3.column) and PathFinding.PrioNormal or PathFinding.PrioObstacle
	end

	arg_50_0.pathFinder.cells = var_50_0

	return arg_50_0.pathFinder:Find(arg_50_2, arg_50_3)
end

function var_0_0.FindBossPath(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = ChapterConst.SubjectPlayer
	local var_51_1 = {}

	for iter_51_0 = 0, ChapterConst.MaxRow - 1 do
		var_51_1[iter_51_0] = var_51_1[iter_51_0] or {}

		for iter_51_1 = 0, ChapterConst.MaxColumn - 1 do
			var_51_1[iter_51_0][iter_51_1] = var_51_1[iter_51_0][iter_51_1] or {}

			local var_51_2 = PathFinding.PrioForbidden
			local var_51_3 = ChapterConst.ForbiddenAll
			local var_51_4
			local var_51_5 = ChapterCell.Line2Name(iter_51_0, iter_51_1)
			local var_51_6 = arg_51_0.cells[var_51_5]

			if var_51_6 and var_51_6:IsWalkable() then
				var_51_2 = PathFinding.PrioNormal

				if arg_51_0:considerAsObstacle(var_51_0, var_51_6.row, var_51_6.column) then
					var_51_2 = PathFinding.PrioObstacle
				end

				local var_51_7 = arg_51_0:GetEnemy(var_51_6.row, var_51_6.column)

				if var_51_7 then
					var_51_2 = PathFinding.PrioNormal
					var_51_4 = not ChapterConst.IsBossCell(var_51_7)
				end

				var_51_3 = var_51_6.forbiddenDirections
			end

			var_51_1[iter_51_0][iter_51_1].forbiddens = var_51_3
			var_51_1[iter_51_0][iter_51_1].priority = var_51_2
			var_51_1[iter_51_0][iter_51_1].isEnemy = var_51_4
		end
	end

	local var_51_8 = arg_51_0:getCoastalGunArea()

	for iter_51_2, iter_51_3 in ipairs(var_51_8) do
		var_51_1[iter_51_3.row][iter_51_3.column].priority = math.max(var_51_1[iter_51_3.row][iter_51_3.column].priority, PathFinding.PrioObstacle)
	end

	local var_51_9 = var_51_1[arg_51_2.row] and var_51_1[arg_51_2.row][arg_51_2.column]

	if var_51_9 then
		var_51_9.priority = arg_51_0:considerAsStayPoint(var_51_0, arg_51_2.row, arg_51_2.column) and PathFinding.PrioNormal or PathFinding.PrioObstacle
	end

	return OrientedWeightPathFinding.StaticFind(var_51_1, ChapterConst.MaxRow, ChapterConst.MaxColumn, arg_51_1, arg_51_2)
end

function var_0_0.getWaveCount(arg_52_0)
	local var_52_0 = 0

	for iter_52_0, iter_52_1 in pairs(arg_52_0.cells) do
		if iter_52_1.attachment == ChapterConst.AttachEnemy and underscore.detect(arg_52_0:getConfig("grids"), function(arg_53_0)
			if arg_53_0[1] == iter_52_1.row and arg_53_0[2] == iter_52_1.column and (arg_53_0[4] == ChapterConst.AttachElite or arg_53_0[4] == ChapterConst.AttachEnemy) then
				return true
			end

			return false
		end) then
			var_52_0 = var_52_0 + 1
		end
	end

	local var_52_1 = 0
	local var_52_2 = pg.chapter_group_refresh[arg_52_0.id]

	if var_52_2 then
		local var_52_3 = 1

		repeat
			local var_52_4 = false

			for iter_52_2, iter_52_3 in ipairs(var_52_2.enemy_refresh) do
				var_52_1 = var_52_1 + (iter_52_3[var_52_3] or 0)
				var_52_4 = var_52_4 or tobool(iter_52_3[var_52_3])
			end

			if var_52_0 <= var_52_1 then
				return var_52_3
			end

			var_52_3 = var_52_3 + 1
		until not var_52_4
	else
		local var_52_5 = arg_52_0:getConfig("enemy_refresh")
		local var_52_6 = arg_52_0:getConfig("elite_refresh")

		for iter_52_4, iter_52_5 in pairs(var_52_5) do
			var_52_1 = var_52_1 + iter_52_5

			if iter_52_4 <= #var_52_6 then
				var_52_1 = var_52_1 + var_52_6[iter_52_4]
			end

			if var_52_0 <= var_52_1 then
				return iter_52_4
			end
		end
	end

	return 1
end

function var_0_0.IsFinalBossRefreshed(arg_54_0)
	return tobool(arg_54_0:findChapterCell(ChapterConst.AttachBoss))
end

function var_0_0.getFleetAmmo(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1:getShipAmmo()
	local var_55_1 = arg_55_1:getFleetType()

	if var_55_1 == FleetType.Normal then
		var_55_0 = var_55_0 + arg_55_0:getConfig("ammo_total")
	elseif var_55_1 == FleetType.Submarine then
		var_55_0 = var_55_0 + arg_55_0:getConfig("ammo_submarine")
	else
		assert(false, "invalide operation.")
	end

	local var_55_2 = arg_55_1.restAmmo

	return var_55_0, var_55_2
end

function var_0_0.GetInteractableStrategies(arg_56_0)
	local var_56_0 = arg_56_0.fleet:getStrategies()
	local var_56_1 = _.filter(var_56_0, function(arg_57_0)
		local var_57_0 = pg.strategy_data_template[arg_57_0.id]

		return var_57_0 and var_57_0.type ~= ChapterConst.StgTypeBindFleetPassive
	end)
	local var_56_2 = arg_56_0.fleet:getFormationStg()

	table.insert(var_56_1, 1, {
		id = var_56_2
	})

	if arg_56_0:GetSubmarineFleet() then
		table.insert(var_56_1, 3, {
			id = ChapterConst.StrategyHuntingRange
		})
		table.insert(var_56_1, 4, {
			id = ChapterConst.StrategySubAutoAttack
		})
		table.insert(var_56_1, 5, {
			id = ChapterConst.StrategySubTeleport
		})
	end

	local var_56_3 = arg_56_0:getChapterSupportFleet()

	if var_56_3 then
		table.insertto(var_56_1, _.filter(var_56_3:getStrategies(), function(arg_58_0)
			local var_58_0 = pg.strategy_data_template[arg_58_0.id]

			return var_58_0 and var_58_0.type == ChapterConst.StgTypeBindSupportConsume
		end))
	end

	if #arg_56_0.strategies > 0 then
		for iter_56_0, iter_56_1 in pairs(arg_56_0.strategies) do
			table.insert(var_56_1, {
				id = iter_56_0,
				count = iter_56_1
			})
		end
	end

	return var_56_1
end

function var_0_0.getFleetStates(arg_59_0, arg_59_1)
	local var_59_0 = {}
	local var_59_1, var_59_2 = arg_59_0:getFleetAmmo(arg_59_1)

	if var_59_2 >= ChapterConst.AmmoRich then
		table.insert(var_59_0, ChapterConst.StrategyAmmoRich)
	elseif var_59_2 <= ChapterConst.AmmoPoor then
		table.insert(var_59_0, ChapterConst.StrategyAmmoPoor)
	end

	local var_59_3 = underscore.filter(arg_59_1:getStrategies(), function(arg_60_0)
		local var_60_0 = pg.strategy_data_template[arg_60_0.id]

		return var_60_0 and var_60_0.type == ChapterConst.StgTypeBindFleetPassive and arg_60_0.count > 0
	end)

	table.insertto(var_59_0, underscore.map(var_59_3, function(arg_61_0)
		return arg_61_0.id
	end))
	table.insertto(var_59_0, arg_59_1.stgIds)

	local var_59_4 = arg_59_0:getConfig("chapter_strategy")

	for iter_59_0, iter_59_1 in ipairs(var_59_4) do
		table.insert(var_59_0, iter_59_1)
	end

	if arg_59_0:IsFogStage() then
		table.insert(var_59_0, arg_59_0:GetFogStageStrategy())
	end

	if OPEN_AIR_DOMINANCE and arg_59_0:getConfig("air_dominance") > 0 then
		table.insert(var_59_0, arg_59_0:getAirDominanceStg())
	end

	for iter_59_2, iter_59_3 in ipairs(arg_59_0:getExtraFlags()) do
		table.insert(var_59_0, ChapterConst.Status2Stg[iter_59_3])
	end

	local var_59_5 = arg_59_0:getOperationBuffDescStg()

	if var_59_5 then
		table.insert(var_59_0, var_59_5)
	end

	underscore.each(arg_59_0.buff_list, function(arg_62_0)
		if ChapterConst.Buff2Stg[arg_62_0] then
			table.insert(var_59_0, ChapterConst.Buff2Stg[arg_62_0])
		end
	end)

	local var_59_6 = getProxy(ActivityProxy):getActivityById(ActivityConst.YUMIA_EXPEDITION_BUFF_ACT_ID)

	if var_59_6 and not var_59_6:isEnd() then
		local var_59_7, var_59_8 = unpack(getGameset("yumia_buff_mapping")[2])
		local var_59_9 = {}

		for iter_59_4 = 1, #var_59_7 do
			var_59_9[var_59_7[iter_59_4]] = var_59_8[iter_59_4]
		end

		local var_59_10 = underscore.filter(var_59_6:GetBuffList(), function(arg_63_0)
			return arg_63_0:isActivate() and arg_63_0:checkChaper(arg_59_0.id)
		end)

		table.sort(var_59_10, CompareFuncs({
			function(arg_64_0)
				return arg_64_0.id
			end
		}))
		underscore.each(var_59_10, function(arg_65_0)
			if var_59_9[arg_65_0.id] then
				table.insert(var_59_0, var_59_9[arg_65_0.id])
			end
		end)
	end

	return var_59_0
end

function var_0_0.GetShowingStrategies(arg_66_0)
	local var_66_0 = arg_66_0.fleet
	local var_66_1 = arg_66_0:getFleetStates(var_66_0)

	return (_.filter(var_66_1, function(arg_67_0)
		local var_67_0 = pg.strategy_data_template[arg_67_0]

		return var_67_0 and var_67_0.icon ~= ""
	end))
end

function var_0_0.getAirDominanceStg(arg_68_0)
	local var_68_0, var_68_1 = arg_68_0:getAirDominanceValue()

	return ChapterConst.AirDominance[var_68_1].StgId
end

function var_0_0.getAirDominanceValue(arg_69_0)
	local var_69_0 = 0
	local var_69_1 = 0

	for iter_69_0, iter_69_1 in pairs(arg_69_0.fleets) do
		if iter_69_1:isValid() and (iter_69_1:getFleetType() == FleetType.Normal or iter_69_1:getFleetType() == FleetType.Submarine) then
			var_69_0 = var_69_0 + iter_69_1:getFleetAirDominanceValue()
			var_69_1 = var_69_1 + iter_69_1:getAntiAircraftSums()
		end
	end

	return var_69_0, calcAirDominanceStatus(var_69_0, arg_69_0:getConfig("air_dominance"), var_69_1), arg_69_0.airDominanceStatus
end

function var_0_0.setAirDominanceStatus(arg_70_0, arg_70_1)
	arg_70_0.airDominanceStatus = arg_70_1
end

function var_0_0.updateExtraFlags(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = false

	for iter_71_0, iter_71_1 in ipairs(arg_71_2) do
		for iter_71_2, iter_71_3 in ipairs(arg_71_0.extraFlagList) do
			if iter_71_3 == iter_71_1 then
				table.remove(arg_71_0.extraFlagList, iter_71_2)

				var_71_0 = true

				break
			end
		end
	end

	for iter_71_4, iter_71_5 in ipairs(arg_71_1) do
		if not table.contains(arg_71_0.extraFlagList, iter_71_5) then
			table.insert(arg_71_0.extraFlagList, 1, iter_71_5)

			var_71_0 = true
		end
	end

	return var_71_0
end

function var_0_0.getExtraFlags(arg_72_0)
	return arg_72_0.extraFlagList
end

function var_0_0.UpdateBuffList(arg_73_0, arg_73_1)
	if not arg_73_1 then
		return
	end

	for iter_73_0, iter_73_1 in ipairs(arg_73_1) do
		if not _.include(arg_73_0.buff_list, iter_73_1) then
			table.insert(arg_73_0.buff_list, iter_73_1)
		end
	end
end

function var_0_0.getFleetBattleBuffs(arg_74_0, arg_74_1)
	local var_74_0 = table.shallowCopy(arg_74_0.buff_list)

	_.each(arg_74_0:getFleetStates(arg_74_1), function(arg_75_0)
		local var_75_0 = pg.strategy_data_template[arg_75_0]
		local var_75_1 = var_75_0.buff_id

		if var_75_1 == 0 then
			return
		end

		if var_75_0.buff_type == ChapterConst.StrategyBuffTypeOnlyBoss then
			local var_75_2 = arg_74_0:GetEnemy(arg_74_1.line.row, arg_74_1.line.column)

			if var_75_2 and not ChapterConst.IsBossCell(var_75_2) then
				return
			end
		end

		table.insert(var_74_0, var_75_1)
	end)
	table.insertto(var_74_0, arg_74_0:GetCellEventByKey("attach_buff", arg_74_1.line.row, arg_74_1.line.column) or {})
	_.each(arg_74_0:GetWeather(), function(arg_76_0)
		local var_76_0 = pg.weather_data_template[arg_76_0].effect_args

		if type(var_76_0) == "table" and var_76_0.buff and var_76_0.buff > 0 then
			table.insert(var_74_0, var_76_0.buff)
		end
	end)

	local var_74_1 = arg_74_0:buildBattleBuffList(arg_74_1)

	return var_74_0, var_74_1
end

function var_0_0.GetStageFlags(arg_77_0)
	local var_77_0 = arg_77_0.fleet.line.row
	local var_77_1 = arg_77_0.fleet.line.column

	return arg_77_0:GetCellEventByKey("stage_flags", var_77_0, var_77_1) or {}
end

function var_0_0.GetCellEventByKey(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	arg_78_2 = arg_78_2 or arg_78_0.fleet.line.row
	arg_78_3 = arg_78_3 or arg_78_0.fleet.line.column

	local var_78_0 = ChapterCell.Line2Name(arg_78_2, arg_78_3)
	local var_78_1 = arg_78_0.cells[var_78_0]

	if not var_78_1 then
		return
	end

	return var_0_0.GetEventTemplateByKey(arg_78_1, var_78_1.attachmentId)
end

function var_0_0.GetEventTemplateByKey(arg_79_0, arg_79_1)
	local var_79_0 = pg.map_event_template[arg_79_1]

	if not var_79_0 then
		return
	end

	local var_79_1

	for iter_79_0, iter_79_1 in ipairs(var_79_0.effect) do
		if iter_79_1[1] == arg_79_0 then
			for iter_79_2 = 2, #iter_79_1 do
				var_79_1 = var_79_1 or {}

				table.insert(var_79_1, iter_79_1[iter_79_2])
			end
		end
	end

	return var_79_1
end

function var_0_0.buildBattleBuffList(arg_80_0, arg_80_1)
	local var_80_0 = {}
	local var_80_1, var_80_2 = arg_80_0:triggerSkill(arg_80_1, FleetSkill.TypeBattleBuff)

	if var_80_1 and #var_80_1 > 0 then
		local var_80_3 = {}

		for iter_80_0, iter_80_1 in ipairs(var_80_1) do
			local var_80_4 = var_80_2[iter_80_0]
			local var_80_5 = arg_80_1:findCommanderBySkillId(var_80_4.id)

			var_80_3[var_80_5] = var_80_3[var_80_5] or {}

			table.insert(var_80_3[var_80_5], iter_80_1)
		end

		for iter_80_2, iter_80_3 in pairs(var_80_3) do
			table.insert(var_80_0, {
				iter_80_2,
				iter_80_3
			})
		end
	end

	local var_80_6 = arg_80_1:getCommanders()

	for iter_80_4, iter_80_5 in pairs(var_80_6) do
		local var_80_7 = iter_80_5:getTalents()

		for iter_80_6, iter_80_7 in ipairs(var_80_7) do
			local var_80_8 = iter_80_7:getBuffsAddition()

			if #var_80_8 > 0 then
				local var_80_9

				for iter_80_8, iter_80_9 in ipairs(var_80_0) do
					if iter_80_9[1] == iter_80_5 then
						var_80_9 = iter_80_9[2]

						break
					end
				end

				if not var_80_9 then
					var_80_9 = {}

					table.insert(var_80_0, {
						iter_80_5,
						var_80_9
					})
				end

				for iter_80_10, iter_80_11 in ipairs(var_80_8) do
					table.insert(var_80_9, iter_80_11)
				end
			end
		end
	end

	return var_80_0
end

function var_0_0.updateFleetShipHp(arg_81_0, arg_81_1, arg_81_2)
	for iter_81_0, iter_81_1 in ipairs(arg_81_0.fleets) do
		iter_81_1:updateShipHp(arg_81_1, arg_81_2)

		if iter_81_1.id ~= arg_81_0.fleet.id then
			iter_81_1:clearShipHpChange()
		end
	end
end

function var_0_0.getDragExtend(arg_82_0)
	local var_82_0 = arg_82_0.theme
	local var_82_1 = 99999999
	local var_82_2 = 99999999
	local var_82_3 = 0
	local var_82_4 = 0

	for iter_82_0, iter_82_1 in pairs(arg_82_0.cells) do
		if var_82_1 > iter_82_1.row then
			var_82_1 = iter_82_1.row
		end

		if var_82_3 < iter_82_1.row then
			var_82_3 = iter_82_1.row
		end

		if var_82_2 > iter_82_1.column then
			var_82_2 = iter_82_1.column
		end

		if var_82_4 < iter_82_1.column then
			var_82_4 = iter_82_1.column
		end
	end

	local var_82_5 = (var_82_4 + var_82_2) * 0.5
	local var_82_6 = (var_82_3 + var_82_1) * 0.5
	local var_82_7 = var_82_0.cellSize + var_82_0.cellSpace
	local var_82_8 = math.max((var_82_4 - var_82_5 + 1) * var_82_7.x, 0)
	local var_82_9 = math.max((var_82_5 - var_82_2 + 1) * var_82_7.x, 0)
	local var_82_10 = math.max((var_82_6 - var_82_1 + 1) * var_82_7.y, 0)
	local var_82_11 = math.max((var_82_3 - var_82_6 + 1) * var_82_7.y, 0)

	return var_82_9, var_82_8, var_82_10, var_82_11
end

function var_0_0.getPoisonArea(arg_83_0, arg_83_1)
	local var_83_0 = {}
	local var_83_1 = arg_83_0.theme.cellSize + arg_83_0.theme.cellSpace

	for iter_83_0, iter_83_1 in pairs(arg_83_0.cells) do
		if iter_83_1:checkHadFlag(ChapterConst.FlagPoison) then
			local var_83_2 = math.floor((iter_83_1.column - arg_83_0.indexMin.y) * var_83_1.x * arg_83_1)
			local var_83_3 = math.ceil((iter_83_1.column - arg_83_0.indexMin.y + 1) * var_83_1.x * arg_83_1)
			local var_83_4 = math.floor((iter_83_1.row - arg_83_0.indexMin.x) * var_83_1.y * arg_83_1)
			local var_83_5 = math.ceil((iter_83_1.row - arg_83_0.indexMin.x + 1) * var_83_1.y * arg_83_1)
			local var_83_6 = var_83_3 - var_83_2
			local var_83_7 = var_83_5 - var_83_4

			var_83_0[iter_83_0] = {
				x = var_83_2,
				y = var_83_4,
				w = var_83_6,
				h = var_83_7
			}
		end
	end

	return var_83_0
end

function var_0_0.selectFleets(arg_84_0, arg_84_1)
	local var_84_0 = Clone(arg_84_1) or {}
	local var_84_1 = getProxy(FleetProxy):GetRegularFleets()

	for iter_84_0 = #var_84_0, 1, -1 do
		local var_84_2 = var_84_1[var_84_0[iter_84_0]]

		if not var_84_2 or not var_84_2:isUnlock() or var_84_2:isLegalToFight() ~= true then
			table.remove(var_84_0, iter_84_0)
		end
	end

	local var_84_3 = {
		[FleetType.Normal] = _.filter(var_84_0, function(arg_85_0)
			return var_84_1[arg_85_0]:getFleetType() == FleetType.Normal
		end),
		[FleetType.Submarine] = _.filter(var_84_0, function(arg_86_0)
			return var_84_1[arg_86_0]:getFleetType() == FleetType.Submarine
		end)
	}
	local var_84_4 = arg_84_0:getConfig("group_num")
	local var_84_5 = arg_84_0:getConfig("submarine_num")

	for iter_84_1 = #var_84_3[FleetType.Normal], var_84_4 + 1, -1 do
		table.remove(var_84_3[FleetType.Normal], iter_84_1)
	end

	for iter_84_2 = #var_84_3[FleetType.Submarine], var_84_5 + 1, -1 do
		table.remove(var_84_3[FleetType.Submarine], iter_84_2)
	end

	for iter_84_3, iter_84_4 in pairs(var_84_3) do
		if #iter_84_4 == 0 then
			local var_84_6 = 0

			if iter_84_3 == FleetType.Normal then
				var_84_6 = var_84_4
			elseif iter_84_3 == FleetType.Submarine then
				var_84_6 = var_84_5
			end

			for iter_84_5, iter_84_6 in pairs(var_84_1) do
				if var_84_6 <= #iter_84_4 then
					break
				end

				if iter_84_6 and iter_84_6:getFleetType() == iter_84_3 and iter_84_6:isUnlock() and iter_84_6:isLegalToFight() == true then
					table.insert(iter_84_4, iter_84_5)
				end
			end
		end
	end

	local var_84_7 = {}

	for iter_84_7, iter_84_8 in ipairs(var_84_3) do
		for iter_84_9, iter_84_10 in ipairs(iter_84_8) do
			table.insert(var_84_7, iter_84_10)
		end
	end

	return var_84_7
end

function var_0_0.GetDefaultFleetIndex(arg_87_0)
	local var_87_0 = getProxy(ChapterProxy):GetLastFleetIndex()

	return arg_87_0:selectFleets(var_87_0)
end

function var_0_0.getMaxColumnByRow(arg_88_0, arg_88_1)
	local var_88_0 = -1

	for iter_88_0, iter_88_1 in pairs(arg_88_0.cells) do
		if iter_88_1.row == arg_88_1 then
			var_88_0 = math.max(var_88_0, iter_88_1.column)
		end
	end

	return var_88_0
end

function var_0_0.getFleet(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	return _.detect(arg_89_0.fleets, function(arg_90_0)
		return arg_90_0.line.row == arg_89_2 and arg_90_0.line.column == arg_89_3 and (not arg_89_1 or arg_90_0:getFleetType() == arg_89_1) and arg_90_0:isValid()
	end) or _.detect(arg_89_0.fleets, function(arg_91_0)
		return arg_91_0.line.row == arg_89_2 and arg_91_0.line.column == arg_89_3 and (not arg_89_1 or arg_91_0:getFleetType() == arg_89_1)
	end)
end

function var_0_0.getFleetIndex(arg_92_0, arg_92_1, arg_92_2, arg_92_3)
	local var_92_0 = arg_92_0:getFleet(arg_92_1, arg_92_2, arg_92_3)

	if var_92_0 then
		return table.indexof(arg_92_0.fleets, var_92_0)
	end
end

function var_0_0.getOni(arg_93_0)
	return _.detect(arg_93_0.champions, function(arg_94_0)
		return arg_94_0.attachment == ChapterConst.AttachOni
	end)
end

function var_0_0.getChampion(arg_95_0, arg_95_1, arg_95_2)
	return (_.detect(arg_95_0.champions, function(arg_96_0)
		return arg_96_0.row == arg_95_1 and arg_96_0.column == arg_95_2
	end))
end

function var_0_0.getChampionIndex(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0 = arg_97_0:getChampion(arg_97_1, arg_97_2)

	if not var_97_0 then
		return
	end

	return table.indexof(arg_97_0.champions, var_97_0)
end

function var_0_0.getChampionVisibility(arg_98_0, arg_98_1, arg_98_2, arg_98_3)
	assert(arg_98_1, "chapter champion not exist.")

	return arg_98_1.flag == ChapterConst.CellFlagActive
end

function var_0_0.mergeChampion(arg_99_0, arg_99_1, arg_99_2)
	local var_99_0 = arg_99_0:getChampionIndex(arg_99_1.row, arg_99_1.column)

	if var_99_0 then
		arg_99_0.champions[var_99_0] = arg_99_1

		return true
	else
		if not arg_99_2 then
			arg_99_1.trait = ChapterConst.TraitLurk
		end

		table.insert(arg_99_0.champions, arg_99_1)

		return false
	end
end

function var_0_0.RemoveChampion(arg_100_0, arg_100_1)
	local var_100_0 = table.indexof(arg_100_0.champions, arg_100_1)

	if var_100_0 then
		table.remove(arg_100_0.champions, var_100_0)
	end
end

function var_0_0.considerAsObstacle(arg_101_0, arg_101_1, arg_101_2, arg_101_3)
	local var_101_0 = arg_101_0:getChapterCell(arg_101_2, arg_101_3)

	if not var_101_0 or not var_101_0:IsWalkable() then
		return true
	end

	if arg_101_0:existBarrier(arg_101_2, arg_101_3) then
		return true
	end

	if arg_101_1 == ChapterConst.SubjectPlayer then
		if var_101_0.flag == ChapterConst.CellFlagActive then
			if ChapterConst.IsEnemyAttach(var_101_0.attachment) then
				return true
			end

			if var_101_0.attachment == ChapterConst.AttachBox then
				local var_101_1 = pg.box_data_template[var_101_0.attachmentId]

				assert(var_101_1, "box_data_template not exist: " .. var_101_0.attachmentId)

				if var_101_1.type == ChapterConst.BoxTorpedo then
					return true
				end
			end

			if var_101_0.attachment == ChapterConst.AttachStory then
				return true
			end
		end

		if arg_101_0:existVisibleChampion(arg_101_2, arg_101_3) then
			return true
		end
	elseif arg_101_1 == ChapterConst.SubjectChampion and arg_101_0:existFleet(FleetType.Normal, arg_101_2, arg_101_3) then
		return true
	end

	return false
end

function var_0_0.considerAsStayPoint(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
	local var_102_0 = arg_102_0:getChapterCell(arg_102_2, arg_102_3)

	if not var_102_0 or not var_102_0:IsWalkable() then
		return false
	end

	if arg_102_0:existBarrier(arg_102_2, arg_102_3) then
		return false
	end

	if arg_102_1 == ChapterConst.SubjectPlayer then
		if var_102_0.flag == ChapterConst.CellFlagActive and var_102_0.attachment == ChapterConst.AttachStory then
			return true
		end

		if var_102_0.attachment == ChapterConst.AttachLandbase and pg.land_based_template[var_102_0.attachmentId] and pg.land_based_template[var_102_0.attachmentId].type == ChapterConst.LBHarbor then
			return false
		end

		if arg_102_0:existFleet(FleetType.Normal, arg_102_2, arg_102_3) then
			return false
		end

		if arg_102_0:existOni(arg_102_2, arg_102_3) then
			return false
		end

		if arg_102_0:existBombEnemy(arg_102_2, arg_102_3) then
			return false
		end
	elseif arg_102_1 == ChapterConst.SubjectChampion then
		if var_102_0.flag ~= ChapterConst.CellFlagDisabled and var_102_0.attachment ~= ChapterConst.AttachNone then
			return false
		end

		local var_102_1 = arg_102_0:getChampion(arg_102_2, arg_102_3)

		if var_102_1 and var_102_1.flag ~= ChapterConst.CellFlagDisabled then
			return false
		end
	end

	return true
end

function var_0_0.existAny(arg_103_0, arg_103_1, arg_103_2)
	local var_103_0 = arg_103_0:getChapterCell(arg_103_1, arg_103_2)

	if var_103_0.attachment ~= ChapterConst.AttachNone and var_103_0.flag == ChapterConst.CellFlagActive then
		return true
	end

	if arg_103_0:existFleet(nil, arg_103_1, arg_103_2) then
		return true
	end

	local var_103_1 = arg_103_0:getChampion(arg_103_1, arg_103_2)

	if var_103_1 and var_103_1.flag ~= ChapterConst.CellFlagDisabled then
		return true
	end
end

function var_0_0.existBarrier(arg_104_0, arg_104_1, arg_104_2)
	local var_104_0 = arg_104_0:getChapterCell(arg_104_1, arg_104_2)

	if var_104_0.attachment == ChapterConst.AttachBox and var_104_0.flag == ChapterConst.CellFlagActive and pg.box_data_template[var_104_0.attachmentId].type == ChapterConst.BoxBarrier then
		return true
	end

	if var_104_0.attachment == ChapterConst.AttachStory and var_104_0.flag == ChapterConst.CellFlagTriggerActive and pg.map_event_template[var_104_0.attachmentId].type == ChapterConst.StoryObstacle then
		return true
	end

	local var_104_1 = arg_104_0:getChampion(arg_104_1, arg_104_2)

	if var_104_1 and var_104_1.flag ~= ChapterConst.CellFlagDisabled then
		local var_104_2 = pg.expedition_data_template[var_104_1.attachmentId]

		if var_104_2 and var_104_2.type == ChapterConst.ExpeditionTypeUnTouchable then
			return true
		end
	end

	return false
end

function var_0_0.GetEnemy(arg_105_0, arg_105_1, arg_105_2)
	local var_105_0 = arg_105_0:getChapterCell(arg_105_1, arg_105_2)

	if var_105_0 and var_105_0.flag == ChapterConst.CellFlagActive and ChapterConst.IsEnemyAttach(var_105_0.attachment) then
		return var_105_0
	end

	local var_105_1 = arg_105_0:getChampion(arg_105_1, arg_105_2)

	if var_105_1 and var_105_1.flag ~= ChapterConst.CellFlagDisabled then
		return var_105_1
	end
end

function var_0_0.existEnemy(arg_106_0, arg_106_1, arg_106_2, arg_106_3)
	if arg_106_1 == ChapterConst.SubjectPlayer then
		local var_106_0 = arg_106_0:GetEnemy(arg_106_2, arg_106_3)

		if var_106_0 then
			local var_106_1

			if isa(var_106_0, ChapterCell) then
				var_106_1 = var_106_0.attachment
			else
				var_106_1 = ChapterConst.AttachChampion
			end

			return true, var_106_1
		end
	elseif arg_106_1 == ChapterConst.SubjectChampion and (arg_106_0:existFleet(FleetType.Normal, arg_106_2, arg_106_3) or arg_106_0:existFleet(FleetType.Transport, arg_106_2, arg_106_3)) then
		return true
	end
end

function var_0_0.existFleet(arg_107_0, arg_107_1, arg_107_2, arg_107_3)
	if _.any(arg_107_0.fleets, function(arg_108_0)
		return arg_108_0.line.row == arg_107_2 and arg_108_0.line.column == arg_107_3 and (not arg_107_1 or arg_108_0:getFleetType() == arg_107_1) and arg_108_0:isValid()
	end) then
		return true
	end
end

function var_0_0.existVisibleChampion(arg_109_0, arg_109_1, arg_109_2)
	local var_109_0 = arg_109_0:getChampion(arg_109_1, arg_109_2)

	return var_109_0 and arg_109_0:getChampionVisibility(var_109_0)
end

function var_0_0.existAlly(arg_110_0, arg_110_1)
	return _.any(arg_110_0.fleets, function(arg_111_0)
		return arg_111_0.id ~= arg_110_1.id and arg_111_0.line.row == arg_110_1.line.row and arg_111_0.line.column == arg_110_1.line.column and arg_111_0:isValid()
	end)
end

function var_0_0.existOni(arg_112_0, arg_112_1, arg_112_2)
	return _.any(arg_112_0.champions, function(arg_113_0)
		return arg_113_0.attachment == ChapterConst.AttachOni and arg_113_0.flag == ChapterConst.CellFlagActive and (not arg_112_1 or arg_112_1 == arg_113_0.row) and (not arg_112_2 or arg_112_2 == arg_113_0.column)
	end)
end

function var_0_0.existBombEnemy(arg_114_0, arg_114_1, arg_114_2)
	if arg_114_1 and arg_114_2 then
		local var_114_0 = arg_114_0:getChapterCell(arg_114_1, arg_114_2)

		return var_114_0.attachment == ChapterConst.AttachBomb_Enemy and var_114_0.flag == ChapterConst.CellFlagActive
	end

	for iter_114_0, iter_114_1 in pairs(arg_114_0.cells) do
		if iter_114_1.attachment == ChapterConst.AttachBomb_Enemy and iter_114_1.flag == ChapterConst.CellFlagActive and (not arg_114_1 or arg_114_1 == iter_114_1.row) and (not arg_114_2 or arg_114_2 == iter_114_1.column) then
			return true
		end
	end

	return false
end

function var_0_0.isPlayingWithBombEnemy(arg_115_0)
	for iter_115_0, iter_115_1 in pairs(arg_115_0.cells) do
		if iter_115_1.attachment == ChapterConst.AttachBomb_Enemy then
			return true
		end
	end

	return false
end

function var_0_0.existCoastalGunNoMatterLiveOrDead(arg_116_0)
	for iter_116_0, iter_116_1 in pairs(arg_116_0.cells) do
		if iter_116_1.attachment == ChapterConst.AttachLandbase then
			local var_116_0 = pg.land_based_template[iter_116_1.attachmentId]

			assert(var_116_0, "land_based_template not exist: " .. iter_116_1.attachmentId)

			if var_116_0.type == ChapterConst.LBCoastalGun then
				return true
			end
		end
	end

	return false
end

local var_0_1 = {
	{
		1,
		0
	},
	{
		-1,
		0
	},
	{
		0,
		1
	},
	{
		0,
		-1
	}
}

function var_0_0.calcWalkableCells(arg_117_0, arg_117_1, arg_117_2, arg_117_3, arg_117_4)
	local var_117_0 = {}

	for iter_117_0 = 0, ChapterConst.MaxRow - 1 do
		if not var_117_0[iter_117_0] then
			var_117_0[iter_117_0] = {}
		end

		for iter_117_1 = 0, ChapterConst.MaxColumn - 1 do
			local var_117_1 = ChapterCell.Line2Name(iter_117_0, iter_117_1)
			local var_117_2 = arg_117_0.cells[var_117_1]

			var_117_0[iter_117_0][iter_117_1] = var_117_2 and var_117_2:IsWalkable()
		end
	end

	local var_117_3 = {}

	if arg_117_1 == ChapterConst.SubjectPlayer then
		local var_117_4 = arg_117_0:getCoastalGunArea()

		for iter_117_2, iter_117_3 in ipairs(var_117_4) do
			var_117_3[iter_117_3.row .. "_" .. iter_117_3.column] = true
		end
	end

	local var_117_5 = {}
	local var_117_6 = arg_117_0:GetRawChapterCell(arg_117_2, arg_117_3)

	if not var_117_6 then
		return var_117_5
	end

	local var_117_7 = {
		{
			step = 0,
			row = arg_117_2,
			column = arg_117_3,
			forbiddens = var_117_6.forbiddenDirections
		}
	}
	local var_117_8 = {}

	while #var_117_7 > 0 do
		local var_117_9 = table.remove(var_117_7, 1)

		table.insert(var_117_8, var_117_9)
		_.each(var_0_1, function(arg_118_0)
			local var_118_0 = {
				row = var_117_9.row + arg_118_0[1],
				column = var_117_9.column + arg_118_0[2],
				step = var_117_9.step + 1
			}
			local var_118_1 = arg_117_0:GetRawChapterCell(var_118_0.row, var_118_0.column)

			if not var_118_1 then
				return
			end

			var_118_0.forbiddens = var_118_1.forbiddenDirections

			if var_118_0.step <= arg_117_4 and not OrientedPathFinding.IsDirectionForbidden(var_117_9, arg_118_0[1], arg_118_0[2]) and not (_.any(var_117_7, function(arg_119_0)
				return arg_119_0.row == var_118_0.row and arg_119_0.column == var_118_0.column
			end) or _.any(var_117_8, function(arg_120_0)
				return arg_120_0.row == var_118_0.row and arg_120_0.column == var_118_0.column
			end)) and var_117_0[var_118_0.row][var_118_0.column] then
				table.insert(var_117_5, var_118_0)

				if not arg_117_0:existEnemy(arg_117_1, var_118_0.row, var_118_0.column) and not arg_117_0:existBarrier(var_118_0.row, var_118_0.column) and not var_117_3[var_118_0.row .. "_" .. var_118_0.column] then
					table.insert(var_117_7, var_118_0)
				end
			end
		end)
	end

	var_117_5 = _.filter(var_117_5, function(arg_121_0)
		return arg_121_0.row == arg_117_2 and arg_121_0.column == arg_117_3 or arg_117_0:considerAsStayPoint(arg_117_1, arg_121_0.row, arg_121_0.column)
	end)

	return var_117_5
end

function var_0_0.calcAreaCells(arg_122_0, arg_122_1, arg_122_2, arg_122_3, arg_122_4)
	local var_122_0 = {}

	for iter_122_0 = 0, ChapterConst.MaxRow - 1 do
		if not var_122_0[iter_122_0] then
			var_122_0[iter_122_0] = {}
		end

		for iter_122_1 = 0, ChapterConst.MaxColumn - 1 do
			local var_122_1 = ChapterCell.Line2Name(iter_122_0, iter_122_1)
			local var_122_2 = arg_122_0.cells[var_122_1]

			var_122_0[iter_122_0][iter_122_1] = var_122_2 and var_122_2:IsWalkable()
		end
	end

	local var_122_3 = {}
	local var_122_4 = {
		{
			step = 0,
			row = arg_122_1,
			column = arg_122_2
		}
	}
	local var_122_5 = {}

	while #var_122_4 > 0 do
		local var_122_6 = table.remove(var_122_4, 1)

		table.insert(var_122_5, var_122_6)
		_.each(var_0_1, function(arg_123_0)
			local var_123_0 = {
				row = var_122_6.row + arg_123_0[1],
				column = var_122_6.column + arg_123_0[2],
				step = var_122_6.step + 1
			}

			if var_123_0.row >= 0 and var_123_0.row < ChapterConst.MaxRow and var_123_0.column >= 0 and var_123_0.column < ChapterConst.MaxColumn and var_123_0.step <= arg_122_4 and not (_.any(var_122_4, function(arg_124_0)
				return arg_124_0.row == var_123_0.row and arg_124_0.column == var_123_0.column
			end) or _.any(var_122_5, function(arg_125_0)
				return arg_125_0.row == var_123_0.row and arg_125_0.column == var_123_0.column
			end)) then
				table.insert(var_122_4, var_123_0)

				if var_122_0[var_123_0.row][var_123_0.column] and var_123_0.step >= arg_122_3 then
					table.insert(var_122_3, var_123_0)
				end
			end
		end)
	end

	return var_122_3
end

function var_0_0.calcSquareBarrierCells(arg_126_0, arg_126_1, arg_126_2, arg_126_3)
	local var_126_0 = {}

	for iter_126_0 = -arg_126_3, arg_126_3 do
		for iter_126_1 = -arg_126_3, arg_126_3 do
			local var_126_1 = arg_126_1 + iter_126_0
			local var_126_2 = arg_126_2 + iter_126_1
			local var_126_3 = arg_126_0:getChapterCell(var_126_1, var_126_2)

			if var_126_3 and var_126_3:IsWalkable() and (arg_126_0:existBarrier(var_126_1, var_126_2) or not arg_126_0:existAny(var_126_1, var_126_2)) then
				table.insert(var_126_0, {
					row = var_126_1,
					column = var_126_2
				})
			end
		end
	end

	return var_126_0
end

function var_0_0.checkAnyInteractive(arg_127_0)
	local var_127_0 = arg_127_0.fleet.line
	local var_127_1 = arg_127_0:getChapterCell(var_127_0.row, var_127_0.column)
	local var_127_2 = false

	if arg_127_0.fleet:getFleetType() == FleetType.Normal then
		if arg_127_0:existEnemy(ChapterConst.SubjectPlayer, var_127_1.row, var_127_1.column) then
			if arg_127_0:getRound() == ChapterConst.RoundPlayer then
				var_127_2 = true
			end
		elseif var_127_1.attachment == ChapterConst.AttachAmbush or var_127_1.attachment == ChapterConst.AttachBox then
			if var_127_1.flag ~= ChapterConst.CellFlagDisabled then
				var_127_2 = true
			end
		elseif var_127_1.attachment == ChapterConst.AttachStory then
			var_127_2 = var_127_1.flag == ChapterConst.CellFlagActive
		elseif var_127_1.attachment == ChapterConst.AttachSupply and var_127_1.attachmentId > 0 then
			local var_127_3, var_127_4 = arg_127_0:getFleetAmmo(arg_127_0.fleet)

			if var_127_4 < var_127_3 then
				var_127_2 = true
			end
		elseif var_127_1.attachment == ChapterConst.AttachBox and var_127_1.flag ~= ChapterConst.CellFlagDisabled then
			var_127_2 = true
		end
	end

	return var_127_2
end

function var_0_0.getQuadCellPic(arg_128_0, arg_128_1)
	local var_128_0

	if arg_128_1.trait == ChapterConst.TraitLurk then
		-- block empty
	elseif arg_128_1.flag == ChapterConst.CellFlagActive and ChapterConst.IsEnemyAttach(arg_128_1.attachment) and arg_128_1.flag == ChapterConst.CellFlagActive then
		var_128_0 = "cell_enemy"
	elseif arg_128_1.attachment == ChapterConst.AttachBox and arg_128_1.flag == ChapterConst.CellFlagActive then
		local var_128_1 = pg.box_data_template[arg_128_1.attachmentId]

		assert(var_128_1, "box_data_template not exist: " .. arg_128_1.attachmentId)

		if var_128_1.type == ChapterConst.BoxDrop or var_128_1.type == ChapterConst.BoxStrategy or var_128_1.type == ChapterConst.BoxSupply or var_128_1.type == ChapterConst.BoxEnemy then
			var_128_0 = "cell_box"
		elseif var_128_1.type == ChapterConst.BoxTorpedo then
			var_128_0 = "cell_enemy"
		elseif var_128_1.type == ChapterConst.BoxBarrier then
			var_128_0 = "cell_green"
		end
	elseif arg_128_1.attachment == ChapterConst.AttachStory then
		if arg_128_1.flag == ChapterConst.CellFlagTriggerActive then
			local var_128_2 = pg.map_event_template[arg_128_1.attachmentId].grid_color

			var_128_0 = var_128_2 and #var_128_2 > 0 and var_128_2 or nil
		end
	elseif arg_128_1.attachment == ChapterConst.AttachSupply and arg_128_1.attachmentId > 0 then
		var_128_0 = "cell_box"
	elseif arg_128_1.attachment == ChapterConst.AttachTransport_Target then
		var_128_0 = "cell_box"
	elseif arg_128_1.attachment == ChapterConst.AttachLandbase then
		local var_128_3 = pg.land_based_template[arg_128_1.attachmentId]

		if var_128_3 and (var_128_3.type == ChapterConst.LBHarbor or var_128_3.type == ChapterConst.LBDock) then
			var_128_0 = "cell_box"
		end
	end

	return var_128_0
end

function var_0_0.getMapShip(arg_129_0, arg_129_1)
	local var_129_0

	if arg_129_1:isValid() then
		var_129_0 = _.detect(arg_129_1:getShips(false), function(arg_130_0)
			return arg_130_0.isNpc and arg_130_0.hpRant > 0
		end)

		if not var_129_0 then
			local var_129_1 = arg_129_1:getFleetType()

			if var_129_1 == FleetType.Normal then
				var_129_0 = arg_129_1:getShipsByTeam(TeamType.Main, false)[1]
			elseif var_129_1 == FleetType.Submarine then
				var_129_0 = arg_129_1:getShipsByTeam(TeamType.Submarine, false)[1]
			end
		end
	end

	return var_129_0
end

function var_0_0.getStrikeAnimShip(arg_131_0, arg_131_1, arg_131_2)
	return underscore.detect(arg_131_1:getShips(false), function(arg_132_0)
		return arg_132_0:GetMapStrikeAnim() == arg_131_2
	end)
end

function var_0_0.GetSubmarineFleet(arg_133_0)
	return table.Find(arg_133_0.fleets, function(arg_134_0, arg_134_1)
		return arg_134_1:getFleetType() == FleetType.Submarine and arg_134_1:isValid()
	end)
end

function var_0_0.getStageCell(arg_135_0, arg_135_1, arg_135_2)
	local var_135_0 = arg_135_0:getChampion(arg_135_1, arg_135_2)

	if var_135_0 and var_135_0.flag ~= ChapterConst.CellFlagDisabled then
		return var_135_0
	end

	local var_135_1 = arg_135_0:getChapterCell(arg_135_1, arg_135_2)

	if var_135_1 and var_135_1.flag ~= ChapterConst.CellFlagDisabled then
		return var_135_1
	end
end

function var_0_0.getStageId(arg_136_0, arg_136_1, arg_136_2)
	local var_136_0 = arg_136_0:getChampion(arg_136_1, arg_136_2)

	if var_136_0 and var_136_0.flag ~= ChapterConst.CellFlagDisabled then
		return var_136_0.id
	end

	local var_136_1 = arg_136_0:getChapterCell(arg_136_1, arg_136_2)

	if var_136_1 and var_136_1.flag ~= ChapterConst.CellFlagDisabled then
		return var_136_1.attachmentId
	end
end

function var_0_0.getStageExtraAwards(arg_137_0)
	return
end

function var_0_0.GetExtraCostRate(arg_138_0)
	local var_138_0 = 1
	local var_138_1 = {}

	for iter_138_0, iter_138_1 in ipairs(arg_138_0.operationBuffList) do
		local var_138_2 = pg.benefit_buff_template[iter_138_1]

		var_138_1[#var_138_1 + 1] = var_138_2

		if var_138_2.benefit_type == var_0_0.OPERATION_BUFF_TYPE_COST then
			var_138_0 = var_138_0 + var_138_2.benefit_effect * 0.01
		end
	end

	return math.max(1, var_138_0), var_138_1
end

function var_0_0.getFleetCost(arg_139_0, arg_139_1, arg_139_2)
	if arg_139_0:getPlayType() == ChapterConst.TypeExtra then
		return {
			gold = 0,
			oil = 0
		}, {
			gold = 0,
			oil = 0
		}
	end

	local var_139_0, var_139_1 = arg_139_1:getCost()
	local var_139_2 = arg_139_0:GetLimitOilCost(arg_139_1:getFleetType() == FleetType.Submarine, arg_139_2)

	var_139_1.oil = math.clamp(var_139_2 - var_139_0.oil, 0, var_139_1.oil)

	local var_139_3 = arg_139_0:GetExtraCostRate()

	for iter_139_0, iter_139_1 in ipairs({
		var_139_0,
		var_139_1
	}) do
		for iter_139_2, iter_139_3 in pairs(iter_139_1) do
			iter_139_1[iter_139_2] = iter_139_1[iter_139_2] * var_139_3
		end
	end

	return var_139_0, var_139_1
end

function var_0_0.isOverFleetCost(arg_140_0, arg_140_1, arg_140_2)
	local var_140_0 = arg_140_0:GetLimitOilCost(arg_140_1:getFleetType() == FleetType.Submarine, arg_140_2)
	local var_140_1 = 0

	for iter_140_0, iter_140_1 in ipairs({
		arg_140_1:getCost()
	}) do
		var_140_1 = var_140_1 + iter_140_1.oil
	end

	local var_140_2 = arg_140_0:GetExtraCostRate()

	return var_140_0 < var_140_1, var_140_0 * var_140_2, var_140_1 * var_140_2
end

function var_0_0.writeBack(arg_141_0, arg_141_1, arg_141_2)
	local var_141_0 = arg_141_0.fleet

	local function var_141_1(arg_142_0)
		local var_142_0 = arg_141_2.statistics[arg_142_0.id]

		if not var_142_0 then
			return
		end

		arg_142_0.hpRant = var_142_0.bp
	end

	for iter_141_0, iter_141_1 in pairs(var_141_0.ships) do
		var_141_1(iter_141_1)
	end

	var_141_0:ResortShips()

	if not arg_141_2.skipAmmo then
		var_141_0.restAmmo = math.max(var_141_0.restAmmo - 1, 0)
	end

	local var_141_2 = _.filter(var_141_0:getStrategies(), function(arg_143_0)
		local var_143_0 = pg.strategy_data_template[arg_143_0.id]

		return var_143_0 and var_143_0.type == ChapterConst.StgTypeBindFleetPassive and arg_143_0.count > 0
	end)

	_.each(var_141_2, function(arg_144_0)
		var_141_0:consumeOneStrategy(arg_144_0.id)
	end)

	if arg_141_2.statistics.submarineAid then
		local var_141_3 = arg_141_0:GetSubmarineFleet()

		if var_141_3 and not var_141_3:inHuntingRange(var_141_0.line.row, var_141_0.line.column) then
			var_141_3:consumeOneStrategy(ChapterConst.StrategyCallSubOutofRange)
		end

		if var_141_3 then
			for iter_141_2, iter_141_3 in pairs(var_141_3.ships) do
				var_141_1(iter_141_3)
			end

			var_141_3.restAmmo = math.max(var_141_3.restAmmo - 1, 0)
		end
	end

	arg_141_0:UpdateComboHistory(arg_141_2.statistics._battleScore)

	if arg_141_1 then
		local var_141_4
		local var_141_5
		local var_141_6 = arg_141_0:getChampion(var_141_0.line.row, var_141_0.line.column)

		if var_141_6 then
			var_141_6:Iter()

			var_141_4 = var_141_6.attachment
			var_141_5 = var_141_6.attachmentId

			if var_141_6.flag == ChapterConst.CellFlagDisabled then
				arg_141_0:RemoveChampion(var_141_6)
			end
		else
			local var_141_7 = arg_141_0:getChapterCell(var_141_0.line.row, var_141_0.line.column)

			var_141_4 = var_141_7.attachment
			var_141_5 = var_141_7.attachmentId

			if var_141_4 == ChapterConst.AttachEnemy or var_141_4 == ChapterConst.AttachBoss then
				var_141_7.flag = ChapterConst.CellFlagDisabled

				arg_141_0:updateChapterCell(var_141_7)
			else
				arg_141_0:clearChapterCell(var_141_7.row, var_141_7.column)
			end
		end

		assert(var_141_4, "attachment can not be nil.")

		if var_141_4 == ChapterConst.AttachEnemy or var_141_4 == ChapterConst.AttachElite or var_141_4 == ChapterConst.AttachChampion then
			if not var_141_6 or var_141_6.flag == ChapterConst.CellFlagDisabled then
				local var_141_8 = _.detect(arg_141_0.achieves, function(arg_145_0)
					return arg_145_0.type == ChapterConst.AchieveType2
				end)

				if var_141_8 then
					var_141_8.count = var_141_8.count + 1
				end
			end
		elseif var_141_4 == ChapterConst.AttachBoss then
			local var_141_9 = _.detect(arg_141_0.achieves, function(arg_146_0)
				return arg_146_0.type == ChapterConst.AchieveType1
			end)

			if var_141_9 then
				var_141_9.count = var_141_9.count + 1
			end
		end

		if arg_141_0:CheckChapterWin() then
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_KILL_BOSS)
		end

		local var_141_10 = false

		if var_141_6 then
			var_141_10 = var_141_6.flag == ChapterConst.CellFlagDisabled
		else
			var_141_10 = (arg_141_2.system ~= SYSTEM_SCENARIO_SUB_STRIKE or false) and var_141_4 ~= ChapterConst.AttachBox
		end

		if var_141_10 then
			var_141_0.defeatEnemies = var_141_0.defeatEnemies + 1

			if var_141_4 ~= ChapterConst.AttachAmbush and arg_141_0:IsFogStage() then
				var_141_0.visibleLevel = var_141_0.visibleLevel + 1

				var_141_0:UpdateVisible()
			end

			arg_141_0.defeatEnemies = arg_141_0.defeatEnemies + 1

			local var_141_11 = pg.expedition_data_template[var_141_5]

			if not arg_141_0:isLoop() and var_141_11 and var_141_11.type == ChapterConst.ExpeditionTypeMulBoss then
				local var_141_12 = pg.chapter_model_multistageboss[arg_141_0.id].guild_buff
				local var_141_13 = var_141_0:GetStatusStrategy()

				_.each(var_141_12, function(arg_147_0)
					if not table.contains(var_141_13, arg_147_0) then
						table.insert(var_141_13, arg_147_0)
					end
				end)

				local var_141_14 = arg_141_0:getNextValidIndex()

				if var_141_14 > 0 then
					var_141_13 = arg_141_0.fleets[var_141_14]:GetStatusStrategy()

					_.each(var_141_12, function(arg_148_0)
						table.removebyvalue(var_141_13, arg_148_0)
					end)
				end
			end

			getProxy(ChapterProxy):RecordLastDefeatedEnemy(arg_141_0.id, {
				score = arg_141_2.statistics._battleScore,
				line = {
					row = var_141_0.line.row,
					column = var_141_0.line.column
				},
				attachment = var_141_4,
				attachmentId = var_141_5
			})
		end
	end
end

function var_0_0.CleanCurrentEnemy(arg_149_0)
	local var_149_0 = arg_149_0.fleet.line
	local var_149_1
	local var_149_2 = arg_149_0:getChampion(var_149_0.row, var_149_0.column)

	if var_149_2 then
		var_149_2:Iter()

		if var_149_2.flag == ChapterConst.CellFlagDisabled then
			arg_149_0:RemoveChampion(var_149_2)
		end

		return
	end

	if arg_149_0:getChapterCell(var_149_0.row, var_149_0.column).attachment == ChapterConst.AttachEnemy then
		arg_149_0:clearChapterCell(var_149_0.row, var_149_0.column)

		return
	end
end

function var_0_0.UpdateProgressAfterSkipBattle(arg_150_0)
	arg_150_0:writeBack(true, {
		skipAmmo = true,
		statistics = {
			_battleScore = ys.Battle.BattleConst.BattleScore.S
		}
	})
end

function var_0_0.UpdateProgressOnRetreat(arg_151_0)
	_.each(arg_151_0.achieves, function(arg_152_0)
		if arg_152_0.type == ChapterConst.AchieveType3 then
			if _.all(_.values(arg_151_0.cells), function(arg_153_0)
				if arg_153_0.attachment == ChapterConst.AttachEnemy or arg_153_0.attachment == ChapterConst.AttachElite or arg_153_0.attachment == ChapterConst.AttachBox and pg.box_data_template[arg_153_0.attachmentId].type == ChapterConst.BoxEnemy then
					return arg_153_0.flag == ChapterConst.CellFlagDisabled
				end

				return true
			end) and _.all(arg_151_0.champions, function(arg_154_0)
				return arg_154_0.flag == ChapterConst.CellFlagDisabled
			end) then
				arg_152_0.count = arg_152_0.count + 1
			end
		elseif arg_152_0.type == ChapterConst.AchieveType4 then
			if arg_151_0.orignalShipCount <= arg_152_0.config then
				arg_152_0.count = arg_152_0.count + 1
			end
		elseif arg_152_0.type == ChapterConst.AchieveType5 then
			if not _.any(arg_151_0:getShips(), function(arg_155_0)
				return arg_155_0:getShipType() == arg_152_0.config
			end) then
				arg_152_0.count = arg_152_0.count + 1
			end
		elseif arg_152_0.type == ChapterConst.AchieveType6 then
			local var_152_0 = (arg_151_0.scoreHistory[0] or 0) + (arg_151_0.scoreHistory[1] or 0)

			arg_152_0.count = math.max(var_152_0 <= 0 and arg_151_0.combo or 0, arg_152_0.count or 0)
		end
	end)

	if arg_151_0.progress == 100 then
		arg_151_0.passCount = arg_151_0.passCount + 1
	end

	local var_151_0 = arg_151_0.progress
	local var_151_1 = math.min(arg_151_0.progress + arg_151_0:getConfig("progress_boss"), 100)

	arg_151_0.progress = var_151_1

	if var_151_0 < 100 and var_151_1 >= 100 then
		getProxy(ChapterProxy):RecordJustClearChapters(arg_151_0.id, true)
	end

	arg_151_0.defeatCount = arg_151_0.defeatCount + 1

	local var_151_2 = getProxy(ChapterProxy):getMapById(arg_151_0:getConfig("map")):getMapType()

	if var_151_2 == Map.ELITE then
		pg.TrackerMgr.GetInstance():Tracking(TRACKING_HARD_CHAPTER, arg_151_0.id)
	elseif var_151_2 == Map.SCENARIO then
		if arg_151_0.progress == 100 and arg_151_0.passCount == 0 then
			pg.TrackerMgr.GetInstance():Tracking(TRACKING_HIGHEST_CHAPTER, arg_151_0.id)
		end

		if arg_151_0.defeatCount == 1 then
			if arg_151_0.id == 304 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_3_4)
			elseif arg_151_0.id == 404 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_4_4)
			elseif arg_151_0.id == 504 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_5_4)
			elseif arg_151_0.id == 604 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_6_4)
			elseif arg_151_0.id == 1204 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_12_4)
			elseif arg_151_0.id == 1301 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_13_1)
			elseif arg_151_0.id == 1302 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_13_2)
			elseif arg_151_0.id == 1303 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_13_3)
			elseif arg_151_0.id == 1304 then
				pg.TrackerMgr.GetInstance():Tracking(TRACKING_FIRST_PASS_13_4)
			end
		end
	end
end

function var_0_0.UpdateComboHistory(arg_156_0, arg_156_1)
	getProxy(ChapterProxy):RecordComboHistory(arg_156_0.id, {
		scoreHistory = Clone(arg_156_0.scoreHistory),
		combo = Clone(arg_156_0.combo)
	})

	arg_156_0.scoreHistory = arg_156_0.scoreHistory or {}
	arg_156_0.scoreHistory[arg_156_1] = (arg_156_0.scoreHistory[arg_156_1] or 0) + 1

	if arg_156_1 <= ys.Battle.BattleConst.BattleScore.C then
		arg_156_0.combo = 0
	else
		arg_156_0.combo = (arg_156_0.combo or 0) + 1
	end
end

function var_0_0.GetWinConditions(arg_157_0)
	return arg_157_0.winConditions
end

function var_0_0.GetLoseConditions(arg_158_0)
	return arg_158_0.loseConditions
end

function var_0_0.CheckChapterWin(arg_159_0)
	local var_159_0 = arg_159_0:GetWinConditions()
	local var_159_1 = false
	local var_159_2 = ChapterConst.ReasonVictory

	for iter_159_0, iter_159_1 in pairs(var_159_0) do
		if iter_159_1.type == 1 then
			local var_159_3 = arg_159_0:findChapterCells(ChapterConst.AttachBoss)
			local var_159_4 = 0

			_.each(var_159_3, function(arg_160_0)
				if arg_160_0 and arg_160_0.flag == ChapterConst.CellFlagDisabled then
					var_159_4 = var_159_4 + 1
				end
			end)

			var_159_1 = var_159_1 or var_159_4 >= iter_159_1.param
		elseif iter_159_1.type == 2 then
			var_159_1 = var_159_1 or arg_159_0:GetDefeatCount() >= iter_159_1.param
		elseif iter_159_1.type == 3 then
			local var_159_5 = arg_159_0:CheckTransportState()

			var_159_1 = var_159_1 or var_159_5 == 1
		elseif iter_159_1.type == 4 then
			var_159_1 = var_159_1 or arg_159_0:getRoundNum() > iter_159_1.param
		elseif iter_159_1.type == 5 then
			local var_159_6 = iter_159_1.param
			local var_159_7 = _.any(arg_159_0.champions, function(arg_161_0)
				local var_161_0 = arg_161_0.attachmentId == var_159_6

				for iter_161_0, iter_161_1 in pairs(arg_161_0.idList) do
					var_161_0 = var_161_0 or iter_161_1 == var_159_6
				end

				return var_161_0 and arg_161_0.flag ~= ChapterConst.CellFlagDisabled
			end) or _.any(arg_159_0.cells, function(arg_162_0)
				return arg_162_0.attachmentId == var_159_6 and arg_162_0.flag ~= ChapterConst.CellFlagDisabled
			end)

			var_159_1 = var_159_1 or not var_159_7
		elseif iter_159_1.type == 6 then
			local var_159_8 = iter_159_1.param
			local var_159_9 = _.any(arg_159_0.fleets, function(arg_163_0)
				return arg_163_0:getFleetType() == FleetType.Normal and arg_163_0:isValid() and arg_163_0.line.row == var_159_8[1] and arg_163_0.line.column == var_159_8[2]
			end)

			var_159_1 = var_159_1 or var_159_9
		end

		if var_159_1 then
			break
		end
	end

	return var_159_1, var_159_2
end

function var_0_0.CheckChapterLose(arg_164_0)
	local var_164_0 = arg_164_0:GetLoseConditions()
	local var_164_1 = false
	local var_164_2 = ChapterConst.ReasonDefeat

	for iter_164_0, iter_164_1 in pairs(var_164_0) do
		if iter_164_1.type == 1 then
			local var_164_3 = _.any(arg_164_0.fleets, function(arg_165_0)
				return arg_165_0:getFleetType() == FleetType.Normal and arg_165_0:isValid()
			end)

			var_164_1 = var_164_1 or not var_164_3
		elseif iter_164_1.type == 2 then
			var_164_1 = var_164_1 or arg_164_0.BaseHP <= 0
			var_164_2 = var_164_1 and ChapterConst.ReasonDefeatDefense or var_164_2
		end

		if var_164_1 then
			break
		end
	end

	if arg_164_0:getPlayType() == ChapterConst.TypeTransport then
		local var_164_4 = arg_164_0:CheckTransportState()

		var_164_1 = var_164_1 or var_164_4 == -1
	end

	return var_164_1, var_164_2
end

function var_0_0.CheckChapterWillWin(arg_166_0)
	if arg_166_0:existOni() or arg_166_0:isPlayingWithBombEnemy() then
		return true
	end

	if arg_166_0:CheckChapterWin() then
		return true
	end
end

function var_0_0.triggerSkill(arg_167_0, arg_167_1, arg_167_2)
	local var_167_0 = _.filter(arg_167_1:findSkills(arg_167_2), function(arg_168_0)
		local var_168_0 = arg_168_0:GetTriggers()

		return _.any(var_168_0, function(arg_169_0)
			return arg_169_0[1] == FleetSkill.TriggerInSubTeam and arg_169_0[2] == 1
		end) == (arg_167_1:getFleetType() == FleetType.Submarine) and _.all(arg_168_0:GetTriggers(), function(arg_170_0)
			return arg_167_0:triggerCheck(arg_167_1, arg_168_0, arg_170_0)
		end)
	end)

	return _.reduce(var_167_0, nil, function(arg_171_0, arg_171_1)
		local var_171_0 = arg_171_1:GetType()
		local var_171_1 = arg_171_1:GetArgs()

		if var_171_0 == FleetSkill.TypeMoveSpeed or var_171_0 == FleetSkill.TypeHuntingLv or var_171_0 == FleetSkill.TypeTorpedoPowerUp then
			return (arg_171_0 or 0) + var_171_1[1]
		elseif var_171_0 == FleetSkill.TypeAmbushDodge or var_171_0 == FleetSkill.TypeAirStrikeDodge then
			return math.max(arg_171_0 or 0, var_171_1[1])
		elseif var_171_0 == FleetSkill.TypeAttack or var_171_0 == FleetSkill.TypeStrategy then
			arg_171_0 = arg_171_0 or {}

			table.insert(arg_171_0, var_171_1)

			return arg_171_0
		elseif var_171_0 == FleetSkill.TypeBattleBuff then
			arg_171_0 = arg_171_0 or {}

			table.insert(arg_171_0, var_171_1[1])

			return arg_171_0
		end
	end), var_167_0
end

function var_0_0.triggerCheck(arg_172_0, arg_172_1, arg_172_2, arg_172_3)
	local var_172_0 = arg_172_3[1]

	if var_172_0 == FleetSkill.TriggerDDHead then
		local var_172_1 = arg_172_1:getShipsByTeam(TeamType.Vanguard, false)

		return #var_172_1 > 0 and ShipType.IsTypeQuZhu(var_172_1[1]:getShipType())
	elseif var_172_0 == FleetSkill.TriggerVanCount then
		local var_172_2 = arg_172_1:getShipsByTeam(TeamType.Vanguard, false)

		return #var_172_2 >= arg_172_3[2] and #var_172_2 <= arg_172_3[3]
	elseif var_172_0 == FleetSkill.TriggerShipCount then
		local var_172_3 = _.filter(arg_172_1:getShips(false), function(arg_173_0)
			return table.contains(arg_172_3[2], arg_173_0:getShipType())
		end)

		return #var_172_3 >= arg_172_3[3] and #var_172_3 <= arg_172_3[4]
	elseif var_172_0 == FleetSkill.TriggerAroundEnemy then
		local var_172_4 = {
			row = arg_172_1.line.row,
			column = arg_172_1.line.column
		}

		return _.any(_.values(arg_172_0.cells), function(arg_174_0)
			local var_174_0 = arg_172_0:GetEnemy(arg_174_0.row, arg_174_0.column)

			if not var_174_0 then
				return
			end

			local var_174_1 = pg.expedition_data_template[var_174_0.attachmentId]

			if not var_174_1 then
				return
			end

			local var_174_2 = var_174_1.type

			return ManhattonDist(var_172_4, {
				row = arg_174_0.row,
				column = arg_174_0.column
			}) <= arg_172_3[2] and (type(arg_172_3[3]) == "number" and arg_172_3[3] == var_174_2 or type(arg_172_3[3]) == "table" and table.contains(arg_172_3[3], var_174_2))
		end)
	elseif var_172_0 == FleetSkill.TriggerNekoPos then
		local var_172_5 = arg_172_1:findCommanderBySkillId(arg_172_2.id)

		for iter_172_0, iter_172_1 in pairs(arg_172_1:getCommanders()) do
			if var_172_5.id == iter_172_1.id and iter_172_0 == arg_172_3[2] then
				return true
			end
		end
	elseif var_172_0 == FleetSkill.TriggerAroundLand then
		local var_172_6 = {
			row = arg_172_1.line.row,
			column = arg_172_1.line.column
		}

		return _.any(_.values(arg_172_0.cells), function(arg_175_0)
			return not arg_175_0:IsWalkable() and ManhattonDist(var_172_6, {
				row = arg_175_0.row,
				column = arg_175_0.column
			}) <= arg_172_3[2]
		end)
	elseif var_172_0 == FleetSkill.TriggerAroundCombatAlly then
		local var_172_7 = {
			row = arg_172_1.line.row,
			column = arg_172_1.line.column
		}

		return _.any(arg_172_0.fleets, function(arg_176_0)
			return arg_172_1.id ~= arg_176_0.id and arg_176_0:getFleetType() == FleetType.Normal and arg_172_0:existEnemy(ChapterConst.SubjectPlayer, arg_176_0.line.row, arg_176_0.line.column) and ManhattonDist(var_172_7, {
				row = arg_176_0.line.row,
				column = arg_176_0.line.column
			}) <= arg_172_3[2]
		end)
	elseif var_172_0 == FleetSkill.TriggerInSubTeam then
		return true
	else
		assert(false, "invalid trigger type: " .. var_172_0)
	end
end

local var_0_2 = {
	{
		1,
		0
	},
	{
		-1,
		0
	},
	{
		0,
		1
	},
	{
		0,
		-1
	}
}

function var_0_0.checkOniState(arg_177_0)
	local var_177_0 = arg_177_0:getOni()

	assert(var_177_0, "oni not exist.")

	if _.all(var_0_2, function(arg_178_0)
		local var_178_0 = {
			var_177_0.row + arg_178_0[1],
			var_177_0.column + arg_178_0[2]
		}

		if arg_177_0:existFleet(FleetType.Normal, var_178_0[1], var_178_0[2]) then
			return true
		end

		local var_178_1 = arg_177_0:getChapterCell(var_178_0[1], var_178_0[2])

		if not var_178_1 or not var_178_1:IsWalkable() then
			return true
		end

		if arg_177_0:existBarrier(var_178_1.row, var_178_1.column) then
			return true
		end
	end) then
		return 1
	end

	local var_177_1 = arg_177_0:getOniChapterInfo().escape_grids

	if _.any(var_177_1, function(arg_179_0)
		return arg_179_0[1] == var_177_0.row and arg_179_0[2] == var_177_0.column
	end) then
		return 2
	end
end

function var_0_0.onOniEnter(arg_180_0)
	for iter_180_0, iter_180_1 in pairs(arg_180_0.cells) do
		iter_180_1.attachment = ChapterConst.AttachNone
		iter_180_1.attachmentId = nil
		iter_180_1.flag = nil
		iter_180_1.data = nil
	end

	arg_180_0.champions = {}
	arg_180_0.modelCount = arg_180_0:getOniChapterInfo().special_item
	arg_180_0.roundIndex = 0
end

function var_0_0.onBombEnemyEnter(arg_181_0)
	for iter_181_0, iter_181_1 in pairs(arg_181_0.cells) do
		iter_181_1.attachment = ChapterConst.AttachNone
		iter_181_1.attachmentId = nil
		iter_181_1.flag = nil
		iter_181_1.data = nil
	end

	arg_181_0.champions = {}
	arg_181_0.modelCount = 0
	arg_181_0.roundIndex = 0
end

function var_0_0.clearSubmarineFleet(arg_182_0)
	for iter_182_0 = #arg_182_0.fleets, 1, -1 do
		if arg_182_0.fleets[iter_182_0]:getFleetType() == FleetType.Submarine then
			table.remove(arg_182_0.fleets, iter_182_0)
		end
	end
end

function var_0_0.getSpAppearStory(arg_183_0)
	if arg_183_0:existOni() then
		for iter_183_0, iter_183_1 in ipairs(arg_183_0.champions) do
			if iter_183_1.trait == ChapterConst.TraitLurk and iter_183_1.attachment == ChapterConst.AttachOni then
				local var_183_0 = iter_183_1:getConfig("appear_story")

				if var_183_0 and #var_183_0 > 0 then
					return var_183_0
				end
			end
		end
	elseif arg_183_0:isPlayingWithBombEnemy() then
		for iter_183_2, iter_183_3 in pairs(arg_183_0.cells) do
			if iter_183_3.attachment == ChapterConst.AttachBomb_Enemy and iter_183_3.trait == ChapterConst.TraitLurk then
				local var_183_1 = pg.specialunit_template[iter_183_3.attachmentId]

				if var_183_1.appear_story and #var_183_1.appear_story > 0 then
					return var_183_1.appear_story
				end
			end
		end
	end
end

function var_0_0.getSpAppearGuide(arg_184_0)
	if arg_184_0:existOni() then
		for iter_184_0, iter_184_1 in ipairs(arg_184_0.champions) do
			if iter_184_1.trait == ChapterConst.TraitLurk and iter_184_1.attachment == ChapterConst.AttachOni then
				local var_184_0 = iter_184_1:getConfig("appear_guide")

				if var_184_0 and #var_184_0 > 0 then
					return var_184_0
				end
			end
		end
	elseif arg_184_0:isPlayingWithBombEnemy() then
		for iter_184_2, iter_184_3 in pairs(arg_184_0.cells) do
			if iter_184_3.attachment == ChapterConst.AttachBomb_Enemy and iter_184_3.trait == ChapterConst.TraitLurk then
				local var_184_1 = pg.specialunit_template[iter_184_3.attachmentId]

				if var_184_1.appear_guide and #var_184_1.appear_guide > 0 then
					return var_184_1.appear_guide
				end
			end
		end
	end
end

function var_0_0.CheckTransportState(arg_185_0)
	local var_185_0 = _.detect(arg_185_0.fleets, function(arg_186_0)
		return arg_186_0:getFleetType() == FleetType.Transport
	end)

	if not var_185_0 then
		return -1
	end

	local var_185_1 = arg_185_0:findChapterCell(ChapterConst.AttachTransport_Target)

	assert(var_185_0, "transport fleet not exist.")
	assert(var_185_1, "transport target not exist.")

	if not var_185_0:isValid() then
		return -1
	elseif var_185_0.line.row == var_185_1.row and var_185_0.line.column == var_185_1.column and not arg_185_0:existEnemy(ChapterConst.SubjectPlayer, var_185_1.row, var_185_1.column) then
		return 1
	else
		return 0
	end
end

function var_0_0.getCoastalGunArea(arg_187_0)
	local var_187_0 = {}

	for iter_187_0, iter_187_1 in pairs(arg_187_0.cells) do
		if iter_187_1.attachment == ChapterConst.AttachLandbase and iter_187_1.flag ~= ChapterConst.CellFlagDisabled then
			local var_187_1 = pg.land_based_template[iter_187_1.attachmentId]

			if var_187_1.type == ChapterConst.LBCoastalGun then
				local var_187_2 = var_187_1.function_args
				local var_187_3 = {
					math.abs(var_187_2[1]),
					math.abs(var_187_2[2])
				}
				local var_187_4 = {
					Mathf.Sign(var_187_2[1]),
					Mathf.Sign(var_187_2[2])
				}
				local var_187_5 = math.max(var_187_3[1], var_187_3[2])

				for iter_187_2 = 1, var_187_5 do
					table.insert(var_187_0, {
						row = iter_187_1.row + math.min(var_187_3[1], iter_187_2) * var_187_4[1],
						column = iter_187_1.column + math.min(var_187_3[2], iter_187_2) * var_187_4[2]
					})
				end
			end
		end
	end

	return var_187_0
end

function var_0_0.GetAntiAirGunArea(arg_188_0)
	local var_188_0 = {}
	local var_188_1 = {}

	for iter_188_0, iter_188_1 in pairs(arg_188_0.cells) do
		if iter_188_1.attachment == ChapterConst.AttachLandbase and iter_188_1.flag ~= ChapterConst.CellFlagDisabled then
			local var_188_2 = pg.land_based_template[iter_188_1.attachmentId]

			if var_188_2.type == ChapterConst.LBAntiAir then
				local var_188_3 = var_188_2.function_args
				local var_188_4 = math.abs(var_188_3[1])

				local function var_188_5(arg_189_0, arg_189_1)
					return ChapterConst.MaxColumn * arg_189_0 + arg_189_1
				end

				local var_188_6 = {}
				local var_188_7 = {}

				if var_188_4 > 0 then
					var_188_6[var_188_5(iter_188_1.row, iter_188_1.column)] = iter_188_1
				end

				while next(var_188_6) do
					local var_188_8 = next(var_188_6)
					local var_188_9 = var_188_6[var_188_8]

					var_188_6[var_188_8] = nil

					if var_188_4 >= math.abs(var_188_9.row - iter_188_1.row) and var_188_4 >= math.abs(var_188_9.column - iter_188_1.column) then
						var_188_7[var_188_8] = var_188_9

						for iter_188_2 = 1, #var_0_2 do
							local var_188_10 = var_188_9.row + var_0_2[iter_188_2][1]
							local var_188_11 = var_188_9.column + var_0_2[iter_188_2][2]
							local var_188_12 = var_188_5(var_188_10, var_188_11)

							if not var_188_7[var_188_12] then
								var_188_6[var_188_12] = {
									row = var_188_10,
									column = var_188_11
								}
							end
						end
					end
				end

				for iter_188_3, iter_188_4 in pairs(var_188_7) do
					var_188_1[iter_188_3] = iter_188_4
				end
			end
		end
	end

	for iter_188_5, iter_188_6 in pairs(var_188_1) do
		table.insert(var_188_0, iter_188_6)
	end

	return var_188_0
end

function var_0_0.GetDefeatCount(arg_190_0)
	return arg_190_0.defeatEnemies
end

function var_0_0.ExistDivingChampion(arg_191_0)
	return _.any(arg_191_0.champions, function(arg_192_0)
		return arg_192_0.flag == ChapterConst.CellFlagDiving
	end)
end

function var_0_0.IsSkipPrecombat(arg_193_0)
	return arg_193_0:isLoop() and getProxy(ChapterProxy):GetSkipPrecombat()
end

function var_0_0.CanActivateAutoFight(arg_194_0)
	local var_194_0 = pg.chapter_template_loop[arg_194_0.id]

	return var_194_0 and var_194_0.fightauto == 1 and arg_194_0:isLoop() and AutoBotCommand.autoBotSatisfied() and not arg_194_0:existOni() and not arg_194_0:existBombEnemy()
end

function var_0_0.IsAutoFight(arg_195_0)
	return arg_195_0:CanActivateAutoFight() and getProxy(ChapterProxy):GetChapterAutoFlag(arg_195_0.id) == 1
end

function var_0_0.getOperationBuffDescStg(arg_196_0)
	for iter_196_0, iter_196_1 in ipairs(arg_196_0.operationBuffList) do
		if pg.benefit_buff_template[iter_196_1].benefit_type == Chapter.OPERATION_BUFF_TYPE_DESC then
			return iter_196_1
		end
	end
end

function var_0_0.GetOperationDesc(arg_197_0)
	local var_197_0 = ""

	for iter_197_0, iter_197_1 in ipairs(arg_197_0.operationBuffList) do
		local var_197_1 = pg.benefit_buff_template[iter_197_1]

		if var_197_1.benefit_type == var_0_0.OPERATION_BUFF_TYPE_DESC then
			var_197_0 = var_197_1.desc

			break
		end
	end

	return var_197_0
end

function var_0_0.GetOperationBuffList(arg_198_0)
	return arg_198_0.operationBuffList
end

function var_0_0.GetAllEnemies(arg_199_0, arg_199_1)
	local var_199_0 = {}

	for iter_199_0, iter_199_1 in pairs(arg_199_0.cells) do
		if ChapterConst.IsEnemyAttach(iter_199_1.attachment) and (arg_199_1 or iter_199_1.flag ~= ChapterConst.CellFlagDisabled) then
			table.insert(var_199_0, iter_199_1)
		end
	end

	for iter_199_2, iter_199_3 in pairs(arg_199_0.champions) do
		if arg_199_1 or iter_199_3.flag ~= ChapterConst.CellFlagDisabled then
			table.insert(var_199_0, iter_199_3)
		end
	end

	return var_199_0
end

function var_0_0.GetFleetOfDuty(arg_200_0, arg_200_1)
	local var_200_0

	for iter_200_0, iter_200_1 in ipairs(arg_200_0.fleets) do
		if iter_200_1:isValid() and iter_200_1:getFleetType() == FleetType.Normal then
			local var_200_1 = arg_200_0.duties[iter_200_1.id] or 0

			if var_200_1 == ChapterFleet.DUTY_KILLALL or var_200_1 == ChapterFleet.DUTY_KILLBOSS and tobool(arg_200_1) or var_200_1 == ChapterFleet.DUTY_CLEANPATH and not tobool(arg_200_1) then
				return iter_200_1
			end

			var_200_0 = iter_200_1
		end
	end

	return var_200_0
end

function var_0_0.GetBuffOfLinkAct(arg_201_0)
	if arg_201_0:getPlayType() == ChapterConst.TypeDOALink then
		local var_201_0 = pg.gameset.doa_fever_buff.description

		return _.detect(arg_201_0.buff_list, function(arg_202_0)
			return table.contains(var_201_0, arg_202_0)
		end)
	end
end

function var_0_0.GetAttachmentStories(arg_203_0)
	local var_203_0 = arg_203_0.cellAttachments
	local var_203_1 = 0
	local var_203_2

	for iter_203_0, iter_203_1 in pairs(var_203_0) do
		local var_203_3 = var_0_0.GetEventTemplateByKey("mult_story", iter_203_1.attachmentId)

		if var_203_3 then
			assert(not var_203_2 or table.equal(var_203_2, var_203_3[1]), "Not the same Config of Mult_story ID: " .. iter_203_1.attachmentId)

			var_203_2 = var_203_2 or var_203_3[1]

			local var_203_4 = arg_203_0.cells[iter_203_0]

			if var_203_4 and var_203_4.flag == ChapterConst.CellFlagDisabled then
				var_203_1 = var_203_1 + 1
			end
		end
	end

	return var_203_2, var_203_1
end

function var_0_0.GetWeather(arg_204_0, arg_204_1, arg_204_2)
	arg_204_1 = arg_204_1 or arg_204_0.fleet.line.row
	arg_204_2 = arg_204_2 or arg_204_0.fleet.line.column

	local var_204_0 = ChapterCell.Line2Name(arg_204_1, arg_204_2)
	local var_204_1 = arg_204_0.cells[var_204_0]

	return var_204_1 and var_204_1:GetWeatherFlagList() or {}
end

function var_0_0.getDisplayEnemyCount(arg_205_0)
	local var_205_0 = 0

	local function var_205_1(arg_206_0)
		if arg_206_0.flag ~= ChapterConst.CellFlagDisabled then
			var_205_0 = var_205_0 + 1
		end
	end

	local var_205_2 = {
		[ChapterConst.AttachEnemy] = var_205_1,
		[ChapterConst.AttachElite] = var_205_1,
		[ChapterConst.AttachBox] = function(arg_207_0)
			if pg.box_data_template[arg_207_0.attachmentId].type == ChapterConst.BoxEnemy then
				var_205_1(arg_207_0)
			end
		end
	}

	for iter_205_0, iter_205_1 in pairs(arg_205_0.cells) do
		switch(iter_205_1.attachment, var_205_2, nil, iter_205_1)
	end

	for iter_205_2, iter_205_3 in ipairs(arg_205_0.champions) do
		var_205_1(iter_205_3)
	end

	return var_205_0
end

function var_0_0.getNearestEnemyCell(arg_208_0)
	local function var_208_0(arg_209_0, arg_209_1)
		return (arg_209_0.row - arg_209_1.row) * (arg_209_0.row - arg_209_1.row) + (arg_209_0.column - arg_209_1.column) * (arg_209_0.column - arg_209_1.column)
	end

	local var_208_1

	local function var_208_2(arg_210_0)
		if arg_210_0.flag ~= ChapterConst.CellFlagDisabled and (not var_208_1 or var_208_0(arg_208_0.fleet.line, arg_210_0) < var_208_0(arg_208_0.fleet.line, var_208_1)) then
			var_208_1 = arg_210_0
		end
	end

	local var_208_3 = {
		[ChapterConst.AttachEnemy] = var_208_2,
		[ChapterConst.AttachElite] = var_208_2,
		[ChapterConst.AttachBox] = function(arg_211_0)
			if pg.box_data_template[arg_211_0.attachmentId].type == ChapterConst.BoxEnemy then
				var_208_2(arg_211_0)
			end
		end
	}

	for iter_208_0, iter_208_1 in pairs(arg_208_0.cells) do
		switch(iter_208_1.attachment, var_208_3, nil, iter_208_1)
	end

	for iter_208_2, iter_208_3 in ipairs(arg_208_0.champions) do
		var_208_2(iter_208_3)
	end

	return var_208_1
end

function var_0_0.GetRegularFleetIds(arg_212_0)
	return (_.map(_.filter(arg_212_0.fleets, function(arg_213_0)
		local var_213_0 = arg_213_0:getFleetType()

		return var_213_0 == FleetType.Normal or var_213_0 == FleetType.Submarine
	end), function(arg_214_0)
		return arg_214_0.fleetId
	end))
end

function var_0_0.NeedSupportSubmarineStage(arg_215_0)
	return arg_215_0:IsSupportSubmarineStage() and not table.contains(arg_215_0:getExtraFlags(), ChapterConst.StatusSupportSubmarineFinish)
end

function var_0_0.UpdateCellsVisible(arg_216_0, arg_216_1, arg_216_2)
	if not arg_216_0:IsFogStage() then
		return
	end

	local var_216_0 = {}

	if arg_216_0.fleetVisibleStore[arg_216_1.id] then
		for iter_216_0, iter_216_1 in ipairs(arg_216_0.fleetVisibleStore[arg_216_1.id]) do
			var_216_0[iter_216_1] = defaultValue(var_216_0[iter_216_1], 0) - 1
		end
	end

	if arg_216_1.isRetreat then
		arg_216_0.fleetVisibleStore[arg_216_1.id] = {}
	else
		arg_216_0.fleetVisibleStore[arg_216_1.id] = underscore(arg_216_1:GetVisibleRange(arg_216_2)):chain():map(function(arg_217_0)
			return ChapterCell.Line2Name(arg_217_0.row, arg_217_0.column)
		end):filter(function(arg_218_0)
			return tobool(arg_216_0.cells[arg_218_0])
		end):value()
	end

	for iter_216_2, iter_216_3 in ipairs(arg_216_0.fleetVisibleStore[arg_216_1.id]) do
		var_216_0[iter_216_3] = defaultValue(var_216_0[iter_216_3], 0) + 1
	end

	local var_216_1 = {}

	for iter_216_4, iter_216_5 in pairs(var_216_0) do
		local var_216_2 = arg_216_0.cells[iter_216_4]:IsVisible()

		if iter_216_5 < 0 then
			arg_216_0.cells[iter_216_4]:UpdateVisible(arg_216_1.id, false)
		elseif iter_216_5 > 0 then
			arg_216_0.cells[iter_216_4]:UpdateVisible(arg_216_1.id, true)
		end

		if var_216_2 ~= arg_216_0.cells[iter_216_4]:IsVisible() then
			arg_216_0.cellsVisibleCount = arg_216_0.cellsVisibleCount + (var_216_2 and -1 or 1)

			table.insert(var_216_1, iter_216_4)
		end
	end

	return var_216_1
end

function var_0_0.GetFogStageStrategy(arg_219_0)
	local var_219_0 = arg_219_0.cellsVisibleCount * 100 / arg_219_0.cellsCount
	local var_219_1

	for iter_219_0, iter_219_1 in ipairs(arg_219_0:getConfigMiscArg("fog_visible_buff")) do
		local var_219_2, var_219_3 = unpack(iter_219_1)

		var_219_1 = var_219_3

		if var_219_0 <= var_219_2 then
			break
		end
	end

	return var_219_1
end

function var_0_0.retreatFleet(arg_220_0, arg_220_1)
	local var_220_0

	for iter_220_0, iter_220_1 in ipairs(arg_220_0.fleets) do
		if iter_220_1.id == arg_220_1 then
			var_220_0 = table.remove(arg_220_0.fleets, iter_220_0)

			break
		end
	end

	if var_220_0 and var_220_0:getFleetType() == FleetType.Normal then
		arg_220_0.findex = 1
	end

	var_220_0.isRetreat = true

	var_220_0:UpdateVisible()
end

return var_0_0

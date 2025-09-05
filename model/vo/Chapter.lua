local var_0_0 = class("Chapter", import(".BaseVO"))

var_0_0.SelectFleet = 1
var_0_0.CustomFleet = 2
var_0_0.CHAPTER_STATE = {
	i18n("level_chapter_state_high_risk"),
	i18n("level_chapter_state_risk"),
	i18n("level_chapter_state_low_risk"),
	i18n("level_chapter_state_safety")
}

function var_0_0.bindConfigTable(arg_1_0)
	return pg.chapter_template
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0.configId = arg_2_1.id
	arg_2_0.id = arg_2_0.configId
	arg_2_0.active = false
	arg_2_0.progress = defaultValue(arg_2_1.progress, 0)
	arg_2_0.defeatCount = arg_2_1.defeat_count or 0
	arg_2_0.passCount = arg_2_1.pass_count or 0
	arg_2_0.todayDefeatCount = arg_2_1.today_defeat_count or 0

	local var_2_0 = {
		defaultValue(arg_2_1.kill_boss_count, 0),
		defaultValue(arg_2_1.kill_enemy_count, 0),
		defaultValue(arg_2_1.take_box_count, 0)
	}

	arg_2_0.achieves = {}

	for iter_2_0 = 1, 3 do
		local var_2_1 = arg_2_0:getConfig("star_require_" .. iter_2_0)

		if var_2_1 > 0 then
			table.insert(arg_2_0.achieves, {
				type = var_2_1,
				config = arg_2_0:getConfig("num_" .. iter_2_0),
				count = var_2_0[iter_2_0]
			})
		end
	end

	arg_2_0.dropShipIdList = {}
	arg_2_0.eliteFleetList = {
		{},
		{},
		{}
	}
	arg_2_0.eliteCommanderList = {
		{},
		{},
		{}
	}
	arg_2_0.supportFleet = {}
	arg_2_0.loopFlag = 0
end

function var_0_0.BuildEliteFleetList(arg_3_0)
	local var_3_0 = {
		{},
		{},
		{}
	}
	local var_3_1 = {
		{},
		{},
		{}
	}
	local var_3_2 = {
		{}
	}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0 or {}) do
		local var_3_3 = {}

		for iter_3_2, iter_3_3 in ipairs(iter_3_1.main_id) do
			var_3_3[#var_3_3 + 1] = iter_3_3
		end

		if iter_3_0 == 4 then
			var_3_2[1] = var_3_3
		else
			var_3_0[iter_3_0] = var_3_3
		end

		local var_3_4 = {}

		for iter_3_4, iter_3_5 in ipairs(iter_3_1.commanders) do
			local var_3_5 = iter_3_5.id
			local var_3_6 = iter_3_5.pos

			if getProxy(CommanderProxy):getCommanderById(var_3_5) and Commander.canEquipToFleetList(var_3_1, iter_3_0, var_3_6, var_3_5) then
				var_3_4[var_3_6] = var_3_5
			end
		end

		var_3_1[iter_3_0] = var_3_4
	end

	return var_3_0, var_3_1, var_3_2
end

function var_0_0.getMaxCount(arg_4_0)
	local var_4_0 = arg_4_0:getConfig("risk_levels")

	if #var_4_0 == 0 then
		return 0
	end

	return var_4_0[1][1]
end

function var_0_0.hasMitigation(arg_5_0)
	if not LOCK_MITIGATION then
		return arg_5_0:getConfig("mitigation_level") > 0
	else
		return false
	end
end

function var_0_0.getRemainPassCount(arg_6_0)
	local var_6_0 = arg_6_0:getMaxCount()

	return math.max(var_6_0 - arg_6_0.passCount, 0)
end

function var_0_0.getRiskLevel(arg_7_0)
	local var_7_0 = arg_7_0:getRemainPassCount()
	local var_7_1 = arg_7_0:getConfig("risk_levels")

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		if var_7_0 <= iter_7_1[1] and var_7_0 >= iter_7_1[2] then
			return iter_7_0
		end
	end

	assert(false, "index can not be nil")
end

function var_0_0.getMitigationRate(arg_8_0)
	local var_8_0 = arg_8_0:getMaxCount()
	local var_8_1 = LOCK_MITIGATION and 0 or arg_8_0:getConfig("mitigation_rate")

	return math.min(arg_8_0.passCount, var_8_0) * var_8_1
end

function var_0_0.getRepressInfo(arg_9_0)
	return {
		repressMax = arg_9_0:getMaxCount(),
		repressCount = arg_9_0.passCount,
		repressReduce = arg_9_0:getMitigationRate(),
		repressLevel = LOCK_MITIGATION and 0 or arg_9_0:getRemainPassCount() > 0 and 0 or arg_9_0:getConfig("mitigation_level") or 0,
		repressEnemyHpRant = 1 - arg_9_0:getStageCell(arg_9_0.fleet.line.row, arg_9_0.fleet.line.column).data / 10000
	}
end

function var_0_0.getChapterState(arg_10_0)
	local var_10_0 = arg_10_0:getRiskLevel()

	assert(var_0_0.CHAPTER_STATE[var_10_0], "state desc is nil")

	return var_0_0.CHAPTER_STATE[var_10_0]
end

function var_0_0.getPlayType(arg_11_0)
	return arg_11_0:getConfig("model")
end

function var_0_0.isTypeDefence(arg_12_0)
	return arg_12_0:getPlayType() == ChapterConst.TypeDefence
end

function var_0_0.IsSpChapter(arg_13_0)
	return arg_13_0:isTriesLimit()
end

function var_0_0.IsEXChapter(arg_14_0)
	return arg_14_0:getPlayType() == ChapterConst.TypeExtra
end

function var_0_0.getConfig(arg_15_0, arg_15_1)
	if arg_15_0:isLoop() then
		local var_15_0 = pg.chapter_template_loop[arg_15_0.id]

		assert(var_15_0, "chapter_template_loop not exist: " .. arg_15_0.id)

		if var_15_0[arg_15_1] ~= nil and var_15_0[arg_15_1] ~= "&&" then
			return var_15_0[arg_15_1]
		end

		if (arg_15_1 == "air_dominance" or arg_15_1 == "best_air_dominance") and var_15_0.air_dominance_loop_rate ~= nil then
			local var_15_1 = arg_15_0:getConfigTable()
			local var_15_2 = var_15_0.air_dominance_loop_rate * 0.01

			return math.floor(var_15_1[arg_15_1] * var_15_2)
		end
	end

	return var_0_0.super.getConfig(arg_15_0, arg_15_1)
end

function var_0_0.existLoop(arg_16_0)
	return pg.chapter_template_loop[arg_16_0.id] ~= nil
end

function var_0_0.canActivateLoop(arg_17_0)
	return arg_17_0.progress == 100
end

function var_0_0.isLoop(arg_18_0)
	return arg_18_0.loopFlag == 1
end

function var_0_0.existAmbush(arg_19_0)
	return arg_19_0:getConfig("is_ambush") == 1 or arg_19_0:getConfig("is_air_attack") == 1
end

function var_0_0.isUnlock(arg_20_0)
	return arg_20_0:IsCleanPrevChapter() and arg_20_0:IsCleanPrevStory()
end

function var_0_0.IsCleanPrevChapter(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0:getConfig("pre_chapter")) do
		if _.all(iter_21_1, function(arg_22_0)
			if arg_22_0 == 0 then
				return true
			end

			return getProxy(ChapterProxy):GetChapterItemById(arg_22_0):isClear()
		end) then
			return true
		end
	end

	return false
end

function var_0_0.IsCleanPrevStory(arg_23_0)
	local var_23_0 = arg_23_0:getConfig("pre_story")

	if var_23_0 == 0 then
		return true
	end

	return getProxy(ChapterProxy):GetChapterItemById(var_23_0):isClear()
end

function var_0_0.isPlayerLVUnlock(arg_24_0)
	return getProxy(PlayerProxy):getRawData().level >= arg_24_0:getConfig("unlocklevel")
end

function var_0_0.isClear(arg_25_0)
	return arg_25_0.progress >= 100
end

function var_0_0.ifNeedHide(arg_26_0)
	if table.contains(pg.chapter_setting.all, arg_26_0.id) and pg.chapter_setting[arg_26_0.id].hide == 1 then
		return arg_26_0:isClear()
	end
end

function var_0_0.existAchieve(arg_27_0)
	return #arg_27_0.achieves > 0
end

function var_0_0.isAllAchieve(arg_28_0)
	return _.all(arg_28_0.achieves, function(arg_29_0)
		return ChapterConst.IsAchieved(arg_29_0)
	end)
end

function var_0_0.clearEliterFleetByIndex(arg_30_0, arg_30_1)
	if arg_30_1 > #arg_30_0.eliteFleetList then
		return
	end

	arg_30_0.eliteFleetList[arg_30_1] = {}
end

function var_0_0.wrapEliteFleet(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = arg_31_1 > 2 and FleetType.Submarine or FleetType.Normal
	local var_31_2 = _.flatten(arg_31_0:getEliteFleetList()[arg_31_1])

	for iter_31_0, iter_31_1 in pairs(arg_31_0:getEliteFleetCommanders()[arg_31_1]) do
		table.insert(var_31_0, {
			pos = iter_31_0,
			id = iter_31_1
		})
	end

	return TypedFleet.New({
		id = arg_31_1,
		fleetType = var_31_1,
		ship_list = var_31_2,
		commanders = var_31_0
	})
end

function var_0_0.setEliteCommanders(arg_32_0, arg_32_1)
	arg_32_0.eliteCommanderList = arg_32_1
end

function var_0_0.getEliteFleetCommanders(arg_33_0)
	return arg_33_0.eliteCommanderList
end

function var_0_0.updateCommander(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	arg_34_0.eliteCommanderList[arg_34_1][arg_34_2] = arg_34_3
end

function var_0_0.getEliteFleetList(arg_35_0)
	arg_35_0:EliteShipTypeFilter()

	return arg_35_0.eliteFleetList
end

function var_0_0.setEliteFleetList(arg_36_0, arg_36_1)
	arg_36_0.eliteFleetList = arg_36_1
end

function var_0_0.IsEliteFleetLegal(arg_37_0)
	local var_37_0 = 0
	local var_37_1 = 0
	local var_37_2 = 0
	local var_37_3 = 0
	local var_37_4
	local var_37_5

	for iter_37_0 = 1, #arg_37_0.eliteFleetList do
		local var_37_6, var_37_7 = arg_37_0:singleEliteFleetVertify(iter_37_0)

		if not var_37_6 then
			if not var_37_7 then
				if iter_37_0 >= 3 then
					var_37_2 = var_37_2 + 1
				else
					var_37_0 = var_37_0 + 1
				end
			else
				var_37_4 = var_37_7
				var_37_5 = iter_37_0
			end
		elseif iter_37_0 >= 3 then
			var_37_3 = var_37_3 + 1
		else
			var_37_1 = var_37_1 + 1
		end
	end

	if var_37_0 == 2 then
		return false, i18n("elite_disable_no_fleet")
	elseif var_37_1 == 0 then
		return false, var_37_4
	elseif var_37_2 + var_37_3 < arg_37_0:getConfig("submarine_num") then
		return false, var_37_4
	end

	local var_37_8 = arg_37_0:IsPropertyLimitationSatisfy()
	local var_37_9 = 1

	for iter_37_1, iter_37_2 in ipairs(var_37_8) do
		var_37_9 = var_37_9 * iter_37_2
	end

	if var_37_9 ~= 1 then
		return false, i18n("elite_disable_property_unsatisfied")
	end

	return true, var_37_5
end

function var_0_0.IsPropertyLimitationSatisfy(arg_38_0)
	local var_38_0 = getProxy(BayProxy):getRawData()
	local var_38_1 = arg_38_0:getConfig("property_limitation")
	local var_38_2 = {}

	for iter_38_0, iter_38_1 in ipairs(var_38_1) do
		var_38_2[iter_38_1[1]] = 0
	end

	local var_38_3 = arg_38_0:getEliteFleetList()
	local var_38_4 = 0

	for iter_38_2 = 1, 2 do
		if not arg_38_0:singleEliteFleetVertify(iter_38_2) then
			-- block empty
		else
			local var_38_5 = {}
			local var_38_6 = {}

			for iter_38_3, iter_38_4 in ipairs(var_38_1) do
				local var_38_7, var_38_8, var_38_9, var_38_10 = unpack(iter_38_4)

				if string.sub(var_38_7, 1, 5) == "fleet" then
					var_38_5[var_38_7] = 0
					var_38_6[var_38_7] = var_38_10
				end
			end

			local var_38_11 = var_38_3[iter_38_2]

			for iter_38_5, iter_38_6 in ipairs(var_38_11) do
				local var_38_12 = var_38_0[iter_38_6]

				var_38_4 = var_38_4 + 1

				local var_38_13 = intProperties(var_38_12:getProperties())

				for iter_38_7, iter_38_8 in pairs(var_38_2) do
					if string.sub(iter_38_7, 1, 5) == "fleet" then
						if iter_38_7 == "fleet_totle_level" then
							var_38_5[iter_38_7] = var_38_5[iter_38_7] + var_38_12.level
						end
					elseif iter_38_7 == "level" then
						var_38_2[iter_38_7] = iter_38_8 + var_38_12.level
					else
						var_38_2[iter_38_7] = iter_38_8 + var_38_13[iter_38_7]
					end
				end
			end

			for iter_38_9, iter_38_10 in pairs(var_38_5) do
				if iter_38_9 == "fleet_totle_level" and iter_38_10 > var_38_6[iter_38_9] then
					var_38_2[iter_38_9] = var_38_2[iter_38_9] + 1
				end
			end
		end
	end

	local var_38_14 = {}

	for iter_38_11, iter_38_12 in ipairs(var_38_1) do
		local var_38_15, var_38_16, var_38_17 = unpack(iter_38_12)

		if var_38_15 == "level" and var_38_4 > 0 then
			var_38_2[var_38_15] = math.ceil(var_38_2[var_38_15] / var_38_4)
		end

		var_38_14[iter_38_11] = AttributeType.EliteConditionCompare(var_38_16, var_38_2[var_38_15], var_38_17) and 1 or 0
	end

	return var_38_14, var_38_2
end

function var_0_0.GetNomralFleetMaxCount(arg_39_0)
	return arg_39_0:getConfig("group_num")
end

function var_0_0.GetSubmarineFleetMaxCount(arg_40_0)
	return arg_40_0:getConfig("submarine_num")
end

function var_0_0.GetSupportFleetMaxCount(arg_41_0)
	return arg_41_0:getConfig("support_group_num")
end

function var_0_0.EliteShipTypeFilter(arg_42_0)
	if arg_42_0:getConfig("type") == Chapter.SelectFleet then
		local var_42_0 = {
			1,
			2,
			3
		}

		for iter_42_0, iter_42_1 in ipairs(var_42_0) do
			table.clear(arg_42_0.eliteFleetList[iter_42_1])
			table.clear(arg_42_0.eliteCommanderList[iter_42_1])
		end
	else
		for iter_42_2 = arg_42_0:GetNomralFleetMaxCount() + 1, 2 do
			table.clear(arg_42_0.eliteFleetList[iter_42_2])
			table.clear(arg_42_0.eliteCommanderList[iter_42_2])
		end

		for iter_42_3 = arg_42_0:GetSubmarineFleetMaxCount() + 2 + 1, 3 do
			table.clear(arg_42_0.eliteFleetList[iter_42_3])
			table.clear(arg_42_0.eliteCommanderList[iter_42_3])
		end
	end

	local var_42_1 = getProxy(BayProxy):getRawData()

	for iter_42_4, iter_42_5 in ipairs(arg_42_0.eliteFleetList) do
		for iter_42_6 = #iter_42_5, 1, -1 do
			if var_42_1[iter_42_5[iter_42_6]] == nil then
				table.remove(iter_42_5, iter_42_6)
			end
		end
	end

	local function var_42_2(arg_43_0, arg_43_1, arg_43_2)
		arg_43_1 = Clone(arg_43_1)

		ChapterProxy.SortRecommendLimitation(arg_43_1)

		for iter_43_0, iter_43_1 in ipairs(arg_43_2) do
			local var_43_0
			local var_43_1 = var_42_1[iter_43_1]:getShipType()

			for iter_43_2, iter_43_3 in ipairs(arg_43_1) do
				if ShipType.ContainInLimitBundle(iter_43_3, var_43_1) then
					var_43_0 = iter_43_2

					break
				end
			end

			if var_43_0 then
				table.remove(arg_43_1, var_43_0)
			else
				table.removebyvalue(arg_43_0, iter_43_1)
			end
		end
	end

	for iter_42_7, iter_42_8 in ipairs(arg_42_0:getConfig("limitation")) do
		local var_42_3 = arg_42_0.eliteFleetList[iter_42_7]
		local var_42_4 = {}
		local var_42_5 = {}
		local var_42_6 = {}

		for iter_42_9, iter_42_10 in ipairs(var_42_3) do
			local var_42_7 = var_42_1[iter_42_10]:getTeamType()

			if var_42_7 == TeamType.Main then
				table.insert(var_42_4, iter_42_10)
			elseif var_42_7 == TeamType.Vanguard then
				table.insert(var_42_5, iter_42_10)
			elseif var_42_7 == TeamType.Submarine then
				table.insert(var_42_6, iter_42_10)
			end
		end

		var_42_2(var_42_3, iter_42_8[1], var_42_4)
		var_42_2(var_42_3, iter_42_8[2], var_42_5)
		var_42_2(var_42_3, {
			0,
			0,
			0
		}, var_42_6)
	end
end

function var_0_0.singleEliteFleetVertify(arg_44_0, arg_44_1)
	local var_44_0 = getProxy(BayProxy):getRawData()
	local var_44_1 = arg_44_0:getEliteFleetList()[arg_44_1]

	if not var_44_1 or #var_44_1 == 0 then
		return false
	end

	if arg_44_1 >= 3 then
		return true
	end

	if arg_44_0:getConfig("type") ~= Chapter.CustomFleet then
		return true
	end

	local var_44_2 = 0
	local var_44_3 = 0
	local var_44_4 = {}

	for iter_44_0, iter_44_1 in ipairs(var_44_1) do
		local var_44_5 = var_44_0[iter_44_1]

		if var_44_5 then
			if var_44_5:getFlag("inEvent") then
				return false, i18n("elite_disable_ship_escort")
			end

			local var_44_6 = var_44_5:getTeamType()

			if var_44_6 == TeamType.Main then
				var_44_2 = var_44_2 + 1
			elseif var_44_6 == TeamType.Vanguard then
				var_44_3 = var_44_3 + 1
			end

			var_44_4[#var_44_4 + 1] = var_44_5:getShipType()
		end
	end

	if var_44_2 * var_44_3 == 0 and var_44_2 + var_44_3 ~= 0 then
		return false
	end

	local var_44_7 = checkExist(arg_44_0:getConfig("limitation"), {
		arg_44_1
	})
	local var_44_8 = 1

	for iter_44_2, iter_44_3 in ipairs(var_44_7 or {}) do
		local var_44_9 = 0
		local var_44_10 = 0

		for iter_44_4, iter_44_5 in ipairs(iter_44_3) do
			if iter_44_5 ~= 0 then
				var_44_9 = var_44_9 + 1

				if underscore.any(var_44_4, function(arg_45_0)
					return ShipType.ContainInLimitBundle(iter_44_5, arg_45_0)
				end) then
					var_44_10 = 1

					break
				end
			end
		end

		if var_44_9 == 0 then
			var_44_10 = 1
		end

		var_44_8 = var_44_8 * var_44_10
	end

	if var_44_8 == 0 then
		return false, i18n("elite_disable_formation_unsatisfied")
	end

	return true
end

function var_0_0.ClearSupportFleetList(arg_46_0, arg_46_1)
	arg_46_0.supportFleet = {}
end

function var_0_0.setSupportFleetList(arg_47_0, arg_47_1)
	arg_47_0.supportFleet = arg_47_1[1]
end

function var_0_0.getSupportFleet(arg_48_0)
	arg_48_0:SupportShipTypeFilter()

	return arg_48_0.supportFleet
end

function var_0_0.SupportShipTypeFilter(arg_49_0)
	if arg_49_0:GetSupportFleetMaxCount() < 1 then
		table.clear(arg_49_0.supportFleet)
	end

	local var_49_0 = getProxy(BayProxy):getRawData()
	local var_49_1 = arg_49_0.supportFleet

	for iter_49_0 = #var_49_1, 1, -1 do
		if var_49_0[var_49_1[iter_49_0]] == nil then
			table.remove(var_49_1, iter_49_0)
		end
	end
end

function var_0_0.activeAlways(arg_50_0)
	if getProxy(ChapterProxy):getMapById(arg_50_0:getConfig("map")):isActivity() then
		local var_50_0 = arg_50_0:GetBindActID()

		warning(var_50_0)

		local var_50_1 = pg.activity_template[var_50_0]

		if type(var_50_1.config_client) == "table" then
			local var_50_2 = var_50_1.config_client.prevs or {}

			return table.contains(var_50_2, arg_50_0.id)
		end
	end

	return false
end

function var_0_0.GetPrevChapterNames(arg_51_0)
	local var_51_0 = {}

	for iter_51_0, iter_51_1 in ipairs(arg_51_0:getConfig("pre_chapter")) do
		local var_51_1 = iter_51_1[1]

		if var_51_1 ~= 0 then
			local var_51_2 = arg_51_0:bindConfigTable()[var_51_1].chapter_name

			table.insert(var_51_0, var_51_2)
		end
	end

	return var_51_0
end

function var_0_0.CanQuickPlay(arg_52_0)
	local var_52_0 = pg.chapter_setting[arg_52_0.id]

	return var_52_0 and var_52_0.expedite > 0
end

function var_0_0.GetQuickPlayFlag(arg_53_0)
	return PlayerPrefs.GetInt("chapter_quickPlay_flag_" .. arg_53_0.id, 0) == 1
end

function var_0_0.writeDrops(arg_54_0, arg_54_1)
	_.each(arg_54_1, function(arg_55_0)
		if arg_55_0.type == DROP_TYPE_SHIP and not table.contains(arg_54_0.dropShipIdList, arg_55_0.id) then
			table.insert(arg_54_0.dropShipIdList, arg_55_0.id)
		end
	end)
end

function var_0_0.UpdateDropShipList(arg_56_0, arg_56_1)
	for iter_56_0, iter_56_1 in ipairs(arg_56_1) do
		if not table.contains(arg_56_0.dropShipIdList, iter_56_1) then
			table.insert(arg_56_0.dropShipIdList, iter_56_1)
		end
	end
end

function var_0_0.GetDropShipList(arg_57_0)
	return arg_57_0.dropShipIdList
end

function var_0_0.getOniChapterInfo(arg_58_0)
	return pg.chapter_capture[arg_58_0.id]
end

function var_0_0.getBombChapterInfo(arg_59_0)
	return pg.chapter_boom[arg_59_0.id]
end

function var_0_0.getNpcShipByType(arg_60_0, arg_60_1)
	local var_60_0 = {}
	local var_60_1 = getProxy(TaskProxy)

	local function var_60_2(arg_61_0)
		if arg_61_0 == 0 then
			return true
		end

		local var_61_0 = var_60_1:getTaskVO(arg_61_0)

		return var_61_0 and not var_61_0:isFinish()
	end

	for iter_60_0, iter_60_1 in ipairs(arg_60_0:getConfig("npc_data")) do
		local var_60_3 = pg.npc_squad_template[iter_60_1]

		if not arg_60_1 or arg_60_1 == var_60_3.type and var_60_2(var_60_3.task_id) then
			for iter_60_2, iter_60_3 in ipairs({
				"vanguard_list",
				"main_list"
			}) do
				for iter_60_4, iter_60_5 in ipairs(var_60_3[iter_60_3]) do
					table.insert(var_60_0, NpcShip.New({
						id = iter_60_5[1],
						configId = iter_60_5[1],
						level = iter_60_5[2]
					}))
				end
			end
		end
	end

	return var_60_0
end

function var_0_0.getTodayDefeatCount(arg_62_0)
	return getProxy(DailyLevelProxy):getChapterDefeatCount(arg_62_0.configId)
end

function var_0_0.isTriesLimit(arg_63_0)
	local var_63_0 = arg_63_0:getConfig("count")

	return var_63_0 and var_63_0 > 0
end

function var_0_0.updateTodayDefeatCount(arg_64_0)
	getProxy(DailyLevelProxy):updateChapterDefeatCount(arg_64_0.configId)
end

function var_0_0.enoughTimes2Start(arg_65_0)
	if arg_65_0:isTriesLimit() then
		return arg_65_0:getTodayDefeatCount() < arg_65_0:getConfig("count")
	else
		return true
	end
end

function var_0_0.GetRestDailyBonus(arg_66_0)
	local var_66_0 = 0

	if arg_66_0:IsRemaster() then
		return var_66_0
	end

	local var_66_1 = arg_66_0:getConfig("boss_expedition_id")

	for iter_66_0, iter_66_1 in ipairs(var_66_1) do
		local var_66_2 = pg.expedition_activity_template[iter_66_1]

		var_66_0 = math.max(var_66_0, var_66_2 and var_66_2.bonus_time or 0)
	end

	local var_66_3 = pg.chapter_defense[arg_66_0.id]

	if var_66_3 then
		var_66_0 = math.max(var_66_0, var_66_3.bonus_time or 0)
	end

	return (math.max(var_66_0 - arg_66_0.todayDefeatCount, 0))
end

function var_0_0.GetDailyBonusQuota(arg_67_0)
	return arg_67_0:GetRestDailyBonus() > 0
end

var_0_0.OPERATION_BUFF_TYPE_COST = "more_oil"
var_0_0.OPERATION_BUFF_TYPE_REWARD = "extra_drop"
var_0_0.OPERATION_BUFF_TYPE_EXP = "chapter_up"
var_0_0.OPERATION_BUFF_TYPE_DESC = "desc"

function var_0_0.GetSPOperationItemCacheKey(arg_68_0)
	return "specialOPItem_" .. arg_68_0
end

function var_0_0.GetSpItems(arg_69_0)
	local var_69_0 = {}
	local var_69_1 = getProxy(BagProxy):getItemsByType(Item.SPECIAL_OPERATION_TICKET)
	local var_69_2 = arg_69_0:getConfig("special_operation_list")

	if var_69_2 and #var_69_2 == 0 then
		return var_69_0
	end

	for iter_69_0, iter_69_1 in ipairs(pg.benefit_buff_template.all) do
		local var_69_3 = pg.benefit_buff_template[iter_69_1]

		if var_69_3.benefit_type == Chapter.OPERATION_BUFF_TYPE_DESC and table.contains(var_69_2, var_69_3.id) then
			local var_69_4 = tonumber(var_69_3.benefit_condition)

			for iter_69_2, iter_69_3 in ipairs(var_69_1) do
				if var_69_4 == iter_69_3.configId then
					table.insert(var_69_0, iter_69_3)

					break
				end
			end
		end
	end

	return var_69_0
end

function var_0_0.GetSPBuffByItem(arg_70_0)
	for iter_70_0, iter_70_1 in ipairs(pg.benefit_buff_template.all) do
		local var_70_0 = pg.benefit_buff_template[iter_70_1]

		if var_70_0.benefit_type == Chapter.OPERATION_BUFF_TYPE_DESC and tonumber(var_70_0.benefit_condition) == arg_70_0 then
			return var_70_0.id
		end
	end
end

function var_0_0.GetActiveSPItemID(arg_71_0)
	local var_71_0 = Chapter.GetSPOperationItemCacheKey(arg_71_0.id)
	local var_71_1 = PlayerPrefs.GetInt(var_71_0, 0)

	if var_71_1 == 0 then
		return 0
	end

	if arg_71_0:GetRestDailyBonus() > 0 then
		return 0
	end

	local var_71_2 = arg_71_0:GetSpItems()

	if _.detect(var_71_2, function(arg_72_0)
		return arg_72_0:GetConfigID() == var_71_1
	end) then
		return var_71_1
	end

	return 0
end

function var_0_0.GetLimitOilCost(arg_73_0, arg_73_1, arg_73_2)
	if not arg_73_0:isLoop() then
		return 9999
	end

	local var_73_0
	local var_73_1

	if arg_73_1 then
		var_73_1 = 3
	else
		local var_73_2 = pg.expedition_data_template[arg_73_2]

		var_73_1 = (var_73_2.type == ChapterConst.ExpeditionTypeBoss or var_73_2.type == ChapterConst.ExpeditionTypeMulBoss) and 2 or 1
	end

	return arg_73_0:getConfig("use_oil_limit")[var_73_1] or 9999
end

function var_0_0.IsRemaster(arg_74_0)
	local var_74_0 = getProxy(ChapterProxy):getMapById(arg_74_0:getConfig("map"))

	return var_74_0 and var_74_0:isRemaster()
end

function var_0_0.GetBindActID(arg_75_0)
	return arg_75_0:getConfig("act_id")
end

function var_0_0.GetMaxBattleCount(arg_76_0)
	local var_76_0 = 0
	local var_76_1 = getProxy(ChapterProxy):getMapById(arg_76_0:getConfig("map"))

	if var_76_1:getMapType() == Map.ELITE then
		var_76_0 = pg.gameset.hard_level_multiple_sorties_times.key_value
		var_76_0 = math.clamp(var_76_0, 0, getProxy(DailyLevelProxy):GetRestEliteCount())
	elseif var_76_1:isRemaster() then
		var_76_0 = pg.gameset.archives_level_multiple_sorties_times.key_value
		var_76_0 = math.clamp(var_76_0, 0, getProxy(ChapterProxy).remasterTickets)
	elseif var_76_1:isActivity() then
		var_76_0 = pg.gameset.activity_level_multiple_sorties_times.key_value
	else
		var_76_0 = pg.gameset.main_level_multiple_sorties_times.key_value
	end

	if arg_76_0:isTriesLimit() then
		local var_76_2 = arg_76_0:getConfig("count") - arg_76_0:getTodayDefeatCount()

		var_76_0 = math.clamp(var_76_0, 0, var_76_2)
	end

	return var_76_0
end

return var_0_0

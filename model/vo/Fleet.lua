local var_0_0 = class("Fleet", import(".BaseVO"))

var_0_0.C_TEAM_NAME = {
	vanguard = i18n("word_vanguard_fleet"),
	main = i18n("word_main_fleet"),
	submarine = i18n("word_sub_fleet")
}
var_0_0.DEFAULT_NAME = {
	i18n("ship_formationUI_fleetName1"),
	i18n("ship_formationUI_fleetName2"),
	i18n("ship_formationUI_fleetName3"),
	i18n("ship_formationUI_fleetName4"),
	i18n("ship_formationUI_fleetName5"),
	i18n("ship_formationUI_fleetName6"),
	[11] = i18n("ship_formationUI_fleetName11"),
	[12] = i18n("ship_formationUI_fleetName12"),
	[101] = i18n("ship_formationUI_exercise_fleetName"),
	[102] = i18n("ship_formationUI_fleetName_challenge"),
	[103] = i18n("ship_formationUI_fleetName_challenge_sub")
}
var_0_0.DEFAULT_NAME_FOR_DOCKYARD = {
	i18n("ship_formationUI_fleetName1"),
	i18n("ship_formationUI_fleetName2"),
	i18n("ship_formationUI_fleetName3"),
	i18n("ship_formationUI_fleetName4"),
	i18n("ship_formationUI_fleetName5"),
	i18n("ship_formationUI_fleetName6"),
	[11] = i18n("ship_formationUI_fleetName1"),
	[12] = i18n("ship_formationUI_fleetName2"),
	[101] = i18n("ship_formationUI_exercise_fleetName"),
	[102] = i18n("ship_formationUI_fleetName_challenge"),
	[103] = i18n("ship_formationUI_fleetName_challenge_sub")
}
var_0_0.DEFAULT_NAME_BOSS_ACT = {
	i18n("ship_formationUI_fleetName_easy"),
	i18n("ship_formationUI_fleetName_normal"),
	i18n("ship_formationUI_fleetName_hard"),
	i18n("ship_formationUI_fleetName_extra"),
	i18n("ship_formationUI_fleetName_sp"),
	[11] = i18n("ship_formationUI_fleetName_easy_ss"),
	[12] = i18n("ship_formationUI_fleetName_normal_ss"),
	[13] = i18n("ship_formationUI_fleetName_hard_ss"),
	[14] = i18n("ship_formationUI_fleetName_extra_ss"),
	[15] = i18n("ship_formationUI_fleetName_sp_ss")
}
var_0_0.DEFAULT_NAME_BOSS_SINGLE_ACT = {
	i18n("ship_formationUI_fleetName_easy"),
	i18n("ship_formationUI_fleetName_normal"),
	i18n("ship_formationUI_fleetName_hard"),
	i18n("ship_formationUI_fleetName_sp"),
	i18n("ship_formationUI_fleetName_extra"),
	[11] = i18n("ship_formationUI_fleetName_easy_ss"),
	[12] = i18n("ship_formationUI_fleetName_normal_ss"),
	[13] = i18n("ship_formationUI_fleetName_hard_ss"),
	[14] = i18n("ship_formationUI_fleetName_sp_ss"),
	[15] = i18n("ship_formationUI_fleetName_extra_ss")
}
var_0_0.DEFAULT_NAME_BOSS_SINGLE_VARIABLE_ACT = {
	i18n("ship_formationUI_fleetName_1"),
	i18n("ship_formationUI_fleetName_2"),
	i18n("ship_formationUI_fleetName_3"),
	i18n("ship_formationUI_fleetName_4"),
	i18n("ship_formationUI_fleetName_5"),
	i18n("ship_formationUI_fleetName_6"),
	i18n("ship_formationUI_fleetName_7"),
	i18n("ship_formationUI_fleetName_8"),
	i18n("ship_formationUI_fleetName_9"),
	i18n("ship_formationUI_fleetName_10"),
	i18n("ship_formationUI_fleetName_11"),
	i18n("ship_formationUI_fleetName_12"),
	(i18n("ship_formationUI_fleetName_13"))
}
var_0_0.DEFAULT_ELITE_NAME = {
	i18n("ship_formationUI_fleetName1"),
	i18n("ship_formationUI_fleetName2"),
	i18n("ship_formationUI_fleetName11"),
	(i18n("ship_formationUI_fleetName13"))
}
var_0_0.REGULAR_FLEET_ID = 1
var_0_0.REGULAR_FLEET_NUMS = 6
var_0_0.SUBMARINE_FLEET_ID = 11
var_0_0.SUBMARINE_FLEET_NUMS = 4
var_0_0.MEGA_SUBMARINE_FLEET_OFFSET = 100

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.name = arg_1_1.name or ""
	arg_1_0.defaultName = var_0_0.DEFAULT_NAME[arg_1_0.id]

	arg_1_0:updateShips(arg_1_1.ship_list)

	arg_1_0.commanderIds = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.commanders or {}) do
		arg_1_0.commanderIds[iter_1_1.pos] = iter_1_1.id
	end

	arg_1_0.skills = {}

	arg_1_0:updateCommanderSkills()
end

function var_0_0.SeparateOut(arg_2_0)
	return {
		id = arg_2_0.id,
		name = arg_2_0.name,
		ship_list = underscore.to_array(arg_2_0.ships),
		commanders = underscore(arg_2_0.commanderIds):chain():keys():map(function(arg_3_0)
			return {
				pos = arg_3_0,
				id = arg_2_0.commanderIds[arg_3_0]
			}
		end):value()
	}
end

function var_0_0.isUnlock(arg_4_0)
	local var_4_0 = {
		nil,
		nil,
		404,
		504,
		604,
		704
	}
	local var_4_1 = getProxy(ChapterProxy)
	local var_4_2 = var_4_0[arg_4_0.id]

	if var_4_2 then
		local var_4_3 = var_4_1:getChapterById(var_4_2)

		return var_4_3 and var_4_3:isClear(), i18n("formation_chapter_lock", string.sub(tostring(var_4_2), 1, 1), arg_4_0.id)
	end

	return true
end

function var_0_0.containShip(arg_5_0, arg_5_1)
	return table.contains(arg_5_0.ships, arg_5_1.id)
end

function var_0_0.isFirstFleet(arg_6_0)
	return arg_6_0.id == var_0_0.REGULAR_FLEET_ID
end

function var_0_0.outputCommanders(arg_7_0)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(arg_7_0.commanderIds) do
		assert(iter_7_1, "id is nil")
		table.insert(var_7_0, {
			pos = iter_7_0,
			id = iter_7_1
		})
	end

	return var_7_0
end

function var_0_0.getCommanders(arg_8_0)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0.commanderIds) do
		var_8_0[iter_8_0] = getProxy(CommanderProxy):getCommanderById(iter_8_1)
	end

	return var_8_0
end

function var_0_0.getCommanderByPos(arg_9_0, arg_9_1)
	return arg_9_0:getCommanders()[arg_9_1]
end

function var_0_0.updateCommanderByPos(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_2 then
		arg_10_0.commanderIds[arg_10_1] = arg_10_2.id
	else
		arg_10_0.commanderIds[arg_10_1] = nil
	end

	arg_10_0:updateCommanderSkills()
end

function var_0_0.getCommandersAddition(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(CommanderConst.PROPERTIES) do
		local var_11_1 = 0

		for iter_11_2, iter_11_3 in pairs(arg_11_0:getCommanders()) do
			var_11_1 = var_11_1 + iter_11_3:getAbilitysAddition()[iter_11_1]
		end

		if var_11_1 > 0 then
			table.insert(var_11_0, {
				attrName = iter_11_1,
				value = var_11_1
			})
		end
	end

	return var_11_0
end

function var_0_0.getCommandersTalentDesc(arg_12_0)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0:getCommanders()) do
		local var_12_1 = iter_12_1:getTalentsDesc()

		for iter_12_2, iter_12_3 in pairs(var_12_1) do
			if var_12_0[iter_12_2] then
				var_12_0[iter_12_2].value = var_12_0[iter_12_2].value + iter_12_3.value
			else
				var_12_0[iter_12_2] = {
					name = iter_12_2,
					value = iter_12_3.value,
					type = iter_12_3.type
				}
			end
		end
	end

	return var_12_0
end

function var_0_0.findCommanderBySkillId(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0:getCommanders()

	for iter_13_0, iter_13_1 in pairs(var_13_0) do
		if _.any(iter_13_1:getSkills(), function(arg_14_0)
			return _.any(arg_14_0:getTacticSkill(), function(arg_15_0)
				return arg_15_0 == arg_13_1
			end)
		end) then
			return iter_13_1
		end
	end
end

function var_0_0.updateCommanderSkills(arg_16_0)
	local var_16_0 = #arg_16_0.skills

	while var_16_0 > 0 do
		local var_16_1 = arg_16_0.skills[var_16_0]

		if not arg_16_0:findCommanderBySkillId(var_16_1.id) and var_16_1:GetSystem() == FleetSkill.SystemCommanderNeko then
			table.remove(arg_16_0.skills, var_16_0)
		end

		var_16_0 = var_16_0 - 1
	end

	local var_16_2 = arg_16_0:getCommanders()

	for iter_16_0, iter_16_1 in pairs(var_16_2) do
		for iter_16_2, iter_16_3 in ipairs(iter_16_1:getSkills()) do
			for iter_16_4, iter_16_5 in ipairs(iter_16_3:getTacticSkill()) do
				table.insert(arg_16_0.skills, FleetSkill.New(FleetSkill.SystemCommanderNeko, iter_16_5))
			end
		end
	end
end

function var_0_0.buildBattleBuffList(arg_17_0)
	local var_17_0 = {}
	local var_17_1, var_17_2 = FleetSkill.triggerSkill(arg_17_0, FleetSkill.TypeBattleBuff)

	if var_17_1 and #var_17_1 > 0 then
		local var_17_3 = {}

		for iter_17_0, iter_17_1 in ipairs(var_17_1) do
			local var_17_4 = var_17_2[iter_17_0]
			local var_17_5 = arg_17_0:findCommanderBySkillId(var_17_4.id)

			var_17_3[var_17_5] = var_17_3[var_17_5] or {}

			table.insert(var_17_3[var_17_5], iter_17_1)
		end

		for iter_17_2, iter_17_3 in pairs(var_17_3) do
			table.insert(var_17_0, {
				iter_17_2,
				iter_17_3
			})
		end
	end

	local var_17_6 = arg_17_0:getCommanders()

	for iter_17_4, iter_17_5 in pairs(var_17_6) do
		local var_17_7 = iter_17_5:getTalents()

		for iter_17_6, iter_17_7 in ipairs(var_17_7) do
			local var_17_8 = iter_17_7:getBuffsAddition()

			if #var_17_8 > 0 then
				local var_17_9

				for iter_17_8, iter_17_9 in ipairs(var_17_0) do
					if iter_17_9[1] == iter_17_5 then
						var_17_9 = iter_17_9[2]

						break
					end
				end

				if not var_17_9 then
					var_17_9 = {}

					table.insert(var_17_0, {
						iter_17_5,
						var_17_9
					})
				end

				for iter_17_10, iter_17_11 in ipairs(var_17_8) do
					table.insert(var_17_9, iter_17_11)
				end
			end
		end
	end

	return var_17_0
end

function var_0_0.getSkills(arg_18_0)
	return arg_18_0.skills
end

function var_0_0.getShipIds(arg_19_0)
	local var_19_0 = {}
	local var_19_1 = {
		arg_19_0.mainShips,
		arg_19_0.vanguardShips,
		arg_19_0.subShips
	}

	for iter_19_0, iter_19_1 in ipairs(var_19_1) do
		for iter_19_2, iter_19_3 in ipairs(iter_19_1) do
			table.insert(var_19_0, iter_19_3)
		end
	end

	return var_19_0
end

function var_0_0.GetRawShipIds(arg_20_0)
	return arg_20_0.ships
end

function var_0_0.GetRawCommanderIds(arg_21_0)
	return arg_21_0.commanderIds
end

function var_0_0.findSkills(arg_22_0, arg_22_1)
	return _.filter(arg_22_0:getSkills(), function(arg_23_0)
		return arg_23_0:GetType() == arg_22_1
	end)
end

function var_0_0.updateShips(arg_24_0, arg_24_1)
	arg_24_0.ships = {}
	arg_24_0.vanguardShips = {}
	arg_24_0.mainShips = {}
	arg_24_0.subShips = {}

	local var_24_0 = getProxy(BayProxy)

	for iter_24_0, iter_24_1 in ipairs(arg_24_1) do
		local var_24_1 = var_24_0:getShipById(iter_24_1)

		if var_24_1 then
			arg_24_0:insertShip(var_24_1, nil, var_24_1:getTeamType())
		end
	end
end

function var_0_0.switchShip(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = arg_25_0:getTeamByName(arg_25_1)

	var_25_0[arg_25_2], var_25_0[arg_25_3] = var_25_0[arg_25_3], var_25_0[arg_25_2]
end

function var_0_0.getShipPos(arg_26_0, arg_26_1)
	if not arg_26_1 then
		return
	end

	local var_26_0 = arg_26_1:getTeamType()
	local var_26_1 = arg_26_0:getTeamByName(var_26_0)

	return table.indexof(var_26_1, arg_26_1.id) or -1, var_26_0
end

function var_0_0.getTeamByName(arg_27_0, arg_27_1)
	if arg_27_1 == TeamType.Vanguard then
		return arg_27_0.vanguardShips
	elseif arg_27_1 == TeamType.Main then
		return arg_27_0.mainShips
	elseif arg_27_1 == TeamType.Submarine then
		return arg_27_0.subShips
	end
end

function var_0_0.CanInsertShip(arg_28_0, arg_28_1, arg_28_2)
	if arg_28_0:isFull() or arg_28_0:containShip(arg_28_1) or not arg_28_1:isAvaiable() or #arg_28_0:getTeamByName(arg_28_2) >= TeamType.GetTeamShipMax(arg_28_2) then
		return false
	end

	return true
end

function var_0_0.insertShip(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if not arg_29_0:CanInsertShip(arg_29_1, arg_29_3) then
		errorMsg("fleet insert error")
		pg.TipsMgr.GetInstance():ShowTips("fleet insert error")
	else
		local var_29_0 = arg_29_0:getTeamByName(arg_29_3)

		arg_29_2 = arg_29_2 or #var_29_0 + 1

		local var_29_1 = arg_29_3 == TeamType.Main and #arg_29_0.vanguardShips or 0

		table.insert(var_29_0, arg_29_2, arg_29_1.id)
		table.insert(arg_29_0.ships, var_29_1 + arg_29_2, arg_29_1.id)
	end
end

function var_0_0.canRemove(arg_30_0, arg_30_1)
	local var_30_0, var_30_1 = arg_30_0:getShipPos(arg_30_1)

	if var_30_0 > 0 and #(arg_30_0:getTeamByName(var_30_1) or {}) == 1 and arg_30_0:isFirstFleet() then
		return false
	else
		return true
	end
end

function var_0_0.isRegularFleet(arg_31_0)
	return arg_31_0.id >= var_0_0.SUBMARINE_FLEET_ID and arg_31_0.id < var_0_0.SUBMARINE_FLEET_ID + var_0_0.SUBMARINE_FLEET_NUMS or arg_31_0.id >= var_0_0.REGULAR_FLEET_ID and arg_31_0.id < var_0_0.REGULAR_FLEET_ID + var_0_0.REGULAR_FLEET_NUMS
end

function var_0_0.isSubmarineFleet(arg_32_0)
	return arg_32_0.id >= var_0_0.SUBMARINE_FLEET_ID and arg_32_0.id < var_0_0.SUBMARINE_FLEET_ID + var_0_0.SUBMARINE_FLEET_NUMS
end

function var_0_0.isPVPFleet(arg_33_0)
	return arg_33_0.id == FleetProxy.PVP_FLEET_ID
end

function var_0_0.getFleetType(arg_34_0)
	assert(false)
end

function var_0_0.removeShip(arg_35_0, arg_35_1)
	assert(arg_35_0:containShip(arg_35_1), "ship are not in fleet")

	local var_35_0 = arg_35_1.id

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.ships) do
		if iter_35_1 == var_35_0 then
			table.remove(arg_35_0.ships, iter_35_0)

			break
		end
	end

	for iter_35_2, iter_35_3 in ipairs(arg_35_0.vanguardShips) do
		if iter_35_3 == var_35_0 then
			return table.remove(arg_35_0.vanguardShips, iter_35_2), TeamType.Vanguard
		end
	end

	for iter_35_4, iter_35_5 in ipairs(arg_35_0.mainShips) do
		if iter_35_5 == var_35_0 then
			return table.remove(arg_35_0.mainShips, iter_35_4), TeamType.Main
		end
	end

	for iter_35_6, iter_35_7 in ipairs(arg_35_0.subShips) do
		if iter_35_7 == var_35_0 then
			return table.remove(arg_35_0.subShips, iter_35_6), TeamType.Submarine
		end
	end

	return nil
end

function var_0_0.isFull(arg_36_0)
	local var_36_0 = arg_36_0:getFleetType()

	if var_36_0 == FleetType.Normal then
		assert(#arg_36_0.vanguardShips <= TeamType.VanguardMax and #arg_36_0.mainShips <= TeamType.MainMax)

		return #arg_36_0.vanguardShips == TeamType.VanguardMax and #arg_36_0.mainShips == TeamType.MainMax
	elseif var_36_0 == FleetType.Submarine then
		assert(#arg_36_0.subShips <= TeamType.SubmarineMax)

		return #arg_36_0.subShips == TeamType.SubmarineMax
	end

	return false
end

function var_0_0.isEmpty(arg_37_0)
	return #arg_37_0.ships == 0
end

function var_0_0.isLegalToFight(arg_38_0)
	local var_38_0 = arg_38_0:getFleetType()

	if var_38_0 == FleetType.Normal then
		if #arg_38_0.vanguardShips == 0 then
			return TeamType.Vanguard, 1
		elseif #arg_38_0.mainShips == 0 then
			return TeamType.Main, 1
		end
	elseif var_38_0 == FleetType.Submarine and #arg_38_0.subShips == 0 then
		return TeamType.Submarine, 1
	end

	return true
end

function var_0_0.getSkillNum(arg_39_0)
	local var_39_0 = {
		"zhupao",
		"yulei",
		"fangkongpao",
		"jianzaiji"
	}
	local var_39_1 = {}

	for iter_39_0, iter_39_1 in pairs(var_39_0) do
		var_39_1[iter_39_1] = 0
	end

	local var_39_2 = getProxy(BayProxy):getRawData()
	local var_39_3 = ys.Battle.BattleConst.EquipmentType

	for iter_39_2, iter_39_3 in ipairs(arg_39_0.ships) do
		for iter_39_4, iter_39_5 in ipairs(var_39_2[iter_39_3]:getActiveEquipments()) do
			if iter_39_5 > 0 then
				local var_39_4 = Equipment.New({
					id = iter_39_5
				}):getConfig("weapon_id")

				for iter_39_6, iter_39_7 in ipairs(var_39_4) do
					if iter_39_7 > 0 then
						local var_39_5 = pg.weapon_property[iter_39_7].type

						if var_39_5 == var_39_3.POINT_HIT_AND_LOCK then
							var_39_1.zhupao = var_39_1.zhupao + 1
						elseif var_39_5 == var_39_3.TORPEDO or var_39_5 == var_39_3.MANUAL_TORPEDO then
							var_39_1.yulei = var_39_1.yulei + 1
						elseif var_39_5 == var_39_3.ANTI_AIR then
							var_39_1.fangkongpao = var_39_1.fangkongpao + 1
						elseif var_39_5 == var_39_3.INTERCEPT_AIRCRAFT then
							var_39_1.jianzaiji = var_39_1.jianzaiji + 1
						end
					end
				end
			end
		end
	end

	return var_39_1
end

function var_0_0.GetPropertiesSum(arg_40_0)
	local var_40_0 = {
		cannon = 0,
		antiAir = 0,
		air = 0,
		torpedo = 0
	}
	local var_40_1 = getProxy(BayProxy):getRawData()

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.ships) do
		local var_40_2 = var_40_1[iter_40_1]:getProperties(arg_40_0:getCommanders())

		var_40_0.cannon = var_40_0.cannon + math.floor(var_40_2.cannon)
		var_40_0.torpedo = var_40_0.torpedo + math.floor(var_40_2.torpedo)
		var_40_0.antiAir = var_40_0.antiAir + math.floor(var_40_2.antiaircraft)
		var_40_0.air = var_40_0.air + math.floor(var_40_2.air)
	end

	return var_40_0
end

function var_0_0.GetCostSum(arg_41_0)
	local var_41_0 = {
		gold = 0,
		oil = 0
	}
	local var_41_1 = arg_41_0:getStartCost()
	local var_41_2 = arg_41_0:getEndCost()

	if arg_41_0:getFleetType() == FleetType.Submarine then
		var_41_0.oil = var_41_2.oil
	else
		var_41_0.oil = var_41_1.oil + var_41_2.oil
	end

	return var_41_0
end

function var_0_0.getStartCost(arg_42_0)
	local var_42_0 = {
		gold = 0,
		oil = 0
	}
	local var_42_1 = getProxy(BayProxy):getRawData()

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.ships) do
		local var_42_2 = var_42_1[iter_42_1]:getStartBattleExpend()

		var_42_0.oil = var_42_0.oil + var_42_2
	end

	return var_42_0
end

function var_0_0.getEndCost(arg_43_0)
	local var_43_0 = {
		gold = 0,
		oil = 0
	}
	local var_43_1 = getProxy(BayProxy):getRawData()

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.ships) do
		local var_43_2 = var_43_1[iter_43_1]:getEndBattleExpend()

		var_43_0.oil = var_43_0.oil + var_43_2
	end

	return var_43_0
end

function var_0_0.GetGearScoreSum(arg_44_0, arg_44_1)
	local var_44_0

	if arg_44_1 == nil then
		var_44_0 = arg_44_0.ships
	else
		var_44_0 = arg_44_0:getTeamByName(arg_44_1)
	end

	local var_44_1 = 0
	local var_44_2 = getProxy(BayProxy):getRawData()

	for iter_44_0, iter_44_1 in ipairs(var_44_0) do
		var_44_1 = var_44_1 + var_44_2[iter_44_1]:getShipCombatPower(arg_44_0:getCommanders())
	end

	return var_44_1
end

function var_0_0.GetEnergyStatus(arg_45_0)
	local var_45_0 = false
	local var_45_1 = ""
	local var_45_2 = ""
	local var_45_3 = getProxy(BayProxy)

	local function var_45_4(arg_46_0)
		for iter_46_0 = 1, 3 do
			if arg_46_0[iter_46_0] then
				local var_46_0 = var_45_3:getShipById(arg_46_0[iter_46_0])

				if var_46_0.energy == Ship.ENERGY_LOW then
					var_45_0 = true
					var_45_2 = var_45_2 .. "「" .. var_46_0:getConfig("name") .. "」"
				end
			end
		end
	end

	var_45_4(arg_45_0.mainShips)
	var_45_4(arg_45_0.vanguardShips)
	var_45_4(arg_45_0.subShips)

	if var_45_0 then
		var_45_1 = arg_45_0:GetName()
	end

	return var_45_0, i18n("ship_energy_low_warn", var_45_1, var_45_2)
end

function var_0_0.genRobotDataString(arg_47_0)
	local var_47_0 = getProxy(BayProxy):getRawData()
	local var_47_1 = "99999,"

	for iter_47_0 = 1, 3 do
		if arg_47_0.vanguardShips[iter_47_0] and arg_47_0.vanguardShips[iter_47_0] > 0 then
			var_47_1 = var_47_1 .. var_47_0[arg_47_0.vanguardShips[iter_47_0]].configId .. "," .. var_47_0[arg_47_0.vanguardShips[iter_47_0]].level .. ",\"{"

			for iter_47_1, iter_47_2 in pairs(var_47_0[arg_47_0.vanguardShips[iter_47_0]]:getActiveEquipments()) do
				var_47_1 = var_47_1 .. (iter_47_2 and iter_47_2.id or 0)

				if iter_47_1 < 5 then
					var_47_1 = var_47_1 .. ","
				end
			end

			var_47_1 = var_47_1 .. "}\","
		else
			var_47_1 = var_47_1 .. "" .. "," .. "" .. ",{" .. "},"
		end
	end

	for iter_47_3 = 1, 3 do
		if arg_47_0.mainShips[iter_47_3] and arg_47_0.mainShips[iter_47_3] > 0 then
			var_47_1 = var_47_1 .. var_47_0[arg_47_0.mainShips[iter_47_3]].configId .. "," .. var_47_0[arg_47_0.mainShips[iter_47_3]].level .. ",\"{"

			for iter_47_4, iter_47_5 in pairs(var_47_0[arg_47_0.mainShips[iter_47_3]]:getActiveEquipments()) do
				var_47_1 = var_47_1 .. (iter_47_5 and iter_47_5.id or 0)

				if iter_47_4 < 5 then
					var_47_1 = var_47_1 .. ","
				end
			end

			var_47_1 = var_47_1 .. "}\","
		else
			var_47_1 = var_47_1 .. "" .. "," .. "" .. ",{" .. "},"
		end
	end

	local var_47_2 = arg_47_0:GetGearScoreSum(TeamType.Vanguard)
	local var_47_3 = arg_47_0:GetGearScoreSum(TeamType.Main)

	return var_47_1 .. math.floor(var_47_2 + var_47_3) .. ","
end

function var_0_0.getIndex(arg_48_0)
	if arg_48_0.id >= var_0_0.SUBMARINE_FLEET_ID and arg_48_0.id < var_0_0.SUBMARINE_FLEET_ID + var_0_0.SUBMARINE_FLEET_NUMS then
		return arg_48_0.id - var_0_0.SUBMARINE_FLEET_ID + 1
	elseif arg_48_0.id >= var_0_0.REGULAR_FLEET_ID and arg_48_0.id < var_0_0.REGULAR_FLEET_ID + var_0_0.REGULAR_FLEET_NUMS then
		return arg_48_0.id - var_0_0.REGULAR_FLEET_ID + 1
	end

	return arg_48_0.id
end

function var_0_0.getShipCount(arg_49_0)
	return #arg_49_0.ships
end

function var_0_0.avgLevel(arg_50_0)
	local var_50_0 = 0

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.ships) do
		var_50_0 = getProxy(BayProxy):getShipById(iter_50_1).level + var_50_0
	end

	return math.floor(var_50_0 / #arg_50_0.ships)
end

function var_0_0.clearFleet(arg_51_0)
	local var_51_0 = Clone(arg_51_0.ships)
	local var_51_1 = getProxy(BayProxy)

	for iter_51_0, iter_51_1 in ipairs(var_51_0) do
		local var_51_2 = var_51_1:getShipById(iter_51_1)

		arg_51_0:removeShip(var_51_2)
	end
end

function var_0_0.EnergyCheck(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4)
	arg_52_4 = arg_52_4 or "ship_energy_low_warn"

	local var_52_0 = {}

	for iter_52_0, iter_52_1 in ipairs(arg_52_0) do
		if iter_52_1.energy == Ship.ENERGY_LOW then
			table.insert(var_52_0, iter_52_1)
		end
	end

	if #var_52_0 > 0 then
		local var_52_1 = ""
		local var_52_2 = _.map(var_52_0, function(arg_53_0)
			return "「" .. arg_53_0:getConfig("name") .. "」"
		end)

		if PLATFORM_CODE ~= PLATFORM_US or #var_52_2 == 1 then
			for iter_52_2, iter_52_3 in ipairs(var_52_2) do
				var_52_1 = var_52_1 .. iter_52_3
			end
		else
			if arg_52_4 == "ship_energy_low_warn_no_exp" or arg_52_4 == "ship_energy_low_warn" or arg_52_4 == "ship_energy_low_desc" then
				arg_52_4 = "multiple_" .. arg_52_4
			end

			for iter_52_4 = 1, #var_52_2 - 2 do
				local var_52_3 = var_52_2[iter_52_4]

				var_52_1 = var_52_1 .. var_52_3 .. ", "
			end

			var_52_1 = var_52_1 .. var_52_2[#var_52_2 - 1] .. " and " .. var_52_2[#var_52_2]
		end

		existCall(arg_52_3, false)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(arg_52_4, arg_52_1, var_52_1),
			onYes = function()
				arg_52_2(true)
			end,
			onNo = function()
				arg_52_2(false)
			end
		})
	else
		existCall(arg_52_3, true)
		arg_52_2(true)
	end
end

function var_0_0.getFleetAirDominanceValue(arg_56_0)
	local var_56_0 = getProxy(BayProxy)
	local var_56_1 = arg_56_0:getCommanders()
	local var_56_2 = 0

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.ships) do
		var_56_2 = (function(arg_57_0, arg_57_1)
			return arg_57_0 + calcAirDominanceValue(var_56_0:getShipById(arg_57_1), var_56_1)
		end)(var_56_2, iter_56_1)
	end

	return var_56_2
end

function var_0_0.RemoveUnusedItems(arg_58_0)
	local var_58_0 = Clone(arg_58_0.ships)
	local var_58_1 = getProxy(BayProxy)

	for iter_58_0, iter_58_1 in ipairs(var_58_0) do
		if not var_58_1:getShipById(iter_58_1) then
			arg_58_0:removeShipById(iter_58_1)
		end
	end

	local var_58_2 = getProxy(CommanderProxy)
	local var_58_3 = {}

	for iter_58_2, iter_58_3 in pairs(arg_58_0.commanderIds) do
		if not var_58_2:getCommanderById(iter_58_3) then
			table.insert(var_58_3, iter_58_2)
		end
	end

	if #var_58_3 > 0 then
		for iter_58_4, iter_58_5 in pairs(var_58_3) do
			arg_58_0.commanderIds[iter_58_5] = nil
		end

		arg_58_0.skills = {}

		arg_58_0:updateCommanderSkills()
	end
end

function var_0_0.removeShipById(arg_59_0, arg_59_1)
	for iter_59_0, iter_59_1 in ipairs(arg_59_0.ships) do
		if iter_59_1 == arg_59_1 then
			table.remove(arg_59_0.ships, iter_59_0)

			break
		end
	end

	for iter_59_2, iter_59_3 in ipairs(arg_59_0.vanguardShips) do
		if iter_59_3 == arg_59_1 then
			return table.remove(arg_59_0.vanguardShips, iter_59_2), TeamType.Vanguard
		end
	end

	for iter_59_4, iter_59_5 in ipairs(arg_59_0.mainShips) do
		if iter_59_5 == arg_59_1 then
			return table.remove(arg_59_0.mainShips, iter_59_4), TeamType.Main
		end
	end

	for iter_59_6, iter_59_7 in ipairs(arg_59_0.subShips) do
		if iter_59_7 == arg_59_1 then
			return table.remove(arg_59_0.subShips, iter_59_6), TeamType.Submarine
		end
	end
end

function var_0_0.HaveShipsInEvent(arg_60_0)
	local var_60_0 = getProxy(BayProxy):getRawData()

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.ships) do
		if var_60_0[iter_60_1]:getFlag("inEvent") then
			return true, i18n("elite_disable_ship_escort")
		end
	end
end

function var_0_0.GetFleetSonarRange(arg_61_0)
	local var_61_0 = getProxy(BayProxy)
	local var_61_1 = 0
	local var_61_2 = 0
	local var_61_3 = 0
	local var_61_4 = 0
	local var_61_5 = ys.Battle.BattleConfig

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.ships) do
		local var_61_6 = var_61_0:getShipById(iter_61_1)

		if var_61_6 then
			local var_61_7 = var_61_6:getShipType()
			local var_61_8 = var_61_5.VAN_SONAR_PROPERTY[var_61_7]

			if var_61_8 then
				local var_61_9 = (var_61_6:getShipProperties()[AttributeType.AntiSub] or 0) / var_61_8.a - var_61_8.b

				var_61_1 = math.max(var_61_1, Mathf.Clamp(var_61_9, var_61_8.minRange, var_61_8.maxRange))
			end

			if table.contains(ShipType.MainShipType, var_61_7) then
				var_61_4 = var_61_4 + (var_61_6:getShipProperties()[AttributeType.AntiSub] or 0)
			end

			for iter_61_2, iter_61_3 in ipairs(var_61_6:getActiveEquipments()) do
				if iter_61_3 then
					var_61_3 = var_61_3 + (iter_61_3:getConfig("equip_parameters").range or 0)
				end
			end
		end
	end

	if var_61_1 ~= 0 then
		local var_61_10 = var_61_5.MAIN_SONAR_PROPERTY
		local var_61_11 = var_61_4 / var_61_10.a

		var_61_2 = var_61_3 + Mathf.Clamp(var_61_11, var_61_10.minRange, var_61_10.maxRange)
	end

	return var_61_1 + var_61_2
end

function var_0_0.getInvestSums(arg_62_0)
	local var_62_0 = getProxy(BayProxy)

	local function var_62_1(arg_63_0, arg_63_1)
		local var_63_0 = var_62_0:getShipById(arg_63_1):getProperties(arg_62_0:getCommanders())

		return arg_63_0 + var_63_0[AttributeType.Air] + var_63_0[AttributeType.Dodge]
	end

	local var_62_2 = _.reduce(arg_62_0.ships, 0, var_62_1)

	return math.pow(var_62_2, 0.6666666666666666)
end

function var_0_0.ExistActNpcShip(arg_64_0)
	local var_64_0 = getProxy(BayProxy)

	for iter_64_0, iter_64_1 in ipairs(arg_64_0.ships) do
		local var_64_1 = var_64_0:RawGetShipById(iter_64_1)

		if var_64_1 and var_64_1:isActivityNpc() then
			return true
		end
	end

	return false
end

function var_0_0.GetName(arg_65_0)
	return noEmptyStr(arg_65_0.name) or var_0_0.DEFAULT_NAME[arg_65_0.id]
end

function var_0_0.ChangeToElite(arg_66_0)
	local var_66_0 = arg_66_0:getFleetType()
	local var_66_1 = {
		id = arg_66_0.id,
		[TeamType.FormShips] = {},
		[TeamType.FormCommander] = {
			0,
			0
		}
	}

	for iter_66_0, iter_66_1 in ipairs(arg_66_0.commanderIds) do
		var_66_1[TeamType.FormCommander][iter_66_0] = iter_66_1
	end

	switch(var_66_0, {
		[FleetType.Normal] = function()
			var_66_1[TeamType.FormShips] = table.mergeArray(arg_66_0.mainShips, arg_66_0.vanguardShips)
		end,
		[FleetType.Submarine] = function()
			var_66_1[TeamType.FormShips] = underscore.to_array(arg_66_0.subShips)
		end,
		[FleetType.Support] = function()
			var_66_1[TeamType.FormShips] = underscore.to_array(arg_66_0.mainShips)
		end
	})

	return var_66_1, var_66_0
end

return var_0_0

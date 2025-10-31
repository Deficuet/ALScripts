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

function var_0_0.isUnlock(arg_2_0)
	local var_2_0 = {
		nil,
		nil,
		404,
		504,
		604,
		704
	}
	local var_2_1 = getProxy(ChapterProxy)
	local var_2_2 = var_2_0[arg_2_0.id]

	if var_2_2 then
		local var_2_3 = var_2_1:getChapterById(var_2_2)

		return var_2_3 and var_2_3:isClear(), i18n("formation_chapter_lock", string.sub(tostring(var_2_2), 1, 1), arg_2_0.id)
	end

	return true
end

function var_0_0.containShip(arg_3_0, arg_3_1)
	return table.contains(arg_3_0.ships, arg_3_1.id)
end

function var_0_0.isFirstFleet(arg_4_0)
	return arg_4_0.id == var_0_0.REGULAR_FLEET_ID
end

function var_0_0.outputCommanders(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.commanderIds) do
		assert(iter_5_1, "id is nil")
		table.insert(var_5_0, {
			pos = iter_5_0,
			id = iter_5_1
		})
	end

	return var_5_0
end

function var_0_0.getCommanders(arg_6_0)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0.commanderIds) do
		var_6_0[iter_6_0] = getProxy(CommanderProxy):getCommanderById(iter_6_1)
	end

	return var_6_0
end

function var_0_0.getCommanderByPos(arg_7_0, arg_7_1)
	return arg_7_0:getCommanders()[arg_7_1]
end

function var_0_0.updateCommanderByPos(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_2 then
		arg_8_0.commanderIds[arg_8_1] = arg_8_2.id
	else
		arg_8_0.commanderIds[arg_8_1] = nil
	end

	arg_8_0:updateCommanderSkills()
end

function var_0_0.getCommandersAddition(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(CommanderConst.PROPERTIES) do
		local var_9_1 = 0

		for iter_9_2, iter_9_3 in pairs(arg_9_0:getCommanders()) do
			var_9_1 = var_9_1 + iter_9_3:getAbilitysAddition()[iter_9_1]
		end

		if var_9_1 > 0 then
			table.insert(var_9_0, {
				attrName = iter_9_1,
				value = var_9_1
			})
		end
	end

	return var_9_0
end

function var_0_0.getCommandersTalentDesc(arg_10_0)
	local var_10_0 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0:getCommanders()) do
		local var_10_1 = iter_10_1:getTalentsDesc()

		for iter_10_2, iter_10_3 in pairs(var_10_1) do
			if var_10_0[iter_10_2] then
				var_10_0[iter_10_2].value = var_10_0[iter_10_2].value + iter_10_3.value
			else
				var_10_0[iter_10_2] = {
					name = iter_10_2,
					value = iter_10_3.value,
					type = iter_10_3.type
				}
			end
		end
	end

	return var_10_0
end

function var_0_0.findCommanderBySkillId(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0:getCommanders()

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		if _.any(iter_11_1:getSkills(), function(arg_12_0)
			return _.any(arg_12_0:getTacticSkill(), function(arg_13_0)
				return arg_13_0 == arg_11_1
			end)
		end) then
			return iter_11_1
		end
	end
end

function var_0_0.updateCommanderSkills(arg_14_0)
	local var_14_0 = #arg_14_0.skills

	while var_14_0 > 0 do
		local var_14_1 = arg_14_0.skills[var_14_0]

		if not arg_14_0:findCommanderBySkillId(var_14_1.id) and var_14_1:GetSystem() == FleetSkill.SystemCommanderNeko then
			table.remove(arg_14_0.skills, var_14_0)
		end

		var_14_0 = var_14_0 - 1
	end

	local var_14_2 = arg_14_0:getCommanders()

	for iter_14_0, iter_14_1 in pairs(var_14_2) do
		for iter_14_2, iter_14_3 in ipairs(iter_14_1:getSkills()) do
			for iter_14_4, iter_14_5 in ipairs(iter_14_3:getTacticSkill()) do
				table.insert(arg_14_0.skills, FleetSkill.New(FleetSkill.SystemCommanderNeko, iter_14_5))
			end
		end
	end
end

function var_0_0.buildBattleBuffList(arg_15_0)
	local var_15_0 = {}
	local var_15_1, var_15_2 = FleetSkill.triggerSkill(arg_15_0, FleetSkill.TypeBattleBuff)

	if var_15_1 and #var_15_1 > 0 then
		local var_15_3 = {}

		for iter_15_0, iter_15_1 in ipairs(var_15_1) do
			local var_15_4 = var_15_2[iter_15_0]
			local var_15_5 = arg_15_0:findCommanderBySkillId(var_15_4.id)

			var_15_3[var_15_5] = var_15_3[var_15_5] or {}

			table.insert(var_15_3[var_15_5], iter_15_1)
		end

		for iter_15_2, iter_15_3 in pairs(var_15_3) do
			table.insert(var_15_0, {
				iter_15_2,
				iter_15_3
			})
		end
	end

	local var_15_6 = arg_15_0:getCommanders()

	for iter_15_4, iter_15_5 in pairs(var_15_6) do
		local var_15_7 = iter_15_5:getTalents()

		for iter_15_6, iter_15_7 in ipairs(var_15_7) do
			local var_15_8 = iter_15_7:getBuffsAddition()

			if #var_15_8 > 0 then
				local var_15_9

				for iter_15_8, iter_15_9 in ipairs(var_15_0) do
					if iter_15_9[1] == iter_15_5 then
						var_15_9 = iter_15_9[2]

						break
					end
				end

				if not var_15_9 then
					var_15_9 = {}

					table.insert(var_15_0, {
						iter_15_5,
						var_15_9
					})
				end

				for iter_15_10, iter_15_11 in ipairs(var_15_8) do
					table.insert(var_15_9, iter_15_11)
				end
			end
		end
	end

	return var_15_0
end

function var_0_0.getSkills(arg_16_0)
	return arg_16_0.skills
end

function var_0_0.getShipIds(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = {
		arg_17_0.mainShips,
		arg_17_0.vanguardShips,
		arg_17_0.subShips
	}

	for iter_17_0, iter_17_1 in ipairs(var_17_1) do
		for iter_17_2, iter_17_3 in ipairs(iter_17_1) do
			table.insert(var_17_0, iter_17_3)
		end
	end

	return var_17_0
end

function var_0_0.GetRawShipIds(arg_18_0)
	return arg_18_0.ships
end

function var_0_0.GetRawCommanderIds(arg_19_0)
	return arg_19_0.commanderIds
end

function var_0_0.findSkills(arg_20_0, arg_20_1)
	return _.filter(arg_20_0:getSkills(), function(arg_21_0)
		return arg_21_0:GetType() == arg_20_1
	end)
end

function var_0_0.updateShips(arg_22_0, arg_22_1)
	arg_22_0.ships = {}
	arg_22_0.vanguardShips = {}
	arg_22_0.mainShips = {}
	arg_22_0.subShips = {}

	local var_22_0 = getProxy(BayProxy)

	for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
		local var_22_1 = var_22_0:getShipById(iter_22_1)

		if var_22_1 then
			arg_22_0:insertShip(var_22_1, nil, var_22_1:getTeamType())
		end
	end
end

function var_0_0.switchShip(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = arg_23_0:getTeamByName(arg_23_1)

	var_23_0[arg_23_2], var_23_0[arg_23_3] = var_23_0[arg_23_3], var_23_0[arg_23_2]
end

function var_0_0.getShipPos(arg_24_0, arg_24_1)
	if not arg_24_1 then
		return
	end

	local var_24_0 = arg_24_1:getTeamType()
	local var_24_1 = arg_24_0:getTeamByName(var_24_0)

	return table.indexof(var_24_1, arg_24_1.id) or -1, var_24_0
end

function var_0_0.getTeamByName(arg_25_0, arg_25_1)
	if arg_25_1 == TeamType.Vanguard then
		return arg_25_0.vanguardShips
	elseif arg_25_1 == TeamType.Main then
		return arg_25_0.mainShips
	elseif arg_25_1 == TeamType.Submarine then
		return arg_25_0.subShips
	end
end

function var_0_0.CanInsertShip(arg_26_0, arg_26_1, arg_26_2)
	if arg_26_0:isFull() or arg_26_0:containShip(arg_26_1) or not arg_26_1:isAvaiable() or #arg_26_0:getTeamByName(arg_26_2) >= TeamType.GetTeamShipMax(arg_26_2) then
		return false
	end

	return true
end

function var_0_0.insertShip(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	if not arg_27_0:CanInsertShip(arg_27_1, arg_27_3) then
		errorMsg("fleet insert error")
		pg.TipsMgr.GetInstance():ShowTips("fleet insert error")
	else
		local var_27_0 = arg_27_0:getTeamByName(arg_27_3)

		arg_27_2 = arg_27_2 or #var_27_0 + 1

		local var_27_1 = arg_27_3 == TeamType.Main and #arg_27_0.vanguardShips or 0

		table.insert(var_27_0, arg_27_2, arg_27_1.id)
		table.insert(arg_27_0.ships, var_27_1 + arg_27_2, arg_27_1.id)
	end
end

function var_0_0.canRemove(arg_28_0, arg_28_1)
	local var_28_0, var_28_1 = arg_28_0:getShipPos(arg_28_1)

	if var_28_0 > 0 and #(arg_28_0:getTeamByName(var_28_1) or {}) == 1 and arg_28_0:isFirstFleet() then
		return false
	else
		return true
	end
end

function var_0_0.isRegularFleet(arg_29_0)
	return arg_29_0.id >= var_0_0.SUBMARINE_FLEET_ID and arg_29_0.id < var_0_0.SUBMARINE_FLEET_ID + var_0_0.SUBMARINE_FLEET_NUMS or arg_29_0.id >= var_0_0.REGULAR_FLEET_ID and arg_29_0.id < var_0_0.REGULAR_FLEET_ID + var_0_0.REGULAR_FLEET_NUMS
end

function var_0_0.isSubmarineFleet(arg_30_0)
	return arg_30_0.id >= var_0_0.SUBMARINE_FLEET_ID and arg_30_0.id < var_0_0.SUBMARINE_FLEET_ID + var_0_0.SUBMARINE_FLEET_NUMS
end

function var_0_0.isPVPFleet(arg_31_0)
	return arg_31_0.id == FleetProxy.PVP_FLEET_ID
end

function var_0_0.getFleetType(arg_32_0)
	if arg_32_0.id and arg_32_0.id >= var_0_0.SUBMARINE_FLEET_ID and arg_32_0.id < var_0_0.SUBMARINE_FLEET_ID + var_0_0.SUBMARINE_FLEET_NUMS then
		return FleetType.Submarine
	end

	return FleetType.Normal
end

function var_0_0.removeShip(arg_33_0, arg_33_1)
	assert(arg_33_0:containShip(arg_33_1), "ship are not in fleet")

	local var_33_0 = arg_33_1.id

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.ships) do
		if iter_33_1 == var_33_0 then
			table.remove(arg_33_0.ships, iter_33_0)

			break
		end
	end

	for iter_33_2, iter_33_3 in ipairs(arg_33_0.vanguardShips) do
		if iter_33_3 == var_33_0 then
			return table.remove(arg_33_0.vanguardShips, iter_33_2), TeamType.Vanguard
		end
	end

	for iter_33_4, iter_33_5 in ipairs(arg_33_0.mainShips) do
		if iter_33_5 == var_33_0 then
			return table.remove(arg_33_0.mainShips, iter_33_4), TeamType.Main
		end
	end

	for iter_33_6, iter_33_7 in ipairs(arg_33_0.subShips) do
		if iter_33_7 == var_33_0 then
			return table.remove(arg_33_0.subShips, iter_33_6), TeamType.Submarine
		end
	end

	return nil
end

function var_0_0.isFull(arg_34_0)
	local var_34_0 = arg_34_0:getFleetType()

	if var_34_0 == FleetType.Normal then
		return #arg_34_0.vanguardShips + #arg_34_0.mainShips >= TeamType.VanguardMax + TeamType.MainMax
	elseif var_34_0 == FleetType.Submarine then
		return #arg_34_0.subShips >= TeamType.SubmarineMax
	end

	return false
end

function var_0_0.isEmpty(arg_35_0)
	return #arg_35_0.ships == 0
end

function var_0_0.isLegalToFight(arg_36_0)
	local var_36_0 = arg_36_0:getFleetType()

	if var_36_0 == FleetType.Normal then
		if #arg_36_0.vanguardShips == 0 then
			return TeamType.Vanguard, 1
		elseif #arg_36_0.mainShips == 0 then
			return TeamType.Main, 1
		end
	elseif var_36_0 == FleetType.Submarine and #arg_36_0.subShips == 0 then
		return TeamType.Submarine, 1
	end

	return true
end

function var_0_0.getSkillNum(arg_37_0)
	local var_37_0 = {
		"zhupao",
		"yulei",
		"fangkongpao",
		"jianzaiji"
	}
	local var_37_1 = {}

	for iter_37_0, iter_37_1 in pairs(var_37_0) do
		var_37_1[iter_37_1] = 0
	end

	local var_37_2 = getProxy(BayProxy):getRawData()
	local var_37_3 = ys.Battle.BattleConst.EquipmentType

	for iter_37_2, iter_37_3 in ipairs(arg_37_0.ships) do
		for iter_37_4, iter_37_5 in ipairs(var_37_2[iter_37_3]:getActiveEquipments()) do
			if iter_37_5 > 0 then
				local var_37_4 = Equipment.New({
					id = iter_37_5
				}):getConfig("weapon_id")

				for iter_37_6, iter_37_7 in ipairs(var_37_4) do
					if iter_37_7 > 0 then
						local var_37_5 = pg.weapon_property[iter_37_7].type

						if var_37_5 == var_37_3.POINT_HIT_AND_LOCK then
							var_37_1.zhupao = var_37_1.zhupao + 1
						elseif var_37_5 == var_37_3.TORPEDO or var_37_5 == var_37_3.MANUAL_TORPEDO then
							var_37_1.yulei = var_37_1.yulei + 1
						elseif var_37_5 == var_37_3.ANTI_AIR then
							var_37_1.fangkongpao = var_37_1.fangkongpao + 1
						elseif var_37_5 == var_37_3.INTERCEPT_AIRCRAFT then
							var_37_1.jianzaiji = var_37_1.jianzaiji + 1
						end
					end
				end
			end
		end
	end

	return var_37_1
end

function var_0_0.GetPropertiesSum(arg_38_0)
	local var_38_0 = {
		cannon = 0,
		antiAir = 0,
		air = 0,
		torpedo = 0
	}
	local var_38_1 = getProxy(BayProxy):getRawData()

	for iter_38_0, iter_38_1 in ipairs(arg_38_0.ships) do
		local var_38_2 = var_38_1[iter_38_1]:getProperties(arg_38_0:getCommanders())

		var_38_0.cannon = var_38_0.cannon + math.floor(var_38_2.cannon)
		var_38_0.torpedo = var_38_0.torpedo + math.floor(var_38_2.torpedo)
		var_38_0.antiAir = var_38_0.antiAir + math.floor(var_38_2.antiaircraft)
		var_38_0.air = var_38_0.air + math.floor(var_38_2.air)
	end

	return var_38_0
end

function var_0_0.GetCostSum(arg_39_0)
	local var_39_0 = {
		gold = 0,
		oil = 0
	}
	local var_39_1 = arg_39_0:getStartCost()
	local var_39_2 = arg_39_0:getEndCost()

	if arg_39_0:getFleetType() == FleetType.Submarine then
		var_39_0.oil = var_39_2.oil
	else
		var_39_0.oil = var_39_1.oil + var_39_2.oil
	end

	return var_39_0
end

function var_0_0.getStartCost(arg_40_0)
	local var_40_0 = {
		gold = 0,
		oil = 0
	}
	local var_40_1 = getProxy(BayProxy):getRawData()

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.ships) do
		local var_40_2 = var_40_1[iter_40_1]:getStartBattleExpend()

		var_40_0.oil = var_40_0.oil + var_40_2
	end

	return var_40_0
end

function var_0_0.getEndCost(arg_41_0)
	local var_41_0 = {
		gold = 0,
		oil = 0
	}
	local var_41_1 = getProxy(BayProxy):getRawData()

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.ships) do
		local var_41_2 = var_41_1[iter_41_1]:getEndBattleExpend()

		var_41_0.oil = var_41_0.oil + var_41_2
	end

	return var_41_0
end

function var_0_0.GetGearScoreSum(arg_42_0, arg_42_1)
	local var_42_0

	if arg_42_1 == nil then
		var_42_0 = arg_42_0.ships
	else
		var_42_0 = arg_42_0:getTeamByName(arg_42_1)
	end

	local var_42_1 = 0
	local var_42_2 = getProxy(BayProxy):getRawData()

	for iter_42_0, iter_42_1 in ipairs(var_42_0) do
		var_42_1 = var_42_1 + var_42_2[iter_42_1]:getShipCombatPower(arg_42_0:getCommanders())
	end

	return var_42_1
end

function var_0_0.GetEnergyStatus(arg_43_0)
	local var_43_0 = false
	local var_43_1 = ""
	local var_43_2 = ""
	local var_43_3 = getProxy(BayProxy)

	local function var_43_4(arg_44_0)
		for iter_44_0 = 1, 3 do
			if arg_44_0[iter_44_0] then
				local var_44_0 = var_43_3:getShipById(arg_44_0[iter_44_0])

				if var_44_0.energy == Ship.ENERGY_LOW then
					var_43_0 = true
					var_43_2 = var_43_2 .. "「" .. var_44_0:getConfig("name") .. "」"
				end
			end
		end
	end

	var_43_4(arg_43_0.mainShips)
	var_43_4(arg_43_0.vanguardShips)
	var_43_4(arg_43_0.subShips)

	if var_43_0 then
		var_43_1 = arg_43_0:GetName()
	end

	return var_43_0, i18n("ship_energy_low_warn", var_43_1, var_43_2)
end

function var_0_0.genRobotDataString(arg_45_0)
	local var_45_0 = getProxy(BayProxy):getRawData()
	local var_45_1 = "99999,"

	for iter_45_0 = 1, 3 do
		if arg_45_0.vanguardShips[iter_45_0] and arg_45_0.vanguardShips[iter_45_0] > 0 then
			var_45_1 = var_45_1 .. var_45_0[arg_45_0.vanguardShips[iter_45_0]].configId .. "," .. var_45_0[arg_45_0.vanguardShips[iter_45_0]].level .. ",\"{"

			for iter_45_1, iter_45_2 in pairs(var_45_0[arg_45_0.vanguardShips[iter_45_0]]:getActiveEquipments()) do
				var_45_1 = var_45_1 .. (iter_45_2 and iter_45_2.id or 0)

				if iter_45_1 < 5 then
					var_45_1 = var_45_1 .. ","
				end
			end

			var_45_1 = var_45_1 .. "}\","
		else
			var_45_1 = var_45_1 .. "" .. "," .. "" .. ",{" .. "},"
		end
	end

	for iter_45_3 = 1, 3 do
		if arg_45_0.mainShips[iter_45_3] and arg_45_0.mainShips[iter_45_3] > 0 then
			var_45_1 = var_45_1 .. var_45_0[arg_45_0.mainShips[iter_45_3]].configId .. "," .. var_45_0[arg_45_0.mainShips[iter_45_3]].level .. ",\"{"

			for iter_45_4, iter_45_5 in pairs(var_45_0[arg_45_0.mainShips[iter_45_3]]:getActiveEquipments()) do
				var_45_1 = var_45_1 .. (iter_45_5 and iter_45_5.id or 0)

				if iter_45_4 < 5 then
					var_45_1 = var_45_1 .. ","
				end
			end

			var_45_1 = var_45_1 .. "}\","
		else
			var_45_1 = var_45_1 .. "" .. "," .. "" .. ",{" .. "},"
		end
	end

	local var_45_2 = arg_45_0:GetGearScoreSum(TeamType.Vanguard)
	local var_45_3 = arg_45_0:GetGearScoreSum(TeamType.Main)

	return var_45_1 .. math.floor(var_45_2 + var_45_3) .. ","
end

function var_0_0.getIndex(arg_46_0)
	if arg_46_0.id >= var_0_0.SUBMARINE_FLEET_ID and arg_46_0.id < var_0_0.SUBMARINE_FLEET_ID + var_0_0.SUBMARINE_FLEET_NUMS then
		return arg_46_0.id - var_0_0.SUBMARINE_FLEET_ID + 1
	elseif arg_46_0.id >= var_0_0.REGULAR_FLEET_ID and arg_46_0.id < var_0_0.REGULAR_FLEET_ID + var_0_0.REGULAR_FLEET_NUMS then
		return arg_46_0.id - var_0_0.REGULAR_FLEET_ID + 1
	end

	return arg_46_0.id
end

function var_0_0.getShipCount(arg_47_0)
	return #arg_47_0.ships
end

function var_0_0.avgLevel(arg_48_0)
	local var_48_0 = 0

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.ships) do
		var_48_0 = getProxy(BayProxy):getShipById(iter_48_1).level + var_48_0
	end

	return math.floor(var_48_0 / #arg_48_0.ships)
end

function var_0_0.clearFleet(arg_49_0)
	local var_49_0 = Clone(arg_49_0.ships)
	local var_49_1 = getProxy(BayProxy)

	for iter_49_0, iter_49_1 in ipairs(var_49_0) do
		local var_49_2 = var_49_1:getShipById(iter_49_1)

		arg_49_0:removeShip(var_49_2)
	end
end

function var_0_0.EnergyCheck(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
	arg_50_4 = arg_50_4 or "ship_energy_low_warn"

	local var_50_0 = {}

	for iter_50_0, iter_50_1 in ipairs(arg_50_0) do
		if iter_50_1.energy == Ship.ENERGY_LOW then
			table.insert(var_50_0, iter_50_1)
		end
	end

	if #var_50_0 > 0 then
		local var_50_1 = ""
		local var_50_2 = _.map(var_50_0, function(arg_51_0)
			return "「" .. arg_51_0:getConfig("name") .. "」"
		end)

		if PLATFORM_CODE ~= PLATFORM_US or #var_50_2 == 1 then
			for iter_50_2, iter_50_3 in ipairs(var_50_2) do
				var_50_1 = var_50_1 .. iter_50_3
			end
		else
			if arg_50_4 == "ship_energy_low_warn_no_exp" or arg_50_4 == "ship_energy_low_warn" or arg_50_4 == "ship_energy_low_desc" then
				arg_50_4 = "multiple_" .. arg_50_4
			end

			for iter_50_4 = 1, #var_50_2 - 2 do
				local var_50_3 = var_50_2[iter_50_4]

				var_50_1 = var_50_1 .. var_50_3 .. ", "
			end

			var_50_1 = var_50_1 .. var_50_2[#var_50_2 - 1] .. " and " .. var_50_2[#var_50_2]
		end

		existCall(arg_50_3, false)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(arg_50_4, arg_50_1, var_50_1),
			onYes = function()
				arg_50_2(true)
			end,
			onNo = function()
				arg_50_2(false)
			end
		})
	else
		existCall(arg_50_3, true)
		arg_50_2(true)
	end
end

function var_0_0.getFleetAirDominanceValue(arg_54_0)
	local var_54_0 = getProxy(BayProxy)
	local var_54_1 = arg_54_0:getCommanders()
	local var_54_2 = 0

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.ships) do
		var_54_2 = (function(arg_55_0, arg_55_1)
			return arg_55_0 + calcAirDominanceValue(var_54_0:getShipById(arg_55_1), var_54_1)
		end)(var_54_2, iter_54_1)
	end

	return var_54_2
end

function var_0_0.RemoveUnusedItems(arg_56_0)
	local var_56_0 = Clone(arg_56_0.ships)
	local var_56_1 = getProxy(BayProxy)

	for iter_56_0, iter_56_1 in ipairs(var_56_0) do
		if not var_56_1:getShipById(iter_56_1) then
			arg_56_0:removeShipById(iter_56_1)
		end
	end

	local var_56_2 = getProxy(CommanderProxy)
	local var_56_3 = {}

	for iter_56_2, iter_56_3 in pairs(arg_56_0.commanderIds) do
		if not var_56_2:getCommanderById(iter_56_3) then
			table.insert(var_56_3, iter_56_2)
		end
	end

	if #var_56_3 > 0 then
		for iter_56_4, iter_56_5 in pairs(var_56_3) do
			arg_56_0.commanderIds[iter_56_5] = nil
		end

		arg_56_0.skills = {}

		arg_56_0:updateCommanderSkills()
	end
end

function var_0_0.removeShipById(arg_57_0, arg_57_1)
	for iter_57_0, iter_57_1 in ipairs(arg_57_0.ships) do
		if iter_57_1 == arg_57_1 then
			table.remove(arg_57_0.ships, iter_57_0)

			break
		end
	end

	for iter_57_2, iter_57_3 in ipairs(arg_57_0.vanguardShips) do
		if iter_57_3 == arg_57_1 then
			return table.remove(arg_57_0.vanguardShips, iter_57_2), TeamType.Vanguard
		end
	end

	for iter_57_4, iter_57_5 in ipairs(arg_57_0.mainShips) do
		if iter_57_5 == arg_57_1 then
			return table.remove(arg_57_0.mainShips, iter_57_4), TeamType.Main
		end
	end

	for iter_57_6, iter_57_7 in ipairs(arg_57_0.subShips) do
		if iter_57_7 == arg_57_1 then
			return table.remove(arg_57_0.subShips, iter_57_6), TeamType.Submarine
		end
	end
end

function var_0_0.HaveShipsInEvent(arg_58_0)
	local var_58_0 = getProxy(BayProxy):getRawData()

	for iter_58_0, iter_58_1 in ipairs(arg_58_0.ships) do
		if var_58_0[iter_58_1]:getFlag("inEvent") then
			return true, i18n("elite_disable_ship_escort")
		end
	end
end

function var_0_0.GetFleetSonarRange(arg_59_0)
	local var_59_0 = getProxy(BayProxy)
	local var_59_1 = 0
	local var_59_2 = 0
	local var_59_3 = 0
	local var_59_4 = 0
	local var_59_5 = ys.Battle.BattleConfig

	for iter_59_0, iter_59_1 in ipairs(arg_59_0.ships) do
		local var_59_6 = var_59_0:getShipById(iter_59_1)

		if var_59_6 then
			local var_59_7 = var_59_6:getShipType()
			local var_59_8 = var_59_5.VAN_SONAR_PROPERTY[var_59_7]

			if var_59_8 then
				local var_59_9 = (var_59_6:getShipProperties()[AttributeType.AntiSub] or 0) / var_59_8.a - var_59_8.b

				var_59_1 = math.max(var_59_1, Mathf.Clamp(var_59_9, var_59_8.minRange, var_59_8.maxRange))
			end

			if table.contains(TeamType.MainShipType, var_59_7) then
				var_59_4 = var_59_4 + (var_59_6:getShipProperties()[AttributeType.AntiSub] or 0)
			end

			for iter_59_2, iter_59_3 in ipairs(var_59_6:getActiveEquipments()) do
				if iter_59_3 then
					var_59_3 = var_59_3 + (iter_59_3:getConfig("equip_parameters").range or 0)
				end
			end
		end
	end

	if var_59_1 ~= 0 then
		local var_59_10 = var_59_5.MAIN_SONAR_PROPERTY
		local var_59_11 = var_59_4 / var_59_10.a

		var_59_2 = var_59_3 + Mathf.Clamp(var_59_11, var_59_10.minRange, var_59_10.maxRange)
	end

	return var_59_1 + var_59_2
end

function var_0_0.getInvestSums(arg_60_0)
	local var_60_0 = getProxy(BayProxy)

	local function var_60_1(arg_61_0, arg_61_1)
		local var_61_0 = var_60_0:getShipById(arg_61_1):getProperties(arg_60_0:getCommanders())

		return arg_61_0 + var_61_0[AttributeType.Air] + var_61_0[AttributeType.Dodge]
	end

	local var_60_2 = _.reduce(arg_60_0.ships, 0, var_60_1)

	return math.pow(var_60_2, 0.6666666666666666)
end

function var_0_0.ExistActNpcShip(arg_62_0)
	local var_62_0 = getProxy(BayProxy)

	for iter_62_0, iter_62_1 in ipairs(arg_62_0.ships) do
		local var_62_1 = var_62_0:RawGetShipById(iter_62_1)

		if var_62_1 and var_62_1:isActivityNpc() then
			return true
		end
	end

	return false
end

function var_0_0.GetName(arg_63_0)
	return arg_63_0.name == "" and var_0_0.DEFAULT_NAME[arg_63_0.id] or arg_63_0.name
end

return var_0_0

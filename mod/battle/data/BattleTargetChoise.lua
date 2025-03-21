ys = ys or {}

local var_0_0 = ys.Battle.BattleConfig
local var_0_1 = ys.Battle.BattleAttr
local var_0_2 = ys.Battle.BattleFormulas
local var_0_3 = {}

ys.Battle.BattleTargetChoise = var_0_3

function var_0_3.TargetNil()
	return nil
end

function var_0_3.TargetNull()
	return {}
end

function var_0_3.TargetAll()
	return ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
end

function var_0_3.TargetEntityUnit()
	local var_4_0 = {}
	local var_4_1 = ys.Battle.BattleDataProxy.GetInstance():GetUnitList()

	for iter_4_0, iter_4_1 in pairs(var_4_1) do
		if not iter_4_1:IsSpectre() then
			var_4_0[#var_4_0 + 1] = iter_4_1
		end
	end

	return var_4_0
end

function var_0_3.TargetSpectreUnit(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {}
	local var_5_1 = ys.Battle.BattleDataProxy.GetInstance():GetSpectreShipList()

	for iter_5_0, iter_5_1 in pairs(var_5_1) do
		var_5_0[#var_5_0 + 1] = iter_5_1
	end

	return var_5_0
end

function var_0_3.TargetTemplate(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1.targetTemplateIDList or {
		arg_6_1.targetTemplateID
	}
	local var_6_1 = arg_6_2 or var_0_3.TargetEntityUnit()
	local var_6_2 = {}
	local var_6_3 = arg_6_0:GetIFF()

	for iter_6_0, iter_6_1 in pairs(var_6_1) do
		local var_6_4 = iter_6_1:GetTemplateID()
		local var_6_5 = iter_6_1:GetIFF()

		if table.contains(var_6_0, var_6_4) and var_6_3 == var_6_5 then
			var_6_2[#var_6_2 + 1] = iter_6_1
		end
	end

	return var_6_2
end

function var_0_3.TargetNationality(arg_7_0, arg_7_1, arg_7_2)
	if not arg_7_1.targetTemplateIDList then
		({})[1] = arg_7_1.targetTemplateID
	end

	local var_7_0 = arg_7_2 or ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
	local var_7_1 = {}
	local var_7_2 = arg_7_1.nationality
	local var_7_3 = type(var_7_2)

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		if var_7_3 == "number" then
			if iter_7_1:GetTemplate().nationality == var_7_2 then
				var_7_1[#var_7_1 + 1] = iter_7_1
			end
		elseif var_7_3 == "table" and table.contains(var_7_2, iter_7_1:GetTemplate().nationality) then
			var_7_1[#var_7_1 + 1] = iter_7_1
		end
	end

	return var_7_1
end

function var_0_3.TargetShipType(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_2 or var_0_3.TargetEntityUnit()
	local var_8_1 = {}
	local var_8_2 = arg_8_1.ship_type_list

	for iter_8_0, iter_8_1 in pairs(var_8_0) do
		local var_8_3 = iter_8_1:GetTemplate().type

		if table.contains(var_8_2, var_8_3) then
			var_8_1[#var_8_1 + 1] = iter_8_1
		end
	end

	return var_8_1
end

function var_0_3.TargetShipTag(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_2 or var_0_3.TargetEntityUnit()
	local var_9_1 = {}
	local var_9_2 = arg_9_1.ship_tag_list

	for iter_9_0, iter_9_1 in pairs(var_9_0) do
		if iter_9_1:ContainsLabelTag(var_9_2) then
			var_9_1[#var_9_1 + 1] = iter_9_1
		end
	end

	return var_9_1
end

function var_0_3.TargetShipArmor(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_2 or var_0_3.TargetEntityUnit()
	local var_10_1 = {}
	local var_10_2 = arg_10_1.armor_type

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		if iter_10_1:GetAttrByName("armorType") == var_10_2 then
			var_10_1[#var_10_1 + 1] = iter_10_1
		end
	end

	return var_10_1
end

function var_0_3.getShipListByIFF(arg_11_0)
	local var_11_0 = ys.Battle.BattleDataProxy.GetInstance()
	local var_11_1

	if arg_11_0 == var_0_0.FRIENDLY_CODE then
		var_11_1 = var_11_0:GetFriendlyShipList()
	elseif arg_11_0 == var_0_0.FOE_CODE then
		var_11_1 = var_11_0:GetFoeShipList()
	end

	return var_11_1
end

function var_0_3.TargetAllHelp(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = {}

	if arg_12_0 then
		arg_12_1 = arg_12_1 or {}

		local var_12_1 = arg_12_1.exceptCaster
		local var_12_2 = arg_12_0:GetUniqueID()
		local var_12_3 = arg_12_0:GetIFF()
		local var_12_4 = arg_12_2 or var_0_3.getShipListByIFF(var_12_3)

		for iter_12_0, iter_12_1 in pairs(var_12_4) do
			local var_12_5 = iter_12_1:GetUniqueID()

			if iter_12_1:IsAlive() and iter_12_1:GetIFF() == var_12_3 and (not var_12_1 or var_12_5 ~= var_12_2) then
				var_12_0[#var_12_0 + 1] = iter_12_1
			end
		end
	end

	return var_12_0
end

function var_0_3.TargetHelpLeastHP(arg_13_0, arg_13_1, arg_13_2)
	arg_13_1 = arg_13_1 or {}

	local var_13_0
	local var_13_1 = arg_13_1.targetMaxHPRatio

	if arg_13_0 then
		local var_13_2 = arg_13_2 or var_0_3.getShipListByIFF(arg_13_0:GetIFF())
		local var_13_3 = 9999999999

		for iter_13_0, iter_13_1 in pairs(var_13_2) do
			if iter_13_1:IsAlive() and var_13_3 > iter_13_1:GetCurrentHP() and (not var_13_1 or var_13_1 >= iter_13_1:GetHPRate()) then
				var_13_0 = iter_13_1
				var_13_3 = iter_13_1:GetCurrentHP()
			end
		end
	end

	return {
		var_13_0
	}
end

function var_0_3.TargetHelpLeastHPRatio(arg_14_0, arg_14_1, arg_14_2)
	arg_14_1 = arg_14_1 or {}

	local var_14_0

	if arg_14_0 then
		local var_14_1 = 100
		local var_14_2 = arg_14_2 or var_0_3.getShipListByIFF(arg_14_0:GetIFF())

		for iter_14_0, iter_14_1 in pairs(var_14_2) do
			if iter_14_1:IsAlive() and var_14_1 > iter_14_1:GetHPRate() then
				var_14_0 = iter_14_1
				var_14_1 = iter_14_1:GetHPRate()
			end
		end
	end

	return {
		var_14_0
	}
end

function var_0_3.TargetHighestHP(arg_15_0, arg_15_1, arg_15_2)
	arg_15_1 = arg_15_1 or {}

	local var_15_0

	if arg_15_0 then
		local var_15_1 = arg_15_2 or var_0_3.TargetEntityUnit()
		local var_15_2 = 1

		for iter_15_0, iter_15_1 in pairs(var_15_1) do
			if iter_15_1:IsAlive() and var_15_2 < iter_15_1:GetCurrentHP() then
				var_15_0 = iter_15_1
				var_15_2 = iter_15_1:GetCurrentHP()
			end
		end
	end

	return {
		var_15_0
	}
end

function var_0_3.TargetLowestHPRatio(arg_16_0, arg_16_1, arg_16_2)
	arg_16_1 = arg_16_1 or {}

	local var_16_0
	local var_16_1 = arg_16_2 or var_0_3.TargetEntityUnit()
	local var_16_2 = 1

	for iter_16_0, iter_16_1 in pairs(var_16_1) do
		local var_16_3 = iter_16_1:GetHPRate()

		if iter_16_1:IsAlive() and var_16_3 < var_16_2 and var_16_3 > 0 then
			var_16_0 = iter_16_1
			var_16_2 = var_16_3
		end
	end

	return {
		var_16_0
	}
end

function var_0_3.TargetLowestHP(arg_17_0, arg_17_1, arg_17_2)
	arg_17_1 = arg_17_1 or {}

	local var_17_0
	local var_17_1 = arg_17_2 or var_0_3.TargetEntityUnit()
	local var_17_2 = 9999999999

	for iter_17_0, iter_17_1 in pairs(var_17_1) do
		local var_17_3 = iter_17_1:GetCurrentHP()

		if iter_17_1:IsAlive() and var_17_3 < var_17_2 and var_17_3 > 0 then
			var_17_0 = iter_17_1
			var_17_2 = var_17_3
		end
	end

	return {
		var_17_0
	}
end

function var_0_3.TargetHighestHPRatio(arg_18_0, arg_18_1, arg_18_2)
	arg_18_1 = arg_18_1 or {}

	local var_18_0
	local var_18_1 = arg_18_2 or var_0_3.TargetEntityUnit()
	local var_18_2 = 0

	for iter_18_0, iter_18_1 in pairs(var_18_1) do
		if iter_18_1:IsAlive() and var_18_2 < iter_18_1:GetHPRate() then
			var_18_0 = iter_18_1
			var_18_2 = iter_18_1:GetHPRate()
		end
	end

	return {
		var_18_0
	}
end

function var_0_3.TargetAttrCompare(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = {}
	local var_19_1 = arg_19_2 or var_0_3.TargetEntityUnit()

	for iter_19_0, iter_19_1 in pairs(var_19_1) do
		if iter_19_1:IsAlive() and var_0_2.parseCompareUnitAttr(arg_19_1.attrCompare, iter_19_1, arg_19_0) then
			table.insert(var_19_0, iter_19_1)
		end
	end

	return var_19_0
end

function var_0_3.TargetTempCompare(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = {}
	local var_20_1 = arg_20_2 or var_0_3.TargetEntityUnit()

	for iter_20_0, iter_20_1 in pairs(var_20_1) do
		if iter_20_1:IsAlive() and var_0_2.parseCompareUnitTemplate(arg_20_1.tempCompare, iter_20_1, arg_20_0) then
			table.insert(var_20_0, iter_20_1)
		end
	end

	return var_20_0
end

function var_0_3.TargetHPCompare(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = {}
	local var_21_1 = arg_21_2 or var_0_3.TargetEntityUnit()

	if arg_21_0 then
		local var_21_2 = arg_21_0:GetHP()

		for iter_21_0, iter_21_1 in ipairs(var_21_1) do
			if var_21_2 > iter_21_1:GetHP() then
				var_21_0[#var_21_0 + 1] = iter_21_1
			end
		end
	end

	return var_21_0
end

function var_0_3.TargetHPRatioLowerThan(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = {}
	local var_22_1 = arg_22_1.hpRatioList[1]
	local var_22_2 = arg_22_2 or var_0_3.TargetEntityUnit()

	for iter_22_0, iter_22_1 in ipairs(var_22_2) do
		if var_22_1 > iter_22_1:GetHP() then
			var_22_0[#var_22_0 + 1] = iter_22_1
		end
	end

	return var_22_0
end

function var_0_3.TargetNationalityFriendly(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = {}

	if arg_23_0 then
		local var_23_1 = arg_23_1.nationality
		local var_23_2 = arg_23_2 or var_0_3.TargetAllHelp(arg_23_0, arg_23_1)

		for iter_23_0, iter_23_1 in pairs(var_23_2) do
			if iter_23_1:GetTemplate().nationality == var_23_1 then
				var_23_0[#var_23_0 + 1] = iter_23_1
			end
		end
	end

	return var_23_0
end

function var_0_3.TargetNationalityFoe(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = {}

	if arg_24_0 then
		local var_24_1 = arg_24_1.nationality
		local var_24_2 = arg_24_2 or var_0_3.TargetAllHarm(arg_24_0, arg_24_1)

		for iter_24_0, iter_24_1 in pairs(var_24_2) do
			if iter_24_1:GetTemplate().nationality == var_24_1 then
				var_24_0[#var_24_0 + 1] = iter_24_1
			end
		end
	end

	return var_24_0
end

function var_0_3.TargetShipTypeFriendly(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = {}

	if arg_25_0 then
		local var_25_1 = arg_25_1.ship_type_list
		local var_25_2 = arg_25_2 or var_0_3.TargetAllHelp(arg_25_0, arg_25_1)

		for iter_25_0, iter_25_1 in pairs(var_25_2) do
			local var_25_3 = iter_25_1:GetTemplate().type

			if table.contains(var_25_1, var_25_3) then
				var_25_0[#var_25_0 + 1] = iter_25_1
			end
		end
	end

	return var_25_0
end

function var_0_3.TargetSelf(arg_26_0)
	return {
		arg_26_0
	}
end

function var_0_3.TargetAllHarm(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = {}
	local var_27_1
	local var_27_2 = ys.Battle.BattleDataProxy.GetInstance()

	if arg_27_2 then
		var_27_1 = arg_27_2
	else
		local var_27_3 = arg_27_0:GetIFF()

		if var_27_3 == var_0_0.FRIENDLY_CODE then
			var_27_1 = var_27_2:GetFoeShipList()
		elseif var_27_3 == var_0_0.FOE_CODE then
			var_27_1 = var_27_2:GetFriendlyShipList()
		end
	end

	local var_27_4, var_27_5, var_27_6, var_27_7 = var_27_2:GetFieldBound()

	if var_27_1 then
		for iter_27_0, iter_27_1 in pairs(var_27_1) do
			if iter_27_1:IsAlive() and var_27_7 > iter_27_1:GetPosition().x and iter_27_1:GetCurrentOxyState() ~= ys.Battle.BattleConst.OXY_STATE.DIVE then
				var_27_0[#var_27_0 + 1] = iter_27_1
			end
		end
	end

	return var_27_0
end

function var_0_3.TargetAllFoe(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = {}
	local var_28_1
	local var_28_2 = ys.Battle.BattleDataProxy.GetInstance()

	if arg_28_2 then
		var_28_1 = arg_28_2
	else
		local var_28_3 = arg_28_0:GetIFF()

		if var_28_3 == var_0_0.FRIENDLY_CODE then
			var_28_1 = var_28_2:GetFoeShipList()
		elseif var_28_3 == var_0_0.FOE_CODE then
			var_28_1 = var_28_2:GetFriendlyShipList()
		end
	end

	local var_28_4, var_28_5, var_28_6, var_28_7 = var_28_2:GetFieldBound()

	if var_28_1 then
		for iter_28_0, iter_28_1 in pairs(var_28_1) do
			if iter_28_1:IsAlive() and var_28_7 > iter_28_1:GetPosition().x then
				var_28_0[#var_28_0 + 1] = iter_28_1
			end
		end
	end

	return var_28_0
end

function var_0_3.TargetFoeUncloak(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = {}
	local var_29_1
	local var_29_2 = ys.Battle.BattleDataProxy.GetInstance()

	if arg_29_2 then
		var_29_1 = arg_29_2
	else
		local var_29_3 = arg_29_0:GetIFF()

		if var_29_3 == var_0_0.FRIENDLY_CODE then
			var_29_1 = var_29_2:GetFoeShipList()
		elseif var_29_3 == var_0_0.FOE_CODE then
			var_29_1 = var_29_2:GetFriendlyShipList()
		end
	end

	local var_29_4, var_29_5, var_29_6, var_29_7 = var_29_2:GetFieldBound()

	if var_29_1 then
		for iter_29_0, iter_29_1 in pairs(var_29_1) do
			if iter_29_1:IsAlive() and var_29_7 > iter_29_1:GetPosition().x and not var_0_1.IsCloak(iter_29_1) and iter_29_1:GetCurrentOxyState() ~= ys.Battle.BattleConst.OXY_STATE.DIVE then
				var_29_0[#var_29_0 + 1] = iter_29_1
			end
		end
	end

	return var_29_0
end

function var_0_3.TargetCloakState(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = {}
	local var_30_1 = arg_30_1.cloak or 1
	local var_30_2 = arg_30_2 or var_0_3.TargetEntityUnit()

	for iter_30_0, iter_30_1 in ipairs(var_30_2) do
		if var_0_1.GetCurrent(iter_30_1, "isCloak") == var_30_1 then
			var_30_0[#var_30_0 + 1] = iter_30_1
		end
	end

	return var_30_0
end

function var_0_3.TargetFaintState(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = {}
	local var_31_1 = arg_31_1.faint or 1
	local var_31_2 = arg_31_2 or var_0_3.TargetEntityUnit()

	for iter_31_0, iter_31_1 in ipairs(var_31_2) do
		local var_31_3 = iter_31_1:GetAimBias()

		if var_31_1 == 1 then
			if var_31_3 and var_31_3:IsFaint() then
				var_31_0[#var_31_0 + 1] = iter_31_1
			end
		elseif var_31_1 == 0 and (not var_31_3 or not var_31_3:IsFaint()) then
			var_31_0[#var_31_0 + 1] = iter_31_1
		end
	end

	return var_31_0
end

function var_0_3.TargetHarmNearest(arg_32_0, arg_32_1, arg_32_2)
	arg_32_1 = arg_32_1 or {}

	local var_32_0 = arg_32_1.range or 9999999999
	local var_32_1
	local var_32_2 = arg_32_2 or var_0_3.TargetFoeUncloak(arg_32_0)

	for iter_32_0, iter_32_1 in ipairs(var_32_2) do
		local var_32_3 = arg_32_0:GetDistance(iter_32_1)

		if var_32_3 < var_32_0 then
			var_32_0 = var_32_3
			var_32_1 = iter_32_1
		end
	end

	return {
		var_32_1
	}
end

function var_0_3.TargetHarmFarthest(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = 0
	local var_33_1
	local var_33_2 = arg_33_2 or var_0_3.TargetFoeUncloak(arg_33_0)

	for iter_33_0, iter_33_1 in ipairs(var_33_2) do
		local var_33_3 = arg_33_0:GetDistance(iter_33_1)

		if var_33_0 < var_33_3 then
			var_33_0 = var_33_3
			var_33_1 = iter_33_1
		end
	end

	return {
		var_33_1
	}
end

function var_0_3.TargetHarmRandom(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_2 or var_0_3.TargetFoeUncloak(arg_34_0)

	if #var_34_0 > 0 then
		local var_34_1 = math.random(#var_34_0)

		return {
			var_34_0[var_34_1]
		}
	else
		return {}
	end
end

function var_0_3.TargetHarmRandomByWeight(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_2 or var_0_3.TargetFoeUncloak(arg_35_0)
	local var_35_1 = {}
	local var_35_2 = -9999

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		local var_35_3 = iter_35_1:GetTargetedPriority() or 0

		if var_35_3 == var_35_2 then
			var_35_1[#var_35_1 + 1] = iter_35_1
		elseif var_35_2 < var_35_3 then
			var_35_1 = {
				iter_35_1
			}
			var_35_2 = var_35_3
		end
	end

	if #var_35_1 > 0 then
		local var_35_4 = math.random(#var_35_1)

		return {
			var_35_1[var_35_4]
		}
	else
		return {}
	end
end

function var_0_3.TargetWeightiest(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_2 or var_0_3.TargetEntityUnit()
	local var_36_1 = {}
	local var_36_2 = -9999

	for iter_36_0, iter_36_1 in ipairs(var_36_0) do
		local var_36_3 = iter_36_1:GetTargetedPriority() or 0

		if var_36_3 == var_36_2 then
			var_36_1[#var_36_1 + 1] = iter_36_1
		elseif var_36_2 < var_36_3 then
			var_36_1 = {
				iter_36_1
			}
			var_36_2 = var_36_3
		end
	end

	return var_36_1
end

function var_0_3.TargetRandom(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_2 or var_0_3.TargetEntityUnit()
	local var_37_1 = arg_37_1.randomCount or 1

	return (Mathf.MultiRandom(var_37_0, var_37_1))
end

function var_0_3.TargetInsideArea(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_2 or var_0_3.TargetAllHarm(arg_38_0)
	local var_38_1 = arg_38_1.dir or ys.Battle.BattleConst.UnitDir.RIGHT
	local var_38_2 = arg_38_1.lineX
	local var_38_3 = {}

	if var_38_1 == ys.Battle.BattleConst.UnitDir.RIGHT then
		for iter_38_0, iter_38_1 in ipairs(var_38_0) do
			if var_38_2 <= iter_38_1:GetPosition().x then
				table.insert(var_38_3, iter_38_1)
			end
		end
	elseif var_38_1 == ys.Battle.BattleConst.UnitDir.LEFT then
		for iter_38_2, iter_38_3 in ipairs(var_38_0) do
			if var_38_2 >= iter_38_3:GetPosition().x then
				table.insert(var_38_3, iter_38_3)
			end
		end
	end

	return var_38_3
end

function var_0_3.TargetAircraftHelp(arg_39_0)
	local var_39_0 = ys.Battle.BattleDataProxy.GetInstance()
	local var_39_1 = {}
	local var_39_2 = arg_39_0:GetIFF()

	for iter_39_0, iter_39_1 in pairs(var_39_0:GetAircraftList()) do
		if var_39_2 == iter_39_1:GetIFF() then
			var_39_1[#var_39_1 + 1] = iter_39_1
		end
	end

	return var_39_1
end

function var_0_3.TargetAircraftHarm(arg_40_0)
	local var_40_0 = ys.Battle.BattleDataProxy.GetInstance()
	local var_40_1 = {}
	local var_40_2 = arg_40_0:GetIFF()

	for iter_40_0, iter_40_1 in pairs(var_40_0:GetAircraftList()) do
		if var_40_2 ~= iter_40_1:GetIFF() and iter_40_1:IsVisitable() then
			var_40_1[#var_40_1 + 1] = iter_40_1
		end
	end

	return var_40_1
end

function var_0_3.TargetAircraftGB(arg_41_0)
	local var_41_0 = ys.Battle.BattleDataProxy.GetInstance()
	local var_41_1 = {}
	local var_41_2 = arg_41_0:GetIFF()

	for iter_41_0, iter_41_1 in pairs(var_41_0:GetAircraftList()) do
		if var_41_2 ~= iter_41_1:GetIFF() and iter_41_1:IsVisitable() and iter_41_1:GetMotherUnit() == nil then
			var_41_1[#var_41_1 + 1] = iter_41_1
		end
	end

	return var_41_1
end

function var_0_3.TargetDiveState(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_1 and arg_42_1.diveState or ys.Battle.BattleConst.OXY_STATE.DIVE
	local var_42_1 = arg_42_2 or var_0_3.TargetEntityUnit()
	local var_42_2 = {}

	for iter_42_0, iter_42_1 in pairs(var_42_1) do
		if var_42_0 == iter_42_1:GetCurrentOxyState() then
			var_42_2[#var_42_2 + 1] = iter_42_1
		end
	end

	return var_42_2
end

function var_0_3.TargetDetectedUnit(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_2 or var_0_3.TargetEntityUnit()
	local var_43_1 = {}

	for iter_43_0, iter_43_1 in pairs(var_43_0) do
		if iter_43_1:GetDiveDetected() then
			var_43_1[#var_43_1 + 1] = iter_43_1
		end
	end

	return var_43_1
end

function var_0_3.TargetFatalDamageSrc(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_2 or var_0_3.TargetEntityUnit()
	local var_44_1 = arg_44_0:GetDeathSrcID()
	local var_44_2 = {}

	if var_44_1 then
		for iter_44_0, iter_44_1 in pairs(var_44_0) do
			if var_44_1 == iter_44_1:GetUniqueID() and iter_44_1:IsAlive() then
				var_44_2[#var_44_2 + 1] = iter_44_1
			end
		end
	end

	return var_44_2
end

function var_0_3.TargetAllHarmBullet(arg_45_0)
	local var_45_0 = ys.Battle.BattleDataProxy.GetInstance()
	local var_45_1 = {}
	local var_45_2 = arg_45_0:GetIFF()

	for iter_45_0, iter_45_1 in pairs(var_45_0:GetBulletList()) do
		if var_45_2 ~= iter_45_1:GetIFF() then
			var_45_1[#var_45_1 + 1] = iter_45_1
		end
	end

	return var_45_1
end

function var_0_3.TargetAllHarmBulletByType(arg_46_0, arg_46_1)
	local var_46_0 = ys.Battle.BattleDataProxy.GetInstance()
	local var_46_1 = {}
	local var_46_2 = arg_46_0:GetIFF()

	for iter_46_0, iter_46_1 in pairs(var_46_0:GetBulletList()) do
		if var_46_2 ~= iter_46_1:GetIFF() and iter_46_1:GetType() == arg_46_1 then
			var_46_1[#var_46_1 + 1] = iter_46_1
		end
	end

	return var_46_1
end

function var_0_3.TargetAllHarmTorpedoBullet(arg_47_0)
	return var_0_3.TargetAllHarmBulletByType(arg_47_0, ys.Battle.BattleConst.BulletType.TORPEDO)
end

function var_0_3.TargetFleetIndex(arg_48_0, arg_48_1)
	local var_48_0

	if arg_48_0 then
		var_48_0 = arg_48_0:GetIFF()
	else
		var_48_0 = var_0_0.FRIENDLY_CODE
	end

	local var_48_1 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(var_48_0)
	local var_48_2 = TeamType.TeamPos
	local var_48_3 = arg_48_1.fleetPos
	local var_48_4 = {}
	local var_48_5 = var_48_1:GetUnitList()
	local var_48_6 = var_48_1:GetScoutList()
	local var_48_7 = arg_48_1.exceptCaster

	if var_48_7 then
		local var_48_8 = arg_48_0:GetUniqueID()
	end

	for iter_48_0, iter_48_1 in ipairs(var_48_5) do
		local var_48_9 = iter_48_1:GetUniqueID()

		if var_48_7 and var_48_9 == casterID then
			-- block empty
		elseif iter_48_1 == var_48_1:GetFlagShip() then
			if var_48_3 == var_48_2.FLAG_SHIP then
				table.insert(var_48_4, iter_48_1)
			end
		elseif iter_48_1 == var_48_6[1] then
			if var_48_3 == var_48_2.LEADER then
				table.insert(var_48_4, iter_48_1)
			end
		elseif #var_48_6 == 3 and iter_48_1 == var_48_6[2] then
			if var_48_3 == var_48_2.CENTER then
				table.insert(var_48_4, iter_48_1)
			end
		elseif iter_48_1 == var_48_6[#var_48_6] then
			if var_48_3 == var_48_2.REAR then
				table.insert(var_48_4, iter_48_1)
			end
		elseif iter_48_1:IsMainFleetUnit() and iter_48_1:GetMainUnitIndex() == 2 then
			if var_48_3 == var_48_2.UPPER_CONSORT then
				table.insert(var_48_4, iter_48_1)
			end
		elseif iter_48_1:IsMainFleetUnit() and iter_48_1:GetMainUnitIndex() == 3 and var_48_3 == var_48_2.LOWER_CONSORT then
			table.insert(var_48_4, iter_48_1)
		end
	end

	local var_48_10 = var_48_1:GetSubList()

	for iter_48_2, iter_48_3 in ipairs(var_48_5) do
		if iter_48_2 == 1 then
			if var_48_3 == var_48_2.SUB_LEADER then
				table.insert(var_48_4, iter_48_3)
			end
		elseif var_48_3 == var_48_2.SUB_CONSORT then
			table.insert(var_48_4, iter_48_3)
		end
	end

	return var_48_4
end

function var_0_3.TargetPlayerVanguardFleet(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(arg_49_0:GetIFF()):GetScoutList()

	if not arg_49_2 then
		return var_49_0
	else
		local var_49_1 = #arg_49_2

		while var_49_1 > 0 do
			if not table.contains(var_49_0, arg_49_2[var_49_1]) then
				table.remove(arg_49_2, var_49_1)
			end

			var_49_1 = var_49_1 - 1
		end

		return arg_49_2
	end
end

function var_0_3.TargetPlayerMainFleet(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(arg_50_0:GetIFF()):GetMainList()

	if not arg_50_2 then
		return var_50_0
	else
		local var_50_1 = #arg_50_2

		while var_50_1 > 0 do
			if not table.contains(var_50_0, arg_50_2[var_50_1]) then
				table.remove(arg_50_2, var_50_1)
			end

			var_50_1 = var_50_1 - 1
		end

		return arg_50_2
	end
end

function var_0_3.TargetPlayerFlagShip(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(arg_51_0:GetIFF())

	return {
		var_51_0:GetFlagShip()
	}
end

function var_0_3.TargetPlayerLeaderShip(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(arg_52_0:GetIFF())

	return {
		var_52_0:GetLeaderShip()
	}
end

function var_0_3.TargetEnemyLeaderShip(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = arg_53_0:GetIFF() * -1
	local var_53_1 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(var_53_0)

	return {
		var_53_1:GetLeaderShip()
	}
end

function var_0_3.TargetPlayerByType(arg_54_0, arg_54_1)
	local var_54_0 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(arg_54_0:GetIFF()):GetUnitList()
	local var_54_1 = {}
	local var_54_2 = arg_54_1.shipType

	for iter_54_0, iter_54_1 in ipairs(var_54_0) do
		if iter_54_1:GetTemplate().type == var_54_2 then
			var_54_1[#var_54_1 + 1] = iter_54_1
		end
	end

	return var_54_1
end

function var_0_3.TargetPlayerAidUnit(arg_55_0, arg_55_1)
	local var_55_0 = ys.Battle.BattleDataProxy.GetInstance():GetAidUnit()
	local var_55_1 = {}

	for iter_55_0, iter_55_1 in pairs(var_55_0) do
		table.insert(var_55_1, iter_55_1)
	end

	return var_55_1
end

function var_0_3.TargetDamageSource(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = arg_56_2 or var_0_3.TargetAllFoe(arg_56_0)
	local var_56_1 = {}

	for iter_56_0, iter_56_1 in pairs(var_56_0) do
		if iter_56_1:GetUniqueID() == arg_56_1.damageSourceID then
			table.insert(var_56_1, iter_56_1)

			break
		end
	end

	return var_56_1
end

function var_0_3.TargetRarity(arg_57_0, arg_57_1, arg_57_2)
	local var_57_0 = arg_57_2 or var_0_3.TargetAllHelp(arg_57_0)
	local var_57_1 = {}

	for iter_57_0, iter_57_1 in ipairs(var_57_0) do
		if iter_57_1:GetRarity() == arg_57_1.rarity then
			table.insert(var_57_1, iter_57_1)
		end
	end

	return var_57_1
end

function var_0_3.TargetIllustrator(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = arg_58_2 or var_0_3.TargetAllHelp(arg_58_0)
	local var_58_1 = {}

	for iter_58_0, iter_58_1 in ipairs(var_58_0) do
		if ys.Battle.BattleDataFunction.GetPlayerShipSkinDataFromID(iter_58_1:GetSkinID()).illustrator == arg_58_1.illustrator then
			table.insert(var_58_1, iter_58_1)
		end
	end

	return var_58_1
end

function var_0_3.TargetTeam(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = ys.Battle.BattleDataProxy.GetInstance():GetFleetByIFF(arg_59_0:GetIFF())
	local var_59_1 = {}
	local var_59_2 = TeamType.TeamTypeIndex[arg_59_1.teamIndex]

	if var_59_2 == TeamType.Vanguard then
		var_59_1 = var_59_0:GetScoutList()
	elseif var_59_2 == TeamType.Main then
		var_59_1 = var_59_0:GetMainList()
	elseif var_59_2 == TeamType.Submarine then
		var_59_1 = var_59_0:GetSubList()
	end

	local var_59_3 = {}

	for iter_59_0, iter_59_1 in ipairs(var_59_1) do
		if not arg_59_2 or table.contains(arg_59_2, iter_59_1) then
			table.insert(var_59_3, iter_59_1)
		end
	end

	return var_59_3
end

function var_0_3.TargetGroup(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = arg_60_1.groupIDList
	local var_60_1 = arg_60_2 or var_0_3.TargetAllHelp(arg_60_0)
	local var_60_2 = {}
	local var_60_3 = arg_60_0:GetIFF()

	for iter_60_0, iter_60_1 in ipairs(var_60_1) do
		local var_60_4 = iter_60_1:GetTemplateID()
		local var_60_5 = ys.Battle.BattleDataFunction.GetPlayerShipModelFromID(var_60_4).group_type
		local var_60_6 = iter_60_1:GetIFF()

		if table.contains(var_60_0, var_60_5) and var_60_3 == var_60_6 then
			var_60_2[#var_60_2 + 1] = iter_60_1
		end
	end

	return var_60_2
end

function var_0_3.LegalTarget(arg_61_0)
	local var_61_0 = {}
	local var_61_1
	local var_61_2 = ys.Battle.BattleDataProxy.GetInstance()
	local var_61_3, var_61_4, var_61_5, var_61_6 = var_61_2:GetFieldBound()
	local var_61_7 = var_61_2:GetUnitList()
	local var_61_8 = arg_61_0:GetIFF()

	for iter_61_0, iter_61_1 in pairs(var_61_7) do
		if iter_61_1:IsAlive() and iter_61_1:GetIFF() ~= var_61_8 and var_61_6 > iter_61_1:GetPosition().x and not iter_61_1:IsSpectre() then
			var_61_0[#var_61_0 + 1] = iter_61_1
		end
	end

	return var_61_0
end

function var_0_3.LegalWeaponTarget(arg_62_0)
	local var_62_0 = {}
	local var_62_1
	local var_62_2 = ys.Battle.BattleDataProxy.GetInstance():GetUnitList()
	local var_62_3 = arg_62_0:GetIFF()

	for iter_62_0, iter_62_1 in pairs(var_62_2) do
		if iter_62_1:GetIFF() ~= var_62_3 and not iter_62_1:IsSpectre() then
			var_62_0[#var_62_0 + 1] = iter_62_1
		end
	end

	return var_62_0
end

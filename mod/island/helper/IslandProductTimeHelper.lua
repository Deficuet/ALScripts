local var_0_0 = class("IslandProductTimeHelper")

function var_0_0.GetSpeedAddtionTypeByPlaceId(arg_1_0)
	return switch(arg_1_0, {
		[IslandProductConst.FellingPlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_FELLING
		end,
		[IslandProductConst.MinePlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_MINING
		end,
		[IslandProductConst.FarmlandPlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_FARM
		end,
		[IslandProductConst.OrchardPlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_ORCHARD
		end,
		[IslandProductConst.GardenPlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_GARDEN
		end
	}, function()
		return nil
	end)
end

function var_0_0.GetAllAddPercent(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = var_0_0.GetAttributeAddPercent(arg_8_0, arg_8_2)
	local var_8_1 = var_0_0.GetPlaceAddPercent(arg_8_0, arg_8_1)
	local var_8_2 = var_0_0.GetSkillAddPercent(arg_8_0, arg_8_1)

	return var_8_0, var_8_1, var_8_2
end

function var_0_0.GetAttributeAddPercent(arg_9_0, arg_9_1)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_9_0)
	local var_9_1 = var_9_0:GetAttr(IslandShipAttr.ATTRS[arg_9_1])
	local var_9_2 = var_9_0:GetAttrGradeByValue(var_9_1)

	return pg.island_chara_att[var_9_2].effect
end

function var_0_0.GetPlaceAddPercent(arg_10_0, arg_10_1)
	local var_10_0 = 0
	local var_10_1 = getProxy(IslandProxy):GetIsland()
	local var_10_2 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_10_1)

	if var_10_2 then
		var_10_0 = var_10_0 + var_10_1:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_10_2)
	end

	return var_10_0
end

function var_0_0.GetSkillAddPercent(arg_11_0, arg_11_1)
	local var_11_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_11_0)
	local var_11_1 = 0

	for iter_11_0, iter_11_1 in ipairs(var_11_0:GetSkill():GetUnlockShipEffectIds()) do
		local var_11_2 = pg.island_buff_template[iter_11_1]

		if var_11_2.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_11_3 = var_11_2.type_use
			local var_11_4 = var_11_3[1]

			if underscore.any(var_11_4, function(arg_12_0)
				return arg_12_0 == arg_11_1
			end) then
				var_11_1 = var_11_1 + var_11_3[2]
			end
		end
	end

	return var_11_1
end

function var_0_0.CalculateTimeToProductFormula(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	local var_13_0 = getProxy(IslandProxy):GetIsland()
	local var_13_1 = var_13_0:GetCharacterAgency():GetShipById(arg_13_0)
	local var_13_2 = pg.island_set.base_efficiency.key_value_int
	local var_13_3 = pg.island_formula[arg_13_1]
	local var_13_4 = var_13_3.attribute
	local var_13_5 = 0

	for iter_13_0, iter_13_1 in ipairs(var_13_1:GetSkill():GetUnlockShipEffectIds()) do
		local var_13_6 = pg.island_buff_template[iter_13_1]

		if var_13_6.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_13_7 = var_13_6.type_use
			local var_13_8 = var_13_7[1]

			if underscore.any(var_13_8, function(arg_14_0)
				return arg_14_0 == arg_13_3
			end) then
				var_13_5 = var_13_5 + var_13_7[2]
			end
		end
	end

	local var_13_9 = 0
	local var_13_10 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_13_3)

	if var_13_10 then
		var_13_9 = var_13_9 + var_13_0:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_13_10)
	end

	local var_13_11 = 0
	local var_13_12 = var_13_1:GetAttr(IslandShipAttr.ATTRS[var_13_4])
	local var_13_13 = var_13_1:GetAttrGradeByValue(var_13_12)
	local var_13_14 = pg.island_chara_att[var_13_13].effect
	local var_13_15 = var_13_5 + var_13_9 + var_13_11
	local var_13_16 = var_13_1:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	table.sort(var_13_16, function(arg_15_0, arg_15_1)
		local var_15_0 = arg_15_0:GetEndTime()
		local var_15_1 = arg_15_1:GetEndTime()

		if var_15_0 ~= var_15_1 then
			return var_15_0 < var_15_1
		end

		return arg_15_0.id < arg_15_1.id
	end)

	local var_13_17, var_13_18 = pg.TimeMgr.GetInstance():GetServerTime(), {}
	local var_13_19 = #var_13_16

	for iter_13_2, iter_13_3 in ipairs(var_13_16) do
		local var_13_20 = iter_13_3:GetEndTime()

		if var_13_17 ~= var_13_20 then
			local var_13_21 = math.max(var_13_20 - var_13_17, 0)

			var_13_17 = var_13_20

			table.insert(var_13_18, {
				timeLength = var_13_21,
				buffCount = var_13_19
			})
		end

		var_13_19 = var_13_19 - 1
	end

	local var_13_22 = {}

	for iter_13_4, iter_13_5 in ipairs(var_13_18) do
		local var_13_23 = 0
		local var_13_24 = iter_13_5.buffCount
		local var_13_25 = #var_13_16

		for iter_13_6 = var_13_25, var_13_25 - var_13_24 + 1, -1 do
			local var_13_26 = var_13_16[iter_13_6]:GetBuffEffect()

			for iter_13_7, iter_13_8 in ipairs(var_13_26) do
				if iter_13_8[1] == var_13_4 then
					var_13_23 = var_13_23 + iter_13_8[2]
				end
			end
		end

		local var_13_27 = var_13_12 * (1 + var_13_23 * 0.01)
		local var_13_28 = var_13_1:GetAttrGradeByValue(var_13_27)

		if var_13_28 == var_13_13 then
			break
		end

		local var_13_29 = var_13_2 * (1 + 0.01 * (pg.island_chara_att[var_13_28].effect + var_13_15))

		table.insert(var_13_22, {
			buffSpeed = var_13_29,
			timeLength = iter_13_5.timeLength
		})
	end

	local var_13_30 = {}
	local var_13_31 = var_13_3.workload

	for iter_13_9 = 1, arg_13_2 do
		local var_13_32 = var_13_31
		local var_13_33 = 0

		for iter_13_10, iter_13_11 in ipairs(var_13_22) do
			local var_13_34 = math.floor(var_13_32 / iter_13_11.buffSpeed)

			if var_13_34 <= iter_13_11.timeLength then
				iter_13_11.timeLength = iter_13_11.timeLength - var_13_34
				var_13_33 = var_13_33 + var_13_34
				var_13_32 = 0

				break
			else
				var_13_33 = var_13_33 + iter_13_11.timeLength
				var_13_32 = var_13_32 - iter_13_11.timeLength * iter_13_11.buffSpeed
				iter_13_11.timeLength = 0
			end
		end

		if var_13_32 > 0 then
			local var_13_35 = var_13_2 * (1 + 0.01 * (var_13_14 + var_13_15))

			var_13_33 = var_13_33 + math.floor(var_13_32 / var_13_35)
		end

		table.insert(var_13_30, var_13_33)
	end

	return var_13_30
end

return var_0_0

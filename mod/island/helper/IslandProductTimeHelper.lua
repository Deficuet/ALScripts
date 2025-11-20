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
	local var_8_3 = var_0_0.GetShipBuffPercent(arg_8_0, arg_8_1)

	return var_8_0, var_8_1, var_8_2, var_8_3
end

function var_0_0.GetAttributeAddPercent(arg_9_0, arg_9_1)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_9_0)
	local var_9_1 = var_9_0:GetAttr(IslandShipAttr.ATTRS[arg_9_1])
	local var_9_2 = var_9_0:GetAttrGradeByValue(var_9_1)
	local var_9_3 = pg.island_chara_att[var_9_2].effect
	local var_9_4 = var_9_0:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	if #var_9_4 == 0 then
		return var_9_3
	end

	local var_9_5 = 0

	for iter_9_0, iter_9_1 in ipairs(var_9_4) do
		local var_9_6 = iter_9_1:GetBuffEffect()

		for iter_9_2, iter_9_3 in ipairs(var_9_6) do
			if iter_9_3[1] == arg_9_1 then
				var_9_5 = var_9_5 + iter_9_3[2]
			end
		end
	end

	local var_9_7 = math.floor(var_9_1 * (1 + var_9_5 * 0.01))
	local var_9_8 = var_9_0:GetAttrGradeByValue(var_9_7)

	return pg.island_chara_att[var_9_8].effect
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

function var_0_0.GetShipBuffPercent(arg_13_0, arg_13_1)
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_13_0):GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_13_1 = 0

	for iter_13_0, iter_13_1 in ipairs(var_13_0) do
		local var_13_2 = iter_13_1:GetBuffEffect()
		local var_13_3 = var_13_2[1]

		if underscore.any(var_13_3, function(arg_14_0)
			return arg_14_0 == arg_13_1
		end) then
			var_13_1 = var_13_1 + var_13_2[2]
		end
	end

	return var_13_1
end

function var_0_0.CalculateTimeToProductFormula(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = getProxy(IslandProxy):GetIsland()
	local var_15_1 = var_15_0:GetCharacterAgency():GetShipById(arg_15_0)
	local var_15_2 = pg.island_set.base_efficiency.key_value_int
	local var_15_3 = pg.island_formula[arg_15_1]
	local var_15_4 = var_15_3.attribute
	local var_15_5 = 0

	for iter_15_0, iter_15_1 in ipairs(var_15_1:GetSkill():GetUnlockShipEffectIds()) do
		local var_15_6 = pg.island_buff_template[iter_15_1]

		if var_15_6.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_15_7 = var_15_6.type_use
			local var_15_8 = var_15_7[1]

			if underscore.any(var_15_8, function(arg_16_0)
				return arg_16_0 == arg_15_3
			end) then
				var_15_5 = var_15_5 + var_15_7[2]
			end
		end
	end

	local var_15_9 = 0
	local var_15_10 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_15_3)

	if var_15_10 then
		var_15_9 = var_15_9 + var_15_0:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_15_10)
	end

	local var_15_11 = var_15_1:GetAttr(IslandShipAttr.ATTRS[var_15_4])
	local var_15_12 = var_15_1:GetAttrGradeByValue(var_15_11)
	local var_15_13 = pg.island_chara_att[var_15_12].effect
	local var_15_14 = var_15_5 + var_15_9
	local var_15_15 = var_15_1:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	table.sort(var_15_15, function(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_0:GetEndTime()
		local var_17_1 = arg_17_1:GetEndTime()

		if var_17_0 ~= var_17_1 then
			return var_17_0 < var_17_1
		end

		return arg_17_0.id < arg_17_1.id
	end)

	local var_15_16 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_15_17 = {}
	local var_15_18 = var_15_16
	local var_15_19 = #var_15_15

	for iter_15_2, iter_15_3 in ipairs(var_15_15) do
		local var_15_20 = iter_15_3:GetEndTime()

		if var_15_18 ~= var_15_20 then
			local var_15_21 = math.max(var_15_20 - var_15_18, 0)

			var_15_18 = var_15_20

			table.insert(var_15_17, {
				timeLength = var_15_21,
				buffCount = var_15_19
			})
		end

		var_15_19 = var_15_19 - 1
	end

	local var_15_22 = {}

	for iter_15_4, iter_15_5 in ipairs(var_15_17) do
		local var_15_23 = 0
		local var_15_24 = iter_15_5.buffCount
		local var_15_25 = #var_15_15

		for iter_15_6 = var_15_25, var_15_25 - var_15_24 + 1, -1 do
			local var_15_26 = var_15_15[iter_15_6]:GetBuffEffect()

			for iter_15_7, iter_15_8 in ipairs(var_15_26) do
				if iter_15_8[1] == var_15_4 then
					var_15_23 = var_15_23 + iter_15_8[2]
				end
			end
		end

		local var_15_27 = math.floor(var_15_11 * (1 + var_15_23 * 0.01))
		local var_15_28 = var_15_1:GetAttrGradeByValue(var_15_27)

		if var_15_28 == var_15_12 then
			break
		end

		local var_15_29 = pg.island_chara_att[var_15_28].effect - var_15_13

		table.insert(var_15_22, {
			buffAddPercent = var_15_29,
			timeLength = iter_15_5.timeLength
		})
	end

	local var_15_30 = var_15_1:GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_15_31 = {}
	local var_15_32 = 0

	for iter_15_9, iter_15_10 in ipairs(var_15_30) do
		local var_15_33 = iter_15_10:GetBuffEffect()
		local var_15_34 = var_15_33[1]

		if underscore.any(var_15_34, function(arg_18_0)
			return arg_18_0 == arg_15_3
		end) then
			table.insert(var_15_31, iter_15_10)

			var_15_32 = var_15_32 + var_15_33[2]
		end
	end

	table.sort(var_15_31, function(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_0:GetEndTime()
		local var_19_1 = arg_19_1:GetEndTime()

		if var_19_0 ~= var_19_1 then
			return var_19_0 < var_19_1
		end

		return arg_19_0.id < arg_19_1.id
	end)

	local var_15_35 = var_15_16
	local var_15_36 = {}
	local var_15_37 = 0

	for iter_15_11, iter_15_12 in ipairs(var_15_31) do
		local var_15_38 = iter_15_12:GetEndTime()
		local var_15_39 = iter_15_12:GetBuffEffect()[2]

		if var_15_35 ~= var_15_38 then
			local var_15_40 = math.max(var_15_38 - var_15_35, 0)

			var_15_35 = var_15_38
			var_15_32 = var_15_32 - var_15_37

			table.insert(var_15_36, {
				buffAddPercent = var_15_32,
				timeLength = var_15_40
			})
		end

		var_15_37 = var_15_37 + var_15_39
	end

	local var_15_41 = 1
	local var_15_42 = 1
	local var_15_43 = (function(arg_20_0, arg_20_1)
		local var_20_0 = {}

		if #arg_20_0 == 0 and #arg_20_1 == 0 then
			return {}
		end

		if #arg_20_0 == 0 then
			return arg_20_1
		end

		if #arg_20_1 == 0 then
			return arg_20_0
		end

		while var_15_41 <= #arg_20_0 and var_15_42 <= #arg_20_1 do
			local var_20_1 = arg_20_0[var_15_41]
			local var_20_2 = arg_20_1[var_15_42]
			local var_20_3 = math.min(var_20_1.timeLength, var_20_2.timeLength)

			table.insert(var_20_0, {
				timeLength = var_20_3,
				buffAddPercent = var_20_1.buffAddPercent + var_20_2.buffAddPercent
			})

			var_20_1.timeLength = var_20_1.timeLength - var_20_3
			var_20_2.timeLength = var_20_2.timeLength - var_20_3

			if var_20_1.timeLength <= 0 then
				var_15_41 = var_15_41 + 1
			end

			if var_20_2.timeLength <= 0 then
				var_15_42 = var_15_42 + 1
			end
		end

		return var_20_0
	end)(var_15_36, var_15_22)
	local var_15_44 = {}
	local var_15_45 = var_15_3.workload

	for iter_15_13 = 1, arg_15_2 do
		local var_15_46 = var_15_45
		local var_15_47 = 0

		for iter_15_14, iter_15_15 in ipairs(var_15_43) do
			local var_15_48 = var_15_2 * (1 + 0.01 * (var_15_13 + iter_15_15.buffAddPercent + var_15_14))
			local var_15_49 = math.floor(var_15_46 / var_15_48)

			if var_15_49 <= iter_15_15.timeLength then
				iter_15_15.timeLength = iter_15_15.timeLength - var_15_49
				var_15_47 = var_15_47 + var_15_49
				var_15_46 = 0

				break
			else
				var_15_47 = var_15_47 + iter_15_15.timeLength
				var_15_46 = var_15_46 - iter_15_15.timeLength * var_15_48
				iter_15_15.timeLength = 0
			end
		end

		if var_15_46 > 0 then
			local var_15_50 = var_15_2 * (1 + 0.01 * (var_15_13 + var_15_14))

			var_15_47 = var_15_47 + math.floor(var_15_46 / var_15_50)
		end

		table.insert(var_15_44, var_15_47)
	end

	return var_15_44
end

return var_0_0

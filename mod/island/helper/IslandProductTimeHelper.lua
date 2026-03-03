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
		end,
		[IslandProductConst.FisheryPlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_FISH
		end
	}, function()
		return nil
	end)
end

function var_0_0.GetAllAddPercent(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = var_0_0.GetAttributeAddPercent(arg_9_0, arg_9_2)
	local var_9_1 = var_0_0.GetPlaceAddPercent(arg_9_0, arg_9_1)
	local var_9_2 = var_0_0.GetSkillAddPercent(arg_9_0, arg_9_1)
	local var_9_3 = var_0_0.GetShipBuffPercent(arg_9_0, arg_9_1)

	return var_9_0, var_9_1, var_9_2, var_9_3
end

function var_0_0.GetAttributeGradeId(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_10_0)
	local var_10_1 = var_10_0:GetAttr(IslandShipAttr.ATTRS[arg_10_1])
	local var_10_2 = var_10_0:GetAttrGradeByValue(var_10_1)
	local var_10_3 = var_10_0:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	if #var_10_3 == 0 then
		return var_10_2
	end

	local var_10_4 = 0

	for iter_10_0, iter_10_1 in ipairs(var_10_3) do
		local var_10_5 = iter_10_1:GetBuffEffect()

		for iter_10_2, iter_10_3 in ipairs(var_10_5) do
			if iter_10_3[1] == arg_10_1 then
				var_10_4 = var_10_4 + iter_10_3[2]
			end
		end
	end

	local var_10_6 = math.floor(var_10_1 * (1 + var_10_4 * 0.01))

	return (var_10_0:GetAttrGradeByValue(var_10_6))
end

function var_0_0.GetAttributeAddPercent(arg_11_0, arg_11_1)
	local var_11_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_11_0)
	local var_11_1 = var_11_0:GetAttr(IslandShipAttr.ATTRS[arg_11_1])
	local var_11_2 = var_11_0:GetAttrGradeByValue(var_11_1)
	local var_11_3 = pg.island_chara_att[var_11_2].effect
	local var_11_4 = var_11_0:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	if #var_11_4 == 0 then
		return var_11_3
	end

	local var_11_5 = 0

	for iter_11_0, iter_11_1 in ipairs(var_11_4) do
		local var_11_6 = iter_11_1:GetBuffEffect()

		for iter_11_2, iter_11_3 in ipairs(var_11_6) do
			if iter_11_3[1] == arg_11_1 then
				var_11_5 = var_11_5 + iter_11_3[2]
			end
		end
	end

	local var_11_7 = math.floor(var_11_1 * (1 + var_11_5 * 0.01))
	local var_11_8 = var_11_0:GetAttrGradeByValue(var_11_7)

	return pg.island_chara_att[var_11_8].effect
end

function var_0_0.GetAttributeAddPercentByAttribute(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_12_0):GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	if #var_12_0 == 0 then
		return 0
	end

	local var_12_1 = 0

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		local var_12_2 = iter_12_1:GetBuffEffect()

		for iter_12_2, iter_12_3 in ipairs(var_12_2) do
			if iter_12_3[1] == arg_12_1 then
				var_12_1 = var_12_1 + iter_12_3[2]
			end
		end
	end

	return var_12_1
end

function var_0_0.GetPlaceAddPercent(arg_13_0, arg_13_1)
	local var_13_0 = 0
	local var_13_1 = getProxy(IslandProxy):GetIsland()
	local var_13_2 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_13_1)

	if var_13_2 then
		var_13_0 = var_13_0 + var_13_1:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_13_2)
	end

	return var_13_0
end

function var_0_0.GetSkillAddPercent(arg_14_0, arg_14_1)
	local var_14_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_14_0)
	local var_14_1 = 0

	for iter_14_0, iter_14_1 in ipairs(var_14_0:GetSkill():GetUnlockShipEffectIds()) do
		local var_14_2 = pg.island_buff_template[iter_14_1]

		if var_14_2.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_14_3 = var_14_2.type_use
			local var_14_4 = var_14_3[1]

			if underscore.any(var_14_4, function(arg_15_0)
				return arg_15_0 == arg_14_1
			end) then
				var_14_1 = var_14_1 + var_14_3[2]
			end
		end
	end

	return var_14_1
end

function var_0_0.GetShipBuffPercent(arg_16_0, arg_16_1)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_16_0):GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_16_1 = 0

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		local var_16_2 = iter_16_1:GetBuffEffect()
		local var_16_3 = var_16_2[1]

		if underscore.any(var_16_3, function(arg_17_0)
			return arg_17_0 == arg_16_1
		end) then
			var_16_1 = var_16_1 + var_16_2[2]
		end
	end

	return var_16_1
end

function var_0_0.CalculateTimeToProductFormula(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	local var_18_0 = getProxy(IslandProxy):GetIsland()
	local var_18_1 = var_18_0:GetCharacterAgency():GetShipById(arg_18_0)
	local var_18_2 = pg.island_set.base_efficiency.key_value_int
	local var_18_3 = pg.island_formula[arg_18_1]
	local var_18_4 = var_18_3.attribute
	local var_18_5 = 0

	for iter_18_0, iter_18_1 in ipairs(var_18_1:GetSkill():GetUnlockShipEffectIds()) do
		local var_18_6 = pg.island_buff_template[iter_18_1]

		if var_18_6.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_18_7 = var_18_6.type_use
			local var_18_8 = var_18_7[1]

			if underscore.any(var_18_8, function(arg_19_0)
				return arg_19_0 == arg_18_3
			end) then
				var_18_5 = var_18_5 + var_18_7[2]
			end
		end
	end

	local var_18_9 = 0
	local var_18_10 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_18_3)

	if var_18_10 then
		var_18_9 = var_18_9 + var_18_0:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_18_10)
	end

	local var_18_11 = var_18_1:GetAttr(IslandShipAttr.ATTRS[var_18_4])
	local var_18_12 = var_18_1:GetAttrGradeByValue(var_18_11)
	local var_18_13 = pg.island_chara_att[var_18_12].effect
	local var_18_14 = var_18_5 + var_18_9
	local var_18_15 = var_18_1:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	table.sort(var_18_15, function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_0:GetEndTime()
		local var_20_1 = arg_20_1:GetEndTime()

		if var_20_0 ~= var_20_1 then
			return var_20_0 < var_20_1
		end

		return arg_20_0.id < arg_20_1.id
	end)

	local var_18_16 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_18_17 = {}
	local var_18_18 = var_18_16
	local var_18_19 = #var_18_15

	for iter_18_2, iter_18_3 in ipairs(var_18_15) do
		local var_18_20 = iter_18_3:GetEndTime()

		if var_18_18 ~= var_18_20 then
			local var_18_21 = math.max(var_18_20 - var_18_18, 0)

			var_18_18 = var_18_20

			table.insert(var_18_17, {
				timeLength = var_18_21,
				buffCount = var_18_19
			})
		end

		var_18_19 = var_18_19 - 1
	end

	local var_18_22 = {}

	for iter_18_4, iter_18_5 in ipairs(var_18_17) do
		local var_18_23 = 0
		local var_18_24 = iter_18_5.buffCount
		local var_18_25 = #var_18_15

		for iter_18_6 = var_18_25, var_18_25 - var_18_24 + 1, -1 do
			local var_18_26 = var_18_15[iter_18_6]:GetBuffEffect()

			for iter_18_7, iter_18_8 in ipairs(var_18_26) do
				if iter_18_8[1] == var_18_4 then
					var_18_23 = var_18_23 + iter_18_8[2]
				end
			end
		end

		local var_18_27 = math.floor(var_18_11 * (1 + var_18_23 * 0.01))
		local var_18_28 = var_18_1:GetAttrGradeByValue(var_18_27)

		if var_18_28 == var_18_12 then
			break
		end

		local var_18_29 = pg.island_chara_att[var_18_28].effect - var_18_13

		table.insert(var_18_22, {
			buffAddPercent = var_18_29,
			timeLength = iter_18_5.timeLength
		})
	end

	local var_18_30 = var_18_1:GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_18_31 = {}
	local var_18_32 = 0

	for iter_18_9, iter_18_10 in ipairs(var_18_30) do
		local var_18_33 = iter_18_10:GetBuffEffect()
		local var_18_34 = var_18_33[1]

		if underscore.any(var_18_34, function(arg_21_0)
			return arg_21_0 == arg_18_3
		end) then
			table.insert(var_18_31, iter_18_10)

			var_18_32 = var_18_32 + var_18_33[2]
		end
	end

	table.sort(var_18_31, function(arg_22_0, arg_22_1)
		local var_22_0 = arg_22_0:GetEndTime()
		local var_22_1 = arg_22_1:GetEndTime()

		if var_22_0 ~= var_22_1 then
			return var_22_0 < var_22_1
		end

		return arg_22_0.id < arg_22_1.id
	end)

	local var_18_35 = var_18_16
	local var_18_36 = {}
	local var_18_37 = 0

	for iter_18_11, iter_18_12 in ipairs(var_18_31) do
		local var_18_38 = iter_18_12:GetEndTime()
		local var_18_39 = iter_18_12:GetBuffEffect()[2]

		if var_18_35 ~= var_18_38 then
			local var_18_40 = math.max(var_18_38 - var_18_35, 0)

			var_18_35 = var_18_38
			var_18_32 = var_18_32 - var_18_37

			table.insert(var_18_36, {
				buffAddPercent = var_18_32,
				timeLength = var_18_40
			})
		end

		var_18_37 = var_18_37 + var_18_39
	end

	local var_18_41 = 1
	local var_18_42 = 1
	local var_18_43 = (function(arg_23_0, arg_23_1)
		local var_23_0 = {}

		if #arg_23_0 == 0 and #arg_23_1 == 0 then
			return {}
		end

		if #arg_23_0 == 0 then
			return arg_23_1
		end

		if #arg_23_1 == 0 then
			return arg_23_0
		end

		while var_18_41 <= #arg_23_0 and var_18_42 <= #arg_23_1 do
			local var_23_1 = arg_23_0[var_18_41]
			local var_23_2 = arg_23_1[var_18_42]
			local var_23_3 = math.min(var_23_1.timeLength, var_23_2.timeLength)

			table.insert(var_23_0, {
				timeLength = var_23_3,
				buffAddPercent = var_23_1.buffAddPercent + var_23_2.buffAddPercent
			})

			var_23_1.timeLength = var_23_1.timeLength - var_23_3
			var_23_2.timeLength = var_23_2.timeLength - var_23_3

			if var_23_1.timeLength <= 0 then
				var_18_41 = var_18_41 + 1
			end

			if var_23_2.timeLength <= 0 then
				var_18_42 = var_18_42 + 1
			end
		end

		return var_23_0
	end)(var_18_36, var_18_22)
	local var_18_44 = {}
	local var_18_45 = var_18_3.workload

	for iter_18_13 = 1, arg_18_2 do
		local var_18_46 = var_18_45
		local var_18_47 = 0

		for iter_18_14, iter_18_15 in ipairs(var_18_43) do
			local var_18_48 = var_18_2 * (1 + 0.01 * (var_18_13 + iter_18_15.buffAddPercent + var_18_14))
			local var_18_49 = math.floor(var_18_46 / var_18_48)

			if var_18_49 <= iter_18_15.timeLength then
				iter_18_15.timeLength = iter_18_15.timeLength - var_18_49
				var_18_47 = var_18_47 + var_18_49
				var_18_46 = 0

				break
			else
				var_18_47 = var_18_47 + iter_18_15.timeLength
				var_18_46 = var_18_46 - iter_18_15.timeLength * var_18_48
				iter_18_15.timeLength = 0
			end
		end

		if var_18_46 > 0 then
			local var_18_50 = var_18_2 * (1 + 0.01 * (var_18_13 + var_18_14))

			var_18_47 = var_18_47 + math.floor(var_18_46 / var_18_50)
		end

		table.insert(var_18_44, var_18_47)
	end

	return var_18_44
end

return var_0_0

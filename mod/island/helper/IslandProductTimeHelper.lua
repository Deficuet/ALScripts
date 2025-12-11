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

function var_0_0.GetAttributeAddPercent(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_10_0)
	local var_10_1 = var_10_0:GetAttr(IslandShipAttr.ATTRS[arg_10_1])
	local var_10_2 = var_10_0:GetAttrGradeByValue(var_10_1)
	local var_10_3 = pg.island_chara_att[var_10_2].effect
	local var_10_4 = var_10_0:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	if #var_10_4 == 0 then
		return var_10_3
	end

	local var_10_5 = 0

	for iter_10_0, iter_10_1 in ipairs(var_10_4) do
		local var_10_6 = iter_10_1:GetBuffEffect()

		for iter_10_2, iter_10_3 in ipairs(var_10_6) do
			if iter_10_3[1] == arg_10_1 then
				var_10_5 = var_10_5 + iter_10_3[2]
			end
		end
	end

	local var_10_7 = math.floor(var_10_1 * (1 + var_10_5 * 0.01))
	local var_10_8 = var_10_0:GetAttrGradeByValue(var_10_7)

	return pg.island_chara_att[var_10_8].effect
end

function var_0_0.GetAttributeAddPercentByAttribute(arg_11_0, arg_11_1)
	local var_11_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_11_0):GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	if #var_11_0 == 0 then
		return 0
	end

	local var_11_1 = 0

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		local var_11_2 = iter_11_1:GetBuffEffect()

		for iter_11_2, iter_11_3 in ipairs(var_11_2) do
			if iter_11_3[1] == arg_11_1 then
				var_11_1 = var_11_1 + iter_11_3[2]
			end
		end
	end

	return var_11_1
end

function var_0_0.GetPlaceAddPercent(arg_12_0, arg_12_1)
	local var_12_0 = 0
	local var_12_1 = getProxy(IslandProxy):GetIsland()
	local var_12_2 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_12_1)

	if var_12_2 then
		var_12_0 = var_12_0 + var_12_1:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_12_2)
	end

	return var_12_0
end

function var_0_0.GetSkillAddPercent(arg_13_0, arg_13_1)
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_13_0)
	local var_13_1 = 0

	for iter_13_0, iter_13_1 in ipairs(var_13_0:GetSkill():GetUnlockShipEffectIds()) do
		local var_13_2 = pg.island_buff_template[iter_13_1]

		if var_13_2.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_13_3 = var_13_2.type_use
			local var_13_4 = var_13_3[1]

			if underscore.any(var_13_4, function(arg_14_0)
				return arg_14_0 == arg_13_1
			end) then
				var_13_1 = var_13_1 + var_13_3[2]
			end
		end
	end

	return var_13_1
end

function var_0_0.GetShipBuffPercent(arg_15_0, arg_15_1)
	local var_15_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_15_0):GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_15_1 = 0

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		local var_15_2 = iter_15_1:GetBuffEffect()
		local var_15_3 = var_15_2[1]

		if underscore.any(var_15_3, function(arg_16_0)
			return arg_16_0 == arg_15_1
		end) then
			var_15_1 = var_15_1 + var_15_2[2]
		end
	end

	return var_15_1
end

function var_0_0.CalculateTimeToProductFormula(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	local var_17_0 = getProxy(IslandProxy):GetIsland()
	local var_17_1 = var_17_0:GetCharacterAgency():GetShipById(arg_17_0)
	local var_17_2 = pg.island_set.base_efficiency.key_value_int
	local var_17_3 = pg.island_formula[arg_17_1]
	local var_17_4 = var_17_3.attribute
	local var_17_5 = 0

	for iter_17_0, iter_17_1 in ipairs(var_17_1:GetSkill():GetUnlockShipEffectIds()) do
		local var_17_6 = pg.island_buff_template[iter_17_1]

		if var_17_6.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_17_7 = var_17_6.type_use
			local var_17_8 = var_17_7[1]

			if underscore.any(var_17_8, function(arg_18_0)
				return arg_18_0 == arg_17_3
			end) then
				var_17_5 = var_17_5 + var_17_7[2]
			end
		end
	end

	local var_17_9 = 0
	local var_17_10 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_17_3)

	if var_17_10 then
		var_17_9 = var_17_9 + var_17_0:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_17_10)
	end

	local var_17_11 = var_17_1:GetAttr(IslandShipAttr.ATTRS[var_17_4])
	local var_17_12 = var_17_1:GetAttrGradeByValue(var_17_11)
	local var_17_13 = pg.island_chara_att[var_17_12].effect
	local var_17_14 = var_17_5 + var_17_9
	local var_17_15 = var_17_1:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	table.sort(var_17_15, function(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_0:GetEndTime()
		local var_19_1 = arg_19_1:GetEndTime()

		if var_19_0 ~= var_19_1 then
			return var_19_0 < var_19_1
		end

		return arg_19_0.id < arg_19_1.id
	end)

	local var_17_16 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_17_17 = {}
	local var_17_18 = var_17_16
	local var_17_19 = #var_17_15

	for iter_17_2, iter_17_3 in ipairs(var_17_15) do
		local var_17_20 = iter_17_3:GetEndTime()

		if var_17_18 ~= var_17_20 then
			local var_17_21 = math.max(var_17_20 - var_17_18, 0)

			var_17_18 = var_17_20

			table.insert(var_17_17, {
				timeLength = var_17_21,
				buffCount = var_17_19
			})
		end

		var_17_19 = var_17_19 - 1
	end

	local var_17_22 = {}

	for iter_17_4, iter_17_5 in ipairs(var_17_17) do
		local var_17_23 = 0
		local var_17_24 = iter_17_5.buffCount
		local var_17_25 = #var_17_15

		for iter_17_6 = var_17_25, var_17_25 - var_17_24 + 1, -1 do
			local var_17_26 = var_17_15[iter_17_6]:GetBuffEffect()

			for iter_17_7, iter_17_8 in ipairs(var_17_26) do
				if iter_17_8[1] == var_17_4 then
					var_17_23 = var_17_23 + iter_17_8[2]
				end
			end
		end

		local var_17_27 = math.floor(var_17_11 * (1 + var_17_23 * 0.01))
		local var_17_28 = var_17_1:GetAttrGradeByValue(var_17_27)

		if var_17_28 == var_17_12 then
			break
		end

		local var_17_29 = pg.island_chara_att[var_17_28].effect - var_17_13

		table.insert(var_17_22, {
			buffAddPercent = var_17_29,
			timeLength = iter_17_5.timeLength
		})
	end

	local var_17_30 = var_17_1:GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_17_31 = {}
	local var_17_32 = 0

	for iter_17_9, iter_17_10 in ipairs(var_17_30) do
		local var_17_33 = iter_17_10:GetBuffEffect()
		local var_17_34 = var_17_33[1]

		if underscore.any(var_17_34, function(arg_20_0)
			return arg_20_0 == arg_17_3
		end) then
			table.insert(var_17_31, iter_17_10)

			var_17_32 = var_17_32 + var_17_33[2]
		end
	end

	table.sort(var_17_31, function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_0:GetEndTime()
		local var_21_1 = arg_21_1:GetEndTime()

		if var_21_0 ~= var_21_1 then
			return var_21_0 < var_21_1
		end

		return arg_21_0.id < arg_21_1.id
	end)

	local var_17_35 = var_17_16
	local var_17_36 = {}
	local var_17_37 = 0

	for iter_17_11, iter_17_12 in ipairs(var_17_31) do
		local var_17_38 = iter_17_12:GetEndTime()
		local var_17_39 = iter_17_12:GetBuffEffect()[2]

		if var_17_35 ~= var_17_38 then
			local var_17_40 = math.max(var_17_38 - var_17_35, 0)

			var_17_35 = var_17_38
			var_17_32 = var_17_32 - var_17_37

			table.insert(var_17_36, {
				buffAddPercent = var_17_32,
				timeLength = var_17_40
			})
		end

		var_17_37 = var_17_37 + var_17_39
	end

	local var_17_41 = 1
	local var_17_42 = 1
	local var_17_43 = (function(arg_22_0, arg_22_1)
		local var_22_0 = {}

		if #arg_22_0 == 0 and #arg_22_1 == 0 then
			return {}
		end

		if #arg_22_0 == 0 then
			return arg_22_1
		end

		if #arg_22_1 == 0 then
			return arg_22_0
		end

		while var_17_41 <= #arg_22_0 and var_17_42 <= #arg_22_1 do
			local var_22_1 = arg_22_0[var_17_41]
			local var_22_2 = arg_22_1[var_17_42]
			local var_22_3 = math.min(var_22_1.timeLength, var_22_2.timeLength)

			table.insert(var_22_0, {
				timeLength = var_22_3,
				buffAddPercent = var_22_1.buffAddPercent + var_22_2.buffAddPercent
			})

			var_22_1.timeLength = var_22_1.timeLength - var_22_3
			var_22_2.timeLength = var_22_2.timeLength - var_22_3

			if var_22_1.timeLength <= 0 then
				var_17_41 = var_17_41 + 1
			end

			if var_22_2.timeLength <= 0 then
				var_17_42 = var_17_42 + 1
			end
		end

		return var_22_0
	end)(var_17_36, var_17_22)
	local var_17_44 = {}
	local var_17_45 = var_17_3.workload

	for iter_17_13 = 1, arg_17_2 do
		local var_17_46 = var_17_45
		local var_17_47 = 0

		for iter_17_14, iter_17_15 in ipairs(var_17_43) do
			local var_17_48 = var_17_2 * (1 + 0.01 * (var_17_13 + iter_17_15.buffAddPercent + var_17_14))
			local var_17_49 = math.floor(var_17_46 / var_17_48)

			if var_17_49 <= iter_17_15.timeLength then
				iter_17_15.timeLength = iter_17_15.timeLength - var_17_49
				var_17_47 = var_17_47 + var_17_49
				var_17_46 = 0

				break
			else
				var_17_47 = var_17_47 + iter_17_15.timeLength
				var_17_46 = var_17_46 - iter_17_15.timeLength * var_17_48
				iter_17_15.timeLength = 0
			end
		end

		if var_17_46 > 0 then
			local var_17_50 = var_17_2 * (1 + 0.01 * (var_17_13 + var_17_14))

			var_17_47 = var_17_47 + math.floor(var_17_46 / var_17_50)
		end

		table.insert(var_17_44, var_17_47)
	end

	return var_17_44
end

return var_0_0

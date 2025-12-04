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

function var_0_0.GetPlaceAddPercent(arg_11_0, arg_11_1)
	local var_11_0 = 0
	local var_11_1 = getProxy(IslandProxy):GetIsland()
	local var_11_2 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_11_1)

	if var_11_2 then
		var_11_0 = var_11_0 + var_11_1:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_11_2)
	end

	return var_11_0
end

function var_0_0.GetSkillAddPercent(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_12_0)
	local var_12_1 = 0

	for iter_12_0, iter_12_1 in ipairs(var_12_0:GetSkill():GetUnlockShipEffectIds()) do
		local var_12_2 = pg.island_buff_template[iter_12_1]

		if var_12_2.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_12_3 = var_12_2.type_use
			local var_12_4 = var_12_3[1]

			if underscore.any(var_12_4, function(arg_13_0)
				return arg_13_0 == arg_12_1
			end) then
				var_12_1 = var_12_1 + var_12_3[2]
			end
		end
	end

	return var_12_1
end

function var_0_0.GetShipBuffPercent(arg_14_0, arg_14_1)
	local var_14_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_14_0):GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_14_1 = 0

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		local var_14_2 = iter_14_1:GetBuffEffect()
		local var_14_3 = var_14_2[1]

		if underscore.any(var_14_3, function(arg_15_0)
			return arg_15_0 == arg_14_1
		end) then
			var_14_1 = var_14_1 + var_14_2[2]
		end
	end

	return var_14_1
end

function var_0_0.CalculateTimeToProductFormula(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	local var_16_0 = getProxy(IslandProxy):GetIsland()
	local var_16_1 = var_16_0:GetCharacterAgency():GetShipById(arg_16_0)
	local var_16_2 = pg.island_set.base_efficiency.key_value_int
	local var_16_3 = pg.island_formula[arg_16_1]
	local var_16_4 = var_16_3.attribute
	local var_16_5 = 0

	for iter_16_0, iter_16_1 in ipairs(var_16_1:GetSkill():GetUnlockShipEffectIds()) do
		local var_16_6 = pg.island_buff_template[iter_16_1]

		if var_16_6.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_16_7 = var_16_6.type_use
			local var_16_8 = var_16_7[1]

			if underscore.any(var_16_8, function(arg_17_0)
				return arg_17_0 == arg_16_3
			end) then
				var_16_5 = var_16_5 + var_16_7[2]
			end
		end
	end

	local var_16_9 = 0
	local var_16_10 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_16_3)

	if var_16_10 then
		var_16_9 = var_16_9 + var_16_0:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_16_10)
	end

	local var_16_11 = var_16_1:GetAttr(IslandShipAttr.ATTRS[var_16_4])
	local var_16_12 = var_16_1:GetAttrGradeByValue(var_16_11)
	local var_16_13 = pg.island_chara_att[var_16_12].effect
	local var_16_14 = var_16_5 + var_16_9
	local var_16_15 = var_16_1:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	table.sort(var_16_15, function(arg_18_0, arg_18_1)
		local var_18_0 = arg_18_0:GetEndTime()
		local var_18_1 = arg_18_1:GetEndTime()

		if var_18_0 ~= var_18_1 then
			return var_18_0 < var_18_1
		end

		return arg_18_0.id < arg_18_1.id
	end)

	local var_16_16 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_16_17 = {}
	local var_16_18 = var_16_16
	local var_16_19 = #var_16_15

	for iter_16_2, iter_16_3 in ipairs(var_16_15) do
		local var_16_20 = iter_16_3:GetEndTime()

		if var_16_18 ~= var_16_20 then
			local var_16_21 = math.max(var_16_20 - var_16_18, 0)

			var_16_18 = var_16_20

			table.insert(var_16_17, {
				timeLength = var_16_21,
				buffCount = var_16_19
			})
		end

		var_16_19 = var_16_19 - 1
	end

	local var_16_22 = {}

	for iter_16_4, iter_16_5 in ipairs(var_16_17) do
		local var_16_23 = 0
		local var_16_24 = iter_16_5.buffCount
		local var_16_25 = #var_16_15

		for iter_16_6 = var_16_25, var_16_25 - var_16_24 + 1, -1 do
			local var_16_26 = var_16_15[iter_16_6]:GetBuffEffect()

			for iter_16_7, iter_16_8 in ipairs(var_16_26) do
				if iter_16_8[1] == var_16_4 then
					var_16_23 = var_16_23 + iter_16_8[2]
				end
			end
		end

		local var_16_27 = math.floor(var_16_11 * (1 + var_16_23 * 0.01))
		local var_16_28 = var_16_1:GetAttrGradeByValue(var_16_27)

		if var_16_28 == var_16_12 then
			break
		end

		local var_16_29 = pg.island_chara_att[var_16_28].effect - var_16_13

		table.insert(var_16_22, {
			buffAddPercent = var_16_29,
			timeLength = iter_16_5.timeLength
		})
	end

	local var_16_30 = var_16_1:GetVaildStatusByType(IslandBuffType.SHIP_PRODUCT_RATIO)
	local var_16_31 = {}
	local var_16_32 = 0

	for iter_16_9, iter_16_10 in ipairs(var_16_30) do
		local var_16_33 = iter_16_10:GetBuffEffect()
		local var_16_34 = var_16_33[1]

		if underscore.any(var_16_34, function(arg_19_0)
			return arg_19_0 == arg_16_3
		end) then
			table.insert(var_16_31, iter_16_10)

			var_16_32 = var_16_32 + var_16_33[2]
		end
	end

	table.sort(var_16_31, function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_0:GetEndTime()
		local var_20_1 = arg_20_1:GetEndTime()

		if var_20_0 ~= var_20_1 then
			return var_20_0 < var_20_1
		end

		return arg_20_0.id < arg_20_1.id
	end)

	local var_16_35 = var_16_16
	local var_16_36 = {}
	local var_16_37 = 0

	for iter_16_11, iter_16_12 in ipairs(var_16_31) do
		local var_16_38 = iter_16_12:GetEndTime()
		local var_16_39 = iter_16_12:GetBuffEffect()[2]

		if var_16_35 ~= var_16_38 then
			local var_16_40 = math.max(var_16_38 - var_16_35, 0)

			var_16_35 = var_16_38
			var_16_32 = var_16_32 - var_16_37

			table.insert(var_16_36, {
				buffAddPercent = var_16_32,
				timeLength = var_16_40
			})
		end

		var_16_37 = var_16_37 + var_16_39
	end

	local var_16_41 = 1
	local var_16_42 = 1
	local var_16_43 = (function(arg_21_0, arg_21_1)
		local var_21_0 = {}

		if #arg_21_0 == 0 and #arg_21_1 == 0 then
			return {}
		end

		if #arg_21_0 == 0 then
			return arg_21_1
		end

		if #arg_21_1 == 0 then
			return arg_21_0
		end

		while var_16_41 <= #arg_21_0 and var_16_42 <= #arg_21_1 do
			local var_21_1 = arg_21_0[var_16_41]
			local var_21_2 = arg_21_1[var_16_42]
			local var_21_3 = math.min(var_21_1.timeLength, var_21_2.timeLength)

			table.insert(var_21_0, {
				timeLength = var_21_3,
				buffAddPercent = var_21_1.buffAddPercent + var_21_2.buffAddPercent
			})

			var_21_1.timeLength = var_21_1.timeLength - var_21_3
			var_21_2.timeLength = var_21_2.timeLength - var_21_3

			if var_21_1.timeLength <= 0 then
				var_16_41 = var_16_41 + 1
			end

			if var_21_2.timeLength <= 0 then
				var_16_42 = var_16_42 + 1
			end
		end

		return var_21_0
	end)(var_16_36, var_16_22)
	local var_16_44 = {}
	local var_16_45 = var_16_3.workload

	for iter_16_13 = 1, arg_16_2 do
		local var_16_46 = var_16_45
		local var_16_47 = 0

		for iter_16_14, iter_16_15 in ipairs(var_16_43) do
			local var_16_48 = var_16_2 * (1 + 0.01 * (var_16_13 + iter_16_15.buffAddPercent + var_16_14))
			local var_16_49 = math.floor(var_16_46 / var_16_48)

			if var_16_49 <= iter_16_15.timeLength then
				iter_16_15.timeLength = iter_16_15.timeLength - var_16_49
				var_16_47 = var_16_47 + var_16_49
				var_16_46 = 0

				break
			else
				var_16_47 = var_16_47 + iter_16_15.timeLength
				var_16_46 = var_16_46 - iter_16_15.timeLength * var_16_48
				iter_16_15.timeLength = 0
			end
		end

		if var_16_46 > 0 then
			local var_16_50 = var_16_2 * (1 + 0.01 * (var_16_13 + var_16_14))

			var_16_47 = var_16_47 + math.floor(var_16_46 / var_16_50)
		end

		table.insert(var_16_44, var_16_47)
	end

	return var_16_44
end

return var_0_0

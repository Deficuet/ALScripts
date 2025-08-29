local var_0_0 = class("IslandProductTimeHelper")

function var_0_0.GetSpeedAddtionTypeByPlaceId(arg_1_0)
	return switch(arg_1_0, {
		[IslandProductSystemVO.FellingPlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_FELLING
		end,
		[IslandProductSystemVO.MinePlaceId] = function()
			return IslandAblityAgency.TYPE_PRODUCT_MINING
		end
	}, function()
		return nil
	end)
end

function var_0_0.CalculateTimeToProductFormula(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = getProxy(IslandProxy):GetIsland()
	local var_5_1 = var_5_0:GetCharacterAgency():GetShipById(arg_5_0)
	local var_5_2 = pg.island_set.base_efficiency.key_value_int
	local var_5_3 = pg.island_formula[arg_5_1]
	local var_5_4 = var_5_3.attribute
	local var_5_5 = 0

	for iter_5_0, iter_5_1 in ipairs(var_5_1:GetSkill():GetUnlockShipEffectIds()) do
		local var_5_6 = pg.island_buff_template[iter_5_1]

		if var_5_6.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_5_7 = var_5_6.type_use
			local var_5_8 = var_5_7[1]

			if iter_5_0.any(var_5_8, function(arg_6_0)
				return arg_6_0 == arg_5_3
			end) then
				var_5_5 = var_5_5 + var_5_7[2]
			end
		end
	end

	local var_5_9 = 0
	local var_5_10 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_5_3)

	if var_5_10 then
		var_5_9 = var_5_9 + var_5_0:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_5_10)
	end

	local var_5_11 = var_5_1:GetAttr(IslandShipAttr.ATTRS[var_5_4])
	local var_5_12 = var_5_1:GetAttrGradeByValue(var_5_11)
	local var_5_13 = pg.island_chara_att[var_5_12].effect
	local var_5_14 = var_5_2 * (1 + 0.01 * (var_5_5 + var_5_9))
	local var_5_15 = var_5_1:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	table.sort(var_5_15, function(arg_7_0, arg_7_1)
		local var_7_0 = arg_7_0:GetEndTime()
		local var_7_1 = arg_7_1:GetEndTime()

		if var_7_0 ~= var_7_1 then
			return var_7_0 < var_7_1
		end

		return arg_7_0.id < arg_7_1.id
	end)

	local var_5_16, var_5_17 = pg.TimeMgr.GetInstance():GetServerTime(), {}
	local var_5_18 = #var_5_15

	for iter_5_2, iter_5_3 in ipairs(var_5_15) do
		local var_5_19 = iter_5_3:GetEndTime()

		if var_5_16 ~= var_5_19 then
			local var_5_20 = math.max(var_5_19 - var_5_16, 0)

			var_5_16 = var_5_19

			table.insert(var_5_17, {
				timeLength = var_5_20,
				buffCount = var_5_18
			})
		end

		var_5_18 = var_5_18 - 1
	end

	local var_5_21 = {}

	for iter_5_4, iter_5_5 in ipairs(var_5_17) do
		local var_5_22 = 0
		local var_5_23 = iter_5_5.buffCount
		local var_5_24 = #var_5_15

		for iter_5_6 = var_5_24, var_5_24 - var_5_23 + 1, -1 do
			local var_5_25 = var_5_15[iter_5_6]:GetBuffEffect()

			for iter_5_7, iter_5_8 in ipairs(var_5_25) do
				if iter_5_8[1] == var_5_4 then
					var_5_22 = var_5_22 + iter_5_8[2]
				end
			end
		end

		local var_5_26 = var_5_11 * (1 + var_5_22 * 0.01)
		local var_5_27 = var_5_1:GetAttrGradeByValue(var_5_26)

		if var_5_27 == var_5_12 then
			break
		end

		local var_5_28 = var_5_14 * (1 + 0.01 * pg.island_chara_att[var_5_27].effect)

		table.insert(var_5_21, {
			buffSpeed = var_5_28,
			timeLength = iter_5_5.timeLength
		})
	end

	local var_5_29 = {}
	local var_5_30 = var_5_3.workload

	for iter_5_9 = 1, arg_5_2 do
		local var_5_31 = var_5_30
		local var_5_32 = 0

		for iter_5_10, iter_5_11 in ipairs(var_5_21) do
			local var_5_33 = math.floor(var_5_31 / iter_5_11.buffSpeed)

			if var_5_33 <= iter_5_11.timeLength then
				iter_5_11.timeLength = iter_5_11.timeLength - var_5_33
				var_5_32 = var_5_32 + var_5_33
				var_5_31 = 0

				break
			else
				var_5_32 = var_5_32 + iter_5_11.timeLength
				var_5_31 = var_5_31 - iter_5_11.timeLength * iter_5_11.buffSpeed
				iter_5_11.timeLength = 0
			end
		end

		if var_5_31 > 0 then
			local var_5_34 = var_5_14 * (1 + 0.01 * var_5_13)

			var_5_32 = var_5_32 + math.floor(var_5_31 / var_5_34)
		end

		table.insert(var_5_29, var_5_32)
	end

	return var_5_29
end

return var_0_0

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

function var_0_0.CalculateTimeToProductFormula(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
	local var_8_0 = getProxy(IslandProxy):GetIsland()
	local var_8_1 = var_8_0:GetCharacterAgency():GetShipById(arg_8_0)
	local var_8_2 = pg.island_set.base_efficiency.key_value_int
	local var_8_3 = pg.island_formula[arg_8_1]
	local var_8_4 = var_8_3.attribute
	local var_8_5 = 0

	for iter_8_0, iter_8_1 in ipairs(var_8_1:GetSkill():GetUnlockShipEffectIds()) do
		local var_8_6 = pg.island_buff_template[iter_8_1]

		if var_8_6.buff_type == IslandBuffType.SHIP_PRODUCT_RATIO then
			local var_8_7 = var_8_6.type_use
			local var_8_8 = var_8_7[1]

			if underscore.any(var_8_8, function(arg_9_0)
				return arg_9_0 == arg_8_3
			end) then
				var_8_5 = var_8_5 + var_8_7[2]
			end
		end
	end

	local var_8_9 = 0
	local var_8_10 = var_0_0.GetSpeedAddtionTypeByPlaceId(arg_8_3)

	if var_8_10 then
		var_8_9 = var_8_9 + var_8_0:GetAblityAgency():GetProductAdditionSpeedByAblityType(var_8_10)
	end

	local var_8_11 = 0

	if arg_8_3 == IslandProductConst.PasturePlaceId then
		local var_8_12 = var_8_0:GetBuildingAgency():GetBuilding(arg_8_3):GetDelegationSlotData(arg_8_4):GetPartList()

		for iter_8_2, iter_8_3 in ipairs(var_8_12) do
			var_8_11 = var_8_11 + pg.island_ranch_animal[iter_8_3].efficiency_gains
		end
	end

	local var_8_13 = var_8_1:GetAttr(IslandShipAttr.ATTRS[var_8_4])
	local var_8_14 = var_8_1:GetAttrGradeByValue(var_8_13)
	local var_8_15 = pg.island_chara_att[var_8_14].effect
	local var_8_16 = var_8_2 * (1 + 0.01 * (var_8_5 + var_8_9 + var_8_11))
	local var_8_17 = var_8_1:GetVaildStatusByType(IslandBuffType.SHIP_ATTR)

	table.sort(var_8_17, function(arg_10_0, arg_10_1)
		local var_10_0 = arg_10_0:GetEndTime()
		local var_10_1 = arg_10_1:GetEndTime()

		if var_10_0 ~= var_10_1 then
			return var_10_0 < var_10_1
		end

		return arg_10_0.id < arg_10_1.id
	end)

	local var_8_18, var_8_19 = pg.TimeMgr.GetInstance():GetServerTime(), {}
	local var_8_20 = #var_8_17

	for iter_8_4, iter_8_5 in ipairs(var_8_17) do
		local var_8_21 = iter_8_5:GetEndTime()

		if var_8_18 ~= var_8_21 then
			local var_8_22 = math.max(var_8_21 - var_8_18, 0)

			var_8_18 = var_8_21

			table.insert(var_8_19, {
				timeLength = var_8_22,
				buffCount = var_8_20
			})
		end

		var_8_20 = var_8_20 - 1
	end

	local var_8_23 = {}

	for iter_8_6, iter_8_7 in ipairs(var_8_19) do
		local var_8_24 = 0
		local var_8_25 = iter_8_7.buffCount
		local var_8_26 = #var_8_17

		for iter_8_8 = var_8_26, var_8_26 - var_8_25 + 1, -1 do
			local var_8_27 = var_8_17[iter_8_8]:GetBuffEffect()

			for iter_8_9, iter_8_10 in ipairs(var_8_27) do
				if iter_8_10[1] == var_8_4 then
					var_8_24 = var_8_24 + iter_8_10[2]
				end
			end
		end

		local var_8_28 = var_8_13 * (1 + var_8_24 * 0.01)
		local var_8_29 = var_8_1:GetAttrGradeByValue(var_8_28)

		if var_8_29 == var_8_14 then
			break
		end

		local var_8_30 = var_8_16 * (1 + 0.01 * pg.island_chara_att[var_8_29].effect)

		table.insert(var_8_23, {
			buffSpeed = var_8_30,
			timeLength = iter_8_7.timeLength
		})
	end

	local var_8_31 = {}
	local var_8_32 = var_8_3.workload

	for iter_8_11 = 1, arg_8_2 do
		local var_8_33 = var_8_32
		local var_8_34 = 0

		for iter_8_12, iter_8_13 in ipairs(var_8_23) do
			local var_8_35 = math.floor(var_8_33 / iter_8_13.buffSpeed)

			if var_8_35 <= iter_8_13.timeLength then
				iter_8_13.timeLength = iter_8_13.timeLength - var_8_35
				var_8_34 = var_8_34 + var_8_35
				var_8_33 = 0

				break
			else
				var_8_34 = var_8_34 + iter_8_13.timeLength
				var_8_33 = var_8_33 - iter_8_13.timeLength * iter_8_13.buffSpeed
				iter_8_13.timeLength = 0
			end
		end

		if var_8_33 > 0 then
			local var_8_36 = var_8_16 * (1 + 0.01 * var_8_15)

			var_8_34 = var_8_34 + math.floor(var_8_33 / var_8_36)
		end

		table.insert(var_8_31, var_8_34)
	end

	return var_8_31
end

return var_0_0

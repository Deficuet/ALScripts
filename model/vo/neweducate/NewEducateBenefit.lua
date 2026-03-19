local var_0_0 = class("NewEducateBenefit")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.buffs = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.actives) do
		arg_1_0.buffs[iter_1_1.id] = NewEducateBuff.New(iter_1_1)
	end

	arg_1_0:InitDisplayPct(arg_1_2.benefit_display)
	arg_1_0:InitDisplayNum(arg_1_2.dollar_num_display)
	arg_1_0:InitDisplayCounter(arg_1_2.counter)
end

function var_0_0.AddBuff(arg_2_0, arg_2_1)
	arg_2_0.buffs[arg_2_1.id] = NewEducateBuff.New(arg_2_1)
end

function var_0_0.RemoveBuff(arg_3_0, arg_3_1)
	arg_3_0.buffs[arg_3_1] = nil
end

function var_0_0.GetBuff(arg_4_0, arg_4_1)
	return arg_4_0.buffs[arg_4_1]
end

function var_0_0.GetListByType(arg_5_0, arg_5_1)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.buffs) do
		if iter_5_1:getConfig("is_show") == 1 and iter_5_1:getConfig("type") == arg_5_1 then
			table.insert(var_5_0, iter_5_1)
		end
	end

	table.sort(var_5_0, CompareFuncs({
		function(arg_6_0)
			return arg_6_0.round
		end,
		function(arg_7_0)
			return arg_7_0.id
		end
	}))

	return var_5_0
end

function var_0_0.GetAllBuffList(arg_8_0)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0.buffs) do
		table.insert(var_8_0, iter_8_1)
	end

	return var_8_0
end

function var_0_0.OnNextRound(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.buffs) do
		iter_9_1:OnNextRound(arg_9_1)

		if arg_9_1 == iter_9_1:GetEndRound() then
			arg_9_0.buffs[iter_9_1.id] = nil
		end
	end
end

function var_0_0.ExistBuff(arg_10_0, arg_10_1)
	return arg_10_0.buffs[arg_10_1]
end

function var_0_0.GetAllIds(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.buffs) do
		if iter_11_1:IsPending() then
			table.insert(var_11_1, iter_11_1.id)
		else
			table.insert(var_11_0, iter_11_1.id)
		end
	end

	return var_11_0, var_11_1
end

function var_0_0.InitDisplayPct(arg_12_0, arg_12_1)
	arg_12_0.displayPctData = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		if not arg_12_0.displayPctData[iter_12_1.type] then
			arg_12_0.displayPctData[iter_12_1.type] = {}
		end

		arg_12_0.displayPctData[iter_12_1.type][iter_12_1.id] = iter_12_1.number
	end
end

function var_0_0.UpdateDisplayPct(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		if not arg_13_0.displayPctData[iter_13_1.type] then
			arg_13_0.displayPctData[iter_13_1.type] = {}
		end

		arg_13_0.displayPctData[iter_13_1.type][iter_13_1.id] = iter_13_1.number
	end
end

function var_0_0.GetDisplayPctData(arg_14_0, arg_14_1, arg_14_2)
	if not arg_14_0.displayPctData[arg_14_1] then
		return 0
	end

	return arg_14_0.displayPctData[arg_14_1][arg_14_2] and calcFloor(arg_14_0.displayPctData[arg_14_1][arg_14_2] / 100) or 0
end

function var_0_0.GetDisplayPctList(arg_15_0)
	local var_15_0 = {}

	table.insert(var_15_0, {
		type = NewEducateConst.DROP_TYPE.RES,
		id = arg_15_0:GetResIdByType(NewEducateChar.RES_TYPE.MONEY)
	})

	for iter_15_0, iter_15_1 in ipairs(arg_15_0:GetAttrIds()) do
		table.insert(var_15_0, {
			type = NewEducateConst.DROP_TYPE.ATTR,
			id = iter_15_1
		})
	end

	return var_15_0
end

function var_0_0.IsMoodBenefit(arg_16_0)
	return arg_16_0 >= 10001 and arg_16_0 <= 10100
end

function var_0_0.GetFinalPct(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0 / 10000

	for iter_17_0, iter_17_1 in ipairs(arg_17_1) do
		var_17_0 = var_17_0 * (iter_17_1 / 10000)
	end

	return var_17_0 * 100
end

function var_0_0.GetDisplayPctByDrop(arg_18_0, arg_18_1)
	local var_18_0 = 0
	local var_18_1 = 0
	local var_18_2 = {}
	local var_18_3 = {}

	for iter_18_0, iter_18_1 in pairs(arg_18_0.buffs) do
		for iter_18_2, iter_18_3 in ipairs(pg.child2_benefit_list[iter_18_0].content) do
			if not var_0_0.IsMoodBenefit(iter_18_3) then
				local var_18_4, var_18_5 = var_0_0.GetDisplayPctByBenefitId(iter_18_3, arg_18_1)

				var_18_0 = var_18_0 + var_18_4[1]
				var_18_2 = table.mergeArray(var_18_2, var_18_4[2])
				var_18_1 = var_18_1 + var_18_5[1]
				var_18_3 = table.mergeArray(var_18_3, var_18_5[2])
			end
		end
	end

	return var_0_0.GetFinalPct(var_18_0, var_18_2), var_0_0.GetFinalPct(var_18_1, var_18_3)
end

function var_0_0.GetDisplayPctByBenefitId(arg_19_0, arg_19_1)
	local var_19_0 = 0
	local var_19_1 = 0
	local var_19_2 = {}
	local var_19_3 = {}
	local var_19_4 = pg.child2_benefit[arg_19_0]
	local var_19_5 = var_19_4.trigger == NewEducateConst.TRIGGER_TYPE.PERMANENT and #var_19_4.condition == 0

	for iter_19_0, iter_19_1 in ipairs(var_19_4.effect) do
		switch(iter_19_1[1], {
			[NewEducateConst.EFFECT_TYPE.ADD_PPT] = function()
				local var_20_0 = iter_19_1[2]

				if var_20_0[1] == arg_19_1.type and var_20_0[2] == arg_19_1.id then
					var_19_1 = var_19_1 + var_20_0[3]

					if var_19_5 then
						var_19_0 = var_19_0 + var_20_0[3]
					end
				end
			end,
			[NewEducateConst.EFFECT_TYPE.MULT_PPT] = function()
				local var_21_0 = iter_19_1[2]

				if var_21_0[1] == arg_19_1.type and var_21_0[2] == arg_19_1.id then
					table.insert(var_19_3, var_21_0[3])

					if var_19_5 then
						table.insert(var_19_2, var_21_0[3])
					end
				end
			end
		})
	end

	return {
		var_19_0,
		var_19_2
	}, {
		var_19_1,
		var_19_3
	}
end

function var_0_0.InitDisplayNum(arg_22_0, arg_22_1)
	arg_22_0:UpdateDisplayNum(arg_22_1)
end

function var_0_0.UpdateDisplayNum(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		if not arg_23_0.buffs[iter_23_1.buffid] then
			warning("not exist buff: ", iter_23_1.buffid)
		else
			arg_23_0.buffs[iter_23_1.buffid]:UpdateDisplayNum(iter_23_1.benefitval)
		end
	end
end

function var_0_0.InitDisplayCounter(arg_24_0, arg_24_1)
	arg_24_0.displayCounterData = {}

	for iter_24_0, iter_24_1 in ipairs(arg_24_1) do
		arg_24_0.displayCounterData[iter_24_1.group] = NewEducateBenefitCounter.New(iter_24_1)
	end
end

function var_0_0.UpdateDisplayCounter(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		local var_25_0 = arg_25_0.displayCounterData[iter_25_1.group]

		arg_25_0.displayCounterData[iter_25_1.group] = NewEducateBenefitCounter.New(iter_25_1)
	end
end

function var_0_0.GetDisplayCounterData(arg_26_0, arg_26_1)
	return arg_26_0.displayCounterData[arg_26_1]
end

function var_0_0.GetActiveEffectsByType(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.buffs) do
		local var_27_1 = iter_27_1:GetBenefitIdsByEffectType(arg_27_2)

		if #var_27_1 > 0 then
			for iter_27_2, iter_27_3 in ipairs(var_27_1) do
				if arg_27_1:IsMatchComplex(pg.child2_benefit[iter_27_3].condition) then
					for iter_27_4, iter_27_5 in ipairs(pg.child2_benefit[iter_27_3].effect) do
						if iter_27_5[1] == arg_27_2 then
							table.insert(var_27_0, iter_27_5)
						end
					end
				end
			end
		end
	end

	return var_27_0
end

function var_0_0.GetExtraPlan(arg_28_0, arg_28_1)
	local var_28_0 = {}
	local var_28_1 = arg_28_0:GetActiveEffectsByType(arg_28_1, NewEducateConst.EFFECT_TYPE.EXTRA_PLAN)

	underscore.each(var_28_1, function(arg_29_0)
		var_28_0 = table.mergeArray(var_28_0, arg_29_0[2], true)
	end)

	return var_28_0
end

function var_0_0.GetGoodsDiscountInfos(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0:GetActiveEffectsByType(arg_30_1, NewEducateConst.EFFECT_TYPE.REDUCE_GOODS_COST)

	return arg_30_0:GetCommonDiscountInfos(var_30_0)
end

function var_0_0.GetCommonDiscountInfos(arg_31_0, arg_31_1)
	local var_31_0 = {}

	underscore.each(arg_31_1, function(arg_32_0)
		local var_32_0 = arg_32_0[2][1]
		local var_32_1 = arg_32_0[2][2]
		local var_32_2 = arg_32_0[2][3]
		local var_32_3 = arg_32_0[2][4]

		if not var_31_0[var_32_0] then
			var_31_0[var_32_0] = {}
		end

		if not var_31_0[var_32_0][var_32_1] then
			var_31_0[var_32_0][var_32_1] = {
				value = 0,
				ratio = 0
			}
		end

		if var_32_2 == 1 then
			var_31_0[var_32_0][var_32_1].value = var_31_0[var_32_0][var_32_1].value + var_32_3
		elseif var_32_2 == 2 then
			var_31_0[var_32_0][var_32_1].ratio = var_31_0[var_32_0][var_32_1].ratio + var_32_3
		end
	end)

	return var_31_0
end

function var_0_0.GetActivePlanDiscountEffects(arg_33_0, arg_33_1)
	local var_33_0 = {}

	for iter_33_0, iter_33_1 in pairs(arg_33_0.buffs) do
		local var_33_1 = iter_33_1:GetBenefitIdsByEffectType(NewEducateConst.EFFECT_TYPE.REDUCE_PLAN_COST)

		if #var_33_1 > 0 then
			for iter_33_2, iter_33_3 in ipairs(var_33_1) do
				local var_33_2 = pg.child2_benefit[iter_33_3].condition
				local var_33_3 = arg_33_1:GetConditionIdsFromComplex(var_33_2)

				for iter_33_4, iter_33_5 in ipairs(var_33_3) do
					local var_33_4 = pg.child2_condition[iter_33_5]

					if var_33_4.type == 8 or var_33_4.type == 15 then
						local var_33_5 = {}

						for iter_33_6, iter_33_7 in ipairs(pg.child2_benefit[iter_33_3].effect) do
							if iter_33_7[1] == NewEducateConst.EFFECT_TYPE.REDUCE_PLAN_COST then
								table.insert(var_33_5, iter_33_7)
							end
						end

						for iter_33_8, iter_33_9 in ipairs(var_33_4.param[1]) do
							if not var_33_0[iter_33_9] then
								var_33_0[iter_33_9] = {}
							end

							var_33_0[iter_33_9] = table.mergeArray(var_33_0[iter_33_9], var_33_5)
						end
					end
				end
			end
		end
	end

	return var_33_0
end

function var_0_0.GetPlanDiscountInfos(arg_34_0, arg_34_1)
	local var_34_0 = {}
	local var_34_1 = arg_34_0:GetActivePlanDiscountEffects(arg_34_1)

	for iter_34_0, iter_34_1 in pairs(var_34_1) do
		var_34_0[iter_34_0] = arg_34_0:GetCommonDiscountInfos(iter_34_1)
	end

	return var_34_0
end

return var_0_0

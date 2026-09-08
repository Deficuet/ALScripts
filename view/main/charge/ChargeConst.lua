ChargeConst = {}

local var_0_0 = ChargeConst

function var_0_0.getBuyCount(arg_1_0, arg_1_1)
	if not arg_1_0 then
		return 0
	end

	local var_1_0 = arg_1_0[arg_1_1]

	return var_1_0 and var_1_0.buyCount or 0
end

function var_0_0.getGroupLimit(arg_2_0, arg_2_1)
	if not arg_2_0 then
		return 0
	end

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		if iter_2_1.shop_id == arg_2_1 then
			return iter_2_1.pay_count
		end
	end

	return 0
end

function var_0_0.getGoodsLimitInfo(arg_3_0)
	local var_3_0
	local var_3_1
	local var_3_2
	local var_3_3 = ShopConst.GetShopConfig(arg_3_0)

	if var_3_3 then
		local var_3_4 = var_3_3.limit_args[1]

		if type(var_3_4) == "table" then
			for iter_3_0, iter_3_1 in ipairs(var_3_3.limit_args) do
				local var_3_5 = iter_3_1[1]

				if var_3_5 == "level" then
					var_3_0 = iter_3_1[2]
				elseif var_3_5 == "count" then
					var_3_1 = iter_3_1[2]
					var_3_2 = iter_3_1[3]
				end
			end
		elseif type(var_3_4) == "string" then
			if var_3_4 == "level" then
				var_3_0 = var_3_3.limit_args[2]
			elseif var_3_4 == "count" then
				var_3_1 = var_3_3.limit_args[2]
				var_3_2 = var_3_3.limit_args[3]
			end
		end
	end

	return var_3_0, var_3_1, var_3_2
end

function var_0_0.isNeedSetBirth()
	return false
end

return var_0_0

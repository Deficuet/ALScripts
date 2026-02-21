local var_0_0 = class("IslandProductCostHelper")

function var_0_0.GetReducePercentInPlace(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_1_0)
	local var_1_1 = 0

	for iter_1_0, iter_1_1 in ipairs(var_1_0:GetSkill():GetUnlockShipEffectIds()) do
		local var_1_2 = pg.island_buff_template[iter_1_1]

		if var_1_2.buff_type == IslandBuffType.SHIP_PRODUCT_POWER_COST then
			local var_1_3 = var_1_2.type_use
			local var_1_4 = var_1_3[1]

			if underscore.any(var_1_4, function(arg_2_0)
				return arg_2_0 == arg_1_1
			end) then
				var_1_1 = var_1_1 + var_1_3[2]
			end
		end
	end

	return var_1_1 * 0.01
end

return var_0_0

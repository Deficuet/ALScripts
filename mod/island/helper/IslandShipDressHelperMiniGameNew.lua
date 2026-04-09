local var_0_0 = class("IslandShipDressHelperMiniGameNew", import(".IslandShipDressHelperNew"))

function var_0_0.SetShipId(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.super.SetShipId(arg_1_0, arg_1_1)

	if not arg_1_3 then
		arg_1_0.dataAfterRoleInit = {}

		for iter_1_0, iter_1_1 in ipairs(arg_1_2) do
			local var_1_0 = {
				id = iter_1_1
			}

			var_1_0.colorId = 0

			local var_1_1 = pg.island_dress_template[iter_1_1].type

			for iter_1_2, iter_1_3 in ipairs(pg.gameset.bar_not_display_dress_type.description) do
				if var_1_1 ~= iter_1_3 and var_1_1 ~= var_0_0.DressType.Flotage then
					arg_1_0.dataAfterRoleInit[var_1_1] = var_1_0
				end
			end
		end
	end
end

return var_0_0

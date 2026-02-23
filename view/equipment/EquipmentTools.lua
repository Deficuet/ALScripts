local var_0_0 = {
	IsMatchKey = function(arg_1_0, arg_1_1)
		if not arg_1_1 or arg_1_1 == "" then
			return true
		end

		arg_1_1 = string.lower(string.gsub(arg_1_1, "%.", "%%."))

		return underscore.any(arg_1_0, function(arg_2_0)
			return string.find(string.lower(arg_2_0), arg_1_1)
		end)
	end
}

function var_0_0.IsMatchEquipmentSkinKey(arg_3_0, arg_3_1)
	local var_3_0 = {
		pg.equip_skin_template[arg_3_0].name
	}

	return var_0_0.IsMatchKey(var_3_0, arg_3_1)
end

function var_0_0.GetMatchSpEquipmentListKeyByShip(arg_4_0)
	local var_4_0 = var_0_0.GetMatchShipGroupListKey(arg_4_0)
	local var_4_1 = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_0) do
		local var_4_2 = pg.spweapon_data_statistics.get_id_list_by_unique[iter_4_1]

		if var_4_2 ~= nil then
			var_4_1 = table.insertto(var_4_1, var_4_2)
		end
	end

	return var_4_1
end

function var_0_0.GetMatchShipGroupListKey(arg_5_0)
	if arg_5_0 == "" then
		return {}
	end

	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(pg.ship_data_statistics.all) do
		local var_5_1 = pg.ship_data_statistics[iter_5_1].name

		if var_0_0.IsMatchKey({
			var_5_1
		}, arg_5_0) then
			local var_5_2 = math.floor(iter_5_1 / 10)

			if not table.contains(var_5_0, var_5_2) then
				table.insert(var_5_0, var_5_2)
			end
		end
	end

	return var_5_0
end

return var_0_0

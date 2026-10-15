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
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in pairs(pg.spweapon_data_statistics.get_id_list_by_unique) do
		if iter_4_0 ~= 0 then
			for iter_4_2, iter_4_3 in ipairs(pg.ship_data_template.get_id_list_by_group_type[iter_4_0]) do
				if string.find(string.lower(pg.ship_data_statistics[iter_4_3].name), arg_4_0) then
					var_4_0 = table.insertto(var_4_0, iter_4_1)

					break
				end
			end
		end
	end
end

function var_0_0.HasEquipByGroup(arg_5_0)
	local var_5_0 = getProxy(EquipmentProxy)

	for iter_5_0, iter_5_1 in ipairs(var_5_0:GetEquipmentsRaw()) do
		if iter_5_1:getConfig("group") == arg_5_0 then
			return true
		end
	end

	return false
end

function var_0_0.HasBaseSpWeapon(arg_6_0)
	local var_6_0 = getProxy(EquipmentProxy)
	local var_6_1 = var_0_0.GetBaseSpWeaponID(arg_6_0)

	for iter_6_0, iter_6_1 in pairs(var_6_0:GetSpWeapons()) do
		if var_0_0.GetBaseSpWeaponID(iter_6_1.id) == var_6_1 then
			return true
		end
	end

	return false
end

function var_0_0.GetBaseSpWeaponID(arg_7_0)
	local var_7_0 = pg.spweapon_data_statistics[arg_7_0]

	if var_7_0.prev == 0 then
		return arg_7_0
	end

	return var_0_0.GetBaseSpWeaponID(var_7_0.prev)
end

return var_0_0

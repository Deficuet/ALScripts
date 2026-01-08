ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleDataFunction
local var_0_2 = var_0_0.Battle.BattleFormulas
local var_0_3 = var_0_0.Battle.BattleAttr
local var_0_4 = var_0_0.Battle.BattleConst
local var_0_5 = var_0_4.EquipmentType
local var_0_6 = var_0_0.Battle.BattleConfig

var_0_0.Battle.BattleSupportUnit = class("BattleSupportUnit", var_0_0.Battle.BattlePlayerUnit)
var_0_0.Battle.BattleSupportUnit.__name = "BattleSupportUnit"

local var_0_7 = var_0_0.Battle.BattleSupportUnit

function var_0_7.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_7.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._type = var_0_4.UnitType.SUPPORT_UNIT
end

function var_0_7.setWeapon(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0._tmpData.default_equip_list
	local var_2_1 = arg_2_0._tmpData.base_list
	local var_2_2 = arg_2_0._proficiencyList
	local var_2_3 = arg_2_0._tmpData.preload_count

	for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
		if iter_2_1 and iter_2_1.skin and iter_2_1.skin ~= 0 and Equipment.IsOrbitSkin(iter_2_1.skin) then
			arg_2_0._orbitSkinIDList = arg_2_0._orbitSkinIDList or {}

			table.insert(arg_2_0._orbitSkinIDList, iter_2_1.skin)
		end

		if iter_2_0 <= Ship.WEAPON_COUNT then
			local var_2_4 = var_2_2[iter_2_0]
			local var_2_5 = var_2_3[iter_2_0]

			local function var_2_6(arg_3_0, arg_3_1, arg_3_2)
				local var_3_0 = var_0_1.GetWeaponPropertyDataFromID(arg_3_0).type

				if var_3_0 == var_0_4.EquipmentType.INTERCEPT_AIRCRAFT or var_3_0 == var_0_4.EquipmentType.TORPEDO then
					local var_3_1 = var_2_1[iter_2_0]

					for iter_3_0 = 1, var_3_1 do
						local var_3_2 = arg_2_0:AddWeapon(arg_3_0, arg_3_1, arg_3_2, var_2_4, iter_2_0)
						local var_3_3 = var_3_2:GetTemplateData().type

						if iter_2_1.equipment then
							var_3_2:SetSrcEquipmentID(iter_2_1.equipment.id)
						end
					end
				end
			end

			if iter_2_1.equipment and #iter_2_1.equipment.weapon_id > 0 then
				if iter_2_1.equipment.type == EquipType.FighterAircraft or iter_2_1.equipment.type == EquipType.SubmarineTorpedo then
					local var_2_7 = iter_2_1.equipment.weapon_id

					for iter_2_2, iter_2_3 in ipairs(var_2_7) do
						local var_2_8 = var_0_1.GetWeaponPropertyDataFromID(iter_2_3).type
						local var_2_9 = var_0_6.EQUIPMENT_ACTIVE_LIMITED_BY_TYPE[var_2_8]

						if (not var_2_9 or table.contains(var_2_9, arg_2_0._tmpData.type)) and iter_2_3 and iter_2_3 ~= -1 then
							var_2_6(iter_2_3, iter_2_1.equipment.label, iter_2_1.skin)
						end
					end
				end
			else
				local var_2_10 = var_2_0[iter_2_0]
				local var_2_11 = var_0_1.GetWeaponDataFromID(var_2_10)

				if var_2_11.type == EquipType.FighterAircraft or var_2_11.type == EquipType.SubmarineTorpedo then
					var_2_6(var_2_10, var_2_11.label)
				end
			end
		end
	end

	local var_2_12 = #var_2_0
	local var_2_13 = arg_2_0._tmpData.fix_equip_list

	for iter_2_4, iter_2_5 in ipairs(var_2_13) do
		if iter_2_5 and iter_2_5 ~= -1 then
			local var_2_14 = var_0_1.GetWeaponPropertyDataFromID(iter_2_5).type

			if var_2_14 == var_0_4.EquipmentType.INTERCEPT_AIRCRAFT or var_2_14 == var_0_4.EquipmentType.TORPEDO then
				local var_2_15 = var_2_2[iter_2_4 + var_2_12] or 1

				arg_2_0:AddWeapon(iter_2_5, nil, nil, var_2_15, iter_2_4 + var_2_12):SetFixedFlag()
			end
		end
	end
end

function var_0_7.AddWeapon(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5, arg_4_6)
	local var_4_0 = var_0_1.CreateWeaponUnit(arg_4_1, arg_4_0, arg_4_4, arg_4_5)

	arg_4_0._totalWeapon[#arg_4_0._totalWeapon + 1] = var_4_0

	if arg_4_2 then
		var_4_0:SetEquipmentLabel(arg_4_2)
	end

	var_4_0:SetSupportWeapon()
	arg_4_0:AddAutoWeapon(var_4_0)

	if arg_4_3 and arg_4_3 ~= 0 then
		var_4_0:SetSkinData(arg_4_3)
		arg_4_0:SetPriorityWeaponSkin(arg_4_3)
	end

	return var_4_0
end

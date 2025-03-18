ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleBuffAddBulletAttr = class("BattleBuffAddBulletAttr", var_0_0.Battle.BattleBuffEffect)
var_0_0.Battle.BattleBuffAddBulletAttr.__name = "BattleBuffAddBulletAttr"

local var_0_1 = var_0_0.Battle.BattleBuffAddBulletAttr

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._attr = arg_2_0._tempData.arg_list.attr
	arg_2_0._number = arg_2_0._tempData.arg_list.number
	arg_2_0._rate = arg_2_0._tempData.arg_list.rate or 10000
	arg_2_0._bulletID = arg_2_0._tempData.arg_list.bulletID
	arg_2_0._weaponIndexList = arg_2_0._tempData.arg_list.index
	arg_2_0._numberBase = arg_2_0._number
	arg_2_0._displacementConvert = arg_2_0._tempData.arg_list.displacement_convert
	arg_2_0._displacementDynamic = arg_2_0._tempData.arg_list.displacement_convert_dynamic
end

function var_0_1.onStack(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._number = arg_3_0._numberBase * arg_3_2._stack
end

function var_0_1.onBulletCreate(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if not arg_4_0:equipIndexRequire(arg_4_3.equipIndex) then
		return
	end

	arg_4_0:calcBulletAttr(arg_4_3)
end

function var_0_1.onInternalBulletCreate(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_0:equipIndexRequire(arg_5_3.equipIndex) then
		return
	end

	arg_5_0:calcBulletAttr(arg_5_3)
end

function var_0_1.onManualBulletCreate(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	if not arg_6_0:equipIndexRequire(arg_6_3.equipIndex) then
		return
	end

	arg_6_0:calcBulletAttr(arg_6_3)
end

function var_0_1.onBulletCollideBefore(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if not arg_7_0:equipIndexRequire(arg_7_3.equipIndex) then
		return
	end

	arg_7_0:displacementConvert(arg_7_3, arg_7_1)
	arg_7_0:calcBulletAttr(arg_7_3)
end

function var_0_1.onBombBulletBang(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if not arg_8_0:equipIndexRequire(arg_8_3.equipIndex) then
		return
	end

	arg_8_0:displacementConvert(arg_8_3, arg_8_1)
	arg_8_0:calcBulletAttr(arg_8_3)
end

function var_0_1.onTorpedoBulletBang(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	if not arg_9_0:equipIndexRequire(arg_9_3.equipIndex) then
		return
	end

	arg_9_0:displacementConvert(arg_9_3, arg_9_1)
	arg_9_0:calcBulletAttr(arg_9_3)
end

function var_0_1.displacementConvert(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_1._bullet

	if arg_10_0._displacementConvert then
		local var_10_1 = var_10_0:GetCurrentDistance()
		local var_10_2 = arg_10_0._displacementConvert.base
		local var_10_3 = arg_10_0._displacementConvert.rate
		local var_10_4 = arg_10_0._displacementConvert.max

		if var_10_3 > 0 then
			arg_10_0._number = math.min(math.max(var_10_1 - var_10_2, 0) * var_10_3, var_10_4)
		elseif var_10_3 < 0 then
			arg_10_0._number = math.min(math.max(0, var_10_4 + (var_10_1 - var_10_2) * var_10_3), var_10_4)
		elseif var_10_3 == 0 then
			arg_10_0._number = 0
		end
	elseif arg_10_0._displacementDynamic then
		local var_10_5 = arg_10_0._displacementDynamic.check_caster
		local var_10_6 = arg_10_0._displacementDynamic.base
		local var_10_7 = arg_10_0._displacementDynamic.rate
		local var_10_8 = arg_10_0._displacementDynamic.max
		local var_10_9 = arg_10_0:getTargetList(arg_10_2, var_10_5, arg_10_0._displacementDynamic)

		if var_10_9 and #var_10_9 > 0 then
			local var_10_10 = var_10_9[1]:GetPosition()
			local var_10_11 = var_10_0:GetPosition()
			local var_10_12 = Vector3.Distance(var_10_10, var_10_11)

			arg_10_0._number = math.min(math.max(var_10_12 - var_10_6, 0) * var_10_7, var_10_8)
		else
			arg_10_0._number = 0
		end
	end
end

function var_0_1.calcBulletAttr(arg_11_0, arg_11_1)
	if var_0_0.Battle.BattleFormulas.IsHappen(arg_11_0._rate) then
		local var_11_0 = arg_11_1._bullet
		local var_11_1 = var_11_0:GetWeapon():GetEquipmentIndex()
		local var_11_2 = false

		if not arg_11_0._weaponIndexList then
			var_11_2 = true
		elseif #arg_11_0._weaponIndexList == 0 and var_11_1 == nil then
			var_11_2 = true
		elseif table.contains(arg_11_0._weaponIndexList, var_11_1) then
			var_11_2 = true
		end

		if var_11_2 then
			if arg_11_0._bulletID then
				if var_11_0:GetTemplate().id == arg_11_0._bulletID then
					var_0_0.Battle.BattleAttr.Increase(var_11_0, arg_11_0._attr, arg_11_0._number)
				end
			else
				var_0_0.Battle.BattleAttr.Increase(var_11_0, arg_11_0._attr, arg_11_0._number)
			end
		end
	end
end

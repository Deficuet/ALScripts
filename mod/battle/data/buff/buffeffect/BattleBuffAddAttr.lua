ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleBuffAddAttr", var_0_0.Battle.BattleBuffEffect)

var_0_0.Battle.BattleBuffAddAttr = var_0_1
var_0_1.__name = "BattleBuffAddAttr"
var_0_1.FX_TYPE = var_0_0.Battle.BattleBuffEffect.FX_TYPE_MOD_ATTR

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_0.Battle.BattleBuffAddAttr.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.GetEffectType(arg_2_0)
	return var_0_1.FX_TYPE
end

function var_0_1.SetArgs(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._group = arg_3_0._tempData.arg_list.group or arg_3_2:GetID()

	if arg_3_0._tempData.arg_list.comboDamage then
		arg_3_0._attr = var_0_0.Battle.BattleAttr.GetCurrent(arg_3_0._caster, "comboTag")
	else
		arg_3_0._attr = arg_3_0._tempData.arg_list.attr
	end

	arg_3_0._number = arg_3_0._tempData.arg_list.number
	arg_3_0._numberBase = arg_3_0._number
	arg_3_0._attrID = arg_3_0._tempData.arg_list.attr_group_ID
end

function var_0_1.onAttach(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:UpdateAttr(arg_4_1)
end

function var_0_1.onStack(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = math.min(arg_5_2._stackCap, arg_5_2._stack)

	arg_5_0._number = arg_5_0._numberBase * var_5_0

	arg_5_0:UpdateAttr(arg_5_1)
end

function var_0_1.onRemove(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0._number = 0

	arg_6_0:UpdateAttr(arg_6_1)
end

function var_0_1.IsSameAttr(arg_7_0, arg_7_1)
	return arg_7_0._attr == arg_7_1
end

function var_0_1.UpdateAttr(arg_8_0, arg_8_1)
	assert(arg_8_0._attr ~= "velocity", ">>BattleBuffAddAttr(Ratio)不可用于修改速度，使用BattleBuffFixVelocity!")

	if arg_8_0._attr == "injureRatio" then
		arg_8_0:UpdateAttrMul(arg_8_1)
	else
		arg_8_0:UpdateAttrAdd(arg_8_1)
	end

	if arg_8_0._attr == "cloakExposeExtra" or arg_8_0._attr == "cloakRestore" or arg_8_0._attr == "cloakRecovery" then
		arg_8_1:UpdateCloakConfig()
	end

	if arg_8_0._attr == "lockAimBias" then
		arg_8_1:UpdateAimBiasSkillState()
	end
end

function var_0_1.CheckWeapon(arg_9_0)
	if arg_9_0._attr == "loadSpeed" then
		return true
	else
		return false
	end
end

function var_0_1.UpdateAttrMul(arg_10_0, arg_10_1)
	local var_10_0 = 1
	local var_10_1 = 1
	local var_10_2 = {}
	local var_10_3 = {}
	local var_10_4 = arg_10_1:GetBuffList()

	for iter_10_0, iter_10_1 in pairs(var_10_4) do
		for iter_10_2, iter_10_3 in ipairs(iter_10_1._effectList) do
			if iter_10_3:GetEffectType() == var_0_1.FX_TYPE and iter_10_3:IsSameAttr(arg_10_0._attr) then
				local var_10_5 = iter_10_3._number
				local var_10_6 = iter_10_3._group
				local var_10_7 = var_10_2[var_10_6] or 0
				local var_10_8 = var_10_3[var_10_6] or 0

				if var_10_7 < var_10_5 and var_10_5 > 0 then
					var_10_0 = var_10_0 * (1 + var_10_5) / (1 + var_10_7)
					var_10_7 = var_10_5
				end

				if var_10_5 < var_10_8 and var_10_5 < 0 then
					var_10_1 = var_10_1 * (1 + var_10_5) / (1 + var_10_8)
					var_10_8 = var_10_5
				end

				var_10_2[var_10_6] = var_10_7
				var_10_3[var_10_6] = var_10_8
			end
		end
	end

	var_0_0.Battle.BattleAttr.FlashByBuff(arg_10_1, arg_10_0._attr, var_10_0 * var_10_1 - 1)

	if arg_10_0:CheckWeapon() then
		arg_10_1:FlushReloadingWeapon()
	end
end

function var_0_1.UpdateAttrAdd(arg_11_0, arg_11_1)
	local var_11_0, var_11_1 = arg_11_1:GetHP()
	local var_11_2 = arg_11_1:GetBuffList()
	local var_11_3 = 0
	local var_11_4 = 0
	local var_11_5 = {}
	local var_11_6 = {}

	for iter_11_0, iter_11_1 in pairs(var_11_2) do
		for iter_11_2, iter_11_3 in ipairs(iter_11_1._effectList) do
			if iter_11_3:GetEffectType() == var_0_1.FX_TYPE and iter_11_3:IsSameAttr(arg_11_0._attr) then
				local var_11_7 = iter_11_3._number
				local var_11_8 = iter_11_3._group
				local var_11_9 = var_11_5[var_11_8] or 0
				local var_11_10 = var_11_6[var_11_8] or 0

				if var_11_9 < var_11_7 and var_11_7 > 0 then
					var_11_3 = var_11_3 + var_11_7 - var_11_9
					var_11_9 = var_11_7
				end

				if var_11_7 < var_11_10 and var_11_7 < 0 then
					var_11_4 = var_11_4 + var_11_7 - var_11_10
					var_11_10 = var_11_7
				end

				var_11_5[var_11_8] = var_11_9
				var_11_6[var_11_8] = var_11_10
			end
		end
	end

	var_0_0.Battle.BattleAttr.FlashByBuff(arg_11_1, arg_11_0._attr, var_11_3 + var_11_4)

	local var_11_11 = arg_11_1:GetMaxHP()
	local var_11_12 = math.min(var_11_11, var_11_0 + math.max(0, var_11_11 - var_11_1))

	arg_11_1:SetCurrentHP(var_11_12)

	if arg_11_0:CheckWeapon() then
		arg_11_1:FlushReloadingWeapon()
	end

	arg_11_1._move:ImmuneAreaLimit(var_0_0.Battle.BattleAttr.IsImmuneAreaLimit(arg_11_1))
	arg_11_1._move:ImmuneMaxAreaLimit(var_0_0.Battle.BattleAttr.IsImmuneMaxAreaLimit(arg_11_1))
end

function var_0_1.UpdateAttrHybrid(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:GetBuffList()
	local var_12_1 = {}
	local var_12_2 = {}

	for iter_12_0, iter_12_1 in pairs(var_12_0) do
		for iter_12_2, iter_12_3 in ipairs(iter_12_1._effectList) do
			if iter_12_3:GetEffectType() == var_0_1.FX_TYPE and iter_12_3:IsSameAttr(arg_12_0._attr) then
				local var_12_3 = iter_12_3._number
				local var_12_4 = iter_12_3._group
				local var_12_5 = iter_12_3._attrID or 0

				if var_12_3 > 0 then
					local var_12_6 = var_12_1[var_12_4] or {
						value = 0,
						attrGroup = var_12_5
					}

					var_12_6.value = math.max(var_12_6.value, var_12_3)
					var_12_1[var_12_4] = var_12_6
				elseif var_12_3 < 0 then
					local var_12_7 = var_12_2[var_12_4] or {
						value = 0,
						attrGroup = var_12_5
					}

					var_12_7.value = math.min(var_12_7.value, var_12_3)
					var_12_2[var_12_4] = var_12_7
				end
			end
		end
	end

	local function var_12_8(arg_13_0)
		local var_13_0 = {}
		local var_13_1

		for iter_13_0, iter_13_1 in pairs(arg_13_0) do
			local var_13_2 = iter_13_1.attrGroup

			var_13_0[var_13_2] = (var_13_0[var_13_2] or 0) + iter_13_1.value
		end

		for iter_13_2, iter_13_3 in pairs(var_13_0) do
			var_13_1 = (var_13_1 or 1) * iter_13_3
		end

		return var_13_1
	end

	local var_12_9 = var_12_8(var_12_1) or 0
	local var_12_10 = var_12_8(var_12_2) or 0

	var_0_0.Battle.BattleAttr.FlashByBuff(arg_12_1, arg_12_0._attr, var_12_9 + var_12_10)
end

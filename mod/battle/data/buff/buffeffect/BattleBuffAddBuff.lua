ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleDataFunction
local var_0_2 = var_0_0.Battle.BattleFormulas
local var_0_3 = class("BattleBuffAddBuff", var_0_0.Battle.BattleBuffEffect)

var_0_0.Battle.BattleBuffAddBuff = var_0_3
var_0_3.__name = "BattleBuffAddBuff"

function var_0_3.Ctor(arg_1_0, arg_1_1)
	var_0_0.Battle.BattleBuffAddBuff.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_3.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._level = arg_2_2:GetLv()

	local var_2_0 = arg_2_0._tempData.arg_list

	arg_2_0._buff_id = var_2_0.buff_id
	arg_2_0._target = var_2_0.target or "TargetSelf"
	arg_2_0._time = var_2_0.time or 0
	arg_2_0._rant = var_2_0.rant or 10000
	arg_2_0._nextEffectTime = pg.TimeMgr.GetInstance():GetCombatTime() + arg_2_0._time
	arg_2_0._check_target = var_2_0.check_target
	arg_2_0._minTargetNumber = var_2_0.minTargetNumber or 0
	arg_2_0._maxTargetNumber = var_2_0.maxTargetNumber or 10000
	arg_2_0._isBuffStackByCheckTarget = var_2_0.isBuffStackByCheckTarget
	arg_2_0._countType = var_2_0.countType
	arg_2_0._weaponType = arg_2_0._tempData.arg_list.weaponType
	arg_2_0._repeatCount = var_2_0.repeat_count or 1
	arg_2_0._attrConsumeRepeat = var_2_0.fleetAttrConsume
end

function var_0_3.onUpdate(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_3.timeStamp

	if var_3_0 >= arg_3_0._nextEffectTime then
		arg_3_0:AddBuff(arg_3_1, arg_3_3, arg_3_2)

		arg_3_0._nextEffectTime = var_3_0 + arg_3_0._time
	end
end

function var_0_3.onBulletHit(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	if not arg_4_0:equipIndexRequire(arg_4_3.equipIndex) then
		return
	end

	local var_4_0 = arg_4_3.target

	if (not arg_4_0._weaponType or arg_4_3.weaponType == arg_4_0._weaponType) and var_4_0:IsAlive() then
		arg_4_0:attachBuff(arg_4_0._buff_id, arg_4_0._level, var_4_0, arg_4_2)
	end
end

function var_0_3.onBulletCreate(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_0:equipIndexRequire(arg_5_3.equipIndex) then
		return
	end

	local var_5_0 = arg_5_3._bullet
	local var_5_1 = arg_5_0._buff_id
	local var_5_2 = arg_5_0._level
	local var_5_3 = arg_5_0._tempData.arg_list.bulletTrigger

	local function var_5_4(arg_6_0, arg_6_1)
		arg_5_0:attachBuff(var_5_1, var_5_2, arg_6_0, arg_5_2)
	end

	var_5_0:SetBuffFun(var_5_3, var_5_4)
end

function var_0_3.onTrigger(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	var_0_3.super.onTrigger(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	arg_7_0:AddBuff(arg_7_1, arg_7_3, arg_7_2)
end

function var_0_3.AddBuff(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if not arg_8_0:commanderRequire(arg_8_1, arg_8_0._tempData.arg_list) then
		return
	end

	if not arg_8_0:ammoRequire(arg_8_1) then
		return
	end

	if arg_8_0._check_target then
		local var_8_0 = #arg_8_0:getTargetList(arg_8_1, arg_8_0._check_target, arg_8_0._tempData.arg_list, arg_8_2)

		if var_8_0 >= arg_8_0._minTargetNumber and var_8_0 <= arg_8_0._maxTargetNumber then
			local var_8_1 = arg_8_0:getTargetList(arg_8_1, arg_8_0._target, arg_8_0._tempData.arg_list, arg_8_2)

			for iter_8_0, iter_8_1 in ipairs(var_8_1) do
				if arg_8_0._isBuffStackByCheckTarget then
					iter_8_1:SetBuffStack(arg_8_0._buff_id, arg_8_0._level, var_8_0)
				else
					arg_8_0:attachBuff(arg_8_0._buff_id, arg_8_0._level, iter_8_1, arg_8_3)
				end
			end
		end
	else
		local var_8_2 = arg_8_0:getTargetList(arg_8_1, arg_8_0._target, arg_8_0._tempData.arg_list, arg_8_2)

		for iter_8_2, iter_8_3 in ipairs(var_8_2) do
			arg_8_0:attachBuff(arg_8_0._buff_id, arg_8_0._level, iter_8_3, arg_8_3)
		end
	end
end

function var_0_3.attachBuff(arg_9_0, arg_9_1, arg_9_2, arg_9_3, arg_9_4)
	local var_9_0 = var_0_1.GetBuffTemplate(arg_9_1).effect_list
	local var_9_1

	if #var_9_0 == 1 and var_9_0[1].type == "BattleBuffDOT" then
		if var_0_2.CaclulateDOTPlace(arg_9_0._rant, var_9_0[1], arg_9_0._caster, arg_9_3) then
			var_9_1 = var_0_0.Battle.BattleBuffUnit.New(arg_9_1, nil, arg_9_0._caster)

			var_9_1:SetOrb(arg_9_0._caster, 1)
		end
	elseif var_0_2.IsHappen(arg_9_0._rant) then
		var_9_1 = var_0_0.Battle.BattleBuffUnit.New(arg_9_1, arg_9_2, arg_9_0._caster)
	end

	if var_9_1 then
		var_9_1:SetCommander(arg_9_0._commander)

		local var_9_2

		if arg_9_0._attrConsumeRepeat then
			var_9_2 = arg_9_0:fleetAttrRepeatConsume(arg_9_0._attrConsumeRepeat)
		else
			var_9_2 = arg_9_0:repeatCountParse(arg_9_0._repeatCount)
		end

		if var_9_2 == -1 then
			var_9_2 = arg_9_4:GetStack()
		end

		for iter_9_0 = 1, var_9_2 do
			arg_9_3:AddBuff(var_9_1)
		end
	end
end

function var_0_3.Dispose(arg_10_0)
	var_0_0.Battle.BattleBuffAddBuff.super:Dispose()
	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_10_0._timer)

	arg_10_0._timer = nil
end

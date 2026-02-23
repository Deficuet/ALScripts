ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConfig
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleBulletEvent
local var_0_4 = var_0_0.Battle.BattleFormulas

var_0_0.Battle.BattleShrapnelBulletUnit = class("BattleShrapnelBulletUnit", var_0_0.Battle.BattleBulletUnit)
var_0_0.Battle.BattleShrapnelBulletUnit.__name = "BattleShrapnelBulletUnit"

local var_0_5 = var_0_0.Battle.BattleShrapnelBulletUnit

var_0_5.STATE_NORMAL = "normal"
var_0_5.STATE_SPLIT = "split"
var_0_5.STATE_SPIN = "spin"
var_0_5.STATE_FINAL_SPLIT = "final_split"
var_0_5.STATE_EXPIRE = "expire"
var_0_5.STATE_PRIORITY = {
	[var_0_5.STATE_EXPIRE] = 5,
	[var_0_5.STATE_FINAL_SPLIT] = 4,
	[var_0_5.STATE_SPLIT] = 3,
	[var_0_5.STATE_SPIN] = 2,
	[var_0_5.STATE_NORMAL] = 1
}

function var_0_5.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_5.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._splitCount = 0
	arg_1_0._cacheEmitter = {}

	arg_1_0:ChangeShrapnelState(arg_1_0.STATE_NORMAL)
end

function var_0_5.Hit(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0:GetTemplate().extra_param.rangeAA then
		return
	end

	var_0_5.super.Hit(arg_2_0, arg_2_1, arg_2_2)

	arg_2_0._pierceCount = arg_2_0._pierceCount - 1
end

function var_0_5.SplitFinishCount(arg_3_0)
	arg_3_0._splitCount = arg_3_0._splitCount + 1
end

function var_0_5.IsAllSplitFinish(arg_4_0)
	return arg_4_0._splitCount >= #arg_4_0._tempData.extra_param.shrapnel
end

function var_0_5.SetTemplateData(arg_5_0, arg_5_1)
	var_0_5.super.SetTemplateData(arg_5_0, arg_5_1)

	arg_5_0._outbound = arg_5_0._tempData.out_bound
end

function var_0_5.GetOutBound(arg_6_0)
	return arg_6_0._outbound
end

function var_0_5.Update(arg_7_0, arg_7_1)
	if arg_7_0._startCount == nil and arg_7_0._outbound == var_0_2.BulletOutBound.SHIFT_SPLIT then
		arg_7_0._startCount = arg_7_1
	end

	if arg_7_0._outbound == var_0_2.BulletOutBound.SHIFT_SPLIT then
		if arg_7_0._startCount == nil then
			arg_7_0._startCount = arg_7_1
		elseif arg_7_1 - arg_7_0._startCount > var_0_1.BULLET_SPLIT_SHIFT_DELAY then
			arg_7_0._outbound = var_0_2.BulletOutBound.SPLIT
		end
	end

	if arg_7_0._currentState == var_0_5.STATE_NORMAL then
		local var_7_0 = arg_7_0._verticalSpeed

		var_0_5.super.Update(arg_7_0, arg_7_1)

		if var_7_0 ~= 0 and var_7_0 * arg_7_0._verticalSpeed < 0 then
			arg_7_0:ChangeShrapnelState(var_0_5.STATE_SPLIT)
		end
	elseif arg_7_0._currentState == var_0_5.STATE_SPIN and (not arg_7_0._tempData.extra_param.lastTime or arg_7_1 - arg_7_0._spinStartTime > arg_7_0._tempData.extra_param.lastTime) then
		arg_7_0:ChangeShrapnelState(var_0_5.STATE_SPLIT)
	end
end

function var_0_5.ChangeShrapnelState(arg_8_0, arg_8_1)
	local var_8_0 = var_0_5.STATE_PRIORITY[arg_8_0._currentState]

	if var_8_0 and var_8_0 >= var_0_5.STATE_PRIORITY[arg_8_1] then
		return
	end

	arg_8_0._currentState = arg_8_1

	if arg_8_0._currentState == var_0_5.STATE_SPIN then
		arg_8_0._spinStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	elseif arg_8_0._currentState == var_0_5.STATE_SPLIT then
		arg_8_0:DispatchEvent(var_0_0.Event.New(var_0_3.SPLIT, {}))
	end
end

function var_0_5.IsOutRange(arg_9_0, arg_9_1)
	if arg_9_0._currentState == var_0_5.STATE_NORMAL then
		return var_0_5.super.IsOutRange(arg_9_0, arg_9_1)
	else
		return false
	end
end

function var_0_5.SetSrcHost(arg_10_0, arg_10_1)
	arg_10_0._srcHost = arg_10_1
end

function var_0_5.GetSrcHost(arg_11_0)
	return arg_11_0._srcHost
end

function var_0_5.GetShrapnelParam(arg_12_0)
	return arg_12_0._tempData.extra_param
end

function var_0_5.GetCurrentState(arg_13_0)
	return arg_13_0._currentState
end

function var_0_5.SetSpawnPosition(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetTemplate().extra_param
	local var_14_1 = arg_14_1

	if var_14_0.directHit then
		var_14_1 = Clone(arg_14_0._explodePos)
	end

	var_0_5.super.SetSpawnPosition(arg_14_0, var_14_1)

	local var_14_2 = pg.Tool.FilterY(arg_14_0._spawnPos)
	local var_14_3 = Vector3.Distance(var_14_2, pg.Tool.FilterY(arg_14_0._explodePos))

	if var_14_0.flare then
		local var_14_4 = var_14_0.shrapnel[1].bullet_ID
		local var_14_5 = var_0_0.Battle.BattleDataFunction.GetBulletTmpDataFromID(var_14_4)
		local var_14_6 = var_14_5.hit_type.time
		local var_14_7 = 0.5 * math.abs(var_14_5.extra_param.gravity or -0.0005) * (var_14_6 * var_0_1.calcFPS)^2 - arg_14_0._spawnPos.y

		arg_14_0._convertedVelocity = math.sqrt(-0.5 * arg_14_0._gravity * var_14_3 * var_14_3 / var_14_7)

		local var_14_8 = var_14_3 / arg_14_0._convertedVelocity

		arg_14_0._verticalSpeed = var_14_7 / var_14_8 - 0.5 * arg_14_0._gravity * var_14_8
	elseif var_14_0.rangeAA then
		local var_14_9 = var_0_1.AircraftHeight - arg_14_0._spawnPos.y
		local var_14_10 = 0.5 * arg_14_0._gravity

		arg_14_0._velocity = math.sqrt(-var_14_10 * var_14_3 * var_14_3 / var_14_9)

		local var_14_11 = var_14_3 / arg_14_0._velocity

		arg_14_0._verticalSpeed = var_14_9 / var_14_11 - var_14_10 * var_14_11
		arg_14_0._velocity = var_0_4.ConvertBulletDataSpeed(arg_14_0._velocity)
	elseif arg_14_0._convertedVelocity ~= 0 and arg_14_0._explodePos.y ~= arg_14_0._spawnPos.y then
		local var_14_12 = var_14_3 / arg_14_0._convertedVelocity
		local var_14_13 = arg_14_0._explodePos.y - arg_14_0._spawnPos.y

		arg_14_0._verticalSpeed = var_14_0.launchVrtSpeed or var_14_13 / var_14_12 - 0.5 * arg_14_0._gravity * var_14_12
	end
end

function var_0_5.GetExplodePostion(arg_15_0)
	return arg_15_0._explodePos
end

function var_0_5.SetExplodePosition(arg_16_0, arg_16_1)
	arg_16_0._explodePos = Clone(arg_16_1)
	arg_16_0._explodePos.y = var_0_1.BombDetonateHeight
end

function var_0_5.CacheChildEimtter(arg_17_0, arg_17_1)
	table.insert(arg_17_0._cacheEmitter, arg_17_1)
end

function var_0_5.interruptChildEmitter(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0._cacheEmitter) do
		iter_18_1:Destroy()
	end
end

function var_0_5.Dispose(arg_19_0)
	arg_19_0:interruptChildEmitter()

	arg_19_0._cacheEmitter = nil

	var_0_5.super.Dispose(arg_19_0)
end

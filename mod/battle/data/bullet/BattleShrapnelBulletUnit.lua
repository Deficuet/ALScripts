ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConfig
local var_0_2 = var_0_0.Battle.BattleBulletEvent
local var_0_3 = var_0_0.Battle.BattleFormulas

var_0_0.Battle.BattleShrapnelBulletUnit = class("BattleShrapnelBulletUnit", var_0_0.Battle.BattleBulletUnit)
var_0_0.Battle.BattleShrapnelBulletUnit.__name = "BattleShrapnelBulletUnit"

local var_0_4 = var_0_0.Battle.BattleShrapnelBulletUnit

var_0_4.STATE_NORMAL = "normal"
var_0_4.STATE_SPLIT = "split"
var_0_4.STATE_SPIN = "spin"
var_0_4.STATE_FINAL_SPLIT = "final_split"
var_0_4.STATE_EXPIRE = "expire"
var_0_4.STATE_PRIORITY = {
	[var_0_4.STATE_EXPIRE] = 5,
	[var_0_4.STATE_FINAL_SPLIT] = 4,
	[var_0_4.STATE_SPLIT] = 3,
	[var_0_4.STATE_SPIN] = 2,
	[var_0_4.STATE_NORMAL] = 1
}

function var_0_4.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_4.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._splitCount = 0
	arg_1_0._cacheEmitter = {}

	arg_1_0:ChangeShrapnelState(arg_1_0.STATE_NORMAL)
end

function var_0_4.Hit(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0:GetTemplate().extra_param.rangeAA then
		return
	end

	var_0_4.super.Hit(arg_2_0, arg_2_1, arg_2_2)

	arg_2_0._pierceCount = arg_2_0._pierceCount - 1
end

function var_0_4.SplitFinishCount(arg_3_0)
	arg_3_0._splitCount = arg_3_0._splitCount + 1
end

function var_0_4.IsAllSplitFinish(arg_4_0)
	return arg_4_0._splitCount >= #arg_4_0._tempData.extra_param.shrapnel
end

function var_0_4.Update(arg_5_0, arg_5_1)
	if arg_5_0._currentState == var_0_4.STATE_NORMAL then
		local var_5_0 = arg_5_0._verticalSpeed

		var_0_4.super.Update(arg_5_0, arg_5_1)

		if var_5_0 ~= 0 and var_5_0 * arg_5_0._verticalSpeed < 0 then
			arg_5_0:ChangeShrapnelState(var_0_4.STATE_SPLIT)
		end
	elseif arg_5_0._currentState == var_0_4.STATE_SPIN and (not arg_5_0._tempData.extra_param.lastTime or arg_5_1 - arg_5_0._spinStartTime > arg_5_0._tempData.extra_param.lastTime) then
		arg_5_0:ChangeShrapnelState(var_0_4.STATE_SPLIT)
	end
end

function var_0_4.ChangeShrapnelState(arg_6_0, arg_6_1)
	local var_6_0 = var_0_4.STATE_PRIORITY[arg_6_0._currentState]

	if var_6_0 and var_6_0 >= var_0_4.STATE_PRIORITY[arg_6_1] then
		return
	end

	arg_6_0._currentState = arg_6_1

	if arg_6_0._currentState == var_0_4.STATE_SPIN then
		arg_6_0._spinStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	elseif arg_6_0._currentState == var_0_4.STATE_SPLIT then
		arg_6_0:DispatchEvent(var_0_0.Event.New(var_0_2.SPLIT, {}))
	end
end

function var_0_4.IsOutRange(arg_7_0, arg_7_1)
	if arg_7_0._currentState == var_0_4.STATE_NORMAL then
		return var_0_4.super.IsOutRange(arg_7_0, arg_7_1)
	else
		return false
	end
end

function var_0_4.SetSrcHost(arg_8_0, arg_8_1)
	arg_8_0._srcHost = arg_8_1
end

function var_0_4.GetSrcHost(arg_9_0)
	return arg_9_0._srcHost
end

function var_0_4.GetShrapnelParam(arg_10_0)
	return arg_10_0._tempData.extra_param
end

function var_0_4.GetCurrentState(arg_11_0)
	return arg_11_0._currentState
end

function var_0_4.SetSpawnPosition(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:GetTemplate().extra_param
	local var_12_1 = arg_12_1

	if var_12_0.directHit then
		var_12_1 = Clone(arg_12_0._explodePos)
	end

	var_0_4.super.SetSpawnPosition(arg_12_0, var_12_1)

	local var_12_2 = pg.Tool.FilterY(arg_12_0._spawnPos)
	local var_12_3 = Vector3.Distance(var_12_2, pg.Tool.FilterY(arg_12_0._explodePos))

	if var_12_0.flare then
		local var_12_4 = var_12_0.shrapnel[1].bullet_ID
		local var_12_5 = var_0_0.Battle.BattleDataFunction.GetBulletTmpDataFromID(var_12_4)
		local var_12_6 = var_12_5.hit_type.time
		local var_12_7 = 0.5 * math.abs(var_12_5.extra_param.gravity or -0.0005) * (var_12_6 * var_0_1.calcFPS)^2 - arg_12_0._spawnPos.y

		arg_12_0._convertedVelocity = math.sqrt(-0.5 * arg_12_0._gravity * var_12_3 * var_12_3 / var_12_7)

		local var_12_8 = var_12_3 / arg_12_0._convertedVelocity

		arg_12_0._verticalSpeed = var_12_7 / var_12_8 - 0.5 * arg_12_0._gravity * var_12_8
	elseif var_12_0.rangeAA then
		local var_12_9 = var_0_1.AircraftHeight - arg_12_0._spawnPos.y
		local var_12_10 = 0.5 * arg_12_0._gravity

		arg_12_0._velocity = math.sqrt(-var_12_10 * var_12_3 * var_12_3 / var_12_9)

		local var_12_11 = var_12_3 / arg_12_0._velocity

		arg_12_0._verticalSpeed = var_12_9 / var_12_11 - var_12_10 * var_12_11
		arg_12_0._velocity = var_0_3.ConvertBulletDataSpeed(arg_12_0._velocity)
	elseif arg_12_0._convertedVelocity ~= 0 and arg_12_0._explodePos.y ~= arg_12_0._spawnPos.y then
		local var_12_12 = var_12_3 / arg_12_0._convertedVelocity
		local var_12_13 = arg_12_0._explodePos.y - arg_12_0._spawnPos.y

		arg_12_0._verticalSpeed = var_12_0.launchVrtSpeed or var_12_13 / var_12_12 - 0.5 * arg_12_0._gravity * var_12_12
	end
end

function var_0_4.GetExplodePostion(arg_13_0)
	return arg_13_0._explodePos
end

function var_0_4.SetExplodePosition(arg_14_0, arg_14_1)
	arg_14_0._explodePos = Clone(arg_14_1)
	arg_14_0._explodePos.y = var_0_1.BombDetonateHeight
end

function var_0_4.CacheChildEimtter(arg_15_0, arg_15_1)
	table.insert(arg_15_0._cacheEmitter, arg_15_1)
end

function var_0_4.interruptChildEmitter(arg_16_0)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0._cacheEmitter) do
		iter_16_1:Destroy()
	end
end

function var_0_4.Dispose(arg_17_0)
	arg_17_0:interruptChildEmitter()

	arg_17_0._cacheEmitter = nil

	var_0_4.super.Dispose(arg_17_0)
end

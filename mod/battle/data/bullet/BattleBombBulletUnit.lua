ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleBulletEvent
local var_0_2 = var_0_0.Battle.BattleConfig

var_0_0.Battle.BattleBombBulletUnit = class("BattleBombBulletUnit", var_0_0.Battle.BattleBulletUnit)
var_0_0.Battle.BattleBombBulletUnit.__name = "BattleBombBulletUnit"

local var_0_3 = var_0_0.Battle.BattleBombBulletUnit

function var_0_3.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_3.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0._randomOffset = Vector3.zero
end

function var_0_3.InitSpeed(arg_2_0)
	if arg_2_0._barrageLowPriority then
		arg_2_0._yAngle = arg_2_0._baseAngle + arg_2_0._barrageAngle
	else
		arg_2_0._yAngle = math.rad2Deg * math.atan2(arg_2_0._explodePos.z - arg_2_0._spawnPos.z, arg_2_0._explodePos.x - arg_2_0._spawnPos.x)
	end

	arg_2_0:calcSpeed()

	arg_2_0.updateSpeed = var_0_3.doNothing
end

function var_0_3.Update(arg_3_0)
	if arg_3_0._exist then
		var_0_3.super.Update(arg_3_0)
	end
end

function var_0_3.GetPierceCount(arg_4_0)
	return 1
end

function var_0_3.IsOutRange(arg_5_0, arg_5_1)
	if not arg_5_0._exist then
		return false
	end

	if arg_5_0._explodeTime and arg_5_1 >= arg_5_0._explodeTime then
		return true
	end

	if arg_5_0._reachDestFlag and not arg_5_0._explodeTime then
		return true
	else
		return false
	end
end

function var_0_3.OutRange(arg_6_0)
	local var_6_0 = {
		UID = unitUniqueID
	}

	arg_6_0:DispatchEvent(var_0_0.Event.New(var_0_1.EXPLODE, var_6_0))
	var_0_3.super.OutRange(arg_6_0)
end

function var_0_3.SetSpawnPosition(arg_7_0, arg_7_1)
	var_0_3.super.SetSpawnPosition(arg_7_0, arg_7_1)

	if arg_7_0._barragePriority then
		arg_7_0._explodePos = arg_7_0._explodePos + Vector3(arg_7_0._offsetX, 0, arg_7_0._offsetZ)

		local var_7_0 = Quaternion.Euler(0, arg_7_0._barrageAngle, 0)
		local var_7_1 = pg.Tool.FilterY(arg_7_0._spawnPos)

		arg_7_0._explodePos = var_7_0 * (arg_7_0._explodePos - var_7_1) + var_7_1
	end

	if arg_7_0._fixToRange and Vector3.BattleDistance(arg_7_0._explodePos, arg_7_0._spawnPos) > arg_7_0._range then
		local var_7_2 = pg.Tool.FilterY(arg_7_0._explodePos - arg_7_0._spawnPos)

		arg_7_0._explodePos = Vector3.Normalize(var_7_2) * arg_7_0._range + arg_7_0._spawnPos
	end

	if arg_7_0._convertedVelocity ~= 0 then
		local var_7_3 = pg.Tool.FilterY(arg_7_0._spawnPos)
		local var_7_4 = Vector3.Distance(var_7_3, arg_7_0._explodePos) / arg_7_0._convertedVelocity
		local var_7_5 = arg_7_0._explodePos.y - arg_7_0._spawnPos.y

		arg_7_0._verticalSpeed = arg_7_0:GetTemplate().extra_param.launchVrtSpeed or var_7_5 / var_7_4 - 0.5 * arg_7_0._gravity * var_7_4
	end
end

function var_0_3.SetExplodePosition(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:GetTemplate().extra_param

	if var_8_0.targetFixX and var_8_0.targetFixZ then
		arg_8_0._explodePos = Vector3(var_8_0.targetFixX, 0, var_8_0.targetFixZ)
	else
		arg_8_0._explodePos = arg_8_1:Clone()
	end

	if not arg_8_0._barragePriority then
		arg_8_0._explodePos = arg_8_0._explodePos + arg_8_0._randomOffset
	end

	arg_8_0._explodePos.y = var_0_2.BombDetonateHeight
end

function var_0_3.SetShiftInfo(arg_9_0, arg_9_1, arg_9_2)
	var_0_3.super.SetShiftInfo(arg_9_0, arg_9_1, arg_9_2)

	if arg_9_0:GetTemplate().extra_param.currentdrop then
		arg_9_0._explodePos.x = arg_9_0._explodePos.x + arg_9_0._offsetX
		arg_9_0._explodePos.z = arg_9_0._explodePos.z + arg_9_0._offsetZ
	end
end

function var_0_3.SetTemplateData(arg_10_0, arg_10_1)
	var_0_3.super.SetTemplateData(arg_10_0, arg_10_1)

	local var_10_0 = arg_10_0:GetTemplate().extra_param

	arg_10_0._barragePriority = var_10_0.barragePriority
	arg_10_0._barrageLowPriority = var_10_0.barrageLowPriority
	arg_10_0._fixToRange = var_10_0.fixToRange

	if var_10_0.barragePriority then
		arg_10_0._randomOffset = Vector3.zero
	else
		local var_10_1 = var_10_0.accuracy
		local var_10_2 = 0

		if var_10_1 then
			var_10_2 = arg_10_0:GetAttrByName(var_10_1)
		end

		local var_10_3 = var_10_0.randomOffsetX or 0
		local var_10_4 = var_10_0.randomOffsetZ or 0
		local var_10_5 = math.max(0, var_10_3 - var_10_2)
		local var_10_6 = math.max(0, var_10_4 - var_10_2)
		local var_10_7 = var_10_0.offsetX or 0
		local var_10_8 = var_10_0.offsetZ or 0

		if var_10_5 ~= 0 then
			var_10_5 = var_10_5 * (math.random() - 0.5) + var_10_7
		end

		if var_10_6 ~= 0 then
			var_10_6 = var_10_6 * (math.random() - 0.5) + var_10_8
		end

		local var_10_9 = var_10_0.targetOffsetX or 0
		local var_10_10 = var_10_0.targetOffsetZ or 0

		arg_10_0._randomOffset = Vector3(var_10_5 + var_10_9, 0, var_10_6 + var_10_10)
	end

	if var_10_0.timeToExplode then
		arg_10_0._explodeTime = pg.TimeMgr.GetInstance():GetCombatTime() + var_10_0.timeToExplode
	end

	arg_10_0._gravity = var_10_0.gravity or var_0_0.Battle.BattleConfig.GRAVITY
	arg_10_0._hitInterval = arg_10_1.hit_type.interval or 0.2
end

function var_0_3.DealDamage(arg_11_0)
	arg_11_0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + arg_11_0._hitInterval
end

function var_0_3.CanDealDamage(arg_12_0)
	if not arg_12_0._nextDamageTime then
		arg_12_0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + arg_12_0._tempData.extra_param.alert_duration

		return false
	else
		return arg_12_0._nextDamageTime < pg.TimeMgr.GetInstance():GetCombatTime()
	end
end

function var_0_3.HideBullet(arg_13_0)
	arg_13_0._position.x = 0
	arg_13_0._position.y = 100
	arg_13_0._position.z = 0
end

function var_0_3.GetExplodePostion(arg_14_0)
	return arg_14_0._explodePos
end

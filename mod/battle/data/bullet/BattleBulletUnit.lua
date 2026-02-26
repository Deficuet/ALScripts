ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleBulletEvent
local var_0_2 = var_0_0.Battle.BattleFormulas
local var_0_3 = Vector3.up
local var_0_4 = var_0_0.Battle.BattleVariable
local var_0_5 = var_0_0.Battle.BattleConfig
local var_0_6 = var_0_0.Battle.BattleTargetChoise
local var_0_7 = 1 / var_0_0.Battle.BattleConfig.viewFPS
local var_0_8 = var_0_0.Battle.BattleConst
local var_0_9 = var_0_0.Battle.BattleConst.AircraftUnitType

var_0_0.Battle.BattleBulletUnit = class("BattleBulletUnit")
var_0_0.Battle.BattleBulletUnit.__name = "BattleBulletUnit"

local var_0_10 = var_0_0.Battle.BattleBulletUnit

var_0_10.ACC_INTERVAL = var_0_5.calcInterval
var_0_10.TRACKER_ANGLE = math.cos(math.deg2Rad * 10)
var_0_10.MIRROR_RES = "_mirror"

function var_0_10.doAccelerate(arg_1_0, arg_1_1)
	local var_1_0, var_1_1 = arg_1_0:GetAcceleration(arg_1_1)

	if var_1_0 == 0 and var_1_1 == 0 then
		return
	end

	if var_1_0 < 0 and arg_1_0._speedLength + var_1_0 < 0 then
		arg_1_0:reverseAcceleration()
	end

	arg_1_0._speed:Set(arg_1_0._speed.x + arg_1_0._speedNormal.x * var_1_0 + arg_1_0._speedCross.x * var_1_1, arg_1_0._speed.y + arg_1_0._speedNormal.y * var_1_0 + arg_1_0._speedCross.y * var_1_1, arg_1_0._speed.z + arg_1_0._speedNormal.z * var_1_0 + arg_1_0._speedCross.z * var_1_1)

	arg_1_0._speedLength = arg_1_0._speed:Magnitude()

	if arg_1_0._speedLength ~= 0 then
		arg_1_0._speedNormal:Copy(arg_1_0._speed):Div(arg_1_0._speedLength)
	end

	arg_1_0._speedCross:Copy(arg_1_0._speedNormal):Cross2(var_0_3)
end

function var_0_10.doTrack(arg_2_0)
	if arg_2_0:getTrackingTarget() == nil then
		local var_2_0 = var_0_6.TargetHarmNearest(arg_2_0)[1]

		if var_2_0 ~= nil and arg_2_0:GetDistance(var_2_0) <= arg_2_0._trackRange then
			arg_2_0:setTrackingTarget(var_2_0)
		end
	end

	local var_2_1 = arg_2_0:getTrackingTarget()

	if var_2_1 == nil or var_2_1 == -1 then
		return
	elseif not var_2_1:IsAlive() then
		arg_2_0:setTrackingTarget(-1)

		return
	elseif arg_2_0:GetDistance(var_2_1) > arg_2_0._trackRange then
		arg_2_0:setTrackingTarget(-1)

		return
	end

	local var_2_2 = var_2_1:GetBeenAimedPosition()

	if not var_2_2 then
		return
	end

	local var_2_3 = var_2_2 - arg_2_0:GetPosition()

	var_2_3:SetNormalize()

	local var_2_4 = Vector3.Normalize(arg_2_0._speed)
	local var_2_5 = Vector3.Dot(var_2_4, var_2_3)
	local var_2_6 = var_2_4.z * var_2_3.x - var_2_4.x * var_2_3.z

	if var_2_5 >= var_0_10.TRACKER_ANGLE then
		return
	end

	local var_2_7 = arg_2_0:GetSpeedRatio()
	local var_2_8 = math.cos(arg_2_0._cosAngularSpeed * var_2_7)
	local var_2_9 = math.sin(arg_2_0._sinAngularSpeed * var_2_7)
	local var_2_10 = var_2_5
	local var_2_11 = var_2_6

	if var_2_5 < var_2_8 then
		var_2_10 = var_2_8
		var_2_11 = var_2_9 * (var_2_11 >= 0 and 1 or -1)
	end

	local var_2_12 = arg_2_0._speed.x * var_2_10 + arg_2_0._speed.z * var_2_11
	local var_2_13 = arg_2_0._speed.z * var_2_10 - arg_2_0._speed.x * var_2_11

	arg_2_0._speed:Set(var_2_12, 0, var_2_13)
end

function var_0_10.doOrbit(arg_3_0)
	local var_3_0 = pg.Tool.FilterY(arg_3_0._weapon:GetPosition())
	local var_3_1 = pg.Tool.FilterY(arg_3_0:GetPosition())
	local var_3_2 = (var_3_1 - var_3_0).magnitude
	local var_3_3 = (var_3_0 - var_3_1).normalized
	local var_3_4

	if var_3_2 > 10 then
		var_3_4 = (var_3_3 + arg_3_0._speed.normalized).normalized
	else
		var_3_4 = (Vector3(-var_3_3.z, 0, var_3_3.x) + arg_3_0._speed.normalized).normalized
	end

	arg_3_0._speed = var_3_4
end

function var_0_10.RotateY(arg_4_0, arg_4_1)
	local var_4_0 = math.cos(arg_4_1)
	local var_4_1 = math.sin(arg_4_1)

	return Vector3(arg_4_0.x * var_4_0 + arg_4_0.z * var_4_1, arg_4_0.y, arg_4_0.z * var_4_0 - arg_4_0.x * var_4_1)
end

function var_0_10.doCircle(arg_5_0)
	if not arg_5_0._originPos then
		return
	end

	local var_5_0 = arg_5_0:GetSpeedRatio() * (1 + var_0_0.Battle.BattleAttr.GetCurrent(arg_5_0, "bulletSpeedRatio"))
	local var_5_1 = pg.Tool.FilterY(arg_5_0._position - arg_5_0._originPos)
	local var_5_2 = arg_5_0._convertedVelocity
	local var_5_3 = var_5_1:Magnitude()
	local var_5_4 = var_5_3 - arg_5_0._centripetalSpeed * var_5_0 * arg_5_0._inverseFlag

	arg_5_0._inverseFlag = var_5_4 < 0 and -arg_5_0._inverseFlag or arg_5_0._inverseFlag

	if var_5_3 <= 1e-05 then
		return
	end

	local var_5_5 = arg_5_0._circleAntiClockwise
	local var_5_6 = var_5_2 / var_5_3 * (var_5_5 and 1 or -1) * var_5_0

	arg_5_0._speed = arg_5_0.RotateY(var_5_1, var_5_6):Mul(var_5_4 / var_5_3):Sub(var_5_1)
end

function var_0_10.doNothing(arg_6_0)
	if arg_6_0._gravity ~= 0 then
		arg_6_0._verticalSpeed = arg_6_0._verticalSpeed + arg_6_0._gravity * arg_6_0:GetSpeedRatio()
	end
end

function var_0_10.Ctor(arg_7_0, arg_7_1, arg_7_2)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_7_0)

	arg_7_0._battleProxy = var_0_0.Battle.BattleDataProxy.GetInstance()
	arg_7_0._uniqueID = arg_7_1
	arg_7_0._speedExemptKey = "bullet_" .. arg_7_1
	arg_7_0._IFF = arg_7_2
	arg_7_0._collidedList = {}
	arg_7_0._speed = Vector3.zero
	arg_7_0._exist = true
	arg_7_0._timeStamp = 0
	arg_7_0._dmgEnhanceRate = 1
	arg_7_0._frame = 0
	arg_7_0._reachDestFlag = false
	arg_7_0._verticalSpeed = 0
	arg_7_0._damageList = {}
end

function var_0_10.Update(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:GetSpeedRatio()

	arg_8_0:updateSpeed(arg_8_1)
	arg_8_0:updateBarrageTransform(arg_8_1)
	arg_8_0._position:Set(arg_8_0._position.x + arg_8_0._speed.x * var_8_0, arg_8_0._position.y + arg_8_0._speed.y * var_8_0, arg_8_0._position.z + arg_8_0._speed.z * var_8_0)

	arg_8_0._position.y = arg_8_0._position.y + arg_8_0._verticalSpeed * var_8_0

	if arg_8_0._gravity == 0 then
		arg_8_0._reachDestFlag = Vector3.SqrDistance(arg_8_0._spawnPos, arg_8_0._position) > arg_8_0._sqrRange
	else
		if arg_8_0._fieldSwitchHeight ~= 0 and arg_8_0._position.y <= arg_8_0._fieldSwitchHeight then
			arg_8_0._field = var_0_8.BulletField.SURFACE
		end

		arg_8_0._reachDestFlag = arg_8_0._position.y <= var_0_5.BombDetonateHeight
	end
end

function var_0_10.ActiveCldBox(arg_9_0)
	arg_9_0._cldComponent:SetActive(true)
end

function var_0_10.DeactiveCldBox(arg_10_0)
	arg_10_0._cldComponent:SetActive(false)
end

function var_0_10.SetStartTimeStamp(arg_11_0, arg_11_1)
	arg_11_0._timeStamp = arg_11_1
end

function var_0_10.Hit(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._collidedList[arg_12_1] = true

	local var_12_0 = {
		UID = arg_12_1,
		type = arg_12_2
	}

	arg_12_0:DispatchEvent(var_0_0.Event.New(var_0_1.HIT, var_12_0))
end

function var_0_10.Intercepted(arg_13_0)
	arg_13_0:DispatchEvent(var_0_0.Event.New(var_0_1.INTERCEPTED, {}))
end

function var_0_10.Reflected(arg_14_0)
	arg_14_0._speed.x = -arg_14_0._speed.x
end

function var_0_10.ResetVelocity(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0._tempData
	local var_15_1 = arg_15_0:GetTemplate().extra_param

	if not arg_15_1 then
		arg_15_1 = var_15_0.velocity

		if var_15_1.velocity_offset then
			arg_15_1 = math.random(arg_15_1 - var_15_1.velocity_offset, arg_15_1 + var_15_1.velocity_offset)
		elseif var_15_1.velocity_offsetF then
			arg_15_1 = arg_15_1 + math.random() * 2 * var_15_1.velocity_offsetF - var_15_1.velocity_offsetF
		end
	end

	arg_15_0._velocity = arg_15_1
	arg_15_0._convertedVelocity = var_0_2.ConvertBulletSpeed(arg_15_0._velocity)
end

function var_0_10.SetTemplateData(arg_16_0, arg_16_1)
	arg_16_0._tempData = setmetatable({}, {
		__index = arg_16_1
	})

	local var_16_0 = arg_16_0:GetTemplate().extra_param

	arg_16_0:SetModleID(arg_16_1.modle_ID, var_0_10.ORIGNAL_RES)
	arg_16_0:SetSFXID(arg_16_0._tempData.hit_sfx, arg_16_0._tempData.miss_sfx)
	arg_16_0:ResetVelocity()

	arg_16_0._pierceCount = arg_16_1.pierce_count

	arg_16_0:FixRange()
	arg_16_0:InitCldComponent()

	arg_16_0._accTable = Clone(arg_16_0._tempData.acceleration)

	table.sort(arg_16_0._accTable, function(arg_17_0, arg_17_1)
		return arg_17_0.t < arg_17_1.t
	end)

	arg_16_0._field = arg_16_1.effect_type
	arg_16_0._gravity = var_16_0.gravity or 0
	arg_16_0._fieldSwitchHeight = var_16_0.effectSwitchHeight or 0
	arg_16_0._ignoreShield = arg_16_0._tempData.extra_param.ignoreShield == true
	arg_16_0._autoRotate = arg_16_0._tempData.extra_param.dontRotate ~= true

	arg_16_0:SetDiverFilter()
end

function var_0_10.GetModleID(arg_18_0)
	local var_18_0 = arg_18_0:GetTemplate().extra_param
	local var_18_1

	if arg_18_0._IFF == var_0_5.FOE_CODE then
		if arg_18_0._mirrorSkin == var_0_10.MIRROR_SKIN_RES then
			var_18_1 = arg_18_0._modleID .. var_0_10.MIRROR_RES
		elseif arg_18_0._mirrorSkin == var_0_10.ORIGNAL_RES and var_18_0.mirror == true then
			var_18_1 = arg_18_0._modleID .. var_0_10.MIRROR_RES
		else
			var_18_1 = arg_18_0._modleID
		end
	else
		var_18_1 = arg_18_0._modleID
	end

	return var_18_1
end

var_0_10.ORIGNAL_RES = -1
var_0_10.SKIN_RES = 0
var_0_10.MIRROR_SKIN_RES = 1

function var_0_10.SetModleID(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0._modleID = arg_19_1
	arg_19_0._mirrorSkin = arg_19_2

	if arg_19_3 and arg_19_3 ~= "" then
		arg_19_0._tempData.hit_fx = arg_19_3
	end
end

function var_0_10.SetSFXID(arg_20_0, arg_20_1, arg_20_2)
	if arg_20_1 then
		arg_20_0._hitSFX = arg_20_1
	end

	if arg_20_2 then
		arg_20_0._missSFX = arg_20_2
	end
end

function var_0_10.SetShiftInfo(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = 0
	local var_21_1 = 0
	local var_21_2 = arg_21_0:GetTemplate().extra_param

	if var_21_2.randomLaunchOffsetX then
		var_21_0 = math.random() * var_21_2.randomLaunchOffsetX * 2 - var_21_2.randomLaunchOffsetX
	end

	if var_21_2.randomLaunchOffsetZ then
		var_21_1 = math.random() * var_21_2.randomLaunchOffsetZ * 2 - var_21_2.randomLaunchOffsetZ
	end

	arg_21_0._offsetX = arg_21_1 + var_21_0
	arg_21_0._offsetZ = arg_21_2 + var_21_1
end

function var_0_10.SetRotateInfo(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	arg_22_0._targetPos = arg_22_1
	arg_22_0._baseAngle = arg_22_2
	arg_22_0._barrageAngle = arg_22_3

	local var_22_0 = arg_22_0._barrageAngle % 360

	if var_22_0 > 0 and var_22_0 < 180 then
		for iter_22_0, iter_22_1 in ipairs(arg_22_0._accTable) do
			if iter_22_1.flip then
				iter_22_1.v = iter_22_1.v * -1
			end
		end
	end
end

function var_0_10.SetBarrageTransformTempate(arg_23_0, arg_23_1)
	if #arg_23_1 > 0 then
		arg_23_0._barrageTransData = arg_23_1
	end
end

function var_0_10.SetAttr(arg_24_0, arg_24_1)
	var_0_0.Battle.BattleAttr.SetAttr(arg_24_0, arg_24_1)
end

function var_0_10.GetAttr(arg_25_0)
	return var_0_0.Battle.BattleAttr.GetAttr(arg_25_0)
end

function var_0_10.SetStandHostAttr(arg_26_0, arg_26_1)
	arg_26_0._standUnit = {}

	var_0_0.Battle.BattleAttr.SetAttr(arg_26_0._standUnit, arg_26_1)
end

function var_0_10.GetWeaponHostAttr(arg_27_0)
	if arg_27_0._standUnit then
		return var_0_0.Battle.BattleAttr.GetAttr(arg_27_0._standUnit)
	else
		return arg_27_0:GetAttr()
	end
end

function var_0_10.GetWeaponAtkAttr(arg_28_0)
	local var_28_0 = arg_28_0:GetWeaponHostAttr()
	local var_28_1
	local var_28_2 = arg_28_0._weapon:GetAtkAttrTrasnform(var_28_0)

	if var_28_2 then
		var_28_1 = var_28_2
	else
		local var_28_3 = arg_28_0:GetWeaponTempData().attack_attribute

		var_28_1 = var_0_0.Battle.BattleAttr.GetAtkAttrByType(var_28_0, var_28_3)
	end

	return var_28_1
end

function var_0_10.GetWeaponCardPuzzleEnhance(arg_29_0)
	return arg_29_0._weapon:GetCardPuzzleDamageEnhance()
end

function var_0_10.SetDamageEnhance(arg_30_0, arg_30_1)
	arg_30_0._dmgEnhanceRate = arg_30_1
end

function var_0_10.GetDamageEnhance(arg_31_0)
	return arg_31_0._dmgEnhanceRate
end

function var_0_10.GetAttrByName(arg_32_0, arg_32_1)
	return var_0_0.Battle.BattleAttr.GetCurrent(arg_32_0, arg_32_1)
end

function var_0_10.GetVerticalSpeed(arg_33_0)
	return arg_33_0._verticalSpeed
end

function var_0_10.IsGravitate(arg_34_0)
	return arg_34_0._gravity ~= 0
end

function var_0_10.SetBuffTrigger(arg_35_0, arg_35_1)
	arg_35_0._host = arg_35_1
	arg_35_0._buffTriggerFun = {}
end

function var_0_10.SetBuffFun(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_0._buffTriggerFun[arg_36_1] or {}

	var_36_0[#var_36_0 + 1] = arg_36_2
	arg_36_0._buffTriggerFun[arg_36_1] = var_36_0
end

function var_0_10.BuffTrigger(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_0._host

	if var_37_0 then
		if table.contains(var_0_9, var_37_0:GetUnitType()) then
			arg_37_0._host:TriggerBuff(arg_37_1, arg_37_2)
		elseif var_37_0:IsAlive() then
			arg_37_0._host:TriggerBuff(arg_37_1, arg_37_2)

			local var_37_1 = arg_37_0._buffTriggerFun[arg_37_1]

			if var_37_1 then
				for iter_37_0, iter_37_1 in ipairs(var_37_1) do
					iter_37_1(arg_37_0._host, arg_37_2)
				end
			end
		end
	end
end

function var_0_10.SetIsCld(arg_38_0, arg_38_1)
	arg_38_0._needCld = arg_38_1
end

function var_0_10.GetIsCld(arg_39_0)
	return arg_39_0._needCld
end

function var_0_10.IsIngoreCld(arg_40_0)
	return arg_40_0._tempData.extra_param.ingoreCld
end

function var_0_10.IsFragile(arg_41_0)
	return arg_41_0._tempData.extra_param.fragile
end

function var_0_10.IsIndiscriminate(arg_42_0)
	return arg_42_0._tempData.extra_param.indiscriminate
end

function var_0_10.GetExtraTag(arg_43_0)
	return arg_43_0._tempData.extra_param.tag
end

function var_0_10.AppendDamageUnit(arg_44_0, arg_44_1)
	arg_44_0._damageList[#arg_44_0._damageList + 1] = arg_44_1
end

function var_0_10.DamageUnitListWriteback(arg_45_0)
	arg_45_0._weapon:UpdateCombo(arg_45_0._damageList)
end

function var_0_10.HasAcceleration(arg_46_0)
	return #arg_46_0._accTable ~= 0
end

function var_0_10.IsTracker(arg_47_0)
	return arg_47_0._accTable.tracker
end

function var_0_10.IsOrbit(arg_48_0)
	return arg_48_0._accTable.orbit
end

function var_0_10.IsCircle(arg_49_0)
	return arg_49_0._accTable.circle
end

function var_0_10.GetAcceleration(arg_50_0, arg_50_1)
	arg_50_0._lastAccTime = arg_50_0._lastAccTime or arg_50_0._timeStamp

	local var_50_0 = math.modf((arg_50_1 - arg_50_0._lastAccTime) / var_0_10.ACC_INTERVAL)

	arg_50_0._lastAccTime = arg_50_0._lastAccTime + var_0_10.ACC_INTERVAL * var_50_0

	local var_50_1 = arg_50_1 - arg_50_0._timeStamp
	local var_50_2 = #arg_50_0._accTable

	while var_50_2 > 0 do
		local var_50_3 = arg_50_0._accTable[var_50_2]

		if var_50_1 + var_0_10.ACC_INTERVAL < var_50_3.t then
			var_50_2 = var_50_2 - 1
		else
			return var_50_3.u * var_50_0, var_50_3.v * var_50_0
		end
	end

	return 0, 0
end

function var_0_10.reverseAcceleration(arg_51_0)
	for iter_51_0, iter_51_1 in ipairs(arg_51_0._accTable) do
		iter_51_1.u = iter_51_1.u * -1
	end
end

function var_0_10.GetDistance(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0._battleProxy.FrameIndex

	if arg_52_0._frame ~= var_52_0 then
		arg_52_0._distanceBackup = {}
		arg_52_0._frame = var_52_0
	end

	local var_52_1 = arg_52_0._distanceBackup[arg_52_1]

	if var_52_1 == nil then
		var_52_1 = Vector3.Distance(arg_52_0:GetPosition(), arg_52_1:GetPosition())
		arg_52_0._distanceBackup[arg_52_1] = var_52_1

		arg_52_1:backupDistance(arg_52_0, var_52_1)
	end

	return var_52_1
end

function var_0_10.backupDistance(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = arg_53_0._battleProxy.FrameIndex

	if arg_53_0._frame ~= var_53_0 then
		arg_53_0._distanceBackup = {}
		arg_53_0._frame = var_53_0
	end

	arg_53_0._distanceBackup[arg_53_1] = arg_53_2
end

function var_0_10.getTrackingTarget(arg_54_0)
	return arg_54_0._tarckingTarget
end

function var_0_10.setTrackingTarget(arg_55_0, arg_55_1)
	arg_55_0._tarckingTarget = arg_55_1
end

function var_0_10.SetWeapon(arg_56_0, arg_56_1)
	arg_56_0._weapon = arg_56_1

	if arg_56_1 then
		arg_56_0._correctedDMG = arg_56_0._weapon:GetCorrectedDMG()
	end
end

function var_0_10.GetWeapon(arg_57_0)
	return arg_57_0._weapon
end

function var_0_10.GetCorrectedDMG(arg_58_0)
	return arg_58_0._correctedDMG
end

function var_0_10.OverrideCorrectedDMG(arg_59_0, arg_59_1)
	arg_59_0._correctedDMG = var_0_2.WeaponDamagePreCorrection(arg_59_0._weapon, arg_59_1)
end

function var_0_10.GetWeaponTempData(arg_60_0)
	return arg_60_0._weapon:GetTemplateData()
end

function var_0_10.GetPosition(arg_61_0)
	return arg_61_0._position or Vector3.zero
end

function var_0_10.SetSpawnPosition(arg_62_0, arg_62_1)
	arg_62_0._spawnPos = arg_62_1
	arg_62_0._position = arg_62_1:Clone()

	if arg_62_0._gravity ~= 0 then
		local var_62_0 = math.atan2(arg_62_0._speed.x, arg_62_0._speed.z)

		if var_62_0 == 0 then
			arg_62_0._verticalSpeed = 0
		else
			local var_62_1 = Vector3(math.cos(var_62_0) * 60, math.sin(var_62_0) * 60)
			local var_62_2 = 60 / arg_62_0._convertedVelocity

			arg_62_0._verticalSpeed = -0.5 * arg_62_0._gravity * var_62_2
		end
	end
end

function var_0_10.GetSpawnPosition(arg_63_0)
	return arg_63_0._spawnPos
end

function var_0_10.GetTemplate(arg_64_0)
	return arg_64_0._tempData
end

function var_0_10.GetType(arg_65_0)
	return arg_65_0._tempData.type
end

function var_0_10.GetHitSFX(arg_66_0)
	return arg_66_0._hitSFX
end

function var_0_10.GetMissSFX(arg_67_0)
	return arg_67_0._missSFX
end

function var_0_10.GetOutBound(arg_68_0)
	return arg_68_0._tempData.out_bound
end

function var_0_10.GetUniqueID(arg_69_0)
	return arg_69_0._uniqueID
end

function var_0_10.GetOffset(arg_70_0)
	return arg_70_0._offsetX, arg_70_0._offsetZ, arg_70_0._isOffsetPriority
end

function var_0_10.GetRotateInfo(arg_71_0)
	return arg_71_0._targetPos, arg_71_0._baseAngle, arg_71_0._barrageAngle
end

function var_0_10.IsOutRange(arg_72_0)
	return arg_72_0._reachDestFlag
end

function var_0_10.SetYAngle(arg_73_0, arg_73_1)
	arg_73_0._yAngle = arg_73_1
end

function var_0_10.SetOffsetPriority(arg_74_0, arg_74_1)
	arg_74_0._isOffsetPriority = arg_74_1 or false
end

function var_0_10.GetOffsetPriority(arg_75_0)
	return arg_75_0._isOffsetPriority
end

function var_0_10.GetYAngle(arg_76_0)
	return arg_76_0._yAngle
end

function var_0_10.GetCurrentYAngle(arg_77_0)
	local var_77_0 = Vector3.Normalize(arg_77_0._speed)
	local var_77_1 = math.acos(var_77_0.x) / math.deg2Rad

	if var_77_0.z < 0 then
		var_77_1 = 360 - var_77_1
	end

	return var_77_1
end

function var_0_10.GetIFF(arg_78_0)
	return arg_78_0._IFF
end

function var_0_10.GetHost(arg_79_0)
	return arg_79_0._host
end

function var_0_10.GetPierceCount(arg_80_0)
	return arg_80_0._pierceCount
end

function var_0_10.AppendAttachBuff(arg_81_0, arg_81_1)
	arg_81_0._attachBuffList = arg_81_0._attachBuffList or arg_81_0:generateAttachBuffList()

	table.insert(arg_81_0._attachBuffList, arg_81_1)
end

function var_0_10.GetAttachBuff(arg_82_0)
	arg_82_0._attachBuffList = arg_82_0._attachBuffList or arg_82_0:generateAttachBuffList()

	return arg_82_0._attachBuffList
end

function var_0_10.generateAttachBuffList(arg_83_0)
	local var_83_0 = {}

	if not arg_83_0:GetTemplate().attach_buff then
		local var_83_1 = {}
	end

	for iter_83_0, iter_83_1 in ipairs(arg_83_0:GetTemplate().attach_buff) do
		local var_83_2 = {
			buff_id = iter_83_1.buff_id,
			level = iter_83_1.buff_level,
			rant = iter_83_1.rant,
			hit_ignore = iter_83_1.hit_ignore,
			group_level = iter_83_1.group_level
		}

		table.insert(var_83_0, var_83_2)
	end

	return var_83_0
end

function var_0_10.GetEffectField(arg_84_0)
	return arg_84_0._field
end

function var_0_10.SetDiverFilter(arg_85_0, arg_85_1)
	if arg_85_1 == nil then
		arg_85_0._diveFilter = arg_85_0._tempData.extra_param.diveFilter or {
			2
		}
	else
		arg_85_0._diveFilter = arg_85_1
	end
end

function var_0_10.GetDiveFilter(arg_86_0)
	return arg_86_0._diveFilter
end

function var_0_10.GetVelocity(arg_87_0)
	return arg_87_0._velocity
end

function var_0_10.GetConvertedVelocity(arg_88_0)
	return arg_88_0._convertedVelocity
end

function var_0_10.GetSpeedExemptKey(arg_89_0)
	return arg_89_0._speedExemptKey
end

function var_0_10.IsCollided(arg_90_0, arg_90_1)
	return arg_90_0._collidedList[arg_90_1]
end

function var_0_10.GetExist(arg_91_0)
	return arg_91_0._exist
end

function var_0_10.SetExist(arg_92_0, arg_92_1)
	arg_92_0._exist = arg_92_1
end

function var_0_10.GetIgnoreShield(arg_93_0)
	return arg_93_0._ignoreShield
end

function var_0_10.SetIgnoreShield(arg_94_0, arg_94_1)
	arg_94_0._ignoreShield = arg_94_1
end

function var_0_10.IsAutoRotate(arg_95_0)
	return arg_95_0._autoRotate
end

function var_0_10.Dispose(arg_96_0)
	arg_96_0._dataProxy = nil

	var_0_0.EventDispatcher.DetachEventDispatcher(arg_96_0)
end

function var_0_10.InitCldComponent(arg_97_0)
	local var_97_0 = arg_97_0:GetTemplate().cld_box
	local var_97_1 = arg_97_0:GetTemplate().cld_offset
	local var_97_2 = var_97_1[1]

	if arg_97_0:GetIFF() == var_0_5.FOE_CODE then
		var_97_2 = var_97_2 * -1
	end

	arg_97_0._cldComponent = var_0_0.Battle.BattleCubeCldComponent.New(var_97_0[1], var_97_0[2], var_97_0[3], var_97_2, var_97_1[3])

	local var_97_3 = {
		type = var_0_8.CldType.BULLET,
		IFF = arg_97_0:GetIFF(),
		UID = arg_97_0:GetUniqueID()
	}

	arg_97_0._cldComponent:SetCldData(var_97_3)
end

function var_0_10.ResetCldSurface(arg_98_0)
	local var_98_0 = arg_98_0:GetDiveFilter()

	if var_98_0 and #var_98_0 == 0 then
		arg_98_0:GetCldData().Surface = var_0_8.OXY_STATE.DIVE
	else
		arg_98_0:GetCldData().Surface = var_0_8.OXY_STATE.FLOAT
	end
end

function var_0_10.GetBoxSize(arg_99_0)
	return arg_99_0._cldComponent:GetCldBoxSize()
end

function var_0_10.GetCldBox(arg_100_0)
	return arg_100_0._cldComponent:GetCldBox(arg_100_0:GetPosition())
end

function var_0_10.GetCldData(arg_101_0)
	return arg_101_0._cldComponent:GetCldData()
end

function var_0_10.GetSpeed(arg_102_0)
	return arg_102_0._speed
end

function var_0_10.GetSpeedRatio(arg_103_0)
	return var_0_4.GetSpeedRatio(arg_103_0._speedExemptKey, arg_103_0._IFF)
end

function var_0_10.InitSpeed(arg_104_0, arg_104_1)
	if arg_104_0._yAngle == nil then
		arg_104_0._yAngle = (arg_104_1 or arg_104_0._baseAngle) + arg_104_0._barrageAngle
	end

	arg_104_0:calcSpeed()

	if arg_104_0:HasAcceleration() then
		arg_104_0._speedLength = arg_104_0._speed:Magnitude()

		local var_104_0 = math.deg2Rad * arg_104_0._yAngle

		arg_104_0._speedNormal = Vector3(math.cos(var_104_0), 0, math.sin(var_104_0))
		arg_104_0._speedCross = Vector3.Cross(arg_104_0._speedNormal, var_0_3)
		arg_104_0.updateSpeed = var_0_10.doAccelerate
	elseif arg_104_0:IsTracker() then
		local var_104_1 = arg_104_0._accTable.tracker

		arg_104_0._trackRange = var_104_1.range
		arg_104_0._cosAngularSpeed = math.deg2Rad * var_104_1.angular
		arg_104_0._sinAngularSpeed = math.deg2Rad * var_104_1.angular
		arg_104_0._negativeCosAngularSpeed = math.deg2Rad * var_104_1.angular * -1
		arg_104_0._negativeSinAngularSpeed = math.deg2Rad * var_104_1.angular * -1
		arg_104_0.updateSpeed = var_0_10.doTrack
	elseif arg_104_0:IsCircle() then
		local var_104_2 = arg_104_0._accTable.circle

		arg_104_0._originPos = var_104_2.center or arg_104_0._targetPos
		arg_104_0._circleAntiClockwise = tobool(var_104_2.antiClockWise)
		arg_104_0._centripetalSpeed = (var_104_2.centripetalSpeed or 0) * var_0_7
		arg_104_0._inverseFlag = 1
		arg_104_0.updateSpeed = var_0_10.doCircle
	else
		arg_104_0.updateSpeed = var_0_10.doNothing
	end
end

function var_0_10.InheritSpeed(arg_105_0, arg_105_1)
	arg_105_0._speed = Vector3(arg_105_1.x, arg_105_1.y, arg_105_1.z)
	arg_105_0._speedInited = true
end

function var_0_10.calcSpeed(arg_106_0)
	if arg_106_0._speedInited then
		return
	end

	local var_106_0 = 1 + var_0_0.Battle.BattleAttr.GetCurrent(arg_106_0, "bulletSpeedRatio")
	local var_106_1 = arg_106_0._velocity * var_106_0
	local var_106_2 = var_0_2.ConvertBulletSpeed(var_106_1)
	local var_106_3 = math.deg2Rad * arg_106_0._yAngle

	arg_106_0._speed = Vector3(var_106_2 * math.cos(var_106_3), 0, var_106_2 * math.sin(var_106_3))
end

function var_0_10.updateBarrageTransform(arg_107_0, arg_107_1)
	if not arg_107_0._barrageTransData or #arg_107_0._barrageTransData == 0 then
		return
	end

	local var_107_0 = arg_107_1 - arg_107_0._timeStamp
	local var_107_1 = arg_107_0._barrageTransData[1]

	if var_107_0 >= var_107_1.transStartDelay then
		if var_107_1.transAimAngle then
			arg_107_0._yAngle = var_107_1.transAimAngle
		else
			arg_107_0._yAngle = math.rad2Deg * math.atan2(var_107_1.transAimPosZ - arg_107_0._position.z, var_107_1.transAimPosX - arg_107_0._position.x)
		end

		arg_107_0:calcSpeed()
		table.remove(arg_107_0._barrageTransData, 1)

		local var_107_2 = arg_107_0._barrageTransData[1]

		if var_107_2 then
			var_107_2.transStartDelay = var_107_2.transStartDelay + var_107_1.transStartDelay
		end
	end
end

function var_0_10.GetCurrentDistance(arg_108_0)
	return Vector3.Distance(arg_108_0._spawnPos, arg_108_0._position)
end

function var_0_10.SetOutRangeCallback(arg_109_0, arg_109_1)
	arg_109_0._outRangeFunc = arg_109_1
end

function var_0_10.OutRange(arg_110_0)
	arg_110_0:DispatchEvent(var_0_0.Event.New(var_0_1.OUT_RANGE, {}))
	arg_110_0._outRangeFunc(arg_110_0)
end

function var_0_10.FixRange(arg_111_0, arg_111_1, arg_111_2)
	arg_111_1 = arg_111_1 or arg_111_0._tempData.range
	arg_111_2 = arg_111_2 or 0

	local var_111_0 = arg_111_0._tempData.range_offset

	if var_111_0 == 0 then
		arg_111_0._range = arg_111_1
	else
		arg_111_0._range = arg_111_1 + var_111_0 * (math.random() - 0.5)
	end

	arg_111_0._range = math.max(0, arg_111_0._range + arg_111_2)
	arg_111_0._sqrRange = arg_111_0._range * arg_111_0._range
end

function var_0_10.ImmuneBombCLS(arg_112_0)
	return arg_112_0:GetTemplate().extra_param.ignoreB
end

function var_0_10.ImmuneCLS(arg_113_0)
	return arg_113_0._immuneCLS
end

function var_0_10.SetImmuneCLS(arg_114_0, arg_114_1)
	arg_114_0._immuneCLS = arg_114_1
end

function var_0_10.IsSpectreBullet(arg_115_0)
	return arg_115_0:GetTemplate().extra_param.spectre
end

ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleConfig
local var_0_3 = var_0_0.Battle.BattleFormulas
local var_0_4 = var_0_1.WeaponSuppressType
local var_0_5 = var_0_1.WeaponSearchType
local var_0_6 = var_0_0.Battle.BattleDataFunction
local var_0_7 = var_0_0.Battle.BattleAttr
local var_0_8 = var_0_0.Battle.BattleTargetChoise
local var_0_9 = class("BattleWeaponUnit")

var_0_0.Battle.BattleWeaponUnit = var_0_9
var_0_9.__name = "BattleWeaponUnit"
var_0_9.INTERNAL = "internal"
var_0_9.EXTERNAL = "external"
var_0_9.EMITTER_NORMAL = "BattleBulletEmitter"
var_0_9.EMITTER_SHOTGUN = "BattleShotgunEmitter"
var_0_9.STATE_DISABLE = "DISABLE"
var_0_9.STATE_READY = "READY"
var_0_9.STATE_PRECAST = "PRECAST"
var_0_9.STATE_PRECAST_FINISH = "STATE_PRECAST_FINISH"
var_0_9.STATE_ATTACK = "ATTACK"
var_0_9.STATE_OVER_HEAT = "OVER_HEAT"

function var_0_9.Ctor(arg_1_0)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_1_0)

	arg_1_0._currentState = arg_1_0.STATE_READY
	arg_1_0._equipmentIndex = -1
	arg_1_0._dataProxy = var_0_0.Battle.BattleDataProxy.GetInstance()
	arg_1_0._tempEmittersList = {}
	arg_1_0._dumpedEmittersList = {}
	arg_1_0._reloadFacotrList = {}
	arg_1_0._diveEnabled = true
	arg_1_0._comboIDList = {}
	arg_1_0._jammingTime = 0
	arg_1_0._reloadBoostList = {}
	arg_1_0._CLDCount = 0
	arg_1_0._damageSum = 0
	arg_1_0._CTSum = 0
	arg_1_0._ACCSum = 0
end

function var_0_9.HostOnEnemy(arg_2_0)
	arg_2_0._hostOnEnemy = true
end

function var_0_9.SetPotentialFactor(arg_3_0, arg_3_1)
	arg_3_0._potential = arg_3_1

	if arg_3_0._correctedDMG then
		arg_3_0._correctedDMG = var_0_3.WeaponDamagePreCorrection(arg_3_0)
	end
end

function var_0_9.GetEquipmentLabel(arg_4_0)
	return arg_4_0._equipmentLabelList or {}
end

function var_0_9.SetEquipmentLabel(arg_5_0, arg_5_1)
	arg_5_0._equipmentLabelList = arg_5_1
end

function var_0_9.SetTemplateData(arg_6_0, arg_6_1)
	arg_6_0._potential = arg_6_0._potential or 1
	arg_6_0._tmpData = arg_6_1
	arg_6_0._maxRangeSqr = arg_6_1.range
	arg_6_0._minRangeSqr = arg_6_1.min_range
	arg_6_0._fireFXFlag = arg_6_1.fire_fx_loop_type
	arg_6_0._oxyList = arg_6_1.oxy_type
	arg_6_0._bulletList = arg_6_1.bullet_ID
	arg_6_0._majorEmitterList = {}

	arg_6_0:ShiftBarrage(arg_6_1.barrage_ID)

	arg_6_0._GCD = arg_6_1.recover_time
	arg_6_0._preCastInfo = arg_6_1.precast_param
	arg_6_0._correctedDMG = var_0_3.WeaponDamagePreCorrection(arg_6_0)
	arg_6_0._convertedAtkAttr = var_0_3.WeaponAtkAttrPreRatio(arg_6_0)

	arg_6_0:FlushReloadMax(1)
end

function var_0_9.createMajorEmitter(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
	local function var_7_0(arg_8_0, arg_8_1, arg_8_2, arg_8_3, arg_8_4)
		local var_8_0 = arg_7_0._emitBulletIDList[arg_7_2]
		local var_8_1 = arg_7_0:Spawn(var_8_0, arg_8_4, var_0_9.INTERNAL)

		var_8_1:SetOffsetPriority(arg_8_3)
		var_8_1:SetShiftInfo(arg_8_0, arg_8_1)

		if arg_7_0._tmpData.aim_type == var_0_1.WeaponAimType.AIM and arg_8_4 ~= nil then
			var_8_1:SetRotateInfo(arg_8_4:GetBeenAimedPosition(), arg_7_0:GetBaseAngle(), arg_8_2)
		else
			var_8_1:SetRotateInfo(nil, arg_7_0:GetBaseAngle(), arg_8_2)
		end

		arg_7_0:DispatchBulletEvent(var_8_1)

		return var_8_1
	end

	local function var_7_1()
		for iter_9_0, iter_9_1 in ipairs(arg_7_0._majorEmitterList) do
			if iter_9_1:GetState() ~= iter_9_1.STATE_STOP then
				return
			end
		end

		arg_7_0:EnterCoolDown()
	end

	arg_7_3 = arg_7_3 or var_0_9.EMITTER_NORMAL

	local var_7_2 = var_0_0.Battle[arg_7_3].New(arg_7_4 or var_7_0, arg_7_5 or var_7_1, arg_7_1)

	arg_7_0._majorEmitterList[#arg_7_0._majorEmitterList + 1] = var_7_2

	return var_7_2
end

function var_0_9.interruptAllEmitter(arg_10_0)
	if arg_10_0._majorEmitterList then
		for iter_10_0, iter_10_1 in ipairs(arg_10_0._majorEmitterList) do
			iter_10_1:Interrupt()
		end
	end

	for iter_10_2, iter_10_3 in ipairs(arg_10_0._tempEmittersList) do
		for iter_10_4, iter_10_5 in ipairs(iter_10_3) do
			iter_10_5:Interrupt()
		end
	end

	for iter_10_6, iter_10_7 in ipairs(arg_10_0._dumpedEmittersList) do
		for iter_10_8, iter_10_9 in ipairs(iter_10_7) do
			iter_10_9:Interrupt()
		end
	end
end

function var_0_9.cacheSectorData(arg_11_0)
	local var_11_0 = arg_11_0:GetAttackAngle() / 2

	arg_11_0._upperEdge = math.deg2Rad * var_11_0
	arg_11_0._lowerEdge = -1 * arg_11_0._upperEdge

	local var_11_1 = math.deg2Rad * arg_11_0._tmpData.axis_angle

	if arg_11_0:GetDirection() == var_0_1.UnitDir.LEFT then
		arg_11_0._normalizeOffset = math.pi - var_11_1
	elseif arg_11_0:GetDirection() == var_0_1.UnitDir.RIGHT then
		arg_11_0._normalizeOffset = var_11_1
	end

	arg_11_0._wholeCircle = math.pi - arg_11_0._normalizeOffset
	arg_11_0._negativeCircle = -math.pi - arg_11_0._normalizeOffset
	arg_11_0._wholeCircleNormalizeOffset = arg_11_0._normalizeOffset - math.pi * 2
	arg_11_0._negativeCircleNormalizeOffset = arg_11_0._normalizeOffset + math.pi * 2
end

function var_0_9.cacheSquareData(arg_12_0)
	arg_12_0._frontRange = arg_12_0._tmpData.angle
	arg_12_0._backRange = arg_12_0._tmpData.axis_angle
	arg_12_0._upperRange = arg_12_0._tmpData.min_range
	arg_12_0._lowerRange = arg_12_0._tmpData.range
end

function var_0_9.SetModelID(arg_13_0, arg_13_1)
	arg_13_0._modelID = arg_13_1
end

function var_0_9.SetSkinData(arg_14_0, arg_14_1)
	arg_14_0._skinID = arg_14_1

	local var_14_0, var_14_1, var_14_2, var_14_3, var_14_4, var_14_5 = var_0_6.GetEquipSkin(arg_14_0._skinID)

	arg_14_0:SetModelID(var_14_0)

	if var_14_4 ~= "" then
		arg_14_0._skinFireFX = var_14_4
	end

	if var_14_5 ~= "" then
		arg_14_0._skinHitFX = var_14_5
	end

	local var_14_6, var_14_7 = var_0_6.GetEquipSkinSFX(arg_14_0._skinID)

	arg_14_0._skinHixSFX = var_14_6
	arg_14_0._skinMissSFX = var_14_7
end

function var_0_9.SetDerivateSkin(arg_15_0, arg_15_1)
	arg_15_0._derivateSkinID = arg_15_1

	local var_15_0, var_15_1, var_15_2, var_15_3, var_15_4, var_15_5 = var_0_6.GetEquipSkin(arg_15_0._derivateSkinID)

	arg_15_0._derivateBullet = var_15_1
	arg_15_0._derivateTorpedo = var_15_2
	arg_15_0._derivateBoom = var_15_3
	arg_15_0._derviateHitFX = var_15_5

	local var_15_6, var_15_7 = var_0_6.GetEquipSkinSFX(arg_15_0._derivateSkinID)

	arg_15_0._skinHixSFX = var_15_6
	arg_15_0._skinMissSFX = var_15_7
end

function var_0_9.GetSkinID(arg_16_0)
	return arg_16_0._skinID
end

function var_0_9.setBulletSkin(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0._derivateSkinID then
		local var_17_0 = var_0_6.GetBulletTmpDataFromID(arg_17_2).type

		if var_17_0 == var_0_1.BulletType.BOMB and arg_17_0._derivateBoom ~= "" then
			arg_17_1:SetModleID(arg_17_0._derivateBoom, nil, arg_17_0._derviateHitFX)
		elseif var_17_0 == var_0_1.BulletType.TORPEDO and arg_17_0._derivateTorpedo ~= "" then
			arg_17_1:SetModleID(arg_17_0._derivateTorpedo, nil, arg_17_0._derviateHitFX)
		elseif arg_17_0._derivateBullet ~= "" then
			arg_17_1:SetModleID(arg_17_0._derivateBullet, nil, arg_17_0._derviateHitFX)
		end

		arg_17_1:SetSFXID(arg_17_0._skinHixSFX, arg_17_0._skinMissSFX)
	elseif arg_17_0._modelID then
		local var_17_1 = 0

		if arg_17_0._skinID then
			var_17_1 = var_0_6.GetEquipSkinDataFromID(arg_17_0._skinID).mirror
		end

		arg_17_1:SetModleID(arg_17_0._modelID, var_17_1, arg_17_0._skinHitFX)
		arg_17_1:SetSFXID(arg_17_0._skinHixSFX, arg_17_0._skinMissSFX)
	end
end

function var_0_9.SetSrcEquipmentID(arg_18_0, arg_18_1)
	arg_18_0._srcEquipID = arg_18_1
end

function var_0_9.SetEquipmentIndex(arg_19_0, arg_19_1)
	arg_19_0._equipmentIndex = arg_19_1
end

function var_0_9.GetEquipmentIndex(arg_20_0)
	return arg_20_0._equipmentIndex
end

function var_0_9.SetHostData(arg_21_0, arg_21_1)
	arg_21_0._host = arg_21_1
	arg_21_0._hostUnitType = arg_21_0._host:GetUnitType()
	arg_21_0._hostIFF = arg_21_1:GetIFF()

	if arg_21_0._tmpData.search_type == var_0_5.SECTOR then
		arg_21_0:cacheSectorData()

		arg_21_0.outOfFireRange = arg_21_0.IsOutOfAngle
		arg_21_0.IsOutOfFireArea = arg_21_0.IsOutOfSector
	elseif arg_21_0._tmpData.search_type == var_0_5.SQUARE then
		arg_21_0:cacheSquareData()

		arg_21_0.outOfFireRange = arg_21_0.IsOutOfSquare
		arg_21_0.IsOutOfFireArea = arg_21_0.IsOutOfSquare
	elseif arg_21_0._tmpData.search_type == var_0_5.STRIKE then
		arg_21_0:cacheSquareData()

		arg_21_0.outOfFireRange = arg_21_0.IsOutOfSquare
	end

	if arg_21_0:GetDirection() == var_0_1.UnitDir.RIGHT then
		arg_21_0._baseAngle = 0
	else
		arg_21_0._baseAngle = 180
	end
end

function var_0_9.SetStandHost(arg_22_0, arg_22_1)
	arg_22_0._standHost = arg_22_1
end

function var_0_9.OverrideGCD(arg_23_0, arg_23_1)
	arg_23_0._GCD = arg_23_1
end

function var_0_9.updateMovementInfo(arg_24_0)
	arg_24_0._hostPos = arg_24_0._host:GetPosition()
end

function var_0_9.GetWeaponId(arg_25_0)
	return arg_25_0._tmpData.id
end

function var_0_9.GetTemplateData(arg_26_0)
	return arg_26_0._tmpData
end

function var_0_9.GetType(arg_27_0)
	return arg_27_0._tmpData.type
end

function var_0_9.GetPotential(arg_28_0)
	return arg_28_0._potential or 1
end

function var_0_9.GetSrcEquipmentID(arg_29_0)
	return arg_29_0._srcEquipID
end

function var_0_9.SetFixedFlag(arg_30_0)
	arg_30_0._isFixedWeapon = true
end

function var_0_9.IsFixedWeapon(arg_31_0)
	return arg_31_0._isFixedWeapon
end

function var_0_9.IsAttacking(arg_32_0)
	return arg_32_0._currentState == var_0_9.STATE_ATTACK or arg_32_0._currentState == arg_32_0.STATE_PRECAST
end

function var_0_9.Update(arg_33_0)
	arg_33_0:UpdateReload()

	if not arg_33_0._diveEnabled then
		return
	end

	if arg_33_0._currentState == arg_33_0.STATE_READY then
		arg_33_0:updateMovementInfo()

		if arg_33_0._tmpData.suppress == var_0_4.SUPPRESSION or arg_33_0:CheckPreCast() then
			if arg_33_0._preCastInfo.time == nil or not arg_33_0._hostOnEnemy then
				arg_33_0._currentState = arg_33_0.STATE_PRECAST_FINISH
			else
				arg_33_0:PreCast()
			end
		end
	end

	if arg_33_0._currentState == arg_33_0.STATE_PRECAST_FINISH then
		arg_33_0:updateMovementInfo()
		arg_33_0:Fire(arg_33_0:Tracking())
	end
end

function var_0_9.CheckReloadTimeStamp(arg_34_0)
	return arg_34_0._CDstartTime and arg_34_0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime()
end

function var_0_9.UpdateReload(arg_35_0)
	if arg_35_0._CDstartTime and not arg_35_0._jammingStartTime then
		if arg_35_0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then
			arg_35_0:handleCoolDown()
		else
			return
		end
	end
end

function var_0_9.CheckPreCast(arg_36_0)
	if arg_36_0._tmpData.search_type == var_0_5.STRIKE then
		local var_36_0 = arg_36_0._host:GetStrikePoint()

		return not arg_36_0:IsPointOutOfSquare(var_36_0)
	else
		for iter_36_0, iter_36_1 in pairs(arg_36_0:GetFilteredList()) do
			return true
		end
	end

	return false
end

function var_0_9.ChangeDiveState(arg_37_0)
	if arg_37_0._host:GetOxyState() then
		local var_37_0 = arg_37_0._host:GetOxyState():GetWeaponType()

		for iter_37_0, iter_37_1 in ipairs(arg_37_0._oxyList) do
			if table.contains(var_37_0, iter_37_1) then
				arg_37_0._diveEnabled = true

				return
			end
		end

		arg_37_0._diveEnabled = false
	end
end

function var_0_9.getTrackingHost(arg_38_0)
	return arg_38_0._host
end

var_0_9.TrackingFunc = {
	farthest = var_0_9.TrackingFarthest,
	leastHP = var_0_9.TrackingLeastHP
}

function var_0_9.Tracking(arg_39_0)
	if arg_39_0._tmpData.search_type == var_0_5.STRIKE then
		return nil
	end

	local var_39_0 = var_0_7.GetCurrentTargetSelect(arg_39_0._host)
	local var_39_1
	local var_39_2 = arg_39_0:GetFilteredList()

	if var_39_0 then
		local var_39_3 = var_0_9.TrackingFunc[var_39_0]

		if var_39_3 then
			var_39_1 = var_39_3(arg_39_0, var_39_2)
		else
			var_39_1 = arg_39_0:TrackingTag(var_39_2, var_39_0)
		end
	else
		var_39_1 = arg_39_0:TrackingNearest(var_39_2)
	end

	if var_39_1 and var_0_7.GetCurrentGuardianID(var_39_1) then
		local var_39_4 = var_0_7.GetCurrentGuardianID(var_39_1)

		for iter_39_0, iter_39_1 in ipairs(var_39_2) do
			if iter_39_1:GetUniqueID() == var_39_4 then
				var_39_1 = iter_39_1

				break
			end
		end
	end

	return var_39_1
end

function var_0_9.GetFilteredList(arg_40_0)
	local var_40_0 = arg_40_0:FilterTarget()

	if arg_40_0._tmpData.search_type == var_0_5.SECTOR then
		var_40_0 = arg_40_0:FilterRange(var_40_0)
		var_40_0 = arg_40_0:FilterAngle(var_40_0)
	elseif arg_40_0._tmpData.search_type == var_0_5.SQUARE then
		var_40_0 = arg_40_0:FilterSquare(var_40_0)
	end

	return var_40_0
end

function var_0_9.FixWeaponRange(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	arg_41_0._maxRangeSqr = arg_41_1 or arg_41_0._tmpData.range
	arg_41_0._minRangeSqr = arg_41_3 or arg_41_0._tmpData.min_range
	arg_41_0._fixBulletRange = arg_41_2
	arg_41_0._bulletRangeOffset = arg_41_4
end

function var_0_9.GetWeaponMaxRange(arg_42_0)
	return arg_42_0._maxRangeSqr
end

function var_0_9.GetWeaponMinRange(arg_43_0)
	return arg_43_0._minRangeSqr
end

function var_0_9.GetFixBulletRange(arg_44_0)
	return arg_44_0._fixBulletRange, arg_44_0._bulletRangeOffset
end

function var_0_9.TrackingNearest(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_0._maxRangeSqr
	local var_45_1

	for iter_45_0, iter_45_1 in ipairs(arg_45_1) do
		local var_45_2 = arg_45_0:getTrackingHost():GetDistance(iter_45_1)

		if var_45_2 <= var_45_0 then
			var_45_0 = var_45_2
			var_45_1 = iter_45_1
		end
	end

	return var_45_1
end

function var_0_9.TrackingFarthest(arg_46_0, arg_46_1)
	local var_46_0 = 0
	local var_46_1

	for iter_46_0, iter_46_1 in ipairs(arg_46_1) do
		local var_46_2 = arg_46_0:getTrackingHost():GetDistance(iter_46_1)

		if var_46_0 < var_46_2 then
			var_46_0 = var_46_2
			var_46_1 = iter_46_1
		end
	end

	return var_46_1
end

function var_0_9.TrackingLeastHP(arg_47_0, arg_47_1)
	local var_47_0 = math.huge
	local var_47_1

	for iter_47_0, iter_47_1 in ipairs(arg_47_1) do
		local var_47_2 = iter_47_1:GetCurrentHP()

		if var_47_2 < var_47_0 then
			var_47_1 = iter_47_1
			var_47_0 = var_47_2
		end
	end

	return var_47_1
end

function var_0_9.TrackingRandom(arg_48_0, arg_48_1)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_1) do
		table.insert(var_48_0, iter_48_1)
	end

	local var_48_1 = #var_48_0

	if #var_48_0 == 0 then
		return nil
	else
		return var_48_0[math.random(#var_48_0)]
	end
end

function var_0_9.TrackingTag(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_1) do
		if iter_49_1:ContainsLabelTag({
			arg_49_2
		}) then
			table.insert(var_49_0, iter_49_1)
		end
	end

	if #var_49_0 == 0 then
		return arg_49_0:TrackingNearest(arg_49_1)
	else
		return var_49_0[math.random(#var_49_0)]
	end
end

function var_0_9.FilterTarget(arg_50_0)
	local var_50_0 = var_0_8.LegalWeaponTarget(arg_50_0._host)
	local var_50_1 = {}
	local var_50_2 = 1
	local var_50_3 = arg_50_0._tmpData.search_condition

	for iter_50_0, iter_50_1 in pairs(var_50_0) do
		local var_50_4 = iter_50_1:GetCurrentOxyState()

		if var_0_7.IsCloak(iter_50_1) then
			-- block empty
		elseif not table.contains(var_50_3, var_50_4) then
			-- block empty
		else
			local var_50_5 = true

			if var_50_4 == var_0_1.OXY_STATE.FLOAT then
				-- block empty
			elseif var_50_4 == var_0_1.OXY_STATE.DIVE and not iter_50_1:IsRunMode() and not iter_50_1:GetDiveDetected() and iter_50_1:GetDiveInvisible() then
				var_50_5 = false
			end

			if var_50_5 then
				var_50_1[var_50_2] = iter_50_1
				var_50_2 = var_50_2 + 1
			end
		end
	end

	return var_50_1
end

function var_0_9.FilterAngle(arg_51_0, arg_51_1)
	if arg_51_0:GetAttackAngle() >= 360 then
		return arg_51_1
	end

	for iter_51_0 = #arg_51_1, 1, -1 do
		if arg_51_0:IsOutOfAngle(arg_51_1[iter_51_0]) then
			table.remove(arg_51_1, iter_51_0)
		end
	end

	return arg_51_1
end

function var_0_9.FilterRange(arg_52_0, arg_52_1)
	for iter_52_0 = #arg_52_1, 1, -1 do
		if arg_52_0:IsOutOfRange(arg_52_1[iter_52_0]) then
			table.remove(arg_52_1, iter_52_0)
		end
	end

	return arg_52_1
end

function var_0_9.FilterSquare(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0:GetDirection()
	local var_53_1 = arg_53_0._host:GetPosition().x + arg_53_0._backRange * var_53_0 * -1
	local var_53_2 = {
		lineX = var_53_1,
		dir = var_53_0
	}
	local var_53_3 = var_0_8.TargetInsideArea(arg_53_0._host, var_53_2, arg_53_1)
	local var_53_4 = var_0_8.TargetWeightiest(arg_53_0._host, nil, var_53_3)

	for iter_53_0 = #arg_53_1, 1, -1 do
		if arg_53_0:IsOutOfSquare(arg_53_1[iter_53_0]) then
			table.remove(arg_53_1, iter_53_0)
		end
	end

	for iter_53_1 = #arg_53_1, 1, -1 do
		if not table.contains(var_53_4, arg_53_1[iter_53_1]) then
			table.remove(arg_53_1, iter_53_1)
		end
	end

	return arg_53_1
end

function var_0_9.GetAttackAngle(arg_54_0)
	return arg_54_0._tmpData.angle
end

function var_0_9.IsOutOfAngle(arg_55_0, arg_55_1)
	if arg_55_0:GetAttackAngle() >= 360 then
		return false
	end

	local var_55_0 = arg_55_1:GetPosition()
	local var_55_1 = math.atan2(var_55_0.z - arg_55_0._hostPos.z, var_55_0.x - arg_55_0._hostPos.x)

	if var_55_1 > arg_55_0._wholeCircle then
		var_55_1 = var_55_1 + arg_55_0._wholeCircleNormalizeOffset
	elseif var_55_1 < arg_55_0._negativeCircle then
		var_55_1 = var_55_1 + arg_55_0._negativeCircleNormalizeOffset
	else
		var_55_1 = var_55_1 + arg_55_0._normalizeOffset
	end

	if var_55_1 > arg_55_0._lowerEdge and var_55_1 < arg_55_0._upperEdge then
		return false
	else
		return true
	end
end

function var_0_9.IsOutOfRange(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:getTrackingHost():GetDistance(arg_56_1)

	return var_56_0 > arg_56_0._maxRangeSqr or var_56_0 < arg_56_0:GetMinimumRange()
end

function var_0_9.IsOutOfSector(arg_57_0, arg_57_1)
	return arg_57_0:IsOutOfRange(arg_57_1) or arg_57_0:IsOutOfAngle(arg_57_1)
end

function var_0_9.IsOutOfSquare(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_1:GetPosition()

	return arg_58_0:IsPointOutOfSquare(var_58_0)
end

function var_0_9.IsPointOutOfSquare(arg_59_0, arg_59_1)
	local var_59_0 = false
	local var_59_1 = (arg_59_1.x - arg_59_0._hostPos.x) * arg_59_0:GetDirection()

	if arg_59_0._backRange < 0 then
		if var_59_1 > 0 and var_59_1 <= arg_59_0._frontRange and var_59_1 >= math.abs(arg_59_0._backRange) then
			var_59_0 = true
		end
	elseif var_59_1 > 0 and var_59_1 <= arg_59_0._frontRange or var_59_1 < 0 and math.abs(var_59_1) < arg_59_0._backRange then
		var_59_0 = true
	end

	if not var_59_0 then
		return true
	else
		return false
	end
end

function var_0_9.PreCast(arg_60_0)
	arg_60_0._currentState = arg_60_0.STATE_PRECAST

	arg_60_0:AddPreCastTimer()

	if arg_60_0._preCastInfo.armor then
		arg_60_0._precastArmor = arg_60_0._preCastInfo.armor
	end

	local var_60_0 = arg_60_0._preCastInfo
	local var_60_1 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.WEAPON_PRE_CAST, var_60_0)

	arg_60_0._host:SetWeaponPreCastBound(arg_60_0._preCastInfo.isBound)
	arg_60_0:DispatchEvent(var_60_1)
end

function var_0_9.Fire(arg_61_0, arg_61_1)
	if arg_61_0._host:IsCease() then
		return false
	else
		arg_61_0:DispatchGCD()

		arg_61_0._currentState = arg_61_0.STATE_ATTACK

		if arg_61_0._tmpData.action_index == "" then
			arg_61_0:DoAttack(arg_61_1)
		else
			arg_61_0:DispatchFireEvent(arg_61_1, arg_61_0._tmpData.action_index)
		end
	end

	return true
end

function var_0_9.DoAttack(arg_62_0, arg_62_1)
	if arg_62_1 == nil or not arg_62_1:IsAlive() or arg_62_0:outOfFireRange(arg_62_1) then
		arg_62_1 = nil
	end

	local var_62_0 = arg_62_0:GetDirection()
	local var_62_1 = arg_62_0:GetAttackAngle()

	arg_62_0:cacheBulletID()
	arg_62_0:TriggerBuffOnSteday()

	for iter_62_0, iter_62_1 in ipairs(arg_62_0._majorEmitterList) do
		iter_62_1:Ready()
	end

	for iter_62_2, iter_62_3 in ipairs(arg_62_0._majorEmitterList) do
		iter_62_3:Fire(arg_62_1, var_62_0, var_62_1)
	end

	arg_62_0._host:CloakExpose(arg_62_0._tmpData.expose)
	var_0_0.Battle.PlayBattleSFX(arg_62_0._tmpData.fire_sfx)
	arg_62_0:TriggerBuffOnFire()
	arg_62_0:CheckAndShake()
end

function var_0_9.TriggerBuffOnSteday(arg_63_0)
	arg_63_0._host:TriggerBuff(var_0_1.BuffEffectType.ON_WEAPON_STEDAY, {
		equipIndex = arg_63_0._equipmentIndex
	})
end

function var_0_9.TriggerBuffOnFire(arg_64_0)
	arg_64_0._host:TriggerBuff(var_0_1.BuffEffectType.ON_FIRE, {
		equipIndex = arg_64_0._equipmentIndex
	})
end

function var_0_9.TriggerBuffOnReady(arg_65_0)
	return
end

function var_0_9.UpdateCombo(arg_66_0, arg_66_1)
	if arg_66_0._hostUnitType ~= var_0_1.UnitType.PLAYER_UNIT or not arg_66_0._host:IsAlive() then
		return
	end

	if #arg_66_1 > 0 then
		local var_66_0 = 0

		for iter_66_0, iter_66_1 in ipairs(arg_66_1) do
			if table.contains(arg_66_0._comboIDList, iter_66_1) then
				var_66_0 = var_66_0 + 1
			end

			arg_66_0._host:TriggerBuff(var_0_1.BuffEffectType.ON_COMBO, {
				equipIndex = arg_66_0._equipmentIndex,
				matchUnitCount = var_66_0
			})

			break
		end

		arg_66_0._comboIDList = arg_66_1
	end
end

function var_0_9.SingleFire(arg_67_0, arg_67_1, arg_67_2, arg_67_3, arg_67_4)
	local var_67_0 = {}

	arg_67_0._tempEmittersList[#arg_67_0._tempEmittersList + 1] = var_67_0

	if arg_67_1 and arg_67_1:IsAlive() then
		-- block empty
	else
		arg_67_1 = nil
	end

	arg_67_2 = arg_67_2 or var_0_9.EMITTER_NORMAL

	for iter_67_0, iter_67_1 in ipairs(arg_67_0._barrageList) do
		local function var_67_1(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
			local var_68_0 = (arg_67_4 and arg_67_0._tmpData.bullet_ID or arg_67_0._bulletList)[iter_67_0]
			local var_68_1 = arg_67_0:Spawn(var_68_0, arg_67_1, var_0_9.EXTERNAL)

			var_68_1:SetOffsetPriority(arg_68_3)
			var_68_1:SetShiftInfo(arg_68_0, arg_68_1)

			if arg_67_1 ~= nil then
				var_68_1:SetRotateInfo(arg_67_1:GetBeenAimedPosition(), arg_67_0:GetBaseAngle(), arg_68_2)
			else
				var_68_1:SetRotateInfo(nil, arg_67_0:GetBaseAngle(), arg_68_2)
			end

			arg_67_0:DispatchBulletEvent(var_68_1)
		end

		local function var_67_2()
			for iter_69_0, iter_69_1 in ipairs(var_67_0) do
				if iter_69_1:GetState() ~= iter_69_1.STATE_STOP then
					return
				end
			end

			for iter_69_2, iter_69_3 in ipairs(var_67_0) do
				iter_69_3:Destroy()
			end

			local var_69_0

			for iter_69_4, iter_69_5 in ipairs(arg_67_0._tempEmittersList) do
				if iter_69_5 == var_67_0 then
					var_69_0 = iter_69_4
				end
			end

			table.remove(arg_67_0._tempEmittersList, var_69_0)

			var_67_0 = nil
			arg_67_0._fireFXFlag = arg_67_0._tmpData.fire_fx_loop_type

			if arg_67_3 then
				arg_67_3()
			end
		end

		local var_67_3 = var_0_0.Battle[arg_67_2].New(var_67_1, var_67_2, iter_67_1)

		var_67_0[#var_67_0 + 1] = var_67_3
	end

	for iter_67_2, iter_67_3 in ipairs(var_67_0) do
		iter_67_3:Ready()
		iter_67_3:Fire(arg_67_1, arg_67_0:GetDirection(), arg_67_0:GetAttackAngle())
	end

	arg_67_0._host:CloakExpose(arg_67_0._tmpData.expose)
	arg_67_0:CheckAndShake()
end

function var_0_9.SetModifyInitialCD(arg_70_0)
	arg_70_0._modInitCD = true
end

function var_0_9.GetModifyInitialCD(arg_71_0)
	return arg_71_0._modInitCD
end

function var_0_9.InitialCD(arg_72_0)
	if arg_72_0._tmpData.initial_over_heat == 1 then
		arg_72_0:AddCDTimer(arg_72_0:GetReloadTime())
	end
end

function var_0_9.EnterCoolDown(arg_73_0)
	arg_73_0._fireFXFlag = arg_73_0._tmpData.fire_fx_loop_type

	arg_73_0:AddCDTimer(arg_73_0:GetReloadTime())
end

function var_0_9.UpdatePrecastArmor(arg_74_0, arg_74_1)
	if arg_74_0._currentState ~= var_0_9.STATE_PRECAST or not arg_74_0._precastArmor then
		return
	end

	arg_74_0._precastArmor = arg_74_0._precastArmor + arg_74_1

	if arg_74_0._precastArmor <= 0 then
		arg_74_0:Interrupt()
	end
end

function var_0_9.Interrupt(arg_75_0)
	local var_75_0 = arg_75_0._preCastInfo
	local var_75_1 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.WEAPON_PRE_CAST_FINISH, var_75_0)

	arg_75_0:DispatchEvent(var_75_1)

	local var_75_2 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.WEAPON_INTERRUPT, var_75_0)

	arg_75_0:DispatchEvent(var_75_2)
	arg_75_0:TriggerBuffWhenPrecastFinish(var_0_1.BuffEffectType.ON_WEAPON_INTERRUPT)
	arg_75_0:RemovePrecastTimer()
	arg_75_0:EnterCoolDown()
end

function var_0_9.Cease(arg_76_0)
	if arg_76_0._currentState == var_0_9.STATE_ATTACK or arg_76_0._currentState == var_0_9.STATE_PRECAST or arg_76_0._currentState == var_0_9.STATE_PRECAST_FINISH then
		arg_76_0:interruptAllEmitter()
		arg_76_0:EnterCoolDown()
	end
end

function var_0_9.AppendReloadBoost(arg_77_0)
	return
end

function var_0_9.DispatchGCD(arg_78_0)
	if arg_78_0._GCD > 0 then
		arg_78_0._host:EnterGCD(arg_78_0._GCD, arg_78_0._tmpData.queue)
	end
end

function var_0_9.Clear(arg_79_0)
	arg_79_0:RemovePrecastTimer()

	if arg_79_0._majorEmitterList then
		for iter_79_0, iter_79_1 in ipairs(arg_79_0._majorEmitterList) do
			iter_79_1:Destroy()
		end
	end

	for iter_79_2, iter_79_3 in ipairs(arg_79_0._tempEmittersList) do
		for iter_79_4, iter_79_5 in ipairs(iter_79_3) do
			iter_79_5:Destroy()
		end
	end

	for iter_79_6, iter_79_7 in ipairs(arg_79_0._dumpedEmittersList) do
		for iter_79_8, iter_79_9 in ipairs(iter_79_7) do
			iter_79_9:Destroy()
		end
	end

	if arg_79_0._currentState ~= arg_79_0.STATE_OVER_HEAT then
		arg_79_0._currentState = arg_79_0.STATE_DISABLE
	end
end

function var_0_9.Dispose(arg_80_0)
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_80_0)
	arg_80_0:RemovePrecastTimer()

	arg_80_0._dataProxy = nil
end

function var_0_9.AddCDTimer(arg_81_0, arg_81_1)
	arg_81_0._currentState = arg_81_0.STATE_OVER_HEAT
	arg_81_0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	arg_81_0._reloadRequire = arg_81_1
end

function var_0_9.GetCDStartTimeStamp(arg_82_0)
	return arg_82_0._CDstartTime
end

function var_0_9.handleCoolDown(arg_83_0)
	arg_83_0._currentState = arg_83_0.STATE_READY
	arg_83_0._CDstartTime = nil
	arg_83_0._jammingTime = 0
end

function var_0_9.OverHeat(arg_84_0)
	arg_84_0._currentState = arg_84_0.STATE_OVER_HEAT
end

function var_0_9.RemovePrecastTimer(arg_85_0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_85_0._precastTimer)
	arg_85_0._host:SetWeaponPreCastBound(false)

	arg_85_0._precastArmor = nil
	arg_85_0._precastTimer = nil
end

function var_0_9.AddPreCastTimer(arg_86_0)
	local function var_86_0()
		arg_86_0._currentState = arg_86_0.STATE_PRECAST_FINISH

		arg_86_0:RemovePrecastTimer()

		local var_87_0 = arg_86_0._preCastInfo
		local var_87_1 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.WEAPON_PRE_CAST_FINISH, var_87_0)

		arg_86_0:DispatchEvent(var_87_1)
		arg_86_0:TriggerBuffWhenPrecastFinish(var_0_1.BuffEffectType.ON_WEAPON_SUCCESS)
		arg_86_0:Tracking()
	end

	arg_86_0._precastTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponPrecastTimer", 0, arg_86_0._preCastInfo.time, var_86_0, true)
end

function var_0_9.Spawn(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0

	if arg_88_0._tmpData.search_type == var_0_5.STRIKE then
		var_88_0 = arg_88_0._host:GetStrikePoint()
	elseif arg_88_2 == nil then
		var_88_0 = Vector3.zero
	else
		var_88_0 = arg_88_2:GetBeenAimedPosition() or arg_88_2:GetPosition()
	end

	local var_88_1 = arg_88_0._dataProxy:CreateBulletUnit(arg_88_1, arg_88_0._host, arg_88_0, var_88_0)

	arg_88_0:setBulletSkin(var_88_1, arg_88_1)
	arg_88_0:setBulletOrb(var_88_1)
	arg_88_0:TriggerBuffWhenSpawn(var_88_1)

	return var_88_1
end

function var_0_9.FixAmmo(arg_89_0, arg_89_1)
	arg_89_0._fixedAmmo = arg_89_1
end

function var_0_9.GetFixAmmo(arg_90_0)
	return arg_90_0._fixedAmmo
end

function var_0_9.ShiftBullet(arg_91_0, arg_91_1)
	local var_91_0 = {}

	for iter_91_0 = 1, #arg_91_0._bulletList do
		var_91_0[iter_91_0] = arg_91_1
	end

	arg_91_0._bulletList = var_91_0
end

function var_0_9.RevertBullet(arg_92_0)
	arg_92_0._bulletList = arg_92_0._tmpData.bullet_ID
end

function var_0_9.cacheBulletID(arg_93_0)
	arg_93_0._emitBulletIDList = arg_93_0._bulletList
end

function var_0_9.setBulletOrb(arg_94_0, arg_94_1)
	if not arg_94_0._orbID then
		return
	end

	local var_94_0 = {
		buff_id = arg_94_0._orbID,
		rant = arg_94_0._orbRant,
		level = arg_94_0._orbLevel
	}

	arg_94_1:AppendAttachBuff(var_94_0)
end

function var_0_9.SetBulletOrbData(arg_95_0, arg_95_1)
	arg_95_0._orbID = arg_95_1.buffID
	arg_95_0._orbRant = arg_95_1.rant
	arg_95_0._orbLevel = arg_95_1.level
end

function var_0_9.ShiftBarrage(arg_96_0, arg_96_1)
	for iter_96_0, iter_96_1 in ipairs(arg_96_0._majorEmitterList) do
		table.insert(arg_96_0._dumpedEmittersList, iter_96_1)
	end

	arg_96_0._majorEmitterList = {}

	if type(arg_96_1) == "number" then
		local var_96_0 = {}

		for iter_96_2 = 1, #arg_96_0._barrageList do
			var_96_0[iter_96_2] = arg_96_1
		end

		arg_96_0._barrageList = var_96_0
	elseif type(arg_96_1) == "table" then
		arg_96_0._barrageList = arg_96_1
	end

	for iter_96_3, iter_96_4 in ipairs(arg_96_0._barrageList) do
		arg_96_0:createMajorEmitter(iter_96_4, iter_96_3)
	end
end

function var_0_9.RevertBarrage(arg_97_0)
	arg_97_0:ShiftBarrage(arg_97_0._tmpData.barrage_ID)
end

function var_0_9.GetPrimalAmmoType(arg_98_0)
	return var_0_6.GetBulletTmpDataFromID(arg_98_0._tmpData.bullet_ID[1]).ammo_type
end

function var_0_9.TriggerBuffWhenSpawn(arg_99_0, arg_99_1, arg_99_2)
	local var_99_0 = arg_99_2 or var_0_1.BuffEffectType.ON_BULLET_CREATE
	local var_99_1 = {
		_bullet = arg_99_1,
		equipIndex = arg_99_0._equipmentIndex,
		bulletTag = arg_99_1:GetExtraTag()
	}

	arg_99_0._host:TriggerBuff(var_99_0, var_99_1)
end

function var_0_9.TriggerBuffWhenPrecastFinish(arg_100_0, arg_100_1)
	if arg_100_0._preCastInfo.armor then
		local var_100_0 = {
			weaponID = arg_100_0._tmpData.id
		}

		arg_100_0._host:TriggerBuff(arg_100_1, var_100_0)
	end
end

function var_0_9.DispatchBulletEvent(arg_101_0, arg_101_1, arg_101_2)
	local var_101_0 = arg_101_2
	local var_101_1 = arg_101_0._tmpData
	local var_101_2

	if arg_101_0._fireFXFlag ~= 0 then
		var_101_2 = arg_101_0._skinFireFX or var_101_1.fire_fx

		if arg_101_0._fireFXFlag ~= -1 then
			arg_101_0._fireFXFlag = arg_101_0._fireFXFlag - 1
		end
	end

	if type(var_101_1.spawn_bound) == "table" and not var_101_0 then
		local var_101_3 = arg_101_0._dataProxy:GetStageInfo().mainUnitPosition

		if var_101_3 and var_101_3[arg_101_0._hostIFF] then
			var_101_0 = Clone(var_101_3[arg_101_0._hostIFF][var_101_1.spawn_bound[1]])
		else
			var_101_0 = Clone(var_0_2.MAIN_UNIT_POS[arg_101_0._hostIFF][var_101_1.spawn_bound[1]])
		end
	end

	local var_101_4 = {
		spawnBound = var_101_1.spawn_bound,
		bullet = arg_101_1,
		fireFxID = var_101_2,
		position = var_101_0
	}
	local var_101_5 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.CREATE_BULLET, var_101_4)

	arg_101_0:DispatchEvent(var_101_5)
end

function var_0_9.DispatchFireEvent(arg_102_0, arg_102_1, arg_102_2)
	local var_102_0 = {
		target = arg_102_1,
		actionIndex = arg_102_2
	}
	local var_102_1 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.FIRE, var_102_0)

	arg_102_0:DispatchEvent(var_102_1)
end

function var_0_9.CheckAndShake(arg_103_0)
	if arg_103_0._tmpData.shakescreen ~= 0 then
		var_0_0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[arg_103_0._tmpData.shakescreen])
	end
end

function var_0_9.GetBaseAngle(arg_104_0)
	return arg_104_0._baseAngle
end

function var_0_9.GetHost(arg_105_0)
	return arg_105_0._host
end

function var_0_9.GetStandHost(arg_106_0)
	return arg_106_0._standHost
end

function var_0_9.GetPosition(arg_107_0)
	return arg_107_0._hostPos
end

function var_0_9.GetDirection(arg_108_0)
	return arg_108_0._host:GetDirection()
end

function var_0_9.GetCurrentState(arg_109_0)
	return arg_109_0._currentState
end

function var_0_9.GetReloadTime(arg_110_0)
	local var_110_0 = var_0_7.GetCurrent(arg_110_0._host, "loadSpeed")

	if arg_110_0._reloadMax ~= arg_110_0._cacheReloadMax or var_110_0 ~= arg_110_0._cacheHostReload then
		arg_110_0._cacheReloadMax = arg_110_0._reloadMax
		arg_110_0._cacheHostReload = var_110_0
		arg_110_0._cacheReloadTime = var_0_3.CalculateReloadTime(arg_110_0._reloadMax, var_0_7.GetCurrent(arg_110_0._host, "loadSpeed"))
	end

	return arg_110_0._cacheReloadTime
end

function var_0_9.GetReloadTimeByRate(arg_111_0, arg_111_1)
	local var_111_0 = var_0_7.GetCurrent(arg_111_0._host, "loadSpeed")
	local var_111_1 = arg_111_0._cacheReloadMax * arg_111_1

	return (var_0_3.CalculateReloadTime(var_111_1, var_111_0))
end

function var_0_9.GetReloadFinishTimeStamp(arg_112_0)
	local var_112_0 = 0

	for iter_112_0, iter_112_1 in ipairs(arg_112_0._reloadBoostList) do
		var_112_0 = var_112_0 + iter_112_1
	end

	return arg_112_0._reloadRequire + arg_112_0._CDstartTime + arg_112_0._jammingTime + var_112_0
end

function var_0_9.AppendFactor(arg_113_0, arg_113_1)
	return
end

function var_0_9.StartJamming(arg_114_0)
	if arg_114_0._currentState ~= var_0_9.STATE_READY then
		arg_114_0._jammingStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	end
end

function var_0_9.JammingEliminate(arg_115_0)
	if not arg_115_0._jammingStartTime then
		return
	end

	arg_115_0._jammingTime = pg.TimeMgr.GetInstance():GetCombatTime() - arg_115_0._jammingStartTime
	arg_115_0._jammingStartTime = nil
end

function var_0_9.FlushReloadMax(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_0._tmpData.reload_max

	arg_116_1 = arg_116_1 or 1
	arg_116_0._reloadMax = var_116_0 * arg_116_1

	if not arg_116_0._CDstartTime or arg_116_0._reloadRequire == 0 then
		return true
	end

	local var_116_1 = var_0_7.GetCurrent(arg_116_0._host, "loadSpeed")

	arg_116_0._reloadRequire = var_0_9.FlushRequireByInverse(arg_116_0, var_116_1)
end

function var_0_9.AppendReloadFactor(arg_117_0, arg_117_1, arg_117_2)
	arg_117_0._reloadFacotrList[arg_117_1] = arg_117_2
end

function var_0_9.RemoveReloadFactor(arg_118_0, arg_118_1)
	if arg_118_0._reloadFacotrList[arg_118_1] then
		arg_118_0._reloadFacotrList[arg_118_1] = nil
	end
end

function var_0_9.GetReloadFactorList(arg_119_0)
	return arg_119_0._reloadFacotrList
end

function var_0_9.FlushReloadRequire(arg_120_0)
	if not arg_120_0._CDstartTime or arg_120_0._reloadRequire == 0 then
		return true
	end

	local var_120_0 = var_0_3.CaclulateReloadAttr(arg_120_0._reloadMax, arg_120_0._reloadRequire)

	arg_120_0._reloadRequire = var_0_9.FlushRequireByInverse(arg_120_0, var_120_0)
end

function var_0_9.GetMinimumRange(arg_121_0)
	return arg_121_0._minRangeSqr
end

function var_0_9.GetCorrectedDMG(arg_122_0)
	return arg_122_0._correctedDMG
end

function var_0_9.GetConvertedAtkAttr(arg_123_0)
	return arg_123_0._convertedAtkAttr
end

function var_0_9.SetAtkAttrTrasnform(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	arg_124_0._atkAttrTrans = arg_124_1
	arg_124_0._atkAttrTransA = arg_124_2
	arg_124_0._atkAttrTransB = arg_124_3
end

function var_0_9.GetAtkAttrTrasnform(arg_125_0, arg_125_1)
	local var_125_0

	if arg_125_0._atkAttrTrans then
		local var_125_1 = arg_125_1[arg_125_0._atkAttrTrans] or 0

		var_125_0 = math.min(var_125_1 / arg_125_0._atkAttrTransA, arg_125_0._atkAttrTransB)
	end

	return var_125_0
end

function var_0_9.IsReady(arg_126_0)
	return arg_126_0._currentState == arg_126_0.STATE_READY
end

function var_0_9.FlushRequireByInverse(arg_127_0, arg_127_1)
	local var_127_0 = pg.TimeMgr.GetInstance():GetCombatTime() - arg_127_0._CDstartTime
	local var_127_1 = var_0_3.CaclulateReloaded(var_127_0, arg_127_1)
	local var_127_2 = arg_127_0._reloadMax - var_127_1

	return var_127_0 + var_0_3.CalculateReloadTime(var_127_2, var_0_7.GetCurrent(arg_127_0._host, "loadSpeed"))
end

function var_0_9.SetSupportWeapon(arg_128_0)
	arg_128_0._isSupportWeapon = true
end

function var_0_9.SetCardPuzzleDamageEnhance(arg_129_0, arg_129_1)
	arg_129_0._cardPuzzleEnhance = arg_129_1
end

function var_0_9.GetCardPuzzleDamageEnhance(arg_130_0)
	return arg_130_0._cardPuzzleEnhance or 1
end

function var_0_9.GetReloadRate(arg_131_0)
	if arg_131_0._currentState == arg_131_0.STATE_READY then
		return 0
	elseif arg_131_0._CDstartTime then
		return (arg_131_0:GetReloadFinishTimeStamp() - pg.TimeMgr.GetInstance():GetCombatTime()) / arg_131_0._reloadRequire
	else
		return 1
	end
end

function var_0_9.WeaponStatistics(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	arg_132_0._CLDCount = arg_132_0._CLDCount + 1
	arg_132_0._damageSum = arg_132_1 + arg_132_0._damageSum

	if arg_132_2 then
		arg_132_0._CTSum = arg_132_0._CTSum + 1
	end

	if not arg_132_3 then
		arg_132_0._ACCSum = arg_132_0._ACCSum + 1
	end
end

function var_0_9.GetDamageSUM(arg_133_0)
	return arg_133_0._damageSum
end

function var_0_9.GetCTRate(arg_134_0)
	return arg_134_0._CTSum / arg_134_0._CLDCount
end

function var_0_9.GetACCRate(arg_135_0)
	return arg_135_0._ACCSum / arg_135_0._CLDCount
end

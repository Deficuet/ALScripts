ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleEvent
local var_0_3 = var_0_0.Battle.BattleFormulas
local var_0_4 = var_0_0.Battle.BattleConst
local var_0_5 = var_0_0.Battle.BattleConfig
local var_0_6 = var_0_0.Battle.BattleAttr
local var_0_7 = var_0_0.Battle.BattleDataFunction
local var_0_8 = class("BattleFleetVO")

var_0_0.Battle.BattleFleetVO = var_0_8
var_0_8.__name = "BattleFleetVO"

function var_0_8.Ctor(arg_1_0, arg_1_1)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_1_0)
	var_0_0.EventListener.AttachEventListener(arg_1_0)

	arg_1_0._IFF = arg_1_1
	arg_1_0._lastDist = 0

	arg_1_0:init()
end

function var_0_8.UpdateMotion(arg_2_0)
	if arg_2_0._motionReferenceUnit then
		arg_2_0._motionVO:UpdatePos(arg_2_0._motionReferenceUnit)
		arg_2_0._motionVO:UpdateVelocityAndDirection(arg_2_0:GetFleetVelocity(), arg_2_0._motionSourceFunc())
	end

	local var_2_0 = math.max(arg_2_0._motionVO:GetPos().x - arg_2_0._rightBound, 0)

	if var_2_0 >= 0 and var_2_0 ~= arg_2_0._lastDist then
		arg_2_0._lastDist = var_2_0

		arg_2_0:DispatchEvent(var_0_0.Event.New(var_0_2.SHOW_BUFFER, {
			dist = var_2_0
		}))
	end
end

function var_0_8.UpdateAutoComponent(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0._scoutList) do
		iter_3_1:UpdateWeapon(arg_3_1)
		iter_3_1:UpdateAirAssist()
	end

	for iter_3_2, iter_3_3 in ipairs(arg_3_0._mainList) do
		iter_3_3:UpdateWeapon(arg_3_1)
		iter_3_3:UpdateAirAssist()
	end

	for iter_3_4, iter_3_5 in ipairs(arg_3_0._supportList) do
		iter_3_5:UpdateWeapon(arg_3_1)
	end

	for iter_3_6, iter_3_7 in ipairs(arg_3_0._cloakList) do
		iter_3_7:UpdateCloak(arg_3_1)
	end

	for iter_3_8, iter_3_9 in ipairs(arg_3_0._subList) do
		iter_3_9:UpdateWeapon(arg_3_1)
		iter_3_9:UpdateOxygen(arg_3_1)
		iter_3_9:UpdatePhaseSwitcher()
	end

	for iter_3_10, iter_3_11 in ipairs(arg_3_0._manualSubList) do
		iter_3_11:UpdateOxygen(arg_3_1)
	end

	arg_3_0._fleetAntiAir:Update(arg_3_1)
	arg_3_0._fleetRangeAntiAir:Update(arg_3_1)
	arg_3_0._fleetStaticSonar:Update(arg_3_1)

	for iter_3_12, iter_3_13 in pairs(arg_3_0._indieSonarList) do
		iter_3_12:Update(arg_3_1)
	end

	arg_3_0:UpdateBuff(arg_3_1)

	if arg_3_0._cardPuzzleComponent then
		arg_3_0._cardPuzzleComponent:Update(arg_3_1)
	end
end

function var_0_8.UpdateBuff(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0._buffList

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		iter_4_1:Update(arg_4_0, arg_4_1)
	end
end

function var_0_8.UpdateManualWeaponVO(arg_5_0, arg_5_1)
	arg_5_0._chargeWeaponVO:Update(arg_5_1)
	arg_5_0._torpedoWeaponVO:Update(arg_5_1)
	arg_5_0._airAssistVO:Update(arg_5_1)
	arg_5_0._submarineDiveVO:Update(arg_5_1)
	arg_5_0._submarineFloatVO:Update(arg_5_1)
	arg_5_0._submarineBoostVO:Update(arg_5_1)
	arg_5_0._submarineShiftVO:Update(arg_5_1)
end

function var_0_8.UpdateFleetDamage(arg_6_0, arg_6_1)
	local var_6_0 = var_0_3.CalculateFleetDamage(arg_6_1)

	arg_6_0._currentDMGRatio = arg_6_0._currentDMGRatio + var_6_0

	arg_6_0:DispatchFleetDamageChange()
end

function var_0_8.UpdateFleetOverDamage(arg_7_0, arg_7_1)
	local var_7_0 = var_0_3.CalculateFleetOverDamage(arg_7_0, arg_7_1)

	arg_7_0._currentDMGRatio = arg_7_0._currentDMGRatio - var_7_0

	arg_7_0:DispatchFleetDamageChange()
end

function var_0_8.DispatchFleetDamageChange(arg_8_0)
	arg_8_0:DispatchEvent(var_0_0.Event.New(var_0_2.FLEET_DMG_CHANGE, {}))
end

function var_0_8.DispatchSonarScan(arg_9_0, arg_9_1)
	arg_9_0:DispatchEvent(var_0_0.Event.New(var_0_2.SONAR_SCAN, {
		indieSonar = arg_9_1
	}))
end

function var_0_8.FleetBuffTrigger(arg_10_0, arg_10_1, arg_10_2)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0._unitList) do
		iter_10_1:TriggerBuff(arg_10_1, arg_10_2)
	end
end

function var_0_8.FreeMainUnit(arg_11_0, arg_11_1)
	if arg_11_0._mainUnitFree then
		return
	end

	arg_11_0._mainUnitFree = true

	for iter_11_0, iter_11_1 in ipairs(arg_11_0._mainList) do
		local var_11_0 = var_0_0.Battle.BattleBuffUnit.New(arg_11_1)

		iter_11_1:AddBuff(var_11_0)
		iter_11_1:SetMainUnitStatic(false)
	end
end

function var_0_8.RandomMainVictim(arg_12_0, arg_12_1)
	arg_12_1 = arg_12_1 or {}

	local var_12_0 = {}
	local var_12_1

	for iter_12_0, iter_12_1 in ipairs(arg_12_0._mainList) do
		local var_12_2 = true

		for iter_12_2, iter_12_3 in ipairs(arg_12_1) do
			if iter_12_1:GetAttrByName(iter_12_3) >= 1 then
				var_12_2 = false

				break
			end
		end

		if var_12_2 then
			table.insert(var_12_0, iter_12_1)
		end
	end

	if #var_12_0 > 0 then
		var_12_1 = var_12_0[math.random(#var_12_0)]
	end

	return var_12_1
end

function var_0_8.NearestUnitByType(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = 999
	local var_13_1

	for iter_13_0, iter_13_1 in ipairs(arg_13_0._unitList) do
		local var_13_2 = iter_13_1:GetTemplate().type

		if table.contains(arg_13_2, var_13_2) then
			local var_13_3 = iter_13_1:GetPosition()
			local var_13_4 = Vector3.BattleDistance(var_13_3, arg_13_1)

			if var_13_4 < var_13_0 then
				var_13_0 = var_13_4
				var_13_1 = iter_13_1
			end
		end
	end

	return var_13_1
end

function var_0_8.SetMotionSource(arg_14_0, arg_14_1)
	if arg_14_1 == nil then
		function arg_14_0._motionSourceFunc()
			local var_15_0 = pg.UIMgr.GetInstance()

			return var_15_0.hrz, var_15_0.vtc
		end
	else
		arg_14_0._motionSourceFunc = arg_14_1
	end
end

function var_0_8.SetSubAidData(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0._submarineVO = var_0_0.Battle.BattleSubmarineAidVO.New()

	if arg_16_2 == var_0_4.SubAidFlag.AID_EMPTY or arg_16_2 == var_0_4.SubAidFlag.OIL_EMPTY then
		arg_16_0._submarineVO:SetUseable(false)
	else
		arg_16_0._submarineVO:SetCount(arg_16_2)
		arg_16_0._submarineVO:SetTotal(arg_16_1)
		arg_16_0._submarineVO:SetUseable(true)
	end
end

function var_0_8.SetAutobotBound(arg_17_0, arg_17_1, arg_17_2, arg_17_3, arg_17_4)
	arg_17_0._upperBound = arg_17_1
	arg_17_0._lowerBound = arg_17_2
	arg_17_0._leftBound = arg_17_3
	arg_17_0._rightBound = arg_17_4
end

function var_0_8.SetTotalBound(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
	arg_18_0._totalUpperBound = arg_18_1
	arg_18_0._totalLowerBound = arg_18_2
	arg_18_0._totalLeftBound = arg_18_3
	arg_18_0._totalRightBound = arg_18_4
end

function var_0_8.SetUnitBound(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0._fleetUnitBound = var_0_0.Battle.BattleFleetBound.New(arg_19_0._IFF)

	arg_19_0._fleetUnitBound:ConfigAreaData(arg_19_1, arg_19_2)
	arg_19_0._fleetUnitBound:SwtichCommon()
end

function var_0_8.SetChapterPlayType(arg_20_0, arg_20_1)
	arg_20_0._chapterType = arg_20_1
end

function var_0_8.GetLeftBoundDistance(arg_21_0)
	if arg_21_0._chapterType and arg_21_0._chapterType == 5 then
		return math.abs(arg_21_0._motionVO:GetPos().x - arg_21_0._leftBound)
	end
end

function var_0_8.UpdateScoutUnitBound(arg_22_0)
	local var_22_0, var_22_1, var_22_2, var_22_3, var_22_4, var_22_5 = arg_22_0._fleetUnitBound:GetBound()

	for iter_22_0, iter_22_1 in ipairs(arg_22_0._scoutList) do
		iter_22_1:SetBound(var_22_0, var_22_1, var_22_2, var_22_3, var_22_4, var_22_5)
	end

	for iter_22_2, iter_22_3 in pairs(arg_22_0._freezeList) do
		if not iter_22_2:IsMainFleetUnit() then
			iter_22_2:SetBound(var_22_0, var_22_1, var_22_2, var_22_3, var_22_4, var_22_5)
		end
	end
end

function var_0_8.CalcSubmarineBaseLine(arg_23_0, arg_23_1)
	local var_23_0 = (arg_23_0._totalRightBound + arg_23_0._totalLeftBound) * 0.5

	if arg_23_0._IFF == var_0_5.FRIENDLY_CODE then
		if arg_23_1 == SYSTEM_DUEL then
			-- block empty
		else
			arg_23_0._subAttackBaseLine = var_23_0
			arg_23_0._subRetreatBaseLine = arg_23_0._leftBound - 10
		end
	elseif arg_23_0._IFF == var_0_5.FOE_CODE and arg_23_1 == SYSTEM_DUEL then
		-- block empty
	end
end

function var_0_8.SetExposeLine(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0._visionLineX = arg_24_1
	arg_24_0._exposeLineX = arg_24_2
end

function var_0_8.AppendPlayerUnit(arg_25_0, arg_25_1)
	arg_25_0._unitList[#arg_25_0._unitList + 1] = arg_25_1
	arg_25_0._maxCount = arg_25_0._maxCount + 1

	if arg_25_1:IsMainFleetUnit() then
		arg_25_0:appendMainUnit(arg_25_1)
	else
		arg_25_0:appendScoutUnit(arg_25_1)
	end

	arg_25_1:SetFleetVO(arg_25_0)
	arg_25_1:SetMotion(arg_25_0._motionVO)
	arg_25_1:RegisterEventListener(arg_25_0, var_0_1.UPDATE_HP, arg_25_0.onUnitUpdateHP)
	arg_25_1:RegisterEventListener(arg_25_0, var_0_1.UPDATE_CLOAK_STATE, arg_25_0.onUnitCloakUpdate)

	if arg_25_0._cardPuzzleComponent then
		arg_25_0._cardPuzzleComponent:AppendUnit(arg_25_1)
	end
end

function var_0_8.RemovePlayerUnit(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0._freezeList[arg_26_1] = nil

	local var_26_0 = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_0._unitList) do
		if iter_26_1 ~= arg_26_1 then
			var_26_0[#var_26_0 + 1] = iter_26_0
		else
			if not arg_26_2 then
				iter_26_1:UnregisterEventListener(arg_26_0, var_0_1.UPDATE_HP)
				iter_26_1:UnregisterEventListener(arg_26_0, var_0_1.UPDATE_CLOAK_STATE)
				iter_26_1:DeactiveCldBox()
			end

			local var_26_1 = iter_26_1:GetChargeList()

			for iter_26_2, iter_26_3 in ipairs(var_26_1) do
				if iter_26_3:IsAttacking() then
					arg_26_0._chargeWeaponVO:CancelFocus()
					arg_26_0._chargeWeaponVO:ResetFocus()
					arg_26_0:CancelChargeWeapon()
				end

				arg_26_0._chargeWeaponVO:RemoveWeapon(iter_26_3)

				if not arg_26_2 then
					iter_26_3:Clear()
				end
			end

			arg_26_0._fleetAntiAir:RemoveCrewUnit(arg_26_1)
			arg_26_0._fleetRangeAntiAir:RemoveCrewUnit(arg_26_1)
			arg_26_0._fleetStaticSonar:RemoveCrewUnit(arg_26_1)

			local var_26_2 = iter_26_1:GetTorpedoList()

			for iter_26_4, iter_26_5 in ipairs(var_26_2) do
				arg_26_0:RemoveManunalTorpedo(iter_26_5, arg_26_2)
			end

			local var_26_3 = iter_26_1:GetAirAssistList()

			if var_26_3 then
				for iter_26_6, iter_26_7 in ipairs(var_26_3) do
					arg_26_0._airAssistVO:RemoveWeapon(iter_26_7)
				end
			end
		end
	end

	for iter_26_8, iter_26_9 in ipairs(arg_26_0._scoutList) do
		if iter_26_9 == arg_26_1 then
			if #arg_26_0._scoutList == 1 then
				arg_26_0:CancelChargeWeapon()
			end

			table.remove(arg_26_0._scoutList, iter_26_8)

			break
		end
	end

	local function var_26_4(arg_27_0)
		for iter_27_0, iter_27_1 in ipairs(arg_27_0) do
			if iter_27_1 == arg_26_1 then
				table.remove(arg_27_0, iter_27_0)

				break
			end
		end
	end

	var_26_4(arg_26_0._mainList)
	var_26_4(arg_26_0._cloakList)
	var_26_4(arg_26_0._subList)
	var_26_4(arg_26_0._manualSubList)

	if not arg_26_0._manualSubUnit then
		arg_26_0:refreshFleetFormation(var_26_0)
	end
end

function var_0_8.OverrideJoyStickAutoBot(arg_28_0, arg_28_1)
	arg_28_0._autoBotAIID = arg_28_1

	local var_28_0 = var_0_0.Event.New(var_0_0.Battle.BattleEvent.OVERRIDE_AUTO_BOT)

	arg_28_0:DispatchEvent(var_28_0)
end

function var_0_8.SnapShot(arg_29_0)
	arg_29_0._totalDMGRatio = var_0_3.GetFleetTotalHP(arg_29_0)
	arg_29_0._currentDMGRatio = arg_29_0._totalDMGRatio
end

function var_0_8.GetIFF(arg_30_0)
	return arg_30_0._IFF
end

function var_0_8.GetMaxCount(arg_31_0)
	return arg_31_0._maxCount
end

function var_0_8.GetFlagShip(arg_32_0)
	return arg_32_0._flagShip
end

function var_0_8.GetLeaderShip(arg_33_0)
	return arg_33_0._scoutList[1]
end

function var_0_8.GetUnitList(arg_34_0)
	return arg_34_0._unitList
end

function var_0_8.GetFreezeUnitList(arg_35_0)
	return arg_35_0._freezeList
end

function var_0_8.GetMainList(arg_36_0)
	return arg_36_0._mainList
end

function var_0_8.GetScoutList(arg_37_0)
	return arg_37_0._scoutList
end

function var_0_8.GetFreezeShipByID(arg_38_0, arg_38_1)
	for iter_38_0, iter_38_1 in pairs(arg_38_0._freezeList) do
		if arg_38_1 == iter_38_0:GetAttrByName("id") then
			return iter_38_0
		end
	end
end

function var_0_8.GetShipByID(arg_39_0, arg_39_1)
	for iter_39_0, iter_39_1 in ipairs(arg_39_0._unitList) do
		if arg_39_1 == iter_39_1:GetAttrByName("id") then
			return iter_39_1
		end
	end
end

function var_0_8.GetCloakList(arg_40_0)
	return arg_40_0._cloakList
end

function var_0_8.GetSubBench(arg_41_0)
	return arg_41_0._manualSubBench
end

function var_0_8.GetUnitBound(arg_42_0)
	return arg_42_0._fleetUnitBound
end

function var_0_8.GetMotion(arg_43_0)
	return arg_43_0._motionVO
end

function var_0_8.GetMotionReferenceUnit(arg_44_0)
	return arg_44_0._motionReferenceUnit
end

function var_0_8.GetAutoBotAIID(arg_45_0)
	return arg_45_0._autoBotAIID
end

function var_0_8.GetChargeWeaponVO(arg_46_0)
	return arg_46_0._chargeWeaponVO
end

function var_0_8.GetTorpedoWeaponVO(arg_47_0)
	return arg_47_0._torpedoWeaponVO
end

function var_0_8.GetAirAssistVO(arg_48_0)
	return arg_48_0._airAssistVO
end

function var_0_8.GetSubAidVO(arg_49_0)
	return arg_49_0._submarineVO
end

function var_0_8.GetSubFreeDiveVO(arg_50_0)
	return arg_50_0._submarineDiveVO
end

function var_0_8.GetSubFreeFloatVO(arg_51_0)
	return arg_51_0._submarineFloatVO
end

function var_0_8.GetSubBoostVO(arg_52_0)
	return arg_52_0._submarineBoostVO
end

function var_0_8.GetSubSpecialVO(arg_53_0)
	return arg_53_0._submarineSpecialVO
end

function var_0_8.GetSubShiftVO(arg_54_0)
	return arg_54_0._submarineShiftVO
end

function var_0_8.GetFleetAntiAirWeapon(arg_55_0)
	return arg_55_0._fleetAntiAir
end

function var_0_8.GetFleetRangeAntiAirWeapon(arg_56_0)
	return arg_56_0._fleetRangeAntiAir
end

function var_0_8.GetFleetVelocity(arg_57_0)
	return var_0_3.GetFleetVelocity(arg_57_0._scoutList)
end

function var_0_8.GetFleetBound(arg_58_0)
	return arg_58_0._upperBound, arg_58_0._lowerBound, arg_58_0._leftBound, arg_58_0._rightBound
end

function var_0_8.GetFleetUnitBound(arg_59_0)
	return arg_59_0._totalUpperBound, arg_59_0._totalLowerBound
end

function var_0_8.GetFleetExposeLine(arg_60_0)
	return arg_60_0._exposeLineX
end

function var_0_8.GetFleetVisionLine(arg_61_0)
	return arg_61_0._visionLineX
end

function var_0_8.GetLeaderPersonality(arg_62_0)
	return arg_62_0._motionReferenceUnit:GetAutoPilotPreference()
end

function var_0_8.GetDamageRatioResult(arg_63_0)
	return string.format("%0.2f", arg_63_0._currentDMGRatio / arg_63_0._totalDMGRatio * 100), arg_63_0._totalDMGRatio
end

function var_0_8.GetDamageRatio(arg_64_0)
	return arg_64_0._currentDMGRatio / arg_64_0._totalDMGRatio
end

function var_0_8.GetSubmarineBaseLine(arg_65_0)
	return arg_65_0._fixedSubRefLine or arg_65_0._subAttackBaseLine, arg_65_0._subRetreatBaseLine
end

function var_0_8.GetFleetSonar(arg_66_0)
	return arg_66_0._fleetStaticSonar
end

function var_0_8.Dispose(arg_67_0)
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_67_0)
	var_0_0.EventListener.DetachEventListener(arg_67_0)

	arg_67_0._leaderUnit = nil

	arg_67_0._fleetAntiAir:Dispose()
	arg_67_0._fleetRangeAntiAir:Dispose()
	arg_67_0._fleetStaticSonar:Dispose()

	arg_67_0._fleetStaticSonar = nil
	arg_67_0._buffList = nil
	arg_67_0._indieSonarList = nil
	arg_67_0._scoutAimBias = nil

	arg_67_0._fleetAttr:Dispose()

	arg_67_0._fleetAttr = nil
	arg_67_0._freezeList = nil
end

function var_0_8.refreshFleetFormation(arg_68_0, arg_68_1)
	local var_68_0 = var_0_7.GetFormationTmpDataFromID(var_0_5.FORMATION_ID).pos_offset

	arg_68_0._unitList = var_0_7.SortFleetList(arg_68_1, arg_68_0._unitList)

	local var_68_1 = var_0_5.BornOffset

	if not arg_68_0._mainUnitFree then
		for iter_68_0, iter_68_1 in ipairs(arg_68_0._unitList) do
			if not table.contains(arg_68_0._subList, iter_68_1) then
				local var_68_2 = var_68_0[iter_68_0] or var_68_0[#var_68_0]

				iter_68_1:UpdateFormationOffset(Vector3(var_68_2.x, var_68_2.y, var_68_2.z) + var_68_1 * (iter_68_0 - 1))
			end
		end
	end

	if #arg_68_0._scoutList > 0 then
		arg_68_0._motionReferenceUnit = arg_68_0._scoutList[1]
		arg_68_0._leaderUnit = arg_68_0._scoutList[1]

		arg_68_0._leaderUnit:LeaderSetting()
		arg_68_0._fleetAntiAir:SwitchHost(arg_68_0._motionReferenceUnit)
		arg_68_0._fleetStaticSonar:SwitchHost(arg_68_0._motionReferenceUnit)

		for iter_68_2, iter_68_3 in pairs(arg_68_0._indieSonarList) do
			iter_68_2:SwitchHost(arg_68_0._motionReferenceUnit)
		end

		arg_68_0._motionVO:UpdatePos(arg_68_0._motionReferenceUnit)
	elseif arg_68_0._fleetAntiAir:GetCurrentState() ~= arg_68_0._fleetAntiAir.STATE_DISABLE then
		local var_68_3 = arg_68_0._fleetAntiAir:GetCrewUnitList()

		for iter_68_4, iter_68_5 in pairs(var_68_3) do
			arg_68_0._motionReferenceUnit = iter_68_4

			arg_68_0._fleetAntiAir:SwitchHost(iter_68_4)

			break
		end
	else
		arg_68_0._motionReferenceUnit = arg_68_0._mainList[1]
		arg_68_0._leaderUnit = nil
	end

	if #arg_68_0:GetUnitList() == 0 then
		return
	end

	local var_68_4 = var_0_0.Event.New(var_0_0.Battle.BattleEvent.REFRESH_FLEET_FORMATION)

	arg_68_0:DispatchEvent(var_68_4)
end

function var_0_8.init(arg_69_0)
	arg_69_0._chargeWeaponVO = var_0_0.Battle.BattleChargeWeaponVO.New()
	arg_69_0._torpedoWeaponVO = var_0_0.Battle.BattleTorpedoWeaponVO.New()
	arg_69_0._airAssistVO = var_0_0.Battle.BattleAllInStrikeVO.New()
	arg_69_0._submarineDiveVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.DIVE_CD)
	arg_69_0._submarineFloatVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.FLOAT_CD)
	arg_69_0._submarineVOList = {
		arg_69_0._submarineDiveVO,
		arg_69_0._submarineFloatVO
	}
	arg_69_0._submarineBoostVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.BOOST_CD)
	arg_69_0._submarineShiftVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.SHIFT_CD)
	arg_69_0._submarineSpecialVO = var_0_0.Battle.BattleSubmarineAidVO.New()

	arg_69_0._submarineSpecialVO:SetCount(1)
	arg_69_0._submarineSpecialVO:SetTotal(1)

	arg_69_0._fleetAntiAir = var_0_0.Battle.BattleFleetAntiAirUnit.New()
	arg_69_0._fleetRangeAntiAir = var_0_0.Battle.BattleFleetRangeAntiAirUnit.New()
	arg_69_0._motionVO = var_0_0.Battle.BattleFleetMotionVO.New()
	arg_69_0._fleetStaticSonar = var_0_0.Battle.BattleFleetStaticSonar.New(arg_69_0)
	arg_69_0._indieSonarList = {}
	arg_69_0._scoutList = {}
	arg_69_0._mainList = {}
	arg_69_0._subList = {}
	arg_69_0._supportList = {}
	arg_69_0._cloakList = {}
	arg_69_0._manualSubList = {}
	arg_69_0._manualSubBench = {}
	arg_69_0._unitList = {}
	arg_69_0._maxCount = 0
	arg_69_0._freezeList = {}
	arg_69_0._blockCast = 0
	arg_69_0._buffList = {}

	arg_69_0:AttachFleetAttr()
	arg_69_0:SetMotionSource()
end

function var_0_8.appendScoutUnit(arg_70_0, arg_70_1)
	arg_70_0._scoutList[#arg_70_0._scoutList + 1] = arg_70_1

	local var_70_0 = arg_70_1:GetTorpedoList()

	for iter_70_0, iter_70_1 in ipairs(var_70_0) do
		arg_70_0._torpedoWeaponVO:AppendWeapon(iter_70_1)
	end

	if #arg_70_1:GetHiveList() > 0 then
		local var_70_1 = var_0_7.CreateAllInStrike(arg_70_1)

		for iter_70_2, iter_70_3 in ipairs(var_70_1) do
			arg_70_0._airAssistVO:AppendWeapon(iter_70_3)
		end

		arg_70_1:SetAirAssistList(var_70_1)
	end

	arg_70_0._fleetAntiAir:AppendCrewUnit(arg_70_1)
	arg_70_0._fleetStaticSonar:AppendCrewUnit(arg_70_1)

	local var_70_2 = 1
	local var_70_3 = #arg_70_0._unitList
	local var_70_4 = {}

	while var_70_2 < var_70_3 do
		table.insert(var_70_4, var_70_2)

		var_70_2 = var_70_2 + 1
	end

	table.insert(var_70_4, #arg_70_0._scoutList, var_70_2)
	arg_70_0:refreshFleetFormation(var_70_4)
end

function var_0_8.appendMainUnit(arg_71_0, arg_71_1)
	if #arg_71_0._mainList == 0 then
		arg_71_0._flagShip = arg_71_1
	end

	arg_71_0._mainList[#arg_71_0._mainList + 1] = arg_71_1

	arg_71_1:SetMainUnitIndex(#arg_71_0._mainList)

	if ShipType.CloakShipType(arg_71_1:GetTemplate().type) then
		arg_71_0:AttachCloak(arg_71_1)
	end

	local var_71_0 = arg_71_1:GetChargeList()

	for iter_71_0, iter_71_1 in ipairs(var_71_0) do
		arg_71_0._chargeWeaponVO:AppendWeapon(iter_71_1)
	end

	local var_71_1 = arg_71_1:GetTorpedoList()

	for iter_71_2, iter_71_3 in ipairs(var_71_1) do
		arg_71_0._torpedoWeaponVO:AppendWeapon(iter_71_3)
	end

	if #arg_71_1:GetHiveList() > 0 then
		local var_71_2 = var_0_7.CreateAllInStrike(arg_71_1)

		for iter_71_4, iter_71_5 in ipairs(var_71_2) do
			arg_71_0._airAssistVO:AppendWeapon(iter_71_5)
		end

		arg_71_1:SetAirAssistList(var_71_2)
	end

	arg_71_0._fleetAntiAir:AppendCrewUnit(arg_71_1)
	arg_71_0._fleetRangeAntiAir:AppendCrewUnit(arg_71_1)
	arg_71_0._fleetStaticSonar:AppendCrewUnit(arg_71_1)

	local var_71_3 = {}

	for iter_71_6, iter_71_7 in ipairs(arg_71_0._unitList) do
		table.insert(var_71_3, iter_71_6)
	end

	arg_71_0:refreshFleetFormation(var_71_3)
end

function var_0_8.appendSubUnit(arg_72_0, arg_72_1)
	arg_72_0._subList[#arg_72_0._subList + 1] = arg_72_1

	arg_72_1:SetMainUnitIndex(#arg_72_0._subList)
end

function var_0_8.FleetWarcry(arg_73_0)
	local var_73_0
	local var_73_1 = math.random(0, 1)
	local var_73_2 = arg_73_0:GetScoutList()[1]
	local var_73_3 = arg_73_0:GetMainList()[1]

	if var_73_3 == nil or var_73_1 == 0 then
		var_73_0 = var_73_2
	elseif var_73_1 == 1 then
		var_73_0 = var_73_3
	end

	local var_73_4 = "battle"
	local var_73_5 = var_73_0:GetIntimacy()
	local var_73_6 = var_0_0.Battle.BattleDataFunction.GetWords(var_73_0:GetSkinID(), var_73_4, var_73_5)

	var_73_0:DispatchVoice(var_73_4)
	var_73_0:DispatchChat(var_73_6, 2.5, var_73_4)
end

function var_0_8.FleetUnitSpwanFinish(arg_74_0)
	local var_74_0 = 0

	for iter_74_0, iter_74_1 in ipairs(arg_74_0._unitList) do
		var_74_0 = var_74_0 + iter_74_1:GetGearScore()
	end

	for iter_74_2, iter_74_3 in ipairs(arg_74_0._unitList) do
		var_0_6.SetCurrent(iter_74_3, "fleetGS", var_74_0)
	end
end

function var_0_8.SubWarcry(arg_75_0)
	local var_75_0 = arg_75_0:GetSubList()[1]
	local var_75_1 = "battle"
	local var_75_2 = var_75_0:GetIntimacy()
	local var_75_3 = var_0_0.Battle.BattleDataFunction.GetWords(var_75_0:GetSkinID(), var_75_1, var_75_2)

	var_75_0:DispatchVoice(var_75_1)
	var_75_0:DispatchChat(var_75_3, 2.5, var_75_1)
end

function var_0_8.SetWeaponBlock(arg_76_0, arg_76_1)
	arg_76_0._blockCast = arg_76_0._blockCast + arg_76_1
end

function var_0_8.GetWeaponBlock(arg_77_0)
	return arg_77_0._blockCast > 0
end

function var_0_8.CastChargeWeapon(arg_78_0)
	if arg_78_0:GetWeaponBlock() then
		return
	end

	local var_78_0 = arg_78_0._chargeWeaponVO:GetCurrentWeapon()

	if var_78_0 ~= nil and var_78_0:GetCurrentState() == var_78_0.STATE_READY then
		var_78_0:Charge()

		local var_78_1 = {}
		local var_78_2 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.POINT_HIT_CHARGE, var_78_1)

		arg_78_0:DispatchEvent(var_78_2)
	end
end

function var_0_8.CancelChargeWeapon(arg_79_0)
	local var_79_0 = arg_79_0._chargeWeaponVO:GetCurrentWeapon()

	if var_79_0 ~= nil and var_79_0:GetCurrentState() == var_79_0.STATE_PRECAST then
		local var_79_1 = {}
		local var_79_2 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.POINT_HIT_CANCEL, var_79_1)

		arg_79_0:DispatchEvent(var_79_2)
		var_79_0:CancelCharge()
	end
end

function var_0_8.UnleashChrageWeapon(arg_80_0)
	if arg_80_0:GetWeaponBlock() then
		arg_80_0:CancelChargeWeapon()

		return
	end

	local var_80_0 = arg_80_0._chargeWeaponVO:GetCurrentWeapon()

	if var_80_0 ~= nil and var_80_0:GetCurrentState() == var_80_0.STATE_PRECAST then
		if var_80_0:IsStrikeMode() then
			local var_80_1 = arg_80_0._motionVO:GetPos().x + var_0_5.ChargeWeaponConfig.SIGHT_C
			local var_80_2 = math.min(var_80_1, arg_80_0._totalRightBound)

			arg_80_0:fireChargeWeapon(var_80_0, true, Vector3.New(var_80_2, 0, arg_80_0._motionVO:GetPos().z))
		else
			var_80_0:CancelCharge()
		end

		local var_80_3 = {}
		local var_80_4 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.POINT_HIT_CANCEL, var_80_3)

		arg_80_0:DispatchEvent(var_80_4)
	end
end

function var_0_8.QuickTagChrageWeapon(arg_81_0, arg_81_1)
	if arg_81_0:GetWeaponBlock() then
		return
	end

	local var_81_0
	local var_81_1 = arg_81_0._chargeWeaponVO:GetCurrentWeapon()

	if var_81_1 ~= nil and var_81_1:GetCurrentState() == var_81_1.STATE_READY then
		var_81_1:QuickTag()

		if #var_81_1:GetLockList() <= 0 then
			var_81_1:CancelQuickTag()
		else
			var_81_0 = arg_81_0:fireChargeWeapon(var_81_1, arg_81_1)
		end
	end

	return var_81_0
end

function var_0_8.fireChargeWeapon(arg_82_0, arg_82_1, arg_82_2, arg_82_3)
	local var_82_0 = arg_82_1:GetHost()

	local function var_82_1()
		local function var_83_0()
			arg_82_1:Fire(arg_82_3)
		end

		arg_82_1:DispatchBlink(var_83_0)
	end

	if arg_82_1:GetType() == var_0_4.EquipmentType.POINT_AIR_STRIKE then
		arg_82_1:Fire(arg_82_3)
	elseif arg_82_2 then
		if arg_82_0._IFF == var_0_5.FRIENDLY_CODE then
			arg_82_0._chargeWeaponVO:PlayCutIn(var_82_0, 1 / var_0_5.FOCUS_MAP_RATE)
		end

		arg_82_0._chargeWeaponVO:PlayFocus(var_82_0, var_82_1)
	else
		if arg_82_0._IFF == var_0_5.FRIENDLY_CODE then
			arg_82_0._chargeWeaponVO:PlayCutIn(var_82_0, 1)
		end

		var_82_1()
	end
end

function var_0_8.UnleashAllInStrike(arg_85_0)
	if arg_85_0:GetWeaponBlock() then
		return
	end

	local var_85_0
	local var_85_1 = arg_85_0._airAssistVO:GetCurrentWeapon()

	if var_85_1 and var_85_1:GetCurrentState() == var_85_1.STATE_READY then
		local var_85_2 = var_85_1:GetHost()

		if arg_85_0._IFF == var_0_5.FRIENDLY_CODE and var_85_2:IsMainFleetUnit() then
			arg_85_0._airAssistVO:PlayCutIn(var_85_2, 1)
		end

		var_85_1:CLSBullet()
		var_85_1:DispatchBlink()

		var_85_0 = var_85_1:Fire()
	end

	return var_85_0
end

function var_0_8.CastTorpedo(arg_86_0)
	if arg_86_0:GetWeaponBlock() then
		return
	end

	local var_86_0 = arg_86_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_86_0 ~= nil and var_86_0:GetCurrentState() == var_86_0.STATE_READY and var_86_0:Prepar() then
		arg_86_0:FleetBuffTrigger(var_0_4.BuffEffectType.ON_TORPEDO_BUTTON_PUSH)
	end
end

function var_0_8.CancelTorpedo(arg_87_0)
	local var_87_0 = arg_87_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_87_0 ~= nil and var_87_0:GetCurrentState() == var_87_0.STATE_PRECAST then
		var_87_0:Cancel()
	end
end

function var_0_8.UnleashTorpedo(arg_88_0)
	if arg_88_0:GetWeaponBlock() then
		arg_88_0:CancelTorpedo()

		return
	end

	local var_88_0 = arg_88_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_88_0 ~= nil and var_88_0:GetCurrentState() == var_88_0.STATE_PRECAST then
		var_88_0:Fire()
	end
end

function var_0_8.QuickCastTorpedo(arg_89_0)
	if arg_89_0:GetWeaponBlock() then
		return
	end

	local var_89_0
	local var_89_1 = arg_89_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_89_1 ~= nil and var_89_1:GetCurrentState() == var_89_1.STATE_READY then
		var_89_0 = var_89_1:Fire(true)
	end

	return var_89_0
end

function var_0_8.RemoveManunalTorpedo(arg_90_0, arg_90_1, arg_90_2)
	if arg_90_1:IsAttacking() then
		arg_90_0:CancelTorpedo()
	end

	arg_90_0._torpedoWeaponVO:RemoveWeapon(arg_90_1)

	if not arg_90_2 then
		arg_90_1:Clear()
	end
end

function var_0_8.CoupleEncourage(arg_91_0)
	local var_91_0 = {}
	local var_91_1 = {}

	for iter_91_0, iter_91_1 in ipairs(arg_91_0._unitList) do
		local var_91_2 = iter_91_1:GetIntimacy()
		local var_91_3 = var_0_7.GetWords(iter_91_1:GetSkinID(), "couple_encourage", var_91_2)

		if #var_91_3 > 0 then
			var_91_0[iter_91_1] = var_91_3
		end
	end

	local var_91_4 = var_0_4.CPChatType
	local var_91_5 = var_0_4.CPChatTargetFunc

	local function var_91_6(arg_92_0, arg_92_1)
		local var_92_0 = {}

		if arg_92_0 == var_91_4.GROUP_ID then
			var_92_0.groupIDList = arg_92_1
		elseif arg_92_0 == var_91_4.SHIP_TYPE then
			var_92_0.ship_type_list = arg_92_1
		elseif arg_92_0 == var_91_4.RARE then
			var_92_0.rarity = arg_92_1[1]
		elseif arg_92_0 == var_91_4.NATIONALITY then
			var_92_0.nationality = arg_92_1[1]
		elseif arg_92_0 == var_91_4.ILLUSTRATOR then
			var_92_0.illustrator = arg_92_1[1]
		elseif arg_92_0 == var_91_4.TEAM then
			var_92_0.teamIndex = arg_92_1[1]
		end

		return var_92_0
	end

	for iter_91_2, iter_91_3 in pairs(var_91_0) do
		for iter_91_4, iter_91_5 in ipairs(iter_91_3) do
			local var_91_7 = iter_91_5[1]
			local var_91_8 = iter_91_5[2]
			local var_91_9 = iter_91_5[4] or var_91_4.GROUP_ID
			local var_91_10 = var_0_0.Battle.BattleTargetChoise.TargetAllHelp(iter_91_2)

			if type(var_91_9) == "table" then
				for iter_91_6, iter_91_7 in ipairs(var_91_9) do
					local var_91_11 = var_91_6(iter_91_7, var_91_7[iter_91_6])

					var_91_10 = var_0_0.Battle.BattleTargetChoise[var_91_5[iter_91_7]](iter_91_2, var_91_11, var_91_10)
				end
			elseif type(var_91_9) == "number" then
				local var_91_12 = var_91_6(var_91_9, var_91_7)

				var_91_10 = var_0_0.Battle.BattleTargetChoise[var_91_5[var_91_9]](iter_91_2, var_91_12, var_91_10)
			end

			if var_91_8 <= #var_91_10 then
				local var_91_13 = {
					cp = iter_91_2,
					content = iter_91_5[3],
					linkIndex = iter_91_4
				}

				var_91_1[#var_91_1 + 1] = var_91_13
			end
		end
	end

	if #var_91_1 > 0 then
		local var_91_14 = var_91_1[math.random(#var_91_1)]
		local var_91_15 = "link" .. var_91_14.linkIndex

		var_91_14.cp:DispatchVoice(var_91_15)
		var_91_14.cp:DispatchChat(var_91_14.content, 3, var_91_15)
	end
end

function var_0_8.onUnitUpdateHP(arg_93_0, arg_93_1)
	local var_93_0 = arg_93_1.Dispatcher
	local var_93_1 = arg_93_1.Data.dHP

	for iter_93_0, iter_93_1 in ipairs(arg_93_0._unitList) do
		iter_93_1:TriggerBuff(var_0_4.BuffEffectType.ON_FRIENDLY_HP_RATIO_UPDATE, {
			unit = var_93_0,
			dHP = var_93_1
		})

		if iter_93_1 ~= var_93_0 then
			iter_93_1:TriggerBuff(var_0_4.BuffEffectType.ON_TEAMMATE_HP_RATIO_UPDATE, {
				unit = var_93_0,
				dHP = var_93_1
			})
		end
	end
end

function var_0_8.onUnitCloakUpdate(arg_94_0, arg_94_1)
	local var_94_0 = arg_94_1.Dispatcher
	local var_94_1 = var_0_6.GetCurrent(var_94_0, "isCloak")

	for iter_94_0, iter_94_1 in ipairs(arg_94_0._unitList) do
		iter_94_1:TriggerBuff(var_0_4.BuffEffectType.ON_CLOAK_UPDATE, {
			cloakState = var_94_1
		})

		if iter_94_1 ~= var_94_0 then
			iter_94_1:TriggerBuff(var_0_4.BuffEffectType.ON_TEAMMATE_CLOAK_UPDATE, {
				cloakState = var_94_1
			})
		end
	end
end

function var_0_8.SetSubUnitData(arg_95_0, arg_95_1)
	arg_95_0._subUntiDataList = arg_95_1
end

function var_0_8.GetSubUnitData(arg_96_0)
	return arg_96_0._subUntiDataList
end

function var_0_8.AddSubMarine(arg_97_0, arg_97_1)
	arg_97_1:InitOxygen()

	local var_97_0 = arg_97_1:GetTemplate()
	local var_97_1 = var_0_0.Battle.BattleUnitPhaseSwitcher.New(arg_97_1)

	local function var_97_2()
		return arg_97_1:GetRaidDuration()
	end

	local var_97_3 = arg_97_0._fixedSubRefLine or arg_97_0._subAttackBaseLine

	var_97_1:SetTemplateData(var_0_7.GeneratePlayerSubmarinPhase(var_97_3, arg_97_0._subRetreatBaseLine, arg_97_1:GetAttrByName("raidDist"), var_97_2, arg_97_1:GetAttrByName("oxyAtkDuration")))

	arg_97_0._unitList[#arg_97_0._unitList + 1] = arg_97_1
	arg_97_0._subList[#arg_97_0._subList + 1] = arg_97_1

	arg_97_1:SetFleetVO(arg_97_0)
	arg_97_1:RegisterEventListener(arg_97_0, var_0_1.UPDATE_HP, arg_97_0.onUnitUpdateHP)
	arg_97_1:RegisterEventListener(arg_97_0, var_0_1.UPDATE_CLOAK_STATE, arg_97_0.onUnitCloakUpdate)
end

function var_0_8.AddManualSubmarine(arg_99_0, arg_99_1)
	arg_99_0._unitList[#arg_99_0._unitList + 1] = arg_99_1
	arg_99_0._manualSubList[#arg_99_0._manualSubList + 1] = arg_99_1
	arg_99_0._manualSubBench[#arg_99_0._manualSubBench + 1] = arg_99_1
	arg_99_0._maxCount = arg_99_0._maxCount + 1

	arg_99_1:InitOxygen()
	arg_99_1:SetFleetVO(arg_99_0)
	arg_99_1:SetMotion(arg_99_0._motionVO)
	arg_99_1:RegisterEventListener(arg_99_0, var_0_1.UPDATE_HP, arg_99_0.onUnitUpdateHP)
	arg_99_1:RegisterEventListener(arg_99_0, var_0_1.UPDATE_CLOAK_STATE, arg_99_0.onUnitCloakUpdate)
end

function var_0_8.GetSubList(arg_100_0)
	return arg_100_0._subList
end

function var_0_8.ShiftManualSub(arg_101_0)
	local var_101_0

	if arg_101_0._manualSubUnit then
		local var_101_1 = arg_101_0._manualSubUnit:GetTorpedoList()

		for iter_101_0, iter_101_1 in ipairs(var_101_1) do
			if iter_101_1:IsAttacking() then
				arg_101_0:CancelTorpedo()
			end

			arg_101_0._torpedoWeaponVO:RemoveWeapon(iter_101_1)
		end

		if arg_101_0._manualSubUnit:IsAlive() then
			table.insert(arg_101_0._manualSubBench, arg_101_0._manualSubUnit)
		end

		var_101_0 = arg_101_0._motionVO:GetPos():Clone()
	else
		var_101_0 = arg_101_0._manualSubList[1]:GetPosition():Clone()
	end

	arg_101_0._manualSubUnit = table.remove(arg_101_0._manualSubBench, 1)
	arg_101_0._scoutList[1] = arg_101_0._manualSubUnit

	local var_101_2 = {}

	for iter_101_2, iter_101_3 in ipairs(arg_101_0._manualSubBench) do
		for iter_101_4, iter_101_5 in ipairs(arg_101_0._unitList) do
			if iter_101_5 == iter_101_3 then
				table.insert(var_101_2, iter_101_4)

				break
			end
		end
	end

	for iter_101_6, iter_101_7 in ipairs(arg_101_0._unitList) do
		if iter_101_7 == arg_101_0._manualSubUnit then
			table.insert(var_101_2, 1, iter_101_6)

			break
		end
	end

	arg_101_0:refreshFleetFormation(var_101_2)
	arg_101_0._manualSubUnit:SetMainUnitStatic(false)
	arg_101_0._manualSubUnit:SetPosition(var_101_0)
	arg_101_0:UpdateMotion()
	arg_101_0._submarineSpecialVO:SetUseable(false)

	local var_101_3 = arg_101_0._manualSubUnit:GetBuffList()

	for iter_101_8, iter_101_9 in pairs(var_101_3) do
		if iter_101_9:IsSubmarineSpecial() then
			arg_101_0._submarineSpecialVO:SetCount(1)
			arg_101_0._submarineSpecialVO:SetUseable(true)

			break
		end
	end

	arg_101_0:ChangeSubmarineState(var_0_0.Battle.OxyState.STATE_FREE_DIVE)
	arg_101_0._torpedoWeaponVO:Reset()

	local var_101_4 = arg_101_0._manualSubUnit:GetTorpedoList()

	for iter_101_10, iter_101_11 in ipairs(var_101_4) do
		if iter_101_11:GetCurrentState() ~= iter_101_11.STATE_OVER_HEAT then
			arg_101_0._torpedoWeaponVO:AppendWeapon(iter_101_11)
		end
	end

	for iter_101_12, iter_101_13 in ipairs(var_101_4) do
		if iter_101_13:GetCurrentState() == iter_101_13.STATE_OVER_HEAT then
			arg_101_0._torpedoWeaponVO:AppendWeapon(iter_101_13)
		end
	end

	if var_0_6.GetCurrent(arg_101_0._manualSubUnit, "oxyMax") <= 0 then
		arg_101_0._submarineDiveVO:SetActive(false)
		arg_101_0._submarineFloatVO:SetActive(false)
	else
		arg_101_0._submarineDiveVO:SetActive(true)
		arg_101_0._submarineFloatVO:SetActive(true)
	end

	for iter_101_14, iter_101_15 in ipairs(arg_101_0._manualSubBench) do
		iter_101_15:SetPosition(var_0_5.SUB_BENCH_POS[iter_101_14])
		iter_101_15:SetMainUnitStatic(true)
		iter_101_15:ChangeOxygenState(var_0_0.Battle.OxyState.STATE_FREE_BENCH)
	end

	arg_101_0._submarineShiftVO:ResetCurrent()

	if #arg_101_0._manualSubBench == 0 then
		arg_101_0._submarineShiftVO:SetActive(false)
	end
end

function var_0_8.ChangeSubmarineState(arg_102_0, arg_102_1, arg_102_2)
	if not arg_102_0._manualSubUnit then
		return
	end

	arg_102_0._manualSubUnit:ChangeOxygenState(arg_102_1)

	if arg_102_2 then
		for iter_102_0, iter_102_1 in ipairs(arg_102_0._submarineVOList) do
			iter_102_1:ResetCurrent()
		end

		local var_102_0 = arg_102_0._submarineShiftVO:GetMax() - arg_102_0._submarineShiftVO:GetCurrent()

		if arg_102_0._submarineShiftVO:IsOverLoad() and var_102_0 > var_0_5.SR_CONFIG.DIVE_CD then
			-- block empty
		else
			arg_102_0._submarineShiftVO:SetMax(var_0_5.SR_CONFIG.DIVE_CD)
			arg_102_0._submarineShiftVO:ResetCurrent()
		end
	end

	arg_102_0:DispatchEvent(var_0_0.Event.New(var_0_2.MANUAL_SUBMARINE_SHIFT, {
		state = arg_102_1
	}))
end

function var_0_8.SubmarinBoost(arg_103_0)
	arg_103_0._manualSubUnit:Boost(Vector3.right, var_0_5.SR_CONFIG.BOOST_SPEED, var_0_5.SR_CONFIG.BOOST_DECAY, var_0_5.SR_CONFIG.BOOST_DURATION, var_0_5.SR_CONFIG.BOOST_DECAY_STAMP)
	arg_103_0._submarineBoostVO:ResetCurrent()
end

function var_0_8.UnleashSubmarineSpecial(arg_104_0)
	if arg_104_0:GetWeaponBlock() then
		return
	end

	arg_104_0._submarineSpecialVO:Cast()
	arg_104_0._manualSubUnit:TriggerBuff(var_0_4.BuffEffectType.ON_SUBMARINE_FREE_SPECIAL)
end

function var_0_8.FixSubRefLine(arg_105_0, arg_105_1)
	arg_105_0._fixedSubRefLine = arg_105_1
end

function var_0_8.AppendIndieSonar(arg_106_0, arg_106_1, arg_106_2)
	local var_106_0 = var_0_0.Battle.BattleIndieSonar.New(arg_106_0, arg_106_1, arg_106_2)

	var_106_0:SwitchHost(arg_106_0._motionReferenceUnit)

	arg_106_0._indieSonarList[var_106_0] = true

	var_106_0:Detect()
end

function var_0_8.RemoveIndieSonar(arg_107_0, arg_107_1)
	for iter_107_0, iter_107_1 in pairs(arg_107_0._indieSonarList) do
		if arg_107_1 == iter_107_0 then
			arg_107_0._indieSonarList[iter_107_0] = nil

			break
		end
	end
end

function var_0_8.AttachFleetBuff(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_1:GetID()
	local var_108_1 = arg_108_0:GetFleetBuff(var_108_0)

	if var_108_1 then
		var_108_1:Stack(arg_108_0)
	else
		arg_108_0._buffList[var_108_0] = arg_108_1

		arg_108_1:Attach(arg_108_0)
	end
end

function var_0_8.RemoveFleetBuff(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_0:GetFleetBuff(arg_109_1)

	if var_109_0 then
		var_109_0:Remove()
	end
end

function var_0_8.GetFleetBuff(arg_110_0, arg_110_1)
	return arg_110_0._buffList[arg_110_1]
end

function var_0_8.GetFleetBuffList(arg_111_0)
	return arg_111_0._buffList
end

function var_0_8.AttachFleetAttr(arg_112_0)
	arg_112_0._fleetAttr = var_0_0.Battle.BattleFleetAttrComponent.New(arg_112_0)
end

function var_0_8.GetFleetAttr(arg_113_0)
	return arg_113_0._fleetAttr
end

function var_0_8.Jamming(arg_114_0, arg_114_1)
	if arg_114_1 then
		arg_114_0._chargeWeaponVO:StartJamming()
		arg_114_0._torpedoWeaponVO:StartJamming()
		arg_114_0._airAssistVO:StartJamming()
	else
		arg_114_0._chargeWeaponVO:JammingEliminate()
		arg_114_0._torpedoWeaponVO:JammingEliminate()
		arg_114_0._airAssistVO:JammingEliminate()
	end
end

function var_0_8.Blinding(arg_115_0, arg_115_1)
	arg_115_0:DispatchEvent(var_0_0.Event.New(var_0_2.FLEET_BLIND, {
		isBlind = arg_115_1
	}))
end

function var_0_8.UpdateHorizon(arg_116_0)
	arg_116_0:DispatchEvent(var_0_0.Event.New(var_0_2.FLEET_HORIZON_UPDATE, {}))
end

function var_0_8.AutoBotUpdated(arg_117_0, arg_117_1)
	local var_117_0 = arg_117_1 and var_0_4.BuffEffectType.ON_AUTOBOT or var_0_4.BuffEffectType.ON_MANUAL

	arg_117_0:FleetBuffTrigger(var_117_0)
end

function var_0_8.CloakFatalExpose(arg_118_0)
	for iter_118_0, iter_118_1 in ipairs(arg_118_0._cloakList) do
		iter_118_1:GetCloak():ForceToMax()
	end
end

function var_0_8.CloakInVision(arg_119_0, arg_119_1)
	for iter_119_0, iter_119_1 in ipairs(arg_119_0._cloakList) do
		iter_119_1:GetCloak():AppendExposeSpeed(arg_119_1)
	end
end

function var_0_8.CloakOutVision(arg_120_0)
	for iter_120_0, iter_120_1 in ipairs(arg_120_0._cloakList) do
		iter_120_1:GetCloak():AppendExposeSpeed(0)
	end
end

function var_0_8.AttachCloak(arg_121_0, arg_121_1)
	if not arg_121_1:GetCloak() then
		arg_121_1:InitCloak()

		arg_121_0._cloakList[#arg_121_0._cloakList + 1] = arg_121_1
	end
end

function var_0_8.AttachNightCloak(arg_122_0)
	arg_122_0._scoutAimBias = var_0_0.Battle.BattleUnitAimBiasComponent.New()

	arg_122_0._scoutAimBias:ConfigRangeFormula(var_0_3.CalculateMaxAimBiasRange, var_0_3.CalculateBiasDecay)
	arg_122_0._scoutAimBias:Active(arg_122_0._scoutAimBias.STATE_ACTIVITING)
	arg_122_0:DispatchEvent(var_0_0.Event.New(var_0_2.ADD_AIM_BIAS, {
		aimBias = arg_122_0._scoutAimBias
	}))
end

function var_0_8.GetFleetBias(arg_123_0)
	return arg_123_0._scoutAimBias
end

function var_0_8.FreezeUnit(arg_124_0, arg_124_1)
	arg_124_0:RemovePlayerUnit(arg_124_1, true)

	arg_124_0._freezeList[arg_124_1] = true
end

function var_0_8.ActiveFreezeUnit(arg_125_0, arg_125_1)
	arg_125_0._freezeList[arg_125_1] = nil
	arg_125_0._unitList[#arg_125_0._unitList + 1] = arg_125_1
	arg_125_0._maxCount = arg_125_0._maxCount + 1

	if arg_125_1:IsMainFleetUnit() then
		arg_125_0:appendFreezeMainUnit(arg_125_1)
	else
		arg_125_0:activeFreezeScoutUnit(arg_125_1)
	end

	arg_125_1:SetFleetVO(arg_125_0)
	arg_125_1:SetMotion(arg_125_0._motionVO)
	arg_125_1:RegisterEventListener(arg_125_0, var_0_1.UPDATE_HP, arg_125_0.onUnitUpdateHP)
	arg_125_1:RegisterEventListener(arg_125_0, var_0_1.UPDATE_CLOAK_STATE, arg_125_0.onUnitCloakUpdate)
end

function var_0_8.UndoFusion(arg_126_0)
	for iter_126_0, iter_126_1 in pairs(arg_126_0._freezeList) do
		arg_126_0._unitList[#arg_126_0._unitList + 1] = iter_126_0
		arg_126_0._maxCount = arg_126_0._maxCount + 1

		if iter_126_0:IsMainFleetUnit() then
			arg_126_0:appendFreezeMainUnit(iter_126_0)
		else
			arg_126_0:activeFreezeScoutUnit(iter_126_0)
		end
	end

	local var_126_0 = {}

	for iter_126_2, iter_126_3 in ipairs(arg_126_0._unitList) do
		local var_126_1 = iter_126_3:GetAttrByName("hpProvideRate")

		if var_126_1 ~= 0 then
			table.insert(var_126_0, iter_126_3)

			local var_126_2, var_126_3 = iter_126_3:GetHP()
			local var_126_4 = var_126_3 - var_126_2
			local var_126_5 = 0

			for iter_126_4, iter_126_5 in pairs(var_126_1) do
				local var_126_6 = arg_126_0:GetFreezeShipByID(iter_126_4)

				if not var_126_6 then
					arg_126_0:GetShipByID(iter_126_4)
				end

				local var_126_7 = math.floor(iter_126_5 * var_126_4)

				var_126_6:UpdateHP(var_126_7 * -1, {})
			end
		end
	end

	for iter_126_6, iter_126_7 in ipairs(var_126_0) do
		arg_126_0:RemovePlayerUnit(iter_126_7)
	end
end

function var_0_8.appendFreezeMainUnit(arg_127_0, arg_127_1)
	arg_127_0._mainList[#arg_127_0._mainList + 1] = arg_127_1

	arg_127_1:SetMainUnitIndex(#arg_127_0._mainList)

	if ShipType.CloakShipType(arg_127_1:GetTemplate().type) then
		table.insert(arg_127_0._cloakList, arg_127_1)
	end

	local var_127_0 = arg_127_1:GetChargeList()

	for iter_127_0, iter_127_1 in ipairs(var_127_0) do
		arg_127_0._chargeWeaponVO:AppendFreezeWeapon(iter_127_1)
	end

	local var_127_1 = arg_127_1:GetTorpedoList()

	for iter_127_2, iter_127_3 in ipairs(var_127_1) do
		arg_127_0._torpedoWeaponVO:AppendFreezeWeapon(iter_127_3)
	end

	if arg_127_1:GetAirAssistList() then
		local var_127_2 = arg_127_1:GetAirAssistList()

		for iter_127_4, iter_127_5 in ipairs(var_127_2) do
			arg_127_0._airAssistVO:AppendFreezeWeapon(iter_127_5)
		end
	end

	arg_127_0._fleetAntiAir:AppendCrewUnit(arg_127_1)
	arg_127_0._fleetRangeAntiAir:AppendCrewUnit(arg_127_1)
	arg_127_0._fleetStaticSonar:AppendCrewUnit(arg_127_1)

	local var_127_3 = {}

	for iter_127_6, iter_127_7 in ipairs(arg_127_0._unitList) do
		table.insert(var_127_3, iter_127_6)
	end

	arg_127_0:refreshFleetFormation(var_127_3)
end

function var_0_8.activeFreezeScoutUnit(arg_128_0, arg_128_1)
	arg_128_0._scoutList[#arg_128_0._scoutList + 1] = arg_128_1

	local var_128_0 = arg_128_1:GetTorpedoList()

	for iter_128_0, iter_128_1 in ipairs(var_128_0) do
		arg_128_0._torpedoWeaponVO:AppendFreezeWeapon(iter_128_1)
	end

	if arg_128_1:GetAirAssistList() then
		local var_128_1 = arg_128_1:GetAirAssistList()

		for iter_128_2, iter_128_3 in ipairs(var_128_1) do
			arg_128_0._airAssistVO:AppendFreezeWeapon(iter_128_3)
		end
	end

	arg_128_0._fleetAntiAir:AppendCrewUnit(arg_128_1)
	arg_128_0._fleetStaticSonar:AppendCrewUnit(arg_128_1)

	local var_128_2 = 1
	local var_128_3 = #arg_128_0._unitList
	local var_128_4 = {}

	while var_128_2 < var_128_3 do
		table.insert(var_128_4, var_128_2)

		var_128_2 = var_128_2 + 1
	end

	table.insert(var_128_4, #arg_128_0._scoutList, var_128_2)
	arg_128_0:refreshFleetFormation(var_128_4)
end

function var_0_8.AttachCardPuzzleComponent(arg_129_0)
	arg_129_0._cardPuzzleComponent = var_0_0.Battle.BattleFleetCardPuzzleComponent.New(arg_129_0)

	return arg_129_0._cardPuzzleComponent
end

function var_0_8.GetCardPuzzleComponent(arg_130_0)
	return arg_130_0._cardPuzzleComponent
end

function var_0_8.AppendSupportUnit(arg_131_0, arg_131_1)
	arg_131_0._supportList[#arg_131_0._supportList + 1] = arg_131_1
end

function var_0_8.GetSupportUnitList(arg_132_0)
	return arg_132_0._supportList
end

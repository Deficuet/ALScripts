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

function var_0_8.UpdateScoutUnitBound(arg_20_0)
	local var_20_0, var_20_1, var_20_2, var_20_3, var_20_4, var_20_5 = arg_20_0._fleetUnitBound:GetBound()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0._scoutList) do
		iter_20_1:SetBound(var_20_0, var_20_1, var_20_2, var_20_3, var_20_4, var_20_5)
	end

	for iter_20_2, iter_20_3 in pairs(arg_20_0._freezeList) do
		if not iter_20_2:IsMainFleetUnit() then
			iter_20_2:SetBound(var_20_0, var_20_1, var_20_2, var_20_3, var_20_4, var_20_5)
		end
	end
end

function var_0_8.CalcSubmarineBaseLine(arg_21_0, arg_21_1)
	local var_21_0 = (arg_21_0._totalRightBound + arg_21_0._totalLeftBound) * 0.5

	if arg_21_0._IFF == var_0_5.FRIENDLY_CODE then
		if arg_21_1 == SYSTEM_DUEL then
			-- block empty
		else
			arg_21_0._subAttackBaseLine = var_21_0
			arg_21_0._subRetreatBaseLine = arg_21_0._leftBound - 10
		end
	elseif arg_21_0._IFF == var_0_5.FOE_CODE and arg_21_1 == SYSTEM_DUEL then
		-- block empty
	end
end

function var_0_8.SetExposeLine(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0._visionLineX = arg_22_1
	arg_22_0._exposeLineX = arg_22_2
end

function var_0_8.AppendPlayerUnit(arg_23_0, arg_23_1)
	arg_23_0._unitList[#arg_23_0._unitList + 1] = arg_23_1
	arg_23_0._maxCount = arg_23_0._maxCount + 1

	if arg_23_1:IsMainFleetUnit() then
		arg_23_0:appendMainUnit(arg_23_1)
	else
		arg_23_0:appendScoutUnit(arg_23_1)
	end

	arg_23_1:SetFleetVO(arg_23_0)
	arg_23_1:SetMotion(arg_23_0._motionVO)
	arg_23_1:RegisterEventListener(arg_23_0, var_0_1.UPDATE_HP, arg_23_0.onUnitUpdateHP)
	arg_23_1:RegisterEventListener(arg_23_0, var_0_1.UPDATE_CLOAK_STATE, arg_23_0.onUnitCloakUpdate)

	if arg_23_0._cardPuzzleComponent then
		arg_23_0._cardPuzzleComponent:AppendUnit(arg_23_1)
	end
end

function var_0_8.RemovePlayerUnit(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0._freezeList[arg_24_1] = nil

	local var_24_0 = {}

	for iter_24_0, iter_24_1 in ipairs(arg_24_0._unitList) do
		if iter_24_1 ~= arg_24_1 then
			var_24_0[#var_24_0 + 1] = iter_24_0
		else
			if not arg_24_2 then
				iter_24_1:UnregisterEventListener(arg_24_0, var_0_1.UPDATE_HP)
				iter_24_1:UnregisterEventListener(arg_24_0, var_0_1.UPDATE_CLOAK_STATE)
				iter_24_1:DeactiveCldBox()
			end

			local var_24_1 = iter_24_1:GetChargeList()

			for iter_24_2, iter_24_3 in ipairs(var_24_1) do
				if iter_24_3:IsAttacking() then
					arg_24_0._chargeWeaponVO:CancelFocus()
					arg_24_0._chargeWeaponVO:ResetFocus()
					arg_24_0:CancelChargeWeapon()
				end

				arg_24_0._chargeWeaponVO:RemoveWeapon(iter_24_3)

				if not arg_24_2 then
					iter_24_3:Clear()
				end
			end

			arg_24_0._fleetAntiAir:RemoveCrewUnit(arg_24_1)
			arg_24_0._fleetRangeAntiAir:RemoveCrewUnit(arg_24_1)
			arg_24_0._fleetStaticSonar:RemoveCrewUnit(arg_24_1)

			local var_24_2 = iter_24_1:GetTorpedoList()

			for iter_24_4, iter_24_5 in ipairs(var_24_2) do
				arg_24_0:RemoveManunalTorpedo(iter_24_5, arg_24_2)
			end

			local var_24_3 = iter_24_1:GetAirAssistList()

			if var_24_3 then
				for iter_24_6, iter_24_7 in ipairs(var_24_3) do
					arg_24_0._airAssistVO:RemoveWeapon(iter_24_7)
				end
			end
		end
	end

	for iter_24_8, iter_24_9 in ipairs(arg_24_0._scoutList) do
		if iter_24_9 == arg_24_1 then
			if #arg_24_0._scoutList == 1 then
				arg_24_0:CancelChargeWeapon()
			end

			table.remove(arg_24_0._scoutList, iter_24_8)

			break
		end
	end

	local function var_24_4(arg_25_0)
		for iter_25_0, iter_25_1 in ipairs(arg_25_0) do
			if iter_25_1 == arg_24_1 then
				table.remove(arg_25_0, iter_25_0)

				break
			end
		end
	end

	var_24_4(arg_24_0._mainList)
	var_24_4(arg_24_0._cloakList)
	var_24_4(arg_24_0._subList)
	var_24_4(arg_24_0._manualSubList)

	if not arg_24_0._manualSubUnit then
		arg_24_0:refreshFleetFormation(var_24_0)
	end
end

function var_0_8.OverrideJoyStickAutoBot(arg_26_0, arg_26_1)
	arg_26_0._autoBotAIID = arg_26_1

	local var_26_0 = var_0_0.Event.New(var_0_0.Battle.BattleEvent.OVERRIDE_AUTO_BOT)

	arg_26_0:DispatchEvent(var_26_0)
end

function var_0_8.SnapShot(arg_27_0)
	arg_27_0._totalDMGRatio = var_0_3.GetFleetTotalHP(arg_27_0)
	arg_27_0._currentDMGRatio = arg_27_0._totalDMGRatio
end

function var_0_8.GetIFF(arg_28_0)
	return arg_28_0._IFF
end

function var_0_8.GetMaxCount(arg_29_0)
	return arg_29_0._maxCount
end

function var_0_8.GetFlagShip(arg_30_0)
	return arg_30_0._flagShip
end

function var_0_8.GetLeaderShip(arg_31_0)
	return arg_31_0._scoutList[1]
end

function var_0_8.GetUnitList(arg_32_0)
	return arg_32_0._unitList
end

function var_0_8.GetFreezeUnitList(arg_33_0)
	return arg_33_0._freezeList
end

function var_0_8.GetMainList(arg_34_0)
	return arg_34_0._mainList
end

function var_0_8.GetScoutList(arg_35_0)
	return arg_35_0._scoutList
end

function var_0_8.GetFreezeShipByID(arg_36_0, arg_36_1)
	for iter_36_0, iter_36_1 in pairs(arg_36_0._freezeList) do
		if arg_36_1 == iter_36_0:GetAttrByName("id") then
			return iter_36_0
		end
	end
end

function var_0_8.GetShipByID(arg_37_0, arg_37_1)
	for iter_37_0, iter_37_1 in ipairs(arg_37_0._unitList) do
		if arg_37_1 == iter_37_1:GetAttrByName("id") then
			return iter_37_1
		end
	end
end

function var_0_8.GetCloakList(arg_38_0)
	return arg_38_0._cloakList
end

function var_0_8.GetSubBench(arg_39_0)
	return arg_39_0._manualSubBench
end

function var_0_8.GetUnitBound(arg_40_0)
	return arg_40_0._fleetUnitBound
end

function var_0_8.GetMotion(arg_41_0)
	return arg_41_0._motionVO
end

function var_0_8.GetMotionReferenceUnit(arg_42_0)
	return arg_42_0._motionReferenceUnit
end

function var_0_8.GetAutoBotAIID(arg_43_0)
	return arg_43_0._autoBotAIID
end

function var_0_8.GetChargeWeaponVO(arg_44_0)
	return arg_44_0._chargeWeaponVO
end

function var_0_8.GetTorpedoWeaponVO(arg_45_0)
	return arg_45_0._torpedoWeaponVO
end

function var_0_8.GetAirAssistVO(arg_46_0)
	return arg_46_0._airAssistVO
end

function var_0_8.GetSubAidVO(arg_47_0)
	return arg_47_0._submarineVO
end

function var_0_8.GetSubFreeDiveVO(arg_48_0)
	return arg_48_0._submarineDiveVO
end

function var_0_8.GetSubFreeFloatVO(arg_49_0)
	return arg_49_0._submarineFloatVO
end

function var_0_8.GetSubBoostVO(arg_50_0)
	return arg_50_0._submarineBoostVO
end

function var_0_8.GetSubSpecialVO(arg_51_0)
	return arg_51_0._submarineSpecialVO
end

function var_0_8.GetSubShiftVO(arg_52_0)
	return arg_52_0._submarineShiftVO
end

function var_0_8.GetFleetAntiAirWeapon(arg_53_0)
	return arg_53_0._fleetAntiAir
end

function var_0_8.GetFleetRangeAntiAirWeapon(arg_54_0)
	return arg_54_0._fleetRangeAntiAir
end

function var_0_8.GetFleetVelocity(arg_55_0)
	return var_0_3.GetFleetVelocity(arg_55_0._scoutList)
end

function var_0_8.GetFleetBound(arg_56_0)
	return arg_56_0._upperBound, arg_56_0._lowerBound, arg_56_0._leftBound, arg_56_0._rightBound
end

function var_0_8.GetFleetUnitBound(arg_57_0)
	return arg_57_0._totalUpperBound, arg_57_0._totalLowerBound
end

function var_0_8.GetFleetExposeLine(arg_58_0)
	return arg_58_0._exposeLineX
end

function var_0_8.GetFleetVisionLine(arg_59_0)
	return arg_59_0._visionLineX
end

function var_0_8.GetLeaderPersonality(arg_60_0)
	return arg_60_0._motionReferenceUnit:GetAutoPilotPreference()
end

function var_0_8.GetDamageRatioResult(arg_61_0)
	return string.format("%0.2f", arg_61_0._currentDMGRatio / arg_61_0._totalDMGRatio * 100), arg_61_0._totalDMGRatio
end

function var_0_8.GetDamageRatio(arg_62_0)
	return arg_62_0._currentDMGRatio / arg_62_0._totalDMGRatio
end

function var_0_8.GetSubmarineBaseLine(arg_63_0)
	return arg_63_0._fixedSubRefLine or arg_63_0._subAttackBaseLine, arg_63_0._subRetreatBaseLine
end

function var_0_8.GetFleetSonar(arg_64_0)
	return arg_64_0._fleetStaticSonar
end

function var_0_8.Dispose(arg_65_0)
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_65_0)
	var_0_0.EventListener.DetachEventListener(arg_65_0)

	arg_65_0._leaderUnit = nil

	arg_65_0._fleetAntiAir:Dispose()
	arg_65_0._fleetRangeAntiAir:Dispose()
	arg_65_0._fleetStaticSonar:Dispose()

	arg_65_0._fleetStaticSonar = nil
	arg_65_0._buffList = nil
	arg_65_0._indieSonarList = nil
	arg_65_0._scoutAimBias = nil

	arg_65_0._fleetAttr:Dispose()

	arg_65_0._fleetAttr = nil
	arg_65_0._freezeList = nil
end

function var_0_8.refreshFleetFormation(arg_66_0, arg_66_1)
	local var_66_0 = var_0_7.GetFormationTmpDataFromID(var_0_5.FORMATION_ID).pos_offset

	arg_66_0._unitList = var_0_7.SortFleetList(arg_66_1, arg_66_0._unitList)

	local var_66_1 = var_0_5.BornOffset

	if not arg_66_0._mainUnitFree then
		for iter_66_0, iter_66_1 in ipairs(arg_66_0._unitList) do
			if not table.contains(arg_66_0._subList, iter_66_1) then
				local var_66_2 = var_66_0[iter_66_0] or var_66_0[#var_66_0]

				iter_66_1:UpdateFormationOffset(Vector3(var_66_2.x, var_66_2.y, var_66_2.z) + var_66_1 * (iter_66_0 - 1))
			end
		end
	end

	if #arg_66_0._scoutList > 0 then
		arg_66_0._motionReferenceUnit = arg_66_0._scoutList[1]
		arg_66_0._leaderUnit = arg_66_0._scoutList[1]

		arg_66_0._leaderUnit:LeaderSetting()
		arg_66_0._fleetAntiAir:SwitchHost(arg_66_0._motionReferenceUnit)
		arg_66_0._fleetStaticSonar:SwitchHost(arg_66_0._motionReferenceUnit)

		for iter_66_2, iter_66_3 in pairs(arg_66_0._indieSonarList) do
			iter_66_2:SwitchHost(arg_66_0._motionReferenceUnit)
		end

		arg_66_0._motionVO:UpdatePos(arg_66_0._motionReferenceUnit)
	elseif arg_66_0._fleetAntiAir:GetCurrentState() ~= arg_66_0._fleetAntiAir.STATE_DISABLE then
		local var_66_3 = arg_66_0._fleetAntiAir:GetCrewUnitList()

		for iter_66_4, iter_66_5 in pairs(var_66_3) do
			arg_66_0._motionReferenceUnit = iter_66_4

			arg_66_0._fleetAntiAir:SwitchHost(iter_66_4)

			break
		end
	else
		arg_66_0._motionReferenceUnit = arg_66_0._mainList[1]
		arg_66_0._leaderUnit = nil
	end

	if #arg_66_0:GetUnitList() == 0 then
		return
	end

	local var_66_4 = var_0_0.Event.New(var_0_0.Battle.BattleEvent.REFRESH_FLEET_FORMATION)

	arg_66_0:DispatchEvent(var_66_4)
end

function var_0_8.init(arg_67_0)
	arg_67_0._chargeWeaponVO = var_0_0.Battle.BattleChargeWeaponVO.New()
	arg_67_0._torpedoWeaponVO = var_0_0.Battle.BattleTorpedoWeaponVO.New()
	arg_67_0._airAssistVO = var_0_0.Battle.BattleAllInStrikeVO.New()
	arg_67_0._submarineDiveVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.DIVE_CD)
	arg_67_0._submarineFloatVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.FLOAT_CD)
	arg_67_0._submarineVOList = {
		arg_67_0._submarineDiveVO,
		arg_67_0._submarineFloatVO
	}
	arg_67_0._submarineBoostVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.BOOST_CD)
	arg_67_0._submarineShiftVO = var_0_0.Battle.BattleSubmarineFuncVO.New(var_0_5.SR_CONFIG.SHIFT_CD)
	arg_67_0._submarineSpecialVO = var_0_0.Battle.BattleSubmarineAidVO.New()

	arg_67_0._submarineSpecialVO:SetCount(1)
	arg_67_0._submarineSpecialVO:SetTotal(1)

	arg_67_0._fleetAntiAir = var_0_0.Battle.BattleFleetAntiAirUnit.New()
	arg_67_0._fleetRangeAntiAir = var_0_0.Battle.BattleFleetRangeAntiAirUnit.New()
	arg_67_0._motionVO = var_0_0.Battle.BattleFleetMotionVO.New()
	arg_67_0._fleetStaticSonar = var_0_0.Battle.BattleFleetStaticSonar.New(arg_67_0)
	arg_67_0._indieSonarList = {}
	arg_67_0._scoutList = {}
	arg_67_0._mainList = {}
	arg_67_0._subList = {}
	arg_67_0._supportList = {}
	arg_67_0._cloakList = {}
	arg_67_0._manualSubList = {}
	arg_67_0._manualSubBench = {}
	arg_67_0._unitList = {}
	arg_67_0._maxCount = 0
	arg_67_0._freezeList = {}
	arg_67_0._blockCast = 0
	arg_67_0._buffList = {}

	arg_67_0:AttachFleetAttr()
	arg_67_0:SetMotionSource()
end

function var_0_8.appendScoutUnit(arg_68_0, arg_68_1)
	arg_68_0._scoutList[#arg_68_0._scoutList + 1] = arg_68_1

	local var_68_0 = arg_68_1:GetTorpedoList()

	for iter_68_0, iter_68_1 in ipairs(var_68_0) do
		arg_68_0._torpedoWeaponVO:AppendWeapon(iter_68_1)
	end

	if #arg_68_1:GetHiveList() > 0 then
		local var_68_1 = var_0_7.CreateAllInStrike(arg_68_1)

		for iter_68_2, iter_68_3 in ipairs(var_68_1) do
			arg_68_0._airAssistVO:AppendWeapon(iter_68_3)
		end

		arg_68_1:SetAirAssistList(var_68_1)
	end

	arg_68_0._fleetAntiAir:AppendCrewUnit(arg_68_1)
	arg_68_0._fleetStaticSonar:AppendCrewUnit(arg_68_1)

	local var_68_2 = 1
	local var_68_3 = #arg_68_0._unitList
	local var_68_4 = {}

	while var_68_2 < var_68_3 do
		table.insert(var_68_4, var_68_2)

		var_68_2 = var_68_2 + 1
	end

	table.insert(var_68_4, #arg_68_0._scoutList, var_68_2)
	arg_68_0:refreshFleetFormation(var_68_4)
end

function var_0_8.appendMainUnit(arg_69_0, arg_69_1)
	if #arg_69_0._mainList == 0 then
		arg_69_0._flagShip = arg_69_1
	end

	arg_69_0._mainList[#arg_69_0._mainList + 1] = arg_69_1

	arg_69_1:SetMainUnitIndex(#arg_69_0._mainList)

	if ShipType.CloakShipType(arg_69_1:GetTemplate().type) then
		arg_69_0:AttachCloak(arg_69_1)
	end

	local var_69_0 = arg_69_1:GetChargeList()

	for iter_69_0, iter_69_1 in ipairs(var_69_0) do
		arg_69_0._chargeWeaponVO:AppendWeapon(iter_69_1)
	end

	local var_69_1 = arg_69_1:GetTorpedoList()

	for iter_69_2, iter_69_3 in ipairs(var_69_1) do
		arg_69_0._torpedoWeaponVO:AppendWeapon(iter_69_3)
	end

	if #arg_69_1:GetHiveList() > 0 then
		local var_69_2 = var_0_7.CreateAllInStrike(arg_69_1)

		for iter_69_4, iter_69_5 in ipairs(var_69_2) do
			arg_69_0._airAssistVO:AppendWeapon(iter_69_5)
		end

		arg_69_1:SetAirAssistList(var_69_2)
	end

	arg_69_0._fleetAntiAir:AppendCrewUnit(arg_69_1)
	arg_69_0._fleetRangeAntiAir:AppendCrewUnit(arg_69_1)
	arg_69_0._fleetStaticSonar:AppendCrewUnit(arg_69_1)

	local var_69_3 = {}

	for iter_69_6, iter_69_7 in ipairs(arg_69_0._unitList) do
		table.insert(var_69_3, iter_69_6)
	end

	arg_69_0:refreshFleetFormation(var_69_3)
end

function var_0_8.appendSubUnit(arg_70_0, arg_70_1)
	arg_70_0._subList[#arg_70_0._subList + 1] = arg_70_1

	arg_70_1:SetMainUnitIndex(#arg_70_0._subList)
end

function var_0_8.FleetWarcry(arg_71_0)
	local var_71_0
	local var_71_1 = math.random(0, 1)
	local var_71_2 = arg_71_0:GetScoutList()[1]
	local var_71_3 = arg_71_0:GetMainList()[1]

	if var_71_3 == nil or var_71_1 == 0 then
		var_71_0 = var_71_2
	elseif var_71_1 == 1 then
		var_71_0 = var_71_3
	end

	local var_71_4 = "battle"
	local var_71_5 = var_71_0:GetIntimacy()
	local var_71_6 = var_0_0.Battle.BattleDataFunction.GetWords(var_71_0:GetSkinID(), var_71_4, var_71_5)

	var_71_0:DispatchVoice(var_71_4)
	var_71_0:DispatchChat(var_71_6, 2.5, var_71_4)
end

function var_0_8.FleetUnitSpwanFinish(arg_72_0)
	local var_72_0 = 0

	for iter_72_0, iter_72_1 in ipairs(arg_72_0._unitList) do
		var_72_0 = var_72_0 + iter_72_1:GetGearScore()
	end

	for iter_72_2, iter_72_3 in ipairs(arg_72_0._unitList) do
		var_0_6.SetCurrent(iter_72_3, "fleetGS", var_72_0)
	end
end

function var_0_8.SubWarcry(arg_73_0)
	local var_73_0 = arg_73_0:GetSubList()[1]
	local var_73_1 = "battle"
	local var_73_2 = var_73_0:GetIntimacy()
	local var_73_3 = var_0_0.Battle.BattleDataFunction.GetWords(var_73_0:GetSkinID(), var_73_1, var_73_2)

	var_73_0:DispatchVoice(var_73_1)
	var_73_0:DispatchChat(var_73_3, 2.5, var_73_1)
end

function var_0_8.SetWeaponBlock(arg_74_0, arg_74_1)
	arg_74_0._blockCast = arg_74_0._blockCast + arg_74_1
end

function var_0_8.GetWeaponBlock(arg_75_0)
	return arg_75_0._blockCast > 0
end

function var_0_8.CastChargeWeapon(arg_76_0)
	if arg_76_0:GetWeaponBlock() then
		return
	end

	local var_76_0 = arg_76_0._chargeWeaponVO:GetCurrentWeapon()

	if var_76_0 ~= nil and var_76_0:GetCurrentState() == var_76_0.STATE_READY then
		var_76_0:Charge()

		local var_76_1 = {}
		local var_76_2 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.POINT_HIT_CHARGE, var_76_1)

		arg_76_0:DispatchEvent(var_76_2)
	end
end

function var_0_8.CancelChargeWeapon(arg_77_0)
	local var_77_0 = arg_77_0._chargeWeaponVO:GetCurrentWeapon()

	if var_77_0 ~= nil and var_77_0:GetCurrentState() == var_77_0.STATE_PRECAST then
		local var_77_1 = {}
		local var_77_2 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.POINT_HIT_CANCEL, var_77_1)

		arg_77_0:DispatchEvent(var_77_2)
		var_77_0:CancelCharge()
	end
end

function var_0_8.UnleashChrageWeapon(arg_78_0)
	if arg_78_0:GetWeaponBlock() then
		arg_78_0:CancelChargeWeapon()

		return
	end

	local var_78_0 = arg_78_0._chargeWeaponVO:GetCurrentWeapon()

	if var_78_0 ~= nil and var_78_0:GetCurrentState() == var_78_0.STATE_PRECAST then
		if var_78_0:IsStrikeMode() then
			local var_78_1 = arg_78_0._motionVO:GetPos().x + var_0_5.ChargeWeaponConfig.SIGHT_C
			local var_78_2 = math.min(var_78_1, arg_78_0._totalRightBound)

			arg_78_0:fireChargeWeapon(var_78_0, true, Vector3.New(var_78_2, 0, arg_78_0._motionVO:GetPos().z))
		else
			var_78_0:CancelCharge()
		end

		local var_78_3 = {}
		local var_78_4 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.POINT_HIT_CANCEL, var_78_3)

		arg_78_0:DispatchEvent(var_78_4)
	end
end

function var_0_8.QuickTagChrageWeapon(arg_79_0, arg_79_1)
	if arg_79_0:GetWeaponBlock() then
		return
	end

	local var_79_0
	local var_79_1 = arg_79_0._chargeWeaponVO:GetCurrentWeapon()

	if var_79_1 ~= nil and var_79_1:GetCurrentState() == var_79_1.STATE_READY then
		var_79_1:QuickTag()

		if #var_79_1:GetLockList() <= 0 then
			var_79_1:CancelQuickTag()
		else
			var_79_0 = arg_79_0:fireChargeWeapon(var_79_1, arg_79_1)
		end
	end

	return var_79_0
end

function var_0_8.fireChargeWeapon(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	local var_80_0 = arg_80_1:GetHost()

	local function var_80_1()
		local function var_81_0()
			arg_80_1:Fire(arg_80_3)
		end

		arg_80_1:DispatchBlink(var_81_0)
	end

	if arg_80_1:GetType() == var_0_4.EquipmentType.POINT_AIR_STRIKE then
		arg_80_1:Fire(arg_80_3)
	elseif arg_80_2 then
		if arg_80_0._IFF == var_0_5.FRIENDLY_CODE then
			arg_80_0._chargeWeaponVO:PlayCutIn(var_80_0, 1 / var_0_5.FOCUS_MAP_RATE)
		end

		arg_80_0._chargeWeaponVO:PlayFocus(var_80_0, var_80_1)
	else
		if arg_80_0._IFF == var_0_5.FRIENDLY_CODE then
			arg_80_0._chargeWeaponVO:PlayCutIn(var_80_0, 1)
		end

		var_80_1()
	end
end

function var_0_8.UnleashAllInStrike(arg_83_0)
	if arg_83_0:GetWeaponBlock() then
		return
	end

	local var_83_0
	local var_83_1 = arg_83_0._airAssistVO:GetCurrentWeapon()

	if var_83_1 and var_83_1:GetCurrentState() == var_83_1.STATE_READY then
		local var_83_2 = var_83_1:GetHost()

		if arg_83_0._IFF == var_0_5.FRIENDLY_CODE and var_83_2:IsMainFleetUnit() then
			arg_83_0._airAssistVO:PlayCutIn(var_83_2, 1)
		end

		var_83_1:CLSBullet()
		var_83_1:DispatchBlink()

		var_83_0 = var_83_1:Fire()
	end

	return var_83_0
end

function var_0_8.CastTorpedo(arg_84_0)
	if arg_84_0:GetWeaponBlock() then
		return
	end

	local var_84_0 = arg_84_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_84_0 ~= nil and var_84_0:GetCurrentState() == var_84_0.STATE_READY and var_84_0:Prepar() then
		arg_84_0:FleetBuffTrigger(var_0_4.BuffEffectType.ON_TORPEDO_BUTTON_PUSH)
	end
end

function var_0_8.CancelTorpedo(arg_85_0)
	local var_85_0 = arg_85_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_85_0 ~= nil and var_85_0:GetCurrentState() == var_85_0.STATE_PRECAST then
		var_85_0:Cancel()
	end
end

function var_0_8.UnleashTorpedo(arg_86_0)
	if arg_86_0:GetWeaponBlock() then
		arg_86_0:CancelTorpedo()

		return
	end

	local var_86_0 = arg_86_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_86_0 ~= nil and var_86_0:GetCurrentState() == var_86_0.STATE_PRECAST then
		var_86_0:Fire()
	end
end

function var_0_8.QuickCastTorpedo(arg_87_0)
	if arg_87_0:GetWeaponBlock() then
		return
	end

	local var_87_0
	local var_87_1 = arg_87_0._torpedoWeaponVO:GetCurrentWeapon()

	if var_87_1 ~= nil and var_87_1:GetCurrentState() == var_87_1.STATE_READY then
		var_87_0 = var_87_1:Fire(true)
	end

	return var_87_0
end

function var_0_8.RemoveManunalTorpedo(arg_88_0, arg_88_1, arg_88_2)
	if arg_88_1:IsAttacking() then
		arg_88_0:CancelTorpedo()
	end

	arg_88_0._torpedoWeaponVO:RemoveWeapon(arg_88_1)

	if not arg_88_2 then
		arg_88_1:Clear()
	end
end

function var_0_8.CoupleEncourage(arg_89_0)
	local var_89_0 = {}
	local var_89_1 = {}

	for iter_89_0, iter_89_1 in ipairs(arg_89_0._unitList) do
		local var_89_2 = iter_89_1:GetIntimacy()
		local var_89_3 = var_0_7.GetWords(iter_89_1:GetSkinID(), "couple_encourage", var_89_2)

		if #var_89_3 > 0 then
			var_89_0[iter_89_1] = var_89_3
		end
	end

	local var_89_4 = var_0_4.CPChatType
	local var_89_5 = var_0_4.CPChatTargetFunc

	local function var_89_6(arg_90_0, arg_90_1)
		local var_90_0 = {}

		if arg_90_0 == var_89_4.GROUP_ID then
			var_90_0.groupIDList = arg_90_1
		elseif arg_90_0 == var_89_4.SHIP_TYPE then
			var_90_0.ship_type_list = arg_90_1
		elseif arg_90_0 == var_89_4.RARE then
			var_90_0.rarity = arg_90_1[1]
		elseif arg_90_0 == var_89_4.NATIONALITY then
			var_90_0.nationality = arg_90_1[1]
		elseif arg_90_0 == var_89_4.ILLUSTRATOR then
			var_90_0.illustrator = arg_90_1[1]
		elseif arg_90_0 == var_89_4.TEAM then
			var_90_0.teamIndex = arg_90_1[1]
		end

		return var_90_0
	end

	for iter_89_2, iter_89_3 in pairs(var_89_0) do
		for iter_89_4, iter_89_5 in ipairs(iter_89_3) do
			local var_89_7 = iter_89_5[1]
			local var_89_8 = iter_89_5[2]
			local var_89_9 = iter_89_5[4] or var_89_4.GROUP_ID
			local var_89_10 = var_0_0.Battle.BattleTargetChoise.TargetAllHelp(iter_89_2)

			if type(var_89_9) == "table" then
				for iter_89_6, iter_89_7 in ipairs(var_89_9) do
					local var_89_11 = var_89_6(iter_89_7, var_89_7[iter_89_6])

					var_89_10 = var_0_0.Battle.BattleTargetChoise[var_89_5[iter_89_7]](iter_89_2, var_89_11, var_89_10)
				end
			elseif type(var_89_9) == "number" then
				local var_89_12 = var_89_6(var_89_9, var_89_7)

				var_89_10 = var_0_0.Battle.BattleTargetChoise[var_89_5[var_89_9]](iter_89_2, var_89_12, var_89_10)
			end

			if var_89_8 <= #var_89_10 then
				local var_89_13 = {
					cp = iter_89_2,
					content = iter_89_5[3],
					linkIndex = iter_89_4
				}

				var_89_1[#var_89_1 + 1] = var_89_13
			end
		end
	end

	if #var_89_1 > 0 then
		local var_89_14 = var_89_1[math.random(#var_89_1)]
		local var_89_15 = "link" .. var_89_14.linkIndex

		var_89_14.cp:DispatchVoice(var_89_15)
		var_89_14.cp:DispatchChat(var_89_14.content, 3, var_89_15)
	end
end

function var_0_8.onUnitUpdateHP(arg_91_0, arg_91_1)
	local var_91_0 = arg_91_1.Dispatcher
	local var_91_1 = arg_91_1.Data.dHP

	for iter_91_0, iter_91_1 in ipairs(arg_91_0._unitList) do
		iter_91_1:TriggerBuff(var_0_4.BuffEffectType.ON_FRIENDLY_HP_RATIO_UPDATE, {
			unit = var_91_0,
			dHP = var_91_1
		})

		if iter_91_1 ~= var_91_0 then
			iter_91_1:TriggerBuff(var_0_4.BuffEffectType.ON_TEAMMATE_HP_RATIO_UPDATE, {
				unit = var_91_0,
				dHP = var_91_1
			})
		end
	end
end

function var_0_8.onUnitCloakUpdate(arg_92_0, arg_92_1)
	local var_92_0 = arg_92_1.Dispatcher
	local var_92_1 = var_0_6.GetCurrent(var_92_0, "isCloak")

	for iter_92_0, iter_92_1 in ipairs(arg_92_0._unitList) do
		iter_92_1:TriggerBuff(var_0_4.BuffEffectType.ON_CLOAK_UPDATE, {
			cloakState = var_92_1
		})

		if iter_92_1 ~= var_92_0 then
			iter_92_1:TriggerBuff(var_0_4.BuffEffectType.ON_TEAMMATE_CLOAK_UPDATE, {
				cloakState = var_92_1
			})
		end
	end
end

function var_0_8.SetSubUnitData(arg_93_0, arg_93_1)
	arg_93_0._subUntiDataList = arg_93_1
end

function var_0_8.GetSubUnitData(arg_94_0)
	return arg_94_0._subUntiDataList
end

function var_0_8.AddSubMarine(arg_95_0, arg_95_1)
	arg_95_1:InitOxygen()

	local var_95_0 = arg_95_1:GetTemplate()
	local var_95_1 = var_0_0.Battle.BattleUnitPhaseSwitcher.New(arg_95_1)

	local function var_95_2()
		return arg_95_1:GetRaidDuration()
	end

	local var_95_3 = arg_95_0._fixedSubRefLine or arg_95_0._subAttackBaseLine

	var_95_1:SetTemplateData(var_0_7.GeneratePlayerSubmarinPhase(var_95_3, arg_95_0._subRetreatBaseLine, arg_95_1:GetAttrByName("raidDist"), var_95_2, arg_95_1:GetAttrByName("oxyAtkDuration")))

	arg_95_0._unitList[#arg_95_0._unitList + 1] = arg_95_1
	arg_95_0._subList[#arg_95_0._subList + 1] = arg_95_1

	arg_95_1:SetFleetVO(arg_95_0)
	arg_95_1:RegisterEventListener(arg_95_0, var_0_1.UPDATE_HP, arg_95_0.onUnitUpdateHP)
	arg_95_1:RegisterEventListener(arg_95_0, var_0_1.UPDATE_CLOAK_STATE, arg_95_0.onUnitCloakUpdate)
end

function var_0_8.AddManualSubmarine(arg_97_0, arg_97_1)
	arg_97_0._unitList[#arg_97_0._unitList + 1] = arg_97_1
	arg_97_0._manualSubList[#arg_97_0._manualSubList + 1] = arg_97_1
	arg_97_0._manualSubBench[#arg_97_0._manualSubBench + 1] = arg_97_1
	arg_97_0._maxCount = arg_97_0._maxCount + 1

	arg_97_1:InitOxygen()
	arg_97_1:SetFleetVO(arg_97_0)
	arg_97_1:SetMotion(arg_97_0._motionVO)
	arg_97_1:RegisterEventListener(arg_97_0, var_0_1.UPDATE_HP, arg_97_0.onUnitUpdateHP)
	arg_97_1:RegisterEventListener(arg_97_0, var_0_1.UPDATE_CLOAK_STATE, arg_97_0.onUnitCloakUpdate)
end

function var_0_8.GetSubList(arg_98_0)
	return arg_98_0._subList
end

function var_0_8.ShiftManualSub(arg_99_0)
	local var_99_0

	if arg_99_0._manualSubUnit then
		local var_99_1 = arg_99_0._manualSubUnit:GetTorpedoList()

		for iter_99_0, iter_99_1 in ipairs(var_99_1) do
			if iter_99_1:IsAttacking() then
				arg_99_0:CancelTorpedo()
			end

			arg_99_0._torpedoWeaponVO:RemoveWeapon(iter_99_1)
		end

		if arg_99_0._manualSubUnit:IsAlive() then
			table.insert(arg_99_0._manualSubBench, arg_99_0._manualSubUnit)
		end

		var_99_0 = arg_99_0._motionVO:GetPos():Clone()
	else
		var_99_0 = arg_99_0._manualSubList[1]:GetPosition():Clone()
	end

	arg_99_0._manualSubUnit = table.remove(arg_99_0._manualSubBench, 1)
	arg_99_0._scoutList[1] = arg_99_0._manualSubUnit

	local var_99_2 = {}

	for iter_99_2, iter_99_3 in ipairs(arg_99_0._manualSubBench) do
		for iter_99_4, iter_99_5 in ipairs(arg_99_0._unitList) do
			if iter_99_5 == iter_99_3 then
				table.insert(var_99_2, iter_99_4)

				break
			end
		end
	end

	for iter_99_6, iter_99_7 in ipairs(arg_99_0._unitList) do
		if iter_99_7 == arg_99_0._manualSubUnit then
			table.insert(var_99_2, 1, iter_99_6)

			break
		end
	end

	arg_99_0:refreshFleetFormation(var_99_2)
	arg_99_0._manualSubUnit:SetMainUnitStatic(false)
	arg_99_0._manualSubUnit:SetPosition(var_99_0)
	arg_99_0:UpdateMotion()
	arg_99_0._submarineSpecialVO:SetUseable(false)

	local var_99_3 = arg_99_0._manualSubUnit:GetBuffList()

	for iter_99_8, iter_99_9 in pairs(var_99_3) do
		if iter_99_9:IsSubmarineSpecial() then
			arg_99_0._submarineSpecialVO:SetCount(1)
			arg_99_0._submarineSpecialVO:SetUseable(true)

			break
		end
	end

	arg_99_0:ChangeSubmarineState(var_0_0.Battle.OxyState.STATE_FREE_DIVE)
	arg_99_0._torpedoWeaponVO:Reset()

	local var_99_4 = arg_99_0._manualSubUnit:GetTorpedoList()

	for iter_99_10, iter_99_11 in ipairs(var_99_4) do
		if iter_99_11:GetCurrentState() ~= iter_99_11.STATE_OVER_HEAT then
			arg_99_0._torpedoWeaponVO:AppendWeapon(iter_99_11)
		end
	end

	for iter_99_12, iter_99_13 in ipairs(var_99_4) do
		if iter_99_13:GetCurrentState() == iter_99_13.STATE_OVER_HEAT then
			arg_99_0._torpedoWeaponVO:AppendWeapon(iter_99_13)
		end
	end

	if var_0_6.GetCurrent(arg_99_0._manualSubUnit, "oxyMax") <= 0 then
		arg_99_0._submarineDiveVO:SetActive(false)
		arg_99_0._submarineFloatVO:SetActive(false)
	else
		arg_99_0._submarineDiveVO:SetActive(true)
		arg_99_0._submarineFloatVO:SetActive(true)
	end

	for iter_99_14, iter_99_15 in ipairs(arg_99_0._manualSubBench) do
		iter_99_15:SetPosition(var_0_5.SUB_BENCH_POS[iter_99_14])
		iter_99_15:SetMainUnitStatic(true)
		iter_99_15:ChangeOxygenState(var_0_0.Battle.OxyState.STATE_FREE_BENCH)
	end

	arg_99_0._submarineShiftVO:ResetCurrent()

	if #arg_99_0._manualSubBench == 0 then
		arg_99_0._submarineShiftVO:SetActive(false)
	end
end

function var_0_8.ChangeSubmarineState(arg_100_0, arg_100_1, arg_100_2)
	if not arg_100_0._manualSubUnit then
		return
	end

	arg_100_0._manualSubUnit:ChangeOxygenState(arg_100_1)

	if arg_100_2 then
		for iter_100_0, iter_100_1 in ipairs(arg_100_0._submarineVOList) do
			iter_100_1:ResetCurrent()
		end

		local var_100_0 = arg_100_0._submarineShiftVO:GetMax() - arg_100_0._submarineShiftVO:GetCurrent()

		if arg_100_0._submarineShiftVO:IsOverLoad() and var_100_0 > var_0_5.SR_CONFIG.DIVE_CD then
			-- block empty
		else
			arg_100_0._submarineShiftVO:SetMax(var_0_5.SR_CONFIG.DIVE_CD)
			arg_100_0._submarineShiftVO:ResetCurrent()
		end
	end

	arg_100_0:DispatchEvent(var_0_0.Event.New(var_0_2.MANUAL_SUBMARINE_SHIFT, {
		state = arg_100_1
	}))
end

function var_0_8.SubmarinBoost(arg_101_0)
	arg_101_0._manualSubUnit:Boost(Vector3.right, var_0_5.SR_CONFIG.BOOST_SPEED, var_0_5.SR_CONFIG.BOOST_DECAY, var_0_5.SR_CONFIG.BOOST_DURATION, var_0_5.SR_CONFIG.BOOST_DECAY_STAMP)
	arg_101_0._submarineBoostVO:ResetCurrent()
end

function var_0_8.UnleashSubmarineSpecial(arg_102_0)
	if arg_102_0:GetWeaponBlock() then
		return
	end

	arg_102_0._submarineSpecialVO:Cast()
	arg_102_0._manualSubUnit:TriggerBuff(var_0_4.BuffEffectType.ON_SUBMARINE_FREE_SPECIAL)
end

function var_0_8.FixSubRefLine(arg_103_0, arg_103_1)
	arg_103_0._fixedSubRefLine = arg_103_1
end

function var_0_8.AppendIndieSonar(arg_104_0, arg_104_1, arg_104_2)
	local var_104_0 = var_0_0.Battle.BattleIndieSonar.New(arg_104_0, arg_104_1, arg_104_2)

	var_104_0:SwitchHost(arg_104_0._motionReferenceUnit)

	arg_104_0._indieSonarList[var_104_0] = true

	var_104_0:Detect()
end

function var_0_8.RemoveIndieSonar(arg_105_0, arg_105_1)
	for iter_105_0, iter_105_1 in pairs(arg_105_0._indieSonarList) do
		if arg_105_1 == iter_105_0 then
			arg_105_0._indieSonarList[iter_105_0] = nil

			break
		end
	end
end

function var_0_8.AttachFleetBuff(arg_106_0, arg_106_1)
	local var_106_0 = arg_106_1:GetID()
	local var_106_1 = arg_106_0:GetFleetBuff(var_106_0)

	if var_106_1 then
		var_106_1:Stack(arg_106_0)
	else
		arg_106_0._buffList[var_106_0] = arg_106_1

		arg_106_1:Attach(arg_106_0)
	end
end

function var_0_8.RemoveFleetBuff(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_0:GetFleetBuff(arg_107_1)

	if var_107_0 then
		var_107_0:Remove()
	end
end

function var_0_8.GetFleetBuff(arg_108_0, arg_108_1)
	return arg_108_0._buffList[arg_108_1]
end

function var_0_8.GetFleetBuffList(arg_109_0)
	return arg_109_0._buffList
end

function var_0_8.AttachFleetAttr(arg_110_0)
	arg_110_0._fleetAttr = var_0_0.Battle.BattleFleetAttrComponent.New(arg_110_0)
end

function var_0_8.GetFleetAttr(arg_111_0)
	return arg_111_0._fleetAttr
end

function var_0_8.Jamming(arg_112_0, arg_112_1)
	if arg_112_1 then
		arg_112_0._chargeWeaponVO:StartJamming()
		arg_112_0._torpedoWeaponVO:StartJamming()
		arg_112_0._airAssistVO:StartJamming()
	else
		arg_112_0._chargeWeaponVO:JammingEliminate()
		arg_112_0._torpedoWeaponVO:JammingEliminate()
		arg_112_0._airAssistVO:JammingEliminate()
	end
end

function var_0_8.Blinding(arg_113_0, arg_113_1)
	arg_113_0:DispatchEvent(var_0_0.Event.New(var_0_2.FLEET_BLIND, {
		isBlind = arg_113_1
	}))
end

function var_0_8.UpdateHorizon(arg_114_0)
	arg_114_0:DispatchEvent(var_0_0.Event.New(var_0_2.FLEET_HORIZON_UPDATE, {}))
end

function var_0_8.AutoBotUpdated(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_1 and var_0_4.BuffEffectType.ON_AUTOBOT or var_0_4.BuffEffectType.ON_MANUAL

	arg_115_0:FleetBuffTrigger(var_115_0)
end

function var_0_8.CloakFatalExpose(arg_116_0)
	for iter_116_0, iter_116_1 in ipairs(arg_116_0._cloakList) do
		iter_116_1:GetCloak():ForceToMax()
	end
end

function var_0_8.CloakInVision(arg_117_0, arg_117_1)
	for iter_117_0, iter_117_1 in ipairs(arg_117_0._cloakList) do
		iter_117_1:GetCloak():AppendExposeSpeed(arg_117_1)
	end
end

function var_0_8.CloakOutVision(arg_118_0)
	for iter_118_0, iter_118_1 in ipairs(arg_118_0._cloakList) do
		iter_118_1:GetCloak():AppendExposeSpeed(0)
	end
end

function var_0_8.AttachCloak(arg_119_0, arg_119_1)
	if not arg_119_1:GetCloak() then
		arg_119_1:InitCloak()

		arg_119_0._cloakList[#arg_119_0._cloakList + 1] = arg_119_1
	end
end

function var_0_8.AttachNightCloak(arg_120_0)
	arg_120_0._scoutAimBias = var_0_0.Battle.BattleUnitAimBiasComponent.New()

	arg_120_0._scoutAimBias:ConfigRangeFormula(var_0_3.CalculateMaxAimBiasRange, var_0_3.CalculateBiasDecay)
	arg_120_0._scoutAimBias:Active(arg_120_0._scoutAimBias.STATE_ACTIVITING)
	arg_120_0:DispatchEvent(var_0_0.Event.New(var_0_2.ADD_AIM_BIAS, {
		aimBias = arg_120_0._scoutAimBias
	}))
end

function var_0_8.GetFleetBias(arg_121_0)
	return arg_121_0._scoutAimBias
end

function var_0_8.FreezeUnit(arg_122_0, arg_122_1)
	arg_122_0:RemovePlayerUnit(arg_122_1, true)

	arg_122_0._freezeList[arg_122_1] = true
end

function var_0_8.ActiveFreezeUnit(arg_123_0, arg_123_1)
	arg_123_0._freezeList[arg_123_1] = nil
	arg_123_0._unitList[#arg_123_0._unitList + 1] = arg_123_1
	arg_123_0._maxCount = arg_123_0._maxCount + 1

	if arg_123_1:IsMainFleetUnit() then
		arg_123_0:appendFreezeMainUnit(arg_123_1)
	else
		arg_123_0:activeFreezeScoutUnit(arg_123_1)
	end

	arg_123_1:SetFleetVO(arg_123_0)
	arg_123_1:SetMotion(arg_123_0._motionVO)
	arg_123_1:RegisterEventListener(arg_123_0, var_0_1.UPDATE_HP, arg_123_0.onUnitUpdateHP)
	arg_123_1:RegisterEventListener(arg_123_0, var_0_1.UPDATE_CLOAK_STATE, arg_123_0.onUnitCloakUpdate)
end

function var_0_8.UndoFusion(arg_124_0)
	for iter_124_0, iter_124_1 in pairs(arg_124_0._freezeList) do
		arg_124_0._unitList[#arg_124_0._unitList + 1] = iter_124_0
		arg_124_0._maxCount = arg_124_0._maxCount + 1

		if iter_124_0:IsMainFleetUnit() then
			arg_124_0:appendFreezeMainUnit(iter_124_0)
		else
			arg_124_0:activeFreezeScoutUnit(iter_124_0)
		end
	end

	local var_124_0 = {}

	for iter_124_2, iter_124_3 in ipairs(arg_124_0._unitList) do
		local var_124_1 = iter_124_3:GetAttrByName("hpProvideRate")

		if var_124_1 ~= 0 then
			table.insert(var_124_0, iter_124_3)

			local var_124_2, var_124_3 = iter_124_3:GetHP()
			local var_124_4 = var_124_3 - var_124_2
			local var_124_5 = 0

			for iter_124_4, iter_124_5 in pairs(var_124_1) do
				local var_124_6 = arg_124_0:GetFreezeShipByID(iter_124_4)

				if not var_124_6 then
					arg_124_0:GetShipByID(iter_124_4)
				end

				local var_124_7 = math.floor(iter_124_5 * var_124_4)

				var_124_6:UpdateHP(var_124_7 * -1, {})
			end
		end
	end

	for iter_124_6, iter_124_7 in ipairs(var_124_0) do
		arg_124_0:RemovePlayerUnit(iter_124_7)
	end
end

function var_0_8.appendFreezeMainUnit(arg_125_0, arg_125_1)
	arg_125_0._mainList[#arg_125_0._mainList + 1] = arg_125_1

	arg_125_1:SetMainUnitIndex(#arg_125_0._mainList)

	if ShipType.CloakShipType(arg_125_1:GetTemplate().type) then
		table.insert(arg_125_0._cloakList, arg_125_1)
	end

	local var_125_0 = arg_125_1:GetChargeList()

	for iter_125_0, iter_125_1 in ipairs(var_125_0) do
		arg_125_0._chargeWeaponVO:AppendFreezeWeapon(iter_125_1)
	end

	local var_125_1 = arg_125_1:GetTorpedoList()

	for iter_125_2, iter_125_3 in ipairs(var_125_1) do
		arg_125_0._torpedoWeaponVO:AppendFreezeWeapon(iter_125_3)
	end

	if arg_125_1:GetAirAssistList() then
		local var_125_2 = arg_125_1:GetAirAssistList()

		for iter_125_4, iter_125_5 in ipairs(var_125_2) do
			arg_125_0._airAssistVO:AppendFreezeWeapon(iter_125_5)
		end
	end

	arg_125_0._fleetAntiAir:AppendCrewUnit(arg_125_1)
	arg_125_0._fleetRangeAntiAir:AppendCrewUnit(arg_125_1)
	arg_125_0._fleetStaticSonar:AppendCrewUnit(arg_125_1)

	local var_125_3 = {}

	for iter_125_6, iter_125_7 in ipairs(arg_125_0._unitList) do
		table.insert(var_125_3, iter_125_6)
	end

	arg_125_0:refreshFleetFormation(var_125_3)
end

function var_0_8.activeFreezeScoutUnit(arg_126_0, arg_126_1)
	arg_126_0._scoutList[#arg_126_0._scoutList + 1] = arg_126_1

	local var_126_0 = arg_126_1:GetTorpedoList()

	for iter_126_0, iter_126_1 in ipairs(var_126_0) do
		arg_126_0._torpedoWeaponVO:AppendFreezeWeapon(iter_126_1)
	end

	if arg_126_1:GetAirAssistList() then
		local var_126_1 = arg_126_1:GetAirAssistList()

		for iter_126_2, iter_126_3 in ipairs(var_126_1) do
			arg_126_0._airAssistVO:AppendFreezeWeapon(iter_126_3)
		end
	end

	arg_126_0._fleetAntiAir:AppendCrewUnit(arg_126_1)
	arg_126_0._fleetStaticSonar:AppendCrewUnit(arg_126_1)

	local var_126_2 = 1
	local var_126_3 = #arg_126_0._unitList
	local var_126_4 = {}

	while var_126_2 < var_126_3 do
		table.insert(var_126_4, var_126_2)

		var_126_2 = var_126_2 + 1
	end

	table.insert(var_126_4, #arg_126_0._scoutList, var_126_2)
	arg_126_0:refreshFleetFormation(var_126_4)
end

function var_0_8.AttachCardPuzzleComponent(arg_127_0)
	arg_127_0._cardPuzzleComponent = var_0_0.Battle.BattleFleetCardPuzzleComponent.New(arg_127_0)

	return arg_127_0._cardPuzzleComponent
end

function var_0_8.GetCardPuzzleComponent(arg_128_0)
	return arg_128_0._cardPuzzleComponent
end

function var_0_8.AppendSupportUnit(arg_129_0, arg_129_1)
	arg_129_0._supportList[#arg_129_0._supportList + 1] = arg_129_1
end

function var_0_8.GetSupportUnitList(arg_130_0)
	return arg_130_0._supportList
end

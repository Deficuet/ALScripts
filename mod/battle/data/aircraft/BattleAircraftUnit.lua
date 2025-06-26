ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = var_0_0.Battle.BattleVariable
local var_0_5 = var_0_0.Battle.BattleDataFunction
local var_0_6 = class("BattleAircraftUnit")

var_0_0.Battle.BattleAircraftUnit = var_0_6
var_0_6.__name = "BattleAircraftUnit"
var_0_6.STATE_CREATE = "Create"
var_0_6.STATE_ATTACK = "Attack"
var_0_6.STATE_DESTORY = "Destory"
var_0_6.HEIGHT = var_0_3.AircraftHeight + 5

function var_0_6.Ctor(arg_1_0, arg_1_1)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_1_0)

	arg_1_0._uniqueID = arg_1_1
	arg_1_0._speedExemptKey = "air_" .. arg_1_1
	arg_1_0._dir = var_0_0.Battle.BattleConst.UnitDir.RIGHT
	arg_1_0._type = var_0_2.UnitType.AIRCRAFT_UNIT
	arg_1_0._currentState = arg_1_0.STATE_CREATE
	arg_1_0._distanceBackup = {}
	arg_1_0._battleProxy = var_0_0.Battle.BattleDataProxy.GetInstance()
	arg_1_0._frame = 0
	arg_1_0._weaponPotential = 1

	arg_1_0:Init()
end

function var_0_6.SetBound(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._top = arg_2_1
	arg_2_0._bottom = arg_2_2

	if arg_2_0._tmpData.spawn_brownian == -1 then
		arg_2_0._speedZ = 0
	else
		arg_2_0._speedZ = (math.random() - 0.5) * 0.5
	end

	arg_2_0:SetTargetZ()
end

function var_0_6.SetViewBoundData(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_0._cameraTop = arg_3_1 + 3
	arg_3_0._cameraBottom = arg_3_2 - 23
	arg_3_0._cameraLeft = arg_3_3 - 3
	arg_3_0._cameraRight = arg_3_4 + 10
end

function var_0_6.Update(arg_4_0, arg_4_1)
	arg_4_0._pos:Add(arg_4_0._speed)
	arg_4_0:UpdateSpeed()
	arg_4_0:UpdateWeapon()
end

function var_0_6.ActiveCldBox(arg_5_0)
	arg_5_0._cldComponent:SetActive(true)
end

function var_0_6.DeactiveCldBox(arg_6_0)
	arg_6_0._cldComponent:SetActive(false)
end

function var_0_6.SetCldBoxImmune(arg_7_0, arg_7_1)
	arg_7_0._cldComponent:SetImmuneCLD(arg_7_1)
end

function var_0_6.Init(arg_8_0)
	arg_8_0._aliveState = true
	arg_8_0._speed = Vector3.zero
	arg_8_0._pos = Vector3.zero
	arg_8_0._undefeated = false
	arg_8_0._labelTagList = {}
end

function var_0_6.Clear(arg_9_0)
	if arg_9_0._createTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_9_0._createTimer)

		arg_9_0._createTimer = nil
	end

	arg_9_0:ShutdownWeapon()

	arg_9_0._distanceBackup = {}
end

function var_0_6.SetWeaponPreCastBound(arg_10_0)
	return
end

function var_0_6.EnterGCD(arg_11_0)
	return
end

function var_0_6.CreateWeapon(arg_12_0)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0._tmpData.weapon_ID) do
		var_12_0[iter_12_0] = var_0_0.Battle.BattleDataFunction.CreateAirFighterWeaponUnit(iter_12_1, arg_12_0, iter_12_0, arg_12_0._weaponPotential)
	end

	return var_12_0
end

function var_0_6.ShutdownWeapon(arg_13_0)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0:GetWeapon()) do
		iter_13_1:Clear()
	end
end

function var_0_6.UpdateWeapon(arg_14_0)
	if arg_14_0._currentState == arg_14_0.STATE_ATTACK then
		for iter_14_0, iter_14_1 in ipairs(arg_14_0:GetWeapon()) do
			iter_14_1:Update()
		end
	end
end

function var_0_6.GetWeapon(arg_15_0)
	return arg_15_0._weapon
end

function var_0_6.GetCurrentHP(arg_16_0)
	return arg_16_0._currentHP
end

function var_0_6.GetMaxHP(arg_17_0)
	return var_0_0.Battle.BattleAttr.GetCurrent(arg_17_0, "maxHP")
end

function var_0_6.IsUndefeated(arg_18_0)
	return arg_18_0._undefeated
end

function var_0_6.IsAlive(arg_19_0)
	return arg_19_0._aliveState
end

function var_0_6.IsCease(arg_20_0)
	return false
end

function var_0_6.GetOxyState(arg_21_0)
	return nil
end

function var_0_6.IsBoss(arg_22_0)
	return nil
end

function var_0_6.HandleDamageToDeath(arg_23_0)
	arg_23_0:UpdateHP(-arg_23_0._currentHP, {
		isMiss = false,
		isCri = false,
		isHeal = false
	})
end

function var_0_6.UpdateHP(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_2.isMiss
	local var_24_1 = arg_24_2.isCri
	local var_24_2 = arg_24_2.isHeal

	arg_24_0._currentHP = arg_24_0._currentHP + arg_24_1

	local var_24_3 = arg_24_0:GetMaxHP()

	if var_24_3 < arg_24_0._currentHP then
		arg_24_0._currentHP = var_24_3
	end

	if arg_24_0._currentHP < 0 then
		arg_24_0._currentHP = 0
	end

	local var_24_4 = {
		dHP = arg_24_1,
		isMiss = var_24_0,
		isCri = var_24_1,
		isHeal = var_24_2
	}

	arg_24_0:DispatchEvent(var_0_0.Event.New(var_0_1.UPDATE_AIR_CRAFT_HP, var_24_4))

	if arg_24_0._currentHP <= 0 and arg_24_0:IsAlive() then
		arg_24_0:onDead()
	end

	return arg_24_1
end

function var_0_6.onDead(arg_25_0)
	arg_25_0._currentState = arg_25_0.STATE_DESTORY
	arg_25_0._aliveState = false
end

function var_0_6.UpdateSpeed(arg_26_0)
	local var_26_0 = arg_26_0._speedDir
	local var_26_1 = arg_26_0._velocity * arg_26_0:GetSpeedRatio()

	arg_26_0._speed:Copy(var_26_0)
	arg_26_0._speed:Mul(var_26_1)

	local var_26_2 = arg_26_0:GetPosition()

	if var_26_2.y < var_0_6.HEIGHT then
		arg_26_0._speed.y = math.max(0.4, 1 - var_26_2.y / var_0_3.AircraftHeight)
	end

	arg_26_0._speed.z = var_26_1 * arg_26_0._speedZ

	if arg_26_0._tmpData.spawn_brownian == 1 then
		local var_26_3 = arg_26_0._targetZ - var_26_2.z

		if var_26_1 < var_26_3 then
			arg_26_0._speed.z = var_26_1 * 0.5
		elseif var_26_3 < -var_26_1 then
			arg_26_0._speed.z = -var_26_1 * 0.5
		else
			arg_26_0:SetTargetZ()
		end
	end
end

function var_0_6.OutBound(arg_27_0)
	arg_27_0._undefeated = true

	arg_27_0:onDead()
end

function var_0_6.GetSize(arg_28_0)
	if arg_28_0._currentState == arg_28_0.STATE_CREATE then
		return Mathf.Clamp(arg_28_0:GetPosition().y / var_0_6.HEIGHT, 0.1, arg_28_0._scale)
	else
		return arg_28_0._scale
	end
end

function var_0_6.SetTemplate(arg_29_0, arg_29_1)
	arg_29_0._tmpData = arg_29_1

	arg_29_0:InitCldComponent()
	var_0_0.Battle.BattleAttr.SetAircraftAttFromTemp(arg_29_0)

	arg_29_0._currentHP = arg_29_0:GetMaxHP()
	arg_29_0._weapon = arg_29_0:CreateWeapon()
	arg_29_0._modelID = arg_29_1.model_ID

	local var_29_0 = arg_29_1.speed + arg_29_0:GetAttrByName("aircraftBooster")

	arg_29_0._velocity = var_0_0.Battle.BattleFormulas.ConvertAircraftSpeed(var_29_0)
	arg_29_0._scale = arg_29_1.scale or 1
end

function var_0_6.SetWeanponPotential(arg_30_0, arg_30_1)
	arg_30_0._weaponPotential = arg_30_1
end

function var_0_6.SetTargetZ(arg_31_0)
	local var_31_0 = arg_31_0._bottom
	local var_31_1 = arg_31_0._top

	arg_31_0._targetZ = (var_31_0 + var_31_1) * 0.5 + (var_31_1 - var_31_0) * (math.random() - 0.5) * 0.6
end

function var_0_6.SetMotherUnit(arg_32_0, arg_32_1)
	arg_32_0._motherUnit = arg_32_1

	local var_32_0 = arg_32_0._motherUnit:GetIFF()

	arg_32_0:SetIFF(var_32_0)
	arg_32_0:SetAttr(arg_32_1)

	local var_32_1 = arg_32_0._motherUnit:GetWeaponBoundBone()

	if var_32_1.remote then
		local var_32_2 = var_32_1.remote
		local var_32_3 = Vector3(var_32_2[1], var_32_2[2], var_32_2[3])

		var_32_3.x = var_32_3.x * var_32_0

		local var_32_4 = arg_32_0._battleProxy:GetStageInfo().mainUnitPosition
		local var_32_5

		if var_32_4 and var_32_4[var_32_0] then
			var_32_5 = var_32_4[var_32_0][1]
		else
			var_32_5 = var_0_3.MAIN_UNIT_POS[var_32_0][1]
		end

		local var_32_6 = var_32_5 + var_32_3

		arg_32_0:SetPosition(var_32_6)
	else
		arg_32_0:SetPosition(arg_32_0._motherUnit:GetPosition())
	end

	if arg_32_1:GetIFF() == var_0_3.FRIENDLY_CODE then
		arg_32_0._dir = var_0_2.UnitDir.RIGHT
		arg_32_0._isPlayerAircraft = true
	else
		arg_32_0._dir = var_0_2.UnitDir.LEFT
	end
end

function var_0_6.GetLabelTag(arg_33_0)
	return arg_33_0._labelTagList
end

function var_0_6.AddLabelTag(arg_34_0, arg_34_1)
	table.insert(arg_34_0._labelTagList, arg_34_1)

	local var_34_0 = arg_34_0:GetAttrByName("labelTag")

	var_34_0[arg_34_1] = (var_34_0[arg_34_1] or 0) + 1
end

function var_0_6.ContainsLabelTag(arg_35_0, arg_35_1)
	if arg_35_0._labelTagList == nil then
		return false
	end

	for iter_35_0, iter_35_1 in ipairs(arg_35_1) do
		if table.contains(arg_35_0._labelTagList, iter_35_1) then
			return true
		end
	end

	return false
end

function var_0_6.SetIFF(arg_36_0, arg_36_1)
	arg_36_0._IFF = arg_36_1
end

function var_0_6.SetPosition(arg_37_0, arg_37_1)
	arg_37_0._pos:Set(arg_37_1.x, arg_37_1.y, arg_37_1.z)
end

function var_0_6.IsOutViewBound(arg_38_0)
	local var_38_0 = arg_38_0:GetPosition()
	local var_38_1 = var_38_0.x
	local var_38_2 = var_38_0.z

	if var_38_1 > arg_38_0._cameraRight or var_38_2 > arg_38_0._cameraTop or var_38_2 < arg_38_0._cameraBottom then
		return true
	end
end

function var_0_6.GetDistance(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0._battleProxy.FrameIndex

	if arg_39_0._frame ~= var_39_0 then
		arg_39_0._distanceBackup = {}
		arg_39_0._frame = var_39_0
	end

	local var_39_1 = arg_39_0._distanceBackup[arg_39_1]

	if var_39_1 == nil then
		var_39_1 = Vector3.Distance(pg.Tool.FilterY(arg_39_0:GetPosition()), pg.Tool.FilterY(arg_39_1:GetPosition()))
		arg_39_0._distanceBackup[arg_39_1] = var_39_1

		arg_39_1:backupDistance(arg_39_0, var_39_1)
	end

	return var_39_1
end

function var_0_6.backupDistance(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_0._battleProxy.FrameIndex

	if arg_40_0._frame ~= var_40_0 then
		arg_40_0._distanceBackup = {}
		arg_40_0._frame = var_40_0
	end

	arg_40_0._distanceBackup[arg_40_1] = arg_40_2
end

function var_0_6.GetSkinID(arg_41_0)
	return arg_41_0._modelID
end

function var_0_6.SetSkinID(arg_42_0, arg_42_1)
	arg_42_0._skinID = arg_42_1
	arg_42_0._modelID = var_0_5.GetEquipSkin(arg_42_0._skinID)

	for iter_42_0, iter_42_1 in ipairs(arg_42_0._weapon) do
		iter_42_1:SetDerivateSkin(arg_42_1)
	end
end

function var_0_6.SetSkinData(arg_43_0, arg_43_1)
	return
end

function var_0_6.SetAttr(arg_44_0, arg_44_1)
	var_0_0.Battle.BattleAttr.SetAircraftAttFromMother(arg_44_0, arg_44_1)
end

function var_0_6.GetAttr(arg_45_0)
	return var_0_0.Battle.BattleAttr.GetAttr(arg_45_0)
end

function var_0_6.GetAttrByName(arg_46_0, arg_46_1)
	return var_0_0.Battle.BattleAttr.GetCurrent(arg_46_0, arg_46_1)
end

function var_0_6.GetMotherUnit(arg_47_0)
	return arg_47_0._motherUnit
end

function var_0_6.GetUniqueID(arg_48_0)
	return arg_48_0._uniqueID
end

function var_0_6.GetIFF(arg_49_0)
	return arg_49_0._IFF
end

function var_0_6.GetCurrentState(arg_50_0)
	return arg_50_0._currentState
end

function var_0_6.GetVelocity(arg_51_0)
	return arg_51_0._velocity
end

function var_0_6.GetSpeed(arg_52_0)
	return arg_52_0._speed
end

function var_0_6.GetPosition(arg_53_0)
	return arg_53_0._pos
end

function var_0_6.GetBornPosition(arg_54_0)
	return nil
end

function var_0_6.GetCLDZCenterPosition(arg_55_0)
	local var_55_0 = arg_55_0:GetBoxSize()

	return Vector3(arg_55_0._pos.x, arg_55_0._pos.y, arg_55_0._pos.z + var_55_0.z)
end

function var_0_6.GetBeenAimedPosition(arg_56_0)
	local var_56_0 = arg_56_0:GetTemplate().aim_offset
	local var_56_1 = arg_56_0:GetCLDZCenterPosition()

	if not var_56_0 then
		return var_56_1
	end

	return Vector3(var_56_1.x + var_56_0[1], var_56_1.y + var_56_0[2], var_56_1.z + var_56_0[3])
end

function var_0_6.GetDirection(arg_57_0)
	return arg_57_0._dir
end

function var_0_6.GetTemplate(arg_58_0)
	return arg_58_0._tmpData
end

function var_0_6.GetTemplateID(arg_59_0)
	return arg_59_0._tmpData.id
end

function var_0_6.GetUnitType(arg_60_0)
	return arg_60_0._type
end

function var_0_6.GetHPRate(arg_61_0)
	return arg_61_0._currentHP / arg_61_0:GetMaxHP()
end

function var_0_6.GetBoxSize(arg_62_0)
	return arg_62_0._cldComponent:GetCldBoxSize()
end

function var_0_6.GetSpeedRatio(arg_63_0)
	return var_0_4.GetSpeedRatio(arg_63_0:GetSpeedExemptKey(), arg_63_0._IFF)
end

function var_0_6.GetSpeedExemptKey(arg_64_0)
	return arg_64_0._speedExemptKey
end

function var_0_6.IsPlayerAircraft(arg_65_0)
	return arg_65_0._isPlayerAircraft
end

function var_0_6.IsShowHPBar(arg_66_0)
	return false
end

function var_0_6.SetUnVisitable(arg_67_0)
	var_0_0.Battle.BattleAttr.UnVisitable(arg_67_0)
end

function var_0_6.SetVisitable(arg_68_0)
	var_0_0.Battle.BattleAttr.Visitable(arg_68_0)
end

function var_0_6.IsVisitable(arg_69_0)
	return var_0_0.Battle.BattleAttr.IsVisitable(arg_69_0)
end

function var_0_6.OverrideDeadFX(arg_70_0, arg_70_1)
	arg_70_0._deadFX = arg_70_1
end

function var_0_6.GetDeadFX(arg_71_0)
	return arg_71_0._deadFX
end

var_0_6.AIRCRAFT_TRIGGER = {
	var_0_0.Battle.BattleConst.BuffEffectType.ON_BULLET_COLLIDE_BEFORE,
	var_0_0.Battle.BattleConst.BuffEffectType.ON_BOMB_BULLET_BANG,
	var_0_0.Battle.BattleConst.BuffEffectType.ON_TORPEDO_BULLET_BANG
}

function var_0_6.TriggerBuff(arg_72_0, arg_72_1, arg_72_2)
	if table.contains(var_0_6.AIRCRAFT_TRIGGER, arg_72_1) and arg_72_0._motherUnit and arg_72_0._motherUnit:IsAlive() then
		arg_72_0._motherUnit:TriggerBuff(arg_72_1, arg_72_2)
	end
end

function var_0_6.AddCreateTimer(arg_73_0, arg_73_1, arg_73_2)
	arg_73_0._currentState = arg_73_0.STATE_CREATE
	arg_73_0._speedDir = arg_73_1
	arg_73_2 = arg_73_2 or 1.5

	local function var_73_0()
		arg_73_0._currentState = arg_73_0.STATE_ATTACK
		arg_73_0._speedDir = Vector3(arg_73_0._dir, 0, 0)

		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_73_0._createTimer)

		arg_73_0._createTimer = nil
	end

	arg_73_0._createTimer = pg.TimeMgr.GetInstance():AddBattleTimer("AddCreateTimer", 0, arg_73_2, var_73_0)
end

function var_0_6.Dispose(arg_75_0)
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_75_0)
end

function var_0_6.InitCldComponent(arg_76_0)
	local var_76_0 = arg_76_0:GetTemplate().cld_box
	local var_76_1 = arg_76_0:GetTemplate().cld_offset
	local var_76_2 = var_76_1[1]

	if arg_76_0:GetDirection() == var_0_0.Battle.BattleConst.UnitDir.LEFT then
		var_76_2 = var_76_2 * -1
	end

	arg_76_0._cldComponent = var_0_0.Battle.BattleCubeCldComponent.New(var_76_0[1], var_76_0[2], var_76_0[3], var_76_2, var_76_1[3])

	local var_76_3 = {
		type = var_0_2.CldType.AIRCRAFT,
		IFF = arg_76_0:GetIFF(),
		UID = arg_76_0:GetUniqueID()
	}

	arg_76_0._cldComponent:SetCldData(var_76_3)
end

function var_0_6.GetCldBox(arg_77_0)
	return arg_77_0._cldComponent:GetCldBox(arg_77_0:GetPosition())
end

function var_0_6.GetCldData(arg_78_0)
	return arg_78_0._cldComponent:GetCldData()
end

function var_0_6.AddBuff(arg_79_0)
	return
end

function var_0_6.SetBuffStack(arg_80_0)
	return
end

function var_0_6.RemoveBuff(arg_81_0)
	return
end

function var_0_6.CloakExpose(arg_82_0)
	return
end

function var_0_6.GetCurrentOxyState(arg_83_0)
	return nil
end

function var_0_6.RemoveRemoteBoundBone(arg_84_0)
	return
end

function var_0_6.SetRemoteBoundBone(arg_85_0)
	return
end

function var_0_6.GetRemoteBoundBone(arg_86_0)
	return
end

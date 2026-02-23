ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleUnitEvent
local var_0_3 = var_0_0.Battle.BattleAttr
local var_0_4 = class("BattlePointHitWeaponUnit", var_0_0.Battle.BattleWeaponUnit)

var_0_0.Battle.BattlePointHitWeaponUnit = var_0_4
var_0_4.__name = "BattlePointHitWeaponUnit"

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)

	var_0_4._strikePoint = nil
	var_0_4._strikeRequire = 1
	var_0_4._strikeMode = false
end

function var_0_4.DispatchBlink(arg_2_0, arg_2_1)
	local var_2_0 = {
		callbackFunc = arg_2_1,
		timeScale = var_0_0.Battle.BattleConfig.FOCUS_MAP_RATE
	}
	local var_2_1 = var_0_0.Event.New(var_0_2.CHARGE_WEAPON_FINISH, var_2_0)

	arg_2_0:DispatchEvent(var_2_1)
end

function var_0_4.RemoveAllLock(arg_3_0)
	arg_3_0._lockList = {}
end

function var_0_4.createMajorEmitter(arg_4_0, arg_4_1, arg_4_2)
	local function var_4_0(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
		local var_5_0
		local var_5_1
		local var_5_2 = arg_4_0._emitBulletIDList[arg_4_2]

		if arg_4_0._strikePoint then
			var_5_1 = arg_4_0._strikePoint
			var_5_0 = arg_4_0:SpawnPointBullet(var_5_2, arg_4_0._strikePoint)
		else
			local var_5_3 = arg_4_0._lockList[1]

			var_5_0 = arg_4_0:Spawn(var_5_2, var_5_3, arg_4_0.INTERNAL)
			var_5_1 = var_5_3:GetBeenAimedPosition() or var_5_3:GetPosition()
		end

		var_5_0:SetOffsetPriority(arg_5_3)
		var_5_0:SetShiftInfo(arg_5_0, arg_5_1)
		var_5_0:SetRotateInfo(var_5_1, 0, 0)
		var_0_0.Battle.BattleVariable.AddExempt(var_5_0:GetSpeedExemptKey(), var_5_0:GetIFF(), var_0_0.Battle.BattleConfig.SPEED_FACTOR_FOCUS_CHARACTER)
		arg_4_0:DispatchBulletEvent(var_5_0)
	end

	local function var_4_1()
		arg_4_0._strikePoint = nil

		arg_4_0:RemoveAllLock()
	end

	var_0_4.super.createMajorEmitter(arg_4_0, arg_4_1, arg_4_2, var_0_4.EMITTER_NORMAL, var_4_0, var_4_1)
end

function var_0_4.SetPlayerChargeWeaponVO(arg_7_0, arg_7_1)
	arg_7_0._playerChargeWeaponVo = arg_7_1
end

function var_0_4.Charge(arg_8_0)
	arg_8_0._currentState = arg_8_0.STATE_PRECAST
	arg_8_0._lockList = {}

	local var_8_0 = {}
	local var_8_1 = var_0_0.Event.New(var_0_2.POINT_HIT_CHARGE, var_8_0)

	arg_8_0:DispatchEvent(var_8_1)

	arg_8_0._strikeMode = true
end

function var_0_4.CancelCharge(arg_9_0)
	if arg_9_0._currentState ~= arg_9_0.STATE_PRECAST then
		return
	end

	arg_9_0:RemoveAllLock()

	arg_9_0._currentState = arg_9_0.STATE_READY

	local var_9_0 = {}
	local var_9_1 = var_0_0.Event.New(var_0_2.POINT_HIT_CANCEL, var_9_0)

	arg_9_0:DispatchEvent(var_9_1)

	arg_9_0._strikeMode = nil
end

function var_0_4.QuickTag(arg_10_0)
	arg_10_0._currentState = arg_10_0.STATE_PRECAST
	arg_10_0._lockList = {}

	arg_10_0:updateMovementInfo()

	local var_10_0 = arg_10_0:Tracking()

	arg_10_0._lockList[#arg_10_0._lockList + 1] = var_10_0
end

function var_0_4.CancelQuickTag(arg_11_0)
	arg_11_0._currentState = arg_11_0.STATE_READY
	arg_11_0._lockList = {}
end

function var_0_4.Update(arg_12_0, arg_12_1)
	arg_12_0:UpdateReload()
end

function var_0_4.Fire(arg_13_0, arg_13_1)
	if arg_13_0._host:IsCease() then
		arg_13_0:CancelQuickTag()

		return false
	end

	if arg_13_0._currentState ~= arg_13_0.STATE_PRECAST then
		return
	end

	arg_13_0._strikePoint = arg_13_1

	arg_13_0._host:CloakExpose(var_0_0.Battle.BattleConfig.CLOAK_BOMBARD_BASE_EXPOSE)
	arg_13_0._host:BombardExpose()

	arg_13_0._strikeMode = false

	return var_0_4.super.Fire(arg_13_0)
end

function var_0_4.DoAttack(arg_14_0, arg_14_1)
	var_0_0.Battle.PlayBattleSFX(arg_14_0._tmpData.fire_sfx)

	local var_14_0 = var_0_0.Event.New(var_0_2.CHARGE_WEAPON_FIRE, {
		weapon = arg_14_0
	})

	arg_14_0:DispatchEvent(var_14_0)
	arg_14_0:cacheBulletID()
	arg_14_0:TriggerBuffOnSteday()

	for iter_14_0, iter_14_1 in ipairs(arg_14_0._majorEmitterList) do
		iter_14_1:Ready()
	end

	for iter_14_2, iter_14_3 in ipairs(arg_14_0._majorEmitterList) do
		iter_14_3:Fire(arg_14_1, arg_14_0:GetDirection(), arg_14_0:GetAttackAngle())
		iter_14_3:SetTimeScale(false)
	end

	arg_14_0:DispatchEvent(var_0_0.Event.New(var_0_2.MANUAL_WEAPON_FIRE, {}))
	arg_14_0:TriggerBuffOnFire()
	var_0_0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[var_0_1.ShakeType.FIRE])
end

function var_0_4.TriggerBuffOnReady(arg_15_0)
	if arg_15_0._tmpData.type == var_0_1.EquipmentType.MANUAL_MISSILE then
		arg_15_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_MANUAL_MISSILE_READY, {})
	else
		arg_15_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_CHARGE_READY, {})
	end
end

function var_0_4.Spawn(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0

	if arg_16_2 == nil then
		arg_16_0:updateMovementInfo()

		arg_16_2 = arg_16_0:TrackingRandom(arg_16_0:GetFilteredList())

		if arg_16_2 == nil then
			var_16_0 = Vector3.zero
		else
			var_16_0 = arg_16_2:GetBeenAimedPosition() or arg_16_2:GetPosition()
		end
	else
		var_16_0 = arg_16_2:GetBeenAimedPosition() or arg_16_2:GetPosition()
	end

	local var_16_1 = arg_16_0._dataProxy:CreateBulletUnit(arg_16_1, arg_16_0._host, arg_16_0, var_16_0)

	arg_16_0:setBulletSkin(var_16_1, arg_16_1)
	arg_16_0:TriggerBuffWhenSpawn(var_16_1)

	if arg_16_3 == arg_16_0.INTERNAL then
		local var_16_2 = arg_16_0._host:GetAttrByName("initialEnhancement")

		var_16_1:SetDamageEnhance(1 + var_16_2)
		arg_16_0:TriggerBuffWhenSpawn(var_16_1, var_0_1.BuffEffectType.ON_INTERNAL_BULLET_CREATE)
	end

	return var_16_1
end

function var_0_4.SpawnPointBullet(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0._dataProxy:CreateBulletUnit(arg_17_1, arg_17_0._host, arg_17_0, arg_17_2)

	arg_17_0:TriggerBuffWhenSpawn(var_17_0, var_0_1.BuffEffectType.ON_MANUAL_BULLET_CREATE)
	arg_17_0:setBulletSkin(var_17_0, arg_17_1)

	local var_17_1 = arg_17_0._host:GetAttrByName("initialEnhancement") + arg_17_0._host:GetAttrByName("manualEnhancement")

	var_17_0:SetDamageEnhance(var_0_0.Battle.BattleConfig.ChargeWeaponConfig.Enhance + var_17_1)
	arg_17_0:TriggerBuffWhenSpawn(var_17_0)
	arg_17_0:TriggerBuffWhenSpawn(var_17_0, var_0_1.BuffEffectType.ON_INTERNAL_BULLET_CREATE)

	return var_17_0
end

function var_0_4.TriggerBuffOnFire(arg_18_0)
	if arg_18_0._tmpData.type == var_0_1.EquipmentType.MANUAL_MISSILE then
		arg_18_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_MANUAL_MISSILE_FIRE, {})
	else
		arg_18_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_CHARGE_FIRE, {})
	end
end

function var_0_4.InitialCD(arg_19_0)
	var_0_4.super.InitialCD(arg_19_0)
	arg_19_0._playerChargeWeaponVo:InitialDeduct(arg_19_0)
	arg_19_0._playerChargeWeaponVo:Charge(arg_19_0)
end

function var_0_4.EnterCoolDown(arg_20_0)
	var_0_4.super.EnterCoolDown(arg_20_0)
	arg_20_0._playerChargeWeaponVo:Charge(arg_20_0)
end

function var_0_4.OverHeat(arg_21_0)
	var_0_4.super.OverHeat(arg_21_0)
	arg_21_0._playerChargeWeaponVo:Deduct(arg_21_0)
end

function var_0_4.GetMinAngle(arg_22_0)
	return arg_22_0:GetAttackAngle()
end

function var_0_4.GetLockList(arg_23_0)
	return arg_23_0._lockList
end

function var_0_4.GetFilteredList(arg_24_0)
	local var_24_0 = var_0_4.super.GetFilteredList(arg_24_0)

	return (arg_24_0:filterEnemyUnitType(var_24_0))
end

function var_0_4.filterEnemyUnitType(arg_25_0, arg_25_1)
	local var_25_0 = {}
	local var_25_1 = {}
	local var_25_2 = -9999

	for iter_25_0, iter_25_1 in ipairs(arg_25_1) do
		local var_25_3 = iter_25_1:GetTargetedPriority()

		if var_25_3 == nil then
			var_25_1[#var_25_1 + 1] = iter_25_1
		elseif var_25_2 < var_25_3 then
			var_25_2 = var_25_3
			var_25_0 = {}
			var_25_0[#var_25_0 + 1] = iter_25_1
		elseif var_25_2 == var_25_3 then
			var_25_0[#var_25_0 + 1] = iter_25_1
		end
	end

	for iter_25_2, iter_25_3 in ipairs(var_25_1) do
		var_25_0[#var_25_0 + 1] = iter_25_3
	end

	return var_25_0
end

function var_0_4.handleCoolDown(arg_26_0)
	arg_26_0._currentState = arg_26_0.STATE_READY

	arg_26_0._playerChargeWeaponVo:Plus(arg_26_0)
	arg_26_0:DispatchEvent(var_0_0.Event.New(var_0_2.MANUAL_WEAPON_READY, {}))
	arg_26_0:TriggerBuffOnReady()

	arg_26_0._CDstartTime = nil
	arg_26_0._reloadBoostList = {}
end

function var_0_4.FlushReloadMax(arg_27_0, arg_27_1)
	if var_0_4.super.FlushReloadMax(arg_27_0, arg_27_1) then
		return true
	end

	arg_27_0._playerChargeWeaponVo:RefreshReloadingBar()
end

function var_0_4.FlushReloadRequire(arg_28_0)
	if var_0_4.super.FlushReloadRequire(arg_28_0) then
		return true
	end

	arg_28_0._playerChargeWeaponVo:RefreshReloadingBar()
end

function var_0_4.QuickCoolDown(arg_29_0)
	if arg_29_0._currentState == arg_29_0.STATE_OVER_HEAT then
		arg_29_0._currentState = arg_29_0.STATE_READY

		arg_29_0._playerChargeWeaponVo:InstantCoolDown(arg_29_0)
		arg_29_0:DispatchEvent(var_0_0.Event.New(var_0_2.MANUAL_WEAPON_INSTANT_READY, {}))

		arg_29_0._CDstartTime = nil
		arg_29_0._reloadBoostList = {}
	end
end

function var_0_4.ReloadBoost(arg_30_0, arg_30_1)
	local var_30_0 = 0

	for iter_30_0, iter_30_1 in ipairs(arg_30_0._reloadBoostList) do
		var_30_0 = var_30_0 + iter_30_1
	end

	local var_30_1 = var_30_0 + arg_30_1
	local var_30_2 = pg.TimeMgr.GetInstance():GetCombatTime() - arg_30_0._jammingTime - arg_30_0._CDstartTime
	local var_30_3

	if var_30_1 < 0 then
		var_30_3 = math.max(var_30_1, (arg_30_0._reloadRequire - var_30_2) * -1)
	else
		var_30_3 = math.min(var_30_1, var_30_2)
	end

	fixValue = var_30_3 - var_30_1 + arg_30_1

	table.insert(arg_30_0._reloadBoostList, fixValue)
end

function var_0_4.AppendReloadBoost(arg_31_0, arg_31_1)
	if arg_31_0._currentState == arg_31_0.STATE_OVER_HEAT then
		arg_31_0._playerChargeWeaponVo:ReloadBoost(arg_31_0, arg_31_1)
	end
end

function var_0_4.IsStrikeMode(arg_32_0)
	return arg_32_0._strikeMode
end

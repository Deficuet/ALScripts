ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleFormulas
local var_0_3 = var_0_0.Battle.BattleUnitEvent
local var_0_4 = var_0_0.Battle.BattleDataFunction
local var_0_5 = var_0_0.Battle.BattleAttr

var_0_0.Battle.BattleAllInStrike = class("BattleAllInStrike")

local var_0_6 = var_0_0.Battle.BattleAllInStrike

var_0_6.__name = "BattleAllInStrike"
var_0_6.EMITTER_NORMAL = "BattleBulletEmitter"
var_0_6.EMITTER_SHOTGUN = "BattleShotgunEmitter"
var_0_6.STATE_DISABLE = "DISABLE"
var_0_6.STATE_READY = "READY"
var_0_6.STATE_PRECAST = "PRECAST"
var_0_6.STATE_PRECAST_FINISH = "STATE_PRECAST_FINISH"
var_0_6.STATE_ATTACK = "ATTACK"
var_0_6.STATE_OVER_HEAT = "OVER_HEAT"

function var_0_6.Ctor(arg_1_0, arg_1_1)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_1_0)

	arg_1_0._skill = var_0_0.Battle.BattleSkillUnit.New(arg_1_1)
	arg_1_0._skillID = arg_1_1
	arg_1_0._reloadFacotrList = {}
	arg_1_0._reloadBoostList = {}
	arg_1_0._jammingTime = 0
end

function var_0_6.Update(arg_2_0)
	arg_2_0:UpdateReload()
end

function var_0_6.UpdateReload(arg_3_0)
	if arg_3_0._CDstartTime and not arg_3_0._jammingStartTime then
		if arg_3_0:GetReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then
			arg_3_0:handleCoolDown()
		else
			return
		end
	end
end

function var_0_6.Clear(arg_4_0)
	arg_4_0._skill:Clear()
end

function var_0_6.Dispose(arg_5_0)
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_5_0)
end

function var_0_6.SetHost(arg_6_0, arg_6_1)
	arg_6_0._host = arg_6_1

	local var_6_0

	arg_6_0._hiveList = arg_6_1:GetHiveList()

	for iter_6_0, iter_6_1 in ipairs(arg_6_0._hiveList) do
		local var_6_1 = iter_6_1:GetSkinID()

		if var_6_1 then
			local var_6_2, var_6_3, var_6_4, var_6_5 = var_0_4.GetEquipSkin(var_6_1)

			if var_6_5 then
				var_6_0 = var_6_5

				break
			end
		end
	end

	if var_6_0 and var_6_0 ~= "" then
		local var_6_6 = arg_6_0._skill:GetSkillEffectList()

		for iter_6_2, iter_6_3 in ipairs(var_6_6) do
			if iter_6_3.__name == var_0_0.Battle.BattleSkillFire.__name then
				iter_6_3:SetWeaponSkin(var_6_0)
			end
		end
	end

	arg_6_0:FlushTotalReload()
	arg_6_0:FlushReloadMax(1)
end

function var_0_6.FlushTotalReload(arg_7_0)
	arg_7_0._totalReload = var_0_2.CaclulateAirAssistReloadMax(arg_7_0._hiveList)
end

function var_0_6.FlushReloadMax(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0._totalReload

	arg_8_1 = arg_8_1 or 1
	arg_8_0._reloadMax = var_8_0 * arg_8_1

	if not arg_8_0._CDstartTime or arg_8_0._reloadRequire == 0 then
		return true
	end

	local var_8_1 = var_0_5.GetCurrent(arg_8_0._host, "loadSpeed")

	arg_8_0._reloadRequire = var_0_0.Battle.BattleWeaponUnit.FlushRequireByInverse(arg_8_0, var_8_1)

	arg_8_0._allInWeaponVo:RefreshReloadingBar()
end

function var_0_6.AppendReloadFactor(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0._reloadFacotrList[arg_9_1] = arg_9_2
end

function var_0_6.RemoveReloadFactor(arg_10_0, arg_10_1)
	if arg_10_0._reloadFacotrList[arg_10_1] then
		arg_10_0._reloadFacotrList[arg_10_1] = nil
	end
end

function var_0_6.GetReloadFactorList(arg_11_0)
	return arg_11_0._reloadFacotrList
end

function var_0_6.SetAllInWeaponVO(arg_12_0, arg_12_1)
	arg_12_0._allInWeaponVo = arg_12_1
	arg_12_0._currentState = var_0_6.STATE_READY
end

function var_0_6.GetCurrentState(arg_13_0)
	return arg_13_0._currentState
end

function var_0_6.GetHost(arg_14_0)
	return arg_14_0._host
end

function var_0_6.GetType(arg_15_0)
	return var_0_1.EquipmentType.AIR_ASSIST
end

function var_0_6.Fire(arg_16_0)
	if arg_16_0._host:IsCease() then
		return false
	else
		arg_16_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_ALL_IN_STRIKE_STEADY, {})

		for iter_16_0, iter_16_1 in ipairs(arg_16_0._hiveList) do
			iter_16_1:SingleFire()
		end

		arg_16_0._skill:Cast(arg_16_0._host)
		arg_16_0._host:StrikeExpose()
		arg_16_0._host:StateChange(var_0_0.Battle.UnitState.STATE_ATTACK, "attack")
		arg_16_0:DispatchEvent(var_0_0.Event.New(var_0_3.MANUAL_WEAPON_FIRE, {}))
		arg_16_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_ALL_IN_STRIKE, {})
	end

	return true
end

function var_0_6.TriggerBuffOnReady(arg_17_0)
	arg_17_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_AIR_ASSIST_READY, {})
end

function var_0_6.SingleFire(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0._hiveList) do
		iter_18_1:SingleFire()
	end

	arg_18_0._skill:Cast(arg_18_0._host)
	arg_18_0._host:StrikeExpose()
	arg_18_0._host:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_ALL_IN_STRIKE, {})
end

function var_0_6.GetReloadTime(arg_19_0)
	local var_19_0 = var_0_5.GetCurrent(arg_19_0._host, "loadSpeed")

	if arg_19_0._reloadMax ~= arg_19_0._cacheReloadMax or var_19_0 ~= arg_19_0._cacheHostReload then
		arg_19_0._cacheReloadMax = arg_19_0._reloadMax
		arg_19_0._cacheHostReload = var_19_0
		arg_19_0._cacheReloadTime = var_0_2.CalculateReloadTime(arg_19_0._reloadMax, var_0_5.GetCurrent(arg_19_0._host, "loadSpeed"))
	end

	return arg_19_0._cacheReloadTime
end

function var_0_6.GetReloadTimeByRate(arg_20_0, arg_20_1)
	local var_20_0 = var_0_5.GetCurrent(arg_20_0._host, "loadSpeed")
	local var_20_1 = arg_20_0._cacheReloadMax * arg_20_1

	return (var_0_2.CalculateReloadTime(var_20_1, var_20_0))
end

function var_0_6.SetModifyInitialCD(arg_21_0)
	arg_21_0._modInitCD = true
end

function var_0_6.GetModifyInitialCD(arg_22_0)
	return arg_22_0._modInitCD
end

function var_0_6.InitialCD(arg_23_0)
	arg_23_0:AddCDTimer(arg_23_0:GetReloadTime())
	arg_23_0._allInWeaponVo:InitialDeduct(arg_23_0)
	arg_23_0._allInWeaponVo:Charge(arg_23_0)
end

function var_0_6.EnterCoolDown(arg_24_0)
	arg_24_0:AddCDTimer(arg_24_0:GetReloadTime())
	arg_24_0._allInWeaponVo:Charge(arg_24_0)
end

function var_0_6.OverHeat(arg_25_0)
	arg_25_0._currentState = arg_25_0.STATE_OVER_HEAT

	arg_25_0._allInWeaponVo:Deduct(arg_25_0)
end

function var_0_6.AddCDTimer(arg_26_0, arg_26_1)
	arg_26_0._currentState = var_0_6.STATE_OVER_HEAT
	arg_26_0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	arg_26_0._reloadRequire = arg_26_1
end

function var_0_6.GetCDStartTimeStamp(arg_27_0)
	return arg_27_0._CDstartTime
end

function var_0_6.handleCoolDown(arg_28_0)
	arg_28_0._currentState = var_0_6.STATE_READY

	arg_28_0._allInWeaponVo:Plus(arg_28_0)
	arg_28_0:DispatchEvent(var_0_0.Event.New(var_0_3.MANUAL_WEAPON_READY, {}))
	arg_28_0:TriggerBuffOnReady()

	arg_28_0._CDstartTime = nil
	arg_28_0._jammingTime = 0
	arg_28_0._reloadBoostList = {}
end

function var_0_6.FlushReloadRequire(arg_29_0)
	if not arg_29_0._CDstartTime or arg_29_0._reloadRequire == 0 then
		return true
	end

	local var_29_0 = var_0_2.CaclulateReloadAttr(arg_29_0._reloadMax, arg_29_0._reloadRequire)

	arg_29_0._reloadRequire = var_0_0.Battle.BattleWeaponUnit.FlushRequireByInverse(arg_29_0, var_29_0)

	arg_29_0._allInWeaponVo:RefreshReloadingBar()
end

function var_0_6.QuickCoolDown(arg_30_0)
	if arg_30_0._currentState == arg_30_0.STATE_OVER_HEAT then
		arg_30_0._currentState = var_0_6.STATE_READY

		arg_30_0._allInWeaponVo:InstantCoolDown(arg_30_0)
		arg_30_0:DispatchEvent(var_0_0.Event.New(var_0_3.MANUAL_WEAPON_INSTANT_READY, {}))

		arg_30_0._CDstartTime = nil
		arg_30_0._reloadBoostList = {}
	end
end

function var_0_6.ReloadBoost(arg_31_0, arg_31_1)
	local var_31_0 = 0

	for iter_31_0, iter_31_1 in ipairs(arg_31_0._reloadBoostList) do
		var_31_0 = var_31_0 + iter_31_1
	end

	local var_31_1 = var_31_0 + arg_31_1
	local var_31_2 = pg.TimeMgr.GetInstance():GetCombatTime() - arg_31_0._jammingTime - arg_31_0._CDstartTime
	local var_31_3

	if var_31_1 < 0 then
		var_31_3 = math.max(var_31_1, (arg_31_0._reloadRequire - var_31_2) * -1)
	else
		var_31_3 = math.min(var_31_1, var_31_2)
	end

	fixValue = var_31_3 - var_31_1 + arg_31_1

	table.insert(arg_31_0._reloadBoostList, fixValue)
end

function var_0_6.AppendReloadBoost(arg_32_0, arg_32_1)
	if arg_32_0._currentState == arg_32_0.STATE_OVER_HEAT then
		arg_32_0._allInWeaponVo:ReloadBoost(arg_32_0, arg_32_1)
	end
end

function var_0_6.GetReloadFinishTimeStamp(arg_33_0)
	local var_33_0 = 0

	for iter_33_0, iter_33_1 in ipairs(arg_33_0._reloadBoostList) do
		var_33_0 = var_33_0 + iter_33_1
	end

	return arg_33_0._reloadRequire + arg_33_0._CDstartTime + arg_33_0._jammingTime + var_33_0
end

function var_0_6.StartJamming(arg_34_0)
	arg_34_0._jammingStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
end

function var_0_6.JammingEliminate(arg_35_0)
	if not arg_35_0._jammingStartTime then
		return
	end

	arg_35_0._jammingTime = pg.TimeMgr.GetInstance():GetCombatTime() - arg_35_0._jammingStartTime
	arg_35_0._jammingStartTime = nil
end

function var_0_6.CLSBullet(arg_36_0)
	local var_36_0 = arg_36_0._host:GetIFF() * -1

	var_0_0.Battle.BattleDataProxy.GetInstance():CLSBullet(var_36_0, true)
end

function var_0_6.DispatchBlink(arg_37_0, arg_37_1)
	local var_37_0 = {
		callbackFunc = arg_37_1,
		timeScale = var_0_0.Battle.BattleConfig.FOCUS_MAP_RATE
	}
	local var_37_1 = var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.CHARGE_WEAPON_FINISH, var_37_0)

	arg_37_0:DispatchEvent(var_37_1)
end

function var_0_6.GetReloadRate(arg_38_0)
	if arg_38_0._currentState == arg_38_0.STATE_READY then
		return 0
	elseif arg_38_0._CDstartTime then
		return (arg_38_0:GetReloadFinishTimeStamp() - pg.TimeMgr.GetInstance():GetCombatTime()) / arg_38_0._reloadRequire
	else
		return 1
	end
end

function var_0_6.GetDamageSUM(arg_39_0)
	local var_39_0 = 0
	local var_39_1 = 0

	for iter_39_0, iter_39_1 in ipairs(arg_39_0._hiveList) do
		for iter_39_2, iter_39_3 in ipairs(iter_39_1:GetATKAircraftList()) do
			local var_39_2 = iter_39_3:GetWeapon()

			for iter_39_4, iter_39_5 in ipairs(var_39_2) do
				var_39_0 = var_39_0 + iter_39_5:GetDamageSUM()
			end
		end
	end

	local var_39_3 = arg_39_0._skill:GetSkillEffectList()

	for iter_39_6, iter_39_7 in ipairs(var_39_3) do
		local var_39_4 = iter_39_7:GetDamageSum()

		if var_39_4 then
			var_39_1 = var_39_1 + var_39_4
		end
	end

	return var_39_0, var_39_1
end

function var_0_6.GetStrikeSkillID(arg_40_0)
	return arg_40_0._skillID
end

ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleEvent
local var_0_2 = var_0_0.Battle.BattleFormulas
local var_0_3 = var_0_0.Battle.BattleConst
local var_0_4 = var_0_0.Battle.BattleConfig
local var_0_5 = var_0_0.Battle.BattleDataFunction
local var_0_6 = var_0_0.Battle.BattleAttr
local var_0_7 = var_0_0.Battle.BattleVariable
local var_0_8 = class("BattleFleetAntiAirUnit")

var_0_0.Battle.BattleFleetAntiAirUnit = var_0_8
var_0_8.__name = "BattleFleetAntiAirUnit"
var_0_8.STATE_DISABLE = "DISABLE"
var_0_8.STATE_READY = "READY"
var_0_8.STATE_PRECAST = "PRECAST"
var_0_8.STATE_PRECAST_FINISH = "STATE_PRECAST_FINISH"
var_0_8.STATE_ATTACK = "ATTACK"
var_0_8.STATE_OVER_HEAT = "OVER_HEAT"

function var_0_8.Ctor(arg_1_0)
	arg_1_0:init()
end

function var_0_8.init(arg_2_0)
	arg_2_0._crewUnitList = {}
	arg_2_0._hitFXResIDList = {}
	arg_2_0._currentState = var_0_8.STATE_DISABLE
	arg_2_0._dataProxy = var_0_0.Battle.BattleDataProxy.GetInstance()
	arg_2_0._range = 0
end

function var_0_8.AppendCrewUnit(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1:GetFleetAntiAirList()

	if #var_3_0 > 0 then
		arg_3_0._currentState = var_0_8.STATE_READY
		arg_3_0._crewUnitList[arg_3_1] = var_3_0

		arg_3_0:flush()
	end
end

function var_0_8.RemoveCrewUnit(arg_4_0, arg_4_1)
	if arg_4_0._crewUnitList[arg_4_1] then
		arg_4_0._crewUnitList[arg_4_1] = nil

		arg_4_0:flush()
	end
end

function var_0_8.FlushCrewUnit(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:GetFleetAntiAirList()

	if #var_5_0 <= 0 then
		arg_5_0:RemoveCrewUnit(arg_5_1)
	elseif arg_5_0._crewUnitList[arg_5_1] == nil then
		arg_5_0:AppendCrewUnit(arg_5_1)
	else
		arg_5_0._crewUnitList[arg_5_1] = var_5_0

		arg_5_0:flush()
	end
end

function var_0_8.SwitchHost(arg_6_0, arg_6_1)
	arg_6_0._host = arg_6_1
end

function var_0_8.GetCrewUnitList(arg_7_0)
	return arg_7_0._crewUnitList
end

function var_0_8.GetRange(arg_8_0)
	return arg_8_0._range
end

function var_0_8.flush(arg_9_0)
	arg_9_0._range = 0
	arg_9_0._interval = 0
	arg_9_0._hitFXResIDList = {}
	arg_9_0._SFXID = nil

	local var_9_0 = {}
	local var_9_1 = 0
	local var_9_2 = 0

	for iter_9_0, iter_9_1 in pairs(arg_9_0._crewUnitList) do
		var_9_2 = var_9_2 + iter_9_0:GetAttrByName("extraAntiAirRange")

		for iter_9_2, iter_9_3 in ipairs(iter_9_1) do
			var_9_1 = var_9_1 + 1
			arg_9_0._interval = arg_9_0._interval + iter_9_3:GetReloadTime()

			local var_9_3 = iter_9_3:GetTemplateData()

			arg_9_0._range = arg_9_0._range + var_9_3.range
			arg_9_0._hitFXResIDList[iter_9_3] = var_0_0.Battle.BattleDataFunction.GetBulletTmpDataFromID(var_9_3.bullet_ID[1]).hit_fx
			arg_9_0._SFXID = var_9_3.fire_sfx
		end

		local var_9_4 = iter_9_0:GetAttrByName("antiAirPower")
		local var_9_5 = var_0_2.AntiAirPowerWeight(var_9_4)
		local var_9_6 = {
			weight = var_9_5,
			rst = iter_9_0
		}

		var_9_0[#var_9_0 + 1] = var_9_6
	end

	if var_9_1 == 0 then
		arg_9_0._currentState = var_0_8.STATE_DISABLE

		if arg_9_0._precastTimer then
			arg_9_0:RemovePrecastTimer()
		end
	else
		arg_9_0._range = arg_9_0._range / var_9_1 + var_9_2
		arg_9_0._interval = arg_9_0._interval / var_9_1 + 0.5
		arg_9_0._weightList, arg_9_0._totalWeight = var_0_2.GenerateWeightList(var_9_0)
	end
end

function var_0_8.Update(arg_10_0)
	if arg_10_0._currentState == var_0_8.STATE_READY then
		local var_10_0 = arg_10_0:FilterTarget()

		if #arg_10_0:FilterRange(var_10_0) > 0 then
			arg_10_0:AddPreCastTimer()
		end
	end
end

function var_0_8.AddPreCastTimer(arg_11_0)
	local function var_11_0()
		arg_11_0:RemovePrecastTimer()
		arg_11_0:Fire()
	end

	arg_11_0._currentState = var_0_8.STATE_PRECAST
	arg_11_0._precastTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", 0, var_0_4.AntiAirConfig.Precast_duration, var_11_0, true)
end

function var_0_8.RemovePrecastTimer(arg_13_0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_13_0._precastTimer)

	arg_13_0._precastTimer = nil
end

function var_0_8.FilterTarget(arg_14_0)
	local var_14_0 = arg_14_0._dataProxy:GetAircraftList()
	local var_14_1 = {}
	local var_14_2 = arg_14_0._host:GetIFF()
	local var_14_3 = 1

	for iter_14_0, iter_14_1 in pairs(var_14_0) do
		if iter_14_1:GetIFF() ~= var_14_2 and iter_14_1:IsVisitable() then
			var_14_1[var_14_3] = iter_14_1
			var_14_3 = var_14_3 + 1
		end
	end

	return var_14_1
end

function var_0_8.FilterRange(arg_15_0, arg_15_1)
	for iter_15_0 = #arg_15_1, 1, -1 do
		if arg_15_0:IsOutOfRange(arg_15_1[iter_15_0]) then
			table.remove(arg_15_1, iter_15_0)
		end
	end

	return arg_15_1
end

function var_0_8.IsOutOfRange(arg_16_0, arg_16_1)
	return arg_16_0:getTrackingHost():GetDistance(arg_16_1) > arg_16_0._range
end

function var_0_8.getTrackingHost(arg_17_0)
	return arg_17_0._host
end

function var_0_8.Fire(arg_18_0)
	if arg_18_0._currentState == arg_18_0.DISABLE then
		return
	end

	local function var_18_0(arg_19_0)
		local var_19_0 = {}
		local var_19_1 = arg_18_0._dataProxy:GetAircraftList()

		for iter_19_0, iter_19_1 in ipairs(arg_19_0) do
			if iter_19_1.Active then
				local var_19_2 = var_19_1[iter_19_1.UID]

				if var_19_2 and var_19_2:IsVisitable() then
					var_19_0[#var_19_0 + 1] = var_19_2
				end
			end
		end

		local var_19_3 = var_0_2.CalculateFleetAntiAirTotalDamage(arg_18_0)
		local var_19_4 = var_0_2.GetMeteoDamageRatio(#var_19_0)

		for iter_19_2, iter_19_3 in ipairs(var_19_0) do
			local var_19_5 = math.max(1, math.floor(var_19_3 * var_19_4[iter_19_2]))
			local var_19_6 = var_0_2.WeightListRandom(arg_18_0._weightList, arg_18_0._totalWeight)

			arg_18_0._dataProxy:HandleDirectDamage(iter_19_3, var_19_5, var_19_6)
		end
	end

	arg_18_0._dataProxy:SpawnColumnArea(var_0_3.AOEField.AIR, arg_18_0._host:GetIFF(), arg_18_0._host:GetPosition(), arg_18_0._range * 2, -1, var_18_0)
	arg_18_0:EnterCoolDown()

	for iter_18_0, iter_18_1 in pairs(arg_18_0._crewUnitList) do
		iter_18_0:TriggerBuff(var_0_0.Battle.BattleConst.BuffEffectType.ON_ANTIAIR_FIRE_NEAR, {})
		iter_18_0:PlayFX(iter_18_1[1]:GetTemplateData().fire_fx, true)
	end

	for iter_18_2, iter_18_3 in pairs(arg_18_0._hitFXResIDList) do
		local var_18_1 = (math.random() * 2 - 1) * arg_18_0._range
		local var_18_2 = (math.random() * 2 - 1) * arg_18_0._range
		local var_18_3 = arg_18_0._host:GetPosition() + Vector3(var_18_1, 10, var_18_2)
		local var_18_4 = var_0_0.Battle.BattleFXPool.GetInstance():GetFX(iter_18_3)

		pg.EffectMgr.GetInstance():PlayBattleEffect(var_18_4, var_18_3, true)
	end

	var_0_0.Battle.PlayBattleSFX(arg_18_0._SFXID)
end

function var_0_8.EnterCoolDown(arg_20_0)
	arg_20_0._currentState = arg_20_0.STATE_OVER_HEAT

	arg_20_0:AddCDTimer(arg_20_0._interval)
end

function var_0_8.GetCurrentState(arg_21_0)
	return arg_21_0._currentState
end

function var_0_8.AddCDTimer(arg_22_0, arg_22_1)
	local function var_22_0()
		arg_22_0._currentState = arg_22_0.STATE_READY

		arg_22_0:RemoveCDTimer()
	end

	arg_22_0:RemoveCDTimer()

	arg_22_0._cdTimer = pg.TimeMgr.GetInstance():AddBattleTimer("weaponTimer", -1, arg_22_1, var_22_0, true)
end

function var_0_8.RemoveCDTimer(arg_24_0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_24_0._cdTimer)

	arg_24_0._cdTimer = nil
end

function var_0_8.Dispose(arg_25_0)
	arg_25_0:RemoveCDTimer()
	arg_25_0:RemovePrecastTimer()

	arg_25_0._crewUnitList = nil
	arg_25_0._weightList = nil
	arg_25_0._hitFXResIDList = nil
	arg_25_0._dataProxy = nil
	arg_25_0._SFXID = nil
end

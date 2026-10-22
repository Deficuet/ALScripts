ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleDataFunction
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = class("BattleLaserUnit", var_0_0.Battle.BattleWeaponUnit)

var_0_0.Battle.BattleLaserUnit = var_0_4
var_0_4.__name = "BattleLaserUnit"
var_0_4.STATE_ATTACK = "FIB"
var_0_4.BEAM_STATE_READY = "beamStateReady"
var_0_4.BEAM_STATE_OVER_HEAT = "beamStateOverHeat"

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)
end

function var_0_4.Clear(arg_2_0)
	if arg_2_0._alertTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_2_0._alertTimer)
	end

	arg_2_0._alertTimer = nil

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._beamList) do
		if iter_2_1:GetBeamState() == iter_2_1.BEAM_STATE_ATTACK then
			arg_2_0._dataProxy:RemoveAreaOfEffect(iter_2_1:GetAoeData():GetUniqueID())
		end

		iter_2_1:ClearBeam()
	end

	var_0_4.super.Clear(arg_2_0)
end

function var_0_4.Update(arg_3_0)
	arg_3_0:UpdateReload()

	if arg_3_0._currentState == arg_3_0.STATE_READY then
		arg_3_0:updateMovementInfo()

		local var_3_0 = arg_3_0:Tracking()

		if var_3_0 then
			if arg_3_0._preCastInfo.time ~= nil then
				arg_3_0:PreCast(var_3_0)
			else
				arg_3_0._currentState = arg_3_0.STATE_PRECAST_FINISH
			end
		end
	end

	if arg_3_0._currentState == arg_3_0.STATE_PRECAST then
		-- block empty
	elseif arg_3_0._currentState == arg_3_0.STATE_PRECAST_FINISH then
		arg_3_0:updateMovementInfo()
		arg_3_0:Fire(arg_3_0:Tracking())
	end

	if arg_3_0._attackStartTime then
		arg_3_0:updateMovementInfo()
		arg_3_0:updateBeamList()
	end
end

function var_0_4.DoAttack(arg_4_0, arg_4_1)
	if arg_4_1 == nil or not arg_4_1:IsAlive() or arg_4_0:outOfFireRange(arg_4_1) then
		arg_4_1 = nil
	end

	arg_4_0._attackStartTime = pg.TimeMgr.GetInstance():GetCombatTime()

	if arg_4_0._tmpData.aim_type == var_0_2.WeaponAimType.AIM and arg_4_1 ~= nil then
		arg_4_0._aimPos = arg_4_1:GetBeenAimedPosition()
	end

	arg_4_0:cacheBulletID()

	for iter_4_0, iter_4_1 in ipairs(arg_4_0._beamList) do
		iter_4_1:ChangeBeamState(iter_4_1.BEAM_STATE_READY)

		if var_0_1.GetBarrageTmpDataFromID(iter_4_1:GetBeamInfoID()).first_delay == 0 then
			arg_4_0:createBeam(iter_4_1)
		end
	end

	arg_4_0._host:CloakExpose(arg_4_0._tmpData.expose)
	var_0_0.Battle.PlayBattleSFX(arg_4_0._tmpData.fire_sfx)
	arg_4_0:TriggerBuffOnFire()
	arg_4_0:CheckAndShake()
end

function var_0_4.SetTemplateData(arg_5_0, arg_5_1)
	var_0_4.super.SetTemplateData(arg_5_0, arg_5_1)
	arg_5_0:initBeamList()
end

function var_0_4.initBeamList(arg_6_0)
	local var_6_0 = arg_6_0._tmpData.barrage_ID
	local var_6_1 = arg_6_0._tmpData.bullet_ID

	arg_6_0._alertList = {}
	arg_6_0._beamList = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		arg_6_0._beamList[iter_6_0] = var_0_0.Battle.BattleBeamUnit.New(iter_6_1, var_6_0[iter_6_0])
	end
end

function var_0_4.updateBeamList(arg_7_0)
	local var_7_0 = pg.TimeMgr.GetInstance():GetCombatTime() - arg_7_0._attackStartTime
	local var_7_1 = 0

	for iter_7_0, iter_7_1 in ipairs(arg_7_0._beamList) do
		if iter_7_1:GetBeamState() == iter_7_1.BEAM_STATE_READY then
			if var_7_0 > var_0_1.GetBarrageTmpDataFromID(iter_7_1:GetBeamInfoID()).first_delay then
				arg_7_0:createBeam(iter_7_1)
			end
		elseif iter_7_1:GetBeamState() == iter_7_1.BEAM_STATE_ATTACK then
			if not iter_7_1:IsBeamActive() then
				iter_7_1:ClearBeam()

				var_7_1 = var_7_1 + 1
			else
				iter_7_1:UpdateBeamPos(arg_7_0._hostPos)
				iter_7_1:UpdateBeamAngle()

				if iter_7_1:CanDealDamage() then
					arg_7_0:doBeamDamage(iter_7_1)
				end
			end
		elseif iter_7_1:GetBeamState() == iter_7_1.BEAM_STATE_FINISH then
			var_7_1 = var_7_1 + 1
		end
	end

	if var_7_1 == #arg_7_0._beamList then
		arg_7_0:EnterCoolDown()
	end
end

function var_0_4.createBeam(arg_8_0, arg_8_1)
	local function var_8_0(arg_9_0)
		for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
			if iter_9_1.Active then
				local var_9_0 = arg_8_0._dataProxy:GetUnitList()[iter_9_1.UID]

				arg_8_1:AddCldUnit(var_9_0)
			end
		end
	end

	local function var_8_1(arg_10_0)
		if arg_10_0.Active then
			local var_10_0 = arg_8_0._dataProxy:GetUnitList()[arg_10_0.UID]

			arg_8_1:RemoveCldUnit(var_10_0)
		end
	end

	local var_8_2 = var_0_1.GetBarrageTmpDataFromID(arg_8_1:GetBeamInfoID())
	local var_8_3 = var_0_1.GetBulletTmpDataFromID(arg_8_1:GetBulletID())
	local var_8_4 = var_8_2.offset_x
	local var_8_5 = var_8_2.offset_z
	local var_8_6 = var_8_2.delta_offset_x
	local var_8_7 = var_8_2.delta_offset_z
	local var_8_8 = var_8_2.delay
	local var_8_9 = arg_8_0._host:GetIFF()
	local var_8_10 = Vector3(arg_8_0._hostPos.x + var_8_4, 0, arg_8_0._hostPos.z + var_8_5)
	local var_8_11 = arg_8_0._dataProxy:SpawnLastingCubeArea(var_0_2.AOEField.SURFACE, var_8_9, var_8_10, var_8_6, var_8_7, var_8_8, var_8_0, var_8_1, false, var_8_3.modle_ID)

	if arg_8_0._aimPos == nil then
		arg_8_1:SetAimAngle(0)
	elseif var_8_2.offset_prioritise then
		arg_8_1:SetAimPosition(arg_8_0._aimPos, var_8_10, var_8_9)
	else
		local var_8_12

		if var_8_9 == var_0_3.FRIENDLY_CODE then
			var_8_12 = math.rad2Deg * math.atan2(arg_8_0._aimPos.z - arg_8_0._hostPos.z, arg_8_0._aimPos.x - arg_8_0._hostPos.x)
		elseif var_8_9 == var_0_3.FOE_CODE then
			var_8_12 = math.rad2Deg * math.atan2(arg_8_0._hostPos.z - arg_8_0._aimPos.z, arg_8_0._hostPos.x - arg_8_0._aimPos.x)
		end

		arg_8_1:SetAimAngle(var_8_12)
	end

	if var_8_9 == var_0_3.FRIENDLY_CODE then
		var_8_11:SetAnchorPointAlignment(var_8_11.ALIGNMENT_LEFT)
	elseif var_8_9 == var_0_3.FOE_CODE then
		var_8_11:SetAnchorPointAlignment(var_8_11.ALIGNMENT_RIGHT)
	end

	var_8_11:SetFXStatic(true)
	arg_8_1:SetAoeData(var_8_11)
	arg_8_1:BeginFocus()
	arg_8_1:ChangeBeamState(arg_8_1.BEAM_STATE_ATTACK)
end

function var_0_4.doBeamDamage(arg_11_0, arg_11_1)
	arg_11_1:DealDamage()

	local var_11_0 = arg_11_0:Spawn(arg_11_1:GetBulletID())
	local var_11_1 = arg_11_1:GetCldUnitList()

	for iter_11_0, iter_11_1 in pairs(var_11_1) do
		if not iter_11_1:IsAlive() or arg_11_1:GetBeamExtraParam().mainFilter == true and iter_11_1:IsMainFleetUnit() then
			-- block empty
		else
			arg_11_0._dataProxy:HandleDamage(var_11_0, iter_11_1)

			local var_11_2, var_11_3 = var_0_0.Battle.BattleFXPool.GetInstance():GetFX(arg_11_1:GetFXID())

			pg.EffectMgr.GetInstance():PlayBattleEffect(var_11_2, var_11_3:Add(iter_11_1:GetPosition()), true)
			var_0_0.Battle.PlayBattleSFX(arg_11_1:GetSFXID())
		end
	end

	arg_11_0._dataProxy:RemoveBulletUnit(var_11_0:GetUniqueID())
end

function var_0_4.EnterCoolDown(arg_12_0)
	arg_12_0._attackStartTime = nil

	var_0_4.super.EnterCoolDown(arg_12_0)
end

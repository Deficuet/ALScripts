ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = var_0_0.Battle.BattleUnitEvent
local var_0_3 = var_0_0.Battle.BattleTargetChoise
local var_0_4 = class("BattleManualAAMissileUnit", var_0_0.Battle.BattleManualTorpedoUnit)

var_0_0.Battle.BattleManualAAMissileUnit = var_0_4
var_0_4.__name = "BattleManualAAMissileUnit"

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)

	arg_1_0._strikeMode = nil
	arg_1_0._strikeModeData = nil
end

function var_0_4.createMajorEmitter(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local function var_2_0(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
		local var_3_0 = arg_2_0._emitBulletIDList[arg_2_2]
		local var_3_1 = arg_2_0:Spawn(var_3_0, arg_3_4, var_0_4.INTERNAL)

		var_3_1:SetOffsetPriority(arg_3_3)
		var_3_1:SetShiftInfo(arg_3_0, arg_3_1)

		if arg_2_0._tmpData.aim_type == var_0_1.WeaponAimType.AIM and arg_3_4 ~= nil then
			var_3_1:SetRotateInfo(arg_3_4:GetBeenAimedPosition(), arg_2_0:GetBaseAngle(), arg_3_2)
		else
			var_3_1:SetRotateInfo(nil, arg_2_0:GetBaseAngle(), arg_3_2)
		end

		var_3_1:setTrackingTarget(arg_3_4)

		local var_3_2 = {}

		for iter_3_0, iter_3_1 in pairs(arg_2_0._strikeModeData) do
			var_3_2[iter_3_0] = iter_3_1
		end

		var_3_1:SetTrackingFXData(var_3_2)
		arg_2_0:DispatchBulletEvent(var_3_1)

		return var_3_1
	end

	local function var_2_1()
		for iter_4_0, iter_4_1 in ipairs(arg_2_0._majorEmitterList) do
			if iter_4_1:GetState() ~= iter_4_1.STATE_STOP then
				return
			end
		end

		arg_2_0:DispatchEvent(var_0_0.Event.New(var_0_2.MANUAL_WEAPON_FIRE, {}))

		arg_2_0._strikeModeData = nil
	end

	arg_2_3 = arg_2_3 or var_0_4.EMITTER_NORMAL

	local var_2_2 = var_0_0.Battle[arg_2_3].New(var_2_0, var_2_1, arg_2_1)

	arg_2_0._majorEmitterList[#arg_2_0._majorEmitterList + 1] = var_2_2

	return var_2_2
end

function var_0_4.IsStrikeMode(arg_5_0)
	return arg_5_0._strikeMode
end

function var_0_4.IsAttacking(arg_6_0)
	return arg_6_0._currentState == var_0_4.STATE_ATTACK
end

function var_0_4.Update(arg_7_0)
	arg_7_0:UpdateReload()

	if arg_7_0:IsStrikeMode() then
		arg_7_0:MarkTarget()
	end
end

function var_0_4.EnterStrikeMode(arg_8_0)
	arg_8_0._strikeMode = true
	arg_8_0._strikeModeData = {}
	arg_8_0._strikeModeData.fxName = arg_8_0._preCastInfo.fx

	arg_8_0:MarkTarget()
end

function var_0_4.MarkTarget(arg_9_0)
	local var_9_0 = arg_9_0._strikeModeData.aimingTarget

	arg_9_0:updateMovementInfo()

	local var_9_1 = arg_9_0:Tracking()

	if var_9_0 == var_9_1 then
		return
	end

	local var_9_2 = var_0_0.Battle.BattleState.GetInstance():GetSceneMediator()

	if arg_9_0._strikeModeData.aimingTarget and arg_9_0._strikeModeData.aimingFX then
		local var_9_3 = var_9_2:GetCharacter(var_9_0:GetUniqueID())

		if var_9_3 then
			var_9_3:RemoveFX(arg_9_0._strikeModeData.aimingFX)
		end
	end

	table.clear(arg_9_0._strikeModeData)

	if not var_9_1 then
		return
	end

	local var_9_4 = var_9_2:GetCharacter(var_9_1:GetUniqueID())
	local var_9_5

	if arg_9_0._preCastInfo.fx and #arg_9_0._preCastInfo.fx > 0 then
		var_9_5 = var_9_4:AddFX(arg_9_0._preCastInfo.fx)
	end

	arg_9_0._strikeModeData.aimingTarget = var_9_1
	arg_9_0._strikeModeData.aimingFX = var_9_5
end

function var_0_4.CancelStrikeMode(arg_10_0)
	if arg_10_0._strikeModeData.aimingTarget and arg_10_0._strikeModeData.aimingFX then
		local var_10_0 = var_0_0.Battle.BattleState.GetInstance():GetSceneMediator():GetCharacter(arg_10_0._strikeModeData.aimingTarget:GetUniqueID())

		if var_10_0 then
			var_10_0:RemoveFX(arg_10_0._strikeModeData.aimingFX)
		end
	end

	arg_10_0._strikeMode = nil
	arg_10_0._strikeModeData = nil
end

function var_0_4.Tracking(arg_11_0)
	return var_0_3.TargetWeightiest(arg_11_0, nil, arg_11_0:GetFilteredList())[1]
end

function var_0_4.Fire(arg_12_0)
	arg_12_0._strikeMode = nil

	var_0_0.Battle.BattleWeaponUnit.Fire(arg_12_0, arg_12_0._strikeModeData.aimingTarget)

	return true
end

function var_0_4.DoAttack(arg_13_0, arg_13_1, ...)
	if arg_13_1 == nil or not arg_13_1:IsAlive() or arg_13_0:outOfFireRange(arg_13_1) then
		arg_13_1 = nil

		if arg_13_0._strikeModeData.aimingTarget and arg_13_0._strikeModeData.aimingFX then
			local var_13_0 = var_0_0.Battle.BattleState.GetInstance():GetSceneMediator():GetCharacter(arg_13_0._strikeModeData.aimingTarget:GetUniqueID())

			if var_13_0 then
				var_13_0:RemoveFX(arg_13_0._strikeModeData.aimingFX)
			end
		end

		arg_13_0._strikeModeData.aimingTarget = nil
		arg_13_0._strikeModeData.aimingFX = nil
	end

	var_0_0.Battle.BattleWeaponUnit.DoAttack(arg_13_0, arg_13_1, ...)
end

function var_0_4.Prepar(arg_14_0)
	arg_14_0._currentState = arg_14_0.STATE_PRECAST

	arg_14_0:EnterStrikeMode()
end

function var_0_4.Cancel(arg_15_0)
	arg_15_0._currentState = arg_15_0.STATE_READY

	arg_15_0:CancelStrikeMode()
end

ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConfig
local var_0_2 = var_0_0.Battle.BattleConst.EquipmentType

var_0_0.Battle.BattleChargeWeaponVO = class("BattleChargeWeaponVO", var_0_0.Battle.BattlePlayerWeaponVO)
var_0_0.Battle.BattleChargeWeaponVO.__name = "BattleChargeWeaponVO"

local var_0_3 = var_0_0.Battle.BattleChargeWeaponVO

var_0_3.GCD = var_0_1.ChargeWeaponConfig.GCD

function var_0_3.Ctor(arg_1_0)
	var_0_3.super.Ctor(arg_1_0, var_0_3.GCD)
end

function var_0_3.AppendWeapon(arg_2_0, arg_2_1)
	var_0_3.super.AppendWeapon(arg_2_0, arg_2_1)
	arg_2_1:SetPlayerChargeWeaponVO(arg_2_0)
end

function var_0_3.GetCurrentWeaponIconIndex(arg_3_0)
	local var_3_0 = arg_3_0:GetHeadWeapon()

	if var_3_0 == nil then
		return 1
	else
		local var_3_1 = var_3_0:GetType()

		if var_3_1 == var_0_2.POINT_HIT_AND_LOCK then
			return 1
		elseif var_3_1 == var_0_2.MANUAL_MISSILE then
			return 10
		elseif var_3_1 == var_0_2.MANUAL_METEOR then
			return 11
		elseif var_3_1 == var_0_2.POINT_AIR_STRIKE then
			return 12
		end
	end
end

function var_0_3.Deduct(arg_4_0, arg_4_1)
	var_0_3.super.Deduct(arg_4_0, arg_4_1)
	arg_4_0:ResetFocus()
end

function var_0_3.ResetFocus(arg_5_0)
	if arg_5_0._focus then
		local var_5_0 = var_0_0.Battle.BattleCameraUtil.GetInstance()

		var_5_0:FocusCharacter(nil, var_0_1.CAST_CAM_ZOOM_OUT_DURATION_CANNON, var_0_1.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON)
		var_5_0:ZoomCamara(var_0_1.CAST_CAM_ZOOM_SIZE, var_0_1.CAST_CAM_OVERLOOK_SIZE, var_0_1.CAST_CAM_ZOOM_OUT_DURATION_CANNON)

		local var_5_1 = var_0_1.CAST_CAM_ZOOM_OUT_DURATION_CANNON + var_0_1.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON

		LeanTween.delayedCall(go(var_5_0:GetCamera()), var_5_1, System.Action(function()
			arg_5_0._focus = false

			var_5_0:BulletTime(var_0_1.SPEED_FACTOR_FOCUS_CHARACTER, nil)
			var_5_0:ZoomCamara(nil, nil, var_0_1.CAST_CAM_OVERLOOK_REVERT_DURATION)
		end))
	end
end

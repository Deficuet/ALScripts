ys = ys or {}

local var_0_0 = ys
local var_0_1 = singletonClass("BattlePlayerCharacterFactory", var_0_0.Battle.BattleCharacterFactory)

var_0_0.Battle.BattlePlayerCharacterFactory = var_0_1
var_0_1.__name = "BattlePlayerCharacterFactory"

function var_0_1.Ctor(arg_1_0)
	var_0_1.super.Ctor(arg_1_0)

	arg_1_0.HP_BAR_NAME = var_0_0.Battle.BattleHPBarManager.HP_BAR_FRIENDLY
	arg_1_0.CD_BAR_NAME = "CDBarContainer/chargeWeaponCD"
	arg_1_0.CHARGE_AREA_NAME = "ChargeAreaContainer/ChargeArea"
	arg_1_0.ARROW_BAR_NAME = "EnemyArrowContainer/MainArrow"
	arg_1_0.SUB_ARROW_BAR = "EnemyArrowContainer/SubArrow"
end

function var_0_1.MakeCharacter(arg_2_0)
	return var_0_0.Battle.BattlePlayerCharacter.New()
end

function var_0_1.MakeModel(arg_3_0, arg_3_1, arg_3_2)
	local function var_3_0(arg_4_0)
		arg_3_1:AddModel(arg_4_0)

		local var_4_0 = arg_3_0:GetSceneMediator()

		arg_3_1:CameraOrthogonal(var_0_0.Battle.BattleCameraUtil.GetInstance():GetCamera())
		var_4_0:AddPlayerCharacter(arg_3_1)
		arg_3_0:MakeUIComponentContainer(arg_3_1)
		arg_3_0:MakeFXContainer(arg_3_1)
		arg_3_0:MakePopNumPool(arg_3_1)
		arg_3_0:MakeBloodBar(arg_3_1)
		arg_3_0:MakeArrowBar(arg_3_1)
		arg_3_0:MakeWaveFX(arg_3_1)
		arg_3_0:MakeSmokeFX(arg_3_1)
		arg_3_0:MakeSkinOrbit(arg_3_1)

		local var_4_1 = arg_3_1:GetUnitData()

		if var_4_1:GetCloak() then
			arg_3_0:MakeCloakBar(arg_3_1)
		end

		arg_3_1:UpdateDiveInvisible()

		if #var_4_1:GetTorpedoList() > 0 then
			arg_3_0:MakeTorpedoTrack(arg_3_1)
		end

		if var_4_1:GetAimBias() and var_4_1:GetAimBias():GetHost() == var_4_1 then
			arg_3_0:MakeAimBiasBar(arg_3_1)
		end
	end

	arg_3_0:GetCharacterPool():InstCharacter(arg_3_1:GetModleID(), function(arg_5_0)
		var_3_0(arg_5_0)
	end)
end

function var_0_1.MakeBloodBar(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0:GetHPBarPool():GetHPBar(arg_6_0.HP_BAR_NAME)
	local var_6_1 = var_6_0.transform

	LuaHelper.SetTFChildActive(var_6_1, "torpedoIcons", true)
	arg_6_1:AddHPBar(var_6_0)
end

function var_0_1.MakeAimBiasBar(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1._HPBarTf:Find("biasBar")

	arg_7_1:AddAimBiasBar(var_7_0)
end

function var_0_1.MakeShieldBar(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1._HPBarTf:Find("shieldBar")

	arg_8_1:AddShieldBar(var_8_0)
end

function var_0_1.MakeChargeArea(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:GetSceneMediator():InstantiateCharacterComponent(arg_9_0.CHARGE_AREA_NAME)

	var_9_0.transform.localEulerAngles = Vector3(60, 0, 0)

	arg_9_1:AddChargeArea(var_9_0)
end

function var_0_1.MakeTorpedoTrack(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:GetFXPool():GetFX("SquareAlert", arg_10_1:GetTf())

	arg_10_1:AddTorpedoTrack(var_10_0)
end

function var_0_1.RemoveCharacter(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0:GetSceneMediator()

	if arg_11_2 and arg_11_2 ~= var_0_0.Battle.BattleConst.UnitDeathReason.KILLED then
		-- block empty
	else
		var_0_0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[var_0_0.Battle.BattleConst.ShakeType.UNIT_DIE])
	end

	var_0_1.super.RemoveCharacter(arg_11_0, arg_11_1, arg_11_2)
end

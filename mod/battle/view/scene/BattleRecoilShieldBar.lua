ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleRecoilShieldBar = class("BattleRecoilShieldBar")
var_0_0.Battle.BattleRecoilShieldBar.__name = "BattleRecoilShieldBar"

local var_0_1 = var_0_0.Battle.BattleRecoilShieldBar

var_0_1.WARNING_VALUE = 0.1

function var_0_1.Ctor(arg_1_0, arg_1_1)
	arg_1_0._recoilShieldBar = arg_1_1
	arg_1_0._recoilShieldBarGO = arg_1_0._recoilShieldBar.gameObject
	arg_1_0._progress = arg_1_0._recoilShieldBar:Find("shield"):GetComponent(typeof(Image))

	setActive(arg_1_0._progress, true)
	setActive(arg_1_0._recoilShieldBar, true)

	arg_1_0._lockBlock = false
end

function var_0_1.SetActive(arg_2_0, arg_2_1)
	setActive(arg_2_0._recoilShieldBar, arg_2_1)
end

function var_0_1.ConfigShieldBuff(arg_3_0, arg_3_1)
	arg_3_0._recoilShieldBuffEffect = arg_3_1
end

function var_0_1.UpdateRecoilShieldProgress(arg_4_0)
	local var_4_0 = arg_4_0._recoilShieldBuffEffect:GetCurrentRate()

	arg_4_0._progress.fillAmount = var_4_0
end

function var_0_1.Dispose(arg_5_0)
	arg_5_0._recoilShieldBar = nil
	arg_5_0._progress = nil
	arg_5_0._recoilShieldBarGO = nil
end

function var_0_1.GetGO(arg_6_0)
	return arg_6_0._aimBiasBarGO
end

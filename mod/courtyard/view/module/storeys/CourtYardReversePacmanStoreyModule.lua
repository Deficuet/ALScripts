local var_0_0 = class("CourtYardReversePacmanStoreyModule", import(".CourtYardStoreyModule"))

function var_0_0.OnInit(arg_1_0)
	var_0_0.super.OnInit(arg_1_0)

	arg_1_0.bg.localScale = Vector3(1, 1, 1)
end

function var_0_0.GetDefaultBgm(arg_2_0)
	return pg.voice_bgm.ReversePacmanHomeScene.default_bgm
end

function var_0_0.InitPedestalModule(arg_3_0)
	arg_3_0.pedestalModule = CourtYardReversePacmanPedestalModule.New(arg_3_0.data, arg_3_0.bg)
end

return var_0_0

local var_0_0 = class("MainAwakeSequenceView", import(".MainSequenceView"))

function var_0_0.Ctor(arg_1_0)
	arg_1_0.sequence = {
		MainPlayerTestSequence.New(),
		MainCompatibleDataSequence.New(),
		MainRandomFlagShipSequence.New(),
		MainFixSettingDefaultValue.New()
	}
end

function var_0_0.Execute(arg_2_0, arg_2_1)
	if not arg_2_0.executable then
		arg_2_0.executable = arg_2_0:MapSequence(arg_2_0.sequence)
	end

	seriesAsync(arg_2_0.executable, arg_2_1)
end

return var_0_0

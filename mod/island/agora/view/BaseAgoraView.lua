local var_0_0 = class("BaseAgoraView", import("Mod.Island.Core.View.IslandView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.agora = arg_1_2
	arg_1_0.agora_callbacks = {}
end

function var_0_0.SetUp(arg_2_0)
	var_0_0.super.SetUp(arg_2_0)
	arg_2_0:AddAgoraListeners()
end

function var_0_0.AddAgoraListeners(arg_3_0)
	return
end

function var_0_0.RemoveAgoraListeners(arg_4_0)
	return
end

function var_0_0.AddAgoraListener(arg_5_0, arg_5_1, arg_5_2)
	local function var_5_0(arg_6_0, ...)
		arg_5_2(arg_5_0, ...)
	end

	assert(arg_5_0.agora_callbacks[arg_5_2] == nil, "This method has been monitored. Please use another one" .. arg_5_1)

	arg_5_0.agora_callbacks[arg_5_2] = var_5_0

	arg_5_0.agora:AddListener(arg_5_1, var_5_0)
end

function var_0_0.RemoveAgoraListener(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.agora_callbacks[arg_7_2]

	if var_7_0 then
		arg_7_0.agora:RemoveListener(arg_7_1, var_7_0)

		arg_7_0.agora_callbacks[var_7_0] = nil
	end
end

function var_0_0.OnDispose(arg_8_0)
	var_0_0.super.OnDispose(arg_8_0)
	arg_8_0:RemoveAgoraListeners()
end

return var_0_0

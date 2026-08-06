local var_0_0 = import(".IslandRecEnergyEffect")
local var_0_1 = class("IslandEffectView", import("..IslandBaseHudView"))
local var_0_2 = {
	var_0_0
}

function var_0_1.GetUIName(arg_1_0)
	return "IslandEffectUI"
end

function var_0_1.OnInit(arg_2_0, arg_2_1)
	var_0_1.super.OnInit(arg_2_0, arg_2_1)

	arg_2_0.effects = {}

	for iter_2_0, iter_2_1 in ipairs(var_0_2) do
		local var_2_0 = iter_2_1.New(arg_2_0._tf)

		arg_2_0.effects[var_2_0:GetType()] = var_2_0
	end
end

function var_0_1.Play(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_0.effects[arg_3_3]

	if var_3_0 then
		var_3_0:Play(arg_3_1, arg_3_2)
	end
end

function var_0_1.OnLateUpdate(arg_4_0)
	var_0_1.super.OnLateUpdate(arg_4_0)

	for iter_4_0, iter_4_1 in pairs(arg_4_0.effects) do
		iter_4_1:Update()
	end
end

function var_0_1.OnDispose(arg_5_0)
	for iter_5_0, iter_5_1 in pairs(arg_5_0.effects or {}) do
		iter_5_1:Dispose()
	end

	arg_5_0.effects = nil

	var_0_1.super.OnDispose(arg_5_0)
end

return var_0_1

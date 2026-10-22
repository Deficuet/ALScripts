local var_0_0 = class("QiShengLitUI", import(".MainPaintingLitUI"))
local var_0_1 = {
	["Particle System_1"] = {
		max_particle = 20,
		translate = true
	},
	["Particle System_2"] = {
		max_particle = 20,
		translate = false
	}
}

function var_0_0.initLitUI(arg_1_0, arg_1_1)
	var_0_0.super.initLitUI(arg_1_0, arg_1_1)

	arg_1_0._particleTable = {}

	for iter_1_0, iter_1_1 in pairs(var_0_1) do
		local var_1_0 = findTF(arg_1_0._tf, "ad/effect/" .. iter_1_0)

		arg_1_0._particleTable[iter_1_0] = GetComponent(var_1_0, "ParticleSystem")
	end
end

function var_0_0.UpdateLit(arg_2_0)
	var_0_0.super.UpdateLit(arg_2_0)
	arg_2_0:updateEffect()
end

function var_0_0.updateEffect(arg_3_0)
	local var_3_0 = SpinePaintingConst.painting_lit_value

	for iter_3_0, iter_3_1 in pairs(var_0_1) do
		local var_3_1 = arg_3_0._particleTable[iter_3_0]
		local var_3_2 = iter_3_1.translate
		local var_3_3

		if var_3_2 then
			var_3_3 = iter_3_1.max_particle * (1 - var_3_0)
		else
			var_3_3 = iter_3_1.max_particle * var_3_0
		end

		if var_3_3 then
			var_3_1.main.maxParticles = var_3_3
		end
	end
end

return var_0_0

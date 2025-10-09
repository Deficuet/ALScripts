local var_0_0 = class("CourtYardFurnitureSlot", import(".CourtYardFurnitureBaseSlot"))

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.actionName = arg_1_1[1]
	arg_1_0.offset = arg_1_1[2] and Vector3(arg_1_1[2][1], arg_1_1[2][2], 0) or Vector3.zero
	arg_1_0.scale = arg_1_1[3] and Vector3(arg_1_1[3][1], arg_1_1[3][2], 1) or Vector3.one
	arg_1_0.mask = arg_1_1[4]
	arg_1_0.bodyMask = arg_1_1[6] and {
		offset = arg_1_1[6][1] and Vector2(arg_1_1[6][1][1], arg_1_1[6][1][2]) or Vector3.zero,
		size = arg_1_1[6][2] and Vector2(arg_1_1[6][2][1], arg_1_1[6][2][2]) or Vector3.zero,
		img = arg_1_1[6][3]
	}
end

function var_0_0.OnInitCombine(arg_2_0, arg_2_1)
	arg_2_0.combineData = arg_2_1
end

function var_0_0.GetMask(arg_3_0)
	if arg_3_0.mask == "" then
		return nil
	end

	return arg_3_0.mask
end

function var_0_0.OnStart(arg_4_0)
	local var_4_0 = arg_4_0:GetCombineFurnitureAnimator()

	if var_4_0 then
		return var_4_0[2] or arg_4_0.defaultAction
	end

	arg_4_0.user:UpdateInteraction({
		action = arg_4_0.actionName
	})
end

return var_0_0

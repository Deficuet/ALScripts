local var_0_0 = class("CourtYardVariedInteraction", import(".CourtYardInteraction"))

function var_0_0.InitData(arg_1_0)
	var_0_0.super.InitData(arg_1_0)

	arg_1_0.total = 1
end

function var_0_0.GetInterActionUserCnt(arg_2_0)
	local var_2_0 = arg_2_0.host:GetOwner()

	if isa(var_2_0, CourtYardFurniture) then
		return #var_2_0:GetUsingSlots()
	else
		return 1
	end
end

function var_0_0.GetUserAction(arg_3_0)
	local var_3_0 = arg_3_0:GetInterActionUserCnt()

	return arg_3_0.userActions[var_3_0]
end

function var_0_0.GetOwnerAction(arg_4_0)
	local var_4_0 = arg_4_0:GetInterActionUserCnt()

	return arg_4_0.ownerActions[var_4_0]
end

function var_0_0.Reset(arg_5_0)
	arg_5_0.index = 0

	arg_5_0:Update(arg_5_0.loop)
end

function var_0_0.OnStepEnd(arg_6_0)
	if arg_6_0:IsCompleteOwnerStep() then
		arg_6_0:DoStep()
	end
end

return var_0_0

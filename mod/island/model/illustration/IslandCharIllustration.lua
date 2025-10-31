local var_0_0 = class("IslandCharIllustration", import(".IslandIllustration"))

function var_0_0.GetReachPoints(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = underscore.reduce(arg_1_0:getConfig("collect_upgrade"), 0, function(arg_2_0, arg_2_1)
		return arg_2_0 + (arg_1_1 >= arg_2_1[1] and arg_2_1[2] or 0)
	end)
	local var_1_1 = underscore.reduce(arg_1_0:getConfig("collect_star"), 0, function(arg_3_0, arg_3_1)
		return arg_3_0 + (arg_1_2 >= arg_3_1[1] and arg_3_1[2] or 0)
	end)

	return arg_1_0.basePoint + var_1_0 + var_1_1
end

function var_0_0.CheckTip(arg_4_0)
	if arg_4_0.status == var_0_0.STATUS.CAN_UNLOCK then
		arg_4_0.isTip = true

		return
	end

	local var_4_0 = arg_4_0:GetLinkConfigID()
	local var_4_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_4_0)

	if not var_4_1 then
		arg_4_0.isTip = false

		return
	end

	local var_4_2 = var_4_1:GetLevel()
	local var_4_3 = var_4_1:GetBreakLevel()

	arg_4_0.isTip = arg_4_0:GetReachPoints(var_4_2, var_4_3) > arg_4_0:GetPoints()
end

return var_0_0

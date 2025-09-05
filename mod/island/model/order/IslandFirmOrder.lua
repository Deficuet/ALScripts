local var_0_0 = class("IslandFirmOrder", import(".IslandOrder"))

function var_0_0.IsFirm(arg_1_0)
	return true
end

function var_0_0.CanReplace(arg_2_0)
	return false
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.island_order
end

function var_0_0.IsEmpty(arg_4_0)
	return arg_4_0.showFlag == IslandOrderSlot.SHOW_FLAG_TOMORROW
end

function var_0_0.GetAwardItemAndExp(arg_5_0)
	local var_5_0 = arg_5_0:getConfig("award")

	return arg_5_0:GenAwards(var_5_0)
end

return var_0_0

local var_0_0 = class("MonopolyCar2026PickPage", import("..MonopolyCar2024.MonopolyCar2024PickPage"))

function var_0_0.getUIName(arg_1_0)
	return "MonopolyCar2026PickUI"
end

function var_0_0.UpdateList(arg_2_0)
	var_0_0.super.UpdateList(arg_2_0)

	local var_2_0 = #arg_2_0.banList == 0 and arg_2_0.turnCnt <= 1

	for iter_2_0 = 2, #arg_2_0.items do
		local var_2_1 = arg_2_0.items[iter_2_0]

		setActive(var_2_1, not var_2_0)
	end
end

return var_0_0

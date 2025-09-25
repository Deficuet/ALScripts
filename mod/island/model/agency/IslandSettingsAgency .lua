local var_0_0 = class("IslandSettingsAgency ", import(".IslandBaseAgency"))

var_0_0.FLAG_TYPES = {
	SHOW_CARD_SOCIAL = 1,
	SHOW_CARD_LABEL = 2
}

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.settingsFlags = {}

	arg_1_0:SetFlags(arg_1_1.flag_list or {})
end

function var_0_0.GetFlagByType(arg_2_0, arg_2_1)
	return arg_2_0.settingsFlags[arg_2_1]
end

function var_0_0.SetFlags(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_1 or {}) do
		arg_3_0.settingsFlags[iter_3_1.type] = iter_3_1.flag
	end
end

return var_0_0

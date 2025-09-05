local var_0_0 = class("IslandItemKind")

function var_0_0.Type2TagName(arg_1_0)
	if not var_0_0.TagNames then
		var_0_0.TagNames = {
			i18n("island_item_type_res"),
			i18n("island_item_type_consume"),
			i18n("island_item_type_spe")
		}
	end

	return var_0_0.TagNames[arg_1_0]
end

return var_0_0

local var_0_0 = class("IslandAutoCollectHelper")

var_0_0.SelectType = {
	Gather = 3,
	HandCollection = 2,
	Both = 4,
	None = 1
}
var_0_0.CostTipList = {
	i18n("island_chara_gather_power"),
	i18n("island_chara_gather_money")
}

function var_0_0.GetAttributeReducePercent(arg_1_0)
	local var_1_0 = IslandProductTimeHelper.GetAttributeGradeId(arg_1_0, IslandShipAttr.COLLECT_KEY)

	return pg.island_chara_att[var_1_0].gather_effect
end

return var_0_0

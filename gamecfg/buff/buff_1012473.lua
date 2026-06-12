return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onSubmarineFloat"
			},
			arg_list = {
				buff_id = 1012474,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineFloat"
			},
			arg_list = {
				skill_id = 1012471,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineRetreat"
			},
			arg_list = {
				skill_id = 1012471,
				target = "TargetSelf"
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "大青花鱼时弹幕",
	stack = 1,
	id = 1012473,
	icon = 12470,
	last_effect = ""
}

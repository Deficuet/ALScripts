return {
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				attr = "attackRating",
				number = 100
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onStack"
			},
			arg_list = {
				countTarget = 10,
				countType = 152373
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 152371,
				countType = 152373
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
	time = 0,
	name = "",
	init_effect = "",
	picture = "",
	desc = "属性提升",
	stack = 10,
	id = 152373,
	icon = 152370,
	last_effect = ""
}

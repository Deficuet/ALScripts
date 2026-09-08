return {
	blink = {
		0,
		0.7,
		1,
		0.3,
		0.3
	},
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
				attr = "torpedoPower",
				number = 200
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				quota = 5,
				target = "TargetSelf",
				skill_id = 152810
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
	id = 152814,
	name = "雷击属性提升",
	time = 0,
	picture = "",
	desc = "雷击提高",
	stack = 5,
	color = "red",
	icon = 152810,
	last_effect = ""
}

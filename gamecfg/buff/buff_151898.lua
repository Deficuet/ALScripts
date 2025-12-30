return {
	time = 2,
	name = "LuckyE",
	init_effect = "jinengchufared",
	picture = "",
	desc = "伤害提高，闪避",
	stack = 1,
	id = 151898,
	icon = 151890,
	last_effect = "",
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "perfectDodge",
				number = 1
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "immuneDirectHit",
				number = 1
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 151892
			}
		}
	}
}

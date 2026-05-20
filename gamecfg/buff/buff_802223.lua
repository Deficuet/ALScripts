return {
	time = 6,
	name = "",
	init_effect = "jinengchufared",
	picture = "",
	desc = "伤害提高，闪避",
	stack = 1,
	id = 802223,
	icon = 802220,
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
				attr = "damageRatioBullet",
				number = 1
			}
		}
	}
}

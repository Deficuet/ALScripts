return {
	time = 0,
	name = "2026伯利欣根活动 审判号支援",
	init_effect = "",
	stack = 1,
	id = 201754,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "attackRating",
				number = 500
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "criDamage",
				number = 0.05
			}
		}
	}
}

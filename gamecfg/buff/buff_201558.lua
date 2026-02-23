return {
	time = 0,
	name = "2025约战联动 L3 BOSS光环",
	init_effect = "",
	stack = 1,
	id = 201558,
	picture = "",
	last_effect = "",
	blink = {
		0,
		0.6,
		0,
		0.6,
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
				number = 0.5
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "loadSpeed",
				number = 5000
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 3,
				target = "TargetSelf",
				skill_id = 201557
			}
		}
	}
}

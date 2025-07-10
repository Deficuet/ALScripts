return {
	init_effect = "",
	name = "特殊点燃",
	time = 9.1,
	picture = "",
	desc = "持续伤害-视为点燃",
	stack = 1,
	id = 19925,
	icon = 19920,
	last_effect = "zhuoshao",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "cannonPower",
				exposeGroup = 1,
				time = 3,
				cloakExpose = 36,
				number = 349,
				dotType = 1,
				k = 0
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				group = 19925,
				attr = "damageReduceFromAmmoType_3",
				number = -0.05
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 60,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 61,
				target = "TargetSelf"
			}
		}
	}
}

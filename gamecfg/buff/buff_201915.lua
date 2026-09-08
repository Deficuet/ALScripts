return {
	time = 8.1,
	name = "2026虎UR活动 EX普通 紫色火焰灼烧",
	init_effect = "",
	stack = 1,
	id = 201915,
	picture = "",
	last_effect = "zihuozhuoshao",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "cannonPower",
				exposeGroup = 1,
				time = 2,
				cloakExpose = 36,
				number = 0,
				dotType = 1,
				k = 0.3
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

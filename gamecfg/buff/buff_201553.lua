return {
	time = 0,
	name = "2025风帆三期 T6 BOSS召唤自爆",
	init_effect = "",
	stack = 1,
	id = 201553,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 1,
				target = "TargetSelf",
				skill_id = 201553
			}
		}
	}
}

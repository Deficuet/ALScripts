return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 801711,
	icon = 801710,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBulletHitBefore"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 801711
			}
		}
	}
}

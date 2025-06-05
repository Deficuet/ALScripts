return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 112040,
	icon = 112040,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onWeaponSteday"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 112040,
				index = {
					1
				}
			}
		}
	}
}

return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onChargeWeaponFire"
			},
			arg_list = {
				rant = 10000,
				target = "TargetSelf",
				skill_id = 20000,
				time = 1
			}
		}
	},
	{
		desc = "中型/重型主炮开火时有几率发动，额外进行一轮攻击",
		effect_list = {
			{
				type = "BattleBuffCastSkill",
				trigger = {
					"onChargeWeaponFire"
				},
				arg_list = {
					rant = 10000,
					target = "TargetSelf",
					skill_id = 20000,
					time = 1
				}
			}
		}
	},
	init_effect = "",
	name = "主炮连射",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 20000,
	icon = 1,
	last_effect = ""
}

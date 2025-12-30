return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 29030,
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 29031,
				countType = 29030
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕I"
	},
	desc_get = "主炮每进行15次攻击，触发专属弹幕I",
	name = "专属弹幕I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕I",
	stack = 1,
	id = 29031,
	icon = 29000,
	last_effect = ""
}

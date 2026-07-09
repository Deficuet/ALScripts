return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 30630,
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
				skill_id = 30631,
				countType = 30630
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕-暴风雨I"
	},
	desc_get = "主炮每进行15次攻击，触发专属弹幕-暴风雨I",
	name = "专属弹幕-暴风雨I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-暴风雨I",
	stack = 1,
	id = 30631,
	icon = 30630,
	last_effect = ""
}

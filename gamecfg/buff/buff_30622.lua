return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 8,
				countType = 30620,
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
				skill_id = 30622,
				countType = 30620
			}
		}
	},
	{
		desc = "主炮每进行8次攻击，触发专属弹幕-瑟堡II"
	},
	desc_get = "主炮每进行8次攻击，触发专属弹幕-瑟堡II",
	name = "专属弹幕-瑟堡II",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行8次攻击，触发专属弹幕-瑟堡II",
	stack = 1,
	id = 30622,
	icon = 30620,
	last_effect = ""
}

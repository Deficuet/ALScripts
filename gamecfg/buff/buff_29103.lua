return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 10,
				countType = 29100,
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
				skill_id = 29103,
				countType = 29100
			}
		}
	},
	{
		desc = "主炮每进行10次攻击，触发专属弹幕-贝尔法斯特II"
	},
	desc_get = "主炮每进行10次攻击，触发专属弹幕-贝尔法斯特III",
	name = "专属弹幕-贝尔法斯特III",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-贝尔法斯特III",
	stack = 1,
	id = 29103,
	icon = 29100,
	last_effect = ""
}

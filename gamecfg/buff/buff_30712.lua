return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 30,
				countType = 30710,
				index = {
					1,
					2
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
				skill_id = 30712,
				countType = 30710
			}
		}
	},
	{
		desc = "主炮每进行30次攻击，触发专属弹幕-长蛇号II"
	},
	desc_get = "主炮每进行30次攻击，触发专属弹幕-长蛇号II",
	name = "专属弹幕-长蛇号II",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行30次攻击，触发专属弹幕-长蛇号II",
	stack = 1,
	id = 30712,
	icon = 30710,
	last_effect = ""
}

return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 22,
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
				skill_id = 30711,
				countType = 30710
			}
		}
	},
	{
		desc = "主炮每进行22次攻击，触发专属弹幕-长蛇号I"
	},
	desc_get = "主炮每进行22次攻击，触发专属弹幕-长蛇号I",
	name = "专属弹幕-长蛇号I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行22次攻击，触发专属弹幕-长蛇号I",
	stack = 1,
	id = 30711,
	icon = 30710,
	last_effect = ""
}

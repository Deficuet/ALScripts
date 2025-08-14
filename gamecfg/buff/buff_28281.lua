return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 12,
				countType = 282810,
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
				skill_id = 28281,
				countType = 282810
			}
		}
	},
	{
		desc = "主炮每进行12次攻击，触发全弹发射-迪盖·特鲁因级I"
	},
	init_effect = "",
	name = "全弹发射",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行12次攻击，触发全弹发射-迪盖·特鲁因级I",
	stack = 1,
	id = 28281,
	icon = 20100,
	last_effect = ""
}

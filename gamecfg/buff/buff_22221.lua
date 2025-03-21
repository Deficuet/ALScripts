return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 9,
				countType = 22220,
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
				skill_id = 22221,
				countType = 22220
			}
		}
	},
	{
		desc = "主炮每进行9次攻击，触发全弹发射-{namecode:55}级I"
	},
	init_effect = "",
	name = "全弹发射",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行9次攻击，触发全弹发射-{namecode:55}级I",
	stack = 1,
	id = 22221,
	icon = 20200,
	last_effect = ""
}

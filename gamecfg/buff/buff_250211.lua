return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 9,
				countType = 250210,
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
				skill_id = 250211,
				countType = 250210
			}
		}
	},
	{
		desc = "主炮每进行9次攻击，触发全弹发射-迪凯纳级I"
	},
	init_effect = "",
	name = "全弹发射",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行9次攻击，触发全弹发射-迪凯纳级I",
	stack = 1,
	id = 250211,
	icon = 20200,
	last_effect = ""
}

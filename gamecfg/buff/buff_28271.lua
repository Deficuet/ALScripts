return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 12,
				countType = 28270,
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
				skill_id = 28271,
				countType = 28270
			}
		}
	},
	{},
	init_effect = "",
	name = "全弹发射",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行12次攻击，触发全弹发射-朱塞诺级I",
	stack = 1,
	id = 28271,
	icon = 20100,
	last_effect = ""
}

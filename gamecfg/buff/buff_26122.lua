return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 8,
				countType = 26120,
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
				skill_id = 26122,
				countType = 26120
			}
		}
	},
	{
		desc = "主炮每进行8次攻击，触发全弹发射-纳希莫夫海军上将级II"
	},
	init_effect = "",
	name = "全弹发射",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行8次攻击，触发全弹发射-纳希莫夫海军上将级II",
	stack = 1,
	id = 26122,
	icon = 20100,
	last_effect = ""
}

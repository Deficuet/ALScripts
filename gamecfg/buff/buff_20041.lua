return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 20040,
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
				skill_id = 20041,
				countType = 20040
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发全弹发射-弗莱彻级I"
	},
	init_effect = "",
	name = "全弹发射",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发全弹发射--弗莱彻级I",
	stack = 1,
	id = 20041,
	icon = 20000,
	last_effect = ""
}

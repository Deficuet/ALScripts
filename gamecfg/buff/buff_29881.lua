return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 29880,
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
				skill_id = 29881,
				countType = 29880
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕-不屈I"
	},
	desc_get = "主炮每进行15次攻击，触发专属弹幕-不屈I",
	name = "专属弹幕-不屈I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-不屈I",
	stack = 1,
	id = 29881,
	icon = 29880,
	last_effect = ""
}

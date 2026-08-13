return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 30670,
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
				skill_id = 30671,
				countType = 30670
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕-柯莱特I"
	},
	desc_get = "主炮每进行15次攻击，触发专属弹幕-柯莱特I",
	name = "专属弹幕-柯莱特I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-柯莱特I",
	stack = 1,
	id = 30671,
	icon = 30670,
	last_effect = ""
}

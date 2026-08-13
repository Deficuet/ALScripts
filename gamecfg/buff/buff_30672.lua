return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countType = 30670,
				countTarget = 10,
				gunnerBonus = true,
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
				skill_id = 30672,
				countType = 30670
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕-柯莱特I"
	},
	desc_get = "主炮每进行10次攻击，触发专属弹幕-柯莱特II",
	name = "专属弹幕-柯莱特I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-柯莱特II",
	stack = 1,
	id = 30672,
	icon = 30670,
	last_effect = ""
}

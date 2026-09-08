return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 30690,
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
				skill_id = 30691,
				countType = 30690
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕-虎I"
	},
	desc_get = "主炮每进行15次攻击，触发专属弹幕-虎I",
	name = "专属弹幕-虎I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-虎I",
	stack = 1,
	id = 30691,
	icon = 30690,
	last_effect = ""
}

return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 10,
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
				skill_id = 30692,
				countType = 30690
			}
		}
	},
	{
		desc = "主炮每进行10次攻击，触发专属弹幕-虎II"
	},
	desc_get = "主炮每进行10次攻击，触发专属弹幕-虎II",
	name = "专属弹幕-虎II",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-虎II",
	stack = 1,
	id = 30692,
	icon = 30690,
	last_effect = ""
}

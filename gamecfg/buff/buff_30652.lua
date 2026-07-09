return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 10,
				countType = 30650,
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
				skill_id = 30652,
				countType = 30650
			}
		}
	},
	{},
	desc_get = "主炮每进行10次攻击，触发专属弹幕-{namecode:292}I",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-{namecode:292}I",
	stack = 1,
	id = 30652,
	icon = 30650,
	last_effect = ""
}

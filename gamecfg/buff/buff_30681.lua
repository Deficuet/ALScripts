return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 30680,
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
				skill_id = 30681,
				countType = 30680
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕-维克斯堡I"
	},
	desc_get = "主炮每进行15次攻击，触发专属弹幕-维克斯堡I",
	name = "专属弹幕-维克斯堡I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-维克斯堡I",
	stack = 1,
	id = 30681,
	icon = 30680,
	last_effect = ""
}

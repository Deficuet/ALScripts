return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countType = 29030,
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
				skill_id = 29032,
				countType = 29030
			}
		}
	},
	{
		desc = "主炮每进行10次攻击，触发专属弹幕"
	},
	desc_get = "主炮每进行10次攻击，触发专属弹幕",
	name = "专属弹幕",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕",
	stack = 1,
	id = 29032,
	icon = 29000,
	last_effect = ""
}

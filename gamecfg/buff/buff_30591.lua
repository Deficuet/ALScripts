return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 12,
				countType = 30591,
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
				skill_id = 30591,
				countType = 30591
			}
		}
	},
	{
		desc = "主炮每进行12次攻击，触发专属弹幕-莫斯科I"
	},
	init_effect = "",
	name = "专属弹幕",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行12次攻击，触发专属弹幕-莫斯科I",
	stack = 1,
	id = 30591,
	icon = 30590,
	last_effect = ""
}

return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 8,
				countType = 30640,
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
				skill_id = 30642,
				countType = 30640
			}
		}
	},
	{
		desc = "主炮每进行8次攻击，触发专属弹幕-华丽II"
	},
	desc_get = "主炮每进行8次攻击，触发专属弹幕-华丽II",
	name = "专属弹幕-华丽II",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行8次攻击，触发专属弹幕-华丽II",
	stack = 1,
	id = 30642,
	icon = 30640,
	last_effect = ""
}

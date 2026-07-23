return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 12,
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
				skill_id = 30641,
				countType = 30640
			}
		}
	},
	{
		desc = "主炮每进行12次攻击，触发专属弹幕-华丽I"
	},
	desc_get = "主炮每进行12次攻击，触发专属弹幕-华丽I",
	name = "专属弹幕-华丽I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行12次攻击，触发专属弹幕-华丽I",
	stack = 1,
	id = 30641,
	icon = 30640,
	last_effect = ""
}

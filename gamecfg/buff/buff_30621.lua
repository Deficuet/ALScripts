return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 12,
				countType = 30620,
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
				skill_id = 30621,
				countType = 30620
			}
		}
	},
	{
		desc = "主炮每进行12次攻击，触发专属弹幕-瑟堡I"
	},
	desc_get = "主炮每进行12次攻击，触发专属弹幕-瑟堡I",
	name = "专属弹幕-瑟堡I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行12次攻击，触发专属弹幕-瑟堡I",
	stack = 1,
	id = 30621,
	icon = 30620,
	last_effect = ""
}

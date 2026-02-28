return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countType = 30580,
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
				skill_id = 30582,
				countType = 30580
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				rant = 5000,
				target = "TargetSelf",
				skill_id = 30583,
				countType = 30580
			}
		}
	},
	{
		desc = "主炮每进行10次攻击，触发专属弹幕-顽皮II"
	},
	desc_get = "主炮每进行10次攻击，触发专属弹幕-顽皮II",
	name = "专属弹幕-顽皮II",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-顽皮II",
	stack = 1,
	id = 30582,
	icon = 30580,
	last_effect = ""
}

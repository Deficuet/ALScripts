return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 30580,
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
				skill_id = 30581,
				countType = 30580
			}
		}
	},
	{
		desc = "主炮每进行15次攻击，触发专属弹幕-顽皮I"
	},
	desc_get = "主炮每进行15次攻击，触发专属弹幕-顽皮I",
	name = "专属弹幕-顽皮I",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-顽皮I",
	stack = 1,
	id = 30581,
	icon = 30580,
	last_effect = ""
}

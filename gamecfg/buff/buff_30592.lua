return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 8,
				countType = 30592,
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
				skill_id = 30592,
				countType = 30592
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 30593,
				minWeaponNumber = 1,
				check_weapon = true,
				label = {
					"SN"
				}
			}
		}
	},
	{
		desc = "主炮每进行8次攻击，触发专属弹幕-莫斯科I"
	},
	init_effect = "",
	name = "专属弹幕",
	time = 0,
	color = "red",
	picture = "",
	desc = "主炮每进行8次攻击，触发专属弹幕-莫斯科II",
	stack = 1,
	id = 30592,
	icon = 30590,
	last_effect = ""
}

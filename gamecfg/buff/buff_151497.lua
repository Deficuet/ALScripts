return {
	init_effect = "",
	name = "",
	time = 2,
	picture = "",
	desc = "",
	stack = 1,
	id = 151497,
	icon = 151490,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minWeaponNumber = 1,
				target = "TargetSelf",
				skill_id = 151493,
				check_weapon = true,
				label = {
					"FFNF"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 151492,
				target = "TargetSelf",
				maxWeaponNumber = 0,
				check_weapon = true,
				label = {
					"FFNF"
				}
			}
		}
	}
}

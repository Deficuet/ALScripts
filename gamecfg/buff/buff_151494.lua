return {
	init_effect = "",
	name = "判别法系装备触发弹幕，若识别到10秒tag，删除20秒cd，换上10秒cd",
	time = 2,
	picture = "",
	desc = "",
	stack = 1,
	id = 151494,
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
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 151495,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"dadan10"
				}
			}
		}
	}
}

return {
	desc_get = "",
	name = "蜂鸟直升机",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 802151,
	icon = 802150,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 10,
				skill_id = 802150
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				skill_id = 802150,
				time = 20
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				minWeaponNumber = 1,
				time = 10,
				check_weapon = true,
				skill_id = 802151,
				weapon_group = {
					740
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 20,
				skill_id = 802151,
				minWeaponNumber = 1,
				check_weapon = true,
				weapon_group = {
					740
				}
			}
		}
	}
}

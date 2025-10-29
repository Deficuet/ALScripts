return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				skill_id = 151550,
				target = "TargetSelf",
				check_weapon = true,
				index = {
					1
				},
				label = {
					"IJN",
					"CV"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 151551,
				minWeaponNumber = 1,
				check_weapon = true,
				index = {
					1
				},
				type = {
					7,
					9
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 151552,
				minWeaponNumber = 1,
				check_weapon = true,
				index = {
					1
				},
				type = {
					8
				}
			}
		},
		{
			type = "BattleBuffAddAircraftOrb",
			trigger = {
				"onAircraftCreate"
			},
			arg_list = {
				rant = 10000,
				buff_id = 151554,
				index = {
					1,
					2,
					3
				}
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 151550,
	icon = 151550,
	last_effect = ""
}

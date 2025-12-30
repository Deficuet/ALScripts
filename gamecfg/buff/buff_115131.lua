return {
	init_effect = "jinengchufared",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 115131,
	icon = 115130,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffNewWeapon",
			trigger = {
				"onAttach"
			},
			arg_list = {
				weapon_id = 180016
			}
		},
		{
			type = "BattleBuffNewWeapon",
			trigger = {
				"onAttach"
			},
			arg_list = {
				weapon_id = 180017
			}
		}
	}
}

return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0.5,
	color = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 152061,
	icon = 152060,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					152060
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				check_target = "TargetNationalityFriendly",
				buff_id = 152065,
				minTargetNumber = 1,
				nationality = 7,
				exceptCaster = true,
				target = "TargetSelf"
			}
		}
	}
}

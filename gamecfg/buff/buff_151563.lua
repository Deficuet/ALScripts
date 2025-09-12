return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 15,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 151563,
	icon = 151560,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					151562
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 151562
			}
		}
	}
}

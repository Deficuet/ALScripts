return {
	init_effect = "",
	name = "",
	time = 0.1,
	color = "red",
	picture = "",
	desc = "",
	stack = 99,
	id = 106379,
	icon = 106370,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					106371,
					106372
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 106372,
				repeat_count = -1
			}
		}
	}
}

return {
	init_effect = "",
	name = "",
	time = 20,
	color = "red",
	picture = "",
	stack = 1,
	id = 151152,
	icon = 151150,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					151159
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 151159,
				target = "TargetSelf"
			}
		}
	}
}

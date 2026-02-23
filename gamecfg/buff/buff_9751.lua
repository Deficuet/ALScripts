return {
	desc_get = "",
	name = "迷雾强化IIIbuff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9751,
	icon = 9751,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 9752,
				target = "TargetSelf"
			}
		}
	}
}

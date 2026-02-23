return {
	desc_get = "",
	name = "迷雾强化IIbuff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9748,
	icon = 9748,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 9749,
				target = "TargetSelf"
			}
		}
	}
}

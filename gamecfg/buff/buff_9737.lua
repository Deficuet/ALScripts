return {
	desc_get = "",
	name = "狭路相逢IIbuff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9737,
	icon = 9737,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 9738,
				target = "TargetSelf"
			}
		}
	}
}

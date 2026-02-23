return {
	desc_get = "",
	name = "狭路相逢IIIbuff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9741,
	icon = 9741,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 9742,
				target = "TargetSelf"
			}
		}
	}
}

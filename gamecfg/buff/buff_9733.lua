return {
	desc_get = "",
	name = "狭路相逢Ibuff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9733,
	icon = 9733,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 9734,
				target = "TargetSelf"
			}
		}
	}
}

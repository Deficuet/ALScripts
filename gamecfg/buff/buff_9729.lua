return {
	desc_get = "",
	name = "占得先机buff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9729,
	icon = 9729,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 9730,
				target = "TargetSelf"
			}
		}
	}
}

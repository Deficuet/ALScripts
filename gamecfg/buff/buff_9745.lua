return {
	desc_get = "",
	name = "迷雾强化Ibuff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9745,
	icon = 9745,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 9746,
				target = "TargetSelf"
			}
		}
	}
}

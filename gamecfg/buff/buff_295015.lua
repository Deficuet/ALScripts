return {
	time = 3,
	name = "EX使我方后排不受触底伤害",
	init_effect = "",
	stack = 1,
	id = 295015,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 295016
			}
		}
	}
}

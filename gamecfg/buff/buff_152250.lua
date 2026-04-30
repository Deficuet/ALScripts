return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			pop = {},
			arg_list = {
				buff_id = 152251,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpperConsort",
				"onLowerConsort"
			},
			arg_list = {
				buff_id = 152252
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 152255
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 152250,
	icon = 152250,
	last_effect = ""
}

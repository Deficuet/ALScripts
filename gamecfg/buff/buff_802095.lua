return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 802094,
				quota = 3
			}
		},
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id_list = {
					802092
				}
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
	name = "次数检测器",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 3,
	id = 802095,
	icon = 802090,
	last_effect = ""
}

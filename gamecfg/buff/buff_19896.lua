return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 2,
				initialCD = true,
				time = 0.5,
				skill_id = 19893
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStack"
			},
			arg_list = {
				buff_id = 19897
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
	time = 5,
	color = "red",
	picture = "",
	desc = "",
	stack = 2,
	id = 19896,
	icon = 19890,
	last_effect = ""
}

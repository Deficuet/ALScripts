return {
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onShieldBroken"
			},
			arg_list = {
				shieldBuffID = 802212,
				buff_id_list = {
					802212
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onShieldBroken"
			},
			arg_list = {
				skill_id = 802211,
				shieldBuffID = 802212
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
	id = 802213,
	icon = 802213,
	last_effect = ""
}

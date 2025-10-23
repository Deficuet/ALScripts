return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 151750
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpperConsort"
			},
			arg_list = {
				skill_id = 151753,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onLowerConsort"
			},
			arg_list = {
				skill_id = 151753,
				target = "TargetSelf"
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
	id = 151750,
	icon = 151750,
	last_effect = ""
}

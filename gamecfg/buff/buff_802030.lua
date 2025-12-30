return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFoeAircraftDying"
			},
			arg_list = {
				target = "TargetSelf",
				inside = 1,
				skill_id = 802030
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				buff_id = 802039
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 802031
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
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 802030,
	icon = 802030,
	last_effect = ""
}

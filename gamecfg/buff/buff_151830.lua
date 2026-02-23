return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			pop = {},
			arg_list = {
				target = "TargetSelf",
				buff_id = 151839
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFoeAircraftDying"
			},
			arg_list = {
				maxTargetNumber = 0,
				inside = 1,
				skill_id = 151830,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Pasadena_FlyNOTCoolDown"
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
	name = "",
	init_effect = "",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 151830,
	icon = 151830,
	last_effect = ""
}

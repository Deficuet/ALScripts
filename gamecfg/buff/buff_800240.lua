return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				maxWeaponNumber = 0,
				skill_id = 800240,
				target = "TargetSelf",
				check_weapon = true,
				label = {
					"IJN",
					"CV"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				skill_id = 800241,
				target = "TargetSelf",
				check_weapon = true,
				label = {
					"IJN",
					"CV"
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
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 800240,
	icon = 800240,
	last_effect = ""
}

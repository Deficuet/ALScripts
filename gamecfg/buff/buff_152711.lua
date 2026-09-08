return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				maxWeaponNumber = 1,
				target = "TargetSelf",
				skill_id = 152713,
				check_weapon = true,
				index = {
					1,
					2
				},
				label = {
					"AP",
					"MG"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minWeaponNumber = 2,
				target = "TargetSelf",
				skill_id = 152715,
				check_weapon = true,
				index = {
					1,
					2
				},
				label = {
					"AP",
					"MG"
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
	id = 152711,
	icon = 152710,
	last_effect = ""
}

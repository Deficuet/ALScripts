return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				maxWeaponNumber = 1,
				target = "TargetSelf",
				skill_id = 152710,
				check_weapon = true,
				index = {
					1,
					2
				},
				label = {
					"HE",
					"MG"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 2,
				target = "TargetSelf",
				skill_id = 152711,
				check_weapon = true,
				index = {
					1,
					2
				},
				label = {
					"HE",
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
	id = 152710,
	icon = 152710,
	last_effect = ""
}

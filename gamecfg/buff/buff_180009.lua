return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				maxTargetNumber = 0,
				attrCompare = "cannonPower>cannonPower",
				skill_id = 180002,
				check_target = {
					"TargetAllHelp",
					"TargetPlayerMainFleet",
					"TargetShipType",
					"TargetAttrCompare"
				},
				ship_type_list = {
					4,
					5
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
	id = 180009,
	icon = 190000,
	last_effect = ""
}

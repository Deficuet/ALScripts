return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onManualTorpedoReady"
			},
			arg_list = {
				minTargetNumber = 1,
				skill_id = 106434,
				target = "TargetSelf",
				check_target = {
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"YKNE2"
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
	id = 106434,
	icon = 106430,
	last_effect = ""
}

return {
	init_effect = "",
	name = "",
	time = 8,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61041,
	icon = 61040,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 2,
				attrCompare = "nationality=nationality",
				skill_id = 61041,
				check_target = {
					"TargetAllHelp",
					"TargetAttrCompare"
				}
			}
		}
	}
}

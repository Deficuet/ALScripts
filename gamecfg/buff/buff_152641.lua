return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 152642,
				time = 20,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 2,
				target = "TargetSelf",
				skill_id = 152642,
				check_target = {
					"TargetAllHelp",
					"TargetShipType"
				},
				ship_type_list = {
					2
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				maxTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 152643,
				check_target = {
					"TargetAllHelp",
					"TargetShipType"
				},
				ship_type_list = {
					2
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
	name = "烟雾弹·轻巡",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 152641,
	icon = 4100,
	last_effect = ""
}

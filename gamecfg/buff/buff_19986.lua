return {
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					19981,
					19982,
					19983,
					19984,
					19985
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 19982
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				maxTargetNumber = 0,
				skill_id = 19986,
				target = "TargetSelf",
				check_target = {
					"TargetShipTag"
				},
				ship_tag_list = {
					"KansasEX"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				skill_id = 20007,
				target = "TargetSelf",
				check_target = {
					"TargetShipTag"
				},
				ship_tag_list = {
					"KansasEX"
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
	time = 5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 19986,
	icon = 19980,
	last_effect = ""
}

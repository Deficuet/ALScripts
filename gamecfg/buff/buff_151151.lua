return {
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"OnStack"
			},
			arg_list = {
				buff_id_list = {
					151153
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"OnStack"
			},
			arg_list = {
				skill_id = 151151,
				minTargetNumber = 1,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"AIJIER_Lily_Sword"
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
	name = "埃吉尔lily 周围有人效果",
	init_effect = "",
	time = 0.1,
	color = "red",
	picture = "",
	desc = "",
	stack = 2,
	id = 151151,
	icon = 151150,
	last_effect = ""
}

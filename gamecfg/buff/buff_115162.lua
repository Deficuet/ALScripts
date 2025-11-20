return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 115163,
				target = "TargetSelf",
				check_target = {
					"TargetEntityUnit",
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"kuangsanfenshen2"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				maxTargetNumber = 0,
				target = "TargetSelf",
				skill_id = 115161,
				check_target = {
					"TargetEntityUnit",
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"kuangsanfenshen2"
				},
				fleetAttrConsume = {
					value = 5,
					attrName = "kuangsanshijian",
					repeatCeil = 1
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
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 115162,
	icon = 115160,
	last_effect = ""
}

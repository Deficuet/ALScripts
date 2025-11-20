return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 115280,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 115281,
				target = "TargetSelf",
				time = 5
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBeforeFatalDamage"
			},
			pop = {
				painting = 1,
				castCV = "skill",
				displayID = 115160,
				trigger = {
					"onBeforeFatalDamage"
				}
			},
			arg_list = {
				minTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 115154,
				check_target = {
					"TargetEntityUnit",
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"kuangsanfenshen"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFinishGame"
			},
			arg_list = {
				buff_id = 115240,
				minTargetNumber = 1,
				target = "TargetSelf",
				isBuffStackByCheckTarget = true,
				check_target = {
					"TargetEntityUnit",
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"kuangsanfenshen"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFinishGame"
			},
			pop = {
				painting = 1,
				castCV = "skill",
				displayID = 115160,
				trigger = {
					"onFinishGame"
				}
			},
			arg_list = {
				skill_id = 115240,
				target = "TargetSelf",
				fleetAttrConsume = {
					value = 5,
					attrName = "kuangsanshijian"
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
	id = 115280,
	icon = 115150,
	last_effect = ""
}

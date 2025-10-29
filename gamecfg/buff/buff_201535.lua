return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAllInStrike"
			},
			arg_list = {
				buff_id = 201536,
				minTargetNumber = 1,
				target = "TargetShipTag",
				check_target = {
					"TargetAllHarm",
					"TargetShipTag"
				},
				ship_tag_list = {
					"BOSS"
				}
			}
		}
	},
	{},
	{},
	time = 0,
	name = "2025风帆三期EX 莱姆号 空袭监听",
	init_effect = "",
	stack = 1,
	id = 201535,
	picture = "",
	last_effect = ""
}

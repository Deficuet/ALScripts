return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			pop = {},
			arg_list = {
				buff_id = 151901,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				buff_id = 151902,
				minTargetNumber = 3,
				check_target = {
					"TargetAllHelp",
					"TargetNationality"
				},
				nationality = {
					1
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrike"
			},
			arg_list = {
				skill_id = 151900,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrike"
			},
			arg_list = {
				minTargetNumber = 2,
				skill_id = 151901,
				check_target = {
					"TargetPlayerMainFleet",
					"TargetNationality"
				},
				nationality = {
					1
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrike"
			},
			arg_list = {
				maxTargetNumber = 1,
				skill_id = 151902,
				check_target = {
					"TargetPlayerMainFleet",
					"TargetNationality"
				},
				nationality = {
					1
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
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 151900,
	icon = 151900,
	last_effect = ""
}

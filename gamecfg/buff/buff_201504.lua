return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				minTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 201504,
				check_target = {
					"TargetAllHarm",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Xili_Lock"
				}
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	time = 1,
	name = "2025信标BOSS 夕立meta 向被锁定角色发动攻击",
	init_effect = "",
	stack = 1,
	id = 201504,
	picture = "",
	last_effect = ""
}

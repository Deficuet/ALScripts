return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBeforeFatalDamage"
			},
			arg_list = {
				minTargetNumber = 1,
				quota = 1,
				target = "TargetSelf",
				skill_id = 152962,
				check_target = {
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Merkuriy"
				}
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onBeforeFatalDamage"
			},
			arg_list = {
				count = 1
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
	name = "致命伤害监听",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 152962,
	icon = 152960,
	last_effect = ""
}

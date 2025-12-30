return {
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onStack"
			},
			arg_list = {
				countTarget = 1,
				countType = 115240
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onStack"
			},
			arg_list = {
				countTarget = 2,
				countType = 115241
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onStack"
			},
			arg_list = {
				countTarget = 3,
				countType = 115242
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 115241,
				countType = 115240
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 115241,
				countType = 115241
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 115241,
				countType = 115242
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
	stack = 3,
	id = 115240,
	icon = 115240,
	last_effect = ""
}

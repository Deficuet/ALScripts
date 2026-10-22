return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 152891
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onTakeDamage"
			},
			arg_list = {
				maxHPRatio = 0.3,
				countType = 152890
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 152890,
				countType = 152890
			}
		},
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 152891,
				nationality = 96,
				target = {
					"TargetAllHelp",
					"TargetNationality"
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
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 152890,
	icon = 152890,
	last_effect = ""
}

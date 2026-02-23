return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60990,
	icon = 60990,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkillRandom",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id_list = {
					60991,
					60992,
					60993,
					60994
				},
				range = {
					{
						0,
						0.25
					},
					{
						0.25,
						0.5
					},
					{
						0.5,
						0.75
					},
					{
						0.75,
						1
					}
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				buff_id = 60994
			}
		}
	}
}

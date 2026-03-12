return {
	desc_get = "",
	name = "六驱精锐·{namecode:12} +",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 2,
	id = 1012915,
	icon = 12910,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				countTarget = 2,
				countType = 1012910
			}
		},
		{
			type = "BattleBuffCastSkillRandom",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				countType = 1012910,
				skill_id_list = {
					1012913,
					1012916
				},
				range = {
					{
						0,
						0.06
					},
					{
						0.06,
						1
					}
				}
			}
		}
	}
}

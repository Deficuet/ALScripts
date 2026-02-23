return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 5,
	id = 151832,
	icon = 151830,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				inside = 1,
				countTarget = 4,
				countType = 151830
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
				countType = 151830,
				skill_id_list = {
					151831,
					151832,
					151833,
					151834
				},
				range = {
					{
						0,
						0.33
					},
					{
						0.33,
						0.66
					},
					{
						0.66,
						0.99
					},
					{
						0.99,
						1
					}
				}
			}
		}
	}
}

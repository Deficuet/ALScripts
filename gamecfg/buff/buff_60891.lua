return {
	init_effect = "",
	name = "神药球",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 40,
	id = 60891,
	icon = 60890,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				countTarget = 40,
				countType = 60890
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				buff_id = 60893,
				quota = 1,
				target = "TargetSelf",
				countType = 60890
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
				skill_id = 60890,
				countType = 60890
			}
		}
	}
}

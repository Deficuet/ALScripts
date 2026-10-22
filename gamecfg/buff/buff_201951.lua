return {
	time = 3,
	name = "2026风帆四期 剧情战 我方支援蛋船",
	init_effect = "",
	stack = 1,
	id = 201948,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201951,
				target = "TargetSelf"
			}
		}
	}
}

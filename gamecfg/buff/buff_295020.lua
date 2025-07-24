return {
	time = 3,
	name = "EX部分小怪初始位置随机3",
	init_effect = "",
	stack = 1,
	id = 295020,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 295020,
				target = "TargetSelf"
			}
		}
	}
}

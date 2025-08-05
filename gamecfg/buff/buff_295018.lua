return {
	time = 3,
	name = "EX部分小怪初始位置随机1",
	init_effect = "",
	stack = 1,
	id = 295018,
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
				skill_id = 295018,
				target = "TargetSelf"
			}
		}
	}
}

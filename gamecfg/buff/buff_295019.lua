return {
	time = 3,
	name = "EX部分小怪初始位置随机2",
	init_effect = "",
	stack = 1,
	id = 295019,
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
				skill_id = 295019,
				target = "TargetSelf"
			}
		}
	}
}

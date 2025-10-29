return {
	time = 3,
	name = "2025风帆三期 T6/SP BOSS召唤自爆 初始位置随机",
	init_effect = "",
	stack = 1,
	id = 201555,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 200896,
				target = "TargetSelf"
			}
		}
	}
}

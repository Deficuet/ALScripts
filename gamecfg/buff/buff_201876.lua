return {
	time = 3,
	name = "2026本宁顿活动 剧情战 理查德秒杀伤害",
	init_effect = "",
	stack = 1,
	id = 201876,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201876,
				target = "TargetSelf"
			}
		}
	}
}

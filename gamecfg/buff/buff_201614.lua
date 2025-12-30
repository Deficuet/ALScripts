return {
	time = 0.1,
	name = "2025约战联动 角色支援 四糸乃",
	init_effect = "",
	stack = 1,
	id = 201614,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201614
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201615
			}
		}
	}
}

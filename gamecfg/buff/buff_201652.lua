return {
	time = 3,
	name = "2025列克星敦II活动 代行者支援",
	init_effect = "",
	stack = 1,
	id = 201652,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201653
			}
		}
	}
}

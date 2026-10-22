return {
	init_effect = "",
	name = "",
	time = 1.7,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 152928,
	icon = 17940,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffStun",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 152923,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				time = 1.6,
				skill_id = 152924
			}
		}
	}
}

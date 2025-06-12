return {
	init_effect = "",
	name = "2024春节共斗 牵引",
	time = 23,
	picture = "",
	desc = "",
	stack = 1,
	id = 201231,
	icon = 201231,
	last_effect = "xuanyun",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201237,
				target = "TargetHarmNearest"
			}
		},
		{
			type = "BattleBuffCease",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffStun",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "stuned"
			}
		},
		{
			type = "BattleBuffAddAdditiveSpeed",
			trigger = {
				"onUpdate",
				"onRemove"
			},
			arg_list = {
				force = 0.6,
				singularity = {
					x = -20,
					z = 50
				}
			}
		}
	}
}

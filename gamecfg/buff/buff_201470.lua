return {
	time = 2,
	name = "2025优米雅联动 EX困难 小怪发射器6",
	init_effect = "",
	stack = 1,
	id = 201470,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 7,
				target = "TargetSelf",
				time = 0.2,
				skill_id = 201470
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 200440
			}
		}
	}
}

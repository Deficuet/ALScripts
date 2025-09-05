return {
	time = 2,
	name = "2025优米雅联动 EX普通 小怪发射器7",
	init_effect = "",
	stack = 1,
	id = 201478,
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
				quota = 10,
				target = "TargetSelf",
				time = 0.15,
				skill_id = 201478
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

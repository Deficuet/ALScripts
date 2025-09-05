return {
	time = 1,
	name = "2025优米雅联动 锁链攻击减速",
	init_effect = "",
	stack = 1,
	id = 201464,
	picture = "",
	last_effect = "heiyan_suolian",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -6000
			}
		}
	}
}

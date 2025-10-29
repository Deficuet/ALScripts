return {
	init_effect = "",
	name = "2025拉斐尔活动 新EX模式我方判定 领舰刚复活处于无敌状态时放置在旗舰身上的TAG",
	time = 2,
	picture = "",
	desc = "",
	stack = 1,
	id = 201266,
	icon = 201266,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "isInvincible_EX"
			}
		}
	}
}

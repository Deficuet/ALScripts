return {
	init_effect = "",
	name = "",
	time = 1,
	picture = "",
	desc = "优米雅远距离语音管理",
	stack = 1,
	id = 112175,
	icon = 112170,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 112172
			}
		}
	}
}

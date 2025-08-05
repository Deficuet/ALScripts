return {
	init_effect = "",
	name = "",
	time = 0.1,
	picture = "",
	desc = "优米雅 攻击合成一武技",
	stack = 1,
	id = 112126,
	icon = 112110,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 112123
			}
		}
	}
}

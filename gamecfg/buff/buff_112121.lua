return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "优米雅 攻击合成一技能",
	stack = 1,
	id = 112121,
	icon = 112110,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 112122
			}
		}
	}
}

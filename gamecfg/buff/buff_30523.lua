return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineFloat"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 30521
			}
		}
	},
	{},
	init_effect = "",
	name = "专属弹幕1",
	time = 0,
	color = "red",
	picture = "",
	desc = "氧气不足上浮时，触发专属弹幕",
	stack = 1,
	id = 30523,
	icon = 30520,
	last_effect = ""
}

return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineFreeSpecial"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 30523
			}
		}
	},
	{},
	init_effect = "",
	name = "专属弹幕",
	time = 0,
	color = "red",
	picture = "",
	desc = "氧气不足上浮时，触发专属弹幕",
	stack = 1,
	id = 30527,
	icon = 30520,
	last_effect = ""
}

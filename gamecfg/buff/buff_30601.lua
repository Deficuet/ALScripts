return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSubmarineFloat"
			},
			arg_list = {
				skill_id = 30601,
				target = "TargetSelf"
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
	id = 30601,
	icon = 30600,
	last_effect = ""
}

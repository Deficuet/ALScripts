return {
	time = 3,
	name = "EX困难模式 航母空袭效果添加伤害免疫护盾",
	init_effect = "",
	stack = 1,
	id = 295029,
	picture = "",
	last_effect = "kongxihudun",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffFixDamage",
			trigger = {
				"onBeforeTakeDamage"
			},
			arg_list = {
				target = "TargetSelf",
				value = 0
			}
		}
	}
}

return {
	init_effect = "jinengchufared",
	name = "",
	time = 1,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 152383,
	icon = 152380,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 152383
			}
		}
	}
}

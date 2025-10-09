return {
	init_effect = "",
	name = "2025地错联动 剧情战处理",
	time = 1,
	picture = "",
	desc = "",
	stack = 1,
	id = 295024,
	icon = 295024,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 295024,
				target = "TargetSelf"
			}
		}
	}
}

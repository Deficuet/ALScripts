return {
	time = 0,
	name = "2025列克星敦II活动 剧情战7 提尔瑞特武器",
	init_effect = "",
	stack = 1,
	id = 201684,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				time = 2,
				skill_id = 201684
			}
		},
		{
			type = "BattleBuffNewWeapon",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				weapon_id = 3347011
			}
		}
	}
}

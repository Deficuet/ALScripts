return {
	time = 0,
	name = "2025列克星敦II活动 剧情战4 菠萝武器",
	init_effect = "",
	stack = 1,
	id = 201676,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffNewWeapon",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				weapon_id = 3247006
			}
		},
		{
			type = "BattleBuffNewWeapon",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				weapon_id = 3247007
			}
		}
	}
}

return {
	time = 0,
	name = "2025列克星敦II活动 剧情战2 大黄蜂meta魔法副炮",
	init_effect = "",
	stack = 1,
	id = 201671,
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
				weapon_id = 12213
			}
		}
	}
}

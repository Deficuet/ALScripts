return {
	init_effect = "",
	name = "",
	time = 30,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60932,
	icon = 60930,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 60933
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "damageRatioByAmmoType_3",
				number = 0.05
			}
		}
	}
}

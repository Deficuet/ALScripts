return {
	time = 0,
	name = "2025白凤UR活动 EX 精神同步 发射器",
	init_effect = "",
	stack = 1,
	id = 201517,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "DMG_TAG_EHC_player",
				number = -0.5
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201518
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201518,
				time = 30
			}
		}
	}
}

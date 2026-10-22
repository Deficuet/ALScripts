return {
	init_effect = "jinengchufared",
	name = "指挥喵天赋",
	time = 0,
	picture = "",
	desc = "战列战巡风帆V受到伤害降低1.5%",
	stack = 1,
	id = 40670,
	icon = 40670,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 40671,
				minTargetNumber = 1,
				check_target = {
					"TargetSelf",
					"TargetShipType"
				},
				ship_type_list = {
					4,
					5,
					23
				}
			}
		}
	}
}

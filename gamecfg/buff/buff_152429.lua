return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0.5,
	color = "red",
	picture = "",
	desc = "敌人身上debuff",
	stack = 1,
	id = 152429,
	icon = 152420,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 401,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 152426,
				target = "TargetSelf"
			}
		}
	}
}

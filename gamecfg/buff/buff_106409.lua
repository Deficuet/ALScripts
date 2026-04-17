return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 106409,
	icon = 106390,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				buff_id = 106408,
				hpUpperBound = 0.33,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				hpLowerBound = 0.33,
				target = "TargetSelf",
				hpSigned = 0,
				buff_id_list = {
					106408
				}
			}
		}
	}
}

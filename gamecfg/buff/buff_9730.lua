return {
	desc_get = "",
	name = "占得先机我方生效buff+挂载敌方buff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9730,
	icon = 9730,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 9731,
				target = "TargetAllHelp"
			}
		},
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 9732,
				target = "TargetAllHarm"
			}
		}
	}
}

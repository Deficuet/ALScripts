return {
	desc_get = "",
	name = "狭路相逢I我方生效buff+挂载敌方buff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9734,
	icon = 9734,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 9735,
				target = "TargetAllHelp"
			}
		},
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 9736,
				target = "TargetAllHarm"
			}
		}
	}
}

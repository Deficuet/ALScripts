return {
	effect_list = {
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 152571,
				target = {
					"TargetAllHelp",
					"TargetShipType"
				},
				ship_type_list = {
					6,
					7
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			pop = {},
			arg_list = {
				buff_id = 152572,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				attrCompare = "antiAirPower>antiAirPower",
				maxTargetNumber = 0,
				skill_id = 152570,
				check_target = {
					"TargetAllHelp",
					"TargetPlayerVanguardFleet",
					"TargetAttrCompare"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				attrCompare = "antiAirPower>antiAirPower",
				minTargetNumber = 1,
				skill_id = 152571,
				check_target = {
					"TargetAllHelp",
					"TargetPlayerVanguardFleet",
					"TargetAttrCompare"
				}
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	init_effect = "",
	name = "",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 152570,
	icon = 152570,
	last_effect = ""
}

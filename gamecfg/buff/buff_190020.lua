return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 190021,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"VittorioCuniberti"
				}
			}
		},
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id_list = {
					190021,
					190022,
					190023
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
	name = "燃油烟雾-VC",
	time = 0,
	color = "blue",
	picture = "",
	desc = "提高闪避",
	stack = 1,
	id = 190020,
	icon = 190020,
	last_effect = ""
}

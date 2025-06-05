return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				minTargetNumber = 1,
				quota = 1,
				skill_id = 801801,
				target = "TargetSelf",
				check_target = {
					"TargetAllFoe",
					"TargetShipTag"
				},
				ship_tag_list = {
					"kawakaze_hit"
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
	desc_get = "",
	name = "",
	init_effect = "",
	time = 10,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 801802,
	icon = 801800,
	last_effect = ""
}

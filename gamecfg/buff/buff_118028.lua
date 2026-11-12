return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0.1,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 118028,
	icon = 118020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				quota = 1,
				skill_id = 118028,
				time = 0.1,
				ship_tag_list = {
					"LilielBomb"
				},
				target = {
					"TargetAllHarm",
					"TargetShipTag"
				}
			}
		}
	}
}

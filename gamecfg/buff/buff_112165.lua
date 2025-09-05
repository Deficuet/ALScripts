return {
	init_effect = "",
	name = "",
	time = 1.6,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 112165,
	icon = 112110,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 112261
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 112162
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 10,
				fleetAttr = "YumiaManaFlow>=1",
				skill_id = 112162,
				time = 0.1
			}
		}
	}
}

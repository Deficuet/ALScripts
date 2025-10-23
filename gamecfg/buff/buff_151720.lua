return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 15,
				time = 1,
				target = "TargetSelf",
				skill_id = 151729
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 15,
				target = "TargetSelf",
				skill_id = 151720
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBulletKill"
			},
			arg_list = {
				buff_id = 151722,
				initialCD = true,
				time = 15,
				killer_weapon_id = {
					169331,
					169332,
					169333,
					169334,
					169335,
					169336,
					169337,
					169338,
					169339,
					169340
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
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 151720,
	icon = 151720,
	last_effect = ""
}

return {
	effect_list = {
		{
			type = "BattleBuffOverrideBullet",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				bullet_type = 1,
				override = {
					ignoreShield = true
				},
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 4,
				countType = 19941,
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 19941,
				countType = 19941
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
	id = 19941,
	icon = 19940,
	last_effect = ""
}

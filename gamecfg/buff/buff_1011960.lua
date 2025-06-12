return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			pop = {},
			arg_list = {
				buff_id = 1011961,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				quota = 3,
				target = "TargetSelf",
				skill_id = 1011960
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
	name = "峡湾之星 +",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 1011960,
	icon = 11960,
	last_effect = ""
}

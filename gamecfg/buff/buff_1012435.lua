return {
	limit = {
		SYSTEM_SCENARIO,
		SYSTEM_ROUTINE,
		SYSTEM_SHAM,
		SYSTEM_CHALLENGE,
		SYSTEM_ACT_BOSS
	},
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 1012430,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 1012436,
				target = "TargetSelf",
				time = 20
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
	name = "Lucky A",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 1012435,
	icon = 12430,
	last_effect = ""
}

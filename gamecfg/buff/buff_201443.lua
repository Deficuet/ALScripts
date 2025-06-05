return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201427,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBeforeFatalDamage"
			},
			arg_list = {
				skill_id = 201443,
				target = "TargetSelf"
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	time = 0,
	name = "2025信标BOSS 江风meta 召唤血影 初始位置随机及亡语弹幕",
	init_effect = "",
	stack = 1,
	id = 201443,
	picture = "",
	last_effect = "",
	desc = ""
}

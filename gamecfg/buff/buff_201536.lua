return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201544
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 8692,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				time = 0.2,
				skill_id = 201536
			}
		}
	},
	{},
	{},
	time = 1.5,
	name = "2025风帆三期EX 莱姆号 空袭监听",
	init_effect = "",
	stack = 1,
	id = 201536,
	picture = "",
	last_effect = ""
}

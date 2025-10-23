return {
	time = 0,
	name = "2025风帆三期EX 莱姆号 EX困难BAN技能（只BAN拉菲II）",
	init_effect = "",
	stack = 1,
	id = 201540,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201541,
				target = "TargetAllHarm"
			}
		}
	}
}

return {
	time = 0,
	name = "2025风帆三期EX 莱姆号 EX困难BAN技能（只BAN拉菲II）",
	init_effect = "",
	stack = 1,
	id = 201541,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					17320,
					17322
				}
			}
		}
	}
}

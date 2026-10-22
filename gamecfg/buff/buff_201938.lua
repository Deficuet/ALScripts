return {
	time = 0.5,
	name = "2026风帆四期 EX困难 守护状态解除",
	init_effect = "",
	stack = 1,
	id = 201938,
	picture = "",
	last_effect = "ATdun_posui",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					201939
				}
			}
		}
	}
}

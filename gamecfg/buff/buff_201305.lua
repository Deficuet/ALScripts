return {
	time = 3,
	name = "2025拉斐尔活动 剧情战触发 无敌护盾且监听到不存在友军时才正式加入战斗",
	init_effect = "",
	stack = 1,
	id = 201305,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					201302
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 200364,
				target = "TargetSelf"
			}
		}
	}
}

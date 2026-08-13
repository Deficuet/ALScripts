return {
	time = 10,
	name = "2026本宁顿活动 剧情战4 伊丽莎白meta支援",
	init_effect = "yilishabai_alter_train",
	stack = 1,
	id = 201880,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201879,
				target = "TargetSelf"
			}
		}
	}
}

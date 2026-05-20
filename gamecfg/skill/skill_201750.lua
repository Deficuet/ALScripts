return {
	id = 201750,
	name = "2026伯利欣根活动 恶念残影 亡语治疗友军",
	cd = 0,
	painting = 0,
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			target_choise = {
				"TargetAllHelp",
				"TargetHelpLeastHPRatio"
			},
			arg_list = {
				buff_id = 201750,
				exceptCaster = true
			}
		}
	}
}

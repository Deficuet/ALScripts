return {
	uiEffect = "",
	name = "2025信标BOSS 夕立meta 锁定最高百分比血量敌人",
	cd = 0,
	painting = 0,
	id = 201501,
	picture = "0",
	aniEffect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			target_choise = {
				"TargetAllHarm",
				"TargetHighestHPRatio"
			},
			arg_list = {
				buff_id = 201502
			}
		}
	}
}

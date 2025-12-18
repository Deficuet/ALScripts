return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 802030,
	picture = "0",
	desc = "",
	aniEffect = {
		effect = "jineng",
		offset = {
			0,
			-2,
			0
		}
	},
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 802031
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetPlayerVanguardFleet",
				"TargetShipType"
			},
			arg_list = {
				buff_id = 802032,
				exceptCaster = true,
				ship_type_list = {
					2
				}
			}
		}
	}
}

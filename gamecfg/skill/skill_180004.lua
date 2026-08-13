return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 180004,
	picture = "0",
	castCV = "skill",
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
			targetAniEffect = "",
			target_choise = {
				"TargetPlayerVanguardFleet",
				"TargetShipTag"
			},
			arg_list = {
				buff_id = 190008,
				ship_tag_list = {
					"dimiteli"
				}
			}
		}
	}
}

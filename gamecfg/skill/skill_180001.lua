return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 180001,
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
				"TargetAllHelp",
				"TargetPlayerMainFleet",
				"TargetShipType",
				"TargetAttrCeil"
			},
			arg_list = {
				buff_id = 180002,
				ceilAttr = "cannonPower",
				ship_type_list = {
					4,
					5
				}
			}
		}
	}
}

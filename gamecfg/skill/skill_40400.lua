return {
	uiEffect = "",
	name = "战列风帆-指挥-炮击II",
	cd = 0,
	painting = 1,
	id = 40400,
	picture = "0",
	aniEffect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHelp",
				"TargetShipType"
			},
			arg_list = {
				buff_id = 40401,
				ship_type_list = {
					4,
					5,
					10,
					24
				}
			}
		}
	}
}

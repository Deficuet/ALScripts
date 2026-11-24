return {
	uiEffect = "",
	name = "航母-指挥-航空I+航母-指挥-装填I",
	cd = 0,
	painting = 1,
	id = 40110,
	picture = "0",
	aniEffect = "",
	desc = "航母-指挥-航空I+航母-指挥-装填I",
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
				buff_id = 40111,
				ship_type_list = {
					6,
					7
				}
			}
		}
	}
}

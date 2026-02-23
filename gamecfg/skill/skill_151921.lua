return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 151921,
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
			type = "BattleSkillFire",
			casterAniEffect = "",
			target_choise = "TargetPlayerFlagShip",
			targetAniEffect = "",
			arg_list = {
				weapon_id = 180022
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetSelf"
			},
			arg_list = {
				buff_id = 151924
			}
		}
	}
}

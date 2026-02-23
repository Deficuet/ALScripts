return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 151940,
	picture = "0",
	castCV = "skill",
	desc = "反潜深弹滑落",
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
			target_choise = "TargetNil",
			targetAniEffect = "",
			arg_list = {
				weapon_id = 180021
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetAllHelp",
			targetAniEffect = "",
			arg_list = {
				buff_id = 151941,
				exceptCaster = true
			}
		}
	}
}

return {
	uiEffect = "",
	name = "专属弹幕",
	cd = 0,
	painting = 1,
	id = 30421,
	picture = "0",
	desc = "专属弹幕",
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
				weapon_id = 170841,
				emitter = "BattleBulletEmitter"
			}
		},
		{
			type = "BattleSkillFire",
			casterAniEffect = "",
			target_choise = "TargetNil",
			targetAniEffect = "",
			arg_list = {
				weapon_id = 170844,
				emitter = "BattleBulletEmitter"
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 30525
			}
		}
	}
}

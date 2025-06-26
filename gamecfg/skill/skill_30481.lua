return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 30481,
	picture = "0",
	castCV = "skill",
	desc = "弹幕",
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
				buff_id = 30485
			}
		},
		{
			type = "BattleSkillFire",
			casterAniEffect = "",
			target_choise = "TargetNil",
			targetAniEffect = "",
			arg_list = {
				emitter = "BattleBulletEmitter",
				weapon_id = 168271,
				equip_index = 30480
			}
		}
	}
}

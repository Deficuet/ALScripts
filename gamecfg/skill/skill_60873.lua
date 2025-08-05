return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 60874,
	picture = "0",
	desc = "高级魔法书-强化",
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
			target_choise = "TargetSelf",
			type = "BattleSkillEditFleetAttr",
			arg_list = {
				value = -1,
				attr = "YumiaManaFlow"
			}
		},
		{
			type = "BattleSkillFire",
			casterAniEffect = "",
			target_choise = "TargetHarmRandom",
			targetAniEffect = "",
			arg_list = {
				weapon_id = 180009
			}
		}
	}
}

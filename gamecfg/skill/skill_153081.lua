return {
	uiEffect = "",
	name = "全弹发射LV2",
	cd = 10,
	painting = 0,
	id = 153801,
	picture = "0",
	aniEffect = "",
	desc = "主炮额外二轮攻击",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 153085,
				delay = 0.1
			}
		},
		{
			type = "BattleSkillWeaponFire",
			casterAniEffect = "",
			target_choise = "TargetHarmRandomByWeight",
			targetAniEffect = "",
			arg_list = {
				delay = 2,
				weaponType = "ChargeWeapon"
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 153086,
				delay = 2.1
			}
		}
	}
}

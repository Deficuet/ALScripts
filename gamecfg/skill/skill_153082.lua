return {
	uiEffect = "",
	name = "全弹发射LV2",
	cd = 10,
	painting = 0,
	id = 153082,
	picture = "0",
	aniEffect = "",
	desc = "主炮额外三轮攻击",
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
			target_choise = "TargetHarmRandom",
			targetAniEffect = "",
			arg_list = {
				delay = 3,
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
				delay = 3.1
			}
		}
	}
}

return {
	uiEffect = "",
	name = "全弹发射LV2",
	cd = 10,
	painting = 0,
	id = 20001,
	picture = "0",
	aniEffect = "",
	desc = "主炮额外三轮攻击",
	effect_list = {
		{
			type = "BattleSkillWeaponFire",
			casterAniEffect = "",
			target_choise = "TargetHarmRandom",
			targetAniEffect = "",
			arg_list = {
				delay = 1,
				weaponType = "ChargeWeapon"
			}
		},
		{
			type = "BattleSkillWeaponFire",
			casterAniEffect = "",
			target_choise = "TargetHarmRandom",
			targetAniEffect = "",
			arg_list = {
				delay = 2,
				weaponType = "ChargeWeapon"
			}
		},
		{
			type = "BattleSkillWeaponFire",
			casterAniEffect = "",
			target_choise = "TargetHarmRandomByWeight",
			targetAniEffect = "",
			arg_list = {
				delay = 3,
				weaponType = "ChargeWeapon"
			}
		}
	}
}

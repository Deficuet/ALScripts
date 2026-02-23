return {
	id = 201620,
	name = "2025约战联动 角色支援 八舞",
	cd = 0,
	painting = 0,
	effect_list = {
		{
			target_choise = "TargetHarmRandomByWeight",
			type = "BattleSkillFire",
			arg_list = {
				emitter = "BattleBulletEmitter",
				weapon_id = 3335014,
				attack_attribute_convert = {
					attr_type = "fleetGS",
					A = 80,
					B = 400
				}
			}
		},
		{
			target_choise = "TargetNil",
			type = "BattleSkillFire",
			arg_list = {
				emitter = "BattleBulletEmitter",
				delay = 0.5,
				weapon_id = 3335015,
				attack_attribute_convert = {
					attr_type = "fleetGS",
					A = 80,
					B = 400
				}
			}
		}
	}
}

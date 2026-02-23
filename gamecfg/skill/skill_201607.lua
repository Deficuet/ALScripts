return {
	id = 201607,
	name = "2025约战联动 角色支援 夜刀神十香",
	cd = 0,
	painting = 0,
	effect_list = {
		{
			target_choise = "TargetSelf",
			type = "BattleSkillCLSArea",
			arg_list = {
				effect = "shixiang_hengsao",
				life_time = 0.5,
				move_type = 1,
				range = 45,
				speed_x = 0,
				damage_param_a = 200,
				damage_param_b = 0,
				damage_tag_list = {
					"Yatogami Tōka"
				},
				bullet_type_list = {
					1,
					3
				}
			}
		},
		{
			target_choise = "TargetNil",
			type = "BattleSkillFire",
			arg_list = {
				emitter = "BattleBulletEmitter",
				delay = 0.6,
				weapon_id = 3335006,
				attack_attribute_convert = {
					attr_type = "fleetGS",
					A = 80,
					B = 400
				}
			}
		}
	}
}

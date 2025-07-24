return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 112181,
	picture = "0",
	castCV = "skill_1",
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
			target_choise = "TargetSelf",
			type = "BattleSkillCLSArea",
			arg_list = {
				effect = "leiniya_hengsao",
				life_time = 1,
				move_type = 1,
				range = 70,
				speed_x = 0,
				damage_param_a = 600,
				damage_param_b = 0,
				damage_tag_list = {
					"Lenja"
				},
				bullet_type_list = {}
			}
		}
	}
}

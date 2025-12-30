return {
	id = 201665,
	name = "2025列克星敦II活动 EX普通 BOSS拟态2",
	cd = 0,
	painting = 0,
	effect_list = {
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					deadFX = "Bossbomb",
					monsterTemplateID = 16805003,
					corrdinate = {
						-10,
						0,
						50
					},
					buffList = {
						201664,
						200825
					},
					phase = {
						{
							index = 0,
							switchType = 1,
							switchTo = 1,
							switchParam = 1.5
						},
						{
							index = 1,
							switchType = 1,
							switchTo = 2,
							switchParam = 13,
							addWeapon = {
								3345107,
								3345108,
								3345109
							}
						},
						{
							index = 2,
							switchParam = 17,
							switchTo = 3,
							switchType = 1,
							addWeapon = {
								3345110,
								3345111,
								3345112
							},
							removeWeapon = {
								3345107,
								3345108,
								3345109
							}
						},
						{
							index = 3,
							switchParam = 15,
							switchTo = 4,
							switchType = 1,
							addWeapon = {
								3345113,
								3345114
							},
							removeWeapon = {
								3345110,
								3345111,
								3345112
							}
						},
						{
							index = 4,
							switchType = 1,
							switchTo = 1,
							switchParam = 1.5,
							removeWeapon = {
								3345113,
								3345114
							}
						}
					}
				}
			}
		}
	}
}

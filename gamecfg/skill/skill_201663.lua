return {
	id = 201663,
	name = "2025列克星敦II活动 EX困难 BOSS拟态3",
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
					monsterTemplateID = 16805104,
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
							switchParam = 10,
							addWeapon = {
								3345215,
								3345216
							}
						},
						{
							index = 2,
							switchParam = 7,
							switchTo = 3,
							switchType = 1,
							addWeapon = {
								3345217
							},
							removeWeapon = {}
						},
						{
							index = 3,
							switchParam = 5,
							switchTo = 4,
							switchType = 1,
							addWeapon = {
								3345218
							},
							removeWeapon = {
								3345215,
								3345216,
								3345217
							}
						},
						{
							index = 4,
							switchParam = 11,
							switchTo = 5,
							switchType = 1,
							addWeapon = {
								3345219,
								3345220
							},
							removeWeapon = {
								3345218
							}
						},
						{
							index = 5,
							switchType = 1,
							switchTo = 1,
							switchParam = 2.5,
							removeWeapon = {
								3345219,
								3345220
							}
						}
					}
				}
			}
		}
	}
}

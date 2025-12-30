return {
	id = 201661,
	name = "2025列克星敦II活动 EX困难 BOSS拟态1",
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
					monsterTemplateID = 16805102,
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
								3345201,
								3345202
							}
						},
						{
							index = 2,
							switchParam = 11,
							switchTo = 3,
							switchType = 1,
							addWeapon = {
								3345203,
								3345204
							},
							removeWeapon = {
								3345201,
								3345202
							}
						},
						{
							index = 3,
							switchParam = 2,
							switchTo = 4,
							switchType = 1,
							addWeapon = {
								3345205
							},
							removeWeapon = {
								3345203,
								3345204
							}
						},
						{
							index = 4,
							switchType = 1,
							switchTo = 5,
							switchParam = 14,
							addWeapon = {
								3345206
							}
						},
						{
							index = 5,
							switchType = 1,
							switchTo = 1,
							switchParam = 1,
							removeWeapon = {
								3345205,
								3345206
							}
						}
					}
				}
			}
		}
	}
}

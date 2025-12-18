return {
	id = 201666,
	name = "2025列克星敦II活动 EX普通 BOSS拟态3",
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
					monsterTemplateID = 16805004,
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
								3345115,
								3345116
							}
						},
						{
							index = 2,
							switchParam = 7,
							switchTo = 3,
							switchType = 1,
							addWeapon = {
								3345117
							},
							removeWeapon = {}
						},
						{
							index = 3,
							switchParam = 5,
							switchTo = 4,
							switchType = 1,
							addWeapon = {
								3345118
							},
							removeWeapon = {
								3345115,
								3345116,
								3345117
							}
						},
						{
							index = 4,
							switchParam = 11,
							switchTo = 5,
							switchType = 1,
							addWeapon = {
								3345119,
								3345120
							},
							removeWeapon = {
								3345118
							}
						},
						{
							index = 5,
							switchType = 1,
							switchTo = 1,
							switchParam = 2.5,
							removeWeapon = {
								3345119,
								3345120
							}
						}
					}
				}
			}
		}
	}
}

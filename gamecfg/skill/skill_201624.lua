return {
	id = 201624,
	name = "2025约战联动 角色支援 时崎狂三",
	cd = 0,
	painting = 0,
	effect_list = {
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					deadFX = "shanshuo",
					monsterTemplateID = 16795001,
					sickness = 0.5,
					corrdinate = {
						-58,
						0,
						40
					},
					buffList = {
						201626
					},
					phase = {
						{
							index = 0,
							switchType = 1,
							switchTo = 1,
							switchParam = 30
						},
						{
							index = 1,
							switchType = 1,
							switchTo = 0,
							switchParam = 300,
							addBuff = {
								200440
							}
						}
					}
				}
			}
		}
	}
}

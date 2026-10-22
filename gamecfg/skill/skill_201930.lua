return {
	uiEffect = "",
	name = "2026风帆四期 沉星之渊 产生旋涡",
	cd = 0,
	painting = 0,
	id = 201930,
	picture = "0",
	aniEffect = "",
	desc = "",
	effect_list = {
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					deadFX = "None",
					monsterTemplateID = 16907201,
					sickness = 0.1,
					buffList = {
						201931
					},
					corrdinate = {
						0,
						0,
						50
					},
					phase = {
						{
							index = 0,
							switchType = 1,
							switchTo = 1,
							switchParam = 0.5
						},
						{
							switchParam = 12,
							switchTo = 2,
							index = 1,
							switchType = 1,
							setAI = 70307
						},
						{
							index = 2,
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
		},
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					deadFX = "None",
					monsterTemplateID = 16907201,
					sickness = 0.1,
					buffList = {
						201931
					},
					corrdinate = {
						0,
						0,
						50
					},
					phase = {
						{
							index = 0,
							switchType = 1,
							switchTo = 1,
							switchParam = 0.5
						},
						{
							switchParam = 12,
							switchTo = 2,
							index = 1,
							switchType = 1,
							setAI = 70307
						},
						{
							index = 2,
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
		},
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					deadFX = "None",
					monsterTemplateID = 16907201,
					sickness = 0.1,
					buffList = {
						201931
					},
					corrdinate = {
						0,
						0,
						50
					},
					phase = {
						{
							index = 0,
							switchType = 1,
							switchTo = 1,
							switchParam = 0.5
						},
						{
							switchParam = 12,
							switchTo = 2,
							index = 1,
							switchType = 1,
							setAI = 70307
						},
						{
							index = 2,
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

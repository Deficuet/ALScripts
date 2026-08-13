return {
	id = 201828,
	name = "2026本宁顿活动 EX困难 两侧场地",
	cd = 0,
	painting = 0,
	effect_list = {
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					monsterTemplateID = 16885201,
					deadFX = "none",
					sickness = 1,
					corrdinate = {
						0,
						0,
						50
					},
					relativeCorrdinate = {
						-21,
						0,
						0
					},
					buffList = {
						201840
					},
					phase = {
						{
							switchParam = 31,
							switchTo = 1,
							index = 0,
							switchType = 1,
							setAI = 20006
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
		},
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					monsterTemplateID = 16885201,
					deadFX = "none",
					sickness = 1,
					corrdinate = {
						0,
						0,
						50
					},
					relativeCorrdinate = {
						21,
						0,
						0
					},
					buffList = {
						201841
					},
					phase = {
						{
							switchParam = 31,
							switchTo = 1,
							index = 0,
							switchType = 1,
							setAI = 20006
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
